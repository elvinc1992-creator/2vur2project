import "server-only";
import { DAILY, type TopicSlug } from "./content";
import { isCorrectDaily } from "./logic";
import type { DemoState } from "./state";

/**
 * Demo mövzuları → Excel-dəki real mövzular (ada görə uyğunlaşdırma).
 * Real cavab bazası gələndə bu xəritə lazım olmayacaq.
 */
export const DEMO_TO_REAL: Record<TopicSlug, string> = {
  faiz: "Faiz. Nisbət. Tənasüb",
  funksiya: "Funksiya və qrafiklər",
  triqonometriya: "Triqonometriya",
  ucbucaq: "Üçbucaqlar",
  loqarifm: "Loqarifm, üstlü tənlik/bərabərsizlik",
  ardicilliq: "Ədədi ardıcıllıqlar. Silsilələr",
  feza: "Stereometriya",
};

export type Personal = { ok: number; total: number; pct: number };

/** İstifadəçinin real mövzu adı üzrə düzgün cavab faizi: günün sualları + bitmiş sınaqlar. */
export function personalByTopic(state: DemoState): Map<string, Personal> {
  const acc = new Map<string, { ok: number; total: number }>();
  const add = (slug: TopicSlug, ok: number, total: number) => {
    const name = DEMO_TO_REAL[slug];
    const cur = acc.get(name) ?? { ok: 0, total: 0 };
    acc.set(name, { ok: cur.ok + ok, total: cur.total + total });
  };
  for (const q of DAILY) if (state.daily[q.id]) add(q.topic, isCorrectDaily(state, q.id) ? 1 : 0, 1);
  for (const r of Object.values(state.results)) for (const t of r.byTopic) add(t.topic, t.ok, t.total);
  return new Map([...acc].filter(([, v]) => v.total > 0).map(([k, v]) => [k, { ...v, pct: v.ok / v.total }]));
}

/** Plan üçün kifayət qədər məlumat: ən azı bir bitmiş sınaq və ya 10 günün sualı. */
export function hasPlanData(state: DemoState) {
  return Object.keys(state.results).length > 0 || Object.keys(state.daily).length >= 10;
}

