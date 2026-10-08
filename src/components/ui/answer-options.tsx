"use client";

import { useEffect, useRef, type KeyboardEvent } from "react";
import { CheckCircleIcon, CloseIcon, XCircleIcon } from "@/components/icons";
import { MathText } from "@/components/ui/math-text";
import { answerHeadClass } from "@/components/ui/question";
import { az } from "@/content/az";
import { LETTERS, type Letter } from "@/lib/demo/content";
import { cn } from "@/lib/cn";
import { latexToText } from "@/lib/math";

type Feedback = { answer: Letter; chosen: Letter | "skip"; correct: boolean };

type Props = {
  name: string;
  label: string;
  options: Record<Letter, string>;
  value: Letter | null;
  onChange: (l: Letter) => void;
  /** Cavabdan sonra (günün sualı): düzgün/yanlış göstərilir, seçim bağlanır. */
  feedback?: Feedback | null;
  disabled?: boolean;
  /** Seçimi ləğv etmək (sual yenidən cavabsız qalır). Verilməyibsə, düymə göstərilmir. */
  onClear?: () => void;
  clearLabel?: string;
};

const isTyping = (el: EventTarget | null) =>
  el instanceof HTMLElement &&
  (el.tagName === "TEXTAREA" ||
    el.isContentEditable ||
    (el.tagName === "INPUT" && (el as HTMLInputElement).type !== "radio"));

/**
 * A–E variantları: role="radiogroup", ox düymələri (native radio), Space/Enter ilə seçim,
 * A–E klavişləri qısayol kimi (fokus mətn sahəsində olmayanda).
 */
export function AnswerOptions({
  name,
  label,
  options,
  value,
  onChange,
  feedback,
  disabled,
  onClear,
  clearLabel,
}: Props) {
  const t = az.app.daily;
  const locked = Boolean(feedback) || disabled;
  const onChangeRef = useRef(onChange);
  useEffect(() => {
    onChangeRef.current = onChange;
  });

  useEffect(() => {
    if (locked) return;
    const onKey = (e: globalThis.KeyboardEvent) => {
      if (e.metaKey || e.ctrlKey || e.altKey || isTyping(e.target)) return;
      const l = e.key.toUpperCase() as Letter;
      if ((LETTERS as readonly string[]).includes(l)) {
        e.preventDefault();
        onChangeRef.current(l);
        document.getElementById(`${name}-${l}`)?.focus();
      }
    };
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [locked, name]);

  const clear = () => {
    if (!onClear) return;
    onClear();
    // Düymə yox olur — fokusu variantlara qaytarırıq.
    requestAnimationFrame(() => document.getElementById(`${name}-A`)?.focus());
  };

  const onEnter = (e: KeyboardEvent<HTMLInputElement>, l: Letter) => {
    if (e.key === "Enter") {
      e.preventDefault();
      onChange(l);
    }
    // Delete / Backspace — seçilmiş cavabı sil.
    if ((e.key === "Delete" || e.key === "Backspace") && onClear && value) {
      e.preventDefault();
      clear();
    }
  };

  return (
    <div className="grid gap-2.5">
      <div className="flex flex-wrap items-baseline gap-x-2 gap-y-0.5">
        <span id={`${name}-head`} className={answerHeadClass}>
          {t.optionsTitle}
        </span>
        {!feedback && <span className="text-small text-ink-muted">{t.optionsHint}</span>}
      </div>
      <div
        role="radiogroup"
        aria-label={label}
        aria-disabled={locked || undefined}
        className="grid gap-2"
      >
        {LETTERS.map((l) => {
          const isAnswer = feedback?.answer === l;
          const isWrong = feedback && feedback.chosen === l && !feedback.correct;
          const selected = !feedback && value === l;
          const plain = latexToText(options[l]);
          return (
            <label
              key={l}
              className={cn(
                "grid min-h-14 grid-cols-[auto_minmax(0,1fr)_auto] items-center gap-3 rounded-md border-[1.5px] px-3 py-2 transition-colors md:px-4",
                "has-focus-visible:outline-3 has-focus-visible:outline-offset-2 has-focus-visible:outline-navy-500",
                locked ? "cursor-default" : "cursor-pointer",
                isAnswer && "border-success-700 bg-success-100 text-success-700 ring-1 ring-success-700 ring-inset",
                isWrong && "border-danger-700 bg-danger-100 text-danger-700 ring-1 ring-danger-700 ring-inset",
                selected && "border-navy-900 bg-navy-050 text-navy-900 ring-1 ring-navy-900 ring-inset",
                !isAnswer && !isWrong && !selected && "border-control-border bg-white text-navy-900",
                !locked && !selected && "hover:border-navy-900 hover:bg-navy-050",
                feedback && !isAnswer && !isWrong && "opacity-60",
              )}
            >
              <input
                id={`${name}-${l}`}
                type="radio"
                name={name}
                value={l}
                className="sr-only"
                checked={feedback ? feedback.chosen === l : value === l}
                disabled={locked}
                onChange={() => onChange(l)}
                onKeyDown={(e) => onEnter(e, l)}
                aria-label={t.option(l, plain)}
              />
              <span
                aria-hidden="true"
                className={cn(
                  "grid size-9 place-items-center rounded-[10px] font-display text-base font-extrabold",
                  isAnswer
                    ? "bg-success-700 text-white"
                    : isWrong
                      ? "bg-danger-700 text-white"
                      : selected
                        ? "bg-navy-900 text-white"
                        : "bg-navy-100 text-navy-900",
                )}
              >
                {l}
              </span>
              <span aria-hidden="true" className="text-[17px] leading-6 font-semibold [overflow-wrap:anywhere]">
                <MathText text={options[l]} displayStyle />
              </span>
              {/* Sağda radio göstəricisi; cavabdan sonra — düz / səhv ikonu */}
              <span aria-hidden="true" className="grid size-6 place-items-center">
                {isAnswer ? (
                  <CheckCircleIcon className="size-6" />
                ) : isWrong ? (
                  <XCircleIcon className="size-6" />
                ) : feedback ? null : (
                  <span
                    className={cn(
                      "grid size-5 place-items-center rounded-full border-2 bg-white",
                      selected ? "border-navy-900" : "border-control-border",
                    )}
                  >
                    {selected && <i className="block size-2.5 rounded-full bg-navy-900" />}
                  </span>
                )}
              </span>
            </label>
          );
        })}
      </div>
      {!feedback && (
        <div className="flex min-h-11 flex-wrap items-center gap-x-3 gap-y-1 text-small text-ink-muted">
          <span>
            {value ? (
              <>
                {t.selectedLabel} <b className="font-display text-base font-extrabold text-navy-900">{value}</b>
              </>
            ) : (
              t.selectedNone
            )}
          </span>
          {onClear && !locked && value && (
            <button
              type="button"
              onClick={clear}
              className="inline-flex min-h-11 cursor-pointer items-center gap-1.5 rounded-[12px] px-2.5 text-[15px] font-semibold text-navy-900 hover:bg-navy-100"
            >
              <CloseIcon className="size-5" />
              {clearLabel}
            </button>
          )}
        </div>
      )}
    </div>
  );
}
