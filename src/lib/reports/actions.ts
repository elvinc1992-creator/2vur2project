"use server";

import { randomUUID } from "node:crypto";
import { auth } from "@/auth";
import { db } from "@/db";
import { QUESTION_REPORT_SOURCES, questionReports, type QuestionReportSource } from "@/db/schema";
import { HOUR, rateLimit } from "@/lib/rate-limit";

// "use server" faylı yalnız async funksiya ixrac edə bilər — eyni limit formada da var (report-question.tsx).
const REPORT_MAX = 500;

export type ReportState = { ok: boolean; error?: string } | null;

/** Sualdakı səhv barədə istifadəçinin qısa rəyi. Yalnız daxil olmuş istifadəçi; saatda ən çox 20 bildiriş. */
export async function reportQuestionAction(
  target: { code: string; source: QuestionReportSource; context?: string | null },
  text: string,
): Promise<ReportState> {
  const session = await auth();
  const uid = session?.user?.id;
  if (!uid) return { ok: false, error: "Bildiriş üçün daxil ol." };

  const body = text.trim();
  const code = target.code.trim().slice(0, 100);
  if (!code || !QUESTION_REPORT_SOURCES.includes(target.source)) return { ok: false, error: "Sual tapılmadı." };
  if (body.length < 3) return { ok: false, error: "Səhvi qısaca yaz (ən azı 3 simvol)." };
  if (body.length > REPORT_MAX) return { ok: false, error: `Ən çox ${REPORT_MAX} simvol.` };

  const rl = await rateLimit(`question-report:${uid}`, 20, HOUR);
  if (!rl.ok) return { ok: false, error: "Çox bildiriş göndərdin — bir az sonra yenidən cəhd et." };

  await db.insert(questionReports).values({
    id: randomUUID(),
    userId: uid,
    code,
    source: target.source,
    context: target.context?.slice(0, 200) ?? null,
    text: body,
  });
  return { ok: true };
}
