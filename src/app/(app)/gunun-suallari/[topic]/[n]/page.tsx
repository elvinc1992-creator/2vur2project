import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { DailyPager } from "@/components/app/daily";
import { Page, Topbar } from "@/components/app/topbar";
import { ArrowIcon, LockIcon } from "@/components/icons";
import { TopicIcon } from "@/components/landing/topic-icon";
import { ButtonLink } from "@/components/ui/button";
import { Card, Freq, Tag } from "@/components/ui/display";
import { QuestionCard } from "@/components/ui/question";
import { az } from "@/content/az";
import { requireDaily } from "@/lib/demo/daily";
import { dailyPager, dailyTopic, isCorrectDaily, isDailyOpen, nextDailyHref, typeStats } from "@/lib/demo/logic";
import { getRepetitorKey } from "@/lib/repetitor/source";
import { DailyAnswer } from "./daily-answer";

export const metadata: Metadata = { title: az.app.daily.title };

export default async function DailyQuestionPage(props: PageProps<"/gunun-suallari/[topic]/[n]">) {
  const { topic, n } = await props.params;
  const { state, ctx } = await requireDaily(`/gunun-suallari/${topic}/${n}`);
  const x = dailyTopic(ctx, topic);
  const id = x?.ids[Number(n) - 1];
  const q = id ? ctx.byId.get(id) : undefined;
  if (!x || !q) notFound();

  const t = az.app.daily;
  const qs = x.ids;
  const name = x.name;
  const pager = dailyPager(state, ctx, topic, q.id);
  const done = pager.filter((s) => s.status === "ok" || s.status === "bad").length;
  // Giriş serverdə yoxlanılır: kilidli sualın mətni, variantları və istinadı səhifəyə düşmür.
  const open = isDailyOpen(state, ctx, q.id);
  const chosen = open ? state.daily[q.id] : undefined;
  // Cavab yalnız sual cavablanandan sonra brauzerə gedir.
  const key = chosen ? await getRepetitorKey(q.id) : null;
  const initial =
    chosen && key
      ? {
          chosen,
          correct: isCorrectDaily(state, q.id),
          answer: key.answer,
          steps: key.steps,
          stats: typeStats(state, ctx, q.type),
          nextHref: nextDailyHref(state, ctx, q.id),
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
          <Tag icon={<TopicIcon name={name} />}>{name}</Tag>
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
            />
            <DailyAnswer key={q.id} id={q.id} options={q.options} refText={q.ref} initial={initial} />
          </>
        ) : (
          <LockedQuestion n={Number(n)} freeHref={nextDailyHref(state, ctx) ?? "/gunun-suallari"} />
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
        <ButtonLink href="/odenis?plan=pro" variant="primary">
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
