import type { Metadata } from "next";
import Link from "next/link";
import { Page, Topbar } from "@/components/app/topbar";
import { ArrowIcon, BulbIcon, CheckCircleIcon, ChevronIcon, InfoIcon, RetryIcon } from "@/components/icons";
import { Button, ButtonLink } from "@/components/ui/button";
import { Card, Tag, h1Class } from "@/components/ui/display";
import { EmptyState } from "@/components/ui/empty-art";
import { MathText } from "@/components/ui/math-text";
import { az } from "@/content/az";
import { givenText, isLetter } from "@/lib/bank/check";
import { canPracticeSimilar } from "@/lib/demo/plans";
import { requireDemo } from "@/lib/demo/session";
import type { ReviewSession } from "@/lib/demo/state";
import { startReviewAction } from "@/lib/review/actions";
import { buildReview, listMistakes, type Mistake } from "@/lib/review/mistakes";
import { practicePool } from "@/lib/review/pool";

export const metadata: Metadata = { title: az.app.mistakes.title };

export default async function MistakesPage(props: PageProps<"/sehvlerim">) {
  const { state } = await requireDemo("/sehvlerim");
  const sp = await props.searchParams;
  const t = az.app.mistakes;
  const pool = await practicePool();
  const mistakes = await listMistakes(state, pool);
  const active = mistakes.filter((m) => !m.fixed);
  const preview = buildReview(state, pool, mistakes);
  const similar = preview.filter((i) => i.kind === "similar").length;

  const review = state.review;
  const reviewDone = review ? Object.keys(review.answers).length : 0;
  const inProgress = review && reviewDone < review.items.length;
  const finished = review && !inProgress && sp.bitdi === "1";

  // Mövzulara görə qruplaşdırma (aktiv səhvlər əvvəl).
  const groups = new Map<string, Mistake[]>();
  for (const m of [...active, ...mistakes.filter((x) => x.fixed)]) {
    groups.set(m.q.topicName, [...(groups.get(m.q.topicName) ?? []), m]);
  }

  return (
    <>
      <Topbar title={t.title} back="/panel" />
      <Page>
        <div className="grid gap-2">
          <h1 className={h1Class}>{t.title}</h1>
          <p className="max-w-[46rem] text-ink-muted">{t.lead}</p>
        </div>

        {finished && review && (
          <EmptyState tone="success" icon={<CheckCircleIcon />} title={t.doneTitle}>
            {t.doneText(
              Object.values(review.answers).filter((a) => a.ok).length,
              review.items.length,
              review.items.filter((i) => i.kind === "mistake" && review.answers[i.ref]?.ok).length,
            )}
          </EmptyState>
        )}

        {mistakes.length === 0 ? (
          <EmptyState icon={<CheckCircleIcon />} title={t.emptyTitle}>
            {t.emptyText}
          </EmptyState>
        ) : (
          <Card className="grid gap-4 md:grid-cols-[1fr_auto] md:items-center">
            <dl className="m-0 flex flex-wrap gap-x-8 gap-y-2">
              <div className="grid">
                <dt className="order-2 text-small text-ink-muted">{t.statActive}</dt>
                <dd className="order-1 m-0 font-display text-3xl leading-9 font-extrabold text-danger-700 tabular">
                  {active.length}
                </dd>
              </div>
              <div className="grid">
                <dt className="order-2 text-small text-ink-muted">{t.statFixed}</dt>
                <dd className="order-1 m-0 font-display text-3xl leading-9 font-extrabold text-success-700 tabular">
                  {mistakes.length - active.length}
                </dd>
              </div>
            </dl>
            <div className="grid gap-2 md:justify-items-end">
              {inProgress && review ? (
                <>
                  <ButtonLink href={`/sehvlerim/tekrar/${firstOpen(review) + 1}`} variant="primary">
                    {t.continue(reviewDone, review.items.length)}
                    <ArrowIcon className="size-[22px]" />
                  </ButtonLink>
                  <form action={startReviewAction}>
                    <Button type="submit" variant="ghost" size="sm" disabled={!active.length}>
                      <RetryIcon />
                      {t.restart}
                    </Button>
                  </form>
                </>
              ) : active.length ? (
                <form action={startReviewAction} className="grid gap-1 md:justify-items-end">
                  <Button type="submit" variant="primary">
                    <RetryIcon />
                    {t.repeat}
                  </Button>
                  <span className="text-small text-ink-muted">{t.repeatHint(preview.length - similar, similar)}</span>
                </form>
              ) : (
                <p className="font-semibold text-success-700">{t.allFixedTitle}</p>
              )}
            </div>
          </Card>
        )}

        {!canPracticeSimilar(state) && active.length > 0 && (
          <p className="flex items-start gap-2 rounded-lg border border-dashed border-navy-200 bg-white px-4 py-3 text-small text-ink-muted">
            <InfoIcon className="mt-px size-[18px] flex-none text-navy-500" />
            {t.freeNote}
          </p>
        )}

        {mistakes.length === 0 && (
          <ButtonLink href="/gunun-suallari" variant="secondary" className="justify-self-start">
            {t.toDaily}
          </ButtonLink>
        )}

        {/* Mövzular açılıb-bağlanır; ilk mövzu açıq gəlir. */}
        {[...groups].map(([topic, list], i) => (
          <details
            key={topic}
            open={i === 0}
            className="group/topic rounded-2xl border border-navy-100 bg-white [&[open]>summary]:border-b [&[open]>summary]:border-navy-100"
          >
            <summary className="flex cursor-pointer items-center gap-3 rounded-2xl px-4 py-3 marker:content-none hover:bg-navy-050 [&::-webkit-details-marker]:hidden">
              <h2 className="m-0 flex flex-1 flex-wrap items-baseline gap-x-2 font-display text-h3 font-bold text-navy-900">
                {topic}
                <span className="text-small font-semibold text-ink-muted">{t.count(list.length)}</span>
              </h2>
              <ChevronIcon className="size-[22px] flex-none text-navy-500 transition-transform group-open/topic:rotate-90" />
            </summary>
            <ul className="m-0 grid list-none gap-3 p-4 lg:grid-cols-2">
              {list.map((m) => (
                <li key={m.q.ref}>
                  <MistakeCard m={m} />
                </li>
              ))}
            </ul>
          </details>
        ))}
      </Page>
    </>
  );
}

