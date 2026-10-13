import "server-only";
import { and, eq } from "drizzle-orm";
import { db } from "@/db";
import { paymentOrders, payments } from "@/db/schema";
import { isExamOpenForSale, todayIso } from "@/lib/demo/logic";
import { periodEndFrom, PLANS, priceOf, type BillingPeriod } from "@/lib/demo/plans";
import { updateDemoState, type PaidTier } from "@/lib/demo/state";
import { findExam } from "@/lib/exams/source";
import { priceText } from "@/lib/exams/types";
import { epointKeys, paymentStatus } from "./epoint";

/** Nə alınır — qiymət həmişə serverdə hesablanır (formadan gələn məbləğə etibar edilmir). */
export type Purchase =
  | { kind: "exam"; examId: string; title: string; amount: number; amountText: string }
  | { kind: "subscription"; tier: PaidTier; period: BillingPeriod; title: string; amount: number; amountText: string };

const azn = (text: string) => Number(text.replace(/[^\d.]/g, ""));

export async function examPurchase(examId: string): Promise<Purchase | null> {
  const exam = await findExam(examId);
  if (!exam || !isExamOpenForSale(exam)) return null;
  const amountText = priceText(exam.price);
  return { kind: "exam", examId, title: exam.title, amount: azn(amountText), amountText };
}

export function planPurchase(tier: PaidTier, period: BillingPeriod): Purchase {
  const amountText = priceOf(tier, period);
  const title = `${PLANS[tier].name} · ${period === "year" ? "illik" : "aylıq"} abunə`;
  return { kind: "subscription", tier, period, title, amount: azn(amountText), amountText };
}

const newReceiptId = () => {
  const s = Date.now().toString();
  return `${s.slice(-8, -4)}-${s.slice(-4)}`;
};

/**
 * Alışı hesaba yazır: sınaq — alınmışlara, abunə — uzadılır (eyni plan) və ya bu gündən başlayır.
 * Qəbz istifadəçinin vəziyyətinə, ödəniş — qazanc hesabatı üçün payments cədvəlinə yazılır. Qəbz nömrəsini qaytarır.
 */
export async function applyPurchase(uid: string, p: Purchase, method: string, receiptId = newReceiptId()) {
  const today = todayIso();
  await updateDemoState(uid, (state) => {
    if (state.payments.some((x) => x.id === receiptId)) return;
    if (p.kind === "exam") {
      if (!state.purchased.includes(p.examId)) state.purchased.push(p.examId);
      state.payments.unshift({ id: receiptId, title: p.title, date: today, method, examId: p.examId, amount: p.amountText });
    } else {
      // Eyni plan uzadılır; plan dəyişəndə yeni dövr bu gündən başlayır. İllik — 12 ay, aylıq — 30 gün.
      const sameTier = state.sub.status !== "none" && (state.sub.tier ?? "premium") === p.tier;
      const base = sameTier && state.sub.periodEnd > today ? state.sub.periodEnd : today;
      state.sub = { status: "active", periodEnd: periodEndFrom(base, p.period), tier: p.tier, period: p.period };
      state.payments.unshift({ id: receiptId, title: p.title, date: today, method, amount: p.amountText, period: p.period });
    }
  });
  await db
    .insert(payments)
    .values({
      id: `${uid}:${receiptId}`,
      userId: uid,
      kind: p.kind,
      title: p.title,
      amount: p.amount,
      tier: p.kind === "subscription" ? p.tier : null,
      period: p.kind === "subscription" ? p.period : null,
      examId: p.kind === "exam" ? p.examId : null,
    })
    .onConflictDoNothing();
  return receiptId;
}

type Order = typeof paymentOrders.$inferSelect;

/** Sifarişdən alış — məbləğ sifariş yarananda qeyd olunan (qiymət sonra dəyişsə də, ödənilən məbləğ yazılır). */
export const purchaseOfOrder = (o: Order): Purchase =>
  o.kind === "exam"
    ? { kind: "exam", examId: o.examId ?? "", title: o.title, amount: o.amount, amountText: priceText(o.amount) }
    : { kind: "subscription", tier: o.tier ?? "premium", period: o.period ?? "month", title: o.title, amount: o.amount, amountText: priceText(o.amount) };

