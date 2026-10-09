import type { Metadata } from "next";
import { notFound, redirect } from "next/navigation";
import { DailyPager } from "@/components/app/daily";
import { Page, Topbar } from "@/components/app/topbar";
import { ArrowIcon, BookIcon, CheckCircleIcon, LockIcon } from "@/components/icons";
import { ButtonLink } from "@/components/ui/button";
import { Card, Tag, h1Class, h3Class } from "@/components/ui/display";
import { MathText } from "@/components/ui/math-text";
import { az } from "@/content/az";
import { formatDate } from "@/lib/demo/logic";
import { canUseRepetitor } from "@/lib/demo/plans";
import { requireDemo } from "@/lib/demo/session";
import { repetitorHref, repetitorPager, tutorContext, tutorOf } from "@/lib/repetitor/progress";
import { getRepetitorTopic, getTopicTheory } from "@/lib/repetitor/source";

export const metadata: Metadata = { title: az.app.tutor.title };

/** Mövzu dərsi: əvvəl nəzəriyyə, sonra praktiki testlər (60-dan çox sual — iki hissə, iki gün). */
export default async function RepetitorTopicPage(props: PageProps<"/onlayn-repetitor/[movzu]">) {
  const { movzu } = await props.params;
  const topic = await getRepetitorTopic(movzu);
  if (!topic) notFound();
  const { state } = await requireDemo(`/onlayn-repetitor/${movzu}`);
  if (!canUseRepetitor(state)) redirect("/onlayn-repetitor");

  const t = az.app.tutor;
  const ctx = await tutorContext(state);
  const lessons = ctx.view?.lessons.filter((l) => l.topic === movzu) ?? [];
  const opened = lessons.filter((l) => l.status !== "locked");
  const firstLocked = lessons.find((l) => l.status === "locked");
  const done = ctx.view?.doneTopics.has(movzu) ?? false;
  const theory = opened.length || !topic.questions.length ? await getTopicTheory(movzu) : null;
  const pager = repetitorPager(state, topic, undefined, ctx.isOpen);
  const answered = tutorOf(state);

  return (
    <>
      <Topbar title={t.title} back="/onlayn-repetitor" close="/panel" />
      <Page narrow>
        <div className="grid gap-2">
          {done && (
            <Tag tone="success" icon={<CheckCircleIcon />} className="justify-self-start">
              {t.topicDone}
            </Tag>
          )}
          <h1 className={h1Class}>{topic.name}</h1>
        </div>

        {!topic.questions.length ? (
          <>
            <Theory body={theory} />
            <Card tone="tint">
              <p className="text-ink-muted">{t.soonText}</p>
            </Card>
          </>
        ) : !ctx.view ? (
          <Locked text={t.noPlanLocked} />
        ) : !opened.length ? (
          <Locked text={t.topicLocked(firstLocked?.date ? formatDate(firstLocked.date) : null)} />
        ) : (
          <>
            <Theory body={theory} />
            <section aria-labelledby="practice" className="grid gap-3">
              <h2 id="practice" className={h3Class}>
                {t.practiceTitle}
              </h2>
              {lessons.map((l) => {
                const items = pager.slice(l.firstN - 1, l.firstN - 1 + l.questionIds.length);
                const next = l.questionIds.findIndex((id) => !answered[id]?.a);
                return (
                  <Card key={l.part} className="grid gap-3">
                    <div className="flex flex-wrap items-baseline justify-between gap-2">
                      <span className="font-semibold text-navy-900">
                        {l.parts > 1 ? t.lessonPart(l.part, l.parts) : t.practiceTitle}
                      </span>
                      <span className="text-small text-ink-muted tabular">
                        {l.status === "locked"
                          ? t.lessonLocked(l.date ? formatDate(l.date) : null)
                          : t.lessonQuestions(l.done, l.questionIds.length)}
                      </span>
                    </div>
                    {l.status !== "locked" && (
                      <>
                        <DailyPager items={items} label={`${t.pagerLabel(topic.name)} · ${l.part}`} />
                        {next >= 0 && (
                          <ButtonLink href={repetitorHref(movzu, l.firstN + next)} className="justify-self-start">
                            {l.done ? t.lessonContinue : t.lessonStart}
                            <ArrowIcon className="size-[22px]" />
                          </ButtonLink>
                        )}
                      </>
                    )}
                  </Card>
                );
              })}
            </section>
          </>
        )}

        <ButtonLink href="/onlayn-repetitor" variant="secondary" className="justify-self-start">
          {t.examBack}
        </ButtonLink>
      </Page>
    </>
  );
}

function Theory({ body }: { body: string | null }) {
  const t = az.app.tutor;
  return (
    <section aria-labelledby="theory" className="grid gap-2 rounded-2xl bg-navy-050 p-4 lg:p-5">
      <h2 id="theory" className="flex items-center gap-2 font-bold text-navy-900">
        <BookIcon className="size-[22px]" />
        {t.theoryTitle}
      </h2>
      {body ? (
        body.split(/\n{2,}/).map((p, i) => (
          <p key={i} className="m-0">
            <MathText text={p} />
          </p>
        ))
      ) : (
        <p className="m-0 text-ink-muted">{t.theoryEmpty}</p>
      )}
    </section>
  );
}

function Locked({ text }: { text: string }) {
  return (
    <Card tone="tint" className="flex items-start gap-3">
      <LockIcon className="mt-0.5 size-5 flex-none text-ink-muted" />
      <p className="m-0 text-ink-muted">{text}</p>
    </Card>
  );
}
