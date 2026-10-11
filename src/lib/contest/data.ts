import "server-only";
import { and, asc, count, desc, eq, inArray, ne } from "drizzle-orm";
import { cache } from "react";
import { db } from "@/db";
import { contestPrizes, contestRegistrations, contestResults, contests } from "@/db/schema";
import { firstPrize, groupRanking, shortName } from "./rules";

// Yarışın oxunması: cari yarış, mükafatlar, qeydiyyat sayı, istifadəçinin qeydiyyatı, ictimai reytinq.

export type ContestRow = typeof contests.$inferSelect;
export type PrizeRow = typeof contestPrizes.$inferSelect;
export type RegistrationRow = typeof contestRegistrations.$inferSelect;

/** Saytda göstərilən yarış: qaralama olmayan, ən son başlayan. */
export const currentContest = cache(async (): Promise<ContestRow | null> => {
  const [c] = await db.select().from(contests).where(ne(contests.status, "draft")).orderBy(desc(contests.startAt)).limit(1);
  return c ?? null;
});

export const contestBySlug = cache(async (slug: string): Promise<ContestRow | null> => {
  const [c] = await db.select().from(contests).where(eq(contests.slug, slug));
  return c ?? null;
});

export const contestById = cache(async (id: string): Promise<ContestRow | null> => {
  const [c] = await db.select().from(contests).where(eq(contests.id, id));
  return c ?? null;
});

export const prizesOf = cache(async (contestId: string) =>
  db.select().from(contestPrizes).where(eq(contestPrizes.contestId, contestId)).orderBy(asc(contestPrizes.placeFrom)),
);

/** Aktiv qeydiyyatların sayı (passivlər — admin deaktiv edib — sayılmır). */
export const registrationCount = cache(async (contestId: string) => {
  const [r] = await db
    .select({ n: count() })
    .from(contestRegistrations)
    .where(and(eq(contestRegistrations.contestId, contestId), eq(contestRegistrations.status, "active")));
  return r?.n ?? 0;
});

export async function registrationOf(contestId: string, userId: string): Promise<RegistrationRow | null> {
  const [r] = await db
    .select()
    .from(contestRegistrations)
    .where(and(eq(contestRegistrations.contestId, contestId), eq(contestRegistrations.userId, userId)));
  return r ?? null;
}

/** Mükafatlar (1-ci yer — fond artımı nəzərə alınmaqla) və ümumi fond. */
export function prizeView(c: ContestRow, prizes: PrizeRow[], regs: number) {
  const out = prizes.map((p) =>
    p.placeFrom === 1 && p.placeTo === 1 ? { ...p, amount: firstPrize(p.amount, regs, c.boostThreshold, c.boostFirstPrize) } : p,
  );
  const base = prizes.find((p) => p.placeFrom === 1 && p.placeTo === 1)?.amount ?? 0;
  const boosted = out.find((p) => p.placeFrom === 1 && p.placeTo === 1)?.amount ?? 0;
  return { prizes: out, fund: c.prizeFund + (boosted - base), boosted: boosted !== base };
}

export type Leaderboard = {
  students: Array<{ place: number; name: string; school: string; region: string; score: number }>;
  schools: Array<{ key: string; region: string; n: number; avg: number }>;
  regions: Array<{ key: string; n: number; avg: number }>;
};

/** İctimai reytinq (nəticələr hesablanandan sonra): şagirdlər — qısaldılmış ad; məktəb və rayon — orta bal (≥3 iştirakçı). */
export const leaderboard = cache(async (contestId: string, top = 50): Promise<Leaderboard> => {
  const rows = await db
    .select({ r: contestResults, first: contestRegistrations.firstName, last: contestRegistrations.lastName, school: contestRegistrations.school, region: contestRegistrations.region })
    .from(contestResults)
    .innerJoin(contestRegistrations, eq(contestRegistrations.id, contestResults.registrationId))
    .where(and(eq(contestResults.contestId, contestId), eq(contestResults.disqualified, false), eq(contestRegistrations.status, "active")))
    .orderBy(asc(contestResults.place), asc(contestResults.totalMs));
  const regionOfSchool = new Map(rows.map((x) => [x.school ?? "", x.region]));
  return {
    students: rows.slice(0, top).map((x) => ({ place: x.r.place ?? 0, name: shortName(x.first, x.last), school: x.school ?? "", region: x.region, score: x.r.score })),
    schools: groupRanking(rows.map((x) => ({ key: x.school ?? "", score: x.r.score }))).map((g) => ({ ...g, region: regionOfSchool.get(g.key) ?? "" })),
    regions: groupRanking(rows.map((x) => ({ key: x.region, score: x.r.score }))),
  };
});

export async function resultOf(registrationId: string) {
  const [r] = await db.select().from(contestResults).where(eq(contestResults.registrationId, registrationId));
  return r ?? null;
}

export async function participantCount(contestId: string) {
  const [r] = await db
    .select({ n: count() })
    .from(contestResults)
    .innerJoin(contestRegistrations, eq(contestRegistrations.id, contestResults.registrationId))
    .where(and(eq(contestResults.contestId, contestId), eq(contestResults.disqualified, false), eq(contestRegistrations.status, "active")));
  return r?.n ?? 0;
}

export const registrationsByIds = async (ids: string[]) =>
  ids.length ? db.select().from(contestRegistrations).where(inArray(contestRegistrations.id, ids)) : [];
