"use client";

import { useEffect, useState } from "react";
import { cn } from "@/lib/cn";

type Tone = "exam" | "site";

const TONE: Record<Tone, { hover: string; letterHover: string }> = {
  exam: { hover: "hover:border-orange-500", letterHover: "group-hover:bg-orange-600 group-hover:text-white" },
  site: { hover: "hover:border-emerald-500", letterHover: "group-hover:bg-emerald-700 group-hover:text-white" },
};

/** A–E variantları: düzgün seçiləndə yaşıl, səhvdə qısa titrəyiş. Cavab serverdən gəlir (açıq məlumatdır). */
export function QuizOptions({
  options,
  correct,
  tone,
  label,
  rightText,
  wrongText,
}: {
  options: { letter: string; node: React.ReactNode }[];
  correct: string;
  tone: Tone;
  label: string;
  rightText: string;
  wrongText: string;
}) {
  const [solved, setSolved] = useState(false);
  const [wrong, setWrong] = useState<string | null>(null);
  const [tried, setTried] = useState<Set<string>>(new Set());

  useEffect(() => {
    if (!wrong) return;
    const id = setTimeout(() => setWrong(null), 900);
    return () => clearTimeout(id);
  }, [wrong]);

  const pick = (l: string) => {
    if (solved) return;
    if (l === correct) setSolved(true);
    else {
      setWrong(l);
      setTried((s) => new Set(s).add(l));
    }
  };

  return (
    <div className="grid gap-1.5">
      <ul role="list" aria-label={label} className="m-0 grid list-none grid-cols-1 gap-2 p-0 sm:grid-cols-2">
        {options.map(({ letter, node }) => {
          const isRight = solved && letter === correct;
          const isWrong = wrong === letter;
          return (
            <li key={letter}>
              <button
                type="button"
                onClick={() => pick(letter)}
                aria-disabled={solved}
                className={cn(
                  "group flex min-h-11 w-full cursor-pointer items-center gap-3 rounded-[14px] border-2 bg-white px-3.5 py-1.5 text-left text-[16px] transition-[border-color,background-color,transform] duration-200",
                  "focus-visible:outline-3 focus-visible:outline-offset-2 focus-visible:outline-navy-500",
                  isRight
                    ? "border-green-600 bg-green-50"
                    : isWrong
                      ? "animate-[shake_.35s] border-red-600 bg-red-50"
                      : cn("border-line", !solved && TONE[tone].hover),
                  solved && !isRight && "cursor-default opacity-70",
                  tried.has(letter) && !isWrong && !solved && "opacity-60",
                )}
              >
                <span
                  className={cn(
                    "grid size-[30px] flex-none place-items-center rounded-[9px] text-[14px] font-extrabold transition-colors",
                    isRight ? "bg-green-700 text-white" : isWrong ? "bg-red-700 text-white" : "bg-navy-050 text-ink-muted",
                    !isRight && !isWrong && !solved && TONE[tone].letterHover,
                  )}
                >
                  {letter}
                </span>
                <span className="min-w-0">{node}</span>
              </button>
            </li>
          );
        })}
      </ul>
      <p aria-live="polite" className={cn("m-0 min-h-[22px] text-[14px] font-bold", solved ? "text-green-700" : "text-red-700")}>
        {solved ? `🎉 ${rightText}` : wrong ? `❌ ${wrongText}` : ""}
      </p>
    </div>
  );
}

/** Proqres zolağı — səhifə açılanda 0-dan dolur. */
export function GrowBar({ value, label }: { value: number; label: string }) {
  const [w, setW] = useState(0);
  useEffect(() => {
    const id = setTimeout(() => setW(value), 150);
    return () => clearTimeout(id);
  }, [value]);
  return (
    <div
      role="progressbar"
      aria-label={label}
      aria-valuemin={0}
      aria-valuemax={100}
      aria-valuenow={Math.round(value)}
      className="h-3 overflow-hidden rounded-pill bg-white/25"
    >
      <span
        className="block h-full rounded-pill bg-white shadow-[0_0_12px_rgba(255,255,255,.8)] transition-[width] duration-[1400ms] ease-[cubic-bezier(.2,.8,.2,1)]"
        style={{ width: `${w}%` }}
      />
    </div>
  );
}
