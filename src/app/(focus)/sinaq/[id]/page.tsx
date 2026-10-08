import type { Metadata } from "next";
import { notFound, redirect } from "next/navigation";
import { Page, Topbar } from "@/components/app/topbar";
import { LockIcon } from "@/components/icons";
import { Button, ButtonLink } from "@/components/ui/button";
import { Card, FormatBar, h3Class } from "@/components/ui/display";
import { EmptyState } from "@/components/ui/empty-art";
import { az } from "@/content/az";
import { startExamAction } from "@/lib/demo/actions";
import { EXAM_FORMAT, EXAM_QUESTIONS, PRICE_PLACEHOLDER } from "@/lib/demo/content";
import { answeredCount, examStatus, findExam, remainingMs } from "@/lib/demo/logic";
import { requireDemo } from "@/lib/demo/session";
import { ExamRunner } from "./exam-runner";
import { ExpiredExam } from "./expired-exam";

export const metadata: Metadata = { title: az.app.nav.exams };

export default async function ExamPage(props: PageProps<"/sinaq/[id]">) {
  const { id } = await props.params;
  const exam = findExam(id);
  if (!exam) notFound();
  const { state } = await requireDemo(`/sinaq/${id}`);
  const status = examStatus(state, id);
  const t = az.app;

  if (status === "done") redirect(`/sinaq/${id}/netice`);

  if (status === "locked" || status === "purchased") {
    const { closed, coded, written } = EXAM_FORMAT;
    return (
      <>
        <Topbar title={exam.title} back="/sinaqlar" />
        <Page narrow>
          {status === "locked" ? (
            <>
              <EmptyState icon={<LockIcon />} title={exam.title}>
                {t.exam.locked}
              </EmptyState>
              <ButtonLink href={`/odenis?exam=${id}`} variant="primary" block>
                {t.store.buy(PRICE_PLACEHOLDER)}
              </ButtonLink>
            </>
          ) : (
            <Card className="grid gap-4">
              <span className="text-small text-ink-muted">{exam.group}</span>
              <h1 className={h3Class}>{exam.title}</h1>
              <p className="text-ink-muted">
                {t.store.questions(EXAM_QUESTIONS.length)} · {t.store.minutes(exam.durationMin)}
              </p>
              <FormatBar closed={closed} coded={coded} written={written} label={t.store.format(closed, coded, written)} />
              <p className="text-small text-ink-muted">{t.store.format(closed, coded, written)}</p>
              <p className="rounded-md bg-navy-050 p-3 text-small text-ink">{t.exam.pausedNote}</p>
              <form action={startExamAction.bind(null, id)}>
                <Button type="submit" block>
                  {t.store.start}
                </Button>
              </form>
            </Card>
          )}
        </Page>
      </>
    );
  }

  const attempt = state.attempts[id];
  // Vaxt bitib — sınaq aktiv deyil, davam etmək olmur.
  if (status === "expired") return <ExpiredExam examId={id} answered={answeredCount(attempt)} />;

  return (
    <ExamRunner
      exam={exam}
      questions={EXAM_QUESTIONS}
      initialAnswers={attempt.answers}
      initialFlags={attempt.flags}
      remaining={remainingMs(attempt, exam)}
    />
  );
}
