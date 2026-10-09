import type { Metadata } from "next";
import { DailyPager, DailyUpsell } from "@/components/app/daily";
import { Page, Topbar } from "@/components/app/topbar";
import { ArrowIcon, CheckCircleIcon } from "@/components/icons";
import { TopicIcon } from "@/components/landing/topic-icon";
import { ButtonLink } from "@/components/ui/button";
import { Card, h1Class, h3Class } from "@/components/ui/display";
import { EmptyState } from "@/components/ui/empty-art";
import { az } from "@/content/az";
import { FREE_DAILY_PER_TOPIC } from "@/lib/demo/content";
import { requireDaily } from "@/lib/demo/daily";
import { dailyOverview, dailyPager, nextDailyHref } from "@/lib/demo/logic";
import { hasFullDaily } from "@/lib/demo/plans";

export const metadata: Metadata = { title: az.app.nav.todayLong };

/** Bu günün 4 mövzusu × 5 sual (bankdan təsadüfi). Free planda hər mövzudan 2 sual açıqdır. */
export default async function DailyIndexPage() {
  const { state, ctx } = await requireDaily("/gunun-suallari");
  const t = az.app.daily;
  const full = hasFullDaily(state);
  const ov = dailyOverview(state, ctx);
  const next = nextDailyHref(state, ctx);

  return (
    <>
      <Topbar title={t.overviewTitle} back="/panel" />
      <Page>
        <div className="grid gap-2">
          <h1 className={h1Class}>{t.overviewTitle}</h1>
          <p className="text-ink-muted">
            {full ? t.overviewLead(ov.topics.length, ov.total) : t.overviewLeadFree(FREE_DAILY_PER_TOPIC, ov.locked)}
          </p>
        </div>

        {next ? (
          <ButtonLink href={next} block className="md:w-auto md:justify-self-start">
            {t.continue}
            <ArrowIcon className="size-[22px]" />
          </ButtonLink>
        ) : (
          <EmptyState tone="success" icon={<CheckCircleIcon />} title={full ? t.finishTitle : t.freeFinishTitle}>
            {full ? t.finishText : t.freeFinishText}
          </EmptyState>
        )}

        {!full && <DailyUpsell locked={ov.locked} />}

        <ul className="m-0 grid list-none gap-3 p-0 lg:grid-cols-2">
          {ov.topics.map((x) => (
            <li key={x.topic}>
              <Card as="section" aria-labelledby={`dt-${x.topic}`} className="grid h-full gap-4">
                <div className="flex items-center gap-3">
                  <span className="grid size-10 flex-none place-items-center rounded-[12px] bg-navy-100 text-navy-900">
                    <TopicIcon name={x.name} className="size-[22px]" />
                  </span>
                  <div className="min-w-0 flex-1">
                    <h2 id={`dt-${x.topic}`} className={h3Class}>
                      {x.name}
                    </h2>
                    <p className="text-small text-ink-muted">
                      {full ? t.topicDone(x.done, x.total) : x.openLeft ? t.topicFree(x.open, x.locked) : t.freeDone(x.locked)}
                    </p>
                  </div>
                </div>
                <DailyPager items={dailyPager(state, ctx, x.topic)} label={t.pagerLabel(x.name)} />
              </Card>
            </li>
          ))}
        </ul>
      </Page>
    </>
  );
}
