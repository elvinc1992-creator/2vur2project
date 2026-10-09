import type { Metadata } from "next";
import { Page, Topbar } from "@/components/app/topbar";
import { Card, Meter, Placeholder, h1Class, h3Class } from "@/components/ui/display";
import { az } from "@/content/az";
import { requireDemo } from "@/lib/demo/session";
import { fmtDec, fmtInt } from "@/lib/format";
import { EXAM_QUESTION_COUNT, weeklyEstimate } from "@/lib/score/weekly";
import { getWeeklyStats } from "@/lib/score/weekly-db";

export const metadata: Metadata = { title: az.app.score.title };

/** DİM bal simulyatoru: son 7 günün cavablarına görə təxmin + əl ilə hesablama. */
export default async function ScoreSimulatorPage() {
  const { state } = await requireDemo("/bal-simulyatoru");
  const t = az.app.score;
  const week = weeklyEstimate(await getWeeklyStats(state.uid));
  const pctNum = fmtDec(week.pct, Number.isInteger(week.pct) ? 0 : 1);
  const pctText = `${pctNum}%`;
  const estimates = [
    { label: t.estimateBuraxilis, n: EXAM_QUESTION_COUNT.buraxilis, value: week.buraxilis },
    { label: t.estimateBlok, n: EXAM_QUESTION_COUNT.blok, value: week.blok },
  ];

  return (
    <>
      <Topbar title={t.title} back="/panel" />
      <Page>
        <div className="grid gap-2">
          <h1 className={h1Class}>{t.title}</h1>
          <p className="max-w-[46rem] text-ink-muted">{t.lead}</p>
        </div>

        <section aria-labelledby="score-week" className="grid gap-3">
          <h2 id="score-week" className={h3Class}>
            {t.weekTitle}
          </h2>
          {week.total === 0 ? (
            <Card tone="tint">
              <p className="text-ink-muted">{t.weekEmpty}</p>
            </Card>
          ) : (
            <>
              <dl className="m-0 grid grid-cols-1 gap-3 sm:grid-cols-3">
                {[
                  { label: t.weekSolved, value: fmtInt(week.total) },
                  { label: t.weekCorrect, value: fmtInt(week.correct) },
                  { label: t.weekPct, value: pctText },
                ].map((s) => (
                  <Card key={s.label} className="grid gap-1 p-4!">
                    <dt className="order-2 text-small text-ink-muted">{s.label}</dt>
                    <dd className="m-0 font-display text-[32px] leading-[38px] font-extrabold text-navy-900 tabular">{s.value}</dd>
                  </Card>
                ))}
              </dl>
              <h3 className={h3Class}>{t.estimateTitle}</h3>
              <div className="grid gap-3 md:grid-cols-2">
                {estimates.map((e) => (
                  <Card key={e.label} tone="navy" className="grid gap-3">
                    <span className="text-caption font-bold tracking-[0.06em] text-on-navy-muted uppercase">{e.label}</span>
                    <p className="m-0">
                      <span className="font-display text-[56px] leading-[60px] font-extrabold text-white tabular">{e.value}</span>
                      <span className="ml-1 text-lead text-on-navy-muted tabular">{t.estimateOf(e.n)}</span>
                    </p>
                    <Meter value={Math.round((e.value / e.n) * 100)} label={e.label} tone="coral" />
                    <p className="text-small text-on-navy-muted tabular">{t.estimateFormula(e.n, pctNum, e.value)}</p>
                  </Card>
                ))}
              </div>
            </>
          )}
        </section>

        <section aria-labelledby="score-info" className="grid gap-3">
          <h2 id="score-info" className={h3Class}>
            {t.infoTitle}
          </h2>
          <Placeholder className="min-h-[140px] justify-items-start text-left">{t.infoPlaceholder}</Placeholder>
        </section>
      </Page>
    </>
  );
}
