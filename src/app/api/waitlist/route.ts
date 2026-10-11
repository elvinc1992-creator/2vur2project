import { NextResponse } from "next/server";
import { z } from "zod";
import { db } from "@/db";
import { WAITLIST_ROLES, waitlist } from "@/db/schema";
import { HOUR, MINUTE, rateLimitAll } from "@/lib/rate-limit";
import { clientIp } from "@/lib/request";

// Ana səhifənin gözləmə siyahısı (sayt açılana qədər production-da açıq olan yeganə API).
// Eyni e-poçt təkrar göndərilsə, məlumat yenilənir (təkrar sətir yaranmır).

const Body = z.object({
  name: z.string().trim().min(1).max(80),
  email: z.string().trim().toLowerCase().email().max(160),
  role: z.enum(WAITLIST_ROLES),
  grade: z.string().trim().max(30).optional().nullable(),
  consent: z.literal(true),
});

export async function POST(req: Request) {
  const ip = await clientIp();
  const limit = await rateLimitAll([
    [`waitlist:ip:${ip}`, 10, 10 * MINUTE],
    [`waitlist:ip-h:${ip}`, 40, HOUR],
  ]);
  if (!limit.ok) return NextResponse.json({ ok: false, error: "limit" }, { status: 429 });

  const json = await req.json().catch(() => null);
  const p = Body.safeParse(json);
  if (!p.success) return NextResponse.json({ ok: false, error: "invalid" }, { status: 400 });
  const { name, email, role, grade, consent } = p.data;
  const values = { name, role, grade: role === "sagird" ? grade || null : null, consent };
  await db
    .insert(waitlist)
    .values({ email, ...values })
    .onConflictDoUpdate({ target: waitlist.email, set: values });
  return NextResponse.json({ ok: true });
}
