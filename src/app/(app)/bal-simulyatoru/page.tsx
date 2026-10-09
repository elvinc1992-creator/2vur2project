import type { Metadata } from "next";
import { Page, Topbar } from "@/components/app/topbar";
import { Card, Meter, Placeholder, h1Class, h3Class } from "@/components/ui/display";
import { az } from "@/content/az";
import { requireDemo } from "@/lib/demo/session";
import { fmtDec, fmtInt } from "@/lib/format";
import { EXAM_QUESTION_COUNT, MIN_QUESTIONS, MIN_TOPICS, scoreEstimate } from "@/lib/score/estimate";
import { getScoreStats } from "@/lib/score/estimate-db";

export const metadata: Metadata = { title: az.app.score.title };

/** DİM bal simulyatoru: bütün cavablara görə təxmin (ən azı 4 fərqli mövzudan 20 sual). */
export default async function ScoreSimulatorPage() {
  const { state } = await requireDemo("/bal-simulyatoru");
  const t = az.app.score;
  const s = scoreEstimate(await getScoreStats(state.uid));
  const pctNum = fmtDec(s.pct, Number.isInteger(s.pct) ? 0 : 1);
  const pctText = `${pctNum}%`;
  const estimates = [
    { label: t.estimateBuraxilis, n: EXAM_QUESTION_COUNT.buraxilis, value: s.buraxilis },
    { label: t.estimateBlok, n: EXAM_QUESTION_COUNT.blok, value: s.blok },
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
          <dl className="m-0 grid grid-cols-2 gap-3 lg:grid-cols-4">
            {[
              { label: t.weekSolved, value: fmtInt(s.total) },
              { label: t.weekCorrect, value: fmtInt(s.correct) },
              { label: t.weekPct, value: pctText },
              { label: t.weekTopics, value: fmtInt(s.topics) },
            ].map((x) => (
              <Card key={x.label} className="grid gap-1 p-4!">
                <dt className="order-2 text-small text-ink-muted">{x.label}</dt>
                <dd className="m-0 font-display text-[32px] leading-[38px] font-extrabold text-navy-900 tabular">{x.value}</dd>
              </Card>
            ))}
          </dl>

          {!s.ready ? (
            <Card tone="tint" className="grid gap-3">
              <p className="m-0 font-semibold text-navy-900">{t.notReadyTitle}</p>
              <p className="m-0 text-ink-muted">{t.notReadyText(MIN_QUESTIONS, MIN_TOPICS)}</p>
              <div className="grid gap-3 sm:grid-cols-2">
                <div className="grid gap-1.5">
                  <span className="text-small font-semibold tabular">{t.progressQuestions(s.total, MIN_QUESTIONS)}</span>
                  <Meter value={Math.min(100, Math.round((s.total / MIN_QUESTIONS) * 100))} label={t.weekSolved} tone="navy" />
                </div>
                <div className="grid gap-1.5">
                  <span className="text-small font-semibold tabular">{t.progressTopics(s.topics, MIN_TOPICS)}</span>
                  <Meter value={Math.min(100, Math.round((s.topics / MIN_TOPICS) * 100))} label={t.weekTopics} tone="navy" />
                </div>
              </div>
            </Card>
          ) : (
            <>
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
