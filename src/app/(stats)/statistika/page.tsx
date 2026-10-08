import type { Metadata } from "next";
import { sql } from "drizzle-orm";
import { auth } from "@/auth";
import { Page, Topbar } from "@/components/app/topbar";
import { ChartIcon } from "@/components/icons";
import { ChartFrame, DataTable } from "@/components/stats/chart-frame";
import { StatCard } from "@/components/stats/charts";
import { FilterBar } from "@/components/stats/filter-bar";
import { Methodology } from "@/components/stats/methodology";
import { PriorityPlan } from "@/components/stats/priority-plan";
import { RankingChart } from "@/components/stats/ranking-chart";
import { ButtonLink } from "@/components/ui/button";
import { Tag, h1Class, h3Class } from "@/components/ui/display";
import { EmptyState } from "@/components/ui/empty-art";
import { az } from "@/content/az";
import { db } from "@/db";
import { hasPaidAccess } from "@/lib/demo/logic";
import { hasPlanData, personalByTopic } from "@/lib/demo/personal";
import { initials } from "@/lib/demo/session";
import { getDemoState } from "@/lib/demo/state";
import { fmtDec, fmtInt, fmtPct } from "@/lib/format";
import { parseFilters, toQuery } from "@/lib/stats/filters";
import { getFilterOptions, getOverview, getRanking } from "@/lib/stats/queries";
import Link from "next/link";

export const metadata: Metadata = { title: az.app.stats.title };

export default async function StatsPage(props: PageProps<"/statistika">) {
  const sp = await props.searchParams;
  const options = await getFilterOptions();
  const filters = parseFilters(sp, options);
  const session = await auth();
  const state = session?.user?.id ? await getDemoState(session.user.id) : null;
  const t = az.app.stats;

  const [overview, ranking, topicRows] = await Promise.all([
    getOverview(filters),
    getRanking(filters),
    db.all<{ id: number; slug: string }>(sql`select id, slug from topics`),
  ]);
  const topicIds = new Map(topicRows.map((r) => [String(r.slug), Number(r.id)]));
  const personal = state ? personalByTopic(state) : new Map();
  const access = !state ? "anon" : hasPaidAccess(state) ? "paid" : "free";
  const query = toQuery(filters);
  const kindLabel = filters.kind === "all" ? null : t.filters.kinds[filters.kind].toLocaleLowerCase("az");

  const heading = (
    <div className="grid gap-2">
      <h1 className={h1Class}>{t.h1}</h1>
      <p className="max-w-3xl text-ink-muted">{t.intro}</p>
    </div>
  );

  const body =
    overview.questions === 0 ? (
      <EmptyState icon={<ChartIcon />} title={t.empty.title}>
        <p>{t.empty.text}</p>
        <ButtonLink href="/statistika" variant="secondary" className="mt-3">
          {t.filters.reset}
        </ButtonLink>
      </EmptyState>
    ) : (
      <>
        <dl className="m-0 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          <StatCard label={t.cards.questions} value={fmtInt(overview.questions)} />
          <StatCard label={t.cards.exams} value={fmtInt(overview.exams)} />
          <StatCard label={t.cards.topics} value={fmtInt(overview.topics)} />
          <StatCard
            label={t.cards.match}
            value={fmtPct(overview.found2025 / overview.questions)}
            sub={
              <>
                {t.cards.matchSub(fmtInt(overview.found2025), fmtInt(overview.questions))}
                <br />
                {t.cards.matchSub23(fmtPct(overview.found2023 / overview.questions))}
              </>
            }
          />
        </dl>

        <section aria-labelledby="ranking" className="grid grid-cols-1 gap-4 rounded-lg border border-line bg-white p-4 lg:p-6">
          <div className="grid gap-1">
            <h2 id="ranking" className={h3Class}>
              {t.ranking.title}
            </h2>
            <p className="text-small text-ink-muted">{t.ranking.subtitle}</p>
            {personal.size > 0 && <p className="text-small text-ink-muted">{t.ranking.personalNote}</p>}
          </div>
          <ChartFrame
            id="ranking-view"
            summary={t.ranking.summary(ranking[0].name, fmtInt(ranking[0].n), fmtPct(ranking[0].share))}
            chart={
              <RankingChart
                hrefSuffix={query}
                bars={ranking.map((r) => {
                  const mine = personal.get(r.name);
                  return {
                    slug: r.slug,
                    name: r.name,
                    n: r.n,
                    label: t.ranking.value(fmtInt(r.n), fmtPct(r.share)),
                    personal: mine ? { pct: mine.pct, label: t.ranking.personal(fmtPct(mine.pct, 0), mine.ok, mine.total) } : undefined,
                  };
                })}
              />
            }
            table={
              <DataTable
                caption={t.ranking.caption}
                head={[t.ranking.colTopic, t.ranking.colCount, t.ranking.colShare, ...(personal.size ? [t.ranking.colPersonal] : [])]}
                rows={ranking.map((r) => {
                  const mine = personal.get(r.name);
                  return [
                    <Link key="l" href={`/statistika/${r.slug}${query}`} className="text-navy-500 underline underline-offset-3">
                      {r.name}
                    </Link>,
                    fmtInt(r.n),
                    fmtPct(r.share),
                    ...(personal.size ? [mine ? `${fmtPct(mine.pct, 0)} (${mine.ok}/${mine.total})` : "—"] : []),
                  ];
                })}
              />
            }
          />
        </section>

        <section aria-labelledby="per-exam" className="grid grid-cols-1 gap-3 rounded-lg border border-line bg-white p-4 lg:p-6">
          <h2 id="per-exam" className={h3Class}>
            {kindLabel ? t.perExam.titleKind(kindLabel) : t.perExam.title}
          </h2>
          <div>
            <DataTable
              caption={t.perExam.caption(fmtInt(overview.exams))}
              head={[t.perExam.colTopic, t.perExam.colAvg, t.perExam.colRange]}
              rows={ranking.map((r) => [r.name, fmtDec(r.avg, 1), `${r.min}–${r.max}`])}
            />
          </div>
        </section>

        <section aria-labelledby="plan" className="grid gap-3">
          <div className="flex flex-wrap items-center gap-2">
            <h2 id="plan" className={h3Class}>
              {t.plan.title}
            </h2>
            <Tag tone="coral">{t.plan.badge}</Tag>
          </div>
          <p className="text-small text-ink-muted">{t.plan.subtitle}</p>
          <PriorityPlan
            access={access}
            ranking={ranking}
            personal={personal}
            hasData={state ? hasPlanData(state) : false}
            topicIds={topicIds}
          />
        </section>
      </>
    );

  return (
    <>
      {session?.user && <Topbar title={t.title} avatar={initials(session.user.name)} />}
      <Page>
        {heading}
        <FilterBar filters={filters} options={options} />
        {body}
        <Methodology />
      </Page>
    </>
  );
}
