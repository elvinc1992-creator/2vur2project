import "server-only";
import { gradeExam } from "@/lib/exams/grade";
import { findExam, getExamKeys, getExamQuestions } from "@/lib/exams/source";
import type { ExamKey, ExamMeta, ExamQuestion } from "@/lib/exams/types";
import { LETTERS } from "./content";
import { durationMs } from "./logic";
import type { DemoState } from "./state";
import { activeElapsed } from "./timer";

// Sınaq seansı: aktiv vaxtın yığılması, fasilə, vaxt bitəndə avtomatik bitirmə.
// /api/exam/[id] (fetch və sendBeacon) və actions.ts eyni funksiyaları istifadə edir.
// Sınağın məlumatı (suallar, açar) bazadan əvvəlcədən yüklənir (loadExamCtx) — vəziyyət funksiyaları sinxrondur.

export type TickResult = { expired: false; remaining: number } | { expired: true; answered: number };

export type ExamCtx = { meta: ExamMeta; questions: ExamQuestion[]; keys: Map<number, ExamKey> };

export async function loadExamCtx(id: string): Promise<ExamCtx | null> {
  const meta = await findExam(id);
  if (!meta) return null;
  const [questions, keys] = await Promise.all([getExamQuestions(id), getExamKeys(id)]);
  return { meta, questions, keys };
}

/** Sınağı bitirir: qiymətləndirir və nəticəyə köçürür (sınaq daha aktiv deyil). */
export function finalizeAttempt(state: DemoState, ctx: ExamCtx, timedOut: boolean): number {
  const id = ctx.meta.id;
  const attempt = state.attempts[id];
  if (!attempt) return 0;
  state.results[id] = { ...gradeExam(ctx.questions, ctx.keys, attempt.answers, timedOut), meta: attempt.meta, flags: attempt.flags };
  delete state.attempts[id];
  return Object.keys(attempt.answers).length;
}

/** Açıq seansı bağlayıb aktiv vaxtı yığır. Vaxt bitibsə — bitirir. */
function settle(state: DemoState, ctx: ExamCtx, now: number, running: boolean): TickResult | null {
  const attempt = state.attempts[ctx.meta.id];
  if (!attempt) return null;
  const total = durationMs(ctx.meta);
  attempt.elapsedMs = activeElapsed(attempt, total, now);
  attempt.startedAt ??= now;
  attempt.lastSeenAt = running ? now : null;
  if (attempt.elapsedMs >= total) return { expired: true, answered: finalizeAttempt(state, ctx, true) };
  return { expired: false, remaining: total - attempt.elapsedMs };
}

/** Səhifə açıqdır (açılış, görünən oldu, və ya periodik siqnal) — sayğac gedir. */
export const tickAttempt = (state: DemoState, ctx: ExamCtx, now = Date.now()) => settle(state, ctx, now, true);

/** Səhifə gizləndi/bağlandı — sayğac dayanır. */
export const pauseAttempt = (state: DemoState, ctx: ExamCtx, now = Date.now()) => settle(state, ctx, now, false);

/** Cavabı yazır. Vaxt bitibsə — qəbul etmir və sınağı bitirir. */
export function saveAnswer(
  state: DemoState,
  ctx: ExamCtx,
  n: number,
  value: string,
  now = Date.now(),
  ms?: number,
): { ok: boolean; expired?: boolean; answered?: number } {
  const id = ctx.meta.id;
  const attempt = state.attempts[id];
  const q = ctx.questions.find((x) => x.n === n);
  if (!attempt || !q) return { ok: false, expired: Boolean(state.results[id]) };
  if (activeElapsed(attempt, durationMs(ctx.meta), now) >= durationMs(ctx.meta)) {
    return { ok: false, expired: true, answered: finalizeAttempt(state, ctx, true) };
  }
  const v = value.trim();
  const valid =
    v === "" ||
    (q.format === "closed" && (LETTERS as readonly string[]).includes(v)) ||
    (q.format === "coded" && /^[-−]?[\d.,]{1,6}$/.test(v)) ||
    (q.format === "written" && v === "w");
  if (!valid) return { ok: false };
  // Davranış: cavab başqa cavabla əvəzlənibsə — dəyişiklik; vaxt — klientin ölçdüyü ümumi vaxt.
  const m = ((attempt.meta ??= {})[n] ??= { ms: 0, ch: 0 });
  const before = attempt.answers[n];
  if (before && v && before !== v) m.ch += 1;
  if (ms !== undefined) m.ms = Math.max(m.ms, ms);
  if (v === "") delete attempt.answers[n];
  else attempt.answers[n] = v;
  return { ok: true };
}

export function toggleFlag(state: DemoState, ctx: ExamCtx, n: number): boolean {
  const attempt = state.attempts[ctx.meta.id];
  if (!attempt || !ctx.questions.some((q) => q.n === n)) return false;
  attempt.flags = attempt.flags.includes(n) ? attempt.flags.filter((x) => x !== n) : [...attempt.flags, n];
  return true;
}
