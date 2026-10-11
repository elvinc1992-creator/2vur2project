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
import { answerRepetitorAction, repetitorHintAction, type RepetitorResult } from "@/lib/repetitor/actions";
import { cn } from "@/lib/cn";

type Props = {
  id: string;
  q: BankQuestionShape;
  refText: string;
  statsHref: string;
  /** Bankdakı sualın ipucu yoxdursa, düymə göstərilmir. */
  hasHint: boolean;
  initialHint: string | null;
  initial: RepetitorResult | null;
};

/** Repetitor rejimi: ipucu (istəyəndə) → cavab → addım-addım izah → növbəti sual. */
export function TutorAnswer({ id, q, refText, statsHref, hasHint, initialHint, initial }: Props) {
  const t = az.app.tutor;
  const [value, setValue] = useState("");
  const timing = useAnswerMeta();
  const [hint, setHint] = useState<string | null>(initialHint);
  const [result, setResult] = useState<RepetitorResult | null>(initial);
  const [pending, startTransition] = useTransition();
  const [hintPending, startHint] = useTransition();
  const answered = result !== null;
  const ready = canSubmit(q, value);

  const submit = (choice: string) =>
    startTransition(async () => {
      setResult(await answerRepetitorAction(id, choice, timing.meta()));
    });
  const askHint = () =>
    startHint(async () => {
      setHint(await repetitorHintAction(id));
    });

  return (
    <>
      <BankAnswerInput
        name={`tutor-${id}`}
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

      {hint && (
        <div role="note" className="grid gap-1.5 rounded-2xl border border-dashed border-navy-200 bg-white p-4">
          <span className="flex items-center gap-2 font-bold text-navy-900">
            <BulbIcon className="size-[22px] text-coral-600" />
            {t.hintTitle}
          </span>
          <p className="text-small">
            <MathText text={hint} />
          </p>
        </div>
      )}

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
          <div className={cn("grid gap-2", hasHint && "md:grid-cols-2")}>
            {hasHint && (
              <Button
                type="button"
                variant="secondary"
                disabled={pending || Boolean(hint)}
                loading={hintPending}
                onClick={askHint}
              >
                <BulbIcon />
                {t.hint}
              </Button>
            )}
            {!q.selfCheck && (
              <Button type="button" variant="ghost" disabled={pending} onClick={() => submit(SKIP)}>
                {t.dontKnow}
              </Button>
            )}
          </div>
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
              {result.correct ? t.correctText(result.hintUsed) : result.chosen === SKIP ? t.skippedText : t.wrongText}
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
              {t.explain}
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
          <Link href={statsHref} className="justify-self-start text-small font-semibold text-navy-500 underline underline-offset-3">
            {t.topicStats}
          </Link>

          <Link href={result.nextHref ?? "/onlayn-repetitor"} className={buttonClass({ block: true })}>
            {result.nextHref ? t.next : t.toOverview}
            <ArrowIcon className="size-[22px]" />
          </Link>
        </>
      )}
    </>
  );
}
