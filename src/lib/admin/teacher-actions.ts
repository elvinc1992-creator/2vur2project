"use server";

import { and, asc, eq, ne } from "drizzle-orm";
import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import { db } from "@/db";
import { examBlueprintSections, examKinds, teacherAccounts, teacherApplications, teacherBalanceTx, topics, users } from "@/db/schema";
import { requireAdmin } from "./guard";

// Admin: müəllim müraciətləri, balans əməliyyatları, gündəlik limit; imtahan növlərinin sınaq strukturu.

export async function decideTeacherAction(formData: FormData) {
  await requireAdmin();
  const p = z.object({ userId: z.string(), decision: z.enum(["approve", "reject"]), note: z.string().trim().max(300).optional() }).parse(Object.fromEntries(formData));
  await db
    .update(teacherApplications)
    .set({ status: p.decision === "approve" ? "approved" : "rejected", adminNote: p.note || null, decidedAt: new Date() })
    .where(eq(teacherApplications.userId, p.userId));
  if (p.decision === "approve") {
    // Admin rolu əzilmir (admin müəllim panelindən də istifadə edir)
    await db.update(users).set({ role: "teacher", updatedAt: new Date() }).where(and(eq(users.id, p.userId), ne(users.role, "admin")));
    await db.insert(teacherAccounts).values({ userId: p.userId }).onConflictDoNothing();
  }
  revalidatePath("/admin/muellimler");
  redirect(`/admin/muellimler?${p.decision === "approve" ? "tesdiq" : "redd"}=1`);
}

/** Balansa əl ilə əməliyyat: bonus (+) və ya düzəliş / geri qaytarma (±). */
export async function teacherBalanceAction(formData: FormData) {
  await requireAdmin();
  const p = z
    .object({ userId: z.string(), amount: z.coerce.number().refine((v) => v !== 0 && Math.abs(v) <= 10_000), kind: z.enum(["bonus", "adjust", "refund"]), note: z.string().trim().max(200).optional() })
    .parse(Object.fromEntries(formData));
  await db.insert(teacherAccounts).values({ userId: p.userId }).onConflictDoNothing();
  const [acc] = await db.select().from(teacherAccounts).where(eq(teacherAccounts.userId, p.userId));
  await db.update(teacherAccounts).set({ balance: acc.balance + p.amount }).where(eq(teacherAccounts.userId, p.userId));
  await db.insert(teacherBalanceTx).values({ teacherId: p.userId, amount: p.amount, kind: p.kind, note: p.note || "Admin əməliyyatı" });
  redirect("/admin/muellimler?balans=1");
}

export async function teacherLimitAction(formData: FormData) {
  await requireAdmin();
  const p = z.object({ userId: z.string(), dailyLimit: z.coerce.number().int().min(0).max(200) }).parse(Object.fromEntries(formData));
  await db.insert(teacherAccounts).values({ userId: p.userId, dailyLimit: p.dailyLimit }).onConflictDoUpdate({ target: teacherAccounts.userId, set: { dailyLimit: p.dailyLimit } });
  redirect("/admin/muellimler?limit=1");
}

/**
 * Sınaq strukturu: bölmələrin sayı (qapalı / kodlaşdırılan / yazılı) və müddət — həm saytın sınaqları, həm müəllim sınaqları.
 * Nömrələr ardıcıl yenidən hesablanır (ilk bölmənin başlanğıc nömrəsi saxlanılır).
 */
export async function saveStructureAction(formData: FormData) {
  await requireAdmin();
  const p = z
    .object({
      kind: z.string(),
      durationMin: z.coerce.number().int().min(10).max(300),
      closed: z.coerce.number().int().min(0).max(60),
      open: z.coerce.number().int().min(0).max(30),
      written: z.coerce.number().int().min(0).max(30),
    })
    .parse(Object.fromEntries(formData));
  const [k] = await db.select().from(examKinds).where(eq(examKinds.key, p.kind));
  if (!k?.blueprintKey) redirect("/admin/sinaq-strukturu?xeta=1");
  await db.update(examKinds).set({ durationMin: p.durationMin }).where(eq(examKinds.key, p.kind));
  const rows = await db.select().from(examBlueprintSections).where(eq(examBlueprintSections.blueprintKey, k.blueprintKey)).orderBy(asc(examBlueprintSections.sortOrder));
  let next = rows[0]?.firstNo ?? 1;
  for (const [i, f] of (["closed", "open", "written"] as const).entries()) {
    const count = p[f];
    const row = rows.find((r) => r.format === f);
    const values = { questionCount: count, firstNo: next, lastNo: next + count - 1 };
    if (row) await db.update(examBlueprintSections).set(values).where(eq(examBlueprintSections.id, row.id));
    else if (count > 0) await db.insert(examBlueprintSections).values({ blueprintKey: k.blueprintKey, format: f, sortOrder: i + 1, ...values });
    next += count;
  }
  revalidatePath("/admin/sinaq-strukturu");
  redirect("/admin/sinaq-strukturu?saxlanildi=1");
}

/** Müəllim sınağının qiymətləri (sınaq başına, AZN): onlayn — `price-<key>`, kağız — `paper-<key>`. */
export async function saveTeacherPricesAction(formData: FormData) {
  await requireAdmin();
  const num = (name: string) => {
    const raw = formData.get(name);
    if (raw === null) return undefined;
    const v = Number(String(raw).replace(",", "."));
    return Number.isFinite(v) && v >= 0 && v <= 100 ? v : undefined;
  };
  const rows = await db.select({ key: examKinds.key }).from(examKinds);
  for (const k of rows) {
    const online = num(`price-${k.key}`);
    const paper = num(`paper-${k.key}`);
    if (online === undefined && paper === undefined) continue;
    await db
      .update(examKinds)
      .set({ ...(online !== undefined ? { teacherPrice: online } : {}), ...(paper !== undefined ? { teacherPaperPrice: paper } : {}) })
      .where(eq(examKinds.key, k.key));
  }
  revalidatePath("/admin/sinaq-strukturu");
  redirect("/admin/sinaq-strukturu?saxlanildi=1");
}

/** Mövzu bölgüsü: mövzunun hansı imtahan növlərinə aid olduğu və DİM tezliyi (sualların paylanma çəkisi). */
export async function saveTopicDistributionAction(formData: FormData) {
  await requireAdmin();
  const rows = await db.select({ id: topics.id }).from(topics);
  for (const t of rows) {
    const types = (["9", "11", "blok"] as const).filter((x) => formData.get(`t${t.id}-${x}`) === "on");
    const w = Number(String(formData.get(`t${t.id}-w`) ?? "").replace(",", "."));
    await db
      .update(topics)
      .set({ examTypes: types.join(",") || "11", ...(Number.isFinite(w) && w >= 0 ? { dimFrequency: w } : {}) })
      .where(eq(topics.id, t.id));
  }
  revalidatePath("/admin/sinaq-strukturu");
  redirect("/admin/sinaq-strukturu?saxlanildi=1");
}
