import "server-only";
import { eq } from "drizzle-orm";
import { db } from "@/db";
import { users } from "@/db/schema";
import type { PagerItem } from "@/lib/demo/logic";
import { canUseRepetitor } from "@/lib/demo/plans";
import type { DemoState, TutorProgress } from "@/lib/demo/state";
import { buildCurriculum, planView, todayIn, type Curriculum, type LessonView, type PlanView } from "./plan";
import { listRepetitorTopics, type RepetitorTopicWithQuestions } from "./source";
import type { RepetitorQuestion } from "./types";

export const tutorOf = (state: DemoState): Record<string, TutorProgress> => state.tutor ?? {};

export const repetitorHref = (topic: string, n: number) => `/onlayn-repetitor/${topic}/${n}`;

export type TutorContext = {
  topics: RepetitorTopicWithQuestions[];
  curr: Curriculum;
  /** Premium deyilsə və ya qrafik seçilməyibsə null. */
  view: PlanView | null;
  /** Sual açıq dərsdədirmi: ilk dərs — hamıya, qalanları — Premium-da qrafikə görə. */
  isOpen: (questionId: string) => boolean;
  /** İlk (pulsuz) dərsin sualları. */
  isFree: (questionId: string) => boolean;
  paid: boolean;
};

/**
 * MÜVƏQQƏTİ: bu hesablarda qrafikdən asılı olmayaraq bütün mövzular (dərslər və nəzəriyyə) açıqdır —
 * nəzəriyyə kitablarını yoxlamaq üçün. Yoxlama bitəndə siyahını boşaltmaq kifayətdir.
 */
const PREVIEW_ALL_TOPICS = new Set(["elvinc1992@gmail.com"]);

async function previewsAllTopics(uid: string) {
  if (!uid || !PREVIEW_ALL_TOPICS.size) return false;
  const u = await db.query.users.findFirst({ where: eq(users.id, uid), columns: { email: true } });
  return Boolean(u?.email && PREVIEW_ALL_TOPICS.has(u.email.toLowerCase()));
}

/** İlk dərs (tədris sırasının ilk mövzusu, 1-ci hissə) hamıya açıqdır — qonaq, Free və Pro planda da. */
export const freeLessonOf = (curr: Curriculum) => curr.lessons[0];

/** Mövzular → plan (dərslər, sınaqlar) → istifadəçinin qrafikinə görə statuslar. */
export async function tutorContext(state: DemoState, now = new Date()): Promise<TutorContext> {
  const topics = await listRepetitorTopics();
  const curr = buildCurriculum(topics);
  const t = tutorOf(state);
  const paid = canUseRepetitor(state);
  const view =
    paid && state.tutorPlan
      ? planView(curr, state.tutorPlan, (id) => Boolean(t[id]?.a), state.tutorExams ?? {}, todayIn(now))
      : null;
  const free = new Set(freeLessonOf(curr)?.questionIds ?? []);
  if (await previewsAllTopics(state.uid)) {
    const all = view && { ...view, lessons: view.lessons.map((l) => (l.status === "locked" ? { ...l, status: "open" as const } : l)) };
    return { topics, curr, view: all, isOpen: () => true, isFree: (id) => free.has(id), paid };
  }
  const open = new Set([...(view?.lessons.filter((l) => l.status !== "locked").flatMap((l) => l.questionIds) ?? []), ...free]);
  return { topics, curr, view, isOpen: (id) => open.has(id), isFree: (id) => free.has(id), paid };
}

/** Mövzunun dərsləri: Premium qrafiki varsa — ona görə (pulsuz ilk dərs həmişə açıq), yoxdursa — yalnız ilk dərs açıq. */
export function topicLessons(ctx: TutorContext, state: DemoState, slug: string): LessonView[] {
  const answered = tutorOf(state);
  return ctx.view
    ? ctx.view.lessons.filter((l) => l.topic === slug).map((l) => (l.status === "locked" && ctx.isFree(l.questionIds[0]) ? { ...l, status: "open" } : l))
    : ctx.curr.lessons
        .filter((l) => l.topic === slug)
        .map((l) => {
          const done = l.questionIds.filter((id) => answered[id]?.a).length;
          const status = !ctx.isFree(l.questionIds[0]) ? "locked" : done === l.questionIds.length ? "done" : "open";
          return { ...l, date: null, done, status };
        });
}

/** Nəzəriyyə açıqdır: mövzunun açıq dərsi var və ya mövzunun hələ sualı yoxdur. */
export const canReadTheory = (topic: RepetitorTopicWithQuestions, lessons: LessonView[]) =>
  !topic.questions.length || lessons.some((l) => l.status !== "locked");

export function topicProgress(state: DemoState, topic: RepetitorTopicWithQuestions) {
  const t = tutorOf(state);
  const answered = topic.questions.filter((q) => t[q.id]?.a);
  return { done: answered.length, ok: answered.filter((q) => t[q.id]?.ok).length, total: topic.questions.length };
}

/** Pager: bağlı dərsin sualları "kilidli" görünür. */
export function repetitorPager(
  state: DemoState,
  topic: RepetitorTopicWithQuestions,
  currentId?: string,
  isOpen: (id: string) => boolean = () => true,
): PagerItem[] {
  const t = tutorOf(state);
  return topic.questions.map((q, i) => ({
    n: i + 1,
    href: repetitorHref(topic.slug, i + 1),
    status: !isOpen(q.id) ? "locked" : t[q.id]?.a ? (t[q.id]?.ok ? "ok" : "bad") : "open",
    current: q.id === currentId,
  }));
}

/** Növbəti açıq və cavabsız sual: əvvəl həmin mövzu, sonra digərləri. */
export function nextRepetitorHref(
  state: DemoState,
  topics: RepetitorTopicWithQuestions[],
  after?: RepetitorQuestion,
  isOpen: (id: string) => boolean = () => true,
): string | null {
  const t = tutorOf(state);
  const order = after ? [...topics.filter((x) => x.slug === after.topic), ...topics.filter((x) => x.slug !== after.topic)] : topics;
  for (const topic of order) {
    const idx = topic.questions.findIndex((q) => isOpen(q.id) && !t[q.id]?.a && q.id !== after?.id);
    if (idx >= 0) return repetitorHref(topic.slug, idx + 1);
  }
  return null;
}