export type EpointResult = { status: string; transaction?: string; message?: string; cardMask?: string; amount?: number };

/**
 * Epoint nəticəsini sifarişə tətbiq edir (bildiriş və status yoxlaması eyni yolla gəlir; təkrar çağırış zərərsizdir).
 * "success" + məbləğ uyğun — sifariş bir dəfə "success" olur və alış hesaba yazılır; "failed"/"error" — sifariş uğursuz.
 */
export async function settleOrder(orderId: string, r: EpointResult): Promise<Order | null> {
  const order = await db.query.paymentOrders.findFirst({ where: eq(paymentOrders.id, orderId) });
  if (!order) return null;
  if (order.status !== "new") return order;
  const info = { transaction: r.transaction ?? order.transaction, message: r.message ?? null, cardMask: r.cardMask ?? null };

  if (r.status === "success") {
    // Məbləğ sifarişdəkindən fərqlidirsə — alış açılmır (saxtakarlıq və ya xəta), admin baxsın.
    if (r.amount !== undefined && Math.abs(r.amount - order.amount) > 0.001) {
      const [failed] = await db
        .update(paymentOrders)
        .set({ ...info, status: "failed", message: `Məbləğ uyğun deyil: ${r.amount} ≠ ${order.amount}` })
        .where(and(eq(paymentOrders.id, orderId), eq(paymentOrders.status, "new")))
        .returning();
      return failed ?? order;
    }
    // Yalnız "new" → "success" keçidini edən sorğu alışı yazır (paralel bildiriş və yoxlama iki dəfə yazmasın).
    const receiptId = newReceiptId();
    const [won] = await db
      .update(paymentOrders)
      .set({ ...info, status: "success", receiptId, paidAt: new Date() })
      .where(and(eq(paymentOrders.id, orderId), eq(paymentOrders.status, "new")))
      .returning();
    if (!won) return (await db.query.paymentOrders.findFirst({ where: eq(paymentOrders.id, orderId) })) ?? order;
    const method = r.cardMask ? `Kart •••• ${r.cardMask.slice(-4)}` : "Bank kartı";
    await applyPurchase(won.userId, purchaseOfOrder(won), method, receiptId);
    return won;
  }
  if (r.status === "failed" || r.status === "error") {
    const [failed] = await db
      .update(paymentOrders)
      .set({ ...info, status: "failed" })
      .where(and(eq(paymentOrders.id, orderId), eq(paymentOrders.status, "new")))
      .returning();
    return failed ?? order;
  }
  return order;
}

/**
 * İstifadəçinin sifarişi; hələ "new"-dursa, Epoint-dən statusu soruşur (bildiriş gecikə bilər — uğurlu səhifə
 * gözləmədən nəticəni göstərsin). Başqasının sifarişi — null.
 */
export async function syncOrder(orderId: string, uid: string): Promise<Order | null> {
  const order = await db.query.paymentOrders.findFirst({ where: and(eq(paymentOrders.id, orderId), eq(paymentOrders.userId, uid)) });
  if (!order || order.status !== "new" || !order.transaction) return order ?? null;
  const keys = epointKeys();
  if (!keys) return order;
  try {
    const r = await paymentStatus(order.transaction, keys);
    const amount = Number(r.amount);
    return (
      (await settleOrder(order.id, {
        status: String(r.status ?? ""),
        transaction: order.transaction,
        message: typeof r.message === "string" ? r.message : undefined,
        cardMask: typeof r.card_mask === "string" ? r.card_mask : undefined,
        amount: r.amount !== undefined && r.amount !== null && Number.isFinite(amount) ? amount : undefined,
      })) ?? order
    );
  } catch (e) {
    console.error("Epoint status yoxlanılmadı", order.id, e);
    return order;
  }
}
