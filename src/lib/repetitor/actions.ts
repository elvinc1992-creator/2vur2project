"use server";

import { redirect } from "next/navigation";
import { z } from "zod";
import { auth } from "@/auth";
import { LETTERS, type Letter } from "@/lib/demo/content";
import { hasPaidAccess } from "@/lib/demo/logic";
import { getDemoState, saveDemoState } from "@/lib/demo/state";
import { nextRepetitorHref } from "./progress";
import { findRepetitorQuestion, getRepetitorKey, listRepetitorTopics } from "./source";

// Onlayn repetitor yalnız abunəçilər üçündür — hər əməliyyatda serverdə yoxlanılır.
async function loadPaid() {
  const session = await auth();
  if (!session?.user?.id) redirect("/daxil-ol");
  const state = await getDemoState(session.user.id);
  if (!hasPaidAccess(state)) throw new Error("Onlayn repetitor abunə ilə açılır");
  return state;
}

export type RepetitorResult = {
  chosen: Letter | "skip";
  correct: boolean;
  answer: Letter;
  steps: string[];
  hintUsed: boolean;
  nextHref: string | null;
};

export async function answerRepetitorAction(id: string, choice: string): Promise<RepetitorResult> {
  const parsed = z.enum([...LETTERS, "skip"]).safeParse(choice);
  const q = await findRepetitorQuestion(id);
  const key = await getRepetitorKey(id);
  if (!q || !key || !parsed.success) throw new Error("Yanlış sorğu");

  const state = await loadPaid();
  const tutor = (state.tutor ??= {});
  // Artıq cavablanıbsa, ilk cavab qalır.
  if (!tutor[id]?.a) {
    tutor[id] = { ...tutor[id], a: parsed.data, ok: parsed.data === key.answer };
    await saveDemoState(state);
  }
  const p = tutor[id];
  return {
    chosen: p.a!,
    correct: Boolean(p.ok),
    answer: key.answer,
    steps: key.steps,
    hintUsed: Boolean(p.hint),
    nextHref: nextRepetitorHref(state, await listRepetitorTopics(), q),
  };
}

/** İpucu yalnız istəyəndə serverdən gəlir və qeyd olunur. */
export async function repetitorHintAction(id: string): Promise<string> {
  const key = await getRepetitorKey(id);
  if (!key) throw new Error("Yanlış sorğu");
  const state = await loadPaid();
  const tutor = (state.tutor ??= {});
  if (!tutor[id]?.hint) {
    tutor[id] = { ...tutor[id], hint: true };
    await saveDemoState(state);
  }
  return key.hint;
}
