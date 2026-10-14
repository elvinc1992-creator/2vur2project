import "server-only";
import { redirect } from "next/navigation";
import { auth } from "@/auth";
import { todayIn } from "@/lib/repetitor/plan";
import { listQuestionPool, listRepetitorTopics, type RepetitorTopicWithQuestions } from "@/lib/repetitor/source";
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

/** Toxumlu təsadüfi ardıcıllıq (mulberry32): eyni istifadəçi və gün üçün həmişə eyni. */
export function seededRand(seed: string): () => number {
  let h = 1779033703 ^ seed.length;
  for (let i = 0; i < seed.length; i++) {
    h = Math.imul(h ^ seed.charCodeAt(i), 3432918353);
    h = (h << 13) | (h >>> 19);
  }
  let a = h >>> 0;
  return () => {
    a = (a + 0x6d2b79f5) | 0;
    let t = Math.imul(a ^ (a >>> 15), 1 | a);
    t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t;
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
  };
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
  // Yeni dəst — cari bankdan; dəstdəki suallar isə bütün hovuzdan tanınır (gün ərzində bank yenilənsə də işləsin).
  const [bank, pool] = await Promise.all([listRepetitorTopics(), listQuestionPool()]);
  const today = todayIn(now);
  const known = new Set(pool.flatMap((t) => t.questions.map((q) => q.id)));
  let state!: DemoState;
  // Seçim istifadəçi + gün ilə toxumlanır: paralel sorğular və ya təkrar seçim eyni dəsti verir.
  const rand = () => seededRand(`${uid}:${today}`);
  await updateDemoState(uid, (s) => {
    const answered = new Set([...Object.keys(s.daily), ...Object.keys(s.tutor ?? {})]);
    if (s.dailySet?.date !== today) {
      s.dailySet = pickDailySet(bank, answered, today, rand());
    } else {
      // Gün ərzində dəst dəyişmir; yalnız bütün sualları bankdan çıxmış mövzu (məs. köhnə test sualları) əvəz olunur.
      const keep = s.dailySet.topics.filter((t) => t.ids.some((id) => known.has(id)));
      if (keep.length < s.dailySet.topics.length) {
        const rest = bank.filter((t) => !keep.some((k) => k.slug === t.slug));
        const extra = pickDailySet(rest, answered, today, rand()).topics.slice(0, DAILY_TOPICS_PER_DAY - keep.length);
        s.dailySet = { date: today, topics: [...keep, ...extra] };
      }
    }
    state = s;
  });
  return { state, ctx: buildDailyCtx(state, pool) };
}

/** Server komponentləri üçün: giriş yoxlaması + vəziyyət + bu günün sualları. */
export async function requireDaily(next: string) {
  const session = await auth();
  if (!session?.user?.id) redirect(`/daxil-ol?next=${encodeURIComponent(next)}`);
  const { state, ctx } = await ensureDaily(session.user.id);
  return { user: session.user, state, ctx };
}
