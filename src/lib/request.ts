import "server-only";
import { headers } from "next/headers";

/** Müştərinin IP ünvanı (Vercel və ya proksi arxasında `x-forwarded-for`-un birinci dəyəri). */
export async function clientIp(): Promise<string> {
  const h = await headers();
  const forwarded = h.get("x-forwarded-for")?.split(",")[0]?.trim();
  return forwarded || h.get("x-real-ip") || "unknown";
}
