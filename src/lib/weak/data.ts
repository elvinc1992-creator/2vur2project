import "server-only";
import { and, eq, gte, inArray, isNotNull, sql } from "drizzle-orm";
import { db } from "@/db";
import {
  bankTasks,
  errorTypes,
  examBlueprints,
  subtopics,
  taskOptionErrors,
  topics,
  userAnswers,
  userLossHistory,
  users,
  userTopicStats,
} from "@/db/schema";
import { answerTopicResolver } from "@/lib/demo/answer-topic";
import { addDaysIso, todayIn } from "@/lib/repetitor/plan";
import {
  analyze,
  ERROR_WINDOW_DAYS,
  median,
  topGain,
  totalLoss,
  WINDOW_DAYS,
  type Attempt,
  type ExamType,
  type TopicMeta,
  type TopicResult,
} from "./compute";

// Zəif mövzular: bazadan oxuma → hesablama (compute.ts) → nəticənin keşi (user_topic_stats)
// və gündəlik bal itkisi tarixçəsi (user_loss_history).

const DAY = 86_400_000;
const HISTORY_DAYS = 30;
const BLUEPRINT: Record<ExamType, string> = { "9": "buraxilis-9", "11": "buraxilis-11", blok: "qebul-11" };

/** Cavab istinadının kanonik kodu: bank kodu və ya sınaq sualı "e:n". */
export const canonical = (_source: string, ref: string) => (ref.includes(":") ? ref.slice(ref.lastIndexOf(":") + 1) : ref);

const endOfDay = (iso: string) => Date.parse(`${iso}T23:59:59+04:00`);

export function examTypeOf(u: { grade: number | null; targetExam: string | null }): ExamType {
  if (u.grade !== null && u.grade <= 9) return "9";
  return u.targetExam === "qebul" ? "blok" : "11";
}

export const parseExamTypes = (s: string): ExamType[] =>
  s.split(",").map((x) => x.trim()).filter((x): x is ExamType => x === "9" || x === "11" || x === "blok");

export async function loadTopicMeta(): Promise<TopicMeta[]> {
  const rows = await db.select().from(topics).orderBy(topics.curriculumOrder);
  return rows.map((t) => ({
    id: t.id,
    slug: t.slug,
    name: t.name,
    section: t.section,
    dimFrequency: t.dimFrequency,
    examTypes: parseExamTypes(t.examTypes),
    prerequisiteId: t.prerequisiteId,
  }));
}

type Inputs = {
  topics: TopicMeta[];
  attempts: Attempt[];
  examType: ExamType;
  avgPoints: number;
  masteredAt: Map<number, number>;
  nextReview: Map<number, string>;
};

