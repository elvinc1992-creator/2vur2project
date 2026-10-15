import { timingSafeEqual } from "node:crypto";
import { NextResponse } from "next/server";
import { paymentMode } from "@/lib/payments/mode";
import { renewDueSubscriptions } from "@/lib/payments/renew";

// Abunələrin avtomatik yenilənməsi — gündə bir neçə dəfə GitHub Actions çağırır (.github/workflows/renew.yml).
// Yalnız "Authorization: Bearer <CRON_SECRET>" ilə.

export const maxDuration = 60;

function authorized(req: Request) {
  const secret = process.env.CRON_SECRET?.trim();
  if (!secret) return false;
  const given = Buffer.from(req.headers.get("authorization") ?? "");
  const expected = Buffer.from(`Bearer ${secret}`);
  return given.length === expected.length && timingSafeEqual(given, expected);
}

export async function POST(req: Request) {
  if (!authorized(req)) return NextResponse.json({ ok: false }, { status: 401 });
  if (paymentMode() !== "epoint") return NextResponse.json({ ok: false, error: "not_configured" }, { status: 503 });
  const results = await renewDueSubscriptions();
  console.log("Avtomatik yenilənmə:", JSON.stringify(results));
  return NextResponse.json({ ok: true, results });
}

export const GET = POST;
