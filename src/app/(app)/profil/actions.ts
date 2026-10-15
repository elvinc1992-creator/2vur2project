"use server";

import { and, eq, ne } from "drizzle-orm";
import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { auth } from "@/auth";
import { az } from "@/content/az";
import { db } from "@/db";
import { z } from "zod";
import { TARGET_EXAMS, users } from "@/db/schema";
import { confirmEmailCode, emailTakenByOther, sendEmailCode } from "@/lib/auth/email-code";
import type { FormState } from "@/lib/auth/form-state";
import { emailCodeSchema, emailSchema, phoneSchema } from "@/lib/auth/validation";
import { HOUR, MINUTE, rateLimit } from "@/lib/rate-limit";
import { refreshWeakTopics } from "@/lib/weak/data";

const e = az.errors;
const RESEND_S = 60;

async function me() {
  const session = await auth();
  if (!session?.user?.id) redirect("/daxil-ol?next=%2Fprofil");
  return { id: session.user.id, name: session.user.name ?? "" };
}

const str = (formData: FormData, key: string) => {
  const v = formData.get(key);
  return typeof v === "string" ? v : undefined;
};

/** 1-ci addım: e-poçt → təsdiq kodu məktubla. */
export async function requestEmailCodeAction(_prev: FormState, formData: FormData): Promise<FormState> {
  const user = await me();
  const parsed = emailSchema.safeParse(str(formData, "email"));
  if (!parsed.success) return { status: "error", fieldErrors: { email: parsed.error.issues[0].message } };
  const email = parsed.data;
  if (await emailTakenByOther(user.id, email)) return { status: "error", fieldErrors: { email: e.emailTaken } };

  const cooldown = await rateLimit(`email-code:${user.id}`, 1, RESEND_S * 1000);
  if (!cooldown.ok) {
    const s = Math.ceil(cooldown.retryAfterMs / 1000);
    return { status: "error", formError: e.resendWait(s), cooldown: s, pendingEmail: email };
  }
  const hourly = await rateLimit(`email-code:hour:${user.id}`, 5, HOUR);
  if (!hourly.ok) return { status: "error", formError: e.rateLimited(Math.max(1, Math.ceil(hourly.retryAfterMs / MINUTE))) };

  await sendEmailCode(user, email);
  return { status: "success", notice: "code_sent", pendingEmail: email, cooldown: RESEND_S, sentAt: Date.now() };
}

/** 2-ci addım: kod → e-poçt hesaba yazılır və təsdiqlənir. */
export async function confirmEmailCodeAction(_prev: FormState, formData: FormData): Promise<FormState> {
  const user = await me();
  const pendingEmail = str(formData, "pendingEmail");
  const parsed = emailCodeSchema.safeParse(str(formData, "code"));
  if (!parsed.success) return { status: "error", fieldErrors: { code: parsed.error.issues[0].message }, pendingEmail };

  const res = await confirmEmailCode(user.id, parsed.data);
  if (!res.ok) {
    const msg = res.reason === "wrong" ? e.codeWrong : res.reason === "taken" ? e.emailTaken : e.codeExpired;
    return { status: "error", fieldErrors: { code: msg }, pendingEmail };
  }
  revalidatePath("/profil");
  return { status: "success", notice: "email_verified" };
}

const gradeExamSchema = z.object({
  grade: z.enum(["9", "10", "11"], { error: e.gradeRequired }).transform(Number),
  targetExam: z.enum(TARGET_EXAMS, { error: e.targetRequired }),
});

/** Sinif və imtahan. Zəif mövzular imtahan tipindən asılıdır — yenidən hesablanır. */
export async function saveGradeExamAction(_prev: FormState, formData: FormData): Promise<FormState> {
  const user = await me();
  const parsed = gradeExamSchema.safeParse({ grade: str(formData, "grade"), targetExam: str(formData, "targetExam") });
  if (!parsed.success) {
    const fieldErrors = Object.fromEntries(parsed.error.issues.map((i) => [String(i.path[0]), i.message]));
    return { status: "error", fieldErrors };
  }
  await db.update(users).set(parsed.data).where(eq(users.id, user.id));
  try {
    await refreshWeakTopics(user.id);
  } catch (err) {
    console.error("weak topics refresh failed", err);
  }
  revalidatePath("/profil");
  return { status: "success", notice: "grade_saved" };
}

const guardianSchema = z.object({
  guardianName: z.string({ error: e.required }).trim().min(2, e.guardianNameRequired).max(80),
  guardianEmail: z.union([z.literal(""), emailSchema]).transform((v) => v || null),
});

/** Valideyn: ad (vacib) və e-poçt (istəyə bağlı). remove=1 — silinir. */
export async function saveGuardianAction(_prev: FormState, formData: FormData): Promise<FormState> {
  const user = await me();
  if (str(formData, "remove") === "1") {
    await db.update(users).set({ guardianName: null, guardianEmail: null }).where(eq(users.id, user.id));
    revalidatePath("/profil");
    return { status: "success", notice: "guardian_removed" };
  }
  const parsed = guardianSchema.safeParse({
    guardianName: str(formData, "guardianName"),
    guardianEmail: (str(formData, "guardianEmail") ?? "").trim(),
  });
  if (!parsed.success) {
    const fieldErrors = Object.fromEntries(parsed.error.issues.map((i) => [String(i.path[0]), i.message]));
    return { status: "error", fieldErrors };
  }
  await db.update(users).set(parsed.data).where(eq(users.id, user.id));
  revalidatePath("/profil");
  return { status: "success", notice: "guardian_saved" };
}

/** Telefon (+994…). Boş göndərilsə — silinir. */
export async function savePhoneAction(_prev: FormState, formData: FormData): Promise<FormState> {
  const user = await me();
  const raw = (str(formData, "phone") ?? "").trim();
  let phone: string | null = null;
  if (raw && raw !== "+994") {
    const parsed = phoneSchema.safeParse(raw);
    if (!parsed.success) return { status: "error", fieldErrors: { phone: parsed.error.issues[0].message } };
    phone = parsed.data;
    const other = await db.query.users.findFirst({
      where: and(eq(users.phone, phone), ne(users.id, user.id)),
      columns: { id: true },
    });
    if (other) return { status: "error", fieldErrors: { phone: e.phoneTaken } };
  }
  await db.update(users).set({ phone }).where(eq(users.id, user.id));
  revalidatePath("/profil");
  return { status: "success", notice: "phone_saved" };
}
