import "server-only";
import { EXAM_QUESTIONS, TOPICS, type Letter, type TopicSlug } from "@/lib/demo/content";
import { EXAM_KEYS } from "@/lib/demo/keys";
import { DEMO_TO_REAL } from "@/lib/demo/personal";
import { getRepetitorKey, listRepetitorTopics } from "@/lib/repetitor/source";

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
  options: Record<Letter, string>;
  /** Toplu istinadı. */
  bookRef: string;
  /** Sualın öz səhifəsi (həll orada). */
  href: string;
};

export type PracticeKey = { answer: Letter; steps: string[] };

/** d:id / r:id (köhnə) → q:id. */
export const normRef = (ref: string) => ref.replace(/^[dr]:/, "q:");

// Sınaq mövzuları (demo slug) → bankın mövzu slug-ı.
const REAL_SLUG: Record<string, string> = {
  faiz: "faiz-nisbet-tenasub",
  funksiya: "funksiya-ve-qrafikler",
  triqonometriya: "triqonometriya",
  ucbucaq: "ucbucaqlar",
  loqarifm: "loqarifm-ustlu-tenlik-berabersizlik",
  ardicilliq: "ededi-ardicilliqlar-silsileler",
  feza: "stereometriya",
};

export async function practicePool(): Promise<PracticeQuestion[]> {
  const bank: PracticeQuestion[] = (await listRepetitorTopics()).flatMap((t) =>
    t.questions.map((q) => ({
      ref: `q:${q.id}`,
      source: "bank" as const,
      family: t.slug,
      topicName: t.name,
      type: q.type,
      text: q.text,
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
