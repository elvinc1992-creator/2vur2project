"use server";

import { randomUUID } from "node:crypto";
import { eq } from "drizzle-orm";
import { redirect } from "next/navigation";
import { auth } from "@/auth";
import { db } from "@/db";
import { paymentOrders } from "@/db/schema";
import { CARD_LABEL } from "@/lib/demo/content";
import type { BillingPeriod } from "@/lib/demo/plans";
import type { PaidTier } from "@/lib/demo/state";
import { env } from "@/lib/env";
import { createPayment, epointKeys } from "./epoint";
import { paymentMode } from "./mode";
import { applyPurchase, examPurchase, planPurchase } from "./purchase";

/**
 * Ödəniş formu: qiymət serverdə hesablanır. Epoint rejimində sifariş yaradılır və istifadəçi bankın ödəniş
 * səhifəsinə yönləndirilir (plan / sınaq yalnız Epoint "success" deyəndə açılır); inkişafda — demo ödəniş.
 */
export async function payAction(formData: FormData) {
  const session = await auth();
  if (!session?.user?.id) redirect("/daxil-ol");
  const uid = session.user.id;

  const kind = formData.get("kind") === "exam" ? "exam" : "monthly";
  const examId = String(formData.get("exam") ?? "");
  const tier: PaidTier = formData.get("plan") === "pro" ? "pro" : "premium";
  const period: BillingPeriod = formData.get("period") === "year" ? "year" : "month";
  const back = `/odenis?${kind === "exam" ? `exam=${examId}` : `plan=${tier}&period=${period}`}`;
  if (formData.get("consent") !== "on") redirect(`${back}&consent=0`);

  const purchase = kind === "exam" ? await examPurchase(examId) : planPurchase(tier, period);
  if (!purchase) redirect("/sinaqlar");

  const mode = paymentMode();
  if (mode === "off") redirect(`${back}&xeta=bagli`);
  if (mode === "mock") {
    const receiptId = await applyPurchase(uid, purchase, CARD_LABEL);
    redirect(`/odenis/ugurlu?r=${receiptId}`);
  }

  const orderId = `2v-${randomUUID()}`;
  await db.insert(paymentOrders).values({
    id: orderId,
    userId: uid,
    kind: purchase.kind,
    title: purchase.title,
    amount: purchase.amount,
    tier: purchase.kind === "subscription" ? purchase.tier : null,
    period: purchase.kind === "subscription" ? purchase.period : null,
    examId: purchase.kind === "exam" ? purchase.examId : null,
  });

  const eqId = (id: string) => eq(paymentOrders.id, id);
  const base = env.APP_URL.replace(/\/$/, "");
  let target: string;
  try {
    const r = await createPayment(
      {
        orderId,
        amount: purchase.amount,
        description: `2vur2.az — ${purchase.title}`,
        // Epoint kabinetində qeyd olunan ünvanlar (/success, /error) — sifariş nömrəsi ilə
        successUrl: `${base}/success?o=${orderId}`,
        errorUrl: `${base}/error?o=${orderId}`,
      },
      epointKeys()!,
      // Abunədə kart saxlanır — növbəti dövr avtomatik ödənilir (bax: /api/cron/renew)
      purchase.kind === "subscription",
    );
    if (r.transaction || r.cardId) {
      await db.update(paymentOrders).set({ transaction: r.transaction, cardId: r.cardId }).where(eqId(orderId));
    }
    target = r.redirectUrl;
  } catch (e) {
    console.error("Epoint ödəniş yaradılmadı", orderId, e);
    await db.update(paymentOrders).set({ status: "failed", message: e instanceof Error ? e.message.slice(0, 300) : "xəta" }).where(eqId(orderId));
    target = `${back}&xeta=epoint`;
  }
  redirect(target);
}
