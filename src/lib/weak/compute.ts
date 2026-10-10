// Zəif mövzuların avtomatik təhlili — təmiz funksiyalar (baza yoxdur, test olunur).
//
// mənimsəmə = (Σ wᵢ·dᵢ + 3·0.5) / (Σ wᵢ + 3)
// wᵢ = çətinlikᵢ × 0.9^(neçə gün əvvəl) × əminlikᵢ;  dᵢ = 1 (düz) / 0 (səhv)
// əminlikᵢ = 0.5 — düz cavab şübhəlidirsə (vaxt < median vaxtın 25%-i, ≥ 2 dəyişiklik və ya işarələnib), əks halda 1.

export const WINDOW_DAYS = 90;
export const ERROR_WINDOW_DAYS = 30;
export const MIN_ATTEMPTS = 5;
export const PRIOR_WEIGHT = 3;
export const DECAY = 0.9;
export const WEAK_BELOW = 0.5;
export const GROWING_BELOW = 0.75;
export const ROOT_BELOW = 0.6;

const DAY = 86_400_000;

export type WeakStatus = "few" | "weak" | "growing" | "mastered";
export type ExamType = "9" | "11" | "blok";

export type Attempt = {
  topic: string;
  /** Sualın kanonik kodu (bank kodu və ya "e:n"). */
  question: string;
  correct: boolean;
  at: number;
  /** 1–3; yoxdursa 2. */
  difficulty?: number | null;
  timeMs?: number | null;
  changes?: number | null;
  flagged?: boolean | null;
  /** Sualın bütün istifadəçilər üzrə median vaxtı (ms). */
  medianMs?: number | null;
  /** Yanlış variantın bağlı olduğu səhv tipi. */
  errorType?: { id: number; name: string } | null;
  /** Sualın alt mövzusu (səhv tipi yoxdursa diaqnoz üçün). */
  subtopic?: string | null;
};

export type TopicMeta = {
  id: number;
  slug: string;
  name: string;
  section: string | null;
  dimFrequency: number;
  examTypes: ExamType[];
  prerequisiteId: number | null;
};

export type TopicResult = {
  topic: TopicMeta;
  mastery: number;
  status: WeakStatus;
  loss: number;
  attempts: number;
  guesses: number;
  mainError: { name: string; count: number; errorTypeId: number | null } | null;
  root: TopicMeta | null;
  rootMastery: number | null;
};

/** Düz cavab şübhəlidirmi (təxmini cavab). */
export function isSuspicious(a: Attempt): boolean {
  if (!a.correct) return false;
  const fast = a.timeMs != null && a.medianMs != null && a.medianMs > 0 && a.timeMs < 0.25 * a.medianMs;
  return fast || (a.changes ?? 0) >= 2 || Boolean(a.flagged);
}

const daysAgo = (at: number, now: number) => Math.max(0, Math.floor((now - at) / DAY));
const inWindow = (a: Attempt, now: number, days: number) => a.at <= now && now - a.at <= days * DAY;

export function mastery(attempts: Attempt[], now: number): number {
  let num = PRIOR_WEIGHT * 0.5;
  let den = PRIOR_WEIGHT;
  for (const a of attempts) {
    if (!inWindow(a, now, WINDOW_DAYS)) continue;
    const difficulty = a.difficulty && a.difficulty >= 1 && a.difficulty <= 3 ? a.difficulty : 2;
    const w = difficulty * DECAY ** daysAgo(a.at, now) * (isSuspicious(a) ? 0.5 : 1);
    num += w * (a.correct ? 1 : 0);
    den += w;
  }
  return num / den;
}

export function statusOf(m: number, count: number): WeakStatus {
  if (count < MIN_ATTEMPTS) return "few";
  if (m < WEAK_BELOW) return "weak";
  if (m < GROWING_BELOW) return "growing";
  return "mastered";
}

/** Bal itkisi = (1 − mənimsəmə) × DİM tezliyi × orta sual balı (mövzu bu imtahan tipinə aid deyilsə — 0). */
export function lossOf(m: number, topic: TopicMeta, examType: ExamType, avgPoints: number): number {
  if (!topic.examTypes.includes(examType)) return 0;
  return (1 - m) * topic.dimFrequency * avgPoints;
}

