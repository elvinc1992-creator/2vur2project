"use client";

import Link from "next/link";
import { useState, useTransition } from "react";
import { ArrowIcon, BookIcon, BulbIcon, CheckCircleIcon, XCircleIcon } from "@/components/icons";
import { AnswerOptions } from "@/components/ui/answer-options";
import { useAnswerMeta } from "@/components/ui/use-answer-meta";
import { Button, buttonClass } from "@/components/ui/button";
import { MathText } from "@/components/ui/math-text";
import { az } from "@/content/az";
import { answerDailyAction, type DailyResult } from "@/lib/demo/actions";
import type { Letter } from "@/lib/demo/content";
import { cn } from "@/lib/cn";

type Props = {
  id: string;
  options: Record<Letter, string>;
  refText: string;
  initial: DailyResult | null;
};

export function DailyAnswer({ id, options, refText, initial }: Props) {
  const t = az.app.daily;
  const [selected, setSelected] = useState<Letter | null>(null);
  const timing = useAnswerMeta();
  const [result, setResult] = useState<DailyResult | null>(initial);
  const [pending, startTransition] = useTransition();
  const answered = result !== null;

  const submit = (choice: Letter | "skip") =>
    startTransition(async () => {
      setResult(await answerDailyAction(id, choice, timing.meta()));
    });

  return (
    <>
      <AnswerOptions
        name={`ans-${id}`}
        label={t.optionsLabel}
        options={options}
        value={selected}
        onChange={(l) => {
          timing.track(l);
          setSelected(l);
        }}
        onClear={() => setSelected(null)}
        clearLabel={t.clearSelection}
        disabled={pending}
        feedback={result ? { answer: result.answer, chosen: result.chosen, correct: result.correct } : null}
      />

      {!answered && (
        <>
          <Button
            type="button"
            block
            loading={pending}
            aria-disabled={!selected || undefined}
            onClick={() => selected && submit(selected)}
          >
            {t.check}
          </Button>
          <Button type="button" variant="ghost" block disabled={pending} onClick={() => submit("skip")}>
            {t.dontKnow}
          </Button>
        </>
      )}

      {answered && (
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
                  : result.chosen === "skip"
                    ? t.skipped(result.answer)
                    : t.wrong(result.answer)}
              </b>
              {result.correct
                ? t.typeStats(result.stats.ok, result.stats.total)
                : result.chosen === "skip"
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
