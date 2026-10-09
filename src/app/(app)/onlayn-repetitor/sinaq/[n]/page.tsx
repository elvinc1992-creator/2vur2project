import type { Metadata } from "next";
import { notFound, redirect } from "next/navigation";
import { Page, Topbar } from "@/components/app/topbar";
import { CheckCircleIcon, XCircleIcon } from "@/components/icons";
import { Button, ButtonLink } from "@/components/ui/button";
import { Card, h1Class } from "@/components/ui/display";
import { MathText } from "@/components/ui/math-text";
import { az } from "@/content/az";
import { cn } from "@/lib/cn";
import { LETTERS } from "@/lib/demo/content";
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
  const keys = record ? await getRepetitorKeys(exam.questionIds) : null;
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
                const answer = keys.get(q.id)?.answer ?? "";
                return (
                  <li key={q.id}>
                    <Card className="grid gap-2">
                      <p className="m-0">
                        <b className="tabular">{i + 1}. </b>
                        <MathText text={q.text} />
                      </p>
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
                              {t.examYour(given)}: <MathText text={q.options[given]} />
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
                <p id={`tq-${q.id}`} className="m-0">
                  <b className="tabular">{i + 1}. </b>
                  <MathText text={q.text} />
                </p>
                <fieldset className="m-0 grid min-w-0 gap-2 border-0 p-0 sm:grid-cols-5">
                  <legend className="sr-only">
                    {t.optionsLabel}: {i + 1}
                  </legend>
                  {LETTERS.map((l) => (
                    <label
                      key={l}
                      className={cn(
                        "flex min-h-12 cursor-pointer items-center gap-2 rounded-md border-[1.5px] px-3 py-2",
                        "border-control-border bg-white text-navy-900 has-checked:border-navy-900 has-checked:bg-navy-900 has-checked:text-white",
                        "has-focus-visible:outline-3 has-focus-visible:outline-offset-2 has-focus-visible:outline-navy-500",
                      )}
                    >
                      <input type="radio" name={`q-${q.id}`} value={l} className="sr-only" />
                      <b>{l})</b>
                      <MathText text={q.options[l]} />
                    </label>
                  ))}
                </fieldset>
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
