import type { Metadata } from "next";
import Link from "next/link";
import { Page, Topbar } from "@/components/app/topbar";
import { ArrowIcon, CheckCircleIcon, CheckIcon, InfoIcon, LockIcon } from "@/components/icons";
import { TopicIcon } from "@/components/landing/topic-icon";
import { Alert } from "@/components/ui/alert";
import { ButtonLink } from "@/components/ui/button";
import { Card, Tag, h1Class, h3Class } from "@/components/ui/display";
import { az } from "@/content/az";
import { cn } from "@/lib/cn";
import { formatDate } from "@/lib/demo/logic";
import { canUseRepetitor } from "@/lib/demo/plans";
import { requireDemo } from "@/lib/demo/session";
import { DEFAULT_DAYS, type ExamView, type LessonView } from "@/lib/repetitor/plan";
import { tutorContext } from "@/lib/repetitor/progress";
import { listAllRepetitorTopics, REPETITOR_HIT_RATE } from "@/lib/repetitor/source";
import { PlanForm } from "./plan-form";

export const metadata: Metadata = { title: az.app.tutor.title };

const t = az.app.tutor;
// Uzun mövzu adı düyməni ekrandan çıxarmasın.
const wrapBtn = "max-w-full py-2 text-left whitespace-normal! leading-5!";

/** Onlayn repetitor (Pro): həftəlik qrafik → mövzular sıra ilə açılır; hər 2 mövzudan sonra sınaq. */
export default async function RepetitorPage(props: PageProps<"/onlayn-repetitor">) {
  const { state } = await requireDemo("/onlayn-repetitor");
  const sp = await props.searchParams;
  const allTopics = await listAllRepetitorTopics();
  const soon = allTopics.filter((x) => !x.questions.length);

  if (!canUseRepetitor(state)) return <Locked topics={allTopics.map((x) => ({ slug: x.slug, name: x.name, n: x.questions.length }))} />;

  const { view } = await tutorContext(state);
  const plan = state.tutorPlan;
  const emptyError = sp.qrafik === "bos" ? t.planEmpty : undefined;

  return (
    <>
      <Topbar title={t.title} back="/panel" />
      <Page>
        <div className="grid gap-2">
          <Tag tone="coral" className="justify-self-start">
            {t.highChance} · ~{REPETITOR_HIT_RATE}%
          </Tag>
          <h1 className={h1Class}>{t.title}</h1>
          <p className="max-w-[46rem] text-ink-muted">{t.planText}</p>
        </div>

        {!plan || !view ? (
          <Card as="section" aria-labelledby="plan-title" className="grid gap-4">
            <h2 id="plan-title" className={h3Class}>
              {t.planTitle}
            </h2>
            <p className="text-small text-ink-muted">{t.planSuggest}</p>
            {emptyError && <Alert tone="danger">{emptyError}</Alert>}
            <PlanForm defaultDays={DEFAULT_DAYS} submitLabel={t.planSave} />
          </Card>
        ) : (
          <>
            <Summary view={view} days={plan.days} />
            <details className="group rounded-lg border border-line bg-white px-4 py-3">
              <summary className="cursor-pointer font-semibold text-navy-900">{t.planChange}</summary>
              <div className="grid gap-3 pt-3">
                <p className="text-small text-ink-muted">{t.planChangeNote}</p>
                {emptyError && <Alert tone="danger">{emptyError}</Alert>}
                <PlanForm defaultDays={plan.days} submitLabel={t.planSave} />
              </div>
            </details>

            <section aria-labelledby="curriculum" className="grid gap-3">
              <h2 id="curriculum" className={h3Class}>
                {t.curriculumTitle}
              </h2>
              <ol className="m-0 grid list-none gap-2 p-0">
                {view.lessons.map((l) => (
                  <LessonRows key={`${l.topic}-${l.part}`} lesson={l} doneTopic={view.doneTopics.has(l.topic)}>
                    {view.exams
                      .filter((e) => e.afterLesson === l.index)
                      .map((e) => (
                        <ExamRow key={e.n} exam={e} />
                      ))}
                  </LessonRows>
                ))}
              </ol>
            </section>
          </>
        )}

        {soon.length > 0 && (
          <section aria-labelledby="tutor-soon" className="grid gap-2">
            <h2 id="tutor-soon" className="text-caption font-bold tracking-[0.06em] text-ink-muted uppercase">
              {t.soonTitle}
            </h2>
            <p className="text-small text-ink-muted">{t.soonText}</p>
            <ul className="m-0 grid list-none gap-2 p-0 md:grid-cols-2">
              {soon.map((x) => (
                <li key={x.slug} className="flex items-center gap-3 rounded-lg border border-line bg-white px-4 py-2.5">
                  <TopicIcon name={x.name} className="size-5 flex-none text-ink-muted" />
                  <span className="min-w-0 flex-1 text-[15px] text-navy-900">{x.name}</span>
                </li>
              ))}
            </ul>
          </section>
        )}

        <p className="flex items-start gap-2 rounded-lg border border-dashed border-navy-200 bg-white px-4 py-3 text-small text-ink-muted">
          <InfoIcon className="mt-px size-[18px] flex-none text-navy-500" />
          {t.demoNote}
        </p>
      </Page>
    </>
  );
}

