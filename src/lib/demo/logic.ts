import "server-only";
import {
  DAILY,
  DAILY_TOPICS,
  FREE_DAILY_PER_TOPIC,
  WEEK_LABELS,
  EXAMS,
  EXAM_QUESTIONS,
  TOPICS,
  type DailyQuestion,
  type ExamMeta,
  type TopicSlug,
} from "./content";
import { DAILY_KEYS, EXAM_KEYS } from "./keys";
import { remainingOf } from "./timer";
import type { Attempt, DemoState, ExamResult } from "./state";

const DAY = 24 * 60 * 60 * 1000;

/* ---------------- Günün sualları ---------------- */

export function dailyByTopic(topic: TopicSlug): DailyQuestion[] {
  return DAILY.filter((q) => q.topic === topic);
}

export function isCorrectDaily(state: DemoState, id: string): boolean {
  return state.daily[id] === DAILY_KEYS[id]?.answer;
}

/** Pulsuz planda hər mövzunun ilk FREE_DAILY_PER_TOPIC sualı açıqdır, qalanları abunə ilə. */
export function isDailyOpen(state: DemoState, q: DailyQuestion): boolean {
  if (hasPaidAccess(state)) return true;
  return dailyByTopic(q.topic).findIndex((x) => x.id === q.id) < FREE_DAILY_PER_TOPIC;
}

export function dailyOverview(state: DemoState) {
  const topics = DAILY_TOPICS.map((topic) => {
    const qs = dailyByTopic(topic);
    const open = qs.filter((q) => isDailyOpen(state, q));
    return {
      topic,
      name: TOPICS[topic].name,
      done: qs.filter((q) => state.daily[q.id]).length,
      total: qs.length,
      open: open.length,
      /** Açıq, amma hələ cavablanmamış suallar. */
      openLeft: open.filter((q) => !state.daily[q.id]).length,
      locked: qs.length - open.length,
    };
  });
  const sum = (k: "done" | "total" | "open" | "openLeft" | "locked") => topics.reduce((s, t) => s + t[k], 0);
  return { topics, done: sum("done"), total: sum("total"), open: sum("open"), openLeft: sum("openLeft"), locked: sum("locked") };
}

export type PagerItem = { n: number; href: string; status: "ok" | "bad" | "open" | "locked"; current: boolean };

/** Mövzunun 1–10 sual nömrələri: cavab (düz/səhv), açıq və ya kilidli; `currentId` — açıq olan səhifə. */
export function dailyPager(state: DemoState, topic: TopicSlug, currentId?: string): PagerItem[] {
  return dailyByTopic(topic).map((q, i) => ({
    n: i + 1,
    href: `/gunun-suallari/${topic}/${i + 1}`,
    status: !isDailyOpen(state, q) ? "locked" : state.daily[q.id] ? (isCorrectDaily(state, q.id) ? "ok" : "bad") : "open",
    current: q.id === currentId,
  }));
}

/** Növbəti açıq və cavabsız sual: əvvəl həmin mövzu, sonra digər mövzular. */
export function nextDailyHref(state: DemoState, after?: DailyQuestion): string | null {
  const order = after ? [after.topic, ...DAILY_TOPICS.filter((t) => t !== after.topic)] : DAILY_TOPICS;
  for (const topic of order) {
    const qs = dailyByTopic(topic);
    const idx = qs.findIndex((q) => !state.daily[q.id] && q.id !== after?.id && isDailyOpen(state, q));
    if (idx >= 0) return `/gunun-suallari/${topic}/${idx + 1}`;
  }
  return null;
}

/** "Bu tipdə düzgün cavabların: x / y" — yalnız istifadəçinin öz cavabları. */
export function typeStats(state: DemoState, type: string) {
  const answered = DAILY.filter((q) => q.type === type && state.daily[q.id]);
  return { ok: answered.filter((q) => isCorrectDaily(state, q.id)).length, total: answered.length };
}

/** Panel: mövzunun tipləri üzrə proqres = düzgün həll olunmuş sualların payı. */
export function typeProgress(state: DemoState, topic: TopicSlug) {
  const qs = dailyByTopic(topic);
  const types = [...new Set(qs.map((q) => q.type))];
  return types.map((type) => {
    const ofType = qs.filter((q) => q.type === type);
    const ok = ofType.filter((q) => isCorrectDaily(state, q.id)).length;
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

export function examStatus(state: DemoState, id: string, now = Date.now()): ExamStatus {
  if (state.results[id]) return "done";
  const attempt = state.attempts[id];
  const exam = findExam(id);
  if (attempt && exam) return remainingMs(attempt, exam, now) <= 0 ? "expired" : "in_progress";
  if (state.purchased.includes(id)) return "purchased";
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
 * Plan: "free" — abunə yoxdur, ləğv edilib və dövr bitib, və ya demo "pulsuz plan kimi bax";
 * "canceled" — ləğv edilib, amma dövr bitməyib (giriş qalır).
 */
export function planStatus(state: DemoState): "free" | "active" | "canceled" {
  if (state.free || state.sub.status === "none") return "free";
  if (state.sub.status === "canceled" && daysLeft(state.sub.periodEnd) <= 0) return "free";
  return state.sub.status;
}

/** Ödənişli hissələrə giriş (serverdə yoxlanılır). */
export function hasPaidAccess(state: DemoState) {
  return planStatus(state) !== "free";
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
