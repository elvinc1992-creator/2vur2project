import "server-only";
import { MOCK_KEYS, MOCK_QUESTIONS, MOCK_TOPICS } from "./mock";
import type { RepetitorKey, RepetitorQuestion, RepetitorTopic } from "./types";

// Onlayn repetitorun sual mənbəyi. İndi — mock (./mock.ts). Admin paneli hazır olanda bu funksiyalar
// DB-dən (tutor_questions) oxuyacaq; imzalar artıq async-dir, səhifələr dəyişməyəcək.

/**
 * Təhlilə görə bu sual tiplərinin imtahanda çıxma payı (%). Rəqəm sifarişçinin təhlilindən gəlir —
 * dəyişəndə yalnız buranı redaktə edin.
 */
export const REPETITOR_HIT_RATE = 90;

export type RepetitorTopicWithQuestions = RepetitorTopic & { questions: RepetitorQuestion[] };

export async function listRepetitorTopics(): Promise<RepetitorTopicWithQuestions[]> {
  return MOCK_TOPICS.map((t) => ({ ...t, questions: MOCK_QUESTIONS.filter((q) => q.topic === t.slug) })).filter(
    (t) => t.questions.length > 0,
  );
}

export async function getRepetitorTopic(slug: string): Promise<RepetitorTopicWithQuestions | null> {
  return (await listRepetitorTopics()).find((t) => t.slug === slug) ?? null;
}

export async function findRepetitorQuestion(id: string): Promise<RepetitorQuestion | null> {
  return MOCK_QUESTIONS.find((q) => q.id === id) ?? null;
}

/** Yalnız server action / server komponentində: cavab, ipucu, izah. */
export async function getRepetitorKey(id: string): Promise<RepetitorKey | null> {
  return MOCK_KEYS[id] ?? null;
}
