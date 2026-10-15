import { NextResponse } from "next/server";
import { epointKeys, verifyEpoint } from "@/lib/payments/epoint";

// Epoint-in ödəniş nəticəsi (kabinetdə result_url: {APP_URL}/result): POST data + signature.
// İmza private_key ilə yoxlanılır — uyğun gəlməsə, sorğu rədd edilir.
// Sayt açılana qədər sifariş cədvəli yoxdur: düzgün imzalı bildiriş qəbul olunur və loga yazılır.

export async function POST(req: Request) {
  const keys = epointKeys();
  if (!keys) return NextResponse.json({ ok: false, error: "not_configured" }, { status: 503 });

  const form = await req.formData().catch(() => null);
  const data = form?.get("data");
  const signature = form?.get("signature");
  if (typeof data !== "string" || typeof signature !== "string") return NextResponse.json({ ok: false }, { status: 400 });

  const r = verifyEpoint(data, signature, keys.privateKey);
  if (!r) return NextResponse.json({ ok: false }, { status: 403 });

  console.info("Epoint bildirişi", { order_id: r.order_id, status: r.status, transaction: r.transaction, amount: r.amount });
  return NextResponse.json({ ok: true });
}
