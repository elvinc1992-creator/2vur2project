"use server";

import { redirect } from "next/navigation";
import { auth } from "@/auth";
import { acceptsAnswer, checkAnswer, feedbackOf, isPendingSelf, isValidGiven, type AnswerFeedback } from "@/lib/bank/check";
import { cleanMeta, rememberMeta, updateDemoState, type AnswerMeta } from "@/lib/demo/state";
import { buildReview, listMistakes } from "./mistakes";
import { getPracticeKey, practicePool } from "./pool";

async function userId() {
  const session = await auth();
  if (!session?.user?.id) redirect("/daxil-ol");
  return session.user.id;
}

/** "Səhvlərimi təkrar et": aktiv səhvlər + oxşar suallardan yeni seans. */
export async function startReviewAction() {
  const pool = await practicePool();
  const started = await updateDemoState(await userId(), async (state) => {
    const items = buildReview(state, pool, await listMistakes(state, pool));
    if (!items.length) return false;
    state.review = { items, answers: {}, startedAt: Date.now() };
    return true;
  });
  redirect(started ? "/sehvlerim/tekrar/1" : "/sehvlerim");
}

export type ReviewResult = AnswerFeedback & {
  /** Səhv edilmiş sual bu dəfə düzgün həll olundu. */
  fixedNow: boolean;
  nextHref: string;
};

export async function answerReviewAction(n: number, choice: string, meta?: AnswerMeta): Promise<ReviewResult> {
  return updateDemoState(await userId(), async (state) => {
    const item = state.review?.items[n - 1];
    const key = item && (await getPracticeKey(item.ref));
    if (!state.review || !item || !key || !isValidGiven(key.format, key.selfCheck, choice)) throw new Error("Yanlış sorğu");

    const review = state.review;
    // Artıq cavablanıbsa, ilk cavab qalır (özünüyoxlamada — qiymət bir dəfə verilir).
    if (acceptsAnswer(review.answers[item.ref]?.a, choice)) {
      const first = !review.answers[item.ref];
      const ok = checkAnswer(key, choice);
      review.answers[item.ref] = { a: choice, ok };
      if (first) rememberMeta(state, `review:${item.ref}`, cleanMeta(meta));
      if (!isPendingSelf(choice)) {
        const isMistake = item.kind === "mistake";
        if (ok && isMistake) (state.fixed ??= {})[item.ref] = Date.now();
        if (!ok && !isMistake) (state.practiceMistakes ??= {})[item.ref] = choice;
      }
    }
    const given = review.answers[item.ref];
    return {
      ...feedbackOf(key, given.a),
      fixedNow: given.ok && item.kind === "mistake",
      nextHref: n < review.items.length ? `/sehvlerim/tekrar/${n + 1}` : "/sehvlerim?bitdi=1",
    };
  });
}
