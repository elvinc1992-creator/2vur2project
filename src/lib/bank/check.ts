import { LETTERS, type Letter } from "@/lib/demo/content";

// Sual bankının bütün formatları üçün cavabın yoxlanması — təmiz funksiyalar (server və brauzer).
//   closed   — "A"…"E"
//   open     — ədəd (vergül/nöqtə, kəsr 3/4), bir neçə cavab ";" ilə: "3;-1"
//   written  — yekun cavab ədəddirsə open kimi; deyilsə (isbat, mətn) şagird həllə baxıb özünü yoxlayır
//   matching — "1:ad;2:b;3:ce" (hər bənd üçün seçilmiş hərflər)
// Özünüyoxlama: əvvəl "self" (həll göstərilir, cavab hələ sayılmır), sonra "self:1" / "self:0".

export type PracticeFormat = "closed" | "open" | "matching" | "written";
export type MatchingOptions = { left: Array<{ key: string; text: string }>; right: Array<{ key: string; text: string }> };

export const SKIP = "skip";
export const SELF_PENDING = "self";
export const SELF_OK = "self:1";
export const SELF_NO = "self:0";
export const MAX_TEXT_ANSWER = 60;

const MATCH_RE = /^\d+:[a-e]*(;\d+:[a-e]*)*$/;

/** "23,8" → 23.8, "1/36" → 0.0277…, "−3" → -3; ədəd deyilsə null. */
export function parseNumber(raw: string): number | null {
  const v = raw.replace(/\s/g, "").replace(/[−–]/g, "-").replace(",", ".");
  const frac = /^(-?\d+(?:\.\d+)?)\/(\d+(?:\.\d+)?)$/.exec(v);
  if (frac) return Number(frac[2]) === 0 ? null : Number(frac[1]) / Number(frac[2]);
  return /^-?\d+(\.\d+)?$/.test(v) ? Number(v) : null;
}

const parts = (s: string) =>
  s
    .split(";")
    .map((p) => p.trim())
    .filter(Boolean);

/** Yekun cavab ədəd(lər)dirsə, avtomatik yoxlanır; əks halda (isbat, mətnli cavab) — özünüyoxlama. */
export function isAutoCheckable(answerValue: string | null | undefined): boolean {
  const ps = parts(answerValue ?? "");
  return ps.length > 0 && ps.every((p) => parseNumber(p) !== null);
}

export const isSelfCheck = (format: PracticeFormat, answerValue: string | null | undefined) =>
  format === "written" && !isAutoCheckable(answerValue);

/** Ədədlər dəsti kimi müqayisə: sıra fərq etmir ("3;-1" = "-1; 3"). */
function sameNumbers(given: string, expected: string): boolean {
  const a = parts(given).map(parseNumber);
  const b = parts(expected).map(parseNumber);
  if (!a.length || a.length !== b.length || a.some((x) => x === null)) return false;
  const sa = (a as number[]).sort((x, y) => x - y);
  const sb = (b as number[]).sort((x, y) => x - y);
  return sa.every((x, i) => Math.abs(x - sb[i]) < 1e-6);
}

export function encodeMatching(sel: Record<string, string[]>): string {
  return Object.keys(sel)
    .sort((a, b) => Number(a) - Number(b))
    .map((k) => `${k}:${[...new Set(sel[k])].sort().join("")}`)
    .join(";");
}

export function decodeMatching(s: string): Record<string, string[]> {
  if (!MATCH_RE.test(s)) return {};
  return Object.fromEntries(s.split(";").map((p) => {
    const [k, v] = p.split(":");
    return [k, v.split("").filter(Boolean)];
  }));
}

/** Uyğunluq cavabının mətni: "1 → a, d; 2 → b". */
export const matchingText = (s: string) =>
  Object.entries(decodeMatching(s))
    .map(([k, v]) => `${k} → ${v.length ? v.join(", ") : "—"}`)
    .join("; ");

