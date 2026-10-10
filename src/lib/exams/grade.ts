import type { ExamResult } from "@/lib/demo/state";
import type { ExamKey, ExamQuestion } from "./types";

// Sınağın qiymətləndirilməsi — təmiz funksiya. Qapalı və kodlaşdırılan avtomatik, yazılı — əl ilə (pending).

export function normalizeCoded(value: string): number | null {
  const v = value.trim().replace(/\s/g, "").replace(",", ".").replace("−", "-");
  if (!/^-?\d+(\.\d+)?$/.test(v)) return null;
  return Number(v);
}

export function isCorrect(q: Pick<ExamQuestion, "format">, key: ExamKey | undefined, given: string | undefined): boolean | null {
  if (q.format === "written") return null;
  if (!given || !key) return false;
  if (q.format === "closed") return given === key.answer;
  const a = normalizeCoded(given);
  return a !== null && a === normalizeCoded(key.answer);
}

/** Bal: hər avtomatik yoxlanan düzgün cavab — 100 / sual sayı (yazılılar yoxlanandan sonra əlavə olunur). */
export function gradeExam(
  questions: ExamQuestion[],
  keys: Map<number, ExamKey>,
  answers: Record<string, string>,
  timedOut = false,
): ExamResult {
  let correct = 0;
  let wrong = 0;
  let empty = 0;
  let pending = 0;
  const topic = new Map<string, { name: string; ok: number; total: number }>();
  const weakTypes = new Map<string, { topic: string; topicName: string; type: string; ref: string }>();
  const items: NonNullable<ExamResult["items"]> = {};

  for (const q of questions) {
    const given = answers[String(q.n)];
    const ok = isCorrect(q, keys.get(q.n), given);
    items[q.n] = { code: q.code, ok };
    if (q.format === "written") {
      if (given) pending++;
      else empty++;
      continue;
    }
    const t = topic.get(q.topic) ?? { name: q.topicName, ok: 0, total: 0 };
    t.total++;
    if (!given) empty++;
    else if (ok) correct++;
    else wrong++;
    if (ok) t.ok++;
    else if (!weakTypes.has(q.type)) weakTypes.set(q.type, { topic: q.topic, topicName: q.topicName, type: q.type, ref: q.ref });
    topic.set(q.topic, t);
  }

  const byTopic = [...topic].map(([slug, v]) => ({ topic: slug, ...v }));
  const weakTopics = new Set(byTopic.filter((t) => t.ok / t.total < 0.5).map((t) => t.topic));
  const weak = [...weakTypes.values()]
    .sort((a, b) => Number(weakTopics.has(b.topic)) - Number(weakTopics.has(a.topic)))
    .slice(0, 3);

  return {
    score: Math.round((correct * 100) / Math.max(1, questions.length)),
    correct,
    wrong,
    empty,
    pending,
    byTopic,
    weak,
    answers,
    items,
    timedOut,
    finishedAt: Date.now(),
  };
}
