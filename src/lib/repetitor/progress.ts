import "server-only";
import type { PagerItem } from "@/lib/demo/logic";
import type { DemoState, TutorProgress } from "@/lib/demo/state";
import type { RepetitorTopicWithQuestions } from "./source";
import type { RepetitorQuestion } from "./types";

export const tutorOf = (state: DemoState): Record<string, TutorProgress> => state.tutor ?? {};

export const repetitorHref = (topic: string, n: number) => `/onlayn-repetitor/${topic}/${n}`;

export function topicProgress(state: DemoState, topic: RepetitorTopicWithQuestions) {
  const t = tutorOf(state);
  const answered = topic.questions.filter((q) => t[q.id]?.a);
  return { done: answered.length, ok: answered.filter((q) => t[q.id]?.ok).length, total: topic.questions.length };
}

export function repetitorPager(state: DemoState, topic: RepetitorTopicWithQuestions, currentId?: string): PagerItem[] {
  const t = tutorOf(state);
  return topic.questions.map((q, i) => ({
    n: i + 1,
    href: repetitorHref(topic.slug, i + 1),
    status: t[q.id]?.a ? (t[q.id]?.ok ? "ok" : "bad") : "open",
    current: q.id === currentId,
  }));
}

/** Növbəti cavabsız sual: əvvəl həmin mövzu, sonra digərləri. */
export function nextRepetitorHref(
  state: DemoState,
  topics: RepetitorTopicWithQuestions[],
  after?: RepetitorQuestion,
): string | null {
  const t = tutorOf(state);
  const order = after ? [...topics.filter((x) => x.slug === after.topic), ...topics.filter((x) => x.slug !== after.topic)] : topics;
  for (const topic of order) {
    const idx = topic.questions.findIndex((q) => !t[q.id]?.a && q.id !== after?.id);
    if (idx >= 0) return repetitorHref(topic.slug, idx + 1);
  }
  return null;
}
