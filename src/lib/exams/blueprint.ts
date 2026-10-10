import "server-only";
import { eq } from "drizzle-orm";
import { cache } from "react";
import { db } from "@/db";
import { examBlueprintSections } from "@/db/schema";
import type { ExamFormat } from "./types";

/** İmtahan quruluşu: bölmələr üzrə sual sayı (sual_tipleri_cedveli.txt → exam_blueprint_sections). */
export const examFormatOf = cache(async (blueprintKey: string): Promise<Record<ExamFormat, number>> => {
  const rows = await db.select().from(examBlueprintSections).where(eq(examBlueprintSections.blueprintKey, blueprintKey));
  const out: Record<ExamFormat, number> = { closed: 0, coded: 0, written: 0 };
  for (const r of rows) out[r.format === "closed" ? "closed" : r.format === "open" ? "coded" : "written"] += r.questionCount;
  return out;
});
