"use server";

import { and, eq, gt, isNull, sql } from "drizzle-orm";
import { AuthError, CredentialsSignin } from "next-auth";
import { redirect } from "next/navigation";
import { findUserByIdentifier, signIn, signOut, type LoginErrorCode } from "@/auth";
import { az } from "@/content/az";
import { db } from "@/db";
import { passwordResetTokens, users } from "@/db/schema";
import { sendPasswordResetEmail, sendVerificationEmail } from "@/lib/auth/flows";
import type { FormState } from "@/lib/auth/form-state";
import { hashPassword } from "@/lib/auth/password";
import { clearPendingEmail, getPendingEmail, setPendingEmail } from "@/lib/auth/pending-email";
import { hashToken } from "@/lib/auth/tokens";
import {
  fieldErrors,
  forgotSchema,
  loginSchema,
  registerSchema,
  resetSchema,
} from "@/lib/auth/validation";
import { verifyCaptcha } from "@/lib/captcha";
import { HOUR, MINUTE, rateLimit, rateLimitAll } from "@/lib/rate-limit";
import { clientIp } from "@/lib/request";
import { safeRedirect } from "@/lib/safe-redirect";

const e = az.errors;
const RESEND_COOLDOWN_S = 60;

const str = (formData: FormData, key: string) => {
  const v = formData.get(key);
  return typeof v === "string" ? v : undefined;
};

const limited = (retryAfterMs: number): FormState => ({
  status: "error",
  formError: e.rateLimited(Math.max(1, Math.ceil(retryAfterMs / MINUTE))),
});

/* ---------------- Giriş ---------------- */

export async function loginAction(_prev: FormState, formData: FormData): Promise<FormState> {
  const parsed = loginSchema.safeParse({
    identifier: str(formData, "identifier"),
    password: str(formData, "password"),
  });
  if (!parsed.success) return { status: "error", fieldErrors: fieldErrors(parsed.error) };
  const { identifier, password } = parsed.data;

  const ip = await clientIp();
  const rl = await rateLimitAll([
    [`login:ip:${ip}`, 30, 15 * MINUTE],
    [`login:id:${identifier}`, 10, 15 * MINUTE],
  ]);
  if (!rl.ok) return limited(rl.retryAfterMs);

  try {
    await signIn("credentials", {
      identifier,
      password,
      redirectTo: safeRedirect(str(formData, "next")),
    });
  } catch (error) {
    if (error instanceof CredentialsSignin) {
      return loginErrorState(error.code as LoginErrorCode, identifier);
    }
    if (error instanceof AuthError) return { status: "error", formError: e.generic };
    throw error; // NEXT_REDIRECT — uğurlu giriş
  }
  return { status: "idle" };
}

async function loginErrorState(code: LoginErrorCode, identifier: string): Promise<FormState> {
  switch (code) {
    case "not_found_email":
      return { status: "error", fieldErrors: { identifier: e.notFoundEmail }, notice: "not_found" };
    case "not_found_username":
      return { status: "error", fieldErrors: { identifier: e.notFoundUsername }, notice: "not_found" };
    case "wrong_password":
      return { status: "error", fieldErrors: { password: e.wrongPassword } };
    case "google_only":
      return { status: "error", formError: e.googleOnly };
    case "unverified": {
      const user = await findUserByIdentifier(identifier);
      if (user) {
        await setPendingEmail(user.email);
        const rl = await rateLimit(`verify-resend:${user.id}`, 1, RESEND_COOLDOWN_S * 1000);
        if (rl.ok) await sendVerificationEmail(user);
      }
      return { status: "error", notice: "unverified" };
    }
    default:
      return { status: "error", formError: e.generic };
  }
}

/* ---------------- Qeydiyyat ---------------- */

export async function registerAction(_prev: FormState, formData: FormData): Promise<FormState> {
  const parsed = registerSchema.safeParse({
    name: str(formData, "name"),
    username: str(formData, "username"),
    email: str(formData, "email"),
    password: str(formData, "password"),
    grade: str(formData, "grade"),
    targetExam: str(formData, "targetExam"),
    terms: str(formData, "terms"),
  });
  if (!parsed.success) return { status: "error", fieldErrors: fieldErrors(parsed.error) };
  const data = parsed.data;

  const ip = await clientIp();
  if (!(await verifyCaptcha(str(formData, "captcha") ?? null, ip))) {
    return { status: "error", formError: e.captcha };
  }
  const rl = await rateLimit(`register:ip:${ip}`, 10, HOUR);
  if (!rl.ok) return limited(rl.retryAfterMs);

  const [byEmail, byUsername] = await Promise.all([
    db.query.users.findFirst({ where: eq(users.email, data.email) }),
    db.query.users.findFirst({ where: eq(users.username, data.username) }),
  ]);
  if (byEmail?.emailVerifiedAt) {
    return { status: "error", fieldErrors: { email: e.emailTaken }, notice: "email_taken" };
  }
  if (byUsername && byUsername.id !== byEmail?.id) {
    return { status: "error", fieldErrors: { username: e.usernameTaken } };
  }

  const values = {
    name: data.name,
    username: data.username,
    email: data.email,
    passwordHash: await hashPassword(data.password),
    grade: data.grade,
    targetExam: data.targetExam,
    termsAcceptedAt: new Date(),
  };

  let user: { id: string; email: string; name: string } | undefined;
  try {
    // Təsdiqlənməmiş köhnə qeydiyyat varsa, onu yeniləyirik: e-poçtu yalnız poçtun sahibi təsdiqləyə bilər.
    [user] = byEmail
      ? await db.update(users).set(values).where(eq(users.id, byEmail.id)).returning()
      : await db.insert(users).values(values).returning();
  } catch (error) {
    const msg = String((error as { cause?: unknown })?.cause ?? error);
    if (msg.includes("users.username")) {
      return { status: "error", fieldErrors: { username: e.usernameTaken } };
    }
    if (msg.includes("users.email")) {
      return { status: "error", fieldErrors: { email: e.emailTaken }, notice: "email_taken" };
    }
    throw error;
  }
  if (!user) return { status: "error", formError: e.generic };

  await rateLimit(`verify-resend:${user.id}`, 1, RESEND_COOLDOWN_S * 1000);
  await sendVerificationEmail(user);
  await setPendingEmail(user.email);
  redirect("/email-tesdiqi");
}

