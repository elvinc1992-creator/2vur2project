import "server-only";
import { listQuestionPool } from "@/lib/repetitor/source";
import { isCorrectDaily } from "./logic";
import type { DemoState } from "./state";

export type Personal = { ok: number; total: number; pct: number };

/** İstifadəçinin real mövzu adı üzrə düzgün cavab faizi: günün sualları (bankdan) + bitmiş sınaqlar. */
export async function personalByTopic(state: DemoState): Promise<Map<string, Personal>> {
  const topicOf = new Map<string, string>();
  for (const t of await listQuestionPool()) for (const q of t.questions) topicOf.set(q.id, t.name);

  const acc = new Map<string, { ok: number; total: number }>();
  const add = (name: string | undefined, ok: number, total: number) => {
    if (!name) return;
    const cur = acc.get(name) ?? { ok: 0, total: 0 };
    acc.set(name, { ok: cur.ok + ok, total: cur.total + total });
  };
  for (const id of Object.keys(state.daily)) add(topicOf.get(id), isCorrectDaily(state, id) ? 1 : 0, 1);
  for (const r of Object.values(state.results)) if (r.items) for (const t of r.byTopic) add(t.name, t.ok, t.total);
  return new Map([...acc].filter(([, v]) => v.total > 0).map(([k, v]) => [k, { ...v, pct: v.ok / v.total }]));
}

/** Plan üçün kifayət qədər məlumat: ən azı bir bitmiş sınaq və ya 10 günün sualı. */
export function hasPlanData(state: DemoState) {
  return Object.keys(state.results).length > 0 || Object.keys(state.daily).length >= 10;
}
