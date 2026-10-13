import "server-only";
import { asc, eq, inArray, sql } from "drizzle-orm";
import { cache } from "react";
import { db } from "@/db";
import { bankTasks, topics, tutorTheory } from "@/db/schema";
import { isSelfCheck, matchingKey, matchingText } from "@/lib/bank/check";
import { listBankTasks, type BankTaskView } from "@/lib/bank/tasks";
import type { RepetitorKey, RepetitorQuestion, RepetitorTopic } from "./types";

// Saytın sual mənbəyi (günün sualları, repetitor, Səhvlərim, bal simulyatoru) — yalnız müəllifin sual bankı
// (bank_tasks: qapalı, açıq, uyğunluq və yazılı suallar), tutor_theory və topics (sıra).

/**
 * Təhlilə görə bu sual tiplərinin imtahanda çıxma payı (%). Rəqəm sifarişçinin təhlilindən gəlir —
 * dəyişəndə yalnız buranı redaktə edin.
 */
export const REPETITOR_HIT_RATE = 90;

export type RepetitorTopicWithQuestions = RepetitorTopic & { questions: RepetitorQuestion[] };

/** Müəllifin sualı (bütün formatlar) → sayt sualı (id = kod, məs. HQE-0001). */
const fromBank = (b: BankTaskView): RepetitorQuestion => ({
  id: b.code,
  topic: b.topicSlug,
  type: b.subtopic ?? b.topicName,
  freq: 0,
  text: b.body,
  imageUrl: b.imageUrl,
  imageAlt: b.imageAlt,
  format: b.format,
  ...(b.options ? { options: b.options } : {}),
  ...(b.matching ? { matching: b.matching } : {}),
  ...(isSelfCheck(b.format, b.answer) ? { selfCheck: true } : {}),
  ref: b.ref ?? "",
});

/** Cavabı olan suallar: qapalı — variant və hərf, uyğunluq — sütunlar, açıq/yazılı — yekun cavab. */
const isUsable = (b: BankTaskView) =>
  b.format === "closed"
    ? b.options !== null && b.correct !== null
    : b.format === "matching"
      ? b.matching !== null && b.answer !== ""
      : b.answer.trim() !== "";

const loadSources = cache(async () => {
  const [topicRows, bank] = await Promise.all([
    db.select({ id: topics.id, slug: topics.slug, name: topics.name }).from(topics).orderBy(asc(topics.curriculumOrder)),
    listBankTasks(),
  ]);
  return { topicRows, bank: bank.filter(isUsable) };
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
    .select({
      id: bankTasks.code,
      format: bankTasks.format,
      correct: bankTasks.correctOption,
      value: bankTasks.answerValue,
      matching: bankTasks.matchingAnswer,
      solution: bankTasks.solution,
    })
    .from(bankTasks)
    .where(inArray(bankTasks.code, ids));
  const out = new Map<string, RepetitorKey>();
  for (const r of rows) {
    const answer = r.format === "closed" ? (r.correct ?? "") : r.format === "matching" ? matchingKey(r.matching) : (r.value ?? "").trim();
    if (!answer) continue;
    out.set(r.id, {
      format: r.format,
      answer,
      answerText: r.format === "matching" ? matchingText(answer) : answer,
      selfCheck: isSelfCheck(r.format, r.value),
      hint: "",
      steps: [r.solution],
    });
  }
  return out;
}

/** Mövzunun nəzəriyyəsi: mətn (boş ola bilər) və vərəqlənən kitabın olub-olmaması; yoxdursa null. */
export async function getTopicTheory(slug: string): Promise<{ body: string; hasBook: boolean } | null> {
  const [r] = await db
    .select({ body: tutorTheory.body, hasBook: sql<number>`${tutorTheory.bookHtml} is not null` })
    .from(tutorTheory)
    .innerJoin(topics, eq(topics.id, tutorTheory.topicId))
    .where(eq(topics.slug, slug));
  return r ? { body: r.body, hasBook: Boolean(r.hasBook) } : null;
}

/** Nəzəriyyə kitabı olan mövzuların sayı (ana səhifə üçün). */
export async function countTheoryBooks(): Promise<number> {
  const [r] = await db.select({ n: sql<number>`count(*)` }).from(tutorTheory).where(sql`${tutorTheory.bookHtml} is not null`);
  return Number(r?.n ?? 0);
}

/** Mövzunun nəzəriyyə kitabı (HTML, scripts/import-theory.mts); yoxdursa null. */
export async function getTopicBook(slug: string): Promise<string | null> {
  const [r] = await db
    .select({ html: tutorTheory.bookHtml })
    .from(tutorTheory)
    .innerJoin(topics, eq(topics.id, tutorTheory.topicId))
    .where(eq(topics.slug, slug));
  return r?.html ?? null;
}
