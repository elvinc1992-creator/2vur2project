import "server-only";
import { and, eq, inArray, isNull } from "drizzle-orm";
import { db } from "@/db";
import {
  contestAnswers,
  contestAttempts,
  contestEmails,
  contestRegistrations,
  contestResults,
  contests,
  contestTemplates,
  contestVariants,
  topics,
} from "@/db/schema";
import { contestById, type ContestRow } from "./data";
import { sendContestMail } from "./mail";
import { isFinalist, rank, shortName, tourEnd, tourPhase } from "./rules";
import { tourState } from "./tour";

// Yarışın avtomatik işləri (idempotent): xatırlatma (turdan 1 saat əvvəl), status keçidi, tur bitəndə
// nəticələrin hesablanması və nəticə məktubları. Yarış səhifəsi açılanda (after) və admin tərəfindən çağırılır.

const HOUR = 3_600_000;
const timesOf = (c: ContestRow) => ({ startAt: c.startAt.getTime(), entryWindowMin: c.entryWindowMin, durationMin: c.durationMin });

export async function processContest(contestId: string, now = Date.now()) {
  const c = await contestById(contestId);
  if (!c || c.status === "draft") return;
  const start = c.startAt.getTime();

  // 1) Xatırlatma: turdan 1 saat əvvəl (göndərilməyənlərə)
  if (now >= start - HOUR && now < start) {
    const regs = await db
      .select()
      .from(contestRegistrations)
      .where(and(eq(contestRegistrations.contestId, c.id), isNull(contestRegistrations.unsubscribedAt)));
    for (const r of regs) await sendContestMail("reminder", c, r);
  }

  // 2) Tur başlayıb — status "davam edir"
  if (c.status === "registration" && now >= start) await db.update(contests).set({ status: "running" }).where(eq(contests.id, c.id));

  // 3) Tur hamı üçün bitib — nəticələr (bir dəfə) və məktublar
  if (tourPhase(timesOf(c), now) === "ended" && !c.resultsComputedAt) {
    await computeResults(c.id, now);
    await sendResultMails(c.id);
  }
}

/** Nəticələr: hər başlayan iştirakçının cəhdi bağlanır, bal və vaxt hesablanır, sıralanır, ilk N — finalçı. */
export async function computeResults(contestId: string, now = Date.now()) {
  const c = (await contestById(contestId))!;
  const end = tourEnd(timesOf(c));
  const at = Math.max(now, end);
  const regs = await db
    .select({ reg: contestRegistrations })
    .from(contestRegistrations)
    .innerJoin(contestAttempts, eq(contestAttempts.registrationId, contestRegistrations.id))
    .where(eq(contestRegistrations.contestId, c.id));
  // Vaxtı bitmiş sualları cavabsız yaz (cəhd tam bağlansın)
  for (const { reg } of regs) await tourState(c, reg, { now: at });

  const ids = regs.map((r) => r.reg.id);
  if (!ids.length) {
    await db.update(contests).set({ resultsComputedAt: new Date(now), status: c.status === "running" || c.status === "registration" ? "finished" : c.status }).where(eq(contests.id, c.id));
    return 0;
  }
  const [answers, attempts, existing] = await Promise.all([
    db.select().from(contestAnswers).where(inArray(contestAnswers.registrationId, ids)),
    db.select().from(contestAttempts).where(inArray(contestAttempts.registrationId, ids)),
    db.select().from(contestResults).where(eq(contestResults.contestId, c.id)),
  ]);
  const dq = new Map(existing.map((e) => [e.registrationId, e]));
  const rows = ids.map((id) => {
    const a = attempts.find((x) => x.registrationId === id)!;
    const finished = a.finishedAt?.getTime() ?? at;
    return {
      id,
      score: answers.filter((x) => x.registrationId === id && x.correct).length,
      totalMs: finished - a.startedAt.getTime(),
      disqualified: dq.get(id)?.disqualified ?? false,
    };
  });
  for (const r of rank(rows)) {
    const values = {
      contestId: c.id,
      score: r.score,
      totalMs: r.totalMs,
      place: r.place,
      finalist: isFinalist(r.place, c.finalistCount),
    };
    await db
      .insert(contestResults)
      .values({ registrationId: r.id, ...values, disqualified: r.disqualified, dqReason: dq.get(r.id)?.dqReason ?? null })
      .onConflictDoUpdate({ target: contestResults.registrationId, set: values });
  }
  await db
    .update(contests)
    .set({ resultsComputedAt: new Date(now), status: c.status === "running" || c.status === "registration" ? "finished" : c.status })
    .where(eq(contests.id, c.id));
  return rows.length;
}

