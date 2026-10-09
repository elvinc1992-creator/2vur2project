"use server";

import { redirect } from "next/navigation";
import { z } from "zod";
import { auth } from "@/auth";
import { LETTERS, type Letter } from "@/lib/demo/content";
import { updateDemoState } from "@/lib/demo/state";
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

export type ReviewResult = {
  chosen: Letter | "skip";
  correct: boolean;
  answer: Letter;
  steps: string[];
  /** Səhv edilmiş sual bu dəfə düzgün həll olundu. */
  fixedNow: boolean;
  nextHref: string;
};

export async function answerReviewAction(n: number, choice: string): Promise<ReviewResult> {
  const parsed = z.enum([...LETTERS, "skip"]).safeParse(choice);
  return updateDemoState(await userId(), async (state) => {
    const item = state.review?.items[n - 1];
    const key = item && (await getPracticeKey(item.ref));
    if (!parsed.success || !state.review || !item || !key) throw new Error("Yanlış sorğu");

    const review = state.review;
    // Artıq cavablanıbsa, ilk cavab qalır.
    if (!review.answers[item.ref]) {
      const ok = parsed.data === key.answer;
      review.answers[item.ref] = { a: parsed.data, ok };
      const isMistake = item.kind === "mistake";
      if (ok && isMistake) (state.fixed ??= {})[item.ref] = Date.now();
      if (!ok && !isMistake) (state.practiceMistakes ??= {})[item.ref] = parsed.data;
    }
    const given = review.answers[item.ref];
    return {
      chosen: given.a,
      correct: given.ok,
      answer: key.answer,
      steps: key.steps,
      fixedNow: given.ok && item.kind === "mistake",
      nextHref: n < review.items.length ? `/sehvlerim/tekrar/${n + 1}` : "/sehvlerim?bitdi=1",
    };
  });
}
