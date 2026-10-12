import "server-only";
import { optionalDemo } from "@/lib/demo/session";
import { canReadTheory, topicLessons, tutorContext } from "./progress";
import { getTopicTheory, listAllRepetitorTopics, type RepetitorTopicWithQuestions } from "./source";

export type TheoryAccess = {
  topic: RepetitorTopicWithQuestions;
  /** Mövzu səhifəsindəki kimi: açıq dərsi olan (və ya hələ sualı olmayan) mövzunun nəzəriyyəsi oxunur. */
  allowed: boolean;
  hasBook: boolean;
  /** Tədris sırasında növbəti mövzu (kitabın son səhifəsi üçün). */
  next: string | null;
};

/** Nəzəriyyə kitabına giriş: həm səhifə, həm kitabın HTML-ini verən route eyni qaydanı işlədir. */
export async function theoryAccess(slug: string): Promise<TheoryAccess | null> {
  const all = await listAllRepetitorTopics();
  const i = all.findIndex((t) => t.slug === slug);
  if (i < 0) return null;
  const topic = all[i];
  const { state } = await optionalDemo();
  const ctx = await tutorContext(state);
  const allowed = canReadTheory(topic, topicLessons(ctx, state, slug));
  const theory = allowed ? await getTopicTheory(slug) : null;
  return { topic, allowed, hasBook: theory?.hasBook ?? false, next: all[i + 1]?.name ?? null };
}
