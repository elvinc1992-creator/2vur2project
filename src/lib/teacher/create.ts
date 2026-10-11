import "server-only";
import { and, count, eq, gte, inArray, isNull, lt, max } from "drizzle-orm";
import { db } from "@/db";
import {
  bankTasks,
  examKinds,
  teacherAccounts,
  teacherBalanceTx,
  teacherGroupMembers,
  teacherGroups,
  teacherTestGroups,
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

import { academicYear, TOPIC_COUNTS, topicCounts } from "./year";

export { academicYear };
export const TEACHER_KINDS = ["movzu", "buraxilis-9", "buraxilis-11", "qebul-11"] as const;
export type TeacherKind = (typeof TEACHER_KINDS)[number];
const DAY = 86_400_000;

export type CreateInput = {
  teacherId: string;
  groupIds: string[];
  kind: TeacherKind;
  /** Yalnız mövzu sınağı. */
  topicId?: number;
  questionCount?: number;
  mode: "paper" | "online";
  opensAt: Date;
  durationMin: number;
  shuffle: boolean;
  noRepeat: boolean;
};

export type CreateError = "limit" | "balance" | "empty" | "group" | "bank" | "topic" | "topic-used";
export type CreateResult = { ok: true; id: string; reused: number } | { ok: false; error: CreateError; need?: number };

/** Sınağın qiyməti (sınaq başına, şagird sayından asılı deyil): onlayn və kağız ayrıca (admin dəyişir). */
export async function priceOf(kind: string, mode: "paper" | "online") {
  const [k] = await db.select({ online: examKinds.teacherPrice, paper: examKinds.teacherPaperPrice }).from(examKinds).where(eq(examKinds.key, kind));
  return (mode === "online" ? k?.online : k?.paper) ?? 0;
}

/** Bu tədris ilində müəllimin mövzu sınağı yaratdığı mövzular. */
export async function usedTopicsThisYear(teacherId: string, now = Date.now()) {
  const y = academicYear(now);
  const rows = await db
    .select({ topicId: teacherTests.topicId })
    .from(teacherTests)
    .where(and(eq(teacherTests.teacherId, teacherId), eq(teacherTests.examKind, "movzu"), gte(teacherTests.createdAt, new Date(y.from)), lt(teacherTests.createdAt, new Date(y.to))));
  return new Set(rows.map((r) => r.topicId).filter((x): x is number => x !== null));
}

/**
 * Müəllim sınağı: imtahan növünün strukturu (exam_blueprint_sections — admin redaktə edir) və mövzu bölgüsü ilə və ya
 * (mövzu sınağı) seçilmiş mövzudan 15 / 20 / 25 sual. Sınaq bir neçə qrupa bağlana bilər — hər şagirdə bir variant.
 * "Təkrarlama" açıqdırsa, bu qruplara əvvəl verilmiş suallar seçilmir; yeni sual qalmayıbsa, ən köhnə istifadə
 * olunanlar götürülür (reused — müəllimə xəbərdarlıq). Onlayn sınağın qiyməti balansdan tutulur (sınaq başına).
 */
export async function createTeacherTest(input: CreateInput): Promise<CreateResult> {
  const groupIds = [...new Set(input.groupIds)];
  const groups = groupIds.length
    ? await db
        .select()
        .from(teacherGroups)
        .where(and(inArray(teacherGroups.id, groupIds), eq(teacherGroups.teacherId, input.teacherId)))
    : [];
  if (!groups.length || groups.length !== groupIds.length) return { ok: false, error: "group" };

  const isTopic = input.kind === "movzu";
  if (isTopic) {
    if (!input.topicId || !TOPIC_COUNTS.includes(input.questionCount as never)) return { ok: false, error: "topic" };
    if ((await usedTopicsThisYear(input.teacherId)).has(input.topicId)) return { ok: false, error: "topic-used" };
  }

  // Gündəlik limit (sual bankının kütləvi çıxarılmasının qarşısı)
  const [acc] = await db.select().from(teacherAccounts).where(eq(teacherAccounts.userId, input.teacherId));
  const [{ n: today }] = await db
    .select({ n: count() })
    .from(teacherTests)
    .where(and(eq(teacherTests.teacherId, input.teacherId), gte(teacherTests.createdAt, new Date(Date.now() - DAY))));
  if (today >= (acc?.dailyLimit ?? 10)) return { ok: false, error: "limit" };

  // Şagirdlər: seçilmiş qrupların üzvləri (bir neçə qrupda olan şagird bir dəfə)
  const memberRows = await db
    .select({ userId: teacherGroupMembers.userId })
    .from(teacherGroupMembers)
    .where(and(inArray(teacherGroupMembers.groupId, groupIds), isNull(teacherGroupMembers.leftAt)));
  const members = [...new Set(memberRows.map((m) => m.userId))];
  if (!members.length) return { ok: false, error: "empty" };
  const cost = await priceOf(input.kind, input.mode);
  if (cost > (acc?.balance ?? 0)) return { ok: false, error: "balance", need: cost };

  // Bu qruplara əvvəl verilmiş suallar: kod → ən son istifadə vaxtı (köhnə olan əvvəl təkrar götürülür)
  const used = input.noRepeat
    ? await db
        .select({ code: teacherTestItems.taskCode, at: max(teacherTests.createdAt) })
        .from(teacherTestItems)
        .innerJoin(teacherTests, eq(teacherTests.id, teacherTestItems.testId))
        .innerJoin(teacherTestGroups, eq(teacherTestGroups.testId, teacherTests.id))
        .where(inArray(teacherTestGroups.groupId, groupIds))
        .groupBy(teacherTestItems.taskCode)
    : [];
  // usage: istifadə olunmuşlar böyük çəki ilə (yenilər üstün), aralarında köhnələr əvvəl
  const oldest = Math.min(...used.map((u) => u.at?.getTime() ?? 0), Date.now());
  const usage = new Map(used.map((u) => [u.code, 1 + ((u.at?.getTime() ?? 0) - oldest) / (Date.now() - oldest + 1)]));

  const [sections, topicRows, taskRows] = await Promise.all([
    sectionsOf(input.kind, isTopic ? topicCounts(input.questionCount!) : undefined),
    db.select().from(topics),
    db
      .select({ code: bankTasks.code, topicId: bankTasks.topicId, format: bankTasks.format, answerValue: bankTasks.answerValue, options: bankTasks.options, correct: bankTasks.correctOption })
      .from(bankTasks),
  ]);
  if (isTopic && !topicRows.some((t) => t.id === input.topicId)) return { ok: false, error: "topic" };
  // Müəllim kitabçasında nömrələr 1-dən
  let next = 1;
  const numbered = sections.map((s) => {
    const x = { ...s, firstNo: next };
    next += s.count;
    return x;
  });
  const examType = EXAM_TYPE_OF[input.kind];
  const gen = (tasks: typeof taskRows) =>
    generateExam({
      sections: numbered,
      examType,
      topics: topicRows
        .filter((t) => !isTopic || t.id === input.topicId)
        .map((t) => ({
          id: t.id,
          curriculumOrder: t.curriculumOrder,
          dimFrequency: t.dimFrequency,
          examTypes: isTopic ? [examType] : t.examTypes.split(",").map((x) => x.trim()),
        })),
      tasks: tasks.filter((t) => t.format !== "closed" || t.correct).map((t) => ({ ...t, hasOptions: Boolean(t.options) })),
      usage,
    });
  // Əvvəl yalnız bu qruplara verilməmiş suallarla; bölmələr dolmursa — bütün baza (köhnə istifadə olunanlar sonda)
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
    number: (lastNo ?? 0) + 1,
    examKind: input.kind,
    topicId: isTopic ? input.topicId! : null,
    mode: input.mode,
    opensAt: input.opensAt,
    durationMin: input.durationMin,
    shuffle: input.shuffle,
    noRepeat: input.noRepeat,
    reused,
    charged: cost,
    createdAt: new Date(),
  });
  await db.insert(teacherTestGroups).values(groupIds.map((groupId) => ({ testId: id, groupId })));
  await db.insert(teacherTestItems).values(items.map((i) => ({ testId: id, n: i.n, taskCode: i.code, format: i.format })));
  await db.insert(teacherTestVariants).values(
    members.map((userId, k) => ({ testId: id, userId, letter: variants[k].letter, order: JSON.stringify(variants[k].order), maps: JSON.stringify(variants[k].maps) })),
  );
  if (cost > 0) {
    await db.update(teacherAccounts).set({ balance: (acc?.balance ?? 0) - cost }).where(eq(teacherAccounts.userId, input.teacherId));
    await db.insert(teacherBalanceTx).values({ teacherId: input.teacherId, amount: -cost, kind: "charge", testId: id, note: `${input.mode === "online" ? "Onlayn" : "Kağız"} sınaq №${(lastNo ?? 0) + 1}` });
  }
  return { ok: true, id, reused };
}

/** Struktur (müəllimə göstərilir; dəyişə bilməz): bölmələr, mövzu sayı, müddət, onlayn qiymət. */
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
    price: k?.teacherPrice ?? 0,
    paperPrice: k?.teacherPaperPrice ?? 0,
    topics: kind === "movzu" ? 1 : topicRows.filter((t) => t.examTypes.split(",").map((x) => x.trim()).includes(examType)).length,
  };
}
