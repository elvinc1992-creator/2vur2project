import "server-only";
import { DAILY, EXAM_QUESTIONS, TOPICS, type Letter, type TopicSlug } from "@/lib/demo/content";
import { DAILY_KEYS, EXAM_KEYS } from "@/lib/demo/keys";
import { getRepetitorKey, listRepetitorTopics } from "@/lib/repetitor/source";

// Səhvlərim üçün vahid sual modeli: günün sualları (d:id), repetitor (r:id), sınağın qapalı sualları (e:n).
// Cavab açarı ayrıca və yalnız serverdə (getPracticeKey).

export type PracticeSource = "daily" | "tutor" | "exam";

export type PracticeQuestion = {
  ref: string;
  source: PracticeSource;
  /** Oxşarlıq üçün mövzu ailəsi (günün sualı, repetitor və sınaq mövzuları bir-birinə bağlanır). */
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

// Repetitor mövzuları (statistika slug-ları) → günün suallarının mövzu ailəsi.
const TUTOR_FAMILY: Record<string, string> = {
  stereometriya: "feza",
  "loqarifm-ustlu-tenlik-berabersizlik": "loqarifm",
  ucbucaqlar: "ucbucaq",
  triqonometriya: "triqonometriya",
  "limit-toreme-inteqral": "funksiya",
};

const dailyPos = (id: string) => {
  const q = DAILY.find((x) => x.id === id)!;
  return DAILY.filter((x) => x.topic === q.topic).findIndex((x) => x.id === id) + 1;
};

export async function practicePool(): Promise<PracticeQuestion[]> {
  const daily: PracticeQuestion[] = DAILY.map((q) => ({
    ref: `d:${q.id}`,
    source: "daily",
    family: q.topic,
    topicName: TOPICS[q.topic].name,
    type: q.type,
    text: q.text,
    options: q.options,
    bookRef: q.ref,
    href: `/gunun-suallari/${q.topic}/${dailyPos(q.id)}`,
  }));
  const tutor: PracticeQuestion[] = (await listRepetitorTopics()).flatMap((t) =>
    t.questions.map((q, i) => ({
      ref: `r:${q.id}`,
      source: "tutor" as const,
      family: TUTOR_FAMILY[t.slug] ?? t.slug,
      topicName: t.name,
      type: q.type,
      text: q.text,
      options: q.options,
      bookRef: q.ref,
      href: `/onlayn-repetitor/${t.slug}/${i + 1}`,
    })),
  );
  const exam: PracticeQuestion[] = EXAM_QUESTIONS.filter((q) => q.format === "closed" && q.options).map((q) => ({
    ref: `e:${q.n}`,
    source: "exam",
    family: q.topic,
    topicName: TOPICS[q.topic as TopicSlug].name,
    type: q.type,
    text: q.text,
    options: q.options!,
    bookRef: q.ref,
    href: "/sinaqlar?f=owned",
  }));
  return [...daily, ...tutor, ...exam];
}

export async function getPracticeKey(ref: string): Promise<PracticeKey | null> {
  const [kind, id] = ref.split(":");
  if (kind === "d") return DAILY_KEYS[id] ?? null;
  if (kind === "r") {
    const k = await getRepetitorKey(id);
    return k ? { answer: k.answer, steps: k.steps } : null;
  }
  if (kind === "e") {
    const k = EXAM_KEYS[Number(id)];
    return k ? { answer: k.answer as Letter, steps: k.steps } : null;
  }
  return null;
}
