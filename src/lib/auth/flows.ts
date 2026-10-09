import "server-only";
import { and, eq, gt, isNull } from "drizzle-orm";
import { az } from "@/content/az";
import { db } from "@/db";
import { emailVerificationTokens, passwordResetTokens, users, type User } from "@/db/schema";
import { emailProvider } from "@/lib/email";
import { env } from "@/lib/env";
import { RESET_TOKEN_TTL_MS, VERIFY_TOKEN_TTL_MS, generateToken, hashToken } from "./tokens";

/** Köhnə linkləri ləğv edir, yenisini yaradıb məktubla göndərir. */
export async function sendVerificationEmail(user: Pick<User, "id" | "email" | "name">) {
  if (!user.email) return;
  const token = generateToken();
  await db.delete(emailVerificationTokens).where(eq(emailVerificationTokens.userId, user.id));
  await db.insert(emailVerificationTokens).values({
    userId: user.id,
    tokenHash: hashToken(token),
    expiresAt: new Date(Date.now() + VERIFY_TOKEN_TTL_MS),
  });
  const url = `${env.APP_URL}/api/auth/verify-email?token=${encodeURIComponent(token)}`;
  await emailProvider().send({
    to: user.email,
    subject: az.email.verifySubject,
    text: az.email.verifyText(user.name, url),
  });
}

export type VerifyResult = "ok" | "expired" | "invalid";

export async function verifyEmailToken(token: string): Promise<VerifyResult> {
  const row = await db.query.emailVerificationTokens.findFirst({
    where: eq(emailVerificationTokens.tokenHash, hashToken(token)),
  });
  if (!row || row.usedAt) return "invalid";
  if (row.expiresAt.getTime() <= Date.now()) return "expired";

  const now = new Date();
  await db.batch([
    db.update(emailVerificationTokens).set({ usedAt: now }).where(eq(emailVerificationTokens.id, row.id)),
    db
      .update(users)
      .set({ emailVerifiedAt: now })
      .where(and(eq(users.id, row.userId), isNull(users.emailVerifiedAt))),
  ]);
  return "ok";
}

export async function sendPasswordResetEmail(user: Pick<User, "id" | "email" | "name">) {
  // E-poçtu olmayan hesaba (qeydiyyatda soruşulmur) bərpa linki göndərilmir.
  if (!user.email) return;
  const token = generateToken();
  await db.delete(passwordResetTokens).where(eq(passwordResetTokens.userId, user.id));
  await db.insert(passwordResetTokens).values({
    userId: user.id,
    tokenHash: hashToken(token),
    expiresAt: new Date(Date.now() + RESET_TOKEN_TTL_MS),
  });
  const url = `${env.APP_URL}/sifre-berpasi/yeni?token=${encodeURIComponent(token)}`;
  await emailProvider().send({
    to: user.email,
    subject: az.email.resetSubject,
    text: az.email.resetText(user.name, url),
  });
}

/** Etibarlı, istifadə olunmamış bərpa tokeni (yalnız oxuyur). */
export async function findValidResetToken(token: string) {
  return db.query.passwordResetTokens.findFirst({
    where: and(
      eq(passwordResetTokens.tokenHash, hashToken(token)),
      isNull(passwordResetTokens.usedAt),
      gt(passwordResetTokens.expiresAt, new Date()),
    ),
  });
}
