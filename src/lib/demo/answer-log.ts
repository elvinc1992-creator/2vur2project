import "server-only";
import type { AnswerSource } from "@/db/schema";
import { EXAM_QUESTIONS } from "./content";
import { DAILY_KEYS, EXAM_KEYS } from "./keys";
import { normalizeCoded } from "./logic";
import type { DemoState } from "./state";

export type AnswerEvent = { source: AnswerSource; questionRef: string; correct: boolean };

/**
 * Əvvəlki və yeni vəziyyəti müqayisə edib yeni cavablanmış sualları qaytarır (user_answers üçün).
 * "Keç" (skip) cavab sayılmır; sınağın yazılı tapşırıqları əl ilə yoxlanıldığı üçün daxil edilmir.
 */
export function newAnswers(prev: DemoState | null, next: DemoState): AnswerEvent[] {
  const out: AnswerEvent[] = [];

  for (const [id, a] of Object.entries(next.daily)) {
    if (a === "skip" || prev?.daily[id]) continue;
    out.push({ source: "daily", questionRef: id, correct: next.dailyOk?.[id] ?? a === DAILY_KEYS[id]?.answer });
  }

  for (const [id, p] of Object.entries(next.tutor ?? {})) {
    if (!p.a || p.a === "skip" || prev?.tutor?.[id]?.a) continue;
    out.push({ source: "tutor", questionRef: id, correct: Boolean(p.ok) });
  }

  if (next.review) {
    // Yeni təkrar seansı — köhnə seansın cavabları nəzərə alınmır.
    const before = prev?.review?.startedAt === next.review.startedAt ? prev.review.answers : {};
    for (const [ref, r] of Object.entries(next.review.answers)) {
      if (r.a === "skip" || before[ref]) continue;
      out.push({ source: "review", questionRef: ref, correct: r.ok });
    }
  }

  // Repetitor sınağı: yalnız cavab verilmiş suallar.
  for (const [key, rec] of Object.entries(next.tutorExams ?? {})) {
    if (prev?.tutorExams?.[key]) continue;
    for (const id of Object.keys(rec.answers)) {
      out.push({ source: "tutor", questionRef: `${key}:${id}`, correct: Boolean(rec.results[id]) });
    }
  }

  for (const [examId, result] of Object.entries(next.results)) {
    if (prev?.results[examId]) continue;
    for (const q of EXAM_QUESTIONS) {
      const given = result.answers[String(q.n)];
      if (!given || q.format === "written") continue;
      const key = EXAM_KEYS[q.n].answer;
      const correct = q.format === "closed" ? given === key : normalizeCoded(given) === normalizeCoded(key);
      out.push({ source: "exam", questionRef: `${examId}:${q.n}`, correct });
    }
  }

  return out;
}
