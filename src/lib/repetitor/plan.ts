// Onlayn repetitor planı (Pro): istifadəçi həftənin günlərini seçir, həmin günlərdə mövzular sıra ilə açılır.
// - Mövzunun sualı SPLIT_THRESHOLD-dan çoxdursa, iki günə (iki hissəyə) bölünür.
// - Hər 2 mövzu bitəndən sonra həmin mövzuların suallarından EXAM_SIZE suallıq sınaq açılır.
// Təmiz funksiyalar — vəziyyət və tarix parametr kimi gəlir (test olunur).

import type { Letter } from "@/lib/demo/content";

export const SPLIT_THRESHOLD = 60;
export const EXAM_SIZE = 20;
export const TOPICS_PER_EXAM = 2;
/** Təklif olunan qrafik: həftənin 2-ci və 4-cü günləri (çərşənbə axşamı, cümə axşamı). */
export const DEFAULT_DAYS = [2, 4];
export const TIME_ZONE = "Asia/Baku";

/** 1 = bazar ertəsi … 7 = bazar. */
export type Weekday = 1 | 2 | 3 | 4 | 5 | 6 | 7;

export type TutorPlan = {
  days: number[];
  /** Qrafikin başladığı (və ya son dəyişdirildiyi) gün, YYYY-MM-DD. */
  start: string;
  /** Qrafik dəyişəndə artıq açılmış dərslərin sayı — onlar açıq qalır. */
  offset: number;
};

export type TutorExamRecord = {
  answers: Record<string, Letter>;
  /** Sual id → düzgündür (cavabsız — false). */
  results: Record<string, boolean>;
  finishedAt: number;
};

type TopicInput = { slug: string; name: string; questions: Array<{ id: string }> };

export type Lesson = {
  index: number;
  topic: string;
  topicName: string;
  /** 1 və ya 2. */
  part: number;
  parts: number;
  questionIds: string[];
  /** Mövzu daxilində ilk sualın nömrəsi (1-dən). */
  firstN: number;
};

export type TutorExam = {
  /** 1, 2, 3… */
  n: number;
  topics: Array<{ slug: string; name: string }>;
  questionIds: string[];
  /** Bu sınaqdan əvvəlki son dərsin indeksi. */
  afterLesson: number;
};

export type Curriculum = { lessons: Lesson[]; exams: TutorExam[] };

/** Mövzular (sırası ilə) → dərslər və sınaqlar. Sualı olmayan mövzular plana düşmür. */
export function buildCurriculum(topics: TopicInput[]): Curriculum {
  const lessons: Lesson[] = [];
  const exams: TutorExam[] = [];
  let pair: TopicInput[] = [];

  for (const t of topics) {
    const ids = t.questions.map((q) => q.id);
    if (!ids.length) continue;
    const parts = ids.length > SPLIT_THRESHOLD ? 2 : 1;
    const size = Math.ceil(ids.length / parts);
    for (let p = 0; p < parts; p++) {
      lessons.push({
        index: lessons.length,
        topic: t.slug,
        topicName: t.name,
        part: p + 1,
        parts,
        questionIds: ids.slice(p * size, (p + 1) * size),
        firstN: p * size + 1,
      });
    }
    pair.push(t);
    if (pair.length === TOPICS_PER_EXAM) {
      exams.push({
        n: exams.length + 1,
        topics: pair.map((x) => ({ slug: x.slug, name: x.name })),
        questionIds: mixQuestions(pair.map((x) => x.questions.map((q) => q.id))),
        afterLesson: lessons.length - 1,
      });
      pair = [];
    }
  }
  return { lessons, exams };
}

/** Mövzulardan növbə ilə sual götürür (A1, B1, A2, B2…) — EXAM_SIZE-a qədər. */
function mixQuestions(lists: string[][]): string[] {
  const out: string[] = [];
  for (let i = 0; out.length < EXAM_SIZE && lists.some((l) => i < l.length); i++) {
    for (const l of lists) if (i < l.length && out.length < EXAM_SIZE) out.push(l[i]);
  }
  return out;
}

/* ---------------- Tarixlər (Bakı vaxtı) ---------------- */