async function loadInputs(uid: string, now: number): Promise<Inputs> {
  const since = new Date(now - (WINDOW_DAYS + HISTORY_DAYS) * DAY);
  const [topicMeta, [user], rows, stats, resolve] = await Promise.all([
    loadTopicMeta(),
    db.select({ grade: users.grade, targetExam: users.targetExam }).from(users).where(eq(users.id, uid)),
    db.select().from(userAnswers).where(and(eq(userAnswers.userId, uid), gte(userAnswers.answeredAt, since))),
    db.select().from(userTopicStats).where(eq(userTopicStats.userId, uid)),
    answerTopicResolver(),
  ]);
  const examType = examTypeOf(user ?? { grade: null, targetExam: null });
  const [bp] = await db.select({ avg: examBlueprints.avgPoints }).from(examBlueprints).where(eq(examBlueprints.key, BLUEPRINT[examType]));

  const codes = [...new Set(rows.map((r) => canonical(r.source, r.questionRef)))];
  const [tasks, links, times] = await Promise.all([
    codes.length
      ? db
          .select({ code: bankTasks.code, difficulty: bankTasks.difficulty, subtopic: subtopics.title })
          .from(bankTasks)
          .leftJoin(subtopics, eq(subtopics.id, bankTasks.subtopicId))
          .where(inArray(bankTasks.code, codes))
      : [],
    codes.length
      ? db
          .select({ code: taskOptionErrors.taskCode, option: taskOptionErrors.option, id: errorTypes.id, name: errorTypes.name })
          .from(taskOptionErrors)
          .innerJoin(errorTypes, eq(errorTypes.id, taskOptionErrors.errorTypeId))
          .where(inArray(taskOptionErrors.taskCode, codes))
      : [],
    // Bütün istifadəçilər üzrə vaxt — median üçün (bu şagirdin sualları).
    db
      .select({ source: userAnswers.source, ref: userAnswers.questionRef, ms: userAnswers.timeMs })
      .from(userAnswers)
      .where(
        and(
          isNotNull(userAnswers.timeMs),
          codes.length
            ? sql`(${userAnswers.source} = 'exam' or ${inArray(userAnswers.questionRef, [...codes, ...codes.map((c) => `q:${c}`)])})`
            : sql`0`,
        ),
      ),
  ]);

  const task = new Map(tasks.map((t) => [t.code, t]));
  const link = new Map(links.map((l) => [`${l.code}:${l.option}`, { id: l.id, name: l.name }]));
  const timesBy = new Map<string, number[]>();
  for (const t of times) {
    const k = canonical(t.source, t.ref);
    timesBy.set(k, [...(timesBy.get(k) ?? []), t.ms!]);
  }
  const medians = new Map([...timesBy].map(([k, v]) => [k, median(v)]));

  const attempts: Attempt[] = [];
  for (const r of rows) {
    const q = canonical(r.source, r.questionRef);
    const topic = r.topicSlug ?? resolve(r.source, r.questionRef);
    if (!topic) continue;
    const t = task.get(q);
    attempts.push({
      topic,
      question: q,
      correct: r.correct,
      at: r.answeredAt.getTime(),
      difficulty: t?.difficulty ?? 2,
      timeMs: r.timeMs,
      changes: r.changes,
      flagged: r.flagged,
      medianMs: medians.get(q) ?? null,
      errorType: !r.correct && r.chosen ? (link.get(`${q}:${r.chosen}`) ?? null) : null,
      subtopic: t?.subtopic ?? null,
    });
  }

  return {
    topics: topicMeta,
    attempts,
    examType,
    avgPoints: bp?.avg ?? 4,
    masteredAt: new Map(stats.filter((s) => s.masteredAt).map((s) => [s.topicId, s.masteredAt!.getTime()])),
    nextReview: new Map(stats.filter((s) => s.nextReviewAt).map((s) => [s.topicId, s.nextReviewAt!])),
  };
}

const run = (inp: Inputs, now: number) =>
  analyze({ topics: inp.topics, attempts: inp.attempts, examType: inp.examType, avgPoints: inp.avgPoints, now, masteredAt: inp.masteredAt });

async function persistStats(uid: string, results: TopicResult[], now: number, only?: Set<string>) {
  const rows = results.filter((r) => !only || only.has(r.topic.slug));
  if (!rows.length) return;
  for (let i = 0; i < rows.length; i += 50) {
    await db
      .insert(userTopicStats)
      .values(
        rows.slice(i, i + 50).map((r) => ({
          userId: uid,
          topicId: r.topic.id,
          mastery: r.mastery,
          loss: r.loss,
          attempts: r.attempts,
          status: r.status,
          mainError: r.mainError?.name ?? null,
          mainErrorTypeId: r.mainError?.errorTypeId ?? null,
          mainErrorCount: r.mainError?.count ?? 0,
          guesses: r.guesses,
          rootTopicId: r.root?.id ?? null,
          updatedAt: new Date(now),
        })),
      )
      .onConflictDoUpdate({
        target: [userTopicStats.userId, userTopicStats.topicId],
        set: {
          mastery: sql`excluded.mastery`,
          loss: sql`excluded.loss`,
          attempts: sql`excluded.attempts`,
          status: sql`excluded.status`,
          mainError: sql`excluded.main_error`,
          mainErrorTypeId: sql`excluded.main_error_type_id`,
          mainErrorCount: sql`excluded.main_error_count`,
          guesses: sql`excluded.guesses`,
          rootTopicId: sql`excluded.root_topic_id`,
          updatedAt: sql`excluded.updated_at`,
        },
      });
  }
}

