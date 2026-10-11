import "server-only";
import { and, count, eq, gte, isNull, max } from "drizzle-orm";
import { db } from "@/db";
import {
  bankTasks,
  examKinds,
  teacherAccounts,
  teacherBalanceTx,
  teacherGroupMembers,
  teacherGroups,
  teacherTestItems,
  teacherTests,
  teacherTestVariants,
  topics,
} from "@/db/schema";
import { sectionsOf } from "@/lib/exams/create";
import { generateExam } from "@/lib/exams/generate";
import { EXAM_TYPE_OF } from "@/lib/exams/types";
import type { Letter } from "@/lib/demo/content";
import { makeVariants } from "./variants";

export const ONLINE_PRICE = 1;
export const TEACHER_KINDS = ["buraxilis-9", "buraxilis-11", "qebul-11"] as const;
const DAY = 86_400_000;

export type CreateInput = {
  teacherId: string;
  groupId: string;
  mode: "paper" | "online";
  opensAt: Date;
  durationMin: number;
  shuffle: boolean;
  noRepeat: boolean;
};

export type CreateResult = { ok: true; id: string; reused: number } | { ok: false; error: "limit" | "balance" | "empty" | "group" | "bank"; need?: number };

/**
 * Müəllim sınağı: imtahan növünün strukturu (exam_blueprint_sections — admin redaktə edir) və mövzu bölgüsü ilə
 * suallar bazadan təsadüfi seçilir. "Təkrarlama" açıqdırsa, bu qrupa əvvəl verilmiş suallar seçilmir;
 * yeni sual qalmayıbsa, ən köhnə istifadə olunanlar götürülür (reused — müəllimə xəbərdarlıq).
 */
