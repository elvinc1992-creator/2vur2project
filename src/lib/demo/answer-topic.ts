import "server-only";
import { listQuestionPool } from "@/lib/repetitor/source";
import { EXAM_QUESTIONS, type TopicSlug } from "./content";
import { DEMO_TO_SLUG } from "./personal";

/**
 * Cavabın mövzusu (slug) — user_answers.topic_slug üçün. İstinad formatları:
 * günün sualı / repetitor — bank kodu; təkrar — "q:KOD"; repetitor sınağı — "sinaq-N:KOD"; sınaq — "examId:n".
 */
export async function answerTopicResolver(): Promise<(source: string, ref: string) => string | undefined> {
  const pool = await listQuestionPool();
  const bank = new Map(pool.flatMap((t) => t.questions.map((q) => [q.id, t.slug] as const)));
  return (source, ref) => {
    if (source === "exam") {
      const q = EXAM_QUESTIONS.find((x) => x.n === Number(ref.split(":")[1]));
      return q ? DEMO_TO_SLUG[q.topic as TopicSlug] : undefined;
    }
    return bank.get(ref.includes(":") ? ref.slice(ref.lastIndexOf(":") + 1) : ref);
  };
}
