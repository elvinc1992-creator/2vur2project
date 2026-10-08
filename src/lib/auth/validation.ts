import { z } from "zod";
import { az } from "@/content/az";
import { TARGET_EXAMS } from "@/db/schema";
import { PASSWORD_MAX, PASSWORD_MIN, checkPassword } from "./password-policy";

const e = az.errors;

export const USERNAME_RE = /^[a-z0-9_]{3,20}$/;

export const emailSchema = z
  .string({ error: e.required })
  .trim()
  .toLowerCase()
  .min(1, e.required)
  .max(254, e.emailInvalid)
  .pipe(z.email({ error: e.emailInvalid }));

export const usernameSchema = z
  .string({ error: e.required })
  .trim()
  .toLowerCase()
  .regex(USERNAME_RE, e.usernameInvalid);

export const newPasswordSchema = z
  .string({ error: e.required })
  .min(PASSWORD_MIN, e.passwordShort)
  .max(PASSWORD_MAX, e.passwordLong)
  .refine((v) => {
    const c = checkPassword(v);
    return c.cases && c.digit;
  }, e.passwordWeak);

export const registerSchema = z.object({
  name: z
    .string({ error: e.nameRequired })
    .trim()
    .min(1, e.nameRequired)
    .max(60, e.nameTooLong),
  username: usernameSchema,
  email: emailSchema,
  password: newPasswordSchema,
  grade: z.enum(["9", "10", "11"], { error: e.gradeRequired }).transform(Number),
  targetExam: z.enum(TARGET_EXAMS, { error: e.targetRequired }),
  terms: z.literal("on", { error: e.termsRequired }),
});

export const loginSchema = z.object({
  identifier: z.string({ error: e.required }).trim().toLowerCase().min(1, e.required).max(254),
  // Giriş zamanı yalnız boş olmamasını yoxlayırıq — köhnə qaydalarla yaradılmış şifrələr də işləsin.
  password: z.string({ error: e.required }).min(1, e.required).max(PASSWORD_MAX, e.passwordLong),
});

export const forgotSchema = z.object({ email: emailSchema });

export const resetSchema = z.object({
  token: z.string().min(1).max(200),
  password: newPasswordSchema,
});

export type FieldErrors<K extends string = string> = Partial<Record<K, string>>;

/** zod xətalarını sahə → ilk mesaj xəritəsinə çevirir. */
export function fieldErrors<K extends string>(error: z.ZodError): FieldErrors<K> {
  const out: FieldErrors<K> = {};
  for (const issue of error.issues) {
    const key = issue.path[0] as K | undefined;
    if (key && !out[key]) out[key] = issue.message;
  }
  return out;
}
