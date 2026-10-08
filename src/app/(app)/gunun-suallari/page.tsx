import type { Metadata } from "next";
import { DailyPager, DailyUpsell, TopicIconBadge } from "@/components/app/daily";
import { Page, Topbar } from "@/components/app/topbar";
import { ArrowIcon, CheckCircleIcon } from "@/components/icons";
import { ButtonLink } from "@/components/ui/button";
import { Card, h1Class, h3Class } from "@/components/ui/display";
import { EmptyState } from "@/components/ui/empty-art";
import { az } from "@/content/az";
import { FREE_DAILY_PER_TOPIC, TOPICS } from "@/lib/demo/content";
import { dailyOverview, dailyPager, hasPaidAccess, nextDailyHref } from "@/lib/demo/logic";
import { requireDemo } from "@/lib/demo/session";

export const metadata: Metadata = { title: az.app.nav.todayLong };

/** Bütün mövzular və hər mövzunun 1–10 sualı. Pulsuz planda hər mövzudan 1 sual açıqdır. */
export default async function DailyIndexPage() {
  const { state } = await requireDemo("/gunun-suallari");
  const t = az.app.daily;
  const paid = hasPaidAccess(state);
  const ov = dailyOverview(state);
  const next = nextDailyHref(state);

  return (
    <>
      <Topbar title={t.overviewTitle} back="/panel" />
      <Page>
        <div className="grid gap-2">
          <h1 className={h1Class}>{t.overviewTitle}</h1>
          <p className="text-ink-muted">
            {paid
              ? t.overviewLead(ov.topics.length, ov.total)
              : t.overviewLeadFree(FREE_DAILY_PER_TOPIC, ov.locked)}
          </p>
        </div>

        {next ? (
          <ButtonLink href={next} block className="md:w-auto md:justify-self-start">
            {t.continue}
            <ArrowIcon className="size-[22px]" />
          </ButtonLink>
        ) : (
          <EmptyState
            tone="success"
            icon={<CheckCircleIcon />}
            title={paid ? t.finishTitle : t.freeFinishTitle}
          >
            {paid ? t.finishText : t.freeFinishText}
          </EmptyState>
        )}

        {!paid && <DailyUpsell locked={ov.locked} />}

        <ul className="m-0 grid list-none gap-3 p-0 lg:grid-cols-2">
          {ov.topics.map((x) => (
            <li key={x.topic}>
              <Card as="section" aria-labelledby={`dt-${x.topic}`} className="grid h-full gap-4">
                <div className="flex items-center gap-3">
                  <TopicIconBadge icon={TOPICS[x.topic].icon} />
                  <div className="min-w-0 flex-1">
                    <h2 id={`dt-${x.topic}`} className={h3Class}>
                      {x.name}
                    </h2>
                    <p className="text-small text-ink-muted">
                      {paid
                        ? t.topicDone(x.done, x.total)
                        : x.openLeft
                          ? t.topicFree(x.open, x.locked)
                          : t.freeDone(x.locked)}
                    </p>
                  </div>
                </div>
                <DailyPager items={dailyPager(state, x.topic)} label={t.pagerLabel(x.name)} />
              </Card>
            </li>
          ))}
        </ul>
      </Page>
    </>
  );
}
