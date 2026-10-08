import "server-only";
import { sql } from "drizzle-orm";
import { db } from "@/db";

export type RateLimitResult = { ok: boolean; retryAfterMs: number };

/**
 * Sabit pəncərə: `windowMs` ərzində `limit` cəhd. Bir sorğu ilə atomik artırılır,
 * ona görə bir neçə server instansiyasında da düzgün işləyir.
 */
export async function rateLimit(
  key: string,
  limit: number,
  windowMs: number,
): Promise<RateLimitResult> {
  const now = Date.now();
  const resetAt = now + windowMs;
  const row = await db.get<{ count: number; reset_at: number }>(sql`
    insert into rate_limits (key, count, reset_at) values (${key}, 1, ${resetAt})
    on conflict(key) do update set
      count = case when rate_limits.reset_at <= ${now} then 1 else rate_limits.count + 1 end,
      reset_at = case when rate_limits.reset_at <= ${now} then ${resetAt} else rate_limits.reset_at end
    returning count, reset_at
  `);
  if (!row) return { ok: true, retryAfterMs: 0 };
  return { ok: row.count <= limit, retryAfterMs: Math.max(0, row.reset_at - now) };
}

/** Bir neçə limiti yoxlayır; hər birinin sayğacı artırılır. */
export async function rateLimitAll(
  rules: Array<[key: string, limit: number, windowMs: number]>,
): Promise<RateLimitResult> {
  const results = await Promise.all(rules.map(([k, l, w]) => rateLimit(k, l, w)));
  const blocked = results.filter((r) => !r.ok);
  if (blocked.length === 0) return { ok: true, retryAfterMs: 0 };
  return { ok: false, retryAfterMs: Math.max(...blocked.map((r) => r.retryAfterMs)) };
}

export const MINUTE = 60 * 1000;
export const HOUR = 60 * MINUTE;
