import "server-only";
import { and, asc, eq } from "drizzle-orm";
import { db } from "@/db";
import { contestAnswers, contestAttempts, contestTemplates, contestVariants } from "@/db/schema";
import type { ContestRow, RegistrationRow } from "./data";
import { advance, tourEnd, tourPhase, type TourPhase } from "./rules";
import { listBankTasks } from "@/lib/bank/tasks";
import { LETTERS, makeBankVariant, makeVariant, spreadLetters, type ContestLetter } from "./variant";

// Onlayn tur — server vaxtı ilə: variantların yaradılması, cari sual, vaxtı bitmiş sualların cavabsız yazılması.
// Düzgün cavab brauzerə heç vaxt göndərilmir.

export type TourQuestion = {
  n: number;
  total: number;
  text: string;
  imageUrl?: string | null;
  imageAlt?: string | null;
  options: Record<ContestLetter, string>;
  /** Sualın bitmə anı (server vaxtı, ms). */
  deadline: number;
  timeSec: number;
};

export type TourState =
  | { kind: "before" | "closed" | "disabled"; phase: TourPhase }
  | { kind: "question"; phase: TourPhase; q: TourQuestion }
  | { kind: "finished"; phase: TourPhase; finishedAt: number };

type VariantRow = typeof contestVariants.$inferSelect;

const variantsOf = (registrationId: string) =>
  db.select().from(contestVariants).where(eq(contestVariants.registrationId, registrationId)).orderBy(asc(contestVariants.n));

/** İştirakçının variantını yaradır (şablonlardan, düzgün cavablar A–E üzrə paylanır). */
async function createVariants(c: ContestRow, reg: RegistrationRow) {
  const templates = (await db.select().from(contestTemplates).where(eq(contestTemplates.contestId, c.id)).orderBy(asc(contestTemplates.n))).slice(
    0,
    c.questionCount,
  );
  if (!templates.length) throw new Error("Yarışın sual şablonları yoxdur");
  const letters = spreadLetters(templates.length);
  // Sual bankı: mövzunun qapalı (A–E) sualları; iştirakçıda eyni sual təkrarlanmır.
  const bank = templates.some((t) => t.source === "bank")
    ? (await listBankTasks()).filter((b) => b.format === "closed" && b.options && b.correct)
    : [];
  const used = new Set<string>();
  const rows = templates.map((t, i) => {
    if (t.source === "bank") {
      const pool = bank.filter((b) => b.topicId === t.topicId && !used.has(b.code));
      const b = pool[Math.floor(Math.random() * pool.length)];
      if (!b) throw new Error(`Sual ${t.n}: mövzuda sual bankında qapalı sual qalmayıb`);
      used.add(b.code);
      const v = makeBankVariant({ code: b.code, body: b.body, options: b.options!, correct: b.correct!, solution: b.solution }, letters[i]);
      return {
        registrationId: reg.id,
        n: i + 1,
        templateId: t.id,
        values: "{}",
        text: v.text,
        options: JSON.stringify(v.options),
        correct: v.correct,
        timeSec: t.timeSec,
        taskCode: b.code,
        imageUrl: b.imageUrl,
        imageAlt: b.imageAlt,
        solution: b.solution,
      };
    }
    const v = makeVariant(
      { body: t.body, vars: JSON.parse(t.vars), condition: t.condition, answer: t.answer, distractors: JSON.parse(t.distractors), solution: t.solution },
      letters[i],
    );
    if (!v) throw new Error(`Şablon ${t.n}: uyğun rəqəmlər tapılmadı`);
    return {
      registrationId: reg.id,
      n: i + 1,
      templateId: t.id,
      values: JSON.stringify(v.values),
      text: v.text,
      options: JSON.stringify(v.options),
      correct: v.correct,
      timeSec: t.timeSec,
      solution: v.solution || null,
    };
  });
  await db.insert(contestVariants).values(rows).onConflictDoNothing();
}

