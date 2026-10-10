import "server-only";
import { and, asc, count, eq, inArray } from "drizzle-orm";
import { cache } from "react";
import { db } from "@/db";
import { bankTasks, examBlueprints, examItems, exams, subtopics, topics } from "@/db/schema";
import { LETTERS, type Letter } from "@/lib/demo/content";
import { EXAM_TYPE_OF, type ExamFormat, type ExamKey, type ExamMeta, type ExamQuestion } from "./types";

// Sınaqlar bazadan (exams + exam_items → bank_tasks). Köhnə statik sınaqlar silinib.

/** Dərc olunmuş sınaqlar: imtahan tipi, sonra nömrə sırası ilə. */
export const listExams = cache(async (opts: { all?: boolean } = {}): Promise<ExamMeta[]> => {
  const [rows, counts] = await Promise.all([
    db
      .select({ e: exams, group: examBlueprints.name, sort: examBlueprints.sortOrder })
      .from(exams)
      .innerJoin(examBlueprints, eq(examBlueprints.key, exams.blueprintKey))
      .where(opts.all ? undefined : eq(exams.status, "published"))
      .orderBy(asc(examBlueprints.sortOrder), asc(exams.number)),
    db.select({ id: examItems.examId, format: examItems.format, n: count() }).from(examItems).groupBy(examItems.examId, examItems.format),
  ]);
  return rows.map(({ e, group }) => {
    const c: Record<ExamFormat, number> = { closed: 0, coded: 0, written: 0 };
    for (const x of counts) if (x.id === e.id) c[x.format] = x.n;
    return {
      id: e.id,
      title: e.title,
      group,
      durationMin: e.durationMin,
      blueprintKey: e.blueprintKey,
      examType: EXAM_TYPE_OF[e.blueprintKey] ?? "11",
      number: e.number,
      total: c.closed + c.coded + c.written,
      counts: c,
      status: e.status,
    };
  });
});

export async function findExam(id: string): Promise<ExamMeta | undefined> {
  return (await listExams({ all: true })).find((e) => e.id === id);
}

type Option = { key: string; text: string };

const loadRows = cache(async (id: string) =>
  db
    .select({
      n: examItems.n,
      format: examItems.format,
      t: bankTasks,
      topicSlug: topics.slug,
      topicName: topics.name,
      subtopic: subtopics.title,
    })
    .from(examItems)
    .innerJoin(bankTasks, eq(bankTasks.code, examItems.taskCode))
    .innerJoin(topics, eq(topics.id, bankTasks.topicId))
    .leftJoin(subtopics, eq(subtopics.id, bankTasks.subtopicId))
    .where(eq(examItems.examId, id))
    .orderBy(asc(examItems.n)),
);

/** Sınağın sualları (cavabsız) — brauzerə gedə bilər. */
export const getExamQuestions = cache(async (id: string): Promise<ExamQuestion[]> => {
  const rows = await loadRows(id);
  return rows.map(({ n, format, t, topicSlug, topicName, subtopic }) => {
    const raw = t.options ? (JSON.parse(t.options) as unknown) : null;
    const options =
      format === "closed" && Array.isArray(raw)
        ? (Object.fromEntries(LETTERS.map((l) => [l, (raw as Option[]).find((o) => o.key === l)?.text ?? ""])) as Record<Letter, string>)
        : undefined;
    return {
      n,
      code: t.code,
      format,
      topic: topicSlug,
      topicName,
      type: subtopic ?? topicName,
      text: t.body,
      options,
      imageUrl: t.imageUrl,
      imageAlt: t.imageAlt,
      ref:
        t.basedOnPage && t.basedOnTaskNo
          ? `${t.basedOnYear ?? 2025} toplu, ${t.basedOnPart ?? "I"} hissə, səh.${t.basedOnPage} №${t.basedOnTaskNo}`
          : "",
    };
  });
});

/** Yalnız serverdə: n → düzgün cavab və həll. */
export const getExamKeys = cache(async (id: string): Promise<Map<number, ExamKey>> => {
  const rows = await loadRows(id);
  return new Map(
    rows.map(({ n, format, t }) => [
      n,
      {
        code: t.code,
        format,
        answer: format === "closed" ? (t.correctOption ?? "") : (t.answerValue ?? ""),
        steps: t.solution ? [t.solution] : [],
      },
    ]),
  );
});

/** Sınaq sualının kodu (n → kod) — cavabların loqu və Səhvlərim üçün. */
export async function examCodes(ids: string[]): Promise<Map<string, Map<number, string>>> {
  if (!ids.length) return new Map();
  const rows = await db
    .select({ id: examItems.examId, n: examItems.n, code: examItems.taskCode })
    .from(examItems)
    .where(inArray(examItems.examId, ids));
  const out = new Map<string, Map<number, string>>();
  for (const r of rows) out.set(r.id, (out.get(r.id) ?? new Map()).set(r.n, r.code));
  return out;
}

export const examExists = async (id: string) =>
  (await db.select({ id: exams.id }).from(exams).where(and(eq(exams.id, id)))).length > 0;
