// İstifadəçinin bütün cavablarına görə imtahanda təxmini düzgün cavab sayı.
// Şərt: ən azı MIN_TOPICS fərqli mövzudan MIN_QUESTIONS sual həll edilməlidir.
// Düstur: int(N × düzgün% / 100) − 1 (mənfi olmur). Məs.: 200 sualdan 120 düzgün → 60% → buraxılış: int(25 × 60 / 100) − 1 = 14.

export const MIN_QUESTIONS = 20;
export const MIN_TOPICS = 4;

/** Riyaziyyatdan sual sayı. */
export const EXAM_QUESTION_COUNT = { buraxilis: 25, blok: 30 } as const;

export type ScoreStats = { total: number; correct: number; topics: number };

export function estimateCorrect(questions: number, { total, correct }: Pick<ScoreStats, "total" | "correct">): number {
  if (total <= 0) return 0;
  return Math.max(0, Math.floor((questions * correct) / total) - 1);
}

export function scoreEstimate(stats: ScoreStats) {
  return {
    ...stats,
    /** Təxmin üçün kifayət qədər məlumat var. */
    ready: stats.total >= MIN_QUESTIONS && stats.topics >= MIN_TOPICS,
    pct: stats.total ? (stats.correct * 100) / stats.total : 0,
    buraxilis: estimateCorrect(EXAM_QUESTION_COUNT.buraxilis, stats),
    blok: estimateCorrect(EXAM_QUESTION_COUNT.blok, stats),
  };
}
