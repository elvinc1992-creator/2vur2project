import type { Metadata } from "next";
import Link from "next/link";
import type { ReactNode } from "react";
import { EXAM_TYPE_LOOK, ExamTypeBand } from "@/components/exam-type";
import { AngleDeco, ArrowIcon, BagIcon, CameraIcon, CapIcon, ChartIcon, CheckIcon, ChevronIcon, LockIcon, SendIcon } from "@/components/icons";
import { FooterDark } from "@/components/landing/footer-dark";
import { SampleCard, type SampleQuestion } from "@/components/landing/sample-card";
import { DEFAULT_DURATION } from "@/lib/exams/create";
import type { ExamType } from "@/lib/exams/types";
import { countTheoryBooks, listAllRepetitorTopics } from "@/lib/repetitor/source";
import { SiteHeader } from "@/components/landing/site-header";
import { Welcome } from "@/components/landing/welcome";
import { planInfos, examPricesText } from "@/components/plans-data";
import { LandingPlans } from "@/components/plans-view";
import { MathText } from "@/components/ui/math-text";
import { listExamPairs, type ExamQuestionView } from "@/lib/bank/source";
import { LETTERS } from "@/lib/demo/content";
import { TopicIcon } from "@/components/landing/topic-icon";
import { buttonClass, ButtonLink } from "@/components/ui/button";
import { Card, FormatBar, Tag, eyebrowClass, h1Class, h3Class } from "@/components/ui/display";
import { brand, socialUrl } from "@/config/brand";
import { az } from "@/content/az";
import { cn } from "@/lib/cn";
import { examFormatOf } from "@/lib/exams/blueprint";
import { fmtInt, fmtPct } from "@/lib/format";
import { DEFAULT_FILTERS } from "@/lib/stats/filters";
import { shownCount } from "@/lib/stats/display";
import { getFilterOptions, getOverview, getRanking, type Overview, type RankingRow } from "@/lib/stats/queries";

const t = az.landing;

// Kök səhifədə layout-un title.template işləmir — brend adını özümüz əlavə edirik.
export const metadata: Metadata = {
  title: { absolute: `${brand.name} — ${t.meta.title}` },
  description: t.meta.description,
};

// Rəqəmlər bazadan gəlir; səhifə statikdir və 10 dəqiqədən bir yenilənir.
export const revalidate = 600;

type LandingData = { overview: Overview | null; years: number[]; ranking: RankingRow[] };

/** Nümunə sual — saytın sual bankından (cavab brauzerə getmir). */
async function sampleQuestion(): Promise<SampleQuestion | null> {
  try {
    const topic = (await listAllRepetitorTopics()).find((x) => x.slug === "faiz-nisbet-tenasub");
    const q = topic?.questions.find((x) => !x.imageUrl && x.options);
    return topic && q?.options ? { topic: topic.name, type: q.type, text: q.text, options: q.options, ref: q.ref } : null;
  } catch {
    return null;
  }
}

async function loadData(): Promise<LandingData> {
  try {
    const [overview, options, ranking] = await Promise.all([
      getOverview(DEFAULT_FILTERS),
      getFilterOptions(),
      getRanking(DEFAULT_FILTERS),
    ]);
    // Mövzu sayları statistika səhifəsindəki kimi: 2 qat; 40-dan az — sıra saxlanmaqla 30–39.
    const minN = Math.min(...ranking.map((r) => r.n));
    const shown = ranking.map((r) => ({ ...r, n: shownCount(r.n, minN) }));
    return { overview: overview.questions ? overview : null, years: options.years, ranking: shown };
  } catch (e) {
    // Baza əlçatan deyilsə, səhifə rəqəmsiz bölmələrlə açılır.
    console.error("[landing] statistika yüklənmədi", e);
    return { overview: null, years: [], ranking: [] };
  }
}

/** Repetitorun dərs planı (ilk 4 mövzu) və imtahan qarşılığı nümunəsi — bazadan; xəta olsa bölmə sadə görünür. */
async function tutorAndMatch() {
  try {
    const [topics, pairs, examPrices, books] = await Promise.all([listAllRepetitorTopics(), listExamPairs(), examPricesText(), countTheoryBooks()]);
    const plan = topics.filter((x) => x.questions.length).slice(0, 4).map((x) => ({ slug: x.slug, name: x.name, n: x.questions.length }));
    const usable = pairs.filter((p) => p.counterparts.length && !p.counterparts[0].figureTikz);
    const pair = usable.find((p) => p.matchLevel === "EYNİ") ?? usable[0] ?? null;
    const tutor = { topics: topics.length, books, questions: topics.reduce((s, x) => s + x.questions.length, 0) };
    return { plan, pair, pairs: pairs.length, pairTopics: new Set(pairs.map((p) => p.topicSlug)).size, examPrices, tutor };
  } catch (e) {
    console.error("[landing] repetitor / qarşılıq yüklənmədi", e);
    return { plan: [], pair: null, pairs: 0, pairTopics: 0, examPrices: "", tutor: null };
  }
}

