import "server-only";
import type { MatchingOptions, PracticeFormat } from "@/lib/bank/check";
import type { Letter } from "@/lib/demo/content";
import { getRepetitorKey, getRepetitorKeys, listQuestionPool } from "@/lib/repetitor/source";
import type { RepetitorKey } from "@/lib/repetitor/types";

// Səhvlərim üçün vahid sual modeli: sual bankı (q:KOD — günün sualları, repetitor və sınaqlar eyni bankdandır).
// Cavab açarı ayrıca və yalnız serverdə (getPracticeKey). Köhnə ref-lər (d:id, r:id) normRef ilə q:id-yə çevrilir.

export type PracticeSource = "bank";

export type PracticeQuestion = {
  ref: string;
  source: PracticeSource;
  /** Oxşarlıq üçün mövzu (bankın mövzu slug-ı). */
  family: string;
  topicName: string;
  type: string;
  text: string;
  imageUrl?: string | null;
  imageAlt?: string | null;
  format: PracticeFormat;
  options?: Record<Letter, string>;
  matching?: MatchingOptions;
  selfCheck?: boolean;
  /** Toplu istinadı. */
  bookRef: string;
  /** Sualın öz səhifəsi (həll orada). */
  href: string;
};

export type PracticeKey = Omit<RepetitorKey, "hint">;

/** d:id / r:id (köhnə) → q:id. */
export const normRef = (ref: string) => ref.replace(/^[dr]:/, "q:");

const toPractice = ({ hint: _hint, ...k }: RepetitorKey): PracticeKey => k;

export async function practicePool(): Promise<PracticeQuestion[]> {
  return (await listQuestionPool()).flatMap((t) =>
    t.questions.map((q) => ({
      ref: `q:${q.id}`,
      source: "bank" as const,
      family: t.slug,
      topicName: t.name,
      type: q.type,
      text: q.text,
      imageUrl: q.imageUrl,
      imageAlt: q.imageAlt,
      format: q.format,
      options: q.options,
      matching: q.matching,
      selfCheck: q.selfCheck,
      bookRef: q.ref,
      href: "/sehvlerim",
    })),
  );
}

/** Bir neçə sualın açarı — bir sorğu ilə (səhvlər siyahısı üçün; N+1 olmasın). */
export async function getPracticeKeys(refs: string[]): Promise<Map<string, PracticeKey>> {
  const norm = [...new Set(refs.map(normRef))].filter((r) => r.startsWith("q:"));
  const bank = await getRepetitorKeys(norm.map((r) => r.slice(2)));
  const out = new Map<string, PracticeKey>();
  for (const ref of norm) {
    const k = bank.get(ref.slice(2));
    if (k) out.set(ref, toPractice(k));
  }
  return out;
}

export async function getPracticeKey(ref: string): Promise<PracticeKey | null> {
  const [kind, id] = normRef(ref).split(":");
  if (kind !== "q") return null;
  const k = await getRepetitorKey(id);
  return k ? toPractice(k) : null;
}
