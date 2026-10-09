import "server-only";
import { and, eq, gte, sql } from "drizzle-orm";
import { db } from "@/db";
import { userAnswers } from "@/db/schema";
import { WEEK_MS, type WeeklyStats } from "./weekly";

/** İstifadəçinin son 7 gündə cavabladığı suallar və onlardan düzgün olanlar. */
export async function getWeeklyStats(userId: string, now = Date.now()): Promise<WeeklyStats> {
  const [row] = await db
    .select({
      total: sql<number>`count(*)`,
      correct: sql<number>`coalesce(sum(${userAnswers.correct}), 0)`,
    })
    .from(userAnswers)
    .where(and(eq(userAnswers.userId, userId), gte(userAnswers.answeredAt, new Date(now - WEEK_MS))));
  return { total: Number(row?.total ?? 0), correct: Number(row?.correct ?? 0) };
}
