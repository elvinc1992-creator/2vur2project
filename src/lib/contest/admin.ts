import "server-only";
import { and, asc, count, desc, eq, inArray, like, or, sql } from "drizzle-orm";
import { db } from "@/db";
import { contestAnswers, contestAttempts, contestEvents, contestRegistrations, contestResults, contestTemplates, topics } from "@/db/schema";

// Admin sorğuları: qeydiyyatçılar (axtarış, filtr, CSV), canlı izləmə, şübhəli nəticələr, finalçılar.

export type RegFilter = { q?: string; grade?: number; region?: string };

export async function listRegistrants(contestId: string, f: RegFilter = {}, limit = 500) {
  const q = f.q?.trim().toLowerCase();
  const where = and(
    eq(contestRegistrations.contestId, contestId),
    f.grade ? eq(contestRegistrations.grade, f.grade) : undefined,
    f.region ? eq(contestRegistrations.region, f.region) : undefined,
    q
      ? or(
          like(sql`lower(${contestRegistrations.firstName} || ' ' || ${contestRegistrations.lastName})`, `%${q}%`),
          like(sql`lower(${contestRegistrations.email})`, `%${q}%`),
          like(sql`lower(coalesce(${contestRegistrations.school}, ''))`, `%${q}%`),
          like(sql`lower(${contestRegistrations.inviteCode})`, `%${q}%`),
        )
      : undefined,
  );
  const [rows, [{ n }]] = await Promise.all([
    db
      .select({ reg: contestRegistrations, res: contestResults })
      .from(contestRegistrations)
      .leftJoin(contestResults, eq(contestResults.registrationId, contestRegistrations.id))
      .where(where)
      .orderBy(desc(contestRegistrations.createdAt))
      .limit(limit),
    db.select({ n: count() }).from(contestRegistrations).where(where),
  ]);
  return { rows, total: n };
}

export async function regionsOf(contestId: string) {
  const rows = await db
    .selectDistinct({ r: contestRegistrations.region })
    .from(contestRegistrations)
    .where(eq(contestRegistrations.contestId, contestId))
    .orderBy(asc(contestRegistrations.region));
  return rows.map((x) => x.r);
}

/** Dəvət statistikası: ən çox dəvət edənlər. */
export async function topInviters(contestId: string) {
  const inv = await db
    .select({ id: contestRegistrations.invitedById, n: count() })
    .from(contestRegistrations)
    .where(and(eq(contestRegistrations.contestId, contestId), sql`${contestRegistrations.invitedById} is not null`))
    .groupBy(contestRegistrations.invitedById)
    .orderBy(desc(count()))
    .limit(10);
  const ids = inv.map((x) => x.id!).filter(Boolean);
  const regs = ids.length ? await db.select().from(contestRegistrations).where(inArray(contestRegistrations.id, ids)) : [];
  return inv.map((x) => ({ n: x.n, reg: regs.find((r) => r.id === x.id) }));
}

/** Canlı: qeydiyyat, başlayan, bitirən; hər iştirakçı üzrə hadisə sayı. */
export async function liveStats(contestId: string) {
  const regIds = db.select({ id: contestRegistrations.id }).from(contestRegistrations).where(eq(contestRegistrations.contestId, contestId));
  const [[regs], [started], [finished], events] = await Promise.all([
    db.select({ n: count() }).from(contestRegistrations).where(eq(contestRegistrations.contestId, contestId)),
    db.select({ n: count() }).from(contestAttempts).where(inArray(contestAttempts.registrationId, regIds)),
    db
      .select({ n: count() })
      .from(contestAttempts)
      .where(and(inArray(contestAttempts.registrationId, regIds), sql`${contestAttempts.finishedAt} is not null`)),
    db
      .select({ id: contestEvents.registrationId, kind: contestEvents.kind, n: count() })
      .from(contestEvents)
      .where(inArray(contestEvents.registrationId, regIds))
      .groupBy(contestEvents.registrationId, contestEvents.kind),
  ]);
  return { regs: regs.n, started: started.n, finished: finished.n, active: started.n - finished.n, events };
}

