import type { Metadata } from "next";
import { notFound, redirect } from "next/navigation";
import { Page, Topbar } from "@/components/app/topbar";
import { BookIcon, CheckIcon, CloseIcon } from "@/components/icons";
import { Alert } from "@/components/ui/alert";
import { ButtonLink } from "@/components/ui/button";
import { Card, Meter, Tag, h3Class } from "@/components/ui/display";
import { MathText } from "@/components/ui/math-text";
import { az } from "@/content/az";
import { EXAM_QUESTIONS, TOPICS } from "@/lib/demo/content";
import { EXAM_KEYS } from "@/lib/demo/keys";
import { findExam, normalizeCoded } from "@/lib/demo/logic";
import { requireDemo } from "@/lib/demo/session";
import { cn } from "@/lib/cn";

export const metadata: Metadata = { title: az.app.result.title };

export default async function ResultPage(props: PageProps<"/sinaq/[id]/netice">) {
  const { id } = await props.params;
  const exam = findExam(id);
  if (!exam) notFound();
  const { state } = await requireDemo(`/sinaq/${id}/netice`);
  const r = state.results[id];
  if (!r) redirect(`/sinaq/${id}`);
  const t = az.app.result;

  return (
    <>
      <Topbar title={t.title} back="/sinaqlar" />
      <Page>
        <div className="grid items-start gap-6 lg:grid-cols-[1.6fr_1fr]">
          <div className="grid gap-6">
            <div className="grid place-items-center gap-1 rounded-xl bg-navy-900 p-6 text-center text-white">
              <h1 className="text-small font-normal text-on-navy-muted">{t.heading(exam.title)}</h1>
              <p className="font-display text-[56px] leading-[60px] font-extrabold tabular">
                <span aria-hidden="true">
                  {r.score}
                  <small className="text-2xl opacity-80">/100</small>
                </span>
                <span className="sr-only">{t.scoreSr(r.score)}</span>
              </p>
              <div className="flex flex-wrap justify-center gap-2">
                <Tag tone="onNavy">{t.correct(r.correct)}</Tag>
                <Tag tone="onNavy">{t.wrong(r.wrong)}</Tag>
                <Tag tone="onNavy">{t.empty(r.empty)}</Tag>
                {r.pending > 0 && <Tag tone="onNavy">{t.pending(r.pending)}</Tag>}
              </div>
            </div>
            {r.timedOut && <Alert tone="warning">{t.timedOut}</Alert>}
            {r.pending > 0 && <Alert tone="info">{t.provisional(r.pending)}</Alert>}

            <Card as="section" aria-labelledby="bt" className="grid gap-4">
              <div className="grid gap-1">
                <h2 className={h3Class} id="bt">
                  {t.byTopic}
                </h2>
                {r.pending > 0 && <p className="text-small text-ink-muted">{t.byTopicNote}</p>}
              </div>
              {[...r.byTopic]
                .sort((a, b) => a.ok / a.total - b.ok / b.total)
                .map((x) => {
                const pct = Math.round((x.ok / x.total) * 100);
                return (
                  <div key={x.topic} className="grid grid-cols-[1fr_auto] items-center gap-x-3 gap-y-1.5">
                    <span>{TOPICS[x.topic].name}</span>
                    <b className="tabular">{t.topicRow(x.ok, x.total, pct)}</b>
                    <Meter
                      className="col-span-2"
                      value={pct}
                      label={TOPICS[x.topic].name}
                      tone={pct === 100 ? "success" : pct < 50 ? "coral" : "navy"}
                    />
                  </div>
                );
              })}
            </Card>
          </div>

          <div className="grid gap-6">
            <section className="grid gap-4" aria-labelledby="rc">
              <div className="grid gap-2">
                <h2 className={h3Class} id="rc">
                  {t.weakTitle}
                </h2>
                <p className="text-small text-ink-muted">{r.weak.length ? t.weakText : t.noWeak}</p>
              </div>
              {r.weak.map((w) => (
                <Card key={w.type} tone="flat" className="grid gap-2">
                  <div className="flex flex-wrap gap-2">
                    <Tag tone="coral">{TOPICS[w.topic].name}</Tag>
                    <Tag tone="type">{w.type}</Tag>
                  </div>
                  <div className="flex items-center gap-2 font-semibold text-navy-900">
                    <BookIcon className="size-5 flex-none" />
                    {w.ref}
                  </div>
                </Card>
              ))}
            </section>
            <ButtonLink href="#izahlar" block>
              {t.solutions}
            </ButtonLink>
            <ButtonLink href="/sinaqlar" variant="secondary" block>
              {t.newExam}
            </ButtonLink>
          </div>
        </div>

        <section id="izahlar" aria-labelledby="iz" className="grid scroll-mt-20 gap-4">
          <h2 className={h3Class} id="iz">
            {t.solutionsTitle}
          </h2>
          <div className="grid gap-3 md:grid-cols-2">
            {EXAM_QUESTIONS.map((q) => {
              const given = r.answers[q.n];
              const key = EXAM_KEYS[q.n];
              const auto = q.format !== "written";
              const ok =
                given !== undefined &&
                (q.format === "closed"
                  ? given === key.answer
                  : q.format === "coded" && normalizeCoded(given) === normalizeCoded(key.answer));
              const status = !given ? "empty" : !auto ? "pending" : ok ? "correct" : "wrong";
              return (
                <Card
                  key={q.n}
                  tone="flat"
                  as="article"
                  aria-labelledby={`sol-${q.n}`}
                  className={cn(
                    "grid gap-2 border-l-4",
                    status === "correct" && "border-l-success-700",
                    status === "wrong" && "border-l-danger-700",
                    status === "empty" && "border-l-control-border",
                    status === "pending" && "border-l-navy-500",
                  )}
                >
                  <div className="flex flex-wrap items-center gap-2">
                    <h3 id={`sol-${q.n}`} className="font-bold text-navy-900 tabular">
                      <span aria-hidden="true">№{q.n}</span>
                      <span className="sr-only">{t.questionNo(q.n)}</span>
                    </h3>
                    <Tag tone="type">{az.app.exam.formats[q.format]}</Tag>
                    <Tag>{TOPICS[q.topic].name}</Tag>
                  </div>
                  <p className="text-small leading-[1.6]">
                    <MathText text={q.text} />
                  </p>
                  <dl className="m-0 grid grid-cols-[auto_1fr] gap-x-3 gap-y-1 text-small">
                    <dt className="text-ink-muted">{t.yourAnswer}</dt>
                    <dd
                      className={cn(
                        "m-0 flex flex-wrap items-center gap-1.5 font-semibold",
                        status === "correct" && "text-success-700",
                        status === "wrong" && "text-danger-700",
                      )}
                    >
                      {status === "empty" && <span>— {t.statusEmpty}</span>}
                      {status === "pending" && <span>{t.writtenGiven}</span>}
                      {(status === "correct" || status === "wrong") && (
                        <>
                          <span className="text-ink">{given}</span>
                          <span className="inline-flex items-center gap-1">
                            {status === "correct" ? <CheckIcon className="size-4" /> : <CloseIcon className="size-4" />}
                            {status === "correct" ? t.statusCorrect : t.statusWrong}
                          </span>
                        </>
                      )}
                    </dd>
                    <dt className="text-ink-muted">{auto ? t.key : t.sample}</dt>
                    <dd className="m-0 font-semibold">
                      <MathText text={key.answer} displayStyle />
                    </dd>
                  </dl>
                  <ol className="m-0 grid gap-0.5 pl-5 text-small text-ink-muted">
                    {key.steps.map((step, i) => (
                      <li key={i}>
                        <MathText text={step} />
                      </li>
                    ))}
                  </ol>
                </Card>
              );
            })}
          </div>
        </section>
      </Page>
    </>
  );
}
