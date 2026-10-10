import "server-only";
import { listQuestionPool } from "@/lib/repetitor/source";

/**
 * Cavabın mövzusu (slug) — user_answers.topic_slug üçün. İstinadın son hissəsi sualın bank kodudur:
 * günün sualı / repetitor — "KOD"; təkrar — "q:KOD"; repetitor sınağı — "sinaq-N:KOD"; sınaq — "examId:KOD".
 */
export async function answerTopicResolver(): Promise<(source: string, ref: string) => string | undefined> {
  const pool = await listQuestionPool();
  const bank = new Map(pool.flatMap((t) => t.questions.map((q) => [q.id, t.slug] as const)));
  return (_source, ref) => bank.get(ref.includes(":") ? ref.slice(ref.lastIndexOf(":") + 1) : ref);
}
