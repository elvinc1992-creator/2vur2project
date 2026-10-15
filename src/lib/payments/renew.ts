import "server-only";
import { and, eq, like, lt, sql } from "drizzle-orm";
import { db } from "@/db";
import { paymentOrders, savedCards, userState } from "@/db/schema";
import { todayIso } from "@/lib/demo/logic";
import type { BillingPeriod } from "@/lib/demo/plans";
import type { PaidTier } from "@/lib/demo/state";
import { epointKeys, executePay } from "./epoint";
import { planPurchase, settleOrder } from "./purchase";

// Abunənin avtomatik yenilənməsi: dövrü bitən (periodEnd < bu gün) aktiv abunələr saxlanmış kartdan ödənilir.
// Gündə bir neçə dəfə çağırılır (GitHub Actions → /api/cron/renew) — eyni dövr üçün pul iki dəfə çəkilmir:
// sifariş id-si dövrə bağlıdır, uğurlu və ya cavabı bilinməyən ("new") sifariş varsa, yenidən cəhd edilmir.
// Ləğv edilmiş abunə (status "canceled") yenilənmir.

/** Bir dövr üçün ən çox cəhd (kartda pul olmaya bilər) — sonra abunə sadəcə bitir. */
const MAX_ATTEMPTS = 3;

const subStatus = sql<string | null>`json_extract(${userState.data}, '$.sub.status')`;
const subTier = sql<string | null>`json_extract(${userState.data}, '$.sub.tier')`;
const subPeriod = sql<string | null>`json_extract(${userState.data}, '$.sub.period')`;
const subEnd = sql<string>`json_extract(${userState.data}, '$.sub.periodEnd')`;

export type RenewResult = { userId: string; orderId?: string; status: "success" | "failed" | "skipped"; message?: string };

export async function renewDueSubscriptions(today = todayIso()): Promise<RenewResult[]> {
  const keys = epointKeys();
  if (!keys) throw new Error("Epoint açarları yoxdur");

  const due = await db
    .select({ userId: savedCards.userId, cardId: savedCards.cardId, tier: subTier, period: subPeriod, periodEnd: subEnd })
    .from(savedCards)
    .innerJoin(userState, eq(userState.userId, savedCards.userId))
    .where(and(eq(subStatus, "active"), lt(subEnd, today)));

  const results: RenewResult[] = [];
  for (const row of due) {
    const prefix = `2v-renew-${row.userId}-${row.periodEnd}-`;
    const tries = await db
      .select({ status: paymentOrders.status })
      .from(paymentOrders)
      .where(like(paymentOrders.id, `${prefix}%`));
    if (tries.some((t) => t.status !== "failed") || tries.length >= MAX_ATTEMPTS) {
      results.push({ userId: row.userId, status: "skipped", message: `cəhdlər: ${tries.map((t) => t.status).join(", ")}` });
      continue;
    }

    const tier: PaidTier = row.tier === "pro" ? "pro" : "premium";
    const period: BillingPeriod = row.period === "year" ? "year" : "month";
    const p = planPurchase(tier, period);
    if (p.kind !== "subscription" || !(p.amount > 0)) continue;
    const orderId = `${prefix}${tries.length + 1}`;
    await db.insert(paymentOrders).values({
      id: orderId,
      userId: row.userId,
      kind: "subscription",
      title: p.title,
      amount: p.amount,
      tier,
      period,
      cardId: row.cardId,
    });

    try {
      const r = await executePay({ cardId: row.cardId, orderId, amount: p.amount, description: `2vur2.az — ${p.title} (avtomatik yenilənmə)` }, keys);
      const amount = Number(r.amount);
      const order = await settleOrder(orderId, {
        status: r.status === "success" ? "success" : "failed",
        transaction: typeof r.transaction === "string" ? r.transaction : undefined,
        message: typeof r.message === "string" ? r.message : undefined,
        cardMask: typeof r.card_mask === "string" ? r.card_mask : undefined,
        amount: r.amount !== undefined && r.amount !== null && Number.isFinite(amount) ? amount : undefined,
      });
      results.push({ userId: row.userId, orderId, status: order?.status === "success" ? "success" : "failed", message: order?.message ?? undefined });
    } catch (e) {
      // Cavab gəlmədi — pul çəkilib-çəkilmədiyi bilinmir: sifariş "new" qalır, bu dövr üçün yenidən cəhd edilmir (admin yoxlasın).
      console.error("Avtomatik yenilənmə: Epoint cavab vermədi", orderId, e);
      results.push({ userId: row.userId, orderId, status: "failed", message: e instanceof Error ? e.message : "xəta" });
    }
  }
  return results;
}
