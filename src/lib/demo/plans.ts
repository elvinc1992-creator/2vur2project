// Abunə planları: Free (hər daxil olan istifadəçi), Pro və Premium.
// Hansı hissənin açıq olduğu yalnız buradan müəyyən olunur (serverdə yoxlanılır).
//
// Free    — günün hər mövzusundan 2 sual, Səhvlərim, Statistika, ayda 1 sınaq (özü seçir).
// Pro     — günün bütün sualları, Səhvlərim, Statistika, həftədə 1 sınaq (özü seçir).
// Premium — hər şey: bütün sınaqlar və onlayn repetitor.

import type { DemoState, PaidTier } from "./state";

export type Tier = "free" | PaidTier;

export const PLANS: Record<Tier, { name: string; price: string | null }> = {
  free: { name: "Free", price: null },
  pro: { name: "Pro", price: "6.90 AZN" },
  premium: { name: "Premium", price: "12.90 AZN" },
};

/** Tək sınağın qiyməti (planın kvotasından əlavə almaq üçün). */
export const EXAM_PRICE = "3 AZN";

/** Ödəniş üçün qiymət: tək sınaq və ya planın aylıq qiyməti. */
export const priceOf = (kind: "exam" | PaidTier) => (kind === "exam" ? EXAM_PRICE : (PLANS[kind].price ?? ""));

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
