// Abunə planları: Free (hər daxil olan istifadəçi), Pro və Premium.
// Hansı hissənin açıq olduğu yalnız buradan müəyyən olunur (serverdə yoxlanılır).
//
// Free    — günün hər mövzusundan 2 sual, Səhvlərim, Statistika, hər ay 9-cu və 11-ci sinif buraxılışından
//           bir sınaq (ayın sınağı — bütün Free istifadəçilər üçün eyni).
// Pro     — günün bütün sualları, Səhvlərim, Statistika, həftədə 1 sınaq (özü seçir).
// Premium — hər şey: bütün sınaqlar və onlayn repetitor.

import type { ExamMeta, ExamType } from "@/lib/exams/types";
import type { DemoState, PaidTier } from "./state";

export type Tier = "free" | PaidTier;

/** Ödəniş dövrü: aylıq (30 gün) və ya illik (12 ay). */
export type BillingPeriod = "month" | "year";
export const BILLING_PERIODS: BillingPeriod[] = ["month", "year"];

/** price — aylıq; oldPrice — endirimdən əvvəlki aylıq (üstündən xətt çəkilir); yearlyPrice — 12 ay. */
export const PLANS: Record<Tier, { name: string; price: string | null; oldPrice?: string; yearlyPrice?: string }> = {
  free: { name: "Free", price: null },
  // MÜVƏQQƏTİ (Epoint testi): əsl qiymətlər — Pro 6.90 / 49.90 AZN, Premium 12.90 / 89.90 AZN.
  pro: { name: "Pro", price: "0.10 AZN", oldPrice: "11.90 AZN", yearlyPrice: "0.10 AZN" },
  premium: { name: "Premium", price: "0.10 AZN", oldPrice: "21.90 AZN", yearlyPrice: "0.10 AZN" },
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

/**
 * all — Premium; week — Pro (həftədə 1, özü seçir);
 * month — Free: ayın sınaqları (9-cu və 11-ci sinif buraxılışından bir — hamı üçün eyni), examIds — hələ götürülməyənlər.
 */
export type ExamQuota =
  | { kind: "all" }
  | { kind: "week"; limit: number; used: number; left: number; resetsAt: string }
  | { kind: "month"; examIds: string[]; left: number; resetsAt: string };

/** Free planın sınaq tipləri: hər ay hər tipdən bir sınaq. */
export const FREE_EXAM_TYPES = ["9", "11"] as const satisfies ExamType[];

type FreeCandidate = Pick<ExamMeta, "id" | "examType" | "status" | "createdAt">;

/**
 * Ayın Free sınaqları (Bakı vaxtı ilə ay) — bütün Free istifadəçilər üçün eyni.
 * Hər tip üçün: ay başlamazdan əvvəl yaradılmış ən yeni aktiv sınaq (ay ərzində dəyişmir);
 * belə sınaq yoxdursa — ən köhnə aktiv sınaq (sonradan yaradılanlar seçimi dəyişmir).
 */
export function freeExamsOfMonth(exams: FreeCandidate[], now = Date.now()): string[] {
  const start = Date.parse(`${periodBounds("month", now).start}T00:00:00+04:00`);
  return FREE_EXAM_TYPES.flatMap((type) => {
    const list = exams.filter((e) => e.examType === type && e.status === "active").sort((a, b) => a.createdAt - b.createdAt);
    const pick = list.filter((e) => e.createdAt < start).at(-1) ?? list[0];
    return pick ? [pick.id] : [];
  });
}

/** Plan üzrə bu sınağı pulsuz götürmək olarmı (status "locked" olanda). */
export const canClaimExam = (q: ExamQuota, id: string) =>
  q.kind === "week" ? q.left > 0 : q.kind === "month" && q.examIds.includes(id);

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

/** exams — saytın sınaqları (Free planın ayın sınaqlarını tapmaq üçün). */
export function examQuota(state: DemoState, exams: FreeCandidate[], now = Date.now()): ExamQuota {
  const tier = tierOf(state);
  if (tier === "premium") return { kind: "all" };
  if (tier === "free") {
    const { next } = periodBounds("month", now);
    // Artıq götürülən, başlanan və ya bitən sınaq yenidən təklif olunmur.
    const examIds = freeExamsOfMonth(exams, now).filter(
      (id) => !state.purchased.includes(id) && !state.attempts[id] && !state.results[id],
    );
    return { kind: "month", examIds, left: examIds.length, resetsAt: next };
  }
  const { start, next } = periodBounds("week", now);
  const used = (state.examClaims ?? []).filter((c) => {
    const day = bakuParts(c.at).iso;
    return day >= start && day < next;
  }).length;
  const limit = 1;
  return { kind: "week", limit, used, left: Math.max(0, limit - used), resetsAt: next };
}