/** Son 30 gündə yanlış cavablarda ən çox təkrarlanan səhv tipi (yoxdursa — alt mövzu). */
export function mainError(attempts: Attempt[], now: number): TopicResult["mainError"] {
  const wrong = attempts.filter((a) => !a.correct && inWindow(a, now, ERROR_WINDOW_DAYS));
  const count = (key: (a: Attempt) => string | null) => {
    const m = new Map<string, number>();
    for (const a of wrong) {
      const k = key(a);
      if (k) m.set(k, (m.get(k) ?? 0) + 1);
    }
    return [...m].sort((x, y) => y[1] - x[1])[0] ?? null;
  };
  const byType = count((a) => (a.errorType ? `${a.errorType.id}\u0000${a.errorType.name}` : null));
  if (byType) {
    const [id, name] = byType[0].split("\u0000");
    return { name, count: byType[1], errorTypeId: Number(id) };
  }
  const bySub = count((a) => a.subtopic ?? null);
  return bySub ? { name: bySub[0], count: bySub[1], errorTypeId: null } : null;
}

export type AnalyzeInput = {
  topics: TopicMeta[];
  attempts: Attempt[];
  examType: ExamType;
  avgPoints: number;
  now: number;
  /** Təkrar yoxlamadan keçmiş mövzular: id → keçid vaxtı (ondan sonra səhv yoxdursa — "Mənimsənib"). */
  masteredAt?: Map<number, number>;
};

/** Bütün mövzular üzrə nəticə — bal itkisinə görə azalan sırada ("Məlumat azdır" — sonda). */
export function analyze({ topics, attempts, examType, avgPoints, now, masteredAt }: AnalyzeInput): TopicResult[] {
  const bySlug = new Map<string, Attempt[]>();
  for (const a of attempts) {
    if (a.at > now) continue;
    const list = bySlug.get(a.topic) ?? [];
    list.push(a);
    bySlug.set(a.topic, list);
  }
  const base = new Map(
    topics.map((t) => {
      const list = bySlug.get(t.slug) ?? [];
      const count = list.filter((a) => inWindow(a, now, WINDOW_DAYS)).length;
      const m = mastery(list, now);
      let status = statusOf(m, count);
      const passed = masteredAt?.get(t.id);
      if (passed && status !== "few" && !list.some((a) => !a.correct && a.at > passed)) status = "mastered";
      return [t.id, { t, list, count, m, status }] as const;
    }),
  );

  const results: TopicResult[] = [];
  for (const { t, list, count, m, status } of base.values()) {
    if (!count) continue;
    const pre = t.prerequisiteId ? base.get(t.prerequisiteId) : undefined;
    const rootWeak = (status === "weak" || status === "growing") && pre && pre.status !== "few" && pre.m < ROOT_BELOW;
    results.push({
      topic: t,
      mastery: m,
      status,
      loss: lossOf(m, t, examType, avgPoints),
      attempts: count,
      guesses: list.filter((a) => inWindow(a, now, WINDOW_DAYS) && isSuspicious(a)).length,
      mainError: mainError(list, now),
      root: rootWeak ? pre.t : null,
      rootMastery: rootWeak ? pre.m : null,
    });
  }
  return results.sort((a, b) => Number(a.status === "few") - Number(b.status === "few") || b.loss - a.loss);
}

/** Ümumi bal itkisi ("Məlumat azdır" mövzuları sayılmır). */
export const totalLoss = (results: TopicResult[]) =>
  results.filter((r) => r.status !== "few").reduce((s, r) => s + r.loss, 0);

/** İlk 3 mövzu (bal itkisinə görə) düzələrsə qazanılacaq bal. */
export const topGain = (results: TopicResult[], n = 3) =>
  results
    .filter((r) => r.status === "weak" || r.status === "growing")
    .slice(0, n)
    .reduce((s, r) => s + r.loss, 0);

/** Median (vaxt üçün). */
export function median(xs: number[]): number | null {
  if (!xs.length) return null;
  const s = [...xs].sort((a, b) => a - b);
  const mid = Math.floor(s.length / 2);
  return s.length % 2 ? s[mid] : (s[mid - 1] + s[mid]) / 2;
}

/** "N sualla düzəlt": zəifdə 10, ortada 8, qalanında 6 sual. */
export const fixSize = (m: number) => (m < 0.4 ? 10 : m < WEAK_BELOW ? 8 : 6);
