import "server-only";
import { asc, count, eq, max } from "drizzle-orm";
import { db } from "@/db";
import { bankTasks, examBlueprints, examBlueprintSections, examItems, exams, topics } from "@/db/schema";
import { generateExam, type GenSection } from "./generate";
import { EXAM_TYPE_OF } from "./types";

// Yeni sınaq: imtahan quruluşu (exam_blueprint_sections) + mövzuların DİM tezliyi və imtahan tipləri → generateExam.

export const DEFAULT_DURATION: Record<string, number> = { "buraxilis-9": 90, "buraxilis-11": 90, "qebul-11": 120 };
const TITLE: Record<string, string> = {
  "buraxilis-9": "9-cu sinif buraxılış sınağı",
  "buraxilis-11": "11-ci sinif buraxılış sınağı",
  "qebul-11": "Blok (qəbul) sınağı",
};
const ID_PREFIX: Record<string, string> = { "buraxilis-9": "b9", "buraxilis-11": "b11", "qebul-11": "q11" };

export async function createExam(blueprintKey: string, opts: { status?: "published" | "draft"; durationMin?: number } = {}) {
  const [bp] = await db.select().from(examBlueprints).where(eq(examBlueprints.key, blueprintKey));
  if (!bp) throw new Error(`İmtahan quruluşu yoxdur: ${blueprintKey}`);
  const examType = EXAM_TYPE_OF[blueprintKey];
  const [sectionRows, topicRows, taskRows, usageRows, [last]] = await Promise.all([
    db.select().from(examBlueprintSections).where(eq(examBlueprintSections.blueprintKey, blueprintKey)).orderBy(asc(examBlueprintSections.sortOrder)),
    db.select().from(topics),
    db
      .select({ code: bankTasks.code, topicId: bankTasks.topicId, format: bankTasks.format, answerValue: bankTasks.answerValue, options: bankTasks.options })
      .from(bankTasks),
    db
      .select({ code: examItems.taskCode, n: count() })
      .from(examItems)
      .innerJoin(exams, eq(exams.id, examItems.examId))
      .where(eq(exams.blueprintKey, blueprintKey))
      .groupBy(examItems.taskCode),
    db.select({ n: max(exams.number) }).from(exams).where(eq(exams.blueprintKey, blueprintKey)),
  ]);

  const sections: GenSection[] = sectionRows.map((s) => ({
    format: s.format === "closed" ? "closed" : s.format === "open" ? "coded" : "written",
    count: s.questionCount,
    firstNo: s.firstNo,
  }));
  const items = generateExam({
    sections,
    examType,
    topics: topicRows.map((t) => ({
      id: t.id,
      curriculumOrder: t.curriculumOrder,
      dimFrequency: t.dimFrequency,
      examTypes: t.examTypes.split(",").map((x) => x.trim()) as Array<"9" | "11" | "blok">,
    })),
    tasks: taskRows.map((t) => ({ ...t, hasOptions: Boolean(t.options) })),
    usage: new Map(usageRows.map((u) => [u.code, u.n])),
  });
  if (!items.length) throw new Error("Bu imtahan üçün bankda uyğun sual yoxdur");

  const number = (last?.n ?? 0) + 1;
  const id = `${ID_PREFIX[blueprintKey] ?? blueprintKey}-${number}`;
  await db.insert(exams).values({
    id,
    blueprintKey,
    number,
    title: `${TITLE[blueprintKey] ?? bp.name} №${number}`,
    durationMin: opts.durationMin ?? DEFAULT_DURATION[blueprintKey] ?? 90,
    status: opts.status ?? "published",
  });
  await db.insert(examItems).values(items.map((i) => ({ examId: id, n: i.n, taskCode: i.code, format: i.format })));
  return { id, count: items.length };
}
