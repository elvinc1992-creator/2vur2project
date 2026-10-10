import "server-only";
import { and, count, countDistinct, desc, eq, gte, like, or, sql, sum } from "drizzle-orm";
import { db } from "@/db";
import { bankTasks, exams, payments, topics, userAnswers, users, userState } from "@/db/schema";

// Admin paneli üçün oxuma sorğuları. Abunə vəziyyəti istifadəçinin vəziyyətindədir (user_state.data JSON).

const DAY = 86_400_000;
const today = () => new Intl.DateTimeFormat("en-CA", { timeZone: "Asia/Baku" }).format(new Date());

const subStatus = sql<string | null>`json_extract(${userState.data}, '$.sub.status')`;
const subTier = sql<string | null>`json_extract(${userState.data}, '$.sub.tier')`;
const subPeriod = sql<string | null>`json_extract(${userState.data}, '$.sub.period')`;
const subEnd = sql<string | null>`json_extract(${userState.data}, '$.sub.periodEnd')`;

export type SubRow = {
  userId: string;
  name: string;
  surname: string | null;
  email: string | null;
  username: string | null;
  tier: string;
  period: string;
  status: string;
  periodEnd: string;
  paid: number;
};

/** Hazırda girişi olan abunəçilər (ləğv edilib, amma dövrü bitməyənlər də). */
export async function listSubscribers(): Promise<SubRow[]> {
  const rows = await db
    .select({
      userId: users.id,
      name: users.name,
      surname: users.surname,
      email: users.email,
      username: users.username,
      status: subStatus,
      tier: subTier,
      period: subPeriod,
      periodEnd: subEnd,
    })
    .from(userState)
    .innerJoin(users, eq(users.id, userState.userId))
    .where(and(sql`${subStatus} in ('active', 'canceled')`, sql`${subEnd} >= ${today()}`));
  const paid = await db.select({ userId: payments.userId, s: sum(payments.amount) }).from(payments).groupBy(payments.userId);
  const paidBy = new Map(paid.map((p) => [p.userId, Number(p.s ?? 0)]));
  return rows
    .map((r) => ({
      ...r,
      tier: r.tier ?? "premium",
      period: r.period ?? "month",
      status: r.status ?? "active",
      periodEnd: r.periodEnd ?? "",
      paid: paidBy.get(r.userId) ?? 0,
    }))
    .sort((a, b) => b.periodEnd.localeCompare(a.periodEnd));
}

export async function overview() {
  const now = Date.now();
  const [[u], [u7], [u30], [active7], [ans7], subs, [rev], [rev30], byMonth, byKind, formats, [examCount], regs] = await Promise.all([
    db.select({ n: count() }).from(users),
    db.select({ n: count() }).from(users).where(gte(users.createdAt, new Date(now - 7 * DAY))),
    db.select({ n: count() }).from(users).where(gte(users.createdAt, new Date(now - 30 * DAY))),
    db.select({ n: countDistinct(userAnswers.userId) }).from(userAnswers).where(gte(userAnswers.answeredAt, new Date(now - 7 * DAY))),
    db.select({ n: count() }).from(userAnswers).where(gte(userAnswers.answeredAt, new Date(now - 7 * DAY))),
    listSubscribers(),
    db.select({ s: sum(payments.amount), n: count() }).from(payments),
    db.select({ s: sum(payments.amount) }).from(payments).where(gte(payments.createdAt, new Date(now - 30 * DAY))),
    revenueByMonth(),
    db.select({ kind: payments.kind, s: sum(payments.amount), n: count() }).from(payments).groupBy(payments.kind),
    db.select({ format: bankTasks.format, n: count() }).from(bankTasks).groupBy(bankTasks.format),
    db.select({ n: count() }).from(exams).where(eq(exams.status, "published")),
    db
      .select({ day: sql<string>`date(${users.createdAt} / 1000, 'unixepoch')`, n: count() })
      .from(users)
      .where(gte(users.createdAt, new Date(now - 30 * DAY)))
      .groupBy(sql`date(${users.createdAt} / 1000, 'unixepoch')`),
  ]);
  return {
    users: u.n,
    new7: u7.n,
    new30: u30.n,
    active7: active7.n,
    answers7: ans7.n,
    subs: {
      total: subs.length,
      pro: subs.filter((s) => s.tier === "pro").length,
      premium: subs.filter((s) => s.tier === "premium").length,
      yearly: subs.filter((s) => s.period === "year").length,
      canceled: subs.filter((s) => s.status === "canceled").length,
    },
    revenue: { total: Number(rev.s ?? 0), count: rev.n, last30: Number(rev30.s ?? 0), byMonth, byKind },
    questions: Object.fromEntries(formats.map((f) => [f.format, f.n])) as Record<string, number>,
    exams: examCount.n,
    registrations: regs,
  };
}

/** Son 12 ayın qazancı (YYYY-MM). */
export async function revenueByMonth() {
  return db
    .select({ month: sql<string>`strftime('%Y-%m', ${payments.createdAt} / 1000, 'unixepoch')`, s: sum(payments.amount), n: count() })
    .from(payments)
    .groupBy(sql`strftime('%Y-%m', ${payments.createdAt} / 1000, 'unixepoch')`)
    .orderBy(desc(sql`strftime('%Y-%m', ${payments.createdAt} / 1000, 'unixepoch')`))
    .limit(12);
}

export async function listPayments(limit = 100) {
  return db
    .select({ p: payments, name: users.name, surname: users.surname, email: users.email, username: users.username })
    .from(payments)
    .innerJoin(users, eq(users.id, payments.userId))
    .orderBy(desc(payments.createdAt))
    .limit(limit);
}

export const PAGE_SIZE = 50;

export async function listUsers(q: string, page: number) {
  const where = q
    ? or(like(users.name, `%${q}%`), like(users.surname, `%${q}%`), like(users.email, `%${q}%`), like(users.username, `%${q}%`))
    : undefined;
  const [rows, [total]] = await Promise.all([
    db
      .select({
        u: users,
        status: subStatus,
        tier: subTier,
        periodEnd: subEnd,
        answers: sql<number>`(select count(*) from user_answers a where a.user_id = ${users.id})`,
      })
      .from(users)
      .leftJoin(userState, eq(userState.userId, users.id))
      .where(where)
      .orderBy(desc(users.createdAt))
      .limit(PAGE_SIZE)
      .offset((page - 1) * PAGE_SIZE),
    db.select({ n: count() }).from(users).where(where),
  ]);
  return { rows, total: total.n };
}

export async function topicOptions() {
  return db.select({ id: topics.id, slug: topics.slug, name: topics.name }).from(topics).orderBy(topics.curriculumOrder);
}

/** Son 30 günün sırası (boş günlər — 0). */
export function last30Days(rows: Array<{ day: string; n: number }>) {
  const now = Date.now();
  return Array.from({ length: 30 }, (_, i) => {
    const d = new Date(now - (29 - i) * DAY).toISOString().slice(0, 10);
    return { k: d.slice(8, 10), v: rows.find((r) => r.day === d)?.n ?? 0 };
  });
}
