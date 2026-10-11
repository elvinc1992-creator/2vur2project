import "server-only";
import { and, asc, desc, eq, inArray, isNull, like } from "drizzle-orm";
import { db } from "@/db";
import {
  examKinds,
  teacherGroupMembers,
  teacherGroups,
  teacherTestAnswers,
  teacherTestAttempts,
  teacherTestEvents,
  teacherTestItems,
  teacherTests,
  teacherTestVariants,
  topics,
  userAnswers,
  userTopicStats,
  users,
} from "@/db/schema";
import { listBankTasks } from "@/lib/bank/tasks";
import type { Letter } from "@/lib/demo/content";
import { refreshWeakTopics } from "@/lib/weak/data";
import type { LetterMap } from "@/lib/weak/spread";
import { percentOf, type Graded, type TestItem, type Variant } from "./variants";

// Müəllim panelinin məlumatı. Hər sorğu müəllimin özünə məhdudlaşdırılır (teacherId) — başqa müəllimin
// qrupu, sınağı və şagirdi görünmür. Suallar yalnız sınağın çap faylında və cavab açarında göstərilir.

export const kindName = async (key: string) => (await db.select({ name: examKinds.name }).from(examKinds).where(eq(examKinds.key, key)))[0]?.name ?? key;

export const fullName = (u: { name: string; surname: string | null }) => `${u.name}${u.surname ? ` ${u.surname}` : ""}`;

export async function groupsOf(teacherId: string) {
  const groups = await db.select().from(teacherGroups).where(eq(teacherGroups.teacherId, teacherId)).orderBy(asc(teacherGroups.createdAt));
  const ids = groups.map((g) => g.id);
  const members = ids.length
    ? await db
        .select({ groupId: teacherGroupMembers.groupId, userId: teacherGroupMembers.userId })
        .from(teacherGroupMembers)
        .where(and(inArray(teacherGroupMembers.groupId, ids), isNull(teacherGroupMembers.leftAt)))
    : [];
  return groups.map((g) => ({ ...g, members: members.filter((m) => m.groupId === g.id).map((m) => m.userId) }));
}

export async function ownGroup(teacherId: string, groupId: string) {
  const [g] = await db.select().from(teacherGroups).where(and(eq(teacherGroups.id, groupId), eq(teacherGroups.teacherId, teacherId)));
  return g ?? null;
}

export async function membersOf(groupId: string) {
  return db
    .select({ id: users.id, name: users.name, surname: users.surname, email: users.email, joinedAt: teacherGroupMembers.joinedAt })
    .from(teacherGroupMembers)
    .innerJoin(users, eq(users.id, teacherGroupMembers.userId))
    .where(and(eq(teacherGroupMembers.groupId, groupId), isNull(teacherGroupMembers.leftAt)))
    .orderBy(asc(users.name), asc(users.surname));
}

export async function testsOf(teacherId: string, groupId?: string) {
  return db
    .select({ t: teacherTests, group: teacherGroups.name })
    .from(teacherTests)
    .innerJoin(teacherGroups, eq(teacherGroups.id, teacherTests.groupId))
    .where(and(eq(teacherTests.teacherId, teacherId), groupId ? eq(teacherTests.groupId, groupId) : undefined))
    .orderBy(desc(teacherTests.createdAt));
}

export async function ownTest(teacherId: string, testId: string) {
  const [t] = await db.select().from(teacherTests).where(and(eq(teacherTests.id, testId), eq(teacherTests.teacherId, teacherId)));
  return t ?? null;
}

export type FullItem = TestItem & {
  code: string;
  body: string;
  options: Record<Letter, string> | null;
  imageUrl: string | null;
  imageAlt: string | null;
  topic: string;
  topicName: string;
  solution: string;
};

