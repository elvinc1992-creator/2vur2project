import type { Metadata } from "next";
import { notFound, redirect } from "next/navigation";
import { DailyPager } from "@/components/app/daily";
import { Page, Topbar } from "@/components/app/topbar";
import { ChartIcon } from "@/components/icons";
import { Freq, Tag } from "@/components/ui/display";
import { QuestionCard } from "@/components/ui/question";
import { az } from "@/content/az";
import { canUseRepetitor } from "@/lib/demo/plans";
import { requireDemo } from "@/lib/demo/session";
import { nextRepetitorHref, repetitorPager, tutorContext, tutorOf } from "@/lib/repetitor/progress";
import { getRepetitorKey, getRepetitorTopic } from "@/lib/repetitor/source";
import { TutorAnswer } from "./tutor-answer";

export const metadata: Metadata = { title: az.app.tutor.question };

export default async function RepetitorQuestionPage(props: PageProps<"/onlayn-repetitor/[movzu]/[n]">) {
  const { movzu, n } = await props.params;
  const topic = await getRepetitorTopic(movzu);
  const q = topic?.questions[Number(n) - 1];
  if (!topic || !q) notFound();

  const { state } = await requireDemo(`/onlayn-repetitor/${movzu}/${n}`);
  // Giriş serverdə: abunə yoxdursa, sualın mətni səhifəyə düşmür.
  if (!canUseRepetitor(state)) redirect("/onlayn-repetitor");
  // Qrafikə görə hələ açılmamış dərsin sualı göstərilmir.
  const ctx = await tutorContext(state);
  if (!ctx.isOpen(q.id)) redirect(`/onlayn-repetitor/${movzu}`);

  const t = az.app.tutor;
  const key = (await getRepetitorKey(q.id))!;
  const p = tutorOf(state)[q.id];
  const pager = repetitorPager(state, topic, q.id, ctx.isOpen);
  const done = pager.filter((s) => s.status !== "open").length;
  // Cavab və izah yalnız cavabdan sonra, ipucu — yalnız istənibsə brauzerə gedir.
  const initial = p?.a
    ? {
        chosen: p.a,
        correct: Boolean(p.ok),
        answer: key.answer,
        steps: key.steps,
        hintUsed: Boolean(p.hint),
        nextHref: nextRepetitorHref(state, ctx.topics, q, ctx.isOpen),
      }
    : null;

  return (
    <>
      <Topbar title={t.title} back="/onlayn-repetitor" close="/panel" />
      <Page narrow>
        <h1 className="sr-only">
          {t.question}: {topic.name}, {n} / {topic.questions.length}
        </h1>
        <div className="grid gap-2">
          <div className="flex items-center justify-between gap-3 text-small">
            <span className="text-ink-muted">{topic.name}</span>
            <b className="tabular">
              {done} / {topic.questions.length}
            </b>
          </div>
          <DailyPager items={pager} label={t.pagerLabel(topic.name)} />
        </div>
        <div className="flex flex-wrap items-center gap-2">
          <Tag tone="coral" icon={<ChartIcon />}>
            {t.highChance}
          </Tag>
          <Tag tone="type">{q.type}</Tag>
          <Freq count={q.freq} label={az.app.daily.inExam(q.freq)} />
        </div>
        <QuestionCard id="tutor-q" n={Number(n)} total={topic.questions.length} text={q.text} imageUrl={q.imageUrl} imageAlt={q.imageAlt} qid={q.id} />
        <TutorAnswer
          key={q.id}
          id={q.id}
          options={q.options}
          refText={q.ref}
          statsHref={`/statistika/${topic.slug}`}
          hasHint={Boolean(key.hint)}
          initialHint={p?.hint ? key.hint : null}
          initial={initial}
        />
      </Page>
    </>
  );
}
