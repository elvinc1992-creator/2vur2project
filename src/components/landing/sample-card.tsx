"use client";

import Link from "next/link";
import { useState } from "react";
import { BookIcon, BulbIcon, PercentIcon } from "@/components/icons";
import { Freq, Tag, eyebrowClass, h3Class } from "@/components/ui/display";
import { MathText } from "@/components/ui/math-text";
import { az } from "@/content/az";
import { LETTERS, type Letter } from "@/lib/demo/content";
import { cn } from "@/lib/cn";

/**
 * Nümunə tapşırıq kartı (book_reference): sualın mətni yoxdur — yalnız istinad, A–E və həll metodu.
 * Düzgün cavab brauzerə göndərilmir; seçimdən sonra qeydiyyata dəvət edirik.
 */
export function SampleCard({ id }: { id: string }) {
  const t = az.landing.sample;
  const [picked, setPicked] = useState<Letter | null>(null);
  return (
    <article aria-label={t.aria} className="grid gap-4 rounded-lg border border-line bg-surface p-5 shadow-card lg:p-6">
      <div className="flex flex-wrap items-center justify-between gap-2">
        <Tag icon={<PercentIcon />}>{t.topic}</Tag>
        <Freq count={2} label={t.freq} />
      </div>
      <div className="grid gap-1">
        <span className={eyebrowClass}>{t.typeLabel}</span>
        <h3 className={h3Class}>{t.type}</h3>
      </div>
      <div className="flex items-center gap-2 rounded-md border border-line bg-navy-050 px-4 py-3.5 font-semibold text-navy-900">
        <BookIcon className="size-5 flex-none" />
        {t.ref}
      </div>
      <div className="grid gap-2">
        <span id={`${id}-label`} className="text-small text-ink-muted">
          {t.choose}
        </span>
        <div role="group" aria-labelledby={`${id}-label`} className="grid grid-cols-5 gap-2">
          {LETTERS.map((l) => (
            <button
              key={l}
              type="button"
              aria-label={t.answer(l)}
              aria-pressed={picked === l}
              onClick={() => setPicked(l)}
              className={cn(
                "grid min-h-14 cursor-pointer place-items-center rounded-md border-2 font-display text-xl font-extrabold",
                picked === l
                  ? "border-navy-900 bg-navy-900 text-white"
                  : "border-control-border bg-white text-navy-900 hover:border-navy-900 hover:bg-navy-050",
              )}
            >
              {l}
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
      <div className="grid gap-2 rounded-2xl bg-navy-050 p-4">
        <div className="flex items-center gap-2 font-bold text-navy-900">
          <BulbIcon className="size-[22px]" />
          {t.method}
        </div>
        <span className="justify-self-start rounded-[10px] border border-dashed border-navy-200 bg-white px-3 py-2 text-lg text-navy-900">
          <MathText text={t.formula} displayStyle />
        </span>
        <p className="text-small text-ink-muted">{t.methodText}</p>
      </div>
    </article>
  );
}
