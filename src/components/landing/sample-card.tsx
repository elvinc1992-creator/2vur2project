"use client";

import Link from "next/link";
import { useState } from "react";
import { BookIcon, PercentIcon } from "@/components/icons";
import { Tag, eyebrowClass, h3Class } from "@/components/ui/display";
import { MathText } from "@/components/ui/math-text";
import { az } from "@/content/az";
import { LETTERS, type Letter } from "@/lib/demo/content";
import { cn } from "@/lib/cn";

export type SampleQuestion = {
  topic: string;
  type: string;
  text: string;
  options: Record<Letter, string>;
  ref: string;
};

/**
 * Nümunə tapşırıq: saytın sual bankından real sual (A–E). Düzgün cavab brauzerə göndərilmir;
 * seçimdən sonra qeydiyyata dəvət edirik.
 */
export function SampleCard({ id, q }: { id: string; q: SampleQuestion | null }) {
  const t = az.landing.sample;
  const [picked, setPicked] = useState<Letter | null>(null);
  if (!q) return null;
  return (
    <article aria-label={t.aria} className="grid gap-4 rounded-lg border border-line bg-surface p-5 shadow-card lg:p-6">
      <div className="flex flex-wrap items-center justify-between gap-2">
        <Tag icon={<PercentIcon />}>{q.topic}</Tag>
      </div>
      <div className="grid gap-1">
        <span className={eyebrowClass}>{t.typeLabel}</span>
        <h3 className={h3Class}>{q.type}</h3>
      </div>
      <p className="m-0 text-[17px] leading-[1.6] text-ink">
        <MathText text={q.text} />
      </p>
      <div className="grid gap-2">
        <span id={`${id}-label`} className="text-small text-ink-muted">
          {t.choose}
        </span>
        <div role="group" aria-labelledby={`${id}-label`} className="grid gap-2 sm:grid-cols-2">
          {LETTERS.map((l) => (
            <button
              key={l}
              type="button"
              aria-label={`${t.answer(l)}: ${q.options[l].replace(/\$/g, "")}`}
              aria-pressed={picked === l}
              onClick={() => setPicked(l)}
              className={cn(
                "flex min-h-12 cursor-pointer items-center gap-2.5 rounded-md border-2 px-3 text-left",
                picked === l
                  ? "border-navy-900 bg-navy-900 text-white"
                  : "border-control-border bg-white text-navy-900 hover:border-navy-900 hover:bg-navy-050",
              )}
            >
              <b className="font-display text-lg font-extrabold">{l}</b>
              <MathText text={q.options[l]} displayStyle />
            </button>
          ))}
        </div>
        <p role="status" className="min-h-5 text-small">
          {picked && (
            <>
              <b className="text-navy-900">{t.picked(picked)}</b>{" "}
              <Link href="/qeydiyyat">{t.pickedCta}</Link>
            </>
          )}
        </p>
      </div>
      {q.ref && (
        <div className="flex items-center gap-2 rounded-md border border-line bg-navy-050 px-4 py-3 text-small font-semibold text-navy-900">
          <BookIcon className="size-5 flex-none" />
          {q.ref}
        </div>
      )}
    </article>
  );
}
