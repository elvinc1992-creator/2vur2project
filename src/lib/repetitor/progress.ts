import "server-only";
import type { PagerItem } from "@/lib/demo/logic";
import type { DemoState, TutorProgress } from "@/lib/demo/state";
import { buildCurriculum, planView, todayIn, type Curriculum, type PlanView } from "./plan";
import { listRepetitorTopics, type RepetitorTopicWithQuestions } from "./source";
import type { RepetitorQuestion } from "./types";

export const tutorOf = (state: DemoState): Record<string, TutorProgress> => state.tutor ?? {};

export const repetitorHref = (topic: string, n: number) => `/onlayn-repetitor/${topic}/${n}`;

export type TutorContext = {
  topics: RepetitorTopicWithQuestions[];
  curr: Curriculum;
  /** Qrafik seçilməyibsə null — heç bir dərs açıq deyil. */
  view: PlanView | null;
  /** Sual açıq dərsdədirmi (qrafikə görə). */
  isOpen: (questionId: string) => boolean;
};

/** Mövzular → plan (dərslər, sınaqlar) → istifadəçinin qrafikinə görə statuslar. */
export async function tutorContext(state: DemoState, now = new Date()): Promise<TutorContext> {
  const topics = await listRepetitorTopics();
  const curr = buildCurriculum(topics);
  const t = tutorOf(state);
  const view = state.tutorPlan
    ? planView(curr, state.tutorPlan, (id) => Boolean(t[id]?.a), state.tutorExams ?? {}, todayIn(now))
    : null;
  const open = new Set(view?.lessons.filter((l) => l.status !== "locked").flatMap((l) => l.questionIds));
  return { topics, curr, view, isOpen: (id) => open.has(id) };
}

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
