"use server";

import { and, eq, gte } from "drizzle-orm";
import { redirect } from "next/navigation";
import { auth } from "@/auth";
import { db } from "@/db";
import { taskOptionErrors, topics, userAnswers, userTopicStats, weakPracticeSets } from "@/db/schema";
import { LETTERS, type Letter } from "@/lib/demo/content";
import { addDaysIso, todayIn } from "@/lib/repetitor/plan";
import { getRepetitorKeys, getRepetitorTopic } from "@/lib/repetitor/source";
import { fixSize, GROWING_BELOW } from "./compute";
import { canonical, refreshWeakTopics } from "./data";
import { spreadCorrect, type LetterMap } from "./spread";

// "N sualla düzəlt" (hədəfli məşq) və təkrar yoxlama (5 sual).

const RECENT_DAYS = 14;
const RECHECK_SIZE = 5;
const RECHECK_AFTER_DAYS = 3;
const DAY = 86_400_000;

export type SetItem = { code: string; map: LetterMap };

async function userId() {
  const session = await auth();
  if (!session?.user?.id) redirect("/daxil-ol?next=%2Fzeif-movzular");
  return session.user.id;
}

function shuffle<T>(xs: T[]): T[] {
  const a = [...xs];
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a;
}

/** Son 14 gündə həll edilmiş suallar (dəstə düşmür). */
async function recentCodes(uid: string) {
  const rows = await db
    .select({ source: userAnswers.source, ref: userAnswers.questionRef })
    .from(userAnswers)
    .where(and(eq(userAnswers.userId, uid), gte(userAnswers.answeredAt, new Date(Date.now() - RECENT_DAYS * DAY))));
  return new Set(rows.map((r) => canonical(r.source, r.ref)));
}

async function createSet(uid: string, slug: string, kind: "fix" | "recheck") {
  const topic = await getRepetitorTopic(slug);
  const [meta] = await db.select({ id: topics.id }).from(topics).where(eq(topics.slug, slug));
  if (!topic || !meta || !topic.questions.length) redirect("/zeif-movzular");

  const [stat] = await db
    .select()
    .from(userTopicStats)
    .where(and(eq(userTopicStats.userId, uid), eq(userTopicStats.topicId, meta.id)));
  const recent = await recentCodes(uid);
  const all = topic.questions;
  const fresh = all.filter((q) => !recent.has(q.id));
  const pool = fresh.length >= RECHECK_SIZE ? fresh : all;

  let chosen: typeof all;
  if (kind === "recheck") {
    chosen = shuffle(pool).slice(0, RECHECK_SIZE);
  } else {
    const size = Math.min(fixSize(stat?.mastery ?? 0.5), pool.length);
    // Yarısı — əsas səhvə yönəlmiş suallar: səhv tipinə bağlı variantı olanlar, yoxdursa ən çox səhv edilən alt mövzu.
    let targeted: typeof all = [];
    if (stat?.mainErrorTypeId) {
      const linked = await db
        .select({ code: taskOptionErrors.taskCode })
        .from(taskOptionErrors)
        .where(eq(taskOptionErrors.errorTypeId, stat.mainErrorTypeId));
      const codes = new Set(linked.map((l) => l.code));
      targeted = pool.filter((q) => codes.has(q.id));
    } else if (stat?.mainError) {
      targeted = pool.filter((q) => q.type === stat.mainError);
    }
    const half = Math.ceil(size / 2);
    const first = shuffle(targeted).slice(0, half);
    const rest = shuffle(pool.filter((q) => !first.includes(q))).slice(0, size - first.length);
    chosen = shuffle([...first, ...rest]);
  }

  // Düzgün cavablar A–E üzrə paylanır (variantların yeri dəyişdirilir).
  const keys = await getRepetitorKeys(chosen.map((q) => q.id));
  const maps = spreadCorrect(
    chosen.map((q) => keys.get(q.id)?.answer ?? "A"),
    Math.floor(Math.random() * LETTERS.length),
  );
  const items: SetItem[] = chosen.map((q, i) => ({ code: q.id, map: maps[i] }));
  const id = crypto.randomUUID();
  await db.insert(weakPracticeSets).values({
    id,
    userId: uid,
    topicId: meta.id,
    kind,
    questionIds: JSON.stringify(items),
    createdAt: new Date(),
  });
  redirect(`/zeif-movzular/mesq/${id}`);
}

export async function startFixAction(formData: FormData) {
  await createSet(await userId(), String(formData.get("topic") ?? ""), "fix");
}

export async function startRecheckAction(formData: FormData) {
  await createSet(await userId(), String(formData.get("topic") ?? ""), "recheck");
}

/** Dəsti bitirir: cavablar user_answers-ə yazılır, nəticəyə görə təkrar yoxlama təyin olunur, mövzu yenidən hesablanır. */
export async function submitPracticeAction(setId: string, formData: FormData) {
  const uid = await userId();
  const [set] = await db.select().from(weakPracticeSets).where(and(eq(weakPracticeSets.id, setId), eq(weakPracticeSets.userId, uid)));
  if (!set) redirect("/zeif-movzular");
  if (set.finishedAt) redirect(`/zeif-movzular/mesq/${setId}`);

  const items = JSON.parse(set.questionIds) as SetItem[];
  const keys = await getRepetitorKeys(items.map((i) => i.code));
  const [topic] = await db.select({ slug: topics.slug }).from(topics).where(eq(topics.id, set.topicId));
  const answers: Record<string, Letter> = {};
  let correct = 0;
  const rows: Array<typeof userAnswers.$inferInsert> = [];
  for (const it of items) {
    const shown = formData.get(`q-${it.code}`);
    if (typeof shown !== "string" || !(LETTERS as readonly string[]).includes(shown)) continue;
    const original = it.map[shown as Letter];
    const ok = original === keys.get(it.code)?.answer;
    answers[it.code] = shown as Letter;
    if (ok) correct++;
    rows.push({
      userId: uid,
      source: "review",
      questionRef: `w:${setId}:${it.code}`,
      correct: ok,
      topicSlug: topic?.slug ?? null,
      chosen: original,
    });
  }
  if (rows.length) await db.insert(userAnswers).values(rows);
  await db
    .update(weakPracticeSets)
    .set({ answers: JSON.stringify(answers), correct, finishedAt: new Date() })
    .where(eq(weakPracticeSets.id, setId));

  const passed = items.length > 0 && correct / items.length >= GROWING_BELOW;
  const today = todayIn();
  const stat = and(eq(userTopicStats.userId, uid), eq(userTopicStats.topicId, set.topicId));
  await refreshWeakTopics(uid, topic ? [topic.slug] : undefined);
  if (set.kind === "fix" && passed) {
    await db.update(userTopicStats).set({ nextReviewAt: addDaysIso(today, RECHECK_AFTER_DAYS) }).where(stat);
  } else if (set.kind === "recheck") {
    await db
      .update(userTopicStats)
      .set(passed ? { nextReviewAt: null, masteredAt: new Date() } : { nextReviewAt: null, masteredAt: null, status: "weak" })
      .where(stat);
  }
  if (set.kind === "recheck" && passed) await refreshWeakTopics(uid, topic ? [topic.slug] : undefined);
  redirect(`/zeif-movzular/mesq/${setId}`);
}
