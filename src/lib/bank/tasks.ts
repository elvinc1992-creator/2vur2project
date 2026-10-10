import "server-only";
import { asc, eq } from "drizzle-orm";
import { cache } from "react";
import { db } from "@/db";
import { bankTasks, subtopics, topics, type TaskFormat } from "@/db/schema";
import { LETTERS, type Letter } from "@/lib/demo/content";

// Müəllifin sual bankı (bank_tasks) — oxuma və ekrana hazırlama.

type Option = { key: string; text: string };

export type BankTaskView = {
  code: string;
  topicId: number;
  topicSlug: string;
  topicName: string;
  subtopicId: number | null;
  subtopic: string | null;
  format: TaskFormat;
  body: string;
  imageUrl: string | null;
  imageAlt: string | null;
  /** closed: A–E. */
  options: Record<Letter, string> | null;
  correct: Letter | null;
  /** matching: sol və sağ sütun. */
  matching: { left: Option[]; right: Option[] } | null;
  /** Ekranda göstərilən yekun cavab (bütün formatlar üçün). */
  answer: string;
  solution: string;
  /** "2025 toplu, I hissə, səh.31 №3". */
  ref: string | null;
  part: string | null;
  page: number | null;
  no: number | null;
};

export const listBankTasks = cache(async (): Promise<BankTaskView[]> => {
  const rows = await db
    .select({
      t: bankTasks,
      topicSlug: topics.slug,
      topicName: topics.name,
      subtopic: subtopics.title,
    })
    .from(bankTasks)
    .innerJoin(topics, eq(topics.id, bankTasks.topicId))
    .leftJoin(subtopics, eq(subtopics.id, bankTasks.subtopicId))
    .orderBy(asc(topics.curriculumOrder), asc(bankTasks.sortOrder));

  return rows.map(({ t, topicSlug, topicName, subtopic }) => {
    const raw = t.options ? (JSON.parse(t.options) as unknown) : null;
    const closed = t.format === "closed" && Array.isArray(raw) ? (raw as Option[]) : null;
    const options = closed
      ? (Object.fromEntries(LETTERS.map((l) => [l, closed.find((o) => o.key === l)?.text ?? ""])) as Record<Letter, string>)
      : null;
    const matching = t.format === "matching" && raw && !Array.isArray(raw) ? (raw as { left: Option[]; right: Option[] }) : null;
    const pairs = t.matchingAnswer ? (JSON.parse(t.matchingAnswer) as Record<string, string[]>) : null;
    const correct = (t.correctOption as Letter | null) ?? null;
    const answer =
      t.format === "closed" && correct && options
        ? `${correct}) ${options[correct]}`
        : t.format === "matching" && pairs
          ? Object.entries(pairs)
              .map(([k, v]) => `${k} → ${v.join(", ")}`)
              .join("; ")
          : (t.answerValue ?? "");
    return {
      code: t.code,
      topicId: t.topicId,
      topicSlug,
      topicName,
      subtopicId: t.subtopicId,
      subtopic,
      format: t.format,
      body: t.body,
      imageUrl: t.imageUrl,
      imageAlt: t.imageAlt,
      options,
      correct,
      matching,
      answer,
      solution: t.solution,
      ref:
        t.basedOnPage && t.basedOnTaskNo
          ? `${t.basedOnYear ?? 2025} toplu, ${t.basedOnPart ?? "I"} hissə, səh.${t.basedOnPage} №${t.basedOnTaskNo}`
          : null,
      part: t.basedOnPart,
      page: t.basedOnPage,
      no: t.basedOnTaskNo,
    };
  });
});
