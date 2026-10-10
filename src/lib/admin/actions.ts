"use server";

import { and, count, eq, like } from "drizzle-orm";
import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import { db } from "@/db";
import { bankTasks, examItems, exams, subtopics, taskOptionErrors, topics, USER_ROLES, users } from "@/db/schema";
import { LETTERS } from "@/lib/demo/content";
import { createExam } from "@/lib/exams/create";
import { requireAdmin } from "./guard";

/* ---------------- İstifadəçilər ---------------- */

export async function setUserRoleAction(formData: FormData) {
  const me = await requireAdmin();
  const p = z.object({ id: z.string().min(1), role: z.enum(USER_ROLES) }).parse(Object.fromEntries(formData));
  // Özünü admin rolundan çıxarmaq olmaz (panelə giriş itməsin).
  if (p.id === me.id && p.role !== "admin") redirect("/admin/istifadeciler?xeta=ozun");
  await db.update(users).set({ role: p.role, updatedAt: new Date() }).where(eq(users.id, p.id));
  revalidatePath("/admin/istifadeciler");
}

/* ---------------- Suallar ---------------- */

const FORMATS = ["closed", "open", "matching", "written"] as const;

const questionSchema = z.object({
  code: z.string().trim().optional(),
  topicId: z.coerce.number().int().positive(),
  subtopicId: z.union([z.literal(""), z.coerce.number().int().positive()]),
  format: z.enum(FORMATS),
  body: z.string().trim().min(3, "Sualın mətni boşdur").max(5000),
  optA: z.string().trim().max(500).optional(),
  optB: z.string().trim().max(500).optional(),
  optC: z.string().trim().max(500).optional(),
  optD: z.string().trim().max(500).optional(),
  optE: z.string().trim().max(500).optional(),
  correct: z.union([z.literal(""), z.enum(LETTERS)]),
  answerValue: z.string().trim().max(500).optional(),
  matchingJson: z.string().trim().max(5000).optional(),
  matchingAnswer: z.string().trim().max(2000).optional(),
  solution: z.string().trim().max(8000).default(""),
  imageUrl: z.string().trim().max(500).optional(),
  imageAlt: z.string().trim().max(500).optional(),
  difficulty: z.coerce.number().int().min(1).max(3),
  points: z.coerce.number().min(0).max(20),
  status: z.enum(["draft", "published"]),
});

/** Mövzunun kod prefiksi: mövcud suallardan (FNT-0001 → FNT), yoxdursa slug-dan. */
async function nextCode(topicId: number) {
  const [sample] = await db.select({ code: bankTasks.code }).from(bankTasks).where(eq(bankTasks.topicId, topicId)).limit(1);
  const [t] = await db.select({ slug: topics.slug }).from(topics).where(eq(topics.id, topicId));
  const prefix =
    sample?.code.split("-")[0] ??
    (t?.slug ?? "SUAL")
      .split("-")
      .map((w) => w[0])
      .join("")
      .slice(0, 3)
      .toUpperCase()
      .padEnd(3, "X");
  const rows = await db.select({ code: bankTasks.code }).from(bankTasks).where(like(bankTasks.code, `${prefix}-%`));
  const max = Math.max(0, ...rows.map((r) => Number(r.code.split("-")[1]) || 0));
  return `${prefix}-${String(max + 1).padStart(4, "0")}`;
}

export type QuestionFormState = { error?: string } | undefined;

