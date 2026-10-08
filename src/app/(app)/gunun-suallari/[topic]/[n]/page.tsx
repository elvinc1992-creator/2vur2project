import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { DailyPager } from "@/components/app/daily";
import { Page, Topbar } from "@/components/app/topbar";
import { ArrowIcon, LockIcon, PercentIcon } from "@/components/icons";
import { ButtonLink } from "@/components/ui/button";
import { Card, Freq, Tag } from "@/components/ui/display";
import { QuestionCard } from "@/components/ui/question";
import { az } from "@/content/az";
import { DAILY_TOPICS, TOPICS, type TopicSlug } from "@/lib/demo/content";
import { DAILY_KEYS } from "@/lib/demo/keys";
import {
  dailyByTopic,
  dailyPager,
  isCorrectDaily,
  isDailyOpen,
  nextDailyHref,
  typeStats,
} from "@/lib/demo/logic";
import { requireDemo } from "@/lib/demo/session";
import { DailyAnswer } from "./daily-answer";

export const metadata: Metadata = { title: az.app.daily.title };

export default async function DailyQuestionPage(props: PageProps<"/gunun-suallari/[topic]/[n]">) {
  const { topic, n } = await props.params;
  if (!DAILY_TOPICS.includes(topic as TopicSlug)) notFound();
  const qs = dailyByTopic(topic as TopicSlug);
  const q = qs[Number(n) - 1];
  if (!q) notFound();

  const { state } = await requireDemo(`/gunun-suallari/${topic}/${n}`);
  const t = az.app.daily;
  const name = TOPICS[q.topic].name;
  const pager = dailyPager(state, q.topic, q.id);
  const done = pager.filter((s) => s.status === "ok" || s.status === "bad").length;
  // Giriş serverdə yoxlanılır: kilidli sualın mətni, variantları və istinadı səhifəyə düşmür.
  const open = isDailyOpen(state, q);
  const chosen = open ? state.daily[q.id] : undefined;
  // Cavab yalnız sual cavablanandan sonra brauzerə gedir.
  const initial = chosen
    ? {
        chosen,
        correct: isCorrectDaily(state, q.id),
        answer: DAILY_KEYS[q.id].answer,
        steps: DAILY_KEYS[q.id].steps,
        stats: typeStats(state, q.type),
        nextHref: nextDailyHref(state, q),
      }
    : null;

  return (
    <>
      <Topbar title={t.title} back="/gunun-suallari" close="/panel" />
      <Page narrow>
        <h1 className="sr-only">
          {t.title}: {name}, {n} / {qs.length}
          {!open && ` — ${t.lockedTitle}`}
        </h1>
        <div className="grid gap-2">
          <div className="flex items-center justify-between gap-3 text-small">
            <span className="text-ink-muted">{t.progress(name)}</span>
            <b className="tabular">
              {done} / {qs.length}
            </b>
          </div>
          <DailyPager items={pager} label={t.pagerLabel(name)} />
        </div>
        <div className="flex flex-wrap items-center gap-2">
          <Tag icon={q.topic === "faiz" ? <PercentIcon /> : undefined}>{name}</Tag>
          <Tag tone="type">{q.type}</Tag>
          <Freq count={q.freq} label={t.inExam(q.freq)} />
        </div>

        {open ? (
          <>
            <QuestionCard
              id="daily-q"
              n={Number(n)}
              total={qs.length}
              text={q.text}
              image={Boolean(q.image)}
              imageLabel={t.imagePlaceholder}
            />
            <DailyAnswer key={q.id} id={q.id} options={q.options} refText={q.ref} initial={initial} />
          </>
        ) : (
          <LockedQuestion n={Number(n)} freeHref={nextDailyHref(state) ?? "/gunun-suallari"} />
        )}
      </Page>
    </>
  );
}

/** Kilidli sual: bulanıq yer tutucu + nə açılacağı + abunə (dizayn: LockedCard). */
function LockedQuestion({ n, freeHref }: { n: number; freeHref: string }) {
  const t = az.app.daily;
  return (
    <Card as="section" aria-labelledby="locked-title" className="grid gap-5 overflow-hidden">
      <div aria-hidden="true" className="grid gap-3 select-none">
        <div className="grid gap-2 blur-[5px]">
          <i className="block h-4 w-11/12 rounded-pill bg-navy-100" />
          <i className="block h-4 w-3/4 rounded-pill bg-navy-100" />
        </div>
        <div className="grid grid-cols-5 gap-2 blur-[3px]">
          {["A", "B", "C", "D", "E"].map((l) => (
            <span
              key={l}
              className="grid h-12 place-items-center rounded-md border-2 border-line font-display font-extrabold text-navy-200"
            >
              {l}
            </span>
          ))}
        </div>
      </div>
      <div className="flex items-start gap-3">
        <span className="grid size-11 flex-none place-items-center rounded-[14px] bg-navy-900 text-white">
          <LockIcon className="size-[22px]" />
        </span>
        <div className="grid gap-1">
          <h2 id="locked-title" className="font-display text-lg leading-6 font-extrabold text-navy-900">
            {t.lockedTitle}
          </h2>
          <p className="text-small text-ink-muted">{t.lockedText}</p>
          <p className="text-small text-ink-muted">
            <span className="sr-only">Sual {n}: </span>
            {t.lockedHidden}
          </p>
        </div>
      </div>
      <div className="grid gap-2 md:flex md:flex-wrap">
        <ButtonLink href="/odenis" variant="primary">
          {t.subscribe}
        </ButtonLink>
        <ButtonLink href={freeHref} variant="secondary">
          {t.toFree}
          <ArrowIcon className="size-[22px]" />
        </ButtonLink>
      </div>
    </Card>
  );
}
