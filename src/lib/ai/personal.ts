import "server-only";
import { eq, inArray } from "drizzle-orm";
import { db } from "@/db";
import { examItems, userAnswers } from "@/db/schema";
import { priorityScore } from "./analysis";
import { getAiIndex, type AiTypeStat } from "./index";

export type PersonalTypeRow = { type: AiTypeStat; topic: string; correct: number; total: number; score: number };

/**
 * Şagirdin cavabları tiplər üzrə: düz / cəmi və prioritet (tezlik × səhv payı).
 * Hər açılışda canlı hesablanır — yeni cavab dərhal nəzərə alınır; ümumi statistika (index) 1 saat cache-dədir.
 */
export async function personalAnalysis(userId: string) {
  const [ix, answers] = await Promise.all([
    getAiIndex(),
    db.select({ source: userAnswers.source, ref: userAnswers.questionRef, correct: userAnswers.correct }).from(userAnswers).where(eq(userAnswers.userId, userId)),
  ]);

  // Sınaq cavabı: "examId:n" → sualın kodu (exam_items)
  const examRefs = answers.filter((a) => a.source === "exam" && /^[^:]+:\d+$/.test(a.ref)).map((a) => a.ref.split(":"));
  const examIds = [...new Set(examRefs.map(([id]) => id))];
  const items = examIds.length
    ? await db.select({ examId: examItems.examId, n: examItems.n, code: examItems.taskCode }).from(examItems).where(inArray(examItems.examId, examIds))
    : [];
  const examCode = new Map(items.map((i) => [`${i.examId}:${i.n}`, i.code]));

  const agg = new Map<number, { correct: number; total: number }>();
  let counted = 0;
  for (const a of answers) {
    const code = a.source === "exam" ? examCode.get(a.ref) : a.ref.replace(/^[qdr]:/, "");
    const sub = code ? ix.tasks[code]?.s : null;
    if (sub === null || sub === undefined) continue;
    counted++;
    const x = agg.get(sub) ?? { correct: 0, total: 0 };
    x.total++;
    if (a.correct) x.correct++;
    agg.set(sub, x);
  }

  const topicName = new Map(ix.topics.map((t) => [t.id, t.name]));
  const rows: PersonalTypeRow[] = [...agg].flatMap(([id, x]) => {
    const type = ix.types.find((t) => t.id === id);
    return type ? [{ type, topic: topicName.get(type.topicId) ?? "", ...x, score: priorityScore(type.shown, x.correct, x.total) }] : [];
  });

  return {
    answers: counted,
    priority: rows.filter((r) => r.score > 0).sort((a, b) => b.score - a.score).slice(0, 6),
    strong: rows
      .filter((r) => r.total >= 2 && r.correct / r.total >= 0.8)
      .sort((a, b) => b.type.shown - a.type.shown)
      .slice(0, 4),
  };
}