/** Ana səhifədəki sınaq tipləri: imtahan quruluşu (bazadan) və müddət. */
const EXAM_KINDS: Array<{ type: ExamType; key: string }> = [
  { type: "9", key: "buraxilis-9" },
  { type: "11", key: "buraxilis-11" },
  { type: "blok", key: "qebul-11" },
];

async function examKinds() {
  try {
    return await Promise.all(
      EXAM_KINDS.map(async ({ type, key }) => ({ type, label: az.app.store.types[type], format: await examFormatOf(key), min: DEFAULT_DURATION[key] })),
    );
  } catch (e) {
    console.error("[landing] sınaq tipləri yüklənmədi", e);
    return [];
  }
}

export default async function HomePage() {
  const [{ overview, ranking }, kinds, sample, extra] = await Promise.all([loadData(), examKinds(), sampleQuestion(), tutorAndMatch()]);
  const freeHref = extra.plan[0] ? `/onlayn-repetitor/${extra.plan[0].slug}` : "/onlayn-repetitor";
  const topicCount = fmtInt(overview?.topics || ranking.length || 27);
  const telegram = socialUrl(brand.telegramUrl);
  const instagram = socialUrl(brand.instagramUrl);

  return (
    <div className="flex min-h-dvh flex-col">
      <SiteHeader />
      <main id="main" className="flex-1">
        {/* ---------- Hero ---------- */}
        <section aria-labelledby="hero-title" className="relative overflow-hidden bg-notebook pt-8 pb-12 md:pb-[72px] lg:pt-14 lg:pb-[88px]">
          <div className="relative mx-auto grid w-full max-w-content gap-10 px-4 md:px-8 lg:grid-cols-[1.1fr_0.9fr] lg:items-center lg:gap-16">
            <AngleDeco className="absolute -top-4 right-0 hidden text-navy-200 lg:block" />
            <div className="relative grid gap-5">
              <Welcome />
              <Tag tone="coral" icon={<ChartIcon />} className="justify-self-start">
                {t.hero.eyebrow}
              </Tag>
              <h1 id="hero-title" className="font-display text-display font-extrabold text-navy-900 lg:text-display-lg">
                {t.hero.titleA} <span className="text-coral-600">{t.hero.titleB}</span>
              </h1>
              <p className="max-w-[34rem] text-lead text-ink-muted">{t.hero.lead}</p>
              <div className="grid gap-3 md:flex md:flex-wrap">
                {telegram ? (
                  <a href={telegram} target="_blank" rel="noopener noreferrer" className={buttonClass({ variant: "primary" })}>
                    <SendIcon />
                    {t.hero.telegram}
                  </a>
                ) : (
                  <ButtonLink href="/statistika" variant="primary">
                    <ChartIcon />
                    {t.hero.stats}
                  </ButtonLink>
                )}
                <a href="#numune" className={buttonClass({ variant: "secondary" })}>
                  {t.hero.sample}
                </a>
              </div>
              <p className="text-small text-ink-muted">{t.hero.note}</p>
            </div>
            {ranking.length > 0 && overview && <RankPreview rows={ranking} />}
          </div>
        </section>

        {/* ---------- İki əsas bölmə: repetitor və sınaqlar ---------- */}
        <section id="mehsullar" aria-labelledby="products-title" className="scroll-mt-16 bg-notebook pb-12 md:pb-[72px]">
          <div className="mx-auto grid w-full max-w-content gap-4 px-4 md:px-8">
            <h2 id="products-title" className={eyebrowClass}>
              {t.products.title}
            </h2>
            <div className="grid gap-4 md:grid-cols-2">
              <ProductCard
                tone="tutor"
                icon={<CapIcon className="size-7" />}
                tag={t.products.tutor.tag}
                title={t.products.tutor.title}
                text={t.products.tutor.text}
                href={freeHref}
                cta={t.products.tutor.cta}
              >
                {extra.tutor && (
                  <dl className="m-0 grid grid-cols-3 gap-2">
                    {[
                      [extra.tutor.topics, t.products.tutor.topics],
                      [extra.tutor.books, t.products.tutor.books],
                      [`${Math.floor(extra.tutor.questions / 100) * 100}+`, t.products.tutor.questions],
                    ].map(([n, label]) => (
                      <div key={label} className="grid content-start rounded-[14px] bg-white/12 px-3 py-2.5 ring-1 ring-white/20">
                        <dt className="order-2 text-[12.5px] leading-4 text-white/85">{label}</dt>
                        <dd className="order-1 m-0 font-display text-[26px] leading-8 font-extrabold tabular">{n}</dd>
                      </div>
                    ))}
                  </dl>
                )}
              </ProductCard>
              <ProductCard
                tone="exams"
                icon={<BagIcon className="size-7" />}
                tag={t.products.exams.tag}
                title={t.products.exams.title}
                text={t.products.exams.text}
                href="/sinaqlar"
                cta={t.products.exams.cta}
              >
                <ul className="m-0 grid list-none gap-2 p-0">
                  {kinds.map((k) => (
                    <li key={k.type} className="flex items-center gap-3 rounded-[14px] bg-white/12 px-3 py-2 ring-1 ring-white/20">
                      <span
                        aria-hidden="true"
                        className={cn(
                          "grid size-8 flex-none place-items-center rounded-[9px] bg-linear-to-br font-display text-[13px] font-extrabold ring-1 ring-white/30",
                          EXAM_TYPE_LOOK[k.type].band,
                        )}
                      >
                        {EXAM_TYPE_LOOK[k.type].mark}
                      </span>
                      <span className="min-w-0 flex-1 font-semibold">{k.label}</span>
                      <span className="text-[13px] whitespace-nowrap text-white/85 tabular">
                        {t.exams.typeMeta(k.format.closed + k.format.coded + k.format.written, k.min)}
                      </span>
                    </li>
                  ))}
                </ul>
              </ProductCard>
            </div>
          </div>
        </section>

        {/* ---------- Rəqəmlər ---------- */}
        {overview && (
          <Section tone="tint" labelledBy="stats-title">
            <Head eyebrow={t.stats.eyebrow} title={t.stats.title} id="stats-title" />
            <dl className="m-0 grid grid-cols-2 gap-3 md:gap-4 lg:grid-cols-4">
              <Stat value="30000+" label={t.stats.questions} />
              <Stat value="100+" label={t.stats.years("2016–2026")} />
              <Stat value={fmtInt(overview.topics)} label={t.stats.topics} />
              <Stat value={fmtPct(overview.found2025 / overview.questions)} label={t.stats.found} />
            </dl>
          </Section>
        )}

        {/* ---------- Necə işləyir ---------- */}
        <Section id="nece-isleyir" labelledBy="how-title">
          <Head eyebrow={t.how.eyebrow} title={t.how.title} id="how-title" />
          <ol className="m-0 grid list-none gap-4 p-0 md:grid-cols-3">
            {t.how.steps.map((s, i) => (
              <li key={s.title}>
                <Card tone="flat" className="grid h-full grid-cols-[48px_1fr] items-start gap-4">
                  <span
                    aria-hidden="true"
                    className="grid size-12 place-items-center rounded-md bg-navy-900 font-display text-xl font-extrabold text-white"
                  >
                    {i + 1}
                  </span>
                  <div className="grid gap-1">
                    <h3 className="font-display text-lg leading-6 font-bold text-navy-900">
                      <span className="sr-only">{i + 1}. </span>
                      {s.title}
                    </h3>
                    <p className="text-ink-muted">{s.text(topicCount)}</p>
                  </div>
                </Card>
              </li>
            ))}
          </ol>
        </Section>

        {/* ---------- Nümunə kart ---------- */}
        <Section id="numune" tone="tint" labelledBy="sample-title">
          <div className="grid gap-8 lg:grid-cols-2 lg:items-center lg:gap-16">
            <div className="grid gap-3">
              <span className={eyebrowClass}>{t.card.eyebrow}</span>
              <h2 id="sample-title" className={h1Class}>
                {t.card.title}
              </h2>
              <p className="text-lead text-ink-muted">{t.card.lead}</p>
              <FeatureList items={t.card.features} className="mt-2" />
            </div>
            <SampleCard id="numune-kart" q={sample} />
          </div>
        </Section>

        {/* ---------- Mövzular ---------- */}
        {ranking.length > 0 && (
          <Section id="movzular" labelledBy="topics-title" className="bg-notebook">
            <Head eyebrow={t.topics.eyebrow} title={t.topics.title(topicCount)} id="topics-title">
              <p className="text-ink-muted">{t.topics.lead}</p>
            </Head>
            <ul className="m-0 grid list-none grid-cols-2 gap-3 p-0 md:gap-4 lg:grid-cols-4">
              {ranking.slice(0, 8).map((r) => (
                <li key={r.slug}>
                  <TopicTile row={r} max={ranking[0].n} />
                </li>
              ))}
            </ul>
            <ButtonLink href="/statistika" variant="secondary" block className="mt-5 md:w-auto">
              {t.topics.all(topicCount)}
              <ArrowIcon />
            </ButtonLink>
          </Section>
        )}

        {/* ---------- Onlayn repetitor ---------- */}
        <Section id="repetitor" labelledBy="tutor-title" className="bg-linear-to-br from-violet-50 via-bg to-indigo-50">
          <div className="grid gap-8 lg:grid-cols-2 lg:items-center lg:gap-16">
            <div className="grid gap-4">
              <span className={cn(eyebrowClass, "text-violet-800!")}>{t.tutor.eyebrow}</span>
              <h2 id="tutor-title" className={h1Class}>
                {t.tutor.title}
              </h2>
              <p className="text-lead text-ink-muted">{t.tutor.lead}</p>
              <div className="flex items-center gap-4 rounded-lg border border-violet-200 bg-white p-4 shadow-card">
                <MiniBook />
                <div className="grid gap-1">
                  <p className="m-0 leading-[22px] font-bold text-navy-900">
                    <b className="mr-2 inline-block rounded-pill bg-coral-600 px-2 py-0.5 align-[2px] text-[11px] leading-4 tracking-[0.04em] text-white uppercase">
                      {t.tutor.bookTag}
                    </b>
                    {t.tutor.bookTitle}
                  </p>
                  <p className="m-0 text-small text-ink-muted">{t.tutor.bookText}</p>
                </div>
              </div>
              <FeatureList items={t.tutor.features} />
              <div className="grid gap-3 md:flex md:flex-wrap">
                <ButtonLink href={freeHref} variant="primary">
                  {t.tutor.ctaFree}
                  <ArrowIcon className="size-[22px]" />
                </ButtonLink>
                <ButtonLink href="/onlayn-repetitor" variant="secondary">
                  {t.tutor.ctaMore}
                </ButtonLink>
              </div>
            </div>
            {extra.plan.length > 0 && (
              <Card className="grid gap-3">
                <h3 className={h3Class}>{t.tutor.planTitle}</h3>
                <ol className="m-0 grid list-none gap-2 p-0">
                  {extra.plan.map((x, i) => (
                    <li
                      key={x.slug}
                      className={cn(
                        "flex items-center gap-3 rounded-lg border px-3 py-2.5",
                        i === 0 ? "border-success-700/40 bg-success-100" : "border-line bg-navy-050",
                      )}
                    >
                      <span
                        aria-hidden="true"
                        className={cn(
                          "grid size-9 flex-none place-items-center rounded-full font-bold tabular",
                          i === 0 ? "bg-success-700 text-white" : "bg-white text-ink-muted",
                        )}
                      >
                        {i === 0 ? i + 1 : <LockIcon className="size-4" />}
                      </span>
                      <span className="min-w-0 flex-1">
                        <span className="block font-semibold text-navy-900">{x.name}</span>
                        <span className="text-small text-ink-muted">
                          {t.tutor.questions(x.n)} · {i === 0 ? t.tutor.free : t.tutor.locked}
                        </span>
                      </span>
                    </li>
                  ))}
                  <li className="rounded-lg border-2 border-dashed border-coral-500 bg-coral-100/40 px-3 py-2.5 text-small font-semibold text-navy-900">
                    ★ {t.tutor.exam}
                  </li>
                </ol>
              </Card>
            )}
          </div>
        </Section>

        {/* ---------- Sınaqlar ---------- */}
        <section id="sinaqlar" aria-labelledby="exams-title" className="scroll-mt-16 overflow-hidden bg-navy-900 py-12 text-white md:py-[72px] lg:py-[88px]">
          <div className="mx-auto grid w-full max-w-content gap-8 px-4 md:px-8 lg:grid-cols-2 lg:items-center lg:gap-16">
            <div className="grid gap-3">
              <span className={cn(eyebrowClass, "text-coral-500!")}>{t.exams.eyebrow}</span>
              <h2 id="exams-title" className="font-display text-h2 font-extrabold text-white lg:text-h2-lg">
                {t.exams.title}
              </h2>
              <p className="text-lead text-on-navy-muted">{t.exams.lead}</p>
              <FeatureList items={t.exams.features} className="text-white" iconClassName="text-coral-500" />
              <div className="mt-3 grid md:flex">
                <ButtonLink href="/sinaqlar" variant="primary">
                  {t.exams.cta}
                </ButtonLink>
              </div>
            </div>
            {kinds.length > 0 && (
              <div className="grid gap-3">
                <h3 className="font-display text-lg font-bold text-white">{t.exams.typesTitle}</h3>
                <ul className="m-0 grid list-none gap-3 p-0">
                  {kinds.map((k) => {
                    const total = k.format.closed + k.format.coded + k.format.written;
                    return (
                      <li key={k.type}>
                        <Card className={cn("grid gap-3 text-ink transition-colors", EXAM_TYPE_LOOK[k.type].edge)}>
                          <ExamTypeBand type={k.type} label={k.label} />
                          <FormatBar {...k.format} label={t.exams.formatLabel(k.format.closed, k.format.coded, k.format.written)} />
                          <div className="flex flex-wrap items-center justify-between gap-x-4 gap-y-2">
                            <span className="text-small text-ink-muted">
                              <b className="text-navy-900 tabular">{t.exams.typeMeta(total, k.min)}</b> ·{" "}
                              {t.exams.formatLabel(k.format.closed, k.format.coded, k.format.written)}
                            </span>
                            <Link
                              href={`/sinaqlar?tip=${k.type}`}
                              className={cn(
                                "inline-flex items-center gap-1 text-small font-bold underline underline-offset-3 after:absolute after:inset-0 after:rounded-lg after:content-['']",
                                EXAM_TYPE_LOOK[k.type].ink,
                              )}
                            >
                              {t.exams.typeOpen}
                              <span className="sr-only">: {k.label}</span>
                              <ArrowIcon className="size-4" />
                            </Link>
                          </div>
                        </Card>
                      </li>
                    );
                  })}
                </ul>
                <ul className="m-0 flex list-none flex-wrap gap-x-5 gap-y-1 p-0 text-small text-on-navy-muted" aria-hidden="true">
                  <Legend color="bg-navy-900 ring-1 ring-white/80" label={t.exams.closed} />
                  <Legend color="bg-coral-600" label={t.exams.coded} />
                  <Legend color="bg-navy-200" label={t.exams.written} />
                </ul>
              </div>
            )}
          </div>
        </section>

        {/* ---------- İmtahan qarşılığı ---------- */}
        {extra.pair && (
          <Section id="imtahan-qarsiligi" tone="tint" labelledBy="match-title">
            <Head eyebrow={t.match.eyebrow} title={t.match.title} id="match-title">
              <p className="max-w-[44rem] text-ink-muted">{t.match.lead}</p>
            </Head>
            <div className="grid gap-4 lg:grid-cols-2">
              <MatchCard
                label={t.match.examLabel}
                meta={t.match.exam(extra.pair.year, extra.pair.exam, extra.pair.questionNo)}
                q={extra.pair.examQuestion}
                tone="exam"
              />
              <MatchCard label={t.match.oursLabel} meta={`${extra.pair.topicName} · ${extra.pair.type}`} q={extra.pair.counterparts[0]} tone="ours" />
            </div>
            <div className="flex flex-wrap items-center gap-x-5 gap-y-3">
              <ButtonLink href="/imtahan-qarsiligi" variant="primary">
                {t.match.cta}
                <ArrowIcon className="size-[22px]" />
              </ButtonLink>
              <span className="text-small text-ink-muted">{t.match.stat(extra.pairs, extra.pairTopics)}</span>
            </div>
          </Section>
        )}

        {/* ---------- Qiymətlər ---------- */}
        <Section id="qiymetler" labelledBy="pricing-title">
          <Head eyebrow={t.pricing.eyebrow} title={t.pricing.title} id="pricing-title">
            <p className="max-w-[40rem] text-ink-muted">{t.pricing.lead}</p>
          </Head>
          {/* Abunəliklər səhifəsindəki kartlarla eyni dizayn */}
          <LandingPlans plans={planInfos()} />
          {extra.examPrices && <p className="text-small text-ink-muted">{t.pricing.examPrices(extra.examPrices)}</p>}
        </Section>

        {/* ---------- FAQ ---------- */}
        <Section labelledBy="faq-title">
          <div className="grid gap-6 lg:grid-cols-[0.8fr_1.2fr] lg:gap-16">
            <Head eyebrow={t.faq.eyebrow} title={t.faq.title} id="faq-title" />
            <div className="grid content-start gap-2">
              {t.faq.items.map((f, i) => (
                <details key={f.q} open={i === 0} className="group rounded-md border border-line bg-surface">
                  <summary className="flex min-h-14 cursor-pointer list-none items-center justify-between gap-3 rounded-md px-4 py-3.5 font-display leading-[22px] font-bold text-navy-900 [&::-webkit-details-marker]:hidden">
                    {f.q}
                    <span aria-hidden="true" className="flex-none font-sans text-2xl leading-none text-coral-600">
                      <span className="group-open:hidden">+</span>
                      <span className="hidden group-open:inline">−</span>
                    </span>
                  </summary>
                  <p className="px-4 pb-4 text-ink-muted">{f.a}</p>
                </details>
              ))}
            </div>
          </div>
        </Section>

        {/* ---------- Sosial CTA ---------- */}
        <section aria-labelledby="cta-title" className="bg-notebook pb-12 md:pb-[72px] lg:pb-[88px]">
          <div className="mx-auto w-full max-w-content px-4 md:px-8">
            <Card className="grid gap-5 overflow-hidden rounded-xl! px-5! py-7! md:px-10! md:py-10! lg:grid-cols-[1.2fr_1fr] lg:items-center lg:gap-10">
              <div className="grid gap-2">
                <h2 id="cta-title" className={h1Class}>
                  {t.cta.title}
                </h2>
                <p className="text-ink-muted">{telegram || instagram ? t.cta.text : t.cta.altText}</p>
              </div>
              <div className="grid gap-3 md:flex md:flex-wrap lg:justify-end">
                {telegram || instagram ? (
                  <>
                    {telegram && (
                      <a href={telegram} target="_blank" rel="noopener noreferrer" className={buttonClass({ variant: "primary" })}>
                        <SendIcon />
                        {t.cta.telegram}
                      </a>
                    )}
                    {instagram && (
                      <a href={instagram} target="_blank" rel="noopener noreferrer" className={buttonClass({ variant: "secondary" })}>
                        <CameraIcon />
                        {t.cta.instagram}
                      </a>
                    )}
                  </>
                ) : (
                  <>
                    <ButtonLink href="/qeydiyyat" variant="primary">
                      {t.cta.signup}
                    </ButtonLink>
                    <ButtonLink href="/statistika" variant="secondary">
                      {t.cta.stats}
                    </ButtonLink>
                  </>
                )}
              </div>
            </Card>
          </div>
        </section>
      </main>
      <FooterDark />
    </div>
  );
}

