import type { Metadata } from "next";
import { Page, Topbar } from "@/components/app/topbar";
import { az } from "@/content/az";
import { addDays, formatDate } from "@/lib/demo/logic";
import { discountPct, EXAM_PRICE, PLANS, tierOf, yearlyPerMonth, yearlySavingPct, type Tier } from "@/lib/demo/plans";
import { initials, requireDemo } from "@/lib/demo/session";
import { PlansView, type PlanInfo } from "./plans-view";

export const metadata: Metadata = { title: az.app.plans.title };

const TIERS: Tier[] = ["free", "pro", "premium"];

/**
 * Abunəliklər: Free / Pro / Premium, Aylıq ↔ İllik keçidi, müqayisə cədvəli.
 * Digər ödənişli plana keçmək olar (Pro ↔ Premium); cari aylıq planı illiyə keçirmək olar; cari plan — idarə (ləğv).
 */
export default async function PlansPage() {
  const { user, state } = await requireDemo("/abunelikler");
  const t = az.app.plans;
  const current = tierOf(state);
  const currentPeriod = state.sub.period === "year" ? "year" : "month";

  const plans: PlanInfo[] = TIERS.map((tier) => ({
    tier,
    name: PLANS[tier].name,
    monthly: PLANS[tier].price,
    oldMonthly: PLANS[tier].oldPrice ?? null,
    discount: discountPct(tier),
    yearly: PLANS[tier].yearlyPrice ?? null,
    yearlyPerMonth: tier === "free" ? null : yearlyPerMonth(tier),
    yearlySave: tier === "free" ? null : yearlySavingPct(tier),
  }));

  const currentNote =
    current === "free"
      ? null
      : `${currentPeriod === "year" ? t.yearlyActive : t.monthlyActive} · ${t.activeUntil(formatDate(addDays(state.sub.periodEnd, 1)))}`;

  return (
    <>
      <Topbar title={t.title} avatar={initials(user.name)} />
      <Page>
        <PlansView plans={plans} current={current} currentPeriod={currentPeriod} currentNote={currentNote} examPrice={EXAM_PRICE} />
      </Page>
    </>
  );
}
