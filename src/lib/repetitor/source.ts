import "server-only";
import { and, asc, eq, inArray } from "drizzle-orm";
import { cache } from "react";
import { db } from "@/db";
import { bankTasks, topics, tutorTheory } from "@/db/schema";
import { listBankTasks, type BankTaskView } from "@/lib/bank/tasks";
import type { Letter } from "@/lib/demo/content";
import type { RepetitorKey, RepetitorQuestion, RepetitorTopic } from "./types";

// Saytın sual mənbəyi (günün sualları, repetitor, Səhvlərim, bal simulyatoru) — yalnız müəllifin sual bankı
// (bank_tasks, qapalı A–E sualları), tutor_theory və topics (sıra).

/**
 * Təhlilə görə bu sual tiplərinin imtahanda çıxma payı (%). Rəqəm sifarişçinin təhlilindən gəlir —
 * dəyişəndə yalnız buranı redaktə edin.
 */
export const REPETITOR_HIT_RATE = 90;

export type RepetitorTopicWithQuestions = RepetitorTopic & { questions: RepetitorQuestion[] };

/** Müəllifin qapalı (A–E) sualı → sayt sualı (id = kod, məs. HQE-0001). */
const fromBank = (b: BankTaskView): RepetitorQuestion => ({
  id: b.code,
  topic: b.topicSlug,
  type: b.subtopic ?? b.topicName,
  freq: 0,
  text: b.body,
  imageUrl: b.imageUrl,
  imageAlt: b.imageAlt,
  options: b.options!,
  ref: b.ref ?? "",
});

const isClosed = (b: BankTaskView) => b.format === "closed" && b.options !== null && b.correct !== null;

const loadSources = cache(async () => {
  const [topicRows, bank] = await Promise.all([
    db.select({ id: topics.id, slug: topics.slug, name: topics.name }).from(topics).orderBy(asc(topics.sortOrder)),
    listBankTasks(),
  ]);
  return { topicRows, bank: bank.filter(isClosed) };
});

/** Bütün mövzular (statistikadakı sıra ilə) və onların sualları — sualı olmayan mövzular da daxil. */
export const listAllRepetitorTopics = cache(async (): Promise<RepetitorTopicWithQuestions[]> => {
  const { topicRows, bank } = await loadSources();
  return topicRows.map((t) => ({
    slug: t.slug,
    name: t.name,
    questions: bank.filter((b) => b.topicId === t.id).map(fromBank),
  }));
});

/** Sualı olan mövzular (cavab tarixçəsi, Səhvlərim və statistika üçün). */
export const listQuestionPool = cache(async (): Promise<RepetitorTopicWithQuestions[]> =>
  (await listAllRepetitorTopics()).filter((t) => t.questions.length > 0),
);

/** Sualı olan mövzular. */
export async function listRepetitorTopics(): Promise<RepetitorTopicWithQuestions[]> {
  return listQuestionPool();
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

/** Yalnız server action / server komponentində: cavab və həll (bir addım), ipucu yoxdur. */
export async function getRepetitorKey(id: string): Promise<RepetitorKey | null> {
  return (await getRepetitorKeys([id])).get(id) ?? null;
}

/** Bir neçə sualın açarı birdən (sınaq yoxlaması üçün). */
export async function getRepetitorKeys(ids: string[]): Promise<Map<string, RepetitorKey>> {
  if (!ids.length) return new Map();
  const rows = await db
    .select({ id: bankTasks.code, answer: bankTasks.correctOption, solution: bankTasks.solution })
    .from(bankTasks)
    .where(and(inArray(bankTasks.code, ids), eq(bankTasks.format, "closed")));
  return new Map(
    rows.filter((r) => r.answer).map((r) => [r.id, { answer: r.answer as Letter, hint: "", steps: [r.solution] }] as const),
  );
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
