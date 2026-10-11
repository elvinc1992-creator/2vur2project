// Müəllim sınağının təmiz köməkçiləri (server və testlər).

/** Mövzu sınağında sual sayı (müəllim seçir). */
export const TOPIC_COUNTS = [15, 20, 25] as const;

/** Mövzu sınağının bölmələri: təxminən ¾ qapalı, ¼ kodlaşdırılan. */
export const topicCounts = (n: number) => ({ closed: n - Math.round(n / 4), coded: Math.round(n / 4), written: 0 });

/**
 * Tədris ili: 1 sentyabr – 1 iyul. İyul–avqust gələn tədris ilinə aid sayılır.
 * Qaytarır: [from, to) — 1 iyul (Y) … 1 iyul (Y+1), Bakı vaxtı (UTC+4).
 */
export function academicYear(now: number) {
  const d = new Date(now + 4 * 3600_000);
  const y = d.getUTCMonth() >= 6 ? d.getUTCFullYear() : d.getUTCFullYear() - 1;
  return { from: Date.UTC(y, 6, 1) - 4 * 3600_000, to: Date.UTC(y + 1, 6, 1) - 4 * 3600_000, label: `${y}–${y + 1}` };
}
