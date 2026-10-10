import "server-only";
import { listQuestionPool } from "@/lib/repetitor/source";
import type { TopicSlug } from "./content";
import { isCorrectDaily } from "./logic";
import type { DemoState } from "./state";

/**
 * Sınağın demo mövzuları → Excel-dəki real mövzular (ada görə uyğunlaşdırma).
 * Günün sualları artıq bankdandır və real mövzuya bağlıdır.
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

/** Sınaq mövzuları (demo slug) → bankın mövzu slug-ı. */
export const DEMO_TO_SLUG: Record<TopicSlug, string> = {
  faiz: "faiz-nisbet-tenasub",
  funksiya: "funksiya-ve-qrafikler",
  triqonometriya: "triqonometriya",
  ucbucaq: "ucbucaqlar",
  loqarifm: "loqarifm-ustlu-tenlik-berabersizlik",
  ardicilliq: "ededi-ardicilliqlar-silsileler",
  feza: "stereometriya",
};

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
  for (const r of Object.values(state.results)) for (const t of r.byTopic) add(DEMO_TO_REAL[t.topic], t.ok, t.total);
  return new Map([...acc].filter(([, v]) => v.total > 0).map(([k, v]) => [k, { ...v, pct: v.ok / v.total }]));
}

/** Plan üçün kifayət qədər məlumat: ən azı bir bitmiş sınaq və ya 10 günün sualı. */
export function hasPlanData(state: DemoState) {
  return Object.keys(state.results).length > 0 || Object.keys(state.daily).length >= 10;
}