/** Brauzerdən gələn cavabın formatı düzgündürmü (yoxlamadan əvvəl). */
export function isValidGiven(format: PracticeFormat, selfCheck: boolean, given: unknown): given is string {
  if (typeof given !== "string") return false;
  if (given === SKIP) return true;
  if (selfCheck) return given === SELF_PENDING || given === SELF_OK || given === SELF_NO;
  if (format === "closed") return (LETTERS as readonly string[]).includes(given);
  if (format === "matching") return MATCH_RE.test(given);
  return given.trim().length > 0 && given.length <= MAX_TEXT_ANSWER;
}

export type CheckKey = { format: PracticeFormat; answer: string; selfCheck: boolean };

/** Cavab düzgündürmü. "skip" və "self" (hələ qiymətləndirilməyib) — düzgün deyil. */
export function checkAnswer(key: CheckKey, given: string): boolean {
  if (!given || given === SKIP) return false;
  if (key.selfCheck) return given === SELF_OK;
  if (key.format === "closed") return given === key.answer;
  if (key.format === "matching") return given === key.answer;
  return sameNumbers(given, key.answer);
}

/** Cavab hələ qiymətləndirilməyib (özünüyoxlamada həllə baxılıb, amma qiymət verilməyib). */
export const isPendingSelf = (given: string | undefined) => given === SELF_PENDING;

/** Cavab yazılmalıdırmı: ilk cavab qalır; yalnız özünüyoxlamada "self" → "self:1" / "self:0" keçidi olur. */
export const acceptsAnswer = (prev: string | undefined, given: string) =>
  !prev || (prev === SELF_PENDING && (given === SELF_OK || given === SELF_NO));

/** Cavabdan sonra brauzerə gedən nəticə (günün sualı, repetitor, təkrar). */
export type AnswerFeedback = {
  chosen: string;
  correct: boolean;
  /** Özünüyoxlama: həll göstərilib, şagird hələ qiymət verməyib. */
  pendingSelf: boolean;
  selfCheck: boolean;
  format: PracticeFormat;
  answer: string;
  answerText: string;
  steps: string[];
};

export const feedbackOf = (key: CheckKey & { answerText: string; steps: string[] }, chosen: string): AnswerFeedback => ({
  chosen,
  correct: checkAnswer(key, chosen),
  pendingSelf: isPendingSelf(chosen),
  selfCheck: key.selfCheck,
  format: key.format,
  answer: key.answer,
  answerText: key.answerText,
  steps: key.steps,
});

/** Bazadakı uyğunluq açarı {"1":["a","d"],…} → "1:ad;…". */
export const matchingKey = (raw: string | null) =>
  raw ? encodeMatching(JSON.parse(raw) as Record<string, string[]>) : "";

/** Formadan (bir səhifədə bir neçə sual) cavabı oxuyur: qapalı/açıq — `name`, uyğunluq — `name-1`, `name-2`… */
export function readFormAnswer(
  form: FormData,
  name: string,
  q: { format: PracticeFormat; matching?: MatchingOptions | null },
): string | null {
  if (q.format === "matching") {
    const sel = Object.fromEntries((q.matching?.left ?? []).map((l) => [l.key, form.getAll(`${name}-${l.key}`).map(String)]));
    if (!Object.values(sel).some((v) => v.length)) return null;
    const s = encodeMatching(sel);
    return MATCH_RE.test(s) ? s : null;
  }
  const v = form.get(name);
  if (typeof v !== "string" || !v.trim()) return null;
  return isValidGiven(q.format, false, v.trim()) ? v.trim() : null;
}

/** Göstərilən cavab mətni (Səhvlərim, nəticə). */
export function givenText(format: PracticeFormat, given: string): string {
  if (format === "matching") return matchingText(given);
  return given;
}

export const isLetter = (s: string): s is Letter => (LETTERS as readonly string[]).includes(s);
