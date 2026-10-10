import "server-only";
import { EXAM_QUESTIONS, type TopicSlug } from "@/lib/demo/content";
import { DEMO_TO_SLUG } from "@/lib/demo/personal";
import { refreshWeakTopics } from "./data";

/** Sınaq bitdi: yalnız sınaqdakı mövzular yenidən hesablanır. Xəta sınağın nəticəsinə mane olmur. */
export async function afterExamFinished(uid: string) {
  const slugs = [...new Set(EXAM_QUESTIONS.map((q) => DEMO_TO_SLUG[q.topic as TopicSlug]).filter(Boolean))];
  try {
    await refreshWeakTopics(uid, slugs);
  } catch (e) {
    console.error("weak topics refresh failed", e);
  }
}