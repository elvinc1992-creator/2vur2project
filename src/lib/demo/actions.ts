"use server";

import { redirect } from "next/navigation";
import { z } from "zod";
import { auth } from "@/auth";
import { CARD_LABEL, DAILY, LETTERS, type Letter } from "./content";
import { DAILY_KEYS } from "./keys";
import {
  addDays,
  daysLeft,
  examStatus,
  findExam,
  isCorrectDaily,
  isDailyOpen,
  nextDailyHref,
  todayIso,
  typeStats,
} from "./logic";
import { finalizeAttempt } from "./exam-session";
import { getDemoState, resetDemoState, saveDemoState, type DemoState } from "./state";

async function load(): Promise<DemoState> {
  const session = await auth();
  if (!session?.user?.id) redirect("/daxil-ol");
  return getDemoState(session.user.id);
}

/* ---------------- Günün sualı ---------------- */

export type DailyResult = {
  chosen: Letter | "skip";
  correct: boolean;
  answer: Letter;
  steps: string[];
  stats: { ok: number; total: number };
  nextHref: string | null;
};

export async function answerDailyAction(id: string, choice: string): Promise<DailyResult> {
  const q = DAILY.find((x) => x.id === id);
  const parsed = z.enum([...LETTERS, "skip"]).safeParse(choice);
  if (!q || !parsed.success) throw new Error("Yanlış sorğu");

  const state = await load();
  // Kilidli sual (pulsuz plan) — nə cavab qəbul olunur, nə də açar qaytarılır.
  if (!isDailyOpen(state, q)) throw new Error("Bu sual abunə ilə açılır");
  // Artıq cavablanıbsa, ilk cavab qalır.
  if (!state.daily[id]) {
    state.daily[id] = parsed.data;
    await saveDemoState(state);
  }
  const key = DAILY_KEYS[id];
  return {
    chosen: state.daily[id],
    correct: isCorrectDaily(state, id),
    answer: key.answer,
    steps: key.steps,
    stats: typeStats(state, q.type),
    nextHref: nextDailyHref(state, q),
  };
}

/* ---------------- Sınaq ---------------- */
// Sayğac yalnız sınaq səhifəsi açıq olanda gedir (timer.ts, exam-session.ts).

export async function startExamAction(id: string) {
  const state = await load();
  const exam = findExam(id);
  if (!exam) redirect("/sinaqlar");
  const status = examStatus(state, id);
  if (status === "locked") redirect(`/odenis?exam=${id}`);
  if (status === "done") redirect(`/sinaq/${id}/netice`);
  if (status === "purchased") {
    // Fasilədə başlayır — səhifə açılanda (tick) sayğac işə düşür.
    state.attempts[id] = { startedAt: Date.now(), elapsedMs: 0, lastSeenAt: null, answers: {}, flags: [] };
    await saveDemoState(state);
  }
  redirect(`/sinaq/${id}`);
}

export async function finishExamAction(id: string, timedOut = false): Promise<{ answered: number }> {
  const state = await load();
  if (!state.attempts[id]) return { answered: Object.keys(state.results[id]?.answers ?? {}).length };
  const answered = finalizeAttempt(state, id, timedOut);
  await saveDemoState(state);
  return { answered };
}

/* ---------------- Ödəniş (mock) və abunə ---------------- */

export async function mockPayAction(formData: FormData) {
  const kind = formData.get("kind") === "exam" ? "exam" : "monthly";
  const examId = String(formData.get("exam") ?? "");
  if (formData.get("consent") !== "on") {
    redirect(`/odenis?${kind === "exam" ? `exam=${examId}` : "plan=monthly"}&consent=0`);
  }

  const state = await load();
  const today = todayIso();
  const receiptId = `${Date.now().toString().slice(-8, -4)}-${Date.now().toString().slice(-4)}`;
  if (kind === "exam") {
    const exam = findExam(examId);
    if (!exam) redirect("/sinaqlar");
    if (!state.purchased.includes(examId)) state.purchased.push(examId);
    state.payments.unshift({ id: receiptId, title: exam.title, date: today, method: CARD_LABEL, examId });
  } else {
    const base = state.sub.periodEnd > today ? state.sub.periodEnd : today;
    state.sub = { status: "active", periodEnd: addDays(base, 30) };
    state.payments.unshift({ id: receiptId, title: "Aylıq abunə", date: today, method: CARD_LABEL });
  }
  await saveDemoState(state);
  redirect(`/odenis/ugurlu?r=${receiptId}`);
}

export async function cancelSubscriptionAction() {
  const state = await load();
  if (state.sub.status !== "active") redirect("/profil");
  state.sub.status = "canceled";
  await saveDemoState(state);
  redirect("/profil/abune-legv-edildi");
}

export async function resumeSubscriptionAction() {
  const state = await load();
  // Abunə heç olmayıbsa və ya dövr bitibsə — yenidən ödəniş.
  if (state.sub.status === "none" || daysLeft(state.sub.periodEnd) <= 0) redirect("/odenis");
  state.sub.status = "active";
  await saveDemoState(state);
  redirect("/profil");
}

export async function toggleFreePlanAction() {
  const state = await load();
  state.free = !state.free;
  await saveDemoState(state);
  redirect("/profil");
}

export async function resetDemoAction() {
  await resetDemoState();
  redirect("/panel");
}
