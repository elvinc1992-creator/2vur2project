"use client";

import Link from "next/link";
import { useState, useTransition } from "react";
import { ArrowIcon, BookIcon, BulbIcon, CheckCircleIcon, XCircleIcon } from "@/components/icons";
import { AnswerOptions } from "@/components/ui/answer-options";
import { Button, buttonClass } from "@/components/ui/button";
import { MathText } from "@/components/ui/math-text";
import { az } from "@/content/az";
import type { Letter } from "@/lib/demo/content";
import { answerReviewAction, type ReviewResult } from "@/lib/review/actions";
import { cn } from "@/lib/cn";

type Props = {
  n: number;
  kind: "mistake" | "similar";
  options: Record<Letter, string>;
  bookRef: string;
  last: boolean;
  initial: ReviewResult | null;
};

/** Təkrar sualı: cavab → düz/səhv (səhv düzəldildisə — qeyd) → həll → növbəti. */
export function ReviewAnswer({ n, kind, options, bookRef, last, initial }: Props) {
  const t = az.app.mistakes;
  const td = az.app.daily;
  const [selected, setSelected] = useState<Letter | null>(null);
  const [result, setResult] = useState<ReviewResult | null>(initial);
  const [pending, startTransition] = useTransition();

  const submit = (choice: Letter | "skip") =>
    startTransition(async () => {
      setResult(await answerReviewAction(n, choice));
    });

  const title = !result
    ? ""
    : result.correct
      ? result.fixedNow
        ? t.fixedNow
        : t.correctSimilar
      : result.chosen === "skip"
        ? td.skipped(result.answer)
        : kind === "mistake"
          ? t.wrongMistake(result.answer)
          : t.wrongSimilar(result.answer);

  return (
    <>
      <AnswerOptions
        name={`review-${n}`}
        label={td.optionsLabel}
        options={options}
        value={selected}
        onChange={setSelected}
        onClear={() => setSelected(null)}
        clearLabel={td.clearSelection}
        disabled={pending}
        feedback={result ? { answer: result.answer, chosen: result.chosen, correct: result.correct } : null}
      />

      {!result && (
        <>
          <Button
            type="button"
            block
            loading={pending}
            aria-disabled={!selected || undefined}
            onClick={() => selected && submit(selected)}
          >
            {td.check}
          </Button>
          <Button type="button" variant="ghost" block disabled={pending} onClick={() => submit("skip")}>
            {td.dontKnow}
          </Button>
        </>
      )}

      {result && (
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
              <b className={cn("block", result.correct ? "text-success-700" : "text-danger-700")}>{title}</b>
              {!result.correct && (result.chosen === "skip" ? t.skippedText : t.wrongText)}
            </div>
          </div>

          <div className="grid gap-2 rounded-2xl bg-navy-050 p-4">
            <div className="flex items-center gap-2 font-bold text-navy-900">
              <BulbIcon className="size-[22px]" />
              {td.solution}
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
              <span className="block text-small font-normal text-ink-muted">{td.bookCta}</span>
              {bookRef}
            </span>
          </div>

          <Link href={result.nextHref} className={buttonClass({ block: true })}>
            {last ? t.finish : t.next}
            <ArrowIcon className="size-[22px]" />
          </Link>
        </>
      )}
    </>
  );
}
