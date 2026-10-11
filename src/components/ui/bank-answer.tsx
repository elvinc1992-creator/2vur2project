"use client";

import { CheckCircleIcon, XCircleIcon } from "@/components/icons";
import { AnswerOptions } from "@/components/ui/answer-options";
import { Button } from "@/components/ui/button";
import { MathText } from "@/components/ui/math-text";
import { answerHeadClass } from "@/components/ui/question";
import { az } from "@/content/az";
import {
  decodeMatching,
  encodeMatching,
  MAX_TEXT_ANSWER,
  type AnswerFeedback,
  type MatchingOptions,
  type PracticeFormat,
} from "@/lib/bank/check";
import { cn } from "@/lib/cn";
import type { Letter } from "@/lib/demo/content";

export type BankQuestionShape = {
  format: PracticeFormat;
  options?: Record<Letter, string>;
  matching?: MatchingOptions;
  selfCheck?: boolean;
};

type Props = {
  name: string;
  q: BankQuestionShape;
  value: string;
  onChange: (v: string) => void;
  onClear: () => void;
  disabled?: boolean;
  feedback: AnswerFeedback | null;
};

const ta = az.app.answer;
const td = az.app.daily;

/** Cavab göndərilə bilərmi (boş deyil). Özünüyoxlamada — həmişə ("Həllə bax"). */
export const canSubmit = (q: BankQuestionShape, value: string) =>
  q.selfCheck ? true : q.format === "matching" ? Object.values(decodeMatching(value)).some((v) => v.length) : value.trim() !== "";

/**
 * Bank sualının cavab sahəsi — formata görə: A–E variantları, ədəd sahəsi, uyğunluq cədvəli
 * və ya isbat tapşırığı üçün izah (özünüyoxlama).
 */
export function BankAnswerInput({ name, q, value, onChange, onClear, disabled, feedback }: Props) {
  if (q.format === "closed" && q.options) {
    return (
      <AnswerOptions
        name={name}
        label={td.optionsLabel}
        options={q.options}
        value={(value || null) as Letter | null}
        onChange={onChange}
        onClear={onClear}
        clearLabel={td.clearSelection}
        disabled={disabled}
        feedback={
          feedback ? { answer: feedback.answer as Letter, chosen: feedback.chosen as Letter | "skip", correct: feedback.correct } : null
        }
      />
    );
  }
  if (q.selfCheck) {
    return (
      <div role="note" className="grid gap-1 rounded-2xl border border-dashed border-navy-200 bg-white p-4">
        <span className={answerHeadClass}>{ta.selfTitle}</span>
        <p className="text-small text-ink-muted">{ta.selfText}</p>
      </div>
    );
  }
  if (q.format === "matching" && q.matching) {
    return <MatchingInput name={name} matching={q.matching} value={value} onChange={onChange} disabled={disabled} feedback={feedback} />;
  }
  return <OpenInput name={name} value={value} onChange={onChange} disabled={disabled} feedback={feedback} />;
}

function OpenInput({
  name,
  value,
  onChange,
  disabled,
  feedback,
}: Pick<Props, "name" | "value" | "onChange" | "disabled" | "feedback">) {
  const id = `${name}-open`;
  const shown = feedback ? (feedback.chosen === "skip" ? "" : feedback.chosen) : value;
  return (
    <div className="grid gap-1.5">
      <label htmlFor={id} className={answerHeadClass}>
        {feedback ? ta.yourAnswer : ta.openLabel}
      </label>
      <input
        id={id}
        type="text"
        inputMode="text"
        autoComplete="off"
        maxLength={MAX_TEXT_ANSWER}
        value={shown}
        placeholder={feedback ? "—" : ta.openPlaceholder}
        disabled={disabled || Boolean(feedback)}
        aria-describedby={`${id}-hint`}
        onChange={(e) => onChange(e.target.value)}
        className={cn(
          "min-h-14 w-full max-w-sm rounded-md border-[1.5px] bg-white px-4 font-display text-xl font-extrabold text-navy-900",
          "focus-visible:outline-3 focus-visible:outline-offset-2 focus-visible:outline-navy-500",
          feedback
            ? feedback.correct
              ? "border-success-700 bg-success-100 text-success-700"
              : "border-danger-700 bg-danger-100 text-danger-700"
            : "border-control-border",
        )}
      />
      {!feedback && (
        <p id={`${id}-hint`} className="text-small text-ink-muted">
          {ta.openHint}
        </p>
      )}
    </div>
  );
}