/** Sınağın sualları (əsas sıra) — bankdan mətn, variantlar, cavab. Yalnız müəllimə (çap, açar) və onlayn şagirdə (cavabsız). */
export async function itemsOf(testId: string): Promise<FullItem[]> {
  const [rows, bank] = await Promise.all([
    db.select().from(teacherTestItems).where(eq(teacherTestItems.testId, testId)).orderBy(asc(teacherTestItems.n)),
    listBankTasks(),
  ]);
  const byCode = new Map(bank.map((b) => [b.code, b]));
  return rows.map((r) => {
    const b = byCode.get(r.taskCode);
    return {
      n: r.n,
      format: r.format,
      code: r.taskCode,
      correct: b?.correct ?? null,
      answer: r.format === "coded" ? (b?.answer ?? null) : null,
      body: b?.body ?? "",
      options: b?.options ?? null,
      imageUrl: b?.imageUrl ?? null,
      imageAlt: b?.imageAlt ?? null,
      topic: b?.topicSlug ?? "",
      topicName: b?.topicName ?? "",
      solution: b?.solution ?? "",
    };
  });
}

export type StudentVariant = Variant & { userId: string; name: string };

/** Variantlar şagird adlarına görə (kitabça və kartlar eyni sırada). */
export async function variantsOf(testId: string): Promise<StudentVariant[]> {
  const rows = await db
    .select({ v: teacherTestVariants, name: users.name, surname: users.surname })
    .from(teacherTestVariants)
    .innerJoin(users, eq(users.id, teacherTestVariants.userId))
    .where(eq(teacherTestVariants.testId, testId))
    .orderBy(asc(users.name), asc(users.surname));
  return rows.map(({ v, name, surname }) => ({
    userId: v.userId,
    name: fullName({ name, surname }),
    letter: v.letter,
    order: JSON.parse(v.order) as number[],
    maps: JSON.parse(v.maps) as Record<number, LetterMap>,
  }));
}

export async function answersOf(testId: string) {
  return db.select().from(teacherTestAnswers).where(eq(teacherTestAnswers.testId, testId));
}

/**
 * Nəticələrin yazılması: teacher_test_answers + user_answers (şagirdin şəxsi zəif mövzu təhlili) və zəif mövzular yenidən
 * hesablanır. Yenidən yazılanda əvvəlki sətirlər əvəz olunur (təkrar sayılmır).
 */
export async function saveResults(testId: string, userId: string, items: FullItem[], graded: Graded[], answeredAt = new Date()) {
  await db.delete(teacherTestAnswers).where(and(eq(teacherTestAnswers.testId, testId), eq(teacherTestAnswers.userId, userId)));
  if (graded.length) {
    await db.insert(teacherTestAnswers).values(graded.map((g) => ({ testId, userId, n: g.n, given: g.given, score: g.score, updatedAt: answeredAt })));
  }
  await db.delete(userAnswers).where(and(eq(userAnswers.userId, userId), like(userAnswers.questionRef, `t:${testId}:%`)));
  const rows = graded
    .filter((g) => g.score !== null && (g.given !== null || items.find((i) => i.n === g.n)?.format === "written"))
    .map((g) => {
      const it = items.find((i) => i.n === g.n)!;
      return {
        userId,
        source: "exam" as const,
        questionRef: `t:${testId}:${it.code}`,
        correct: (g.score ?? 0) >= 1,
        answeredAt,
        topicSlug: it.topic || null,
        chosen: g.given,
        examId: `t:${testId}`,
      };
    });
  if (rows.length) await db.insert(userAnswers).values(rows);
  try {
    await refreshWeakTopics(userId, [...new Set(items.map((i) => i.topic).filter(Boolean))]);
  } catch (e) {
    console.error("[muellim] zəif mövzular", e);
  }
}

/* ---------------- Analitika ---------------- */

/** Şagirdin sınaq faizi (bütün suallar üzrə; yazılı — müəllimin balı). */
export function studentPercents(answers: Array<{ userId: string; score: number | null }>, total: number) {
  const by = new Map<string, number[]>();
  for (const a of answers) by.set(a.userId, [...(by.get(a.userId) ?? []), a.score ?? 0]);
  return new Map([...by].map(([u, s]) => [u, percentOf(s.map((score) => ({ score })), total)]));
}

