import "server-only";
import type { AnswerSource } from "@/db/schema";
import type { AnswerMeta, DemoState } from "./state";

export type AnswerEvent = {
  source: AnswerSource;
  questionRef: string;
  correct: boolean;
  /** Zəif mövzuların təhlili üçün: seçilmiş cavab, vaxt, dəyişiklik sayı, işarə, sınaq. */
  chosen?: string | null;
  timeMs?: number | null;
  changes?: number | null;
  flagged?: boolean | null;
  examId?: string | null;
};

const withMeta = (meta: AnswerMeta | undefined) => (meta ? { timeMs: meta.ms, changes: meta.ch } : {});

/**
 * Əvvəlki və yeni vəziyyəti müqayisə edib yeni cavablanmış sualları qaytarır (user_answers üçün).
 * "Keç" (skip) cavab sayılmır; sınağın yazılı tapşırıqları əl ilə yoxlanıldığı üçün daxil edilmir.
 */
export function newAnswers(prev: DemoState | null, next: DemoState): AnswerEvent[] {
  const out: AnswerEvent[] = [];
  const meta = next.answerMeta ?? {};

  for (const [id, a] of Object.entries(next.daily)) {
    if (a === "skip" || prev?.daily[id]) continue;
    out.push({
      source: "daily",
      questionRef: id,
      correct: next.dailyOk?.[id] ?? false,
      chosen: a,
      ...withMeta(meta[`daily:${id}`]),
    });
  }

  for (const [id, p] of Object.entries(next.tutor ?? {})) {
    if (!p.a || p.a === "skip" || prev?.tutor?.[id]?.a) continue;
    out.push({ source: "tutor", questionRef: id, correct: Boolean(p.ok), chosen: p.a, ...withMeta(meta[`tutor:${id}`]) });
  }

  if (next.review) {
    // Yeni təkrar seansı — köhnə seansın cavabları nəzərə alınmır.
    const before = prev?.review?.startedAt === next.review.startedAt ? prev.review.answers : {};
    for (const [ref, r] of Object.entries(next.review.answers)) {
      if (r.a === "skip" || before[ref]) continue;
      out.push({ source: "review", questionRef: ref, correct: r.ok, chosen: r.a, ...withMeta(meta[`review:${ref}`]) });
    }
  }

  // Repetitor sınağı: yalnız cavab verilmiş suallar.
  for (const [key, rec] of Object.entries(next.tutorExams ?? {})) {
    if (prev?.tutorExams?.[key]) continue;
    for (const [id, given] of Object.entries(rec.answers)) {
      out.push({ source: "tutor", questionRef: `${key}:${id}`, correct: Boolean(rec.results[id]), chosen: given, examId: key });
    }
  }

  for (const [examId, result] of Object.entries(next.results)) {
    if (prev?.results[examId]) continue;
    const flags = new Set(result.flags ?? []);
    // Yalnız bazadakı sınaqlar (items — n → sualın kodu və düzgünlüyü); yazılılar əl ilə yoxlanılır.
    for (const [n, item] of Object.entries(result.items ?? {})) {
      const given = result.answers[n];
      if (!given || item.ok === null) continue;
      out.push({
        source: "exam",
        questionRef: `${examId}:${item.code}`,
        correct: item.ok,
        chosen: given,
        flagged: flags.has(Number(n)),
        examId,
        ...withMeta(result.meta?.[n]),
      });
    }
  }

  return out;
}
