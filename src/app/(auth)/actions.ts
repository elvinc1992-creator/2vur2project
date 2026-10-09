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
      if (user?.email) {
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
    surname: str(formData, "surname"),
    fatherName: str(formData, "fatherName"),
    username: str(formData, "username"),
    password: str(formData, "password"),
    grade: str(formData, "grade"),
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

  if (await db.query.users.findFirst({ where: eq(users.username, data.username), columns: { id: true } })) {
    return { status: "error", fieldErrors: { username: e.usernameTaken } };
  }

  // E-poçt və telefon qeydiyyatda soruşulmur — istəyə bağlı, profildə əlavə edilir.
  try {
    await db.insert(users).values({
      name: data.name,
      surname: data.surname,
      fatherName: data.fatherName,
      username: data.username,
      passwordHash: await hashPassword(data.password),
      grade: data.grade,
      termsAcceptedAt: new Date(),
    });
  } catch (error) {
    if (String((error as { cause?: unknown })?.cause ?? error).includes("users.username")) {
      return { status: "error", fieldErrors: { username: e.usernameTaken } };
    }
    throw error;
  }

  // Qeydiyyatdan sonra birbaşa daxil olur (NEXT_REDIRECT atılır).
  await signIn("credentials", { identifier: data.username, password: data.password, redirectTo: "/panel" });
  return { status: "idle" };
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

/* ---------------- Google ilə giriş ---------------- */

export async function googleSignInAction(formData: FormData) {
  // Google-a yönləndirir (NEXT_REDIRECT); qayıdanda hesab tapılır və ya yaradılır (auth.ts → signIn callback).
  await signIn("google", { redirectTo: safeRedirect(str(formData, "next")) });
}

/* ---------------- Çıxış ---------------- */

export async function logoutAction() {
  await signOut({ redirectTo: "/" });
}