/** Qrupun sınaqları üzrə nəticələr: test → (şagird → faiz). */
export async function groupResults(teacherId: string, groupId: string) {
  const tests = (await testsOf(teacherId, groupId)).map((x) => x.t).reverse();
  const ids = tests.map((t) => t.id);
  const [answers, items] = await Promise.all([
    ids.length ? db.select().from(teacherTestAnswers).where(inArray(teacherTestAnswers.testId, ids)) : [],
    ids.length ? db.select({ testId: teacherTestItems.testId, n: teacherTestItems.n }).from(teacherTestItems).where(inArray(teacherTestItems.testId, ids)) : [],
  ]);
  return tests.map((t) => {
    const total = items.filter((i) => i.testId === t.id).length;
    const mine = answers.filter((a) => a.testId === t.id);
    const per = studentPercents(mine, total);
    const avg = per.size ? Math.round([...per.values()].reduce((s, v) => s + v, 0) / per.size) : null;
    return { test: t, per, avg };
  });
}

/**
 * Qrup üzrə zəif mövzular: saytın zəif mövzu sistemi (user_topic_stats.mastery) — qrup üzvlərinin orta mənimsəməsi,
 * zəifdən güclüyə. Yalnız mövzu adı və faiz (suallar göstərilmir).
 */
export async function groupWeakTopics(memberIds: string[]) {
  if (!memberIds.length) return [];
  const rows = await db
    .select({ topic: topics.name, mastery: userTopicStats.mastery })
    .from(userTopicStats)
    .innerJoin(topics, eq(topics.id, userTopicStats.topicId))
    .where(inArray(userTopicStats.userId, memberIds));
  const by = new Map<string, number[]>();
  for (const r of rows) by.set(r.topic, [...(by.get(r.topic) ?? []), r.mastery]);
  return [...by]
    .map(([topic, m]) => ({ topic, pct: Math.round((m.reduce((s, x) => s + x, 0) / m.length) * 100), n: m.length }))
    .sort((a, b) => a.pct - b.pct);
}

/** Sınaq üzrə suallar: düz cavab faizi və ən çox seçilən səhv variant (orijinal hərf); nömrə — əsas sıra. */
export function questionStats(items: FullItem[], answers: Array<{ n: number; given: string | null; score: number | null }>) {
  return items.map((it) => {
    const mine = answers.filter((a) => a.n === it.n);
    const pct = mine.length ? Math.round((mine.reduce((s, a) => s + (a.score ?? 0), 0) / mine.length) * 100) : null;
    const wrong = new Map<string, number>();
    for (const a of mine) if (a.given && (a.score ?? 0) < 1 && it.format === "closed") wrong.set(a.given, (wrong.get(a.given) ?? 0) + 1);
    const top = [...wrong].sort((a, b) => b[1] - a[1])[0];
    return { n: it.n, format: it.format, topicName: it.topicName, pct, wrong: top ? { letter: top[0], share: Math.round((top[1] / mine.length) * 100) } : null };
  });
}

export async function attemptsOf(testId: string) {
  return db.select().from(teacherTestAttempts).where(eq(teacherTestAttempts.testId, testId));
}

export async function eventsOf(testId: string) {
  return db.select().from(teacherTestEvents).where(eq(teacherTestEvents.testId, testId));
}

/** Şagirdin qrupları (şagird tərəfi). */
export async function groupsOfStudent(userId: string) {
  return db
    .select({ g: teacherGroups, teacher: users.name, teacherSurname: users.surname })
    .from(teacherGroupMembers)
    .innerJoin(teacherGroups, eq(teacherGroups.id, teacherGroupMembers.groupId))
    .innerJoin(users, eq(users.id, teacherGroups.teacherId))
    .where(and(eq(teacherGroupMembers.userId, userId), isNull(teacherGroupMembers.leftAt)));
}

/** Şagirdin onlayn sınaqları (variantı olan). */
export async function onlineTestsOfStudent(userId: string) {
  return db
    .select({ t: teacherTests, group: teacherGroups.name })
    .from(teacherTestVariants)
    .innerJoin(teacherTests, eq(teacherTests.id, teacherTestVariants.testId))
    .innerJoin(teacherGroups, eq(teacherGroups.id, teacherTests.groupId))
    .where(and(eq(teacherTestVariants.userId, userId), eq(teacherTests.mode, "online")))
    .orderBy(desc(teacherTests.opensAt));
}