export async function createTeacherTest(input: CreateInput): Promise<CreateResult> {
  const [group] = await db
    .select()
    .from(teacherGroups)
    .where(and(eq(teacherGroups.id, input.groupId), eq(teacherGroups.teacherId, input.teacherId)));
  if (!group) return { ok: false, error: "group" };

  // Gündəlik limit (sual bankının kütləvi çıxarılmasının qarşısı)
  const [acc] = await db.select().from(teacherAccounts).where(eq(teacherAccounts.userId, input.teacherId));
  const [{ n: today }] = await db
    .select({ n: count() })
    .from(teacherTests)
    .where(and(eq(teacherTests.teacherId, input.teacherId), gte(teacherTests.createdAt, new Date(Date.now() - DAY))));
  if (today >= (acc?.dailyLimit ?? 10)) return { ok: false, error: "limit" };

  const members = await db
    .select({ userId: teacherGroupMembers.userId })
    .from(teacherGroupMembers)
    .where(and(eq(teacherGroupMembers.groupId, group.id), isNull(teacherGroupMembers.leftAt)));
  if (!members.length) return { ok: false, error: "empty" };
  const cost = input.mode === "online" ? members.length * ONLINE_PRICE : 0;
  if (cost > (acc?.balance ?? 0)) return { ok: false, error: "balance", need: cost };

  // Bu qrupa əvvəl verilmiş suallar: kod → ən son istifadə vaxtı (köhnə olan əvvəl təkrar götürülür)
  const used = input.noRepeat
    ? await db
        .select({ code: teacherTestItems.taskCode, at: max(teacherTests.createdAt) })
        .from(teacherTestItems)
        .innerJoin(teacherTests, eq(teacherTests.id, teacherTestItems.testId))
        .where(eq(teacherTests.groupId, group.id))
        .groupBy(teacherTestItems.taskCode)
    : [];
  // usage: istifadə olunmuşlar böyük çəki ilə (yenilər üstün), aralarında köhnələr əvvəl
  const oldest = Math.min(...used.map((u) => u.at?.getTime() ?? 0), Date.now());
  const usage = new Map(used.map((u) => [u.code, 1 + ((u.at?.getTime() ?? 0) - oldest) / (Date.now() - oldest + 1)]));

  const [sections, topicRows, taskRows] = await Promise.all([
    sectionsOf(group.examKind),
    db.select().from(topics),
    db
      .select({ code: bankTasks.code, topicId: bankTasks.topicId, format: bankTasks.format, answerValue: bankTasks.answerValue, options: bankTasks.options, correct: bankTasks.correctOption })
      .from(bankTasks),
  ]);
  // Müəllim kitabçasında nömrələr 1-dən
  let next = 1;
  const numbered = sections.map((s) => {
    const x = { ...s, firstNo: next };
    next += s.count;
    return x;
  });
  const examType = EXAM_TYPE_OF[group.examKind];
  const gen = (tasks: typeof taskRows) =>
    generateExam({
      sections: numbered,
      examType,
      topics: topicRows.map((t) => ({ id: t.id, curriculumOrder: t.curriculumOrder, dimFrequency: t.dimFrequency, examTypes: t.examTypes.split(",").map((x) => x.trim()) })),
      tasks: tasks.filter((t) => t.format !== "closed" || t.correct).map((t) => ({ ...t, hasOptions: Boolean(t.options) })),
      usage,
    });
  // Əvvəl yalnız bu qrupa verilməmiş suallarla; bölmələr dolmursa — bütün baza (köhnə istifadə olunanlar sonda)
  const total = numbered.reduce((s, x) => s + x.count, 0);
  let items = usage.size ? gen(taskRows.filter((t) => !usage.has(t.code))) : [];
  if (items.length < total) items = gen(taskRows);
  if (!items.length) return { ok: false, error: "bank" };
  const reused = items.filter((i) => usage.has(i.code)).length;

  const byCode = new Map(taskRows.map((t) => [t.code, t]));
  const variantItems = items.map((i) => ({ n: i.n, format: i.format, correct: (byCode.get(i.code)?.correct as Letter | null) ?? null }));
  const variants = makeVariants(variantItems, members.length, input.shuffle);

  const [{ n: lastNo }] = await db.select({ n: max(teacherTests.number) }).from(teacherTests).where(eq(teacherTests.teacherId, input.teacherId));
  const id = `t${Date.now().toString(36)}${Math.random().toString(36).slice(2, 6)}`;
  await db.insert(teacherTests).values({
    id,
    teacherId: input.teacherId,
    groupId: group.id,
    number: (lastNo ?? 0) + 1,
    examKind: group.examKind,
    mode: input.mode,
    opensAt: input.opensAt,
    durationMin: input.durationMin,
    shuffle: input.shuffle,
    noRepeat: input.noRepeat,
    reused,
    charged: cost,
    createdAt: new Date(),
  });
  await db.insert(teacherTestItems).values(items.map((i) => ({ testId: id, n: i.n, taskCode: i.code, format: i.format })));
  await db.insert(teacherTestVariants).values(
    members.map((m, k) => ({ testId: id, userId: m.userId, letter: variants[k].letter, order: JSON.stringify(variants[k].order), maps: JSON.stringify(variants[k].maps) })),
  );
  if (cost > 0) {
    await db.update(teacherAccounts).set({ balance: (acc?.balance ?? 0) - cost }).where(eq(teacherAccounts.userId, input.teacherId));
    await db.insert(teacherBalanceTx).values({ teacherId: input.teacherId, amount: -cost, kind: "charge", testId: id, note: `Onlayn sınaq: ${members.length} şagird × ${ONLINE_PRICE} AZN` });
  }
  return { ok: true, id, reused };
}

/** Struktur (müəllimə göstərilir; dəyişə bilməz): bölmələr, mövzu sayı, müddət. */
export async function structureOf(kind: string) {
  const [sections, [k], topicRows] = await Promise.all([
    sectionsOf(kind),
    db.select().from(examKinds).where(eq(examKinds.key, kind)),
    db.select({ id: topics.id, examTypes: topics.examTypes }).from(topics),
  ]);
  const examType = EXAM_TYPE_OF[kind];
  return {
    sections,
    total: sections.reduce((s, x) => s + x.count, 0),
    durationMin: k?.durationMin ?? 90,
    name: k?.name ?? kind,
    topics: topicRows.filter((t) => t.examTypes.split(",").map((x) => x.trim()).includes(examType)).length,
  };
}
