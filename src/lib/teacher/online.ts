import "server-only";
import { and, eq, isNull } from "drizzle-orm";
import { db } from "@/db";
import {
  teacherAccounts,
  teacherBalanceTx,
  teacherTestAnswers,
  teacherTestAttempts,
  teacherTests,
  teacherTestVariants,
} from "@/db/schema";
import { LETTERS, type Letter } from "@/lib/demo/content";
import { normalizeCoded } from "@/lib/exams/grade";
import type { ExamQuestion } from "@/lib/exams/types";
import { itemsOf, saveResults, type FullItem } from "./data";
import type { Graded, Variant } from "./variants";

// Onlayn müəllim sınağı: açılandan 24 saat əlçatandır; şagirdin vaxtı başladığı andan serverdə gedir və dayanmır
// (səhifəni bağlasa da). Cavablar dərhal saxlanılır. Sınaq bağlananda heç kim başlamayıbsa, məbləğ balansa qaytarılır.

const DAY = 86_400_000;
export type TestRow = typeof teacherTests.$inferSelect;

export const closesAt = (t: TestRow) => t.opensAt.getTime() + DAY;

export async function variantOf(testId: string, userId: string): Promise<Variant | null> {
  const [v] = await db
    .select()
    .from(teacherTestVariants)
    .where(and(eq(teacherTestVariants.testId, testId), eq(teacherTestVariants.userId, userId)));
  return v ? { letter: v.letter, order: JSON.parse(v.order), maps: JSON.parse(v.maps) } : null;
}

export async function attemptOf(testId: string, userId: string) {
  const [a] = await db
    .select()
    .from(teacherTestAttempts)
    .where(and(eq(teacherTestAttempts.testId, testId), eq(teacherTestAttempts.userId, userId)));
  return a ?? null;
}

/** Şagirdin bitmə anı: başlanğıc + müddət, amma sınaq bağlanandan gec deyil. */
export const deadlineOf = (t: TestRow, startedAt: Date) => Math.min(startedAt.getTime() + t.durationMin * 60_000, closesAt(t));

/** Şagirdə göstərilən suallar: variantın sırası (1-dən), qapalı variantlar yerləri dəyişdirilmiş — cavabsız. */
export function questionsFor(items: FullItem[], v: Variant): ExamQuestion[] {
  return v.order.map((n, i) => {
    const it = items.find((x) => x.n === n)!;
    const map = v.maps[n];
    return {
      n: i + 1,
      code: it.code,
      format: it.format,
      topic: it.topic,
      topicName: it.topicName,
      type: it.topicName,
      text: it.body,
      options: it.options && map ? (Object.fromEntries(LETTERS.map((l) => [l, it.options![map[l]]])) as Record<Letter, string>) : (it.options ?? undefined),
      imageUrl: it.imageUrl,
      imageAlt: it.imageAlt,
      ref: "",
    };
  });
}

/** Cavab (göstərilən nömrə ilə) → əsas n və qiymət. Qapalı: göstərilən hərf orijinala çevrilir. */
export function gradeOne(item: FullItem, v: Variant, value: string): Graded {
  if (!value) return { n: item.n, given: null, score: item.format === "written" ? null : 0 };
  if (item.format === "closed") {
    const original = v.maps[item.n]?.[value as Letter] ?? (value as Letter);
    return { n: item.n, given: original, score: original === item.correct ? 1 : 0 };
  }
  if (item.format === "coded") {
    const a = normalizeCoded(value);
    return { n: item.n, given: value, score: a !== null && item.answer != null && a === normalizeCoded(item.answer) ? 1 : 0 };
  }
  // Yazılı: mətn saxlanılır, balı müəllim verir
  return { n: item.n, given: value.slice(0, 2000), score: null };
}

/** Şagirdin cavabları göstərilən nömrə ilə (cavab kartını bərpa etmək üçün). */
export async function shownAnswers(testId: string, userId: string, v: Variant) {
  const rows = await db
    .select()
    .from(teacherTestAnswers)
    .where(and(eq(teacherTestAnswers.testId, testId), eq(teacherTestAnswers.userId, userId)));
  const out: Record<string, string> = {};
  v.order.forEach((n, i) => {
    const r = rows.find((x) => x.n === n);
    if (!r?.given) return;
    const map = v.maps[n];
    out[i + 1] = map ? (LETTERS.find((l) => map[l] === r.given) ?? r.given) : r.given;
  });
  return out;
}

/** Cəhdi bağlayır: bütün cavablar qiymətləndirilir, şagirdin zəif mövzu təhlilinə yazılır. */
export async function finishAttempt(t: TestRow, userId: string, at: number) {
  const a = await attemptOf(t.id, userId);
  if (!a || a.finishedAt) return;
  await db
    .update(teacherTestAttempts)
    .set({ finishedAt: new Date(at) })
    .where(and(eq(teacherTestAttempts.testId, t.id), eq(teacherTestAttempts.userId, userId), isNull(teacherTestAttempts.finishedAt)));
  const [items, rows] = await Promise.all([
    itemsOf(t.id),
    db.select().from(teacherTestAnswers).where(and(eq(teacherTestAnswers.testId, t.id), eq(teacherTestAnswers.userId, userId))),
  ]);
  const graded: Graded[] = items.map((it) => {
    const r = rows.find((x) => x.n === it.n);
    return { n: it.n, given: r?.given ?? null, score: r ? r.score : it.format === "written" ? null : 0 };
  });
  await saveResults(t.id, userId, items, graded, new Date(at));
}

/**
 * Sınaq bağlanandan sonra (idempotent): vaxtı bitmiş cəhdlər bağlanır; qiymət sınaq başına olduğu üçün heç bir şagird
 * başlamayıbsa, məbləğ balansa qaytarılır (bir dəfə). Müəllimin sınaq səhifəsi və şagird sorğuları çağırır.
 */
export async function settleTest(t: TestRow, now = Date.now()) {
  if (t.mode !== "online") return;
  const attempts = await db.select().from(teacherTestAttempts).where(eq(teacherTestAttempts.testId, t.id));
  for (const a of attempts) if (!a.finishedAt && now >= deadlineOf(t, a.startedAt)) await finishAttempt(t, a.userId, deadlineOf(t, a.startedAt));
  if (now < closesAt(t) || t.refundedAt) return;
  // Eyni anda iki sorğu — geri qaytarma bir dəfə (refundedAt şərti ilə)
  const done = await db
    .update(teacherTests)
    .set({ refundedAt: new Date(now) })
    .where(and(eq(teacherTests.id, t.id), isNull(teacherTests.refundedAt)))
    .returning({ id: teacherTests.id });
  if (!done.length || attempts.length > 0 || t.charged <= 0) return;
  const [acc] = await db.select().from(teacherAccounts).where(eq(teacherAccounts.userId, t.teacherId));
  await db.update(teacherAccounts).set({ balance: (acc?.balance ?? 0) + t.charged }).where(eq(teacherAccounts.userId, t.teacherId));
  await db.insert(teacherBalanceTx).values({ teacherId: t.teacherId, amount: t.charged, kind: "refund", testId: t.id, note: `Sınaq №${t.number}: heç bir şagird başlamayıb` });
}
