import "server-only";
import { and, asc, eq, inArray } from "drizzle-orm";
import { cache } from "react";
import { db } from "@/db";
import { bankTasks, topics, tutorQuestions, tutorTheory } from "@/db/schema";
import { listBankTasks, type BankTaskView } from "@/lib/bank/tasks";
import type { Letter } from "@/lib/demo/content";
import type { RepetitorKey, RepetitorQuestion, RepetitorTopic } from "./types";

// Saytın sual mənbəyi (günün sualları, repetitor, Səhvlərim) — baza: bank_tasks (müəllifin qapalı sualları),
// tutor_questions (ilkin demo suallar — müəllifin sualı olmayan mövzularda), tutor_theory, topics (sıra).

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

/** Müəllifin qapalı (A–E) sualı → sayt sualı (id = kod, məs. HQE-0001). */
const fromBank = (b: BankTaskView): RepetitorQuestion => ({
  id: b.code,
  topic: b.topicSlug,
  type: b.subtopic ?? b.topicName,
  freq: 0,
  // Şəkil faylı hələ yoxdur — təsviri mətnə əlavə olunur (sual həll oluna bilsin).
  text: b.imageAlt ? `${b.body} (Şəkil: ${b.imageAlt})` : b.body,
  options: b.options!,
  ref: b.ref ?? "",
});

const isClosed = (b: BankTaskView) => b.format === "closed" && b.options !== null && b.correct !== null;

const loadSources = cache(async () => {
  const [topicRows, questionRows, bank] = await Promise.all([
    db.select({ id: topics.id, slug: topics.slug, name: topics.name }).from(topics).orderBy(asc(topics.sortOrder)),
    db.select().from(tutorQuestions).orderBy(asc(tutorQuestions.sortOrder), asc(tutorQuestions.id)),
    listBankTasks(),
  ]);
  return { topicRows, questionRows, bank: bank.filter(isClosed) };
});

/**
 * Bütün mövzular (statistikadakı sıra ilə) və onların sualları — sualı olmayan mövzular da daxil.
 * Müəllifin sualları olan mövzuda yalnız onlar göstərilir (köhnə demo suallar əvəzlənir).
 */
export const listAllRepetitorTopics = cache(async (): Promise<RepetitorTopicWithQuestions[]> => {
  const { topicRows, questionRows, bank } = await loadSources();
  return topicRows.map((t) => {
    const own = bank.filter((b) => b.topicId === t.id);
    return {
      slug: t.slug,
      name: t.name,
      questions: own.length
        ? own.map(fromBank)
        : questionRows.filter((q) => q.topicId === t.id).map((q) => toQuestion(q, t.slug)),
    };
  });
});

/**
 * Bütün suallar — əvəzlənmiş demo suallar da (köhnə cavablar, səhvlər və statistika üçün).
 * Yeni məzmun (günün sualları, repetitor) üçün listRepetitorTopics istifadə olunur.
 */
export const listQuestionPool = cache(async (): Promise<RepetitorTopicWithQuestions[]> => {
  const { topicRows, questionRows, bank } = await loadSources();
  return topicRows
    .map((t) => ({
      slug: t.slug,
      name: t.name,
      questions: [
        ...bank.filter((b) => b.topicId === t.id).map(fromBank),
        ...questionRows.filter((q) => q.topicId === t.id).map((q) => toQuestion(q, t.slug)),
      ],
    }))
    .filter((t) => t.questions.length > 0);
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

/** Müəllifin sualının açarı: cavab, həll (bir addım), ipucu yoxdur. */
const bankKey = (r: { answer: string | null; solution: string }): RepetitorKey => ({
  answer: r.answer as Letter,
  hint: "",
  steps: [r.solution],
});

/** Yalnız server action / server komponentində: cavab, ipucu, izah. Əvvəl müəllifin bankı, sonra köhnə suallar. */
export async function getRepetitorKey(id: string): Promise<RepetitorKey | null> {
  return (await getRepetitorKeys([id])).get(id) ?? null;
}

/** Bir neçə sualın açarı birdən (sınaq yoxlaması üçün). */
export async function getRepetitorKeys(ids: string[]): Promise<Map<string, RepetitorKey>> {
  if (!ids.length) return new Map();
  const [bank, rows] = await Promise.all([
    db
      .select({ id: bankTasks.code, answer: bankTasks.correctOption, solution: bankTasks.solution })
      .from(bankTasks)
      .where(and(inArray(bankTasks.code, ids), eq(bankTasks.format, "closed"))),
    db
      .select({ id: tutorQuestions.id, answer: tutorQuestions.answer, hint: tutorQuestions.hint, steps: tutorQuestions.steps })
      .from(tutorQuestions)
      .where(inArray(tutorQuestions.id, ids)),
  ]);
  return new Map<string, RepetitorKey>([
    ...rows.map((r) => [r.id, { answer: r.answer as Letter, hint: r.hint, steps: JSON.parse(r.steps) as string[] }] as const),
    ...bank.filter((b) => b.answer).map((b) => [b.id, bankKey(b)] as const),
  ]);
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
