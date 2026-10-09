"use server";

import { redirect } from "next/navigation";
import { z } from "zod";
import { auth } from "@/auth";
import { getRepetitorKey } from "@/lib/repetitor/source";
import { CARD_LABEL, LETTERS, type Letter } from "./content";
import { ensureDaily } from "./daily";
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
import { EXAM_PRICE, examQuota, PLANS } from "./plans";
import { resetDemoState, updateDemoState, type PaidTier } from "./state";

async function userId(): Promise<string> {
  const session = await auth();
  if (!session?.user?.id) redirect("/daxil-ol");
  return session.user.id;
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
  const parsed = z.enum([...LETTERS, "skip"]).safeParse(choice);
  const key = await getRepetitorKey(id);
  if (!key || !parsed.success) throw new Error("Yanlış sorğu");
  const uid = await userId();
  const { ctx } = await ensureDaily(uid);
  const q = ctx.byId.get(id);
  if (!q) throw new Error("Yanlış sorğu");

  return updateDemoState(uid, (state) => {
    // Bu günün dəstində olmayan və ya kilidli sual (Free plan) — nə cavab qəbul olunur, nə də açar qaytarılır.
    if (!isDailyOpen(state, ctx, id)) throw new Error("Bu sual Pro planı ilə açılır");
    // Artıq cavablanıbsa, ilk cavab qalır.
    if (!state.daily[id]) {
      state.daily[id] = parsed.data;
      (state.dailyOk ??= {})[id] = parsed.data === key.answer;
    }
    return {
      chosen: state.daily[id],
      correct: isCorrectDaily(state, id),
      answer: key.answer,
      steps: key.steps,
      stats: typeStats(state, ctx, q.type),
      nextHref: nextDailyHref(state, ctx, id),
    };
  });
}

/** Plan üzrə sınaq seçimi: Free — ayda 1, Pro — həftədə 1 (Premium — hamısı açıqdır). */
export async function claimExamAction(id: string) {
  if (!findExam(id)) redirect("/sinaqlar");
  const ok = await updateDemoState(await userId(), (state) => {
    if (examStatus(state, id) !== "locked") return true;
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
  if (!findExam(id)) redirect("/sinaqlar");
  const target = await updateDemoState(await userId(), (state) => {
    const status = examStatus(state, id);
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
  return updateDemoState(await userId(), (state) => {
    if (!state.attempts[id]) return { answered: Object.keys(state.results[id]?.answers ?? {}).length };
    return { answered: finalizeAttempt(state, id, timedOut) };
  });
}

/* ---------------- Ödəniş (mock) və abunə ---------------- */

export async function mockPayAction(formData: FormData) {
  const kind = formData.get("kind") === "exam" ? "exam" : "monthly";
  const examId = String(formData.get("exam") ?? "");
  if (formData.get("consent") !== "on") {
    redirect(`/odenis?${kind === "exam" ? `exam=${examId}` : "plan=monthly"}&consent=0`);
  }

  const uid = await userId();
  const exam = kind === "exam" ? findExam(examId) : undefined;
  if (kind === "exam" && !exam) redirect("/sinaqlar");
  const tier: PaidTier = formData.get("plan") === "pro" ? "pro" : "premium";
  const today = todayIso();
  const receiptId = `${Date.now().toString().slice(-8, -4)}-${Date.now().toString().slice(-4)}`;
  await updateDemoState(uid, (state) => {
    if (exam) {
      if (!state.purchased.includes(examId)) state.purchased.push(examId);
      state.payments.unshift({ id: receiptId, title: exam.title, date: today, method: CARD_LABEL, examId, amount: EXAM_PRICE });
    } else {
      // Eyni plan uzadılır; plan dəyişəndə yeni dövr bu gündən başlayır.
      const sameTier = state.sub.status !== "none" && (state.sub.tier ?? "premium") === tier;
      const base = sameTier && state.sub.periodEnd > today ? state.sub.periodEnd : today;
      state.sub = { status: "active", periodEnd: addDays(base, 30), tier };
      state.payments.unshift({
        id: receiptId,
        title: `${PLANS[tier].name} · aylıq abunə`,
        date: today,
        method: CARD_LABEL,
        amount: PLANS[tier].price ?? undefined,
      });
    }
  });
  redirect(`/odenis/ugurlu?r=${receiptId}`);
}

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
