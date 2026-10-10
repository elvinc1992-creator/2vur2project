// Abunə planları: Free (hər daxil olan istifadəçi), Pro və Premium.
// Hansı hissənin açıq olduğu yalnız buradan müəyyən olunur (serverdə yoxlanılır).
//
// Free    — günün hər mövzusundan 2 sual, Səhvlərim, Statistika, ayda 1 sınaq (özü seçir).
// Pro     — günün bütün sualları, Səhvlərim, Statistika, həftədə 1 sınaq (özü seçir).
// Premium — hər şey: bütün sınaqlar və onlayn repetitor.

import type { DemoState, PaidTier } from "./state";

export type Tier = "free" | PaidTier;

/** Ödəniş dövrü: aylıq (30 gün) və ya illik (12 ay). */
export type BillingPeriod = "month" | "year";
export const BILLING_PERIODS: BillingPeriod[] = ["month", "year"];

/** price — aylıq; oldPrice — endirimdən əvvəlki aylıq (üstündən xətt çəkilir); yearlyPrice — 12 ay. */
export const PLANS: Record<Tier, { name: string; price: string | null; oldPrice?: string; yearlyPrice?: string }> = {
  free: { name: "Free", price: null },
  pro: { name: "Pro", price: "6.90 AZN", oldPrice: "11.90 AZN", yearlyPrice: "49.90 AZN" },
  premium: { name: "Premium", price: "12.90 AZN", oldPrice: "21.90 AZN", yearlyPrice: "89.90 AZN" },
};

const amount = (s: string | null | undefined) => Number.parseFloat(s ?? "");
const fmtAzn = (n: number) => `${n.toFixed(2)} AZN`;

/** İllik planın ayda düşən qiyməti, məs. 49.90 / 12 → "4.16 AZN". */
export function yearlyPerMonth(tier: PaidTier): string {
  return fmtAzn(Math.floor((amount(PLANS[tier].yearlyPrice) / 12) * 100) / 100);
}

/** İllik planın 12 aylıq ödənişə görə qənaəti, %: 6.90 × 12 = 82.80 → 49.90 — 40. */
export function yearlySavingPct(tier: PaidTier): number {
  const monthly12 = amount(PLANS[tier].price) * 12;
  return Math.round(((monthly12 - amount(PLANS[tier].yearlyPrice)) / monthly12) * 100);
}

/** Endirim faizi (yuvarlaqlaşdırılmış), məs. 11.90 → 6.90: 42. */
export function discountPct(tier: Tier): number | null {
  const { price, oldPrice } = PLANS[tier];
  const now = Number.parseFloat(price ?? "");
  const was = Number.parseFloat(oldPrice ?? "");
  if (!Number.isFinite(now) || !Number.isFinite(was) || was <= now) return null;
  return Math.round(((was - now) / was) * 100);
}

/** Tək sınağın qiyməti (planın kvotasından əlavə almaq üçün). */
export const EXAM_PRICE = "3 AZN";

/** Ödəniş üçün qiymət: tək sınaq və ya planın aylıq / illik qiyməti. */
export const priceOf = (kind: "exam" | PaidTier, period: BillingPeriod = "month") =>
  kind === "exam" ? EXAM_PRICE : ((period === "year" ? PLANS[kind].yearlyPrice : PLANS[kind].price) ?? "");

/** Dövrün sonu: aylıq — +30 gün, illik — +12 ay (eyni tarix, gələn il). YYYY-MM-DD. */
export function periodEndFrom(startIso: string, period: BillingPeriod): string {
  const d = new Date(`${startIso}T12:00:00Z`);
  if (period === "year") d.setUTCFullYear(d.getUTCFullYear() + 1);
  else d.setUTCDate(d.getUTCDate() + 30);
  return d.toISOString().slice(0, 10);
}

export const TIME_ZONE = "Asia/Baku";

/** Cari plan. Ləğv edilmiş abunə dərhal dayanır — istifadəçi Free plana keçir. */
export function tierOf(state: DemoState): Tier {
  if (state.sub.status !== "active") return "free";
  // Planlardan əvvəlki abunələr hər şeyi açırdı — Premium sayılır.
  return state.sub.tier ?? "premium";
}

/** Günün bütün sualları (Free — hər mövzudan yalnız 2). */
export const hasFullDaily = (state: DemoState) => tierOf(state) !== "free";

/** Onlayn repetitor — yalnız Premium. */
export const canUseRepetitor = (state: DemoState) => tierOf(state) === "premium";

/** Səhvlərim təkrarında oxşar suallar — Pro və Premium. */
export const canPracticeSimilar = (state: DemoState) => tierOf(state) !== "free";

/* ---------------- Sınaq kvotası ---------------- */

export type ExamQuota =
  | { kind: "all" }
  | { kind: "month" | "week"; limit: number; used: number; left: number; resetsAt: string };

/** Bakı vaxtı ilə tarix hissələri. */
function bakuParts(ms: number) {
  const s = new Intl.DateTimeFormat("en-CA", { timeZone: TIME_ZONE }).format(new Date(ms));
  const [y, m, d] = s.split("-").map(Number);
  return { y, m, d, iso: s };
}

const isoOf = (y: number, m: number, d: number) => new Date(Date.UTC(y, m - 1, d)).toISOString().slice(0, 10);

/** Dövrün başlanğıcı və növbəti dövrün başlanğıcı (YYYY-MM-DD, Bakı). Həftə bazar ertəsindən başlayır. */
export function periodBounds(kind: "month" | "week", now = Date.now()) {
  const { y, m, d } = bakuParts(now);
  if (kind === "month") return { start: isoOf(y, m, 1), next: isoOf(m === 12 ? y + 1 : y, m === 12 ? 1 : m + 1, 1) };
  const weekday = (new Date(Date.UTC(y, m - 1, d)).getUTCDay() + 6) % 7; // 0 = bazar ertəsi
  return { start: isoOf(y, m, d - weekday), next: isoOf(y, m, d - weekday + 7) };
}

export function examQuota(state: DemoState, now = Date.now()): ExamQuota {
  const tier = tierOf(state);
  if (tier === "premium") return { kind: "all" };
  const kind = tier === "pro" ? "week" : "month";
  const { start, next } = periodBounds(kind, now);
  const used = (state.examClaims ?? []).filter((c) => {
    const day = bakuParts(c.at).iso;
    return day >= start && day < next;
  }).length;
  const limit = 1;
  return { kind, limit, used, left: Math.max(0, limit - used), resetsAt: next };
}
