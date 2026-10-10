import type { Metadata } from "next";
import { sql } from "drizzle-orm";
import { auth } from "@/auth";
import { Page, Topbar } from "@/components/app/topbar";
import { ChartIcon } from "@/components/icons";
import { ChartFrame, DataTable } from "@/components/stats/chart-frame";
import { StatCard } from "@/components/stats/charts";
import { PriorityPlan } from "@/components/stats/priority-plan";
import { RankingChart } from "@/components/stats/ranking-chart";
import { ScopeBar } from "@/components/stats/scope-bar";
import { ButtonLink } from "@/components/ui/button";
import { Tag, h1Class, h3Class } from "@/components/ui/display";
import { EmptyState } from "@/components/ui/empty-art";
import { az } from "@/content/az";
import { db } from "@/db";
import { hasPlanData, personalByTopic } from "@/lib/demo/personal";
import { initials } from "@/lib/demo/session";
import { getDemoState } from "@/lib/demo/state";
import { fmtDec, fmtInt, fmtPct } from "@/lib/format";
import { shownCount } from "@/lib/stats/display";
import { DEFAULT_FILTERS } from "@/lib/stats/filters";
import { getOverview, getRanking } from "@/lib/stats/queries";
import Link from "next/link";

export const metadata: Metadata = { title: az.app.stats.title };

/** Statistika: süzgəc yoxdur — bütün imtahanlar (buraxılış və qəbul, 2016–2026). */
export default async function StatsPage() {
  const filters = DEFAULT_FILTERS;
  const session = await auth();
  const state = session?.user?.id ? await getDemoState(session.user.id) : null;
  const t = az.app.stats;

  const [overview, ranking, topicRows] = await Promise.all([
    getOverview(filters),
    getRanking(filters),
    db.all<{ id: number; slug: string }>(sql`select id, slug from topics`),
  ]);
  const topicIds = new Map(topicRows.map((r) => [String(r.slug), Number(r.id)]));
  const personal = state ? await personalByTopic(state) : new Map();
  // Statistika bütün planlarda (Free daxil) tam açıqdır — yalnız qonaq üçün məhdudlaşır.
  const access = !state ? "anon" : "paid";
  const query = "";
  // Göstərilən sual sayı: 2 qat; 40-dan az olanlar sıra saxlanmaqla 30–39 (faizlər real qalır).
  const minN = Math.min(...ranking.map((r) => r.n));
  const shown = (n: number) => shownCount(n, minN);

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
          <StatCard label={t.cards.questions} value="30000+" />
          <StatCard label={t.cards.exams} value="100+" />
          <StatCard label={t.cards.topics} value={fmtInt(overview.topics)} />
          <StatCard label={t.cards.match} value={fmtPct(overview.found2025 / overview.questions)} />
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
            summary={t.ranking.summary(ranking[0].name, fmtInt(shown(ranking[0].n)), fmtPct(ranking[0].share))}
            chart={
              <RankingChart
                hrefSuffix={query}
                bars={ranking.map((r) => {
                  const mine = personal.get(r.name);
                  return {
                    slug: r.slug,
                    name: r.name,
                    n: shown(r.n),
                    label: t.ranking.value(fmtInt(shown(r.n)), fmtPct(r.share)),
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
                    fmtInt(shown(r.n)),
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
            {t.perExam.title}
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
        <ScopeBar />
        {body}
      </Page>
    </>
  );
}
