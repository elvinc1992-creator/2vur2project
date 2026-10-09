import "server-only";
import { eq } from "drizzle-orm";
import { db } from "@/db";
import { userAnswers } from "@/db/schema";
import { EXAM_QUESTIONS, type TopicSlug } from "@/lib/demo/content";
import { DEMO_TO_REAL } from "@/lib/demo/personal";
import { listRepetitorTopics } from "@/lib/repetitor/source";
import type { ScoreStats } from "./estimate";

/**
 * Cavabın mövzusu (ad). user_answers-də mövzu saxlanmır — istinaddan tapılır:
 * günün sualı / repetitor — bank id; təkrar — "q:id" (köhnə "d:" / "r:"); repetitor sınağı — "sinaq-N:id";
 * sınaq — "examId:n" (sınaq məzmunundakı mövzu).
 */
export function topicOfAnswer(source: string, ref: string, bankTopic: Map<string, string>): string | undefined {
  if (source === "exam") {
    const q = EXAM_QUESTIONS.find((x) => x.n === Number(ref.split(":")[1]));
    return q ? DEMO_TO_REAL[q.topic as TopicSlug] : undefined;
  }
  const id = ref.includes(":") ? ref.slice(ref.lastIndexOf(":") + 1) : ref;
  return bankTopic.get(id);
}

/** İstifadəçinin bütün cavabları: say, düzgünlər və fərqli mövzuların sayı. */
export async function getScoreStats(userId: string): Promise<ScoreStats> {
  const [rows, bank] = await Promise.all([
    db
      .select({ source: userAnswers.source, ref: userAnswers.questionRef, correct: userAnswers.correct })
      .from(userAnswers)
      .where(eq(userAnswers.userId, userId)),
    listRepetitorTopics(),
  ]);
  const bankTopic = new Map(bank.flatMap((t) => t.questions.map((q) => [q.id, t.name] as const)));
  const topics = new Set<string>();
  for (const r of rows) {
    const topic = topicOfAnswer(r.source, r.ref, bankTopic);
    if (topic) topics.add(topic);
  }
  return { total: rows.length, correct: rows.filter((r) => r.correct).length, topics: topics.size };
}