/* ---------- Bölmə köməkçiləri ---------- */

function Section({
  id,
  tone,
  labelledBy,
  className,
  children,
}: {
  id?: string;
  tone?: "tint";
  labelledBy: string;
  className?: string;
  children: ReactNode;
}) {
  return (
    <section
      id={id}
      aria-labelledby={labelledBy}
      className={cn("scroll-mt-16 py-12 md:py-[72px] lg:py-[88px]", tone === "tint" && "bg-navy-050", className)}
    >
      <div className="mx-auto w-full max-w-content px-4 md:px-8">{children}</div>
    </section>
  );
}

function Head({ eyebrow, title, id, children }: { eyebrow: string; title: string; id: string; children?: ReactNode }) {
  return (
    <div className="mb-6 grid content-start gap-2">
      <span className={eyebrowClass}>{eyebrow}</span>
      <h2 id={id} className={h1Class}>
        {title}
      </h2>
      {children}
    </div>
  );
}

function Stat({ value, label }: { value: string; label: string }) {
  // "94,7%" → faiz işarəsi kiçik və coral (dizayn: .b-stat__n small)
  const pct = value.endsWith("%");
  return (
    <div className="grid content-start gap-1 rounded-lg border border-line bg-surface p-5 lg:p-7">
      <dt className="order-2 text-[15px] leading-[22px] text-ink-muted">{label}</dt>
      <dd className="order-1 m-0 font-display text-[40px] leading-[48px] font-extrabold tracking-[-0.02em] whitespace-nowrap text-navy-900 tabular md:text-[44px] lg:text-[56px] lg:leading-[60px]">
        {pct ? value.slice(0, -1) : value}
        {pct && <small className="ml-0.5 text-[26px] text-coral-600">%</small>}
      </dd>
    </div>
  );
}

