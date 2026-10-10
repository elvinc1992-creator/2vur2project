import "server-only";
import { EXAMS, EXAM_QUESTIONS, FREE_DAILY_PER_TOPIC, WEEK_LABELS, type ExamMeta, type Letter, type TopicSlug } from "./content";
import { DAILY_KEYS, EXAM_KEYS } from "./keys";
import { hasFullDaily, tierOf } from "./plans";
import { remainingOf } from "./timer";
import type { Attempt, DemoState, ExamResult } from "./state";

const DAY = 24 * 60 * 60 * 1000;

/* ---------------- Günün sualları ---------------- */
// Hər gün sual bankından (bank_tasks) təsadüfi 4 mövzu × 5 sual (bax: daily.ts → DailySet).
// Free planda hər mövzunun ilk FREE_DAILY_PER_TOPIC sualı açıqdır.

/** Bankdakı sual (brauzerə gedə bilən hissə) + mövzunun adı. */
export type BankQuestion = {
  id: string;
  topic: string;
  topicName: string;
  type: string;
  freq: number;
  text: string;
  imageUrl?: string | null;
  imageAlt?: string | null;
  options: Record<Letter, string>;
  ref: string;
};

export type DailyTopic = { slug: string; name: string; ids: string[] };

/** Bu günün dəsti + bütün bank (köhnə cavabların tipi/mövzusu üçün). */
export type DailyCtx = { date: string; topics: DailyTopic[]; byId: Map<string, BankQuestion> };

export function isCorrectDaily(state: DemoState, id: string): boolean {
  const ok = state.dailyOk?.[id];
  if (ok !== undefined) return ok;
  return state.daily[id] === DAILY_KEYS[id]?.answer;
}

export const dailyTopic = (ctx: DailyCtx, slug: string) => ctx.topics.find((t) => t.slug === slug);

/** Sual bu günün dəstindədir və istifadəçinin planına görə açıqdır. */
export function isDailyOpen(state: DemoState, ctx: DailyCtx, id: string): boolean {
  const topic = ctx.topics.find((t) => t.ids.includes(id));
  if (!topic) return false;
  return hasFullDaily(state) || topic.ids.indexOf(id) < FREE_DAILY_PER_TOPIC;
}

export function dailyOverview(state: DemoState, ctx: DailyCtx) {
  const topics = ctx.topics.map((x) => {
    const open = x.ids.filter((id) => isDailyOpen(state, ctx, id));
    return {
      topic: x.slug,
      name: x.name,
      done: x.ids.filter((id) => state.daily[id]).length,
      total: x.ids.length,
      open: open.length,
      /** Açıq, amma hələ cavablanmamış suallar. */
      openLeft: open.filter((id) => !state.daily[id]).length,
      locked: x.ids.length - open.length,
    };
  });
  const sum = (k: "done" | "total" | "open" | "openLeft" | "locked") => topics.reduce((s, t) => s + t[k], 0);
  return { topics, done: sum("done"), total: sum("total"), open: sum("open"), openLeft: sum("openLeft"), locked: sum("locked") };
}

export type PagerItem = { n: number; href: string; status: "ok" | "bad" | "open" | "locked"; current: boolean };

export const dailyHref = (slug: string, n: number) => `/gunun-suallari/${slug}/${n}`;

/** Mövzunun 1–5 sual nömrələri: cavab (düz/səhv), açıq və ya kilidli; `currentId` — açıq olan səhifə. */
export function dailyPager(state: DemoState, ctx: DailyCtx, slug: string, currentId?: string): PagerItem[] {
  return (dailyTopic(ctx, slug)?.ids ?? []).map((id, i) => ({
    n: i + 1,
    href: dailyHref(slug, i + 1),
    status: !isDailyOpen(state, ctx, id) ? "locked" : state.daily[id] ? (isCorrectDaily(state, id) ? "ok" : "bad") : "open",
    current: id === currentId,
  }));
}

/** Növbəti açıq və cavabsız sual: əvvəl həmin mövzu, sonra digər mövzular. */
export function nextDailyHref(state: DemoState, ctx: DailyCtx, afterId?: string): string | null {
  const cur = afterId ? ctx.topics.find((t) => t.ids.includes(afterId)) : undefined;
  const order = cur ? [cur, ...ctx.topics.filter((t) => t !== cur)] : ctx.topics;
  for (const topic of order) {
    const idx = topic.ids.findIndex((id) => !state.daily[id] && id !== afterId && isDailyOpen(state, ctx, id));
    if (idx >= 0) return dailyHref(topic.slug, idx + 1);
  }
  return null;
}

/** "Bu tipdə düzgün cavabların: x / y" — yalnız istifadəçinin öz cavabları. */
export function typeStats(state: DemoState, ctx: DailyCtx, type: string) {
  const answered = Object.keys(state.daily).filter((id) => state.daily[id] !== "skip" && ctx.byId.get(id)?.type === type);
  return { ok: answered.filter((id) => isCorrectDaily(state, id)).length, total: answered.length };
}

/** Panel: mövzunun tipləri üzrə proqres = bankdakı həmin tipdən düzgün həll olunmuş sualların payı. */
export function typeProgress(state: DemoState, ctx: DailyCtx, slug: string) {
  const qs = [...ctx.byId.values()].filter((q) => q.topic === slug);
  const types = [...new Set(qs.map((q) => q.type))];
  return types.map((type) => {
    const ofType = qs.filter((q) => q.type === type);
    const ok = ofType.filter((q) => state.daily[q.id] && isCorrectDaily(state, q.id)).length;
    return { type, pct: Math.round((ok / ofType.length) * 100) };
  });
}