const firstOpen = (review: ReviewSession) => Math.max(0, review.items.findIndex((i) => !review.answers[i.ref]));

function MistakeCard({ m }: { m: Mistake }) {
  const t = az.app.mistakes;
  // Qapalı sual — "B · variantın mətni"; digər formatlar — cavabın özü.
  const show = (a: string) => {
    const text = m.q.options && isLetter(a) ? m.q.options[a] : null;
    return text !== null ? (
      <>
        <b>{a}</b> · <MathText text={text} />
      </>
    ) : (
      <b>{m.q.selfCheck ? az.app.answer.selfNo : givenText(m.q.format, a)}</b>
    );
  };
  return (
    <Card as="article" aria-label={`${m.q.topicName}: ${m.q.type}`} className="grid h-full content-start gap-3">
      <div className="flex flex-wrap items-center gap-2">
        <Tag tone="type">{m.where === "exam" ? (m.examTitle ?? "Sınaq") : t.where[m.where]}</Tag>
        <Tag>{m.q.type}</Tag>
        {m.fixed && (
          <Tag tone="success" icon={<CheckCircleIcon />}>
            {t.fixed}
          </Tag>
        )}
      </div>
      <p className="text-[16px] leading-[1.6] text-ink">
        <MathText text={m.q.text} />
      </p>
      <dl className="m-0 grid gap-2 text-small sm:grid-cols-2">
        <div className="grid gap-0.5 rounded-md bg-danger-100 px-3 py-2">
          <dt className="font-semibold text-danger-700">{t.yourAnswer}</dt>
          <dd className="m-0 font-semibold text-ink [&_b]:text-danger-700">{m.chosen === "skip" ? t.skipped : show(m.chosen)}</dd>
        </div>
        <div className="grid gap-0.5 rounded-md bg-success-100 px-3 py-2">
          <dt className="font-semibold text-success-700">{t.correctAnswer}</dt>
          <dd className="m-0 font-semibold text-ink [&_b]:text-success-700">
            {m.q.selfCheck ? <b>{t.toSolution}</b> : show(m.correct)}
          </dd>
        </div>
      </dl>
      {m.steps.length ? (
        // Sual kartda artıq var — açılanda yalnız həll göstərilir (başqa səhifəyə keçmədən)
        <details className="group grid gap-2">
          <summary className="cursor-pointer justify-self-start text-small font-semibold text-navy-500 underline underline-offset-3 marker:content-none [&::-webkit-details-marker]:hidden">
            <span className="group-open:hidden">{t.toSolution}</span>
            <span className="hidden group-open:inline">{t.hideSolution}</span>
          </summary>
          <div className="mt-2 grid gap-2 rounded-2xl bg-navy-050 p-4">
            <div className="flex items-center gap-2 font-bold text-navy-900">
              <BulbIcon className="size-[22px]" />
              {az.app.daily.solution}
            </div>
            <ol className="m-0 grid gap-1 pl-5 text-small">
              {m.steps.map((s, i) => (
                <li key={i}>
                  <MathText text={s} />
                </li>
              ))}
            </ol>
          </div>
        </details>
      ) : (
        <Link href={m.href} className="justify-self-start text-small font-semibold text-navy-500 underline underline-offset-3">
          {t.toQuestion}
        </Link>
      )}
    </Card>
  );
}
