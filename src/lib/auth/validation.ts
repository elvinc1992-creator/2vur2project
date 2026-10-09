import { z } from "zod";
import { az } from "@/content/az";
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
  surname: z
    .string({ error: e.surnameRequired })
    .trim()
    .min(1, e.surnameRequired)
    .max(60, e.surnameTooLong),
  fatherName: z
    .string({ error: e.fatherNameRequired })
    .trim()
    .min(1, e.fatherNameRequired)
    .max(60, e.fatherNameTooLong),
  username: usernameSchema,
  password: newPasswordSchema,
  grade: z.enum(["9", "10", "11"], { error: e.gradeRequired }).transform(Number),
  terms: z.literal("on", { error: e.termsRequired }),
});

/** +994 və 9 rəqəm (operator kodu + nömrə). Boşluq, tire, mötərizə qəbul olunur və silinir. */
export const PHONE_RE = /^\+994\d{9}$/;

export const phoneSchema = z
  .string({ error: e.required })
  .transform((v) => v.replace(/[\s\-()]/g, ""))
  .transform((v) => (v.startsWith("994") ? `+${v}` : v.startsWith("0") ? `+994${v.slice(1)}` : v))
  .pipe(z.string().regex(PHONE_RE, e.phoneInvalid));

export const emailCodeSchema = z.string({ error: e.required }).trim().regex(/^\d{6}$/, e.codeInvalid);

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
