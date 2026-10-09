import "server-only";
import { randomInt } from "node:crypto";
import { and, desc, eq, ne } from "drizzle-orm";
import { az } from "@/content/az";
import { db } from "@/db";
import { emailCodes, users } from "@/db/schema";
import { emailProvider } from "@/lib/email";
import { hashToken } from "./tokens";

// Profildə e-poçt əlavə etmək: 6 rəqəmli kod məktubla gəlir; e-poçt users-ə yalnız düzgün koddan sonra yazılır.

export const CODE_TTL_MS = 10 * 60 * 1000;
export const CODE_MAX_ATTEMPTS = 5;

/** E-poçt başqa hesabda istifadə olunurmu. */
export async function emailTakenByOther(userId: string, email: string) {
  const other = await db.query.users.findFirst({
    where: and(eq(users.email, email), ne(users.id, userId)),
    columns: { id: true },
  });
  return Boolean(other);
}

/** Köhnə kodları silir, yenisini yaradıb göndərir. */
export async function sendEmailCode(user: { id: string; name: string }, email: string) {
  const code = String(randomInt(0, 1_000_000)).padStart(6, "0");
  await db.delete(emailCodes).where(eq(emailCodes.userId, user.id));
  await db.insert(emailCodes).values({
    userId: user.id,
    email,
    codeHash: hashToken(`${user.id}:${email}:${code}`),
    expiresAt: new Date(Date.now() + CODE_TTL_MS),
  });
  await emailProvider().send({ to: email, subject: az.email.codeSubject(code), text: az.email.codeText(user.name, code) });
}

export type CodeResult = { ok: true; email: string } | { ok: false; reason: "wrong" | "expired" | "none" | "taken" };

/** Kodu yoxlayır; düzgündürsə e-poçtu hesaba yazıb təsdiqlənmiş edir. */
export async function confirmEmailCode(userId: string, code: string): Promise<CodeResult> {
  const row = await db.query.emailCodes.findFirst({
    where: eq(emailCodes.userId, userId),
    orderBy: desc(emailCodes.createdAt),
  });
  if (!row) return { ok: false, reason: "none" };
  if (row.expiresAt.getTime() <= Date.now() || row.attempts >= CODE_MAX_ATTEMPTS) return { ok: false, reason: "expired" };
  if (row.codeHash !== hashToken(`${userId}:${row.email}:${code}`)) {
    await db.update(emailCodes).set({ attempts: row.attempts + 1 }).where(eq(emailCodes.id, row.id));
    return { ok: false, reason: row.attempts + 1 >= CODE_MAX_ATTEMPTS ? "expired" : "wrong" };
  }
  if (await emailTakenByOther(userId, row.email)) return { ok: false, reason: "taken" };
  await db.batch([
    db.update(users).set({ email: row.email, emailVerifiedAt: new Date() }).where(eq(users.id, userId)),
    db.delete(emailCodes).where(eq(emailCodes.userId, userId)),
  ]);
  return { ok: true, email: row.email };
}
