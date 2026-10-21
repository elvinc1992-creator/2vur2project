import type { Metadata } from "next";
import Link from "next/link";
import { AiBadge, FreqChip } from "@/components/ai-badge";
import { Page, Topbar } from "@/components/app/topbar";
import { ArrowIcon } from "@/components/icons";
import { StatCard } from "@/components/stats/charts";
import { ButtonLink } from "@/components/ui/button";
import { Card, h3Class } from "@/components/ui/display";
import { AI_BASIS, aiText } from "@/content/az-ai";
import { aiInsight, getAiIndex } from "@/lib/ai";
import { fmtInt, fmtPct } from "@/lib/format";
import { AiModelViz } from "./ai-model-viz";
import { AiPipeline } from "./ai-pipeline";
import { AiTabs } from "./ai-tabs";

const t = aiText.how;

export const metadata: Metadata = {
  title: t.h1,
  description: t.lead,
};

// Statistika saatda bir yenilənir (getAiIndex — 1 saatlıq cache).
export const revalidate = 3600;

/** "Süni intellekt" səhifəsi: analizin addımları, canlı rəqəmlər, hesablama metodu və nümunə nişan. */
export default async function AiHowPage() {
  const ix = await getAiIndex();
  const ranked = [...ix.types].sort((a, b) => b.shown - a.shown || a.title.localeCompare(b.title, "az"));
  const top = ranked.slice(0, 5);
  const sample = ranked.find((x) => x.site.length > 0)?.site[0]?.code;
  const example = sample ? await aiInsight(sample) : null;
  const topicName = (id: number) => ix.topics.find((x) => x.id === id)?.name ?? "";

  return (
    <>
      <Topbar title={t.title} />
      <Page>
        <div className="grid min-w-0 grid-cols-[minmax(0,1fr)] gap-6">
          <AiTabs current="/suni-intellekt" />

          {/* ---------- Hero ---------- */}
          <section
            aria-labelledby="ai-h1"
            className="relative isolate grid gap-3 overflow-hidden rounded-[24px] bg-[linear-gradient(135deg,#312e81_0%,#6d28d9_55%,#a21caf_100%)] px-5 py-6 text-white shadow-[0_20px_50px_-20px_rgba(99,102,241,.6)] sm:px-8 sm:py-8"
          >
            <span aria-hidden="true" className="absolute -top-24 -right-16 -z-10 size-56 rounded-full bg-white/10" />
            <span className="inline-flex items-center gap-1.5 justify-self-start rounded-pill bg-white/20 px-3 py-1 text-[12.5px] font-semibold backdrop-blur-sm">
              <span aria-hidden="true">🤖</span> {t.badge}
            </span>
            <h1 id="ai-h1" className="m-0 max-w-[30ch] font-display text-[clamp(26px,4vw,38px)] leading-tight font-extrabold tracking-[-0.02em]">
              {t.h1}
            </h1>
            <p className="m-0 max-w-[60ch] text-[16px] leading-[1.55] opacity-95">{t.lead}</p>
          </section>

          {/* ---------- Pipeline ---------- */}
          <section aria-labelledby="ai-pipe" className="grid gap-4">
            <h2 id="ai-pipe" className={h3Class}>
              {t.pipelineTitle}
            </h2>
            <AiPipeline steps={t.steps} />
          </section>

          {/* ---------- Modelin içində: neyron şəbəkə, öyrənmə, qruplaşdırma, cavab ---------- */}
          <section aria-labelledby="ai-model" className="grid gap-4">
            <div className="grid gap-1">
              <h2 id="ai-model" className={h3Class}>
                {t.modelTitle}
              </h2>
              <p className="m-0 max-w-3xl text-ink-muted">{t.modelLead}</p>
            </div>
            <AiModelViz
              mapped={Math.round(ix.questions ? (ix.mapped / ix.questions) * 100 : 0)}
              example={example?.level ? { topic: example.topic, type: example.type, shown: example.shown, level: example.level } : null}
            />
            <p className="m-0 text-[12.5px] text-ink-muted">{t.modelNote}</p>
          </section>

          {/* ---------- Canlı rəqəmlər ---------- */}
          <section aria-labelledby="ai-num" className="grid gap-4">
            <h2 id="ai-num" className={h3Class}>
              {t.numbersTitle}
            </h2>
            <dl className="m-0 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
              <StatCard label={t.numbers.exams} value={AI_BASIS.exams} />
              <StatCard label={t.numbers.questions} value={AI_BASIS.questions} />
              <StatCard label={t.numbers.mapped} value={fmtPct(ix.questions ? ix.mapped / ix.questions : 0)} />
              <StatCard label={t.numbers.types} value={fmtInt(ix.types.length)} />
            </dl>
            <p className="m-0 text-small text-ink-muted">{t.numbersNote}</p>
          </section>

          <div className="grid items-start gap-6 lg:grid-cols-2">
            {/* ---------- Metod ---------- */}
            <Card as="section" aria-labelledby="ai-method" className="grid gap-3">
              <h2 id="ai-method" className={h3Class}>
                {t.methodTitle}
              </h2>
              {t.method.map((m) => (
                <p key={m} className="m-0 text-ink">
                  {m}
                </p>
              ))}
              <ul className="m-0 grid list-none gap-2 p-0">
                {t.levelsText.map((l) => (
                  <li key={l.level} className="flex flex-wrap items-center gap-2 text-small">
                    <FreqChip level={l.level} /> {l.text}
                  </li>
                ))}
              </ul>
              <p className="m-0 rounded-md bg-navy-050 p-3 text-small text-ink-muted">{t.noAnswers}</p>
            </Card>

            {/* ---------- Ən çox düşən tiplər ---------- */}
            <Card as="section" aria-labelledby="ai-top" className="grid gap-3">
              <h2 id="ai-top" className={h3Class}>
                {t.topTitle}
              </h2>
              <ol className="m-0 grid list-none gap-2 p-0">
                {top.map((x, i) => (
                  <li key={x.id}>
                    <Link
                      href={`/suni-intellekt/tipler/${x.id}`}
                      className="grid grid-cols-[auto_minmax(0,1fr)_auto] items-center gap-3 rounded-[12px] border border-line px-3 py-2.5 no-underline hover:border-violet-400 hover:bg-violet-50"
                    >
                      <b className="font-display text-[18px] text-violet-700 tabular">{i + 1}</b>
                      <span className="grid min-w-0">
                        <span className="truncate font-semibold text-navy-900">{x.title}</span>
                        <span className="truncate text-[12.5px] text-ink-muted">{topicName(x.topicId)}</span>
                      </span>
                      <span className="grid justify-items-end gap-0.5">
                        <FreqChip level={x.level} />
                        <span className="text-[12px] text-ink-muted tabular">{aiText.types.shown(x.shown)}</span>
                      </span>
                    </Link>
                  </li>
                ))}
              </ol>
              <ButtonLink href="/suni-intellekt/tipler" variant="secondary" className="justify-self-start">
                {t.topAll}
                <ArrowIcon className="size-5" />
              </ButtonLink>
            </Card>
          </div>

          {/* ---------- Nümunə ---------- */}
          {example && (
            <section aria-labelledby="ai-ex" className="grid gap-3">
              <h2 id="ai-ex" className={h3Class}>
                {t.exampleTitle}
              </h2>
              <div className="max-w-[720px] rounded-lg border border-line bg-white p-4 shadow-card">
                <AiBadge ai={example} open />
              </div>
              <p className="m-0 text-small text-ink-muted">{t.exampleNote}</p>
            </section>
          )}

          <ButtonLink href="/suni-intellekt/menim" variant="primary" className="justify-self-start">
            {t.mine}
            <ArrowIcon className="size-5" />
          </ButtonLink>
        </div>
      </Page>
    </>
  );
}
