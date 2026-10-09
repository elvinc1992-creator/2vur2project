// Son 7 günün cavablarına görə imtahanda təxmini düzgün cavab sayı.
// Düstur: int(N × düzgün% / 100) − 1 (mənfi olmur). Məs.: 200 sualdan 120 düzgün → 60% → buraxılış: int(25 × 60 / 100) − 1 = 14.

export const WEEK_MS = 7 * 24 * 60 * 60 * 1000;

/** Riyaziyyatdan sual sayı. */
export const EXAM_QUESTION_COUNT = { buraxilis: 25, blok: 30 } as const;

export type WeeklyStats = { total: number; correct: number };

export function estimateCorrect(questions: number, { total, correct }: WeeklyStats): number {
  if (total <= 0) return 0;
  return Math.max(0, Math.floor((questions * correct) / total) - 1);
}

export function weeklyEstimate(stats: WeeklyStats) {
  return {
    ...stats,
    pct: stats.total ? (stats.correct * 100) / stats.total : 0,
    buraxilis: estimateCorrect(EXAM_QUESTION_COUNT.buraxilis, stats),
    blok: estimateCorrect(EXAM_QUESTION_COUNT.blok, stats),
  };
}
