import "server-only";
import { EXAM_QUESTIONS, LETTERS } from "./content";
import { durationMs, findExam, gradeExam } from "./logic";
import type { DemoState } from "./state";
import { activeElapsed } from "./timer";

// Sınaq seansı: aktiv vaxtın yığılması, fasilə, vaxt bitəndə avtomatik bitirmə.
// /api/exam/[id] (fetch və sendBeacon) və actions.ts eyni funksiyaları istifadə edir.

export type TickResult = { expired: false; remaining: number } | { expired: true; answered: number };

/** Sınağı bitirir: qiymətləndirir və nəticəyə köçürür (sınaq daha aktiv deyil). */
export function finalizeAttempt(state: DemoState, id: string, timedOut: boolean): number {
  const attempt = state.attempts[id];
  if (!attempt) return 0;
  state.results[id] = { ...gradeExam(attempt.answers, timedOut), meta: attempt.meta, flags: attempt.flags };
  delete state.attempts[id];
  return Object.keys(attempt.answers).length;
}

/** Açıq seansı bağlayıb aktiv vaxtı yığır. Vaxt bitibsə — bitirir. */
function settle(state: DemoState, id: string, now: number, running: boolean): TickResult | null {
  const attempt = state.attempts[id];
  const exam = findExam(id);
  if (!attempt || !exam) return null;
  const total = durationMs(exam);
  attempt.elapsedMs = activeElapsed(attempt, total, now);
  attempt.startedAt ??= now;
  attempt.lastSeenAt = running ? now : null;
  if (attempt.elapsedMs >= total) return { expired: true, answered: finalizeAttempt(state, id, true) };
  return { expired: false, remaining: total - attempt.elapsedMs };
}

/** Səhifə açıqdır (açılış, görünən oldu, və ya periodik siqnal) — sayğac gedir. */
export const tickAttempt = (state: DemoState, id: string, now = Date.now()) => settle(state, id, now, true);

/** Səhifə gizləndi/bağlandı — sayğac dayanır. */
export const pauseAttempt = (state: DemoState, id: string, now = Date.now()) => settle(state, id, now, false);

/** Cavabı yazır. Vaxt bitibsə — qəbul etmir və sınağı bitirir. */
export function saveAnswer(
  state: DemoState,
  id: string,
  n: number,
  value: string,
  now = Date.now(),
  ms?: number,
): { ok: boolean; expired?: boolean; answered?: number } {
  const attempt = state.attempts[id];
  const exam = findExam(id);
  const q = EXAM_QUESTIONS.find((x) => x.n === n);
  if (!attempt || !exam || !q) return { ok: false, expired: Boolean(state.results[id]) };
  if (activeElapsed(attempt, durationMs(exam), now) >= durationMs(exam)) {
    return { ok: false, expired: true, answered: finalizeAttempt(state, id, true) };
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

export function toggleFlag(state: DemoState, id: string, n: number): boolean {
  const attempt = state.attempts[id];
  if (!attempt || !Number.isInteger(n)) return false;
  attempt.flags = attempt.flags.includes(n) ? attempt.flags.filter((x) => x !== n) : [...attempt.flags, n];
  return true;
}
