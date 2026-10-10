import "server-only";
import type { ExamMeta } from "@/lib/exams/types";
import { FREE_DAILY_PER_TOPIC, WEEK_LABELS, type Letter } from "./content";
import { hasFullDaily, tierOf } from "./plans";
import { remainingOf } from "./timer";
import type { Attempt, DemoState } from "./state";

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
  return ok ?? false;
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
// Sınaqlar bazadadır (src/lib/exams). Burada yalnız vəziyyətə görə status və vaxt.

export type ExamStatus = "done" | "in_progress" | "expired" | "purchased" | "locked";

/** "purchased" — başlamağa hazırdır: alınıb, plan üzrə seçilib və ya Premium (bütün sınaqlar). */
export function examStatus(state: DemoState, exam: ExamMeta, now = Date.now()): ExamStatus {
  const id = exam.id;
  if (state.results[id]) return "done";
  const attempt = state.attempts[id];
  if (attempt) return remainingMs(attempt, exam, now) <= 0 ? "expired" : "in_progress";
  if (state.purchased.includes(id) || tierOf(state) === "premium") return "purchased";
  return "locked";
}

export function answeredCount(attempt: Attempt | undefined) {
  return attempt ? Object.keys(attempt.answers).length : 0;
}

export const durationMs = (exam: Pick<ExamMeta, "durationMin">) => exam.durationMin * 60_000;

/** Qalan aktiv vaxt (fasilədə dayanır). */
export function remainingMs(attempt: Attempt, exam: Pick<ExamMeta, "durationMin">, now = Date.now()) {
  return remainingOf(attempt, durationMs(exam), now);
}

export { normalizeCoded } from "@/lib/exams/grade";

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