function FeatureList({ items, className, iconClassName = "text-success-700" }: { items: readonly string[]; className?: string; iconClassName?: string }) {
  return (
    <ul className={cn("m-0 grid list-none gap-2.5 p-0", className)}>
      {items.map((f) => (
        <li key={f} className="flex items-start gap-2.5 text-[15px] leading-[22px]">
          <CheckIcon className={cn("mt-px size-5 flex-none", iconClassName)} />
          {f}
        </li>
      ))}
    </ul>
  );
}

function Legend({ color, label }: { color: string; label: string }) {
  return (
    <li className="flex items-center gap-2">
      <i className={cn("size-3 flex-none rounded-[4px]", color)} />
      {label}
    </li>
  );
}

/**
 * Hero-dan sonrakı iri kart (repetitor / sınaqlar). Bütün kart kliklənir: düymə-link kartı örtür,
 * ekran oxuyucusunda isə bir link qalır. Repetitor — nəzəriyyə kitabının üz qabığının rəngləri, sınaqlar — mərcan.
 */
function ProductCard({
  tone,
  icon,
  tag,
  title,
  text,
  href,
  cta,
  children,
}: {
  tone: "tutor" | "exams";
  icon: ReactNode;
  tag: string;
  title: string;
  text: string;
  href: string;
  cta: string;
  children?: ReactNode;
}) {
  return (
    <article
      aria-label={title}
      className={cn(
        "group relative grid content-start gap-5 overflow-hidden rounded-xl p-5 text-white shadow-raised transition-transform hover:-translate-y-0.5 md:p-7",
        tone === "tutor" ? "bg-linear-to-br from-[#312e81] via-[#4c1d95] to-[#831843]" : "bg-linear-to-br from-coral-600 via-coral-700 to-[#6e2412]",
      )}
    >
      <span aria-hidden="true" className="pointer-events-none absolute -right-4 -bottom-14 font-display text-[200px] leading-none font-extrabold text-white/8 select-none">
        {tone === "tutor" ? "∫" : "A–E"}
      </span>
      <div className="relative flex flex-wrap items-center gap-3">
        <span className="grid size-12 place-items-center rounded-[14px] bg-white/15 ring-1 ring-white/25">{icon}</span>
        <span className="rounded-pill bg-white px-2.5 py-1 text-[12px] font-bold tracking-[0.04em] text-navy-900 uppercase">{tag}</span>
      </div>
      <div className="relative grid gap-2">
        <h3 className="font-display text-h2 font-extrabold text-white lg:text-h2-lg">{title}</h3>
        <p className="m-0 text-white/90">{text}</p>
      </div>
      <div className="relative">{children}</div>
      <Link
        href={href}
        className="inline-flex min-h-12 items-center gap-2 justify-self-start rounded-md bg-white px-5 font-bold text-navy-900 no-underline shadow-card transition-colors group-hover:bg-coral-100 after:absolute after:inset-0 after:rounded-xl after:content-['']"
      >
        {cta}
        <ArrowIcon className="size-5" />
      </Link>
    </article>
  );
}

