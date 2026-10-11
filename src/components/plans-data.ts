import "server-only";
import { discountPct, PLANS, yearlyPerMonth, yearlySavingPct, type Tier } from "@/lib/demo/plans";
import { listExamKinds } from "@/lib/exams/source";
import { priceText } from "@/lib/exams/types";
import type { PlanInfo } from "./plans-view";

const TIERS: Tier[] = ["free", "pro", "premium"];

/** Abunə kartlarının məlumatı (Abunəliklər səhifəsi və ana səhifə). */
export const planInfos = (): PlanInfo[] =>
  TIERS.map((tier) => ({
    tier,
    name: PLANS[tier].name,
    monthly: PLANS[tier].price,
    oldMonthly: PLANS[tier].oldPrice ?? null,
    discount: discountPct(tier),
    yearly: PLANS[tier].yearlyPrice ?? null,
    yearlyPerMonth: tier === "free" ? null : yearlyPerMonth(tier),
    yearlySave: tier === "free" ? null : yearlySavingPct(tier),
  }));

/** Tək sınağın qiymətləri tiplər üzrə (bazadan): "9-cu sinif buraxılış — 3 AZN, …, Mövzu sınağı — 2 AZN". */
export async function examPricesText() {
  const kinds = await listExamKinds();
  return kinds.map((k) => `${k.name} — ${priceText(k.price)}`).join(", ");
}