export type Suspect = { id: string; name: string; email: string; reasons: string[]; score: number | null; disqualified: boolean; dqReason: string | null };

/**
 * Şübhəli nəticələr: çox tab dəyişmə / pəncərədən çıxma (≥3), qeyri-real qısa vaxt (yüksək bal ilə sual başına < 15 s),
 * eyni cavab ardıcıllığı (≥2 iştirakçıda eyni, ən az 10 cavab).
 */
export async function suspects(contestId: string): Promise<Suspect[]> {
  const regs = await db
    .select({ reg: contestRegistrations, res: contestResults, a: contestAttempts })
    .from(contestRegistrations)
    .innerJoin(contestAttempts, eq(contestAttempts.registrationId, contestRegistrations.id))
    .leftJoin(contestResults, eq(contestResults.registrationId, contestRegistrations.id))
    .where(eq(contestRegistrations.contestId, contestId));
  const ids = regs.map((r) => r.reg.id);
  if (!ids.length) return [];
  const [events, answers] = await Promise.all([
    db
      .select({ id: contestEvents.registrationId, n: count() })
      .from(contestEvents)
      .where(and(inArray(contestEvents.registrationId, ids), inArray(contestEvents.kind, ["tab_hidden", "window_blur"])))
      .groupBy(contestEvents.registrationId),
    db.select().from(contestAnswers).where(inArray(contestAnswers.registrationId, ids)).orderBy(asc(contestAnswers.n)),
  ]);
  const seq = new Map<string, string>();
  for (const id of ids) {
    const mine = answers.filter((a) => a.registrationId === id);
    if (mine.filter((a) => a.given).length >= 10) seq.set(id, mine.map((a) => a.given ?? "-").join(""));
  }
  const sameSeq = new Map<string, number>();
  for (const s of seq.values()) sameSeq.set(s, (sameSeq.get(s) ?? 0) + 1);

  const out: Suspect[] = [];
  for (const { reg, res, a } of regs) {
    const reasons: string[] = [];
    const ev = events.find((e) => e.id === reg.id)?.n ?? 0;
    if (ev >= 3) reasons.push(`${ev} dəfə tab dəyişmə / pəncərədən çıxma`);
    const mine = answers.filter((x) => x.registrationId === reg.id && x.given);
    const correct = mine.filter((x) => x.correct).length;
    const avg = mine.length ? mine.reduce((s, x) => s + x.timeMs, 0) / mine.length : 0;
    if (mine.length >= 10 && correct >= mine.length * 0.8 && avg < 15_000) reasons.push(`sual başına orta ${Math.round(avg / 1000)} s (yüksək balla)`);
    const s = seq.get(reg.id);
    if (s && (sameSeq.get(s) ?? 0) >= 2) reasons.push("cavab ardıcıllığı başqa iştirakçı ilə eynidir");
    if (reasons.length || res?.disqualified)
      out.push({
        id: reg.id,
        name: `${reg.firstName} ${reg.lastName}`,
        email: reg.email,
        reasons,
        score: res?.score ?? (a.finishedAt ? correct : null),
        disqualified: Boolean(res?.disqualified),
        dqReason: res?.dqReason ?? null,
      });
  }
  return out.sort((x, y) => y.reasons.length - x.reasons.length);
}

export async function finalists(contestId: string) {
  return db
    .select({ reg: contestRegistrations, res: contestResults })
    .from(contestResults)
    .innerJoin(contestRegistrations, eq(contestRegistrations.id, contestResults.registrationId))
    .where(and(eq(contestResults.contestId, contestId), eq(contestResults.finalist, true)))
    .orderBy(asc(contestResults.place));
}

export async function templatesOf(contestId: string) {
  return db
    .select({ t: contestTemplates, topic: topics.name })
    .from(contestTemplates)
    .leftJoin(topics, eq(topics.id, contestTemplates.topicId))
    .where(eq(contestTemplates.contestId, contestId))
    .orderBy(asc(contestTemplates.n));
}
