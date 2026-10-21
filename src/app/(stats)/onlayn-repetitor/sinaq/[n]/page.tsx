import type { Metadata } from "next";
import Image from "next/image";
import { notFound, redirect } from "next/navigation";
import { AiBadge } from "@/components/ai-badge";
import { Page, Topbar } from "@/components/app/topbar";
import { CheckCircleIcon, XCircleIcon } from "@/components/icons";
import { Button, ButtonLink } from "@/components/ui/button";
import { Card, h1Class } from "@/components/ui/display";
import { MathText } from "@/components/ui/math-text";
import { ReportQuestion } from "@/components/ui/report-question";
import { az } from "@/content/az";
import { aiInsights } from "@/lib/ai";
import { cn } from "@/lib/cn";
import { FormAnswerFields } from "@/components/ui/form-answer";
import { givenText, isLetter } from "@/lib/bank/check";
import { canUseRepetitor } from "@/lib/demo/plans";
import { requireDemo } from "@/lib/demo/session";
import { submitTutorExamAction } from "@/lib/repetitor/actions";
import { examKey } from "@/lib/repetitor/plan";
import { tutorContext } from "@/lib/repetitor/progress";
import { getRepetitorKeys } from "@/lib/repetitor/source";

export const metadata: Metadata = { title: az.app.tutor.title };

/** Hər 2 mövzudan sonrakı 20 suallıq sınaq: bir səhifədə cavablar → yoxlama → nəticə. */
export default async function TutorExamPage(props: PageProps<"/onlayn-repetitor/sinaq/[n]">) {
  const n = Number((await props.params).n);
  const { state } = await requireDemo(`/onlayn-repetitor/sinaq/${n}`);
  if (!canUseRepetitor(state)) redirect("/onlayn-repetitor");
  const ctx = await tutorContext(state);
  const exam = ctx.view?.exams.find((e) => e.n === n);
  if (!exam) notFound();
  if (exam.status === "locked") redirect("/onlayn-repetitor");

  const t = az.app.tutor;
  const byId = new Map(ctx.topics.flatMap((x) => x.questions).map((q) => [q.id, q]));
  const questions = exam.questionIds.map((id) => byId.get(id)!).filter(Boolean);
  const record = state.tutorExams?.[examKey(n)];
  // Açarlar yalnız sınaq bitəndən sonra brauzerə gedir.
  const [keys, ai] = await Promise.all([record ? getRepetitorKeys(exam.questionIds) : null, aiInsights(exam.questionIds)]);
  const [a, b] = exam.topics;

  return (
    <>
      <Topbar title={t.examTitle(n)} back="/onlayn-repetitor" close="/panel" />
      <Page narrow>
        <div className="grid gap-2">
          <h1 className={h1Class}>{t.examTitle(n)}</h1>
          <p className="text-ink-muted">{t.examOf(a.name, b.name)}</p>
        </div>

        {record && keys ? (
          <>
            <Card tone="navy" className="grid gap-1" aria-label={t.examDoneTitle}>
              <span className="text-caption font-bold tracking-[0.06em] text-on-navy-muted uppercase">{t.examDoneTitle}</span>
              <span className="font-display text-[40px] leading-[48px] font-extrabold text-white tabular">
                {t.examResult(Object.values(record.results).filter(Boolean).length, questions.length)}
              </span>
            </Card>
            <ol className="m-0 grid list-none gap-3 p-0">
              {questions.map((q, i) => {
                const ok = record.results[q.id];
                const given = record.answers[q.id];
                const answer = keys.get(q.id)?.answerText ?? "";
                return (
                  <li key={q.id}>
                    <Card className="grid gap-2">
                      <AiBadge ai={ai[q.id]} />
                      <div className="flex items-start gap-2">
                        <p className="m-0 flex-1">
                          <b className="tabular">{i + 1}. </b>
                          <MathText text={q.text} />
                        </p>
                        <ReportQuestion target={{ code: q.id, source: "tutor", context: `sinaq-${n}` }} n={i + 1} className="-mt-2" />
                      </div>
                      <p
                        className={cn(
                          "m-0 flex items-start gap-2 text-small font-semibold",
                          ok ? "text-success-700" : "text-danger-700",
                        )}
                      >
                        {ok ? <CheckCircleIcon className="size-5 flex-none" /> : <XCircleIcon className="size-5 flex-none" />}
                        <span>
                          {ok ? t.examCorrect : given ? t.examWrong(answer) : t.examEmpty(answer)}
                          {given && !ok && (
                            <span className="block font-normal text-ink-muted">
                              {q.options && isLetter(given) ? (
                                <>
                                  {t.examYour(given)}: <MathText text={q.options[given]} />
                                </>
                              ) : (
                                t.examYour(givenText(q.format, given))
                              )}
                            </span>
                          )}
                        </span>
                      </p>
                    </Card>
                  </li>
                );
              })}
            </ol>
            <ButtonLink href="/onlayn-repetitor" className="justify-self-start">
              {t.examBack}
            </ButtonLink>
          </>
        ) : (
          <form action={submitTutorExamAction.bind(null, n)} className="grid gap-4">
            <p className="text-small text-ink-muted">{t.examIntro(questions.length)}</p>
            {questions.map((q, i) => (
              <Card key={q.id} as="section" aria-labelledby={`tq-${q.id}`} className="grid gap-3">
                <AiBadge ai={ai[q.id]} />
                <div className="flex items-start gap-2">
                  <p id={`tq-${q.id}`} className="m-0 flex-1">
                    <b className="tabular">{i + 1}. </b>
                    <MathText text={q.text} />
                  </p>
                  <ReportQuestion target={{ code: q.id, source: "tutor", context: `sinaq-${n}` }} n={i + 1} className="-mt-2" />
                </div>
                {q.imageUrl && (
                  <Image
                    src={q.imageUrl}
                    alt={q.imageAlt ?? ""}
                    width={520}
                    height={360}
                    className="h-auto max-h-[280px] w-auto max-w-full justify-self-center rounded-md border border-line bg-white object-contain p-2"
                  />
                )}
                <FormAnswerFields name={`q-${q.id}`} legend={`${t.optionsLabel}: ${i + 1}`} q={q} />
              </Card>
            ))}
            <Button type="submit" block>
              {t.examSubmit}
            </Button>
          </form>
        )}
      </Page>
    </>
  );
}
