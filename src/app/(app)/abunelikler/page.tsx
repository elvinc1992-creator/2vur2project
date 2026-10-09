import type { Metadata } from "next";
import { Page, Topbar } from "@/components/app/topbar";
import { CheckIcon } from "@/components/icons";
import { ButtonLink } from "@/components/ui/button";
import { Card, Tag, h1Class } from "@/components/ui/display";
import { az } from "@/content/az";
import { cn } from "@/lib/cn";
import { addDays, formatDate } from "@/lib/demo/logic";
import { EXAM_PRICE, PLANS, priceOf, tierOf, type Tier } from "@/lib/demo/plans";
import { initials, requireDemo } from "@/lib/demo/session";

export const metadata: Metadata = { title: az.app.plans.title };

const TIERS: Tier[] = ["free", "pro", "premium"];

/** Abunəliklər: Free / Pro / Premium, cari plan. Free — Pro və Premium təklif olunur; ödənişli planda — yalnız idarə (ləğv). */
export default async function PlansPage() {
  const { user, state } = await requireDemo("/abunelikler");
  const t = az.app.plans;
  const pay = az.app.payment;
  const current = tierOf(state);

  return (
    <>
      <Topbar title={t.title} avatar={initials(user.name)} />
      <Page>
        <div className="grid gap-2">
          <h1 className={h1Class}>{t.title}</h1>
          <p className="max-w-[46rem] text-ink-muted">{t.lead}</p>
        </div>

        <ul className="m-0 grid list-none gap-4 p-0 lg:grid-cols-3">
          {TIERS.map((x) => {
            const isCurrent = x === current;
            return (
              <li key={x}>
                <Card
                  as="section"
                  aria-labelledby={`plan-${x}`}
                  // Flex sütun: düymə həmişə kartın altında (xüsusiyyət sayı fərqli olsa da düymələr bir xətdə).
                  className={cn("flex h-full flex-col gap-4", isCurrent && "ring-2 ring-navy-900")}
                >
                  <div className="flex items-center justify-between gap-2">
                    <h2 id={`plan-${x}`} className="font-display text-h3 font-extrabold text-navy-900">
                      {PLANS[x].name}
                    </h2>
                    {isCurrent && <Tag tone="success">{pay.current}</Tag>}
                  </div>
                  <p className="m-0 font-display text-2xl leading-8 font-extrabold text-navy-900 tabular">
                    {x === "free" ? t.free : pay.perMonth(priceOf(x))}
                  </p>
                  <ul className="m-0 grid list-none gap-2 p-0">
                    {pay.planFeatures[x].map((f) => (
                      <li key={f} className="flex items-start gap-2 text-[15px] leading-[22px]">
                        <CheckIcon className="mt-px size-5 flex-none text-success-700" />
                        {f}
                      </li>
                    ))}
                  </ul>
                  {isCurrent && x !== "free" && (
                    <p className="m-0 text-small text-ink-muted">
                      {t.activeUntil(formatDate(addDays(state.sub.periodEnd, 1)))}
                    </p>
                  )}
                  {/* Free planda — Pro/Premium təklifi; ödənişli planda — yalnız abunəni idarə et (ləğv). */}
                  {current === "free" && x !== "free" && (
                    <ButtonLink href={`/odenis?plan=${x}`} variant={x === "pro" ? "primary" : "secondary"} className="mt-auto">
                      {t.choose(PLANS[x].name)}
                    </ButtonLink>
                  )}
                  {isCurrent && x !== "free" && (
                    <ButtonLink href="/profil" variant="secondary" className="mt-auto">
                      {t.manage}
                    </ButtonLink>
                  )}
                </Card>
              </li>
            );
          })}
        </ul>

        <p className="text-small text-ink-muted">{t.examPrice(EXAM_PRICE)}</p>
      </Page>
    </>
  );
}