function Summary({ view, days }: { view: NonNullable<Awaited<ReturnType<typeof tutorContext>>["view"]>; days: number[] }) {
  const topics = new Set(view.lessons.map((l) => l.topic));
  const next = view.lessons.find((l) => l.status === "locked");
  const current = view.lessons.find((l) => l.status === "open");
  const openExam = view.exams.find((e) => e.status === "open");
  return (
    <Card tone="navy" className="grid grid-cols-[minmax(0,1fr)] gap-3">
      <p className="m-0 font-semibold text-white">{t.planSummary(days.map((d) => t.weekdays[d - 1]).join(", "))}</p>
      <p className="m-0 text-small text-on-navy-muted">
        {t.planProgress(view.doneTopics.size, topics.size)} ·{" "}
        {next?.date ? t.planNext(formatDate(next.date)) : t.planAllOpen}
      </p>
      <div className="flex flex-wrap gap-2">
        {openExam && (
          <ButtonLink href={`/onlayn-repetitor/sinaq/${openExam.n}`} size="sm" className={wrapBtn}>
            {t.examStart}: {t.examTitle(openExam.n)}
            <ArrowIcon className="size-5" />
          </ButtonLink>
        )}
        {current && (
          <ButtonLink
            href={`/onlayn-repetitor/${current.topic}`}
            size="sm"
            className={wrapBtn}
            variant={openExam ? "secondary" : "primary"}
          >
            {current.done ? t.lessonContinue : t.lessonStart}: {current.topicName}
            <ArrowIcon className="size-5" />
          </ButtonLink>
        )}
      </div>
    </Card>
  );
}

function LessonRows({ lesson: l, doneTopic, children }: { lesson: LessonView; doneTopic: boolean; children?: React.ReactNode }) {
  const locked = l.status === "locked";
  const done = l.status === "done";
  return (
    <>
      <li>
        <div
          className={cn(
            "flex items-center gap-3 rounded-lg border px-4 py-3",
            done ? "border-success-700/30 bg-success-100" : locked ? "border-line bg-navy-050" : "border-navy-200 bg-white",
          )}
        >
          <span
            className={cn(
              "grid size-9 flex-none place-items-center rounded-full font-bold tabular",
              done ? "bg-success-700 text-white" : locked ? "bg-white text-ink-muted" : "bg-navy-900 text-white",
            )}
            aria-hidden="true"
          >
            {done ? <CheckIcon className="size-5" /> : locked ? <LockIcon className="size-4" /> : l.index + 1}
          </span>
          <div className="min-w-0 flex-1">
            <p className="m-0 font-semibold text-navy-900">
              {l.topicName}
              {l.parts > 1 && <span className="font-normal text-ink-muted"> · {t.lessonPart(l.part, l.parts)}</span>}
              {doneTopic && l.part === l.parts && (
                <CheckCircleIcon className="ml-1.5 inline size-[18px] align-[-3px] text-success-700" aria-label={t.topicDone} />
              )}
            </p>
            <p className="m-0 text-small text-ink-muted">
              {done ? t.lessonDone : locked ? t.lessonLocked(l.date ? formatDate(l.date) : null) : t.lessonOpen} ·{" "}
              {t.lessonQuestions(l.done, l.questionIds.length)}
            </p>
          </div>
          {!locked && (
            <Link
              href={`/onlayn-repetitor/${l.topic}`}
              className="flex-none text-small font-bold text-navy-500 underline underline-offset-3"
            >
              {done ? t.lessonReview : l.done ? t.lessonContinue : t.lessonStart}
              <span className="sr-only">: {l.topicName}</span>
            </Link>
          )}
        </div>
      </li>
      {children}
    </>
  );
}

function ExamRow({ exam: e }: { exam: ExamView }) {
  const [a, b] = e.topics;
  return (
    <li>
      <div
        className={cn(
          "flex items-center gap-3 rounded-lg border-2 border-dashed px-4 py-3",
          e.status === "locked" ? "border-line bg-white" : "border-coral-500 bg-coral-100/40",
        )}
      >
        <span className="grid size-9 flex-none place-items-center rounded-full bg-coral-600 text-white" aria-hidden="true">
          {e.status === "done" ? <CheckIcon className="size-5" /> : e.status === "locked" ? <LockIcon className="size-4" /> : "★"}
        </span>
        <div className="min-w-0 flex-1">
          <p className="m-0 font-semibold text-navy-900">
            {t.examTitle(e.n)} · {t.examQuestions(e.questionIds.length)}
          </p>
          <p className="m-0 text-small text-ink-muted">
            {t.examOf(a.name, b.name)} ·{" "}
            {e.status === "done" ? t.examResult(e.correct ?? 0, e.questionIds.length) : e.status === "open" ? t.examOpen : t.examLocked}
          </p>
        </div>
        {e.status !== "locked" && (
          <Link
            href={`/onlayn-repetitor/sinaq/${e.n}`}
            className="flex-none text-small font-bold text-navy-500 underline underline-offset-3"
          >
            {e.status === "done" ? t.lessonReview : t.examStart}
            <span className="sr-only">: {t.examTitle(e.n)}</span>
          </Link>
        )}
      </div>
    </li>
  );
}

/** Pulsuz plan: nə açılacağı + mövzuların adı (sual mətni göndərilmir). */
function Locked({ topics }: { topics: Array<{ slug: string; name: string; n: number }> }) {
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
                  {x.n ? t.topicCount(x.n) : t.soonTitle}
                </span>
              </li>
            ))}
          </ul>
        </section>
      </Page>
    </>
  );
}
