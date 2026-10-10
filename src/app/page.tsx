import type { Metadata } from "next";
import Link from "next/link";
import type { ReactNode } from "react";
import { AngleDeco, ArrowIcon, CameraIcon, ChartIcon, CheckIcon, ChevronIcon, CloseIcon, SendIcon } from "@/components/icons";
import { FooterDark } from "@/components/landing/footer-dark";
import { SampleCard } from "@/components/landing/sample-card";
import { SiteHeader } from "@/components/landing/site-header";
import { TopicIcon } from "@/components/landing/topic-icon";
import { buttonClass, ButtonLink } from "@/components/ui/button";
import { Card, FormatBar, Placeholder, Tag, eyebrowClass, h1Class, h3Class } from "@/components/ui/display";
import { brand, socialUrl } from "@/config/brand";
import { az } from "@/content/az";
import { cn } from "@/lib/cn";
import { EXAM_FORMAT } from "@/lib/demo/content";
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

export default async function HomePage() {
  const { overview, ranking } = await loadData();
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
            <SampleCard id="numune-kart" />
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

        {/* ---------- Sınaqlar ---------- */}
        <section id="sinaqlar" aria-labelledby="exams-title" className="scroll-mt-16 overflow-hidden bg-navy-900 py-12 text-white md:py-[72px] lg:py-[88px]">
          <div className="mx-auto grid w-full max-w-content gap-8 px-4 md:px-8 lg:grid-cols-2 lg:items-center lg:gap-16">
            <div className="grid gap-3">
              <span className={cn(eyebrowClass, "text-coral-500!")}>{t.exams.eyebrow}</span>
              <h2 id="exams-title" className="font-display text-h2 font-extrabold text-white lg:text-h2-lg">
                {t.exams.title}
              </h2>
              <p className="text-lead text-on-navy-muted">{t.exams.lead}</p>
              <div className="mt-3 grid md:flex">
                <ButtonLink href="/sinaqlar" variant="primary">
                  {t.exams.cta}
                </ButtonLink>
              </div>
            </div>
            <Card className="grid gap-4 text-ink">
              <div className="flex items-center justify-between gap-3">
                <h3 className={h3Class}>{t.exams.card}</h3>
                <Tag tone="solid" className="tabular">
                  {t.exams.questions(EXAM_FORMAT.closed + EXAM_FORMAT.coded + EXAM_FORMAT.written)}
                </Tag>
              </div>
              <FormatBar
                {...EXAM_FORMAT}
                label={t.exams.formatLabel(EXAM_FORMAT.closed, EXAM_FORMAT.coded, EXAM_FORMAT.written)}
              />
              <ul className="m-0 grid list-none gap-2 p-0 text-[15px]" aria-hidden="true">
                <Legend color="bg-navy-900" n={EXAM_FORMAT.closed} label={t.exams.closed} />
                <Legend color="bg-coral-600" n={EXAM_FORMAT.coded} label={t.exams.coded} />
                <Legend color="bg-navy-200" n={EXAM_FORMAT.written} label={t.exams.written} />
              </ul>
              <FeatureList items={t.exams.features} />
            </Card>
          </div>
        </section>

        {/* ---------- Qiymətlər ---------- */}
        <Section id="qiymetler" labelledBy="pricing-title">
          <Head eyebrow={t.pricing.eyebrow} title={t.pricing.title} id="pricing-title">
            <p className="max-w-[40rem] text-ink-muted">{t.pricing.lead}</p>
          </Head>
          <div className="grid gap-4 lg:grid-cols-3 lg:items-stretch">
            <PlanCard plan={t.pricing.plans.free} id="plan-free" href="/qeydiyyat" variant="secondary" />
            <PlanCard plan={t.pricing.plans.monthly} id="plan-monthly" href="/odenis?plan=pro" variant="primary" featured />
            <PlanCard plan={t.pricing.plans.exam} id="plan-exam" href="/odenis?plan=premium" variant="secondary" />
          </div>
        </Section>

        {/* ---------- Müəllim (yer tutucu) ---------- */}
        <Section tone="tint" labelledBy="teacher-title">
          <div className="grid gap-8 lg:grid-cols-2 lg:items-center lg:gap-16">
            <div className="flex items-start gap-5">
              <Placeholder className="aspect-square w-[120px] flex-none rounded-full! p-2!">{t.teacher.photo}</Placeholder>
              <div className="grid gap-2">
                <span className={eyebrowClass}>{t.teacher.eyebrow}</span>
                <h2 id="teacher-title" className={h1Class}>
                  {t.teacher.name}
                </h2>
                <p className="text-ink-muted">{t.teacher.years}</p>
              </div>
            </div>
            <div className="grid gap-4">
              <blockquote className="m-0 text-lead text-ink">{t.teacher.quote}</blockquote>
              <p className="text-ink-muted">{t.teacher.bio}</p>
              <div className="grid gap-2">
                <span className={eyebrowClass}>{t.teacher.results}</span>
                <div className="grid grid-cols-2 gap-3">
                  <Placeholder className="min-h-24!">{t.teacher.resultCard}</Placeholder>
                  <Placeholder className="min-h-24!">{t.teacher.resultCard}</Placeholder>
                </div>
              </div>
            </div>
          </div>
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

function FeatureList({ items, className }: { items: readonly string[]; className?: string }) {
  return (
    <ul className={cn("m-0 grid list-none gap-2.5 p-0", className)}>
      {items.map((f) => (
        <li key={f} className="flex items-start gap-2.5 text-[15px] leading-[22px]">
          <CheckIcon className="mt-px size-5 flex-none text-success-700" />
          {f}
        </li>
      ))}
    </ul>
  );
}

function Legend({ color, n, label }: { color: string; n: number; label: string }) {
  return (
    <li className="flex items-center gap-2">
      <i className={cn("size-3 flex-none rounded-[4px]", color)} />
      <b className="tabular">{n}</b>
      {label}
    </li>
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

type Plan = {
  name: string;
  price: string;
  unit: string;
  cta: string;
  note?: string;
  features: readonly { text: string; on: boolean }[];
};

function PlanCard({
  plan,
  id,
  href,
  variant,
  featured,
}: {
  plan: Plan;
  id: string;
  href: string;
  variant: "primary" | "secondary";
  featured?: boolean;
}) {
  return (
    <article
      aria-labelledby={id}
      className={cn(
        "relative flex flex-col gap-5 rounded-lg bg-surface p-6",
        featured ? "order-first border-2 border-navy-900 shadow-raised lg:order-none" : "border border-line",
      )}
    >
      {featured && (
        <Tag tone="coral" className="absolute -top-3.5 left-6">
          {t.pricing.popular}
        </Tag>
      )}
      <div className="grid gap-1">
        <h3 id={id} className={h3Class}>
          {plan.name}
        </h3>
        <p className="flex flex-wrap items-baseline gap-x-1.5">
          <span className="font-display text-[32px] leading-10 font-extrabold text-navy-900 tabular">{plan.price}</span>
          {plan.unit && <span className="text-ink-muted">{plan.unit}</span>}
        </p>
      </div>
      <ul className="m-0 grid flex-1 list-none content-start gap-2.5 p-0">
        {plan.features.map((f) => (
          <li key={f.text} className={cn("flex items-start gap-2.5 text-[15px] leading-[22px]", !f.on && "text-ink-muted")}>
            {f.on ? (
              <CheckIcon className="mt-px size-5 flex-none text-success-700" />
            ) : (
              <CloseIcon className="mt-px size-5 flex-none text-ink-muted" />
            )}
            <span>
              {f.text}
              {!f.on && <span className="sr-only"> — {t.pricing.notIncluded}</span>}
            </span>
          </li>
        ))}
      </ul>
      <div className="grid gap-2">
        <ButtonLink href={href} variant={variant} block>
          {plan.cta}
        </ButtonLink>
        {plan.note && <p className="text-center text-small text-ink-muted">{plan.note}</p>}
      </div>
    </article>
  );
}
