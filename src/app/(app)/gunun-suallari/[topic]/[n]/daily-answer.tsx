"use client";

import Link from "next/link";
import { useState, useTransition } from "react";
import { ArrowIcon, BookIcon, BulbIcon, CheckCircleIcon, XCircleIcon } from "@/components/icons";
import { BankAnswerInput, canSubmit, SelfGrade, type BankQuestionShape } from "@/components/ui/bank-answer";
import { useAnswerMeta } from "@/components/ui/use-answer-meta";
import { Button, buttonClass } from "@/components/ui/button";
import { MathText } from "@/components/ui/math-text";
import { az } from "@/content/az";
import { SELF_NO, SELF_OK, SELF_PENDING, SKIP } from "@/lib/bank/check";
import { answerDailyAction, type DailyResult } from "@/lib/demo/actions";
import { cn } from "@/lib/cn";

type Props = {
  id: string;
  q: BankQuestionShape;
  refText: string;
  initial: DailyResult | null;
};

export function DailyAnswer({ id, q, refText, initial }: Props) {
  const t = az.app.daily;
  const [value, setValue] = useState("");
  const timing = useAnswerMeta();
  const [result, setResult] = useState<DailyResult | null>(initial);
  const [pending, startTransition] = useTransition();
  const answered = result !== null;
  const ready = canSubmit(q, value);

  const submit = (choice: string) =>
    startTransition(async () => {
      setResult(await answerDailyAction(id, choice, timing.meta()));
    });

  return (
    <>
      <BankAnswerInput
        name={`ans-${id}`}
        q={q}
        value={value}
        onChange={(v) => {
          if (q.format !== "open" && q.format !== "written") timing.track(v);
          setValue(v);
        }}
        onClear={() => setValue("")}
        disabled={pending}
        feedback={result && !result.pendingSelf ? result : null}
      />

      {!answered && (
        <>
          <Button
            type="button"
            block
            loading={pending}
            aria-disabled={!ready || undefined}
            onClick={() => ready && submit(q.selfCheck ? SELF_PENDING : value.trim())}
          >
            {q.selfCheck ? az.app.answer.selfReveal : t.check}
          </Button>
          {!q.selfCheck && (
            <Button type="button" variant="ghost" block disabled={pending} onClick={() => submit(SKIP)}>
              {t.dontKnow}
            </Button>
          )}
        </>
      )}

      {answered && result.pendingSelf && (
        <SelfGrade steps={result.steps} pending={pending} onGrade={(ok) => submit(ok ? SELF_OK : SELF_NO)} />
      )}

      {answered && !result.pendingSelf && (
        <>
          <div
            role="status"
            className={cn(
              "flex items-start gap-3 rounded-md px-4 py-3.5 text-[15px] leading-[22px]",
              result.correct ? "bg-success-100 text-success-700" : "bg-danger-100 text-danger-700",
            )}
          >
            {result.correct ? (
              <CheckCircleIcon className="size-[22px] flex-none" />
            ) : (
              <XCircleIcon className="size-[22px] flex-none" />
            )}
            <div className="text-ink">
              <b className={cn("block", result.correct ? "text-success-700" : "text-danger-700")}>
                {result.correct
                  ? t.correct
                  : result.selfCheck
                    ? az.app.answer.selfWrong
                    : result.chosen === SKIP
                      ? t.skipped(result.answerText)
                      : t.wrong(result.answerText)}
              </b>
              {result.correct
                ? t.typeStats(result.stats.ok, result.stats.total)
                : result.chosen === SKIP
                  ? t.skippedText
                  : t.wrongText}
            </div>
          </div>

          {!result.correct && (
            <p className="text-small text-ink-muted">
              {az.app.mistakes.added}{" "}
              <Link href="/sehvlerim" className="font-semibold text-navy-500 underline underline-offset-3">
                {az.app.mistakes.open}
              </Link>
            </p>
          )}

          <div className="grid gap-2 rounded-2xl bg-navy-050 p-4">
            <div className="flex items-center gap-2 font-bold text-navy-900">
              <BulbIcon className="size-[22px]" />
              {t.solution}
            </div>
            <ol className="m-0 grid gap-1 pl-5 text-small">
              {result.steps.map((s, i) => (
                <li key={i}>
                  <MathText text={s} />
                </li>
              ))}
            </ol>
          </div>

          <div className="flex items-center gap-2 rounded-lg border border-line bg-white px-4 py-3.5 font-semibold text-navy-900">
            <BookIcon className="size-[22px] flex-none" />
            <span className="flex-1">
              <span className="block text-small font-normal text-ink-muted">{t.bookCta}</span>
              {refText}
            </span>
          </div>

          <Link href={result.nextHref ?? "/gunun-suallari"} className={buttonClass({ block: true })}>
            {t.next}
            <ArrowIcon className="size-[22px]" />
          </Link>
        </>
      )}
    </>
  );
}