/** Vaxtı bitmiş sualları cavabsız yazır, cari sualı irəlilədir. */
async function syncAttempt(variants: VariantRow[], registrationId: string, now: number) {
  const [a] = await db.select().from(contestAttempts).where(eq(contestAttempts.registrationId, registrationId));
  if (!a) return null;
  const time = (n: number) => variants.find((v) => v.n === n)?.timeSec ?? 75;
  const { state, timedOut } = advance(
    { currentN: a.currentN, currentStartedAt: a.currentStartedAt.getTime(), finishedAt: a.finishedAt?.getTime() ?? null },
    time,
    variants.length,
    now,
  );
  if (timedOut.length) {
    await db
      .insert(contestAnswers)
      .values(timedOut.map((x) => ({ registrationId, n: x.n, given: null, correct: false, answeredAt: new Date(x.at), timeMs: x.timeMs })))
      .onConflictDoNothing();
    await db
      .update(contestAttempts)
      .set({ currentN: state.currentN, currentStartedAt: new Date(state.currentStartedAt), finishedAt: state.finishedAt ? new Date(state.finishedAt) : null })
      .where(and(eq(contestAttempts.registrationId, registrationId), eq(contestAttempts.currentN, a.currentN)));
  }
  return state;
}

/** Turun vəziyyəti; enter — giriş vaxtıdırsa, variant və cəhd yaradılır. */
export async function tourState(c: ContestRow, reg: RegistrationRow, opts: { enter?: boolean; now?: number } = {}): Promise<TourState> {
  const now = opts.now ?? Date.now();
  const phase = tourPhase({ startAt: c.startAt.getTime(), entryWindowMin: c.entryWindowMin, durationMin: c.durationMin }, now);
  // Admin qeydiyyatı passiv edibsə — tur yoxdur (başlamış cəhd də davam etmir).
  if (reg.status === "passive") return { kind: "disabled", phase };
  let variants = await variantsOf(reg.id);
  let state = variants.length ? await syncAttempt(variants, reg.id, now) : null;

  if (!state) {
    if (phase === "before") return { kind: "before", phase };
    if (phase !== "open" || !opts.enter) return { kind: "closed", phase };
    if (!variants.length) {
      await createVariants(c, reg);
      variants = await variantsOf(reg.id);
    }
    await db
      .insert(contestAttempts)
      .values({ registrationId: reg.id, startedAt: new Date(now), currentN: 1, currentStartedAt: new Date(now) })
      .onConflictDoNothing();
    state = await syncAttempt(variants, reg.id, now);
    if (!state) return { kind: "closed", phase };
  }

  if (state.finishedAt) return { kind: "finished", phase, finishedAt: state.finishedAt };
  const v = variants.find((x) => x.n === state.currentN)!;
  return {
    kind: "question",
    phase,
    q: {
      n: v.n,
      total: variants.length,
      text: v.text,
      imageUrl: v.imageUrl,
      imageAlt: v.imageAlt,
      options: JSON.parse(v.options),
      deadline: state.currentStartedAt + v.timeSec * 1000,
      timeSec: v.timeSec,
    },
  };
}

/** Cavab: yalnız cari sual və vaxtı bitməyibsə; sonra növbəti sual (geri qayıtmaq yoxdur). */
export async function submitAnswer(c: ContestRow, reg: RegistrationRow, n: number, letter: string, now = Date.now()) {
  if (!(LETTERS as readonly string[]).includes(letter)) return false;
  const st = await tourState(c, reg, { now });
  if (st.kind !== "question" || st.q.n !== n || now >= st.q.deadline) return false;
  const [v] = await db.select().from(contestVariants).where(and(eq(contestVariants.registrationId, reg.id), eq(contestVariants.n, n)));
  const [a] = await db.select().from(contestAttempts).where(eq(contestAttempts.registrationId, reg.id));
  const inserted = await db
    .insert(contestAnswers)
    .values({ registrationId: reg.id, n, given: letter, correct: v.correct === letter, answeredAt: new Date(now), timeMs: now - a.currentStartedAt.getTime() })
    .onConflictDoNothing()
    .returning({ n: contestAnswers.n });
  if (!inserted.length) return false;
  await db
    .update(contestAttempts)
    .set(n >= st.q.total ? { finishedAt: new Date(now) } : { currentN: n + 1, currentStartedAt: new Date(now) })
    .where(and(eq(contestAttempts.registrationId, reg.id), eq(contestAttempts.currentN, n)));
  return true;
}

/** Turun hamı üçün bitdiyi an. */
export const tourEndOf = (c: ContestRow) => tourEnd({ startAt: c.startAt.getTime(), entryWindowMin: c.entryWindowMin, durationMin: c.durationMin });
