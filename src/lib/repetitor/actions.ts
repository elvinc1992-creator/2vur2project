"use server";

import { redirect } from "next/navigation";
import { z } from "zod";
import { auth } from "@/auth";
import { LETTERS, type Letter } from "@/lib/demo/content";
import { canUseRepetitor } from "@/lib/demo/plans";
import { cleanMeta, rememberMeta, updateDemoState, type AnswerMeta, type DemoState } from "@/lib/demo/state";
import { changePlan, examKey, todayIn } from "./plan";
import { nextRepetitorHref, tutorContext } from "./progress";
import { findRepetitorQuestion, getRepetitorKey, getRepetitorKeys } from "./source";

// Onlayn repetitor yalnız abunəçilər (Pro) üçündür — hər əməliyyatda serverdə yoxlanılır.
async function updatePaid<T>(fn: (state: DemoState) => T | Promise<T>) {
  const session = await auth();
  if (!session?.user?.id) redirect("/daxil-ol");
  return updateDemoState(session.user.id, (state) => {
    if (!canUseRepetitor(state)) throw new Error("Onlayn repetitor abunə ilə açılır");
    return fn(state);
  });
}

/* ---------------- Həftəlik qrafik ---------------- */

const daysSchema = z.array(z.coerce.number().int().min(1).max(7)).min(1).max(7);

export async function saveTutorPlanAction(formData: FormData) {
  const parsed = daysSchema.safeParse(formData.getAll("days"));
  if (!parsed.success) redirect("/onlayn-repetitor?qrafik=bos");
  await updatePaid(async (state) => {
    const { curr } = await tutorContext(state);
    state.tutorPlan = changePlan(state.tutorPlan, parsed.data, todayIn(), curr.lessons.length);
  });
  redirect("/onlayn-repetitor");
}

/* ---------------- Sual ---------------- */

export type RepetitorResult = {
  chosen: Letter | "skip";
  correct: boolean;
  answer: Letter;
  steps: string[];
  hintUsed: boolean;
  nextHref: string | null;
};

export async function answerRepetitorAction(id: string, choice: string, meta?: AnswerMeta): Promise<RepetitorResult> {
  const parsed = z.enum([...LETTERS, "skip"]).safeParse(choice);
  const q = await findRepetitorQuestion(id);
  const key = await getRepetitorKey(id);
  if (!q || !key || !parsed.success) throw new Error("Yanlış sorğu");

  return updatePaid(async (state) => {
    const ctx = await tutorContext(state);
    if (!ctx.isOpen(id)) throw new Error("Bu dərs hələ açılmayıb");
    const tutor = (state.tutor ??= {});
    // Artıq cavablanıbsa, ilk cavab qalır.
    if (!tutor[id]?.a) {
      tutor[id] = { ...tutor[id], a: parsed.data, ok: parsed.data === key.answer };
      rememberMeta(state, `tutor:${id}`, cleanMeta(meta));
    }
    const p = tutor[id];
    return {
      chosen: p.a!,
      correct: Boolean(p.ok),
      answer: key.answer,
      steps: key.steps,
      hintUsed: Boolean(p.hint),
      nextHref: nextRepetitorHref(state, ctx.topics, q, ctx.isOpen),
    };
  });
}

/** İpucu yalnız istəyəndə serverdən gəlir və qeyd olunur. */
export async function repetitorHintAction(id: string): Promise<string> {
  const key = await getRepetitorKey(id);
  if (!key) throw new Error("Yanlış sorğu");
  await updatePaid(async (state) => {
    if (!(await tutorContext(state)).isOpen(id)) throw new Error("Bu dərs hələ açılmayıb");
    const tutor = (state.tutor ??= {});
    if (!tutor[id]?.hint) tutor[id] = { ...tutor[id], hint: true };
  });
  return key.hint;
}

/* ---------------- Sınaq (hər 2 mövzudan sonra) ---------------- */

export async function submitTutorExamAction(n: number, formData: FormData) {
  await updatePaid(async (state) => {
    const { view } = await tutorContext(state);
    const exam = view?.exams.find((e) => e.n === n);
    if (!exam || exam.status !== "open") return; // bağlıdır və ya artıq göndərilib
    const keys = await getRepetitorKeys(exam.questionIds);
    const answers: Record<string, Letter> = {};
    const results: Record<string, boolean> = {};
    for (const id of exam.questionIds) {
      const v = formData.get(`q-${id}`);
      const a = z.enum(LETTERS).safeParse(v);
      if (a.success) answers[id] = a.data;
      results[id] = a.success && keys.get(id)?.answer === a.data;
    }
    (state.tutorExams ??= {})[examKey(n)] = { answers, results, finishedAt: Date.now() };
  });
  redirect(`/onlayn-repetitor/sinaq/${n}`);
}
