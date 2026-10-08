import "server-only";
import { z } from "zod";

const schema = z.object({
  TURSO_DATABASE_URL: z.string().min(1),
  TURSO_AUTH_TOKEN: z.string().optional(),
  AUTH_SECRET: z.string().min(32),
  APP_URL: z.url().default("http://localhost:3000"),
  EMAIL_PROVIDER: z.enum(["console"]).default("console"),
  EMAIL_FROM: z.string().default("no-reply@brand.az"),
  CAPTCHA_PROVIDER: z.enum(["none"]).default("none"),
});

const parsed = schema.safeParse(process.env);
if (!parsed.success) {
  throw new Error(`Mühit dəyişənləri səhvdir:\n${z.prettifyError(parsed.error)}`);
}

export const env = parsed.data;
