import "server-only";
import { EXAM_QUESTIONS, TOPICS, type Letter, type TopicSlug } from "@/lib/demo/content";
import { EXAM_KEYS } from "@/lib/demo/keys";
import { DEMO_TO_REAL, DEMO_TO_SLUG } from "@/lib/demo/personal";
import { getRepetitorKey, getRepetitorKeys, listQuestionPool } from "@/lib/repetitor/source";

// Səhvlərim üçün vahid sual modeli: sual bankı (q:id — günün sualları və repetitor eyni bankdandır)
// və sınağın qapalı sualları (e:n). Cavab açarı ayrıca və yalnız serverdə (getPracticeKey).
// Köhnə ref-lər (d:id, r:id) normRef ilə q:id-yə çevrilir.

export type PracticeSource = "bank" | "exam";

export type PracticeQuestion = {
  ref: string;
  source: PracticeSource;
  /** Oxşarlıq üçün mövzu (bankın mövzu slug-ı; sınaq sualları da ona bağlanır). */
  family: string;
  topicName: string;
  type: string;
  text: string;
  imageUrl?: string | null;
  imageAlt?: string | null;
  options: Record<Letter, string>;
  /** Toplu istinadı. */
  bookRef: string;
  /** Sualın öz səhifəsi (həll orada). */
  href: string;
};

export type PracticeKey = { answer: Letter; steps: string[] };

/** d:id / r:id (köhnə) → q:id. */
export const normRef = (ref: string) => ref.replace(/^[dr]:/, "q:");

const REAL_SLUG: Record<string, string> = DEMO_TO_SLUG;

export async function practicePool(): Promise<PracticeQuestion[]> {
  const bank: PracticeQuestion[] = (await listQuestionPool()).flatMap((t) =>
    t.questions.map((q) => ({
      ref: `q:${q.id}`,
      source: "bank" as const,
      family: t.slug,
      topicName: t.name,
      type: q.type,
      text: q.text,
      imageUrl: q.imageUrl,
      imageAlt: q.imageAlt,
      options: q.options,
      bookRef: q.ref,
      href: "/sehvlerim",
    })),
  );
  const exam: PracticeQuestion[] = EXAM_QUESTIONS.filter((q) => q.format === "closed" && q.options).map((q) => ({
    ref: `e:${q.n}`,
    source: "exam",
    family: REAL_SLUG[q.topic] ?? q.topic,
    topicName: DEMO_TO_REAL[q.topic as TopicSlug] ?? TOPICS[q.topic as TopicSlug].name,
    type: q.type,
    text: q.text,
    options: q.options!,
    bookRef: q.ref,
    href: "/sinaqlar?f=owned",
  }));
  return [...bank, ...exam];
}

/** Bir neçə sualın açarı — bank sualları bir sorğu ilə (səhvlər siyahısı üçün; N+1 olmasın). */
export async function getPracticeKeys(refs: string[]): Promise<Map<string, PracticeKey>> {
  const norm = [...new Set(refs.map(normRef))];
  const bankIds = norm.filter((r) => r.startsWith("q:")).map((r) => r.slice(2));
  const bank = await getRepetitorKeys(bankIds);
  const out = new Map<string, PracticeKey>();
  for (const ref of norm) {
    const [kind, id] = ref.split(":");
    const k = kind === "q" ? bank.get(id) : kind === "e" ? EXAM_KEYS[Number(id)] : undefined;
    if (k) out.set(ref, { answer: k.answer as Letter, steps: k.steps });
  }
  return out;
}

export async function getPracticeKey(ref: string): Promise<PracticeKey | null> {
  const [kind, id] = normRef(ref).split(":");
  if (kind === "q") {
    const k = await getRepetitorKey(id);
    return k ? { answer: k.answer, steps: k.steps } : null;
  }
  if (kind === "e") {
    const k = EXAM_KEYS[Number(id)];
    return k ? { answer: k.answer as Letter, steps: k.steps } : null;
  }
  return null;
}
