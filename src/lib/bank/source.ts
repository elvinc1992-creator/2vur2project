import "server-only";
import { asc, count, eq } from "drizzle-orm";
import { cache } from "react";
import { db } from "@/db";
import { bankTasks, examCounterparts, examSamples, topics } from "@/db/schema";
import { LETTERS, type Letter } from "@/lib/demo/content";
import { listQuestionPool } from "@/lib/repetitor/source";

// İmtahan sualları (exam_samples) və onların bizim saytdakı qarşılıqları (exam_counterparts).

export type ExamQuestionView = {
  question: string;
  options: Record<Letter, string>;
  answer: Letter;
};

export type ExamPairView = {
  n: number;
  topicSlug: string;
  topicName: string;
  year: number;
  exam: string;
  questionNo: number;
  type: string;
  /** "EYNİ" | "Çox yaxın" — imtahan sualı ilə qarşılığın yaxınlığı. */
  matchLevel: string;
  examQuestion: ExamQuestionView;
  /** Bizim saytdakı qarşılıqlar (sıra ilə). */
  counterparts: (ExamQuestionView & { figureTikz: string | null })[];
  /** Mövzu üzrə saytdakı sual sayı. */
  topicQuestions: number;
  /** Mövzunun müəllif sual bankı yüklənibmi. */
  bankReady: boolean;
};

const toOptions = (json: string) => {
  const opts = JSON.parse(json) as string[];
  return Object.fromEntries(LETTERS.map((l, i) => [l, opts[i] ?? ""])) as Record<Letter, string>;
};

/** İmtahan sualları + bizim qarşılıqları, mövzu sırası ilə. */
export const listExamPairs = cache(async (): Promise<ExamPairView[]> => {
  const [samples, cps, bankCounts, pool] = await Promise.all([
    db
      .select({ s: examSamples, topicSlug: topics.slug, topicName: topics.name })
      .from(examSamples)
      .innerJoin(topics, eq(topics.id, examSamples.topicId))
      .orderBy(asc(topics.curriculumOrder), asc(examSamples.n)),
    db.select().from(examCounterparts).orderBy(asc(examCounterparts.examN), asc(examCounterparts.sortOrder)),
    db.select({ topicId: bankTasks.topicId, n: count() }).from(bankTasks).groupBy(bankTasks.topicId),
    listQuestionPool(),
  ]);
  const bankBy = new Map(bankCounts.map((r) => [r.topicId, r.n]));
  return samples.map(({ s, topicSlug, topicName }) => {
    const bank = bankBy.get(s.topicId) ?? 0;
    return {
      n: s.n,
      topicSlug,
      topicName,
      year: s.year,
      exam: s.exam,
      questionNo: s.questionNo,
      type: s.type,
      matchLevel: s.matchLevel,
      examQuestion: { question: s.question, options: toOptions(s.options), answer: s.answer as Letter },
      counterparts: cps
        .filter((c) => c.examN === s.n)
        .map((c) => ({ question: c.question, options: toOptions(c.options), answer: c.answer as Letter, figureTikz: c.figureTikz })),
      topicQuestions: Math.max(bank, pool.find((t) => t.slug === topicSlug)?.questions.length ?? 0),
      bankReady: bank > 0,
    };
  });
});