/** İştirakçının zəif mövzuları: səhv cavab verdiyi sualların mövzuları (ən çox səhv — əvvəl, 3-ə qədər). */
export async function weakTopicsOf(registrationId: string) {
  const rows = await db
    .select({ correct: contestAnswers.correct, topic: topics.name })
    .from(contestAnswers)
    .innerJoin(contestVariants, and(eq(contestVariants.registrationId, contestAnswers.registrationId), eq(contestVariants.n, contestAnswers.n)))
    .innerJoin(contestTemplates, eq(contestTemplates.id, contestVariants.templateId))
    .innerJoin(topics, eq(topics.id, contestTemplates.topicId))
    .where(eq(contestAnswers.registrationId, registrationId));
  const by = new Map<string, number>();
  for (const r of rows) if (!r.correct) by.set(r.topic, (by.get(r.topic) ?? 0) + 1);
  return [...by].sort((a, b) => b[1] - a[1]).slice(0, 3).map(([t]) => t);
}

/** Nəticə məktubları (razılıq verənlərə; göndərilməyənlərə). force — admin yenidən göndərir. */
export async function sendResultMails(contestId: string, force = false) {
  const c = (await contestById(contestId))!;
  const rows = await db
    .select({ r: contestResults, reg: contestRegistrations })
    .from(contestResults)
    .innerJoin(contestRegistrations, eq(contestRegistrations.id, contestResults.registrationId))
    .where(eq(contestResults.contestId, c.id));
  const participants = rows.filter((x) => !x.r.disqualified).length;
  let sent = 0;
  for (const { r, reg } of rows) {
    if (r.disqualified) continue;
    const weak = await weakTopicsOf(reg.id);
    if (await sendContestMail("result", c, reg, { score: r.score, place: r.place, participants, finalist: r.finalist, weak }, force)) sent++;
  }
  return sent;
}

/** Finalçılara dəvət (admin finalın vaxtını və məkanını daxil edəndən sonra). */
export async function sendFinalistMails(contestId: string, force = false) {
  const c = (await contestById(contestId))!;
  const rows = await db
    .select({ reg: contestRegistrations })
    .from(contestResults)
    .innerJoin(contestRegistrations, eq(contestRegistrations.id, contestResults.registrationId))
    .where(and(eq(contestResults.contestId, c.id), eq(contestResults.finalist, true), eq(contestResults.disqualified, false)));
  let sent = 0;
  for (const { reg } of rows) if (await sendContestMail("finalist", c, reg, {}, force)) sent++;
  return sent;
}

/** Final yerləri (final balına görə) və yekun məktublar — qaliblərə və bütün iştirakçılara. */
export async function publishFinal(contestId: string, force = false) {
  const c = (await contestById(contestId))!;
  const rows = await db
    .select({ r: contestResults, reg: contestRegistrations })
    .from(contestResults)
    .innerJoin(contestRegistrations, eq(contestRegistrations.id, contestResults.registrationId))
    .where(eq(contestResults.contestId, c.id));
  const finals = rows
    .filter((x) => x.r.finalist && x.r.finalAttended && x.r.finalScore !== null && !x.r.disqualified)
    .sort((a, b) => b.r.finalScore! - a.r.finalScore!);
  let prev: { score: number; place: number } | null = null;
  for (const [i, x] of finals.entries()) {
    const place: number = prev && prev.score === x.r.finalScore ? prev.place : i + 1;
    prev = { score: x.r.finalScore!, place };
    x.r.finalPlace = place;
    await db.update(contestResults).set({ finalPlace: place }).where(eq(contestResults.registrationId, x.reg.id));
  }
  await db.update(contests).set({ status: "results" }).where(eq(contests.id, c.id));
  const winners = finals.filter((x) => (x.r.finalPlace ?? 99) <= 3).map((x) => `${shortName(x.reg.firstName, x.reg.lastName)} — ${x.r.finalScore} bal`);
  let sent = 0;
  for (const { r, reg } of rows) {
    if (r.disqualified) continue;
    if (await sendContestMail("final", c, reg, { winners, finalPlace: r.finalPlace }, force)) sent++;
  }
  return sent;
}

/** Göndərilmiş məktubların sayı (admin). */
export async function mailStats(contestId: string) {
  const rows = await db
    .select({ kind: contestEmails.kind })
    .from(contestEmails)
    .innerJoin(contestRegistrations, eq(contestRegistrations.id, contestEmails.registrationId))
    .where(eq(contestRegistrations.contestId, contestId));
  const out: Record<string, number> = {};
  for (const r of rows) out[r.kind] = (out[r.kind] ?? 0) + 1;
  return out;
}
