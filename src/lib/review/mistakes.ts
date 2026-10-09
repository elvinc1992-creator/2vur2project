import "server-only";
import { EXAMS, type Letter } from "@/lib/demo/content";
import { canPracticeSimilar } from "@/lib/demo/plans";
import type { DemoState, ReviewSession } from "@/lib/demo/state";
import { getPracticeKey, normRef, type PracticeQuestion } from "./pool";

export type Mistake = {
  q: PracticeQuestion;
  chosen: Letter | "skip";
  correct: Letter;
  /** Harada səhv edilib: "Günün sualı", "Repetitor", "Buraxılış sınağı №1", "Təkrar". */
  where: "daily" | "tutor" | "exam" | "practice";
  examTitle?: string;
  href: string;
  fixed: boolean;
};

/**
 * Bütün səhvlər: günün sualı (səhv və ya "Bilmirəm"), repetitor, sınağın qapalı sualları (yanlış cavab),
 * təkrarda oxşar suala səhv cavab. Eyni sual bir dəfə göstərilir.
 */
export async function listMistakes(state: DemoState, pool: PracticeQuestion[]): Promise<Mistake[]> {
  const byRef = new Map(pool.map((q) => [q.ref, q]));
  const byText = new Map(pool.filter((q) => q.source === "bank").map((q) => [q.text, q]));
  const fixed = new Set(Object.keys(state.fixed ?? {}).map(normRef));
  const out = new Map<string, Mistake>();
  const add = async (ref: string, chosen: Letter | "skip", where: Mistake["where"], href?: string, examTitle?: string) => {
    const q = byRef.get(ref);
    const key = await getPracticeKey(ref);
    if (out.has(ref) || !q || !key || chosen === key.answer) return;
    out.set(ref, { q, chosen, correct: key.answer, where, examTitle, href: href ?? q.href, fixed: fixed.has(ref) });
  };

  for (const [id, a] of Object.entries(state.daily)) await add(`q:${id}`, a, "daily", "/gunun-suallari");
  for (const [id, p] of Object.entries(state.tutor ?? {})) if (p.a && !p.ok) await add(`q:${id}`, p.a, "tutor");
  for (const [examId, res] of Object.entries(state.results)) {
    const title = EXAMS.find((e) => e.id === examId)?.title;
    for (const [n, given] of Object.entries(res.answers)) {
      const examQ = byRef.get(`e:${n}`);
      if (!examQ || !given) continue;
      // Sınaq sualı bankdakı sualın eynisidirsə — bir sual kimi saxlanılır (q:…).
      const same = byText.get(examQ.text);
      await add(same ? same.ref : examQ.ref, given as Letter, "exam", `/sinaq/${examId}/netice`, title);
    }
  }
  for (const [ref, a] of Object.entries(state.practiceMistakes ?? {})) await add(normRef(ref), a, "practice");
  return [...out.values()];
}

/** Oxşar sual kimi təklif oluna bilərmi: yalnız bankdan və Pro/Premium planda. Sınaq sualları verilmir. */
function canOffer(state: DemoState, q: PracticeQuestion) {
  return q.source === "bank" && canPracticeSimilar(state);
}

export const REVIEW_MAX = 15;
const SIMILAR_PER_MISTAKE = 2;

/**
 * Təkrar seansı: hər aktiv səhvdən sonra 0–2 oxşar sual (əvvəl eyni tip, sonra eyni mövzu;
 * hələ həll olunmamışlar öndə). Ümumi say REVIEW_MAX-dan çox olmur, səhvlər prioritetdir.
 */
export function buildReview(state: DemoState, pool: PracticeQuestion[], mistakes: Mistake[]): ReviewSession["items"] {
  const active = mistakes.filter((m) => !m.fixed).slice(0, REVIEW_MAX);
  const per = active.length
    ? Math.max(0, Math.min(SIMILAR_PER_MISTAKE, Math.floor((REVIEW_MAX - active.length) / active.length)))
    : 0;
  const used = new Set(active.map((m) => m.q.ref));
  const answered = (q: PracticeQuestion) => {
    const id = q.ref.slice(2);
    return Boolean(state.daily[id] || state.tutor?.[id]?.a);
  };

  const items: ReviewSession["items"] = [];
  for (const m of active) {
    items.push({ ref: m.q.ref, kind: "mistake" });
    const similar = pool
      .filter((q) => !used.has(q.ref) && canOffer(state, q) && (q.type === m.q.type || q.family === m.q.family))
      .map((q) => ({ q, score: (q.type === m.q.type ? 0 : 2) + (answered(q) ? 1 : 0) }))
      .sort((a, b) => a.score - b.score)
      .slice(0, per);
    for (const { q } of similar) {
      used.add(q.ref);
      items.push({ ref: q.ref, kind: "similar" });
    }
  }
  return items;
}
