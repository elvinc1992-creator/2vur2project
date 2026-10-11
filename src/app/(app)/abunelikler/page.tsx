import type { Metadata } from "next";
import { Page, Topbar } from "@/components/app/topbar";
import { az } from "@/content/az";
import { addDays, formatDate } from "@/lib/demo/logic";
import { examPricesText, planInfos } from "@/components/plans-data";
import { tierOf } from "@/lib/demo/plans";
import { initials, requireDemo } from "@/lib/demo/session";
import { PlansView } from "@/components/plans-view";

export const metadata: Metadata = { title: az.app.plans.title };


/**
 * Abunəliklər: Free / Pro / Premium, Aylıq ↔ İllik keçidi, müqayisə cədvəli.
 * Digər ödənişli plana keçmək olar (Pro ↔ Premium); cari aylıq planı illiyə keçirmək olar; cari plan — idarə (ləğv).
 */
export default async function PlansPage() {
  const { user, state } = await requireDemo("/abunelikler");
  const t = az.app.plans;
  const current = tierOf(state);
  const currentPeriod = state.sub.period === "year" ? "year" : "month";

  const plans = planInfos();

  const currentNote =
    current === "free"
      ? null
      : `${currentPeriod === "year" ? t.yearlyActive : t.monthlyActive} · ${t.activeUntil(formatDate(addDays(state.sub.periodEnd, 1)))}`;

  return (
    <>
      <Topbar title={t.title} avatar={initials(user.name)} />
      <Page>
        <PlansView plans={plans} current={current} currentPeriod={currentPeriod} currentNote={currentNote} examPrice={await examPricesText()} />
      </Page>
    </>
  );
}
