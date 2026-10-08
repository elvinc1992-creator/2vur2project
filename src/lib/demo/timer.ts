// Sınaq sayğacı: vaxt yalnız sınaq səhifəsi açıq (görünən) olanda gedir.
// Server aktiv vaxtı toplayır; səhifə hər HEARTBEAT_MS siqnal göndərir.
// Siqnallar arasında MAX_GAP_MS-dən çox fasilə — səhifə bağlı sayılır, o vaxt hesablanmır.

export const HEARTBEAT_MS = 15_000;
export const MAX_GAP_MS = 30_000;

export type TimerFields = {
  startedAt: number | null;
  /** Yığılmış aktiv vaxt (ms). Köhnə formatda yoxdur. */
  elapsedMs?: number;
  /** Açıq seansın son siqnalı (server vaxtı). null — fasilədə. */
  lastSeenAt?: number | null;
};

/** Aktiv vaxt: yığılmış + açıq seansın davamı (ən çox MAX_GAP_MS). */
export function activeElapsed(a: TimerFields, durationMs: number, now = Date.now()): number {
  // Köhnə format (fasiləsiz sayğac): elapsedMs yoxdursa, başlanğıcdan bəri keçən vaxt.
  const base = a.elapsedMs ?? (a.startedAt != null ? Math.min(Math.max(0, now - a.startedAt), durationMs) : 0);
  const running = a.lastSeenAt != null ? Math.min(Math.max(0, now - a.lastSeenAt), MAX_GAP_MS) : 0;
  return Math.min(durationMs, base + running);
}

export function remainingOf(a: TimerFields, durationMs: number, now = Date.now()): number {
  return Math.max(0, durationMs - activeElapsed(a, durationMs, now));
}
