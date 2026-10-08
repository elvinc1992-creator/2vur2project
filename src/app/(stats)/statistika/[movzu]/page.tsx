import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { auth } from "@/auth";
import { Page, Topbar } from "@/components/app/topbar";
import { BackIcon, LockIcon } from "@/components/icons";
import { ChartFrame, DataTable } from "@/components/stats/chart-frame";
import { BarRows, ColumnChart, StatCard } from "@/components/stats/charts";
import { ButtonLink } from "@/components/ui/button";
import { Tag, h1Class, h3Class } from "@/components/ui/display";
import { az } from "@/content/az";
import { MATCH_LEVELS } from "@/db/schema";
import { hasPaidAccess } from "@/lib/demo/logic";
import { personalByTopic } from "@/lib/demo/personal";
import { initials } from "@/lib/demo/session";
import { getDemoState } from "@/lib/demo/state";
import { fmtDec, fmtInt, fmtPct } from "@/lib/format";
import { parseFilters, toQuery } from "@/lib/stats/filters";
import { getFilterOptions, getTopic, getTopicMatches, getTopicRefs, getTopicTypes, getTopicYears } from "@/lib/stats/queries";

const FREE_REFS = 3;
const TOP_TYPES = 10;
const MATCH_TONE = {
  EYNİ: "success",
  "Çox yaxın": "navy",
  Oxşar: "navy",
  Zəif: "warning",
  Tapılmadı: "danger",
  Yoxlanmayıb: "muted",
} as const;

export async function generateMetadata(props: PageProps<"/statistika/[movzu]">): Promise<Metadata> {
  const { movzu } = await props.params;
  const topic = await getTopic(movzu);
  return { title: topic ? `${topic.name} · ${az.app.stats.title}` : az.app.stats.title };
}

