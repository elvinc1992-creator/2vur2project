import "server-only";
import { asc, count, eq, inArray, max } from "drizzle-orm";
import { db } from "@/db";
import { bankTasks, examBlueprintSections, examItems, examKinds, exams, topics, type ExamStatusDb } from "@/db/schema";
import { generateExam, type GenSection, type ItemFormat } from "./generate";
import { EXAM_TYPE_OF } from "./types";

// Yeni sınaq: tip (exam_kinds) → imtahan quruluşu (exam_blueprint_sections) və ya mövzu sınağında adminin seçdiyi say;
// mövzuların DİM tezliyi və imtahan tipləri → generateExam. Yeni sınaq passiv yaranır (saytda görünmür).

export const DEFAULT_DURATION: Record<string, number> = { "buraxilis-9": 90, "buraxilis-11": 90, "qebul-11": 120, movzu: 45 };
const TITLE: Record<string, string> = {
  "buraxilis-9": "9-cu sinif buraxılış sınağı",
  "buraxilis-11": "11-ci sinif buraxılış sınağı",
  "qebul-11": "11-ci sinif blok sınağı",
};
const ID_PREFIX: Record<string, string> = { "buraxilis-9": "b9", "buraxilis-11": "b11", "qebul-11": "q11", movzu: "m" };
/** Mövzu sınağının default bölmələri. */
export const TOPIC_EXAM_COUNTS: Record<ItemFormat, number> = { closed: 15, coded: 5, written: 0 };

export type CreateExamInput = {
  kind: string;
  title?: string;
  durationMin?: number;
  status?: ExamStatusDb;
  /** Yalnız mövzu sınağı: mövzu və bölmələrin sayı. */
  topicId?: number;
  counts?: Partial<Record<ItemFormat, number>>;
  /** Əl ilə seçilmiş suallar (bölmə üzrə). */
  preset?: Partial<Record<ItemFormat, string[]>>;
};

const sectionFormat = (f: string): ItemFormat => (f === "closed" ? "closed" : f === "open" ? "coded" : "written");

/** Sınağın bölmələri: imtahan quruluşundan və ya (mövzu sınağı) adminin saylarından, nömrələr 1-dən. */
export async function sectionsOf(kind: string, counts?: Partial<Record<ItemFormat, number>>): Promise<GenSection[]> {
  if (kind === "movzu") {
    const c = { ...TOPIC_EXAM_COUNTS, ...counts };
    let next = 1;
    return (["closed", "coded", "written"] as const)
      .filter((f) => c[f] > 0)
      .map((f) => {
        const s = { format: f, count: c[f], firstNo: next };
        next += c[f];
        return s;
      });
  }
  const rows = await db.select().from(examBlueprintSections).where(eq(examBlueprintSections.blueprintKey, kind)).orderBy(asc(examBlueprintSections.sortOrder));
  return rows.map((s) => ({ format: sectionFormat(s.format), count: s.questionCount, firstNo: s.firstNo }));
}

/** Aktiv və passiv sınaqlarda sualların istifadə sayı (bütün tiplər) — təkrar az olsun. */
async function usageMap() {
  const rows = await db
    .select({ code: examItems.taskCode, n: count() })
    .from(examItems)
    .innerJoin(exams, eq(exams.id, examItems.examId))
    .where(inArray(exams.status, ["active", "passive"]))
    .groupBy(examItems.taskCode);
  return new Map(rows.map((u) => [u.code, u.n]));
}

export async function createExam(input: CreateExamInput) {
  const [kind] = await db.select().from(examKinds).where(eq(examKinds.key, input.kind));
  if (!kind?.blueprintKey) throw new Error(`Sınaq tipi yoxdur: ${input.kind}`);
  const isTopic = kind.key === "movzu";
  const [topicRows, taskRows, usage, sections] = await Promise.all([
    db.select().from(topics),
    db
      .select({ code: bankTasks.code, topicId: bankTasks.topicId, format: bankTasks.format, answerValue: bankTasks.answerValue, options: bankTasks.options })
      .from(bankTasks),
    usageMap(),
    sectionsOf(kind.key, input.counts),
  ]);
  const topic = isTopic ? topicRows.find((t) => t.id === input.topicId) : undefined;
  if (isTopic && !topic) throw new Error("Mövzu seçilməyib");

  const examType = EXAM_TYPE_OF[kind.key];
  const items = generateExam({
    sections,
    examType,
    topics: topicRows
      .filter((t) => !isTopic || t.id === topic!.id)
      .map((t) => ({
        id: t.id,
        curriculumOrder: t.curriculumOrder,
        dimFrequency: t.dimFrequency,
        examTypes: isTopic ? ["movzu"] : t.examTypes.split(",").map((x) => x.trim()),
      })),
    tasks: taskRows.map((t) => ({ ...t, hasOptions: Boolean(t.options) })),
    usage,
    preset: input.preset,
  });
  if (!items.length) throw new Error("Bu sınaq üçün bankda uyğun sual yoxdur");

  const [last] = await db.select({ n: max(exams.number) }).from(exams).where(eq(exams.blueprintKey, kind.blueprintKey));
  const number = (last?.n ?? 0) + 1;
  const id = `${ID_PREFIX[kind.key] ?? kind.key}-${number}`;
  const title = input.title?.trim() || (isTopic ? `Mövzu sınağı: ${topic!.name} №${number}` : `${TITLE[kind.key] ?? kind.name} №${number}`);
  await db.insert(exams).values({
    id,
    blueprintKey: kind.blueprintKey,
    kind: kind.key,
    topicId: topic?.id ?? null,
    number,
    title,
    durationMin: input.durationMin ?? DEFAULT_DURATION[kind.key] ?? 90,
    status: input.status ?? "passive",
    createdAt: new Date(),
  });
  await db.insert(examItems).values(items.map((i) => ({ examId: id, n: i.n, taskCode: i.code, format: i.format })));
  return { id, count: items.length };
}
