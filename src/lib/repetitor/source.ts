import "server-only";
import { asc, eq, inArray } from "drizzle-orm";
import { cache } from "react";
import { db } from "@/db";
import { topics, tutorQuestions, tutorTheory } from "@/db/schema";
import type { Letter } from "@/lib/demo/content";
import type { RepetitorKey, RepetitorQuestion, RepetitorTopic } from "./types";

// Onlayn repetitorun sual mənbəyi — baza: tutor_questions (suallar), tutor_theory (nəzəriyyə), topics (sıra).

/**
 * Təhlilə görə bu sual tiplərinin imtahanda çıxma payı (%). Rəqəm sifarişçinin təhlilindən gəlir —
 * dəyişəndə yalnız buranı redaktə edin.
 */
export const REPETITOR_HIT_RATE = 90;

export type RepetitorTopicWithQuestions = RepetitorTopic & { questions: RepetitorQuestion[] };

type Row = typeof tutorQuestions.$inferSelect;

const toQuestion = (r: Row, topic: string): RepetitorQuestion => ({
  id: r.id,
  topic,
  type: r.type,
  freq: r.freq,
  text: r.text,
  options: JSON.parse(r.options) as Record<Letter, string>,
  ref: r.ref,
});

/** Bütün mövzular (statistikadakı sıra ilə) və onların sualları — sualı olmayan mövzular da daxil. */
export const listAllRepetitorTopics = cache(async (): Promise<RepetitorTopicWithQuestions[]> => {
  const [topicRows, questionRows] = await Promise.all([
    db.select({ id: topics.id, slug: topics.slug, name: topics.name }).from(topics).orderBy(asc(topics.sortOrder)),
    db.select().from(tutorQuestions).orderBy(asc(tutorQuestions.sortOrder), asc(tutorQuestions.id)),
  ]);
  return topicRows.map((t) => ({
    slug: t.slug,
    name: t.name,
    questions: questionRows.filter((q) => q.topicId === t.id).map((q) => toQuestion(q, t.slug)),
  }));
});

/** Sualı olan mövzular. */
export async function listRepetitorTopics(): Promise<RepetitorTopicWithQuestions[]> {
  return (await listAllRepetitorTopics()).filter((t) => t.questions.length > 0);
}

export async function getRepetitorTopic(slug: string): Promise<RepetitorTopicWithQuestions | null> {
  return (await listAllRepetitorTopics()).find((t) => t.slug === slug) ?? null;
}

export async function findRepetitorQuestion(id: string): Promise<RepetitorQuestion | null> {
  for (const t of await listAllRepetitorTopics()) {
    const q = t.questions.find((x) => x.id === id);
    if (q) return q;
  }
  return null;
}

/** Yalnız server action / server komponentində: cavab, ipucu, izah. */
export async function getRepetitorKey(id: string): Promise<RepetitorKey | null> {
  const [r] = await db
    .select({ answer: tutorQuestions.answer, hint: tutorQuestions.hint, steps: tutorQuestions.steps })
    .from(tutorQuestions)
    .where(eq(tutorQuestions.id, id));
  return r ? { answer: r.answer as Letter, hint: r.hint, steps: JSON.parse(r.steps) as string[] } : null;
}

/** Bir neçə sualın açarı birdən (sınaq yoxlaması üçün). */
export async function getRepetitorKeys(ids: string[]): Promise<Map<string, RepetitorKey>> {
  if (!ids.length) return new Map();
  const rows = await db
    .select({ id: tutorQuestions.id, answer: tutorQuestions.answer, hint: tutorQuestions.hint, steps: tutorQuestions.steps })
    .from(tutorQuestions)
    .where(inArray(tutorQuestions.id, ids));
  return new Map(rows.map((r) => [r.id, { answer: r.answer as Letter, hint: r.hint, steps: JSON.parse(r.steps) as string[] }]));
}

/** Mövzunun nəzəriyyəsi; yoxdursa null. */
export async function getTopicTheory(slug: string): Promise<string | null> {
  const [r] = await db
    .select({ body: tutorTheory.body })
    .from(tutorTheory)
    .innerJoin(topics, eq(topics.id, tutorTheory.topicId))
    .where(eq(topics.slug, slug));
  return r?.body ?? null;
}
