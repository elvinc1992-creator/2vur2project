"use server";

import { and, eq } from "drizzle-orm";
import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import { auth } from "@/auth";
import { db } from "@/db";
import { bankTasks, errorTypes, taskOptionErrors, topics, users } from "@/db/schema";
import { LETTERS } from "@/lib/demo/content";

// Müəllim tərəfi: mövzuların DİM tezliyi, imtahan tipləri, əsas mövzu; səhv tipləri və variant → səhv tipi.

const PATH = "/admin/zeif-movzular";
const SECTIONS = ["Ədədlər", "Cəbr", "Funksiyalar", "Həndəsə", "Statistika və ehtimal"] as const;

/** Rol bazadan yoxlanılır (sessiyadakı rol köhnə ola bilər). */
export async function requireStaff() {
  const session = await auth();
  if (!session?.user?.id) redirect(`/daxil-ol?next=${encodeURIComponent(PATH)}`);
  const [u] = await db.select({ role: users.role }).from(users).where(eq(users.id, session.user.id));
  if (!u || u.role === "student") redirect("/panel");
  return session.user.id;
}

const topicSchema = z.object({
  id: z.coerce.number().int().positive(),
  section: z.enum(SECTIONS),
  dimFrequency: z.coerce.number().min(0).max(30),
  prerequisiteId: z.union([z.literal(""), z.coerce.number().int().positive()]),
});

export async function saveTopicAction(formData: FormData) {
  await requireStaff();
  const p = topicSchema.parse(Object.fromEntries(formData));
  const types = formData.getAll("examTypes").map(String).filter((x) => ["9", "11", "blok"].includes(x));
  await db
    .update(topics)
    .set({
      section: p.section,
      dimFrequency: p.dimFrequency,
      examTypes: types.join(","),
      prerequisiteId: p.prerequisiteId === "" || p.prerequisiteId === p.id ? null : p.prerequisiteId,
    })
    .where(eq(topics.id, p.id));
  revalidatePath(PATH);
}

export async function createErrorTypeAction(formData: FormData) {
  await requireStaff();
  const p = z
    .object({ topicId: z.coerce.number().int().positive(), name: z.string().trim().min(2).max(120), description: z.string().trim().max(500) })
    .parse(Object.fromEntries(formData));
  await db.insert(errorTypes).values(p).onConflictDoUpdate({
    target: [errorTypes.topicId, errorTypes.name],
    set: { description: p.description },
  });
  revalidatePath(PATH);
}

export async function deleteErrorTypeAction(formData: FormData) {
  await requireStaff();
  const id = z.coerce.number().int().positive().parse(formData.get("id"));
  await db.delete(taskOptionErrors).where(eq(taskOptionErrors.errorTypeId, id));
  await db.delete(errorTypes).where(eq(errorTypes.id, id));
  revalidatePath(PATH);
}

export async function linkOptionAction(formData: FormData) {
  await requireStaff();
  const p = z
    .object({ taskCode: z.string().trim().toUpperCase().min(3).max(20), option: z.enum(LETTERS), errorTypeId: z.coerce.number().int().positive() })
    .parse(Object.fromEntries(formData));
  // Sual mövcud olmalı, düzgün variant səhv tipinə bağlanmamalıdır.
  const [task] = await db.select({ correct: bankTasks.correctOption }).from(bankTasks).where(eq(bankTasks.code, p.taskCode));
  if (!task || task.correct === p.option) redirect(`${PATH}?xeta=variant#baglantilar`);
  await db
    .insert(taskOptionErrors)
    .values(p)
    .onConflictDoUpdate({ target: [taskOptionErrors.taskCode, taskOptionErrors.option], set: { errorTypeId: p.errorTypeId } });
  revalidatePath(PATH);
}

export async function unlinkOptionAction(formData: FormData) {
  await requireStaff();
  const p = z.object({ taskCode: z.string(), option: z.enum(LETTERS) }).parse(Object.fromEntries(formData));
  await db.delete(taskOptionErrors).where(and(eq(taskOptionErrors.taskCode, p.taskCode), eq(taskOptionErrors.option, p.option)));
  revalidatePath(PATH);
}
