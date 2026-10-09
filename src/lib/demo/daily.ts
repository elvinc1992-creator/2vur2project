import "server-only";
import { redirect } from "next/navigation";
import { auth } from "@/auth";
import { todayIn } from "@/lib/repetitor/plan";
import { listRepetitorTopics, type RepetitorTopicWithQuestions } from "@/lib/repetitor/source";
import { DAILY_PER_TOPIC, DAILY_TOPICS_PER_DAY } from "./content";
import type { BankQuestion, DailyCtx } from "./logic";
import { updateDemoState, type DailySet, type DemoState } from "./state";

// Günün sualları: hər istifadəçi üçün hər gün sual bankından təsadüfi 4 mövzu × 5 sual.
// Dəst vəziyyətdə saxlanılır — gün ərzində dəyişmir; əvvəl həll olunmamış suallar üstündür.

type Bank = RepetitorTopicWithQuestions[];

function shuffle<T>(xs: T[], rand: () => number): T[] {
  const a = [...xs];
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(rand() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a;
}

/** Təsadüfi dəst: həll olunmamış sualı olan mövzular öndə, mövzu daxilində həll olunmamış suallar öndə. */
export function pickDailySet(bank: Bank, answered: Set<string>, date: string, rand: () => number = Math.random): DailySet {
  const fresh = (t: Bank[number]) => t.questions.filter((q) => !answered.has(q.id)).length;
  const topics = shuffle(
    bank.filter((t) => t.questions.length > 0),
    rand,
  )
    .sort((a, b) => Number(fresh(b) > 0) - Number(fresh(a) > 0))
    .slice(0, DAILY_TOPICS_PER_DAY);
  return {
    date,
    topics: topics.map((t) => {
      const qs = shuffle(t.questions, rand).sort((a, b) => Number(answered.has(a.id)) - Number(answered.has(b.id)));
      return { slug: t.slug, ids: qs.slice(0, DAILY_PER_TOPIC).map((q) => q.id) };
    }),
  };
}

export function buildDailyCtx(state: DemoState, bank: Bank): DailyCtx {
  const byId = new Map<string, BankQuestion>();
  for (const t of bank) for (const q of t.questions) byId.set(q.id, { ...q, topicName: t.name });
  const names = new Map(bank.map((t) => [t.slug, t.name]));
  const set = state.dailySet;
  return {
    date: set?.date ?? "",
    // Bankdan silinmiş suallar dəstdən çıxır.
    topics: (set?.topics ?? []).map((t) => ({ slug: t.slug, name: names.get(t.slug) ?? t.slug, ids: t.ids.filter((id) => byId.has(id)) })),
    byId,
  };
}

/** Bu günün dəsti yoxdursa (yeni gün) — seçib saxlayır. */
export async function ensureDaily(uid: string, now = new Date()): Promise<{ state: DemoState; ctx: DailyCtx }> {
  const bank = await listRepetitorTopics();
  const today = todayIn(now);
  let state!: DemoState;
  await updateDemoState(uid, (s) => {
    if (s.dailySet?.date !== today) {
      const answered = new Set([...Object.keys(s.daily), ...Object.keys(s.tutor ?? {})]);
      s.dailySet = pickDailySet(bank, answered, today);
    }
    state = s;
  });
  return { state, ctx: buildDailyCtx(state, bank) };
}

/** Server komponentləri üçün: giriş yoxlaması + vəziyyət + bu günün sualları. */
export async function requireDaily(next: string) {
  const session = await auth();
  if (!session?.user?.id) redirect(`/daxil-ol?next=${encodeURIComponent(next)}`);
  const { state, ctx } = await ensureDaily(session.user.id);
  return { user: session.user, state, ctx };
}