/** Ardıcıl günlər: demo-da bütün suallar "bu gün"ündür — bir cavab varsa 1 gün. */
export function streakInfo(state: DemoState, now = new Date()) {
  const answered = Object.keys(state.daily).length;
  const todayIdx = (now.getDay() + 6) % 7; // bazar ertəsi = 0
  const level = (answered === 0 ? 0 : answered < 7 ? 1 : answered < 14 ? 2 : 3) as 0 | 1 | 2 | 3;
  return {
    days: answered ? 1 : 0,
    record: answered ? 1 : 0,
    week: WEEK_LABELS.map((label, i) => ({ label, level: i === todayIdx ? level : (0 as const), today: i === todayIdx })),
  };
}

/* ---------------- Sınaqlar ---------------- */

export type ExamStatus = "done" | "in_progress" | "expired" | "purchased" | "locked";

export function findExam(id: string): ExamMeta | undefined {
  return EXAMS.find((e) => e.id === id);
}

/** "purchased" — başlamağa hazırdır: alınıb, plan üzrə seçilib və ya Premium (bütün sınaqlar). */
export function examStatus(state: DemoState, id: string, now = Date.now()): ExamStatus {
  if (state.results[id]) return "done";
  const attempt = state.attempts[id];
  const exam = findExam(id);
  if (attempt && exam) return remainingMs(attempt, exam, now) <= 0 ? "expired" : "in_progress";
  if (state.purchased.includes(id) || tierOf(state) === "premium") return "purchased";
  return "locked";
}

export function answeredCount(attempt: Attempt | undefined) {
  return attempt ? Object.keys(attempt.answers).length : 0;
}

export const durationMs = (exam: ExamMeta) => exam.durationMin * 60_000;

/** Qalan aktiv vaxt (fasilədə dayanır). */
export function remainingMs(attempt: Attempt, exam: ExamMeta, now = Date.now()) {
  return remainingOf(attempt, durationMs(exam), now);
}

export function normalizeCoded(value: string): number | null {
  const v = value.trim().replace(/\s/g, "").replace(",", ".").replace("−", "-");
  if (!/^-?\d+(\.\d+)?$/.test(v)) return null;
  return Number(v);
}

/**
 * Qapalı və kodlaşdırılan suallar avtomatik yoxlanılır, yazılılar əl ilə (pending).
 * Demo bal: hər düzgün sual 4 bal (25 × 4 = 100). Real düstur sifarişçidən gələcək.
 */
export function gradeExam(answers: Record<string, string>, timedOut = false): ExamResult {
  let correct = 0;
  let wrong = 0;
  let empty = 0;
  let pending = 0;
  const topic: Partial<Record<TopicSlug, { ok: number; total: number }>> = {};
  const weakTypes = new Map<string, { topic: TopicSlug; type: string; ref: string }>();

  for (const q of EXAM_QUESTIONS) {
    const given = answers[String(q.n)];
    if (q.format === "written") {
      if (given) pending++;
      else empty++;
      continue;
    }
    const t = (topic[q.topic] ??= { ok: 0, total: 0 });
    t.total++;
    const key = EXAM_KEYS[q.n].answer;
    const ok =
      given !== undefined &&
      (q.format === "closed" ? given === key : normalizeCoded(given) === normalizeCoded(key));
    if (!given) empty++;
    else if (ok) correct++;
    else wrong++;
    if (ok) t.ok++;
    else if (!weakTypes.has(q.type)) weakTypes.set(q.type, { topic: q.topic, type: q.type, ref: q.ref });
  }

  const byTopic = (Object.keys(topic) as TopicSlug[]).map((k) => ({ topic: k, ...topic[k]! }));
  const weakTopics = new Set(byTopic.filter((t) => t.ok / t.total < 0.5).map((t) => t.topic));
  const weak = [...weakTypes.values()]
    .sort((a, b) => Number(weakTopics.has(b.topic)) - Number(weakTopics.has(a.topic)))
    .slice(0, 3);

  return {
    score: correct * 4,
    correct,
    wrong,
    empty,
    pending,
    byTopic,
    weak,
    answers,
    timedOut,
    finishedAt: Date.now(),
  };
}

/* ---------------- Abunə ---------------- */

export function daysLeft(periodEnd: string, now = Date.now()) {
  if (!periodEnd) return 0;
  const end = new Date(`${periodEnd}T23:59:59`).getTime();
  return Math.max(0, Math.ceil((end - now) / DAY));
}

/**
 * Abunənin vəziyyəti: "free" — abunə yoxdur və ya ləğv edilib və dövr bitib;
 * "canceled" — ləğv edilib, amma dövr bitməyib (giriş qalır). Plan (Pro/Premium) — plans.ts → tierOf.
 */
export function planStatus(state: DemoState): "free" | "active" | "canceled" {
  if (tierOf(state) === "free") return "free";
  return state.sub.status === "canceled" ? "canceled" : "active";
}

/** Pro və ya Premium (ödənişli plan). Hansı hissənin açıq olduğu — plans.ts. */
export function hasPaidAccess(state: DemoState) {
  return tierOf(state) !== "free";
}

export function formatDate(iso: string) {
  const [y, m, d] = iso.split("-");
  return `${d}.${m}.${y}`;
}

export function addDays(iso: string, days: number) {
  const dt = new Date(`${iso}T12:00:00Z`);
  dt.setUTCDate(dt.getUTCDate() + days);
  return dt.toISOString().slice(0, 10);
}

export function todayIso() {
  return new Date().toISOString().slice(0, 10);
}