export default async function TopicStatsPage(props: PageProps<"/statistika/[movzu]">) {
  const { movzu } = await props.params;
  const topic = await getTopic(movzu);
  if (!topic) notFound();

  const sp = await props.searchParams;
  const backQuery = toQuery(parseFilters(sp, await getFilterOptions()));
  const session = await auth();
  const state = session?.user?.id ? await getDemoState(session.user.id) : null;
  const paid = state ? hasPaidAccess(state) : false;
  const mine = state ? personalByTopic(state).get(topic.name) : undefined;
  const t = az.app.stats.detail;

  // Pulsuz/qonaq üçün limit serverdə — qalan istinadlar brauzerə getmir.
  const [years, matches, types, refs] = await Promise.all([
    getTopicYears(topic.id),
    getTopicMatches(topic.id),
    getTopicTypes(topic.id),
    getTopicRefs(topic.id, paid ? null : FREE_REFS),
  ]);

  const matchRows = (toplu: "2023" | "2025") =>
    MATCH_LEVELS.map((level) => ({
      level,
      n: matches.filter((m) => m.toplu === toplu && m.match === level).reduce((s, m) => s + m.n, 0),
    })).filter((r) => r.level !== "Yoxlanmayıb" || r.n > 0);

  return (
    <>
      {session?.user && <Topbar title={topic.name} back={`/statistika${backQuery}`} avatar={initials(session.user.name)} />}
      <Page>
        <Link
          href={`/statistika${backQuery}`}
          className="inline-flex min-h-11 items-center gap-2 justify-self-start font-semibold text-navy-500 underline underline-offset-3"
        >
          <BackIcon className="size-5" />
          {t.back}
        </Link>
        <div className="flex flex-wrap items-center gap-3">
          <h1 className={h1Class}>{topic.name}</h1>
          <Tag tone="type">{topic.part}</Tag>
        </div>

        <dl className="m-0 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          <StatCard label={t.cards.total} value={fmtInt(topic.total)} />
          <StatCard label={t.cards.share} value={fmtPct(topic.share)} />
          <StatCard label={t.cards.avg} value={fmtDec(topic.avgPerExam, 1)} />
          <StatCard
            label={t.cards.match}
            value={fmtPct(topic.found2025 / topic.total)}
            sub={t.matchSub(fmtPct(topic.found2023 / topic.total))}
          />
        </dl>
        {mine && (
          <p className="rounded-lg border border-line bg-white p-4 font-semibold text-ink">
            {az.app.stats.ranking.personal(fmtPct(mine.pct, 0), mine.ok, mine.total)}
          </p>
        )}

        <div className="grid grid-cols-1 gap-6 lg:grid-cols-2">
          <section aria-labelledby="years" className="grid grid-cols-1 gap-3 rounded-lg border border-line bg-white p-4 lg:p-6">
            <h2 id="years" className={h3Class}>
              {t.years}
            </h2>
            <ChartFrame
              id="years-view"
              summary={t.yearsSummary(years.map((y) => `${y.year} — ${y.n}`).join(", "))}
              chart={<ColumnChart items={years.map((y) => ({ label: String(y.year), value: y.n, text: fmtInt(y.n) }))} />}
              table={
                <DataTable
                  caption={t.yearsCaption}
                  head={[t.colYear, t.colCount]}
                  rows={years.map((y) => [String(y.year), fmtInt(y.n)])}
                />
              }
            />
          </section>

          <section aria-labelledby="kinds" className="grid grid-cols-1 gap-3 rounded-lg border border-line bg-white p-4 lg:p-6">
            <h2 id="kinds" className={h3Class}>
              {t.kinds}
            </h2>
            <ChartFrame
              id="kinds-view"
              summary={t.kindsSummary(fmtInt(topic.buraxilis), fmtInt(topic.qebul))}
              chart={
                <BarRows
                  items={[
                    { label: t.kind.buraxilis, value: topic.buraxilis, text: `${fmtInt(topic.buraxilis)} · ${fmtPct(topic.buraxilis / topic.total)}` },
                    { label: t.kind.qebul, value: topic.qebul, text: `${fmtInt(topic.qebul)} · ${fmtPct(topic.qebul / topic.total)}` },
                  ]}
                />
              }
              table={
                <DataTable
                  caption={t.kindsCaption}
                  head={[t.colKind, t.colCount]}
                  rows={[
                    [t.kind.buraxilis, fmtInt(topic.buraxilis)],
                    [t.kind.qebul, fmtInt(topic.qebul)],
                  ]}
                />
              }
            />
          </section>
        </div>

        <section aria-labelledby="matches" className="grid grid-cols-1 gap-4 rounded-lg border border-line bg-white p-4 lg:p-6">
          <h2 id="matches" className={h3Class}>
            {t.matches}
          </h2>
          <div className="grid grid-cols-1 gap-6 lg:grid-cols-2">
            {(["2023", "2025"] as const).map((toplu) => {
              const rows = matchRows(toplu);
              return (
                <div key={toplu} className="grid min-w-0 grid-cols-1 gap-2">
                  <h3 className="font-semibold text-ink">{t.toplu(toplu)}</h3>
                  <ChartFrame
                    id={`match-${toplu}`}
                    summary={t.matchesSummary(toplu, rows.map((r) => `${r.level} — ${r.n}`).join(", "))}
                    chart={
                      <BarRows
                        items={rows.map((r) => ({
                          label: r.level,
                          value: r.n,
                          text: `${fmtInt(r.n)} · ${fmtPct(r.n / topic.total)}`,
                          tone: MATCH_TONE[r.level],
                        }))}
                      />
                    }
                    table={
                      <DataTable
                        caption={t.matchesCaption(toplu)}
                        head={[t.colLevel, t.colCount]}
                        rows={rows.map((r) => [r.level, fmtInt(r.n)])}
                      />
                    }
                  />
                </div>
              );
            })}
          </div>
        </section>

        {types.length > 0 && (
          <section aria-labelledby="types" className="grid grid-cols-1 gap-3 rounded-lg border border-line bg-white p-4 lg:p-6">
            <h2 id="types" className={h3Class}>
              {t.types}
            </h2>
            <BarRows items={types.slice(0, TOP_TYPES).map((x) => ({ label: x.type, value: x.n, text: fmtInt(x.n) }))} />
            {types.length > TOP_TYPES && (
              <details>
                <summary className="min-h-11 cursor-pointer py-2 font-semibold text-navy-500 underline underline-offset-3">
                  {t.typesMore(types.length)}
                </summary>
                <div className="pt-2">
                  <DataTable caption={t.types} head={[t.colType, t.colCount]} rows={types.map((x) => [x.type, fmtInt(x.n)])} />
                </div>
              </details>
            )}
          </section>
        )}

        <section aria-labelledby="refs" className="grid grid-cols-1 gap-3 rounded-lg border border-line bg-white p-4 lg:p-6">
          <h2 id="refs" className={h3Class}>
            {t.refs}
          </h2>
          <p className="text-small text-ink-muted">{t.refsNote}</p>
          <div>
            <DataTable
              caption={t.refsCaption}
              head={[t.colExam, t.colNo, t.col2023, t.col2025]}
              rows={refs.rows.map((r) => [
                r.exam,
                String(r.no),
                r.ref2023 ? `${r.ref2023} · ${r.match2023}` : t.none,
                r.ref2025 ? `${r.ref2025} · ${r.match2025}` : t.none,
              ])}
            />
          </div>
          {!paid && refs.total > refs.rows.length && (
            <div className="flex flex-wrap items-center gap-3 rounded-md bg-navy-050 p-4">
              <LockIcon className="size-5 flex-none text-navy-900" />
              <p className="flex-1 text-small text-ink">{t.refsLocked(refs.rows.length, refs.total)}</p>
              {state ? (
                <ButtonLink href="/odenis" variant="primary" size="sm">
                  {az.app.stats.plan.subscribe}
                </ButtonLink>
              ) : (
                <ButtonLink href={`/daxil-ol?next=/statistika/${topic.slug}`} size="sm">
                  {az.app.stats.login}
                </ButtonLink>
              )}
            </div>
          )}
        </section>
      </Page>
    </>
  );
}
