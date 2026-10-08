"use client";

import { useState } from "react";
import { MinusIcon, PlusIcon, RetryIcon } from "@/components/icons";
import { Button } from "@/components/ui/button";
import { Card, Meter, Tag, h3Class } from "@/components/ui/display";
import { answerHeadClass } from "@/components/ui/question";
import { az } from "@/content/az";
import { cn } from "@/lib/cn";
import { SIMULATORS, simulateScore, type ScoreSectionId, type ScoreValues } from "@/lib/score/simulators";

const t = az.app.score;

/** Bal simulyatoru: imtahan növü → bölmələr üzrə düzgün cavab sayı → təxmini bal (dərhal). */
export function Simulator() {
  const [simId, setSimId] = useState(SIMULATORS[0].id);
  const [values, setValues] = useState<ScoreValues>({});
  const sim = SIMULATORS.find((s) => s.id === simId)!;
  const result = simulateScore(sim, values);
  const set = (id: ScoreSectionId, v: number) => setValues((prev) => ({ ...prev, [id]: v }));

  return (
    <div className="grid gap-6">
      <fieldset className="m-0 grid min-w-0 gap-2 border-0 p-0">
        <legend className={cn(answerHeadClass, "mb-2 p-0")}>{t.kindLabel}</legend>
        <div className="grid gap-2 md:grid-cols-3">
          {SIMULATORS.map((s) => (
            <label
              key={s.id}
              className={cn(
                "flex min-h-[52px] items-center justify-between gap-2 rounded-md border-[1.5px] px-4 py-2 font-bold",
                "has-focus-visible:outline-3 has-focus-visible:outline-offset-2 has-focus-visible:outline-navy-500",
                s.available
                  ? "cursor-pointer border-control-border bg-white text-navy-900 has-checked:border-navy-900 has-checked:bg-navy-900 has-checked:text-white"
                  : "cursor-not-allowed border-line bg-navy-050 text-ink-muted",
              )}
            >
              <input
                type="radio"
                name="sim-kind"
                value={s.id}
                checked={simId === s.id}
                disabled={!s.available}
                onChange={() => setSimId(s.id)}
                className="sr-only"
              />
              {s.label}
              {!s.available && <Tag tone="lock">{t.soon}</Tag>}
            </label>
          ))}
        </div>
      </fieldset>

      {sim.available && (
        // Mobil: bal həmişə görünsün (yuxarı panelin altında yapışqan zolaq). Ekran oxuyucu üçün — nəticə kartı.
        <div
          aria-hidden="true"
          className="sticky top-[72px] z-[9] -mx-4 -my-3 flex items-center justify-between gap-3 bg-navy-900 px-4 py-2.5 text-white shadow-card lg:hidden"
        >
          <span className="text-small font-semibold text-on-navy-muted">{t.resultTitle}</span>
          <span className="font-display text-xl leading-7 font-extrabold tabular">
            {result.score} <span className="text-small font-semibold text-on-navy-muted">/ {result.max}</span>
          </span>
        </div>
      )}

      {sim.available ? (
        <div className="grid items-start gap-6 lg:grid-cols-[minmax(0,1fr)_340px]">
          <div className="grid gap-3">
            {result.rows.map((row) => {
              const label = t.sections[row.id];
              const id = `score-${row.id}`;
              return (
                <Card key={row.id} className="grid gap-3 p-4! lg:p-5!">
                  <div className="flex flex-wrap items-baseline justify-between gap-x-3 gap-y-1">
                    <label htmlFor={id} className={h3Class}>
                      {label}
                    </label>
                    <span className="text-small text-ink-muted tabular">{t.points(row.score)}</span>
                  </div>
                  <div className="flex items-center gap-2">
                    <Button
                      type="button"
                      variant="secondary"
                      size="sm"
                      aria-label={t.dec(label)}
                      disabled={row.correct <= 0}
                      onClick={() => set(row.id, row.correct - 1)}
                      className="size-12 px-0!"
                    >
                      <MinusIcon />
                    </Button>
                    <input
                      id={id}
                      type="number"
                      inputMode="numeric"
                      min={0}
                      max={row.max}
                      step={1}
                      value={row.correct}
                      aria-label={t.inputLabel(label, row.max)}
                      onChange={(e) => set(row.id, Number(e.target.value))}
                      className="h-12 w-20 [appearance:textfield] rounded-md border-[1.5px] [&::-webkit-inner-spin-button]:appearance-none [&::-webkit-outer-spin-button]:appearance-none border-control-border bg-white text-center font-display text-xl font-extrabold text-navy-900 tabular focus:border-navy-500 focus-visible:ring-2 focus-visible:ring-navy-500 focus-visible:ring-offset-2 focus-visible:outline-none"
                    />
                    <Button
                      type="button"
                      variant="secondary"
                      size="sm"
                      aria-label={t.inc(label)}
                      disabled={row.correct >= row.max}
                      onClick={() => set(row.id, row.correct + 1)}
                      className="size-12 px-0!"
                    >
                      <PlusIcon />
                    </Button>
                    <span className="text-ink-muted tabular">{t.correctOf(row.max)}</span>
                  </div>
                  <Meter value={Math.round((row.correct / row.max) * 100)} label={label} tone="navy" />
                </Card>
              );
            })}
          </div>

          <Card tone="navy" className="grid gap-3 lg:sticky lg:top-24">
            <span className="text-caption font-bold tracking-[0.06em] text-on-navy-muted uppercase">{t.resultTitle}</span>
            <p aria-live="polite" className="m-0">
              <span className="sr-only">{t.resultSr(result.score, result.max)}</span>
              <span aria-hidden="true" className="font-display text-[56px] leading-[60px] font-extrabold text-white tabular">
                {result.score}
              </span>
              <span aria-hidden="true" className="ml-1 text-lead text-on-navy-muted tabular">
                / {result.max}
              </span>
            </p>
            <div className="h-2.5 overflow-hidden rounded-pill bg-white/20" aria-hidden="true">
              <i
                className="block h-full rounded-pill bg-coral-500"
                style={{ width: `${result.max ? (result.score / result.max) * 100 : 0}%` }}
              />
            </div>
            <p className="text-small text-on-navy-muted">{t.demoFormula(sim.sections[0]?.points ?? 0)}</p>
            <Button
              type="button"
              variant="secondary"
              size="sm"
              onClick={() => setValues({})}
              className="justify-self-start border-white! bg-transparent! text-white! hover:bg-white/10!"
            >
              <RetryIcon />
              {t.reset}
            </Button>
          </Card>
        </div>
      ) : (
        <Card tone="tint">
          <p className="text-ink-muted">{t.soonText}</p>
        </Card>
      )}
    </div>
  );
}
