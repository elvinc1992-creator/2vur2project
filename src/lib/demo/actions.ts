"use server";

import { redirect } from "next/navigation";
import { auth } from "@/auth";
import { getRepetitorKey } from "@/lib/repetitor/source";
import { acceptsAnswer, checkAnswer, feedbackOf, isValidGiven, type AnswerFeedback } from "@/lib/bank/check";
import { ensureDaily } from "./daily";
import { findExam } from "@/lib/exams/source";
import { daysLeft, examStatus, isExamOpenForSale, isExamVisible, isDailyOpen, nextDailyHref, typeStats } from "./logic";
import { afterExamFinished } from "@/lib/weak/hooks";
import { finalizeAttempt, loadExamCtx } from "./exam-session";
import { examQuota } from "./plans";
import { cleanMeta, rememberMeta, resetDemoState, updateDemoState, type AnswerMeta } from "./state";

async function userId(): Promise<string> {
  const session = await auth();
  if (!session?.user?.id) redirect("/daxil-ol");
  return session.user.id;
}

/* ---------------- Günün sualı ---------------- */

export type DailyResult = AnswerFeedback & {
  stats: { ok: number; total: number };
  nextHref: string | null;
};

export async function answerDailyAction(id: string, choice: string, meta?: AnswerMeta): Promise<DailyResult> {
  const key = await getRepetitorKey(id);
  if (!key || !isValidGiven(key.format, key.selfCheck, choice)) throw new Error("Yanlış sorğu");
  const uid = await userId();
  const { ctx } = await ensureDaily(uid);
  const q = ctx.byId.get(id);
  if (!q) throw new Error("Yanlış sorğu");

  return updateDemoState(uid, (state) => {
    // Bu günün dəstində olmayan və ya kilidli sual (Free plan) — nə cavab qəbul olunur, nə də açar qaytarılır.
    if (!isDailyOpen(state, ctx, id)) throw new Error("Bu sual Pro planı ilə açılır");
    // Artıq cavablanıbsa, ilk cavab qalır (özünüyoxlamada — qiymət bir dəfə verilir).
    if (acceptsAnswer(state.daily[id], choice)) {
      const first = !state.daily[id];
      state.daily[id] = choice;
      (state.dailyOk ??= {})[id] = checkAnswer(key, choice);
      if (first) rememberMeta(state, `daily:${id}`, cleanMeta(meta));
    }
    return {
      ...feedbackOf(key, state.daily[id]),
      stats: typeStats(state, ctx, q.type),
      nextHref: nextDailyHref(state, ctx, id),
    };
  });
}

/** Plan üzrə sınaq seçimi: Free — ayda 1, Pro — həftədə 1 (Premium — hamısı açıqdır). */
export async function claimExamAction(id: string) {
  const exam = await findExam(id);
  if (!exam || !isExamOpenForSale(exam)) redirect("/sinaqlar");
  const ok = await updateDemoState(await userId(), (state) => {
    if (examStatus(state, exam) !== "locked") return true;
    const q = examQuota(state);
    if (q.kind === "all" || q.left <= 0) return false;
    state.purchased.push(id);
    (state.examClaims ??= []).push({ id, at: Date.now() });
    return true;
  });
  redirect(ok ? `/sinaq/${id}` : "/sinaqlar?kvota=0");
}

/* ---------------- Sınaq ---------------- */
// Sayğac yalnız sınaq səhifəsi açıq olanda gedir (timer.ts, exam-session.ts).

export async function startExamAction(id: string) {
  const exam = await findExam(id);
  if (!exam) redirect("/sinaqlar");
  const target = await updateDemoState(await userId(), (state) => {
    // Passiv sınaq və ya iştirak etmədiyin bitmiş sınaq başlamır.
    if (!isExamVisible(state, exam)) return "/sinaqlar";
    const status = examStatus(state, exam);
    if (status === "locked") return `/odenis?exam=${id}`;
    if (status === "done") return `/sinaq/${id}/netice`;
    if (status === "purchased") {
      // Fasilədə başlayır — səhifə açılanda (tick) sayğac işə düşür.
      state.attempts[id] = { startedAt: Date.now(), elapsedMs: 0, lastSeenAt: null, answers: {}, flags: [] };
    }
    return `/sinaq/${id}`;
  });
  redirect(target);
}

export async function finishExamAction(id: string, timedOut = false): Promise<{ answered: number }> {
  const uid = await userId();
  const exam = await loadExamCtx(id);
  if (!exam) redirect("/sinaqlar");
  const res = await updateDemoState(uid, (state) => {
    if (!state.attempts[id]) return { answered: Object.keys(state.results[id]?.answers ?? {}).length };
    return { answered: finalizeAttempt(state, exam, timedOut) };
  });
  await afterExamFinished(uid, exam.questions);
  return res;
}

/* ---------------- Abunə (ödəniş — src/lib/payments) ---------------- */

export async function cancelSubscriptionAction() {
  const target = await updateDemoState(await userId(), (state) => {
    if (state.sub.status !== "active") return "/profil";
    state.sub.status = "canceled";
    return "/profil/abune-legv-edildi";
  });
  redirect(target);
}

export async function resumeSubscriptionAction() {
  const target = await updateDemoState(await userId(), (state) => {
    // Abunə heç olmayıbsa və ya dövr bitibsə — yenidən ödəniş.
    if (state.sub.status === "none" || daysLeft(state.sub.periodEnd) <= 0) return "/odenis";
    state.sub.status = "active";
    return "/profil";
  });
  redirect(target);
}

export async function resetDemoAction() {
  await resetDemoState(await userId());
  redirect("/panel");
}
