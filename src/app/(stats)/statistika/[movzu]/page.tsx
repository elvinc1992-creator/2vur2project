import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { auth } from "@/auth";
import { Page, Topbar } from "@/components/app/topbar";
import { BackIcon } from "@/components/icons";
import { ChartFrame, DataTable } from "@/components/stats/chart-frame";
import { BarRows, ColumnChart, StatCard } from "@/components/stats/charts";
import { Tag, h1Class, h3Class } from "@/components/ui/display";
import { az } from "@/content/az";
import { MATCH_LEVELS } from "@/db/schema";
import { personalByTopic } from "@/lib/demo/personal";
import { initials } from "@/lib/demo/session";
import { getDemoState } from "@/lib/demo/state";
import { fmtDec, fmtInt, fmtPct } from "@/lib/format";
import { yearsWithDemo } from "@/lib/stats/demo-years";
import { shownCount, splitShown } from "@/lib/stats/display";
import { DEFAULT_FILTERS } from "@/lib/stats/filters";
import { getRanking, getTopic, getTopicMatches, getTopicRefs, getTopicYears } from "@/lib/stats/queries";

/** Toplu istinadları — nümunə kimi yalnız bu qədər (hamı üçün; qalanı brauzerə getmir). */
const SAMPLE_REFS = 10;
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

  const session = await auth();
  const state = session?.user?.id ? await getDemoState(session.user.id) : null;
  const mine = state ? (await personalByTopic(state)).get(topic.name) : undefined;
  const t = az.app.stats.detail;

  const [realYears, matches, refs, ranking] = await Promise.all([
    getTopicYears(topic.id),
    getTopicMatches(topic.id),
    getTopicRefs(topic.id, SAMPLE_REFS),
    getRanking(DEFAULT_FILTERS),
  ]);
  // Göstərilən sual sayı (ümumi səhifədəki kimi): 2 qat; 40-dan az — 30–39. Faizlər real qalır.
  const shown = shownCount(topic.total, Math.min(...ranking.map((r) => r.n)));
  const [burShown, qebShown] = splitShown(shown, [topic.buraxilis, topic.qebul]);
  // 2016–2026: real illər + nümunə illər (mövzuya görə sabit); cəm = göstərilən sual sayı.
  const years = yearsWithDemo(realYears, topic.id, shown);
  // Uyğunluq — test toplusu üzrə (yalnız faiz).
  const matchRows = MATCH_LEVELS.map((level) => ({
    level,
    n: matches.filter((m) => m.toplu === "2025" && m.match === level).reduce((s, m) => s + m.n, 0),
  })).filter((r) => r.level !== "Yoxlanmayıb" || r.n > 0);

  return (
    <>
      {session?.user && <Topbar title={topic.name} back="/statistika" avatar={initials(session.user.name)} />}
      <Page>
        <Link
          href="/statistika"
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
          <StatCard label={t.cards.total} value={fmtInt(shown)} />
          <StatCard label={t.cards.share} value={fmtPct(topic.share)} />
          <StatCard label={t.cards.avg} value={fmtDec(topic.avgPerExam, 1)} />
          <StatCard label={t.cards.match} value={fmtPct(topic.found2025 / topic.total)} />
        </dl>
        {mine && (
          <p className="rounded-lg border border-line bg-white p-4 font-semibold text-ink">
            {az.app.stats.ranking.personal(fmtPct(mine.pct, 0), mine.ok, mine.total)}
          </p>
        )}

        <section aria-labelledby="years" className="grid grid-cols-1 gap-3 rounded-lg border border-line bg-white p-4 lg:p-6">
          <h2 id="years" className={h3Class}>
            {t.years}
          </h2>
          <ChartFrame
            id="years-view"
            summary={t.yearsSummary(years.map((y) => `${y.year} — ${y.n}`).join(", "))}
            chart={<ColumnChart colorful items={years.map((y) => ({ label: String(y.year), value: y.n, text: fmtInt(y.n) }))} />}
            table={
              <DataTable caption={t.yearsCaption} head={[t.colYear, t.colCount]} rows={years.map((y) => [String(y.year), fmtInt(y.n)])} />
            }
          />
        </section>

        <div className="grid grid-cols-1 gap-6 lg:grid-cols-2">
          <section aria-labelledby="kinds" className="grid grid-cols-1 gap-3 rounded-lg border border-line bg-white p-4 lg:p-6">
            <h2 id="kinds" className={h3Class}>
              {t.kinds}
            </h2>
            <ChartFrame
              id="kinds-view"
              summary={t.kindsSummary(fmtInt(burShown), fmtInt(qebShown))}
              chart={
                <BarRows
                  items={[
                    {
                      label: t.kind.buraxilis,
                      value: topic.buraxilis,
                      text: `${fmtInt(burShown)} · ${fmtPct(topic.buraxilis / topic.total)}`,
                    },
                    {
                      label: t.kind.qebul,
                      value: topic.qebul,
                      text: `${fmtInt(qebShown)} · ${fmtPct(topic.qebul / topic.total)}`,
                    },
                  ]}
                />
              }
              table={
                <DataTable
                  caption={t.kindsCaption}
                  head={[t.colKind, t.colCount]}
                  rows={[
                    [t.kind.buraxilis, fmtInt(burShown)],
                    [t.kind.qebul, fmtInt(qebShown)],
                  ]}
                />
              }
            />
          </section>

          <section aria-labelledby="matches" className="grid grid-cols-1 gap-3 rounded-lg border border-line bg-white p-4 lg:p-6">
            <h2 id="matches" className={h3Class}>
              {t.matches}
            </h2>
            <ChartFrame
              id="match-view"
              summary={t.matchesSummaryAll(matchRows.map((r) => `${r.level} — ${fmtPct(r.n / topic.total)}`).join(", "))}
              chart={
                <BarRows
                  items={matchRows.map((r) => ({
                    label: r.level,
                    value: r.n,
                    text: fmtPct(r.n / topic.total),
                    tone: MATCH_TONE[r.level],
                  }))}
                />
              }
              table={
                <DataTable
                  caption={t.matchesCaptionAll}
                  head={[t.colLevel, t.colShare]}
                  rows={matchRows.map((r) => [r.level, fmtPct(r.n / topic.total)])}
                />
              }
            />
          </section>
        </div>

        <section aria-labelledby="refs" className="grid grid-cols-1 gap-3 rounded-lg border border-line bg-white p-4 lg:p-6">
          <div className="flex flex-wrap items-center gap-2">
            <h2 id="refs" className={h3Class}>
              {t.refs}
            </h2>
            <Tag tone="coral">{t.sample}</Tag>
          </div>
          <p className="text-small text-ink-muted">{t.refsNote}</p>
          <div>
            <DataTable
              caption={t.refsCaption}
              head={[t.colExam, t.colNo, t.colToplu]}
              rows={refs.rows.map((r) => {
                const ref = r.ref2025 ? `${r.ref2025} · ${r.match2025}` : r.ref2023 ? `${r.ref2023} · ${r.match2023}` : t.none;
                return [r.exam, String(r.no), ref];
              })}
            />
          </div>
        </section>
      </Page>
    </>
  );
}
