import "server-only";
import { asc, count, eq, inArray } from "drizzle-orm";
import { db } from "@/db";
import { bankTasks, examItems, exams, topics } from "@/db/schema";
import { fitsFormat, type ItemFormat } from "@/lib/exams/generate";
import { EXAM_TYPE_OF } from "@/lib/exams/types";

export const STATUS_LABEL = { active: "Aktiv", passive: "Passiv", finished: "Bitib" } as const;
export const STATUS_TONE = { active: "bg-success-100 text-success-700", passive: "bg-navy-050 text-ink-muted", finished: "bg-warning-100 text-warning-700" };

export type PickTask = { code: string; body: string; used: number };
export type PickTopic = { id: number; name: string; tasks: PickTask[] };

/**
 * Əl ilə seçim üçün suallar: bölmə formatı → mövzular (tədris sırası) → yarayan suallar.
 * used — aktiv/passiv sınaqlarda neçə dəfə istifadə olunub (təkrar olmasın deyə admin görür).
 */
export async function pickLists(kind: string, topicId?: number): Promise<Record<ItemFormat, PickTopic[]>> {
  const examType = EXAM_TYPE_OF[kind];
  const [topicRows, taskRows, usageRows] = await Promise.all([
    db.select().from(topics).orderBy(asc(topics.curriculumOrder)),
    db
      .select({ code: bankTasks.code, topicId: bankTasks.topicId, format: bankTasks.format, answerValue: bankTasks.answerValue, options: bankTasks.options, body: bankTasks.body })
      .from(bankTasks)
      .orderBy(asc(bankTasks.sortOrder)),
    db
      .select({ code: examItems.taskCode, n: count() })
      .from(examItems)
      .innerJoin(exams, eq(exams.id, examItems.examId))
      .where(inArray(exams.status, ["active", "passive"]))
      .groupBy(examItems.taskCode),
  ]);
  const usage = new Map(usageRows.map((u) => [u.code, u.n]));
  const eligible = topicRows.filter((t) =>
    kind === "movzu" ? t.id === topicId : t.examTypes.split(",").map((x) => x.trim()).includes(examType),
  );
  const out = {} as Record<ItemFormat, PickTopic[]>;
  for (const f of ["closed", "coded", "written"] as const) {
    out[f] = eligible
      .map((t) => ({
        id: t.id,
        name: t.name,
        tasks: taskRows
          .filter((x) => x.topicId === t.id && fitsFormat({ ...x, hasOptions: Boolean(x.options) }, f))
          .map((x) => ({ code: x.code, body: x.body, used: usage.get(x.code) ?? 0 })),
      }))
      .filter((t) => t.tasks.length > 0);
  }
  return out;
}