export async function saveQuestionAction(_prev: QuestionFormState, formData: FormData): Promise<QuestionFormState> {
  await requireAdmin();
  const parsed = questionSchema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { error: parsed.error.issues[0]?.message ?? "Məlumat düzgün deyil" };
  const p = parsed.data;

  let options: string | null = null;
  let matchingAnswer: string | null = null;
  if (p.format === "closed") {
    const opts = LETTERS.map((l) => ({ key: l, text: (p[`opt${l}` as const] ?? "").trim() }));
    if (opts.some((o) => !o.text)) return { error: "Qapalı sualın 5 variantı da doldurulmalıdır" };
    if (!p.correct) return { error: "Düzgün variantı seçin" };
    options = JSON.stringify(opts);
  } else if (p.format === "matching") {
    try {
      options = JSON.stringify(JSON.parse(p.matchingJson || "{}"));
      matchingAnswer = p.matchingAnswer ? JSON.stringify(JSON.parse(p.matchingAnswer)) : null;
    } catch {
      return { error: "Uyğunluq sualının JSON-u düzgün deyil" };
    }
  } else if (!p.answerValue && p.format === "open") {
    return { error: "Açıq sualın cavabını yazın" };
  }

  const values = {
    topicId: p.topicId,
    subtopicId: p.subtopicId === "" ? null : p.subtopicId,
    format: p.format,
    body: p.body,
    options,
    correctOption: p.format === "closed" ? p.correct || null : null,
    matchingAnswer,
    answerValue: p.format === "open" || p.format === "written" ? p.answerValue || null : null,
    solution: p.solution,
    imageUrl: p.imageUrl || null,
    imageAlt: p.imageAlt || null,
    difficulty: p.difficulty,
    points: p.points,
    status: p.status,
  };

  let code = p.code;
  if (code) {
    await db.update(bankTasks).set(values).where(eq(bankTasks.code, code));
  } else {
    code = await nextCode(p.topicId);
    const [{ n }] = await db.select({ n: count() }).from(bankTasks).where(eq(bankTasks.topicId, p.topicId));
    await db.insert(bankTasks).values({ code, ...values, sortOrder: 100_000 + n });
  }
  revalidatePath("/admin/suallar");
  redirect(`/admin/suallar/${code}?saxlanildi=1`);
}

export async function deleteQuestionAction(formData: FormData) {
  await requireAdmin();
  const code = z.string().min(1).parse(formData.get("code"));
  const [{ n }] = await db.select({ n: count() }).from(examItems).where(eq(examItems.taskCode, code));
  if (n > 0) redirect(`/admin/suallar/${code}?xeta=sinaqda`);
  await db.delete(taskOptionErrors).where(eq(taskOptionErrors.taskCode, code));
  await db.delete(bankTasks).where(eq(bankTasks.code, code));
  revalidatePath("/admin/suallar");
  redirect("/admin/suallar?silindi=1");
}

/** Alt mövzular (sual formasında mövzuya görə seçim üçün). */
export async function subtopicsOf(topicId: number) {
  await requireAdmin();
  return db.select({ id: subtopics.id, title: subtopics.title }).from(subtopics).where(eq(subtopics.topicId, topicId)).orderBy(subtopics.sortOrder);
}

/* ---------------- Sınaqlar ---------------- */

export async function createExamAction(formData: FormData) {
  await requireAdmin();
  const key = z.enum(["buraxilis-9", "buraxilis-11", "qebul-11"]).parse(formData.get("blueprint"));
  const { id } = await createExam(key, { status: formData.get("status") === "draft" ? "draft" : "published" });
  revalidatePath("/admin/sinaqlar");
  redirect(`/admin/sinaqlar/${id}?yaradildi=1`);
}

export async function updateExamAction(formData: FormData) {
  await requireAdmin();
  const p = z
    .object({ id: z.string(), durationMin: z.coerce.number().int().min(10).max(300), status: z.enum(["published", "draft"]), title: z.string().trim().min(3).max(120) })
    .parse(Object.fromEntries(formData));
  await db.update(exams).set({ durationMin: p.durationMin, status: p.status, title: p.title }).where(eq(exams.id, p.id));
  revalidatePath("/admin/sinaqlar");
  redirect(`/admin/sinaqlar/${p.id}?saxlanildi=1`);
}

/** Sınağın bir sualını eyni mövzu və formatdan başqa sualla əvəz edir. */
export async function replaceExamItemAction(formData: FormData) {
  await requireAdmin();
  const p = z.object({ id: z.string(), n: z.coerce.number().int(), code: z.string().trim().toUpperCase().min(3) }).parse(Object.fromEntries(formData));
  const [task] = await db.select({ code: bankTasks.code }).from(bankTasks).where(eq(bankTasks.code, p.code));
  if (!task) redirect(`/admin/sinaqlar/${p.id}?xeta=kod`);
  await db.update(examItems).set({ taskCode: p.code }).where(and(eq(examItems.examId, p.id), eq(examItems.n, p.n)));
  redirect(`/admin/sinaqlar/${p.id}?saxlanildi=1`);
}

export async function deleteExamAction(formData: FormData) {
  await requireAdmin();
  const id = z.string().parse(formData.get("id"));
  await db.delete(examItems).where(eq(examItems.examId, id));
  await db.delete(exams).where(eq(exams.id, id));
  revalidatePath("/admin/sinaqlar");
  redirect("/admin/sinaqlar?silindi=1");
}
