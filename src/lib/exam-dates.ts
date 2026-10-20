import "server-only";
import { asc, eq } from "drizzle-orm";
import { unstable_cache } from "next/cache";
import { db } from "@/db";
import { examDates, type ExamDateType } from "@/db/schema";

export const EXAM_DATES_TAG = "exam-dates";

/** Brauzerə gedən forma (Date yox, ms — cache JSON-a serializasiya edir). */
export type ExamDateView = { type: ExamDateType; title: string; at: number; estimated: boolean };

/** Aktiv imtahan tarixləri — 10 dəqiqəlik cache; admin dəyişəndə tag ilə dərhal təzələnir. */
export const getExamDates = unstable_cache(
  async (): Promise<ExamDateView[]> => {
    const rows = await db.select().from(examDates).where(eq(examDates.isActive, true)).orderBy(asc(examDates.examDate));
    return rows.map((r) => ({ type: r.examType, title: r.title, at: r.examDate.getTime(), estimated: r.isEstimated }));
  },
  ["exam-dates-v1"],
  { revalidate: 600, tags: [EXAM_DATES_TAG] },
);

/**
 * Hər tip üçün ən yaxın gələcək tarix (keçmiş və ya daxil edilməmiş — null) və hesablama anı.
 * Server komponenti bir dəfə render olunur — "indi" burada götürülür və brauzerə ötürülür.
 */
export async function nextExamDates(): Promise<{ now: number; dates: Record<ExamDateType, ExamDateView | null> }> {
  const now = Date.now();
  let rows: ExamDateView[] = [];
  try {
    rows = await getExamDates();
  } catch (e) {
    console.error("[exam-dates] yüklənmədi", e);
  }
  const pick = (type: ExamDateType) => rows.find((r) => r.type === type && r.at > now) ?? null;
  return { now, dates: { buraxilis_9: pick("buraxilis_9"), buraxilis_11: pick("buraxilis_11"), blok: pick("blok") } };
}

/** Profildən imtahan tipi: qəbul → blok; 9-cu sinif → 9-cu buraxılış; qalanı → 11-ci buraxılış. */
export function examTypeOf(user: { grade: number | null; targetExam: string | null }): ExamDateType {
  if (user.targetExam === "qebul") return "blok";
  if (user.grade === 9) return "buraxilis_9";
  return "buraxilis_11";
}