/** Gündəlik bal itkisi: bu gün yenilənir; çatışmayan keçmiş günlər cəhdlərdən bərpa olunur (məlumat itmir). */
async function persistHistory(uid: string, inp: Inputs, now: number): Promise<Array<{ date: string; loss: number }>> {
  const today = todayIn(new Date(now));
  const from = addDaysIso(today, -(HISTORY_DAYS - 1));
  const existing = await db
    .select({ date: userLossHistory.date, loss: userLossHistory.loss })
    .from(userLossHistory)
    .where(and(eq(userLossHistory.userId, uid), gte(userLossHistory.date, addDaysIso(from, -7))));
  const have = new Map(existing.map((r) => [r.date, r.loss]));
  const first = inp.attempts.length ? Math.min(...inp.attempts.map((a) => a.at)) : now;
  const fresh: Array<{ userId: string; date: string; loss: number }> = [];
  for (let d = addDaysIso(from, -7); d <= today; d = addDaysIso(d, 1)) {
    if (endOfDay(d) < first) continue;
    if (d !== today && have.has(d)) continue;
    const res = run(inp, Math.min(endOfDay(d), now));
    // Heç bir mövzuda kifayət qədər cavab yoxdursa — bu gün qrafikə düşmür (0 yanıltıcı olardı).
    if (d !== today && res.every((r) => r.status === "few")) continue;
    const loss = Math.round(totalLoss(res) * 100) / 100;
    have.set(d, loss);
    fresh.push({ userId: uid, date: d, loss });
  }
  if (fresh.length) {
    await db
      .insert(userLossHistory)
      .values(fresh)
      .onConflictDoUpdate({ target: [userLossHistory.userId, userLossHistory.date], set: { loss: sql`excluded.loss` } });
  }
  return [...have].map(([date, loss]) => ({ date, loss })).sort((a, b) => a.date.localeCompare(b.date));
}

export type WeakReport = {
  results: TopicResult[];
  examType: ExamType;
  total: number;
  gain: number;
  weak: number;
  growing: number;
  /** Təhlil edilən cavablar (son 90 gün). */
  answers: number;
  /** Bu həftəki dəyişiklik: bugünkü itki − 7 gün əvvəlki (mənfi — yaxşılaşma). */
  weekChange: number | null;
  /** Son 30 gün. */
  history: Array<{ date: string; loss: number }>;
  topErrors: Array<{ name: string; count: number }>;
  nextReview: Map<number, string>;
  /** Vaxtı çatmış təkrar yoxlama. */
  due: { topic: TopicMeta; date: string } | null;
};

/** Səhifə üçün tam hesabat; nəticə və tarixçə bazaya yazılır. */
export async function weakReport(uid: string, nowDate = new Date()): Promise<WeakReport> {
  const now = nowDate.getTime();
  const inp = await loadInputs(uid, now);
  const results = run(inp, now);
  const [, hist] = await Promise.all([persistStats(uid, results, now), persistHistory(uid, inp, now)]);
  const today = todayIn(nowDate);
  const weekAgo = hist.find((h) => h.date === addDaysIso(today, -7));
  const total = totalLoss(results);

  const errCount = new Map<string, number>();
  for (const a of inp.attempts) {
    if (a.correct || now - a.at > ERROR_WINDOW_DAYS * DAY) continue;
    const name = a.errorType?.name ?? a.subtopic;
    if (name) errCount.set(name, (errCount.get(name) ?? 0) + 1);
  }

  const dueEntry = [...inp.nextReview].filter(([, d]) => d <= today).sort((a, b) => a[1].localeCompare(b[1]))[0];
  const dueTopic = dueEntry ? inp.topics.find((t) => t.id === dueEntry[0]) : undefined;

  return {
    results,
    examType: inp.examType,
    total,
    gain: topGain(results),
    weak: results.filter((r) => r.status === "weak").length,
    growing: results.filter((r) => r.status === "growing").length,
    answers: inp.attempts.filter((a) => now - a.at <= WINDOW_DAYS * DAY).length,
    weekChange: weekAgo ? total - weekAgo.loss : null,
    history: hist.filter((h) => h.date > addDaysIso(today, -HISTORY_DAYS)),
    topErrors: [...errCount].sort((a, b) => b[1] - a[1]).slice(0, 5).map(([name, count]) => ({ name, count })),
    nextReview: inp.nextReview,
    due: dueTopic && dueEntry ? { topic: dueTopic, date: dueEntry[1] } : null,
  };
}

/** Yenidən hesablama: sınaq/məşq bitəndə yalnız həmin mövzular üçün (tarixçədə bugünkü cəm yenilənir). */
export async function refreshWeakTopics(uid: string, slugs?: string[], nowDate = new Date()) {
  const now = nowDate.getTime();
  const inp = await loadInputs(uid, now);
  const results = run(inp, now);
  await Promise.all([persistStats(uid, results, now, slugs ? new Set(slugs) : undefined), persistHistory(uid, inp, now)]);
}