/* ---------------- Təsdiq linkini yenidən göndər ---------------- */

export async function resendVerificationAction(_prev: FormState): Promise<FormState> {
  const email = await getPendingEmail();
  if (!email) return { status: "error", formError: e.generic };

  const ip = await clientIp();
  const ipLimit = await rateLimit(`verify-resend:ip:${ip}`, 20, HOUR);
  if (!ipLimit.ok) return limited(ipLimit.retryAfterMs);

  const user = await db.query.users.findFirst({ where: eq(users.email, email) });
  if (!user || user.emailVerifiedAt) {
    // Hesab artıq təsdiqlənib (və ya yoxdur) — sadəcə girişə yönləndiririk.
    await clearPendingEmail();
    redirect("/daxil-ol?verified=1");
  }

  const cooldown = await rateLimit(`verify-resend:${user.id}`, 1, RESEND_COOLDOWN_S * 1000);
  if (!cooldown.ok) {
    const seconds = Math.ceil(cooldown.retryAfterMs / 1000);
    return { status: "error", formError: e.resendWait(seconds), cooldown: seconds };
  }
  const hourly = await rateLimit(`verify-resend:hour:${user.id}`, 5, HOUR);
  if (!hourly.ok) return limited(hourly.retryAfterMs);

  await sendVerificationEmail(user);
  return { status: "success", cooldown: RESEND_COOLDOWN_S };
}

/* ---------------- Şifrə bərpası ---------------- */

export async function forgotPasswordAction(_prev: FormState, formData: FormData): Promise<FormState> {
  const parsed = forgotSchema.safeParse({ email: str(formData, "email") });
  if (!parsed.success) return { status: "error", fieldErrors: fieldErrors(parsed.error) };
  const { email } = parsed.data;

  const ip = await clientIp();
  if (!(await verifyCaptcha(str(formData, "captcha") ?? null, ip))) {
    return { status: "error", formError: e.captcha };
  }
  const rl = await rateLimitAll([
    [`reset:ip:${ip}`, 10, HOUR],
    [`reset:email:${email}`, 3, HOUR],
  ]);
  if (!rl.ok) return limited(rl.retryAfterMs);

  const user = await db.query.users.findFirst({ where: eq(users.email, email) });
  if (user) await sendPasswordResetEmail(user);
  // Hesabın olub-olmadığını bildirmirik.
  return { status: "success" };
}

export async function resetPasswordAction(_prev: FormState, formData: FormData): Promise<FormState> {
  const parsed = resetSchema.safeParse({
    token: str(formData, "token"),
    password: str(formData, "password"),
  });
  if (!parsed.success) return { status: "error", fieldErrors: fieldErrors(parsed.error) };

  const ip = await clientIp();
  const rl = await rateLimit(`reset-confirm:ip:${ip}`, 20, HOUR);
  if (!rl.ok) return limited(rl.retryAfterMs);

  const passwordHash = await hashPassword(parsed.data.password);
  const now = new Date();
  // Tokeni atomik "istifadə olunub" edirik: eyni link iki dəfə işləməz.
  const [consumed] = await db
    .update(passwordResetTokens)
    .set({ usedAt: now })
    .where(
      and(
        eq(passwordResetTokens.tokenHash, hashToken(parsed.data.token)),
        isNull(passwordResetTokens.usedAt),
        gt(passwordResetTokens.expiresAt, now),
      ),
    )
    .returning({ userId: passwordResetTokens.userId });
  if (!consumed) return { status: "error", formError: az.reset.invalidText };

  await db.batch([
    db
      .update(users)
      .set({
        passwordHash,
        // Linkə keçid poçtun sahibi olduğunu təsdiqləyir.
        emailVerifiedAt: sql`coalesce(${users.emailVerifiedAt}, ${now.getTime()})`,
      })
      .where(eq(users.id, consumed.userId)),
    db.delete(passwordResetTokens).where(eq(passwordResetTokens.userId, consumed.userId)),
  ]);
  redirect("/daxil-ol?reset=1");
}

/* ---------------- Çıxış ---------------- */

export async function logoutAction() {
  await signOut({ redirectTo: "/" });
}
