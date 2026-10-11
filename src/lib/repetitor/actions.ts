"use server";

import { redirect } from "next/navigation";
import { z } from "zod";
import { auth } from "@/auth";
import { acceptsAnswer, checkAnswer, feedbackOf, isValidGiven, readFormAnswer, type AnswerFeedback } from "@/lib/bank/check";
import { canUseRepetitor } from "@/lib/demo/plans";
import { cleanMeta, rememberMeta, seedState, updateDemoState, type AnswerMeta, type DemoState } from "@/lib/demo/state";
import { changePlan, examKey, todayIn } from "./plan";
import { freeLessonOf, nextRepetitorHref, repetitorHref, tutorContext } from "./progress";
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

export type RepetitorResult = AnswerFeedback & {
  hintUsed: boolean;
  nextHref: string | null;
};

export async function answerRepetitorAction(id: string, choice: string, meta?: AnswerMeta): Promise<RepetitorResult> {
  const q = await findRepetitorQuestion(id);
  const key = await getRepetitorKey(id);
  if (!q || !key || !isValidGiven(key.format, key.selfCheck, choice)) throw new Error("Yanlış sorğu");

  // Qonaq: yalnız ilk (pulsuz) dərs; cavab yoxlanılır, heç yerdə saxlanılmır.
  const session = await auth();
  if (!session?.user?.id) {
    const ctx = await tutorContext(seedState(""));
    if (!ctx.isFree(id)) throw new Error("Bu dərs abunə ilə açılır");
    const lesson = freeLessonOf(ctx.curr)!;
    const nextId = lesson.questionIds[lesson.questionIds.indexOf(id) + 1];
    const topic = ctx.topics.find((t) => t.slug === q.topic)!;
    return {
      ...feedbackOf(key, choice),
      hintUsed: false,
      nextHref: nextId ? repetitorHref(topic.slug, topic.questions.findIndex((x) => x.id === nextId) + 1) : null,
    };
  }

  // İlk dərs hamıya açıqdır; qalan dərslər — Premium-da qrafikə görə (isOpen yoxlayır).
  return updateDemoState(session.user.id, async (state) => {
    const ctx = await tutorContext(state);
    if (!ctx.isOpen(id)) throw new Error("Bu dərs hələ açılmayıb");
    const tutor = (state.tutor ??= {});
    // Artıq cavablanıbsa, ilk cavab qalır (özünüyoxlamada — qiymət bir dəfə verilir).
    if (acceptsAnswer(tutor[id]?.a, choice)) {
      const first = !tutor[id]?.a;
      tutor[id] = { ...tutor[id], a: choice, ok: checkAnswer(key, choice) };
      if (first) rememberMeta(state, `tutor:${id}`, cleanMeta(meta));
    }
    const p = tutor[id];
    return {
      ...feedbackOf(key, p.a!),
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
    const answers: Record<string, string> = {};
    const results: Record<string, boolean> = {};
    for (const id of exam.questionIds) {
      const key = keys.get(id);
      const given = key ? readFormAnswer(formData, `q-${id}`, { format: key.format, matching: (await findRepetitorQuestion(id))?.matching }) : null;
      if (given) answers[id] = given;
      results[id] = Boolean(key && given && checkAnswer(key, given));
    }
    (state.tutorExams ??= {})[examKey(n)] = { answers, results, finishedAt: Date.now() };
  });
  redirect(`/onlayn-repetitor/sinaq/${n}`);
}
