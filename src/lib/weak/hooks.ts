import "server-only";
import type { ExamQuestion } from "@/lib/exams/types";
import { refreshWeakTopics } from "./data";

/** Sınaq bitdi: yalnız sınaqdakı mövzular yenidən hesablanır. Xəta sınağın nəticəsinə mane olmur. */
export async function afterExamFinished(uid: string, questions: Pick<ExamQuestion, "topic">[]) {
  const slugs = [...new Set(questions.map((q) => q.topic))];
  try {
    await refreshWeakTopics(uid, slugs);
  } catch (e) {
    console.error("weak topics refresh failed", e);
  }
}
