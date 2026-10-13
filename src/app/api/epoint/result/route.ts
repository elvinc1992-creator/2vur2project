import { NextResponse } from "next/server";
import { epointKeys, verifyEpoint } from "@/lib/payments/epoint";
import { settleOrder } from "@/lib/payments/purchase";

// Epoint-in ödəniş nəticəsi (result_url): POST data + signature. İmza private_key ilə yoxlanılır —
// uyğun gəlməsə, sorğu rədd edilir. Plan / sınaq yalnız burada və ya uğurlu səhifədəki status yoxlamasında açılır.

export async function POST(req: Request) {
  const keys = epointKeys();
  if (!keys) return NextResponse.json({ ok: false }, { status: 404 });

  const form = await req.formData().catch(() => null);
  const data = form?.get("data");
  const signature = form?.get("signature");
  if (typeof data !== "string" || typeof signature !== "string") return NextResponse.json({ ok: false }, { status: 400 });

  const r = verifyEpoint(data, signature, keys.privateKey);
  if (!r || typeof r.order_id !== "string") return NextResponse.json({ ok: false }, { status: 403 });

  const amount = Number(r.amount);
  const order = await settleOrder(r.order_id, {
    status: String(r.status ?? ""),
    transaction: typeof r.transaction === "string" ? r.transaction : undefined,
    message: typeof r.message === "string" ? r.message : undefined,
    cardMask: typeof r.card_mask === "string" ? r.card_mask : undefined,
    amount: Number.isFinite(amount) && r.amount !== undefined && r.amount !== null ? amount : undefined,
  });
  if (!order) console.error("Epoint bildirişi: sifariş tapılmadı", r.order_id);
  return NextResponse.json({ ok: true });
}
