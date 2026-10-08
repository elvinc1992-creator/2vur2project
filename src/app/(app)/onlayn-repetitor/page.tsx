import type { Metadata } from "next";
import Link from "next/link";
import { DailyPager } from "@/components/app/daily";
import { Page, Topbar } from "@/components/app/topbar";
import { ArrowIcon, CheckCircleIcon, CheckIcon, InfoIcon, LockIcon } from "@/components/icons";
import { TopicIcon } from "@/components/landing/topic-icon";
import { ButtonLink } from "@/components/ui/button";
import { Card, Tag, h1Class, h3Class } from "@/components/ui/display";
import { EmptyState } from "@/components/ui/empty-art";
import { az } from "@/content/az";
import { hasPaidAccess } from "@/lib/demo/logic";
import { requireDemo } from "@/lib/demo/session";
import { nextRepetitorHref, repetitorPager, topicProgress, tutorOf } from "@/lib/repetitor/progress";
import { listRepetitorTopics, REPETITOR_HIT_RATE } from "@/lib/repetitor/source";

export const metadata: Metadata = { title: az.app.tutor.title };

/** Onlayn repetitor: abunəçilər üçün mövzular və suallar; pulsuz planda — kilid (serverdə). */
export default async function RepetitorPage() {
  const { state } = await requireDemo("/onlayn-repetitor");
  const t = az.app.tutor;
  const topics = await listRepetitorTopics();
  const total = topics.reduce((s, x) => s + x.questions.length, 0);

  if (!hasPaidAccess(state)) return <Locked topics={topics.map((x) => ({ slug: x.slug, name: x.name, n: x.questions.length }))} />;

  const progress = Object.values(tutorOf(state)).filter((p) => p.a);
  const next = nextRepetitorHref(state, topics);

  return (
    <>
      <Topbar title={t.title} back="/panel" />
      <Page>
        <div className="grid gap-2">
          <Tag tone="coral" className="justify-self-start">
            {t.highChance} · ~{REPETITOR_HIT_RATE}%
          </Tag>
          <h1 className={h1Class}>{t.title}</h1>
          <p className="max-w-[46rem] text-ink-muted">{t.lead(REPETITOR_HIT_RATE)}</p>
        </div>

        <dl className="m-0 grid grid-cols-2 gap-3 md:grid-cols-4">
          {(
            [
              [total, t.statQuestions],
              [topics.length, t.statTopics],
              [progress.length, t.statAnswered],
              [progress.filter((p) => p.ok).length, t.statCorrect],
            ] as const
          ).map(([v, label]) => (
            <div key={label} className="grid gap-0.5 rounded-lg border border-line bg-white px-4 py-3">
              <dt className="order-2 text-small text-ink-muted">{label}</dt>
              <dd className="order-1 m-0 font-display text-2xl leading-8 font-extrabold text-navy-900 tabular">{v}</dd>
            </div>
          ))}
        </dl>

        {next ? (
          <ButtonLink href={next} block className="md:w-auto md:justify-self-start">
            {t.continue}
            <ArrowIcon className="size-[22px]" />
          </ButtonLink>
        ) : (
          <EmptyState tone="success" icon={<CheckCircleIcon />} title={t.allDoneTitle}>
            {t.allDoneText}
          </EmptyState>
        )}

        <ul className="m-0 grid list-none gap-3 p-0 lg:grid-cols-2">
          {topics.map((x) => {
            const p = topicProgress(state, x);
            return (
              <li key={x.slug}>
                <Card as="section" aria-labelledby={`rt-${x.slug}`} className="grid h-full gap-4">
                  <div className="flex items-center gap-3">
                    <span className="grid size-10 flex-none place-items-center rounded-[12px] bg-navy-100 text-navy-900">
                      <TopicIcon name={x.name} className="size-[22px]" />
                    </span>
                    <div className="min-w-0 flex-1">
                      <h2 id={`rt-${x.slug}`} className={h3Class}>
                        {x.name}
                      </h2>
                      <p className="text-small text-ink-muted">{t.topicProgress(p.done, p.total, p.ok)}</p>
                    </div>
                  </div>
                  <DailyPager items={repetitorPager(state, x)} label={t.pagerLabel(x.name)} />
                  <Link
                    href={`/statistika/${x.slug}`}
                    className="justify-self-start text-small font-semibold text-navy-500 underline underline-offset-3"
                  >
                    {t.topicStats}
                  </Link>
                </Card>
              </li>
            );
          })}
        </ul>

        <p className="flex items-start gap-2 rounded-lg border border-dashed border-navy-200 bg-white px-4 py-3 text-small text-ink-muted">
          <InfoIcon className="mt-px size-[18px] flex-none text-navy-500" />
          {t.demoNote}
        </p>
      </Page>
    </>
  );
}

/** Pulsuz plan: nə açılacağı + mövzuların adı (sual mətni göndərilmir). */
function Locked({ topics }: { topics: Array<{ slug: string; name: string; n: number }> }) {
  const t = az.app.tutor;
  return (
    <>
      <Topbar title={t.title} back="/panel" />
      <Page narrow>
        <Card as="section" aria-labelledby="tutor-locked" className="grid gap-5">
          <div className="flex items-start gap-3">
            <span className="grid size-12 flex-none place-items-center rounded-[14px] bg-navy-900 text-white">
              <LockIcon className="size-6" />
            </span>
            <div className="grid gap-1">
              <h1 id="tutor-locked" className="font-display text-h3 font-extrabold text-navy-900">
                {t.lockedTitle}
              </h1>
              <p className="text-ink-muted">{t.lockedText(REPETITOR_HIT_RATE)}</p>
            </div>
          </div>
          <ul className="m-0 grid list-none gap-2.5 p-0">
            {t.lockedFeatures(topics.length).map((f) => (
              <li key={f} className="flex items-start gap-2.5 text-[15px] leading-[22px]">
                <CheckIcon className="mt-px size-5 flex-none text-success-700" />
                {f}
              </li>
            ))}
          </ul>
          <ButtonLink href="/odenis" variant="primary" block>
            {t.subscribe}
          </ButtonLink>
        </Card>

        <section aria-labelledby="tutor-topics" className="grid gap-2">
          <h2 id="tutor-topics" className="text-caption font-bold tracking-[0.06em] text-ink-muted uppercase">
            {t.lockedTopics}
          </h2>
          <ul className="m-0 grid list-none gap-2 p-0">
            {topics.map((x) => (
              <li key={x.slug} className="flex items-center gap-3 rounded-lg border border-line bg-white px-4 py-3">
                <span className="grid size-9 flex-none place-items-center rounded-[10px] bg-navy-050 text-ink-muted">
                  <TopicIcon name={x.name} className="size-5" />
                </span>
                <span className="min-w-0 flex-1 font-semibold text-navy-900">{x.name}</span>
                <span className="flex items-center gap-1.5 text-small text-ink-muted">
                  <LockIcon className="size-4" />
                  {t.topicCount(x.n)}
                </span>
              </li>
            ))}
          </ul>
        </section>
      </Page>
    </>
  );
}