export function todayIn(now = new Date()): string {
  return new Intl.DateTimeFormat("en-CA", { timeZone: TIME_ZONE }).format(now);
}

const toUtc = (iso: string) => new Date(`${iso}T00:00:00Z`);
const toIso = (d: Date) => d.toISOString().slice(0, 10);

export function addDaysIso(iso: string, n: number): string {
  const d = toUtc(iso);
  d.setUTCDate(d.getUTCDate() + n);
  return toIso(d);
}

/** 1 = bazar ertəsi … 7 = bazar. */
export function weekdayOf(iso: string): number {
  return ((toUtc(iso).getUTCDay() + 6) % 7) + 1;
}

/** Başlanğıc gündən (daxil) seçilmiş həftə günlərinə düşən n-ci tarix (n 0-dan). */
function nthPlanDate(plan: TutorPlan, n: number): string {
  let d = plan.start;
  let seen = -1;
  for (;;) {
    if (plan.days.includes(weekdayOf(d))) seen++;
    if (seen === n) return d;
    d = addDaysIso(d, 1);
  }
}

/** Bu günə qədər (daxil) açılmış dərslərin sayı. */
export function unlockedCount(plan: TutorPlan, today: string, total: number): number {
  if (!plan.days.length) return Math.min(total, plan.offset);
  let n = plan.offset;
  for (let d = plan.start; d <= today && n < total; d = addDaysIso(d, 1)) {
    if (plan.days.includes(weekdayOf(d))) n++;
  }
  return Math.min(total, n);
}

/** Dərsin açılma tarixi; qrafik dəyişməzdən əvvəl açılıbsa — null. */
export function lessonDate(plan: TutorPlan, index: number): string | null {
  if (index < plan.offset || !plan.days.length) return null;
  return nthPlanDate(plan, index - plan.offset);
}

/** Yeni qrafik: artıq açılmış dərslər açıq qalır, qalanları bu gündən yeni günlərə düşür. */
export function changePlan(old: TutorPlan | undefined, days: number[], today: string, total: number): TutorPlan {
  const sorted = [...new Set(days)].filter((d) => d >= 1 && d <= 7).sort();
  if (!old) return { days: sorted, start: today, offset: 0 };
  // Bu gün artıq açılmış dərslər sayılır; yeni qrafik sabahdan başlayır ki, bu gün ikinci dərs açılmasın.
  return { days: sorted, start: addDaysIso(today, 1), offset: unlockedCount(old, today, total) };
}

/* ---------------- Status ---------------- */

export type Answered = (questionId: string) => boolean;

export type LessonView = Lesson & {
  date: string | null;
  status: "done" | "open" | "locked";
  done: number;
};

export type ExamView = TutorExam & {
  status: "done" | "open" | "locked";
  correct?: number;
};

export type PlanView = {
  lessons: LessonView[];
  exams: ExamView[];
  /** Tamamilə bitmiş mövzular (✓). */
  doneTopics: Set<string>;
  unlocked: number;
};

export function planView(
  curr: Curriculum,
  plan: TutorPlan,
  answered: Answered,
  exams: Record<string, TutorExamRecord>,
  today: string,
): PlanView {
  const unlocked = unlockedCount(plan, today, curr.lessons.length);
  const lessons: LessonView[] = curr.lessons.map((l) => {
    const done = l.questionIds.filter(answered).length;
    const status = l.index >= unlocked ? "locked" : done === l.questionIds.length ? "done" : "open";
    return { ...l, date: lessonDate(plan, l.index), status, done };
  });
  const doneTopics = new Set<string>();
  for (const slug of new Set(lessons.map((l) => l.topic))) {
    if (lessons.filter((l) => l.topic === slug).every((l) => l.status === "done")) doneTopics.add(slug);
  }
  const examViews: ExamView[] = curr.exams.map((e) => {
    const rec = exams[examKey(e.n)];
    if (rec) return { ...e, status: "done", correct: Object.values(rec.results).filter(Boolean).length };
    return { ...e, status: e.topics.every((t) => doneTopics.has(t.slug)) ? "open" : "locked" };
  });
  return { lessons, exams: examViews, doneTopics, unlocked };
}

export const examKey = (n: number) => `sinaq-${n}`;