/** Kiçik kitab: sol — üz qabığı (kitabın rəngləri), sağ — sətirli səhifə. Dekorativdir. */
function MiniBook() {
  return (
    <span aria-hidden="true" className="flex h-[64px] w-[84px] flex-none overflow-hidden rounded-[8px] shadow-[0_8px_18px_-10px_rgba(49,46,129,.8)] ring-1 ring-violet-200">
      <span className="grid flex-1 place-items-center bg-linear-to-br from-[#312e81] via-[#4c1d95] to-[#831843] font-display text-[22px] font-extrabold text-white/90">∑</span>
      <span className="grid flex-1 content-center gap-[5px] bg-[#fffdf8] px-2">
        <i className="h-[3px] rounded-pill bg-violet-300" />
        <i className="h-[3px] w-4/5 rounded-pill bg-navy-200" />
        <i className="h-[3px] rounded-pill bg-navy-200" />
        <i className="h-[3px] w-3/5 rounded-pill bg-navy-200" />
      </span>
    </span>
  );
}

// Uzun mövzu adlarında "/" sonrası sətir keçidinə icazə (dar mobil kartlar üçün).
const breakable = (name: string) => name.replaceAll("/", "/​");

/** Hero-dakı canlı reytinq: ən çox sual çıxan 5 mövzu. */
function RankPreview({ rows }: { rows: RankingRow[] }) {
  const top = rows.slice(0, 5);
  const max = top[0]?.n || 1;
  return (
    <Card as="article" aria-labelledby="rank-title" className="relative grid gap-4 shadow-raised!">
      <div className="grid gap-1">
        <span className="inline-flex items-center gap-2 text-caption font-bold tracking-[0.06em] text-success-700 uppercase">
          <i aria-hidden="true" className="size-2 rounded-full bg-success-700" />
          {t.hero.rankEyebrow}
        </span>
        <h2 id="rank-title" className={h3Class}>
          {t.hero.rankTitle}
        </h2>
        <p className="text-small text-ink-muted">{t.hero.rankNote("30000+", "2016–2026")}</p>
      </div>
      <ol className="m-0 grid list-none gap-1 p-0">
        {top.map((r, i) => (
          <li key={r.slug}>
            <Link
              href={`/statistika/${r.slug}`}
              className="-mx-2 grid grid-cols-[28px_minmax(0,1fr)_auto] items-center gap-x-3 gap-y-1.5 rounded-md px-2 py-2 text-inherit no-underline hover:bg-navy-050"
            >
              <span
                className={cn(
                  "grid size-7 place-items-center rounded-[8px] font-display text-small font-extrabold tabular",
                  i === 0 ? "bg-coral-100 text-coral-700" : "bg-navy-100 text-navy-900",
                )}
              >
                {i + 1}
              </span>
              <span className="font-semibold [overflow-wrap:anywhere] text-navy-900">{breakable(r.name)}</span>
              <span className="text-right font-display font-extrabold text-navy-900 tabular">
                {r.n}
                <span className="sr-only"> sual, {fmtPct(r.share)}</span>
              </span>
              <span aria-hidden="true" className="col-span-2 col-start-2 h-1.5 overflow-hidden rounded-pill bg-navy-100">
                <i
                  className={cn("block h-full rounded-pill", i === 0 ? "bg-coral-600" : "bg-navy-900")}
                  style={{ width: `${(r.n / max) * 100}%` }}
                />
              </span>
            </Link>
          </li>
        ))}
      </ol>
      <Link href="/statistika" className="inline-flex items-center gap-1.5 justify-self-start font-semibold text-navy-500 underline underline-offset-3">
        {t.hero.rankLink}
        <ArrowIcon className="size-[18px]" />
      </Link>
    </Card>
  );
}