function MatchingInput({
  name,
  matching,
  value,
  onChange,
  disabled,
  feedback,
}: Pick<Props, "name" | "value" | "onChange" | "disabled" | "feedback"> & { matching: MatchingOptions }) {
  const sel = decodeMatching(feedback ? feedback.chosen : value);
  const right = feedback ? decodeMatching(feedback.answer) : null;
  const locked = disabled || Boolean(feedback);
  const toggle = (k: string, l: string) => {
    const cur = sel[k] ?? [];
    const next = Object.fromEntries(matching.left.map((x) => [x.key, sel[x.key] ?? []]));
    next[k] = cur.includes(l) ? cur.filter((x) => x !== l) : [...cur, l];
    onChange(encodeMatching(next));
  };

  return (
    <div className="grid gap-3">
      <div className="grid gap-0.5">
        <span className={answerHeadClass}>{ta.matchingTitle}</span>
        {!feedback && <span className="text-small text-ink-muted">{ta.matchingHint}</span>}
      </div>
      <ul className="m-0 grid list-none gap-1.5 rounded-md bg-navy-050 p-3 text-small">
        {matching.right.map((r) => (
          <li key={r.key} className="flex gap-2">
            <b className="text-navy-900">{r.key})</b>
            <MathText text={r.text} />
          </li>
        ))}
      </ul>
      {matching.left.map((item) => (
        <fieldset key={item.key} className="m-0 grid min-w-0 gap-2 rounded-md border border-line bg-white p-3" disabled={locked}>
          <legend className="sr-only">{ta.matchingItem(item.key)}</legend>
          <p className="m-0 flex gap-2 font-semibold text-navy-900">
            <b>{item.key}.</b>
            <MathText text={item.text} />
          </p>
          <div className="flex flex-wrap gap-2">
            {matching.right.map((r) => {
              const on = (sel[item.key] ?? []).includes(r.key);
              const isRight = right ? (right[item.key] ?? []).includes(r.key) : false;
              return (
                <label
                  key={r.key}
                  className={cn(
                    "grid size-11 place-items-center rounded-[10px] border-[1.5px] font-display text-base font-extrabold",
                    "has-focus-visible:outline-3 has-focus-visible:outline-offset-2 has-focus-visible:outline-navy-500",
                    locked ? "cursor-default" : "cursor-pointer hover:border-navy-900",
                    feedback
                      ? isRight
                        ? "border-success-700 bg-success-100 text-success-700"
                        : on
                          ? "border-danger-700 bg-danger-100 text-danger-700"
                          : "border-line bg-white text-navy-200"
                      : on
                        ? "border-navy-900 bg-navy-900 text-white"
                        : "border-control-border bg-white text-navy-900",
                  )}
                >
                  <input
                    type="checkbox"
                    name={`${name}-${item.key}`}
                    value={r.key}
                    className="sr-only"
                    checked={on}
                    onChange={() => toggle(item.key, r.key)}
                    aria-label={ta.matchingPick(item.key, r.key)}
                  />
                  {r.key}
                </label>
              );
            })}
          </div>
        </fieldset>
      ))}
    </div>
  );
}

/** İsbat tapşırığı: həll göstərildikdən sonra şagird özünü qiymətləndirir. */
export function SelfGrade({ steps, pending, onGrade }: { steps: string[]; pending: boolean; onGrade: (ok: boolean) => void }) {
  return (
    <>
      <div className="grid gap-2 rounded-2xl bg-navy-050 p-4">
        <span className="font-bold text-navy-900">{td.solution}</span>
        <ol className="m-0 grid gap-1 pl-5 text-small">
          {steps.map((s, i) => (
            <li key={i}>
              <MathText text={s} />
            </li>
          ))}
        </ol>
      </div>
      <p className="font-semibold text-navy-900">{ta.selfAsk}</p>
      <div className="grid gap-2 md:grid-cols-2">
        <Button type="button" disabled={pending} onClick={() => onGrade(true)}>
          <CheckCircleIcon />
          {ta.selfOk}
        </Button>
        <Button type="button" variant="secondary" disabled={pending} onClick={() => onGrade(false)}>
          <XCircleIcon />
          {ta.selfNo}
        </Button>
      </div>
    </>
  );
}