function TopicTile({ row, max }: { row: RankingRow; max: number }) {
  return (
    <Link
      href={`/statistika/${row.slug}`}
      className="grid h-full min-h-[132px] content-between gap-3 rounded-lg border border-line bg-surface p-4 text-inherit no-underline transition-colors hover:border-navy-900"
    >
      <span className="flex items-center justify-between">
        <span className="grid size-10 place-items-center rounded-[12px] bg-navy-100 text-navy-900">
          <TopicIcon name={row.name} className="size-[22px]" />
        </span>
        <ChevronIcon className="size-5 text-ink-muted" />
      </span>
      <span className="grid gap-0.5">
        <span className="font-display leading-[22px] font-bold [overflow-wrap:anywhere] text-navy-900">{breakable(row.name)}</span>
        <span className="text-small text-ink-muted">
          <b className="text-navy-900 tabular">{row.n}</b> {t.topics.count}
        </span>
      </span>
      <span aria-hidden="true" className="h-1.5 overflow-hidden rounded-pill bg-navy-100">
        <i className="block h-full rounded-pill bg-navy-900" style={{ width: `${(row.n / max) * 100}%` }} />
      </span>
    </Link>
  );
}

/** İmtahan sualı və ya bizim qarşılığı — variantlarla (cavab göstərilmir). */
function MatchCard({ label, meta, q, tone }: { label: string; meta: string; q: ExamQuestionView; tone: "exam" | "ours" }) {
  return (
    <Card as="article" aria-label={label} className={cn("grid content-start gap-3 border-t-4", tone === "exam" ? "border-t-navy-900" : "border-t-coral-600")}>
      <div className="flex flex-wrap items-center gap-2">
        <Tag tone={tone === "exam" ? "solid" : "coral"}>{label}</Tag>
        <span className="text-small text-ink-muted">{meta}</span>
      </div>
      <p className="m-0 text-[16px] leading-[1.6] text-ink">
        <MathText text={q.question} />
      </p>
      <ul className="m-0 grid list-none gap-1.5 p-0 sm:grid-cols-2">
        {LETTERS.map((l) => (
          <li key={l} className="flex items-baseline gap-2 rounded-md border border-line bg-white px-3 py-2 text-[15px]">
            <b className="text-navy-900">{l})</b>
            <MathText text={q.options[l]} />
          </li>
        ))}
      </ul>
    </Card>
  );
}
