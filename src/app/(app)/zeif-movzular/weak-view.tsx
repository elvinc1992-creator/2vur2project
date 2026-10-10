"use client";

import Link from "next/link";
import { useEffect, useState } from "react";
import { ArrowIcon, BookIcon } from "@/components/icons";
import { Dialog } from "@/components/ui/dialog";
import { az } from "@/content/az";
import { cn } from "@/lib/cn";
import { startFixAction, startRecheckAction } from "@/lib/weak/actions";

const t = az.app.weak;

export type CardData = {
  slug: string;
  name: string;
  section: string | null;
  freq: string;
  status: "few" | "weak" | "growing" | "mastered";
  /** "4,1" */
  loss: string;
  pct: number;
  diag: { title: string | null; text: string };
  root: string | null;
  attempts: number;
  guesses: number;
  review: string | null;
  fixN: number;
  needed: number;
};

type Filter = "all" | "weak" | "growing" | "mastered";

const TONE = {
  weak: { stripe: "bg-red-500", soft: "bg-red-50", text: "text-red-700", bar: "bg-red-500", btn: "bg-red-600 hover:bg-red-700" },
  growing: { stripe: "bg-amber-500", soft: "bg-amber-50", text: "text-amber-800", bar: "bg-amber-500", btn: "bg-amber-700 hover:bg-amber-800" },
  mastered: {
    stripe: "bg-emerald-500",
    soft: "bg-emerald-50",
    text: "text-emerald-800",
    bar: "bg-emerald-500",
    btn: "bg-emerald-700 hover:bg-emerald-800",
  },
  few: { stripe: "bg-slate-300", soft: "bg-slate-50", text: "text-slate-600", bar: "bg-slate-400", btn: "bg-navy-900" },
} as const;

export function WeakView({ cards }: { cards: CardData[] }) {
  const [filter, setFilter] = useState<Filter>("all");
  const [modal, setModal] = useState<CardData | null>(null);
  const [grown, setGrown] = useState(false);
  useEffect(() => {
    const id = setTimeout(() => setGrown(true), 80);
    return () => clearTimeout(id);
  }, []);

  const shown = cards.filter((c) => filter === "all" || c.status === filter);

  return (
    <>
      <div className="flex flex-wrap items-center justify-between gap-3">
        <div role="group" aria-label={t.tabsLabel} className="flex flex-wrap gap-1.5 rounded-[12px] border border-line bg-white p-1.5">
          {(["all", "weak", "growing", "mastered"] as const).map((f) => (
            <button
              key={f}
              type="button"
              aria-pressed={filter === f}
              onClick={() => setFilter(f)}
              className={cn(
                "min-h-9 cursor-pointer rounded-[9px] px-3.5 text-[13.5px] font-semibold transition-colors",
                filter === f ? "bg-navy-900 text-white" : "text-ink-muted hover:bg-navy-050",
              )}
            >
              {t.tabs[f]}
            </button>
          ))}
        </div>
        <span className="text-[13px] text-ink-muted">
          {t.sort} <b className="text-navy-900">{t.sortBy}</b>
        </span>
      </div>

      {shown.length ? (
        <ol className="m-0 grid list-none grid-cols-1 gap-4 p-0 md:grid-cols-[repeat(auto-fill,minmax(330px,1fr))]">
          {shown.map((c, i) => (
            <li key={c.slug}>
              <TopicCard c={c} rank={i + 1} grown={grown} onFix={() => setModal(c)} />
            </li>
          ))}
        </ol>
      ) : (
        <p className="m-0 rounded-[16px] border border-dashed border-line bg-white p-6 text-center text-ink-muted">{t.empty}</p>
      )}

      <Dialog open={modal !== null} onClose={() => setModal(null)} labelledBy="fix-title" describedBy="fix-lead">
        {modal && (
          <div className="grid gap-3">
            <h2 id="fix-title" className="m-0 font-display text-[20px] font-extrabold text-navy-900">
              {modal.name}
            </h2>
            <p id="fix-lead" className="m-0 text-[14px] text-ink-muted">
              {t.modalLead}
            </p>
            <ul className="m-0 grid gap-1 pl-5 text-[14px] leading-[1.7] text-ink-muted">
              {t.modalItems(modal.fixN, modal.diag.title).map((x) => (
                <li key={x}>{x}</li>
              ))}
            </ul>
            <form action={startFixAction} className="flex gap-2">
              <input type="hidden" name="topic" value={modal.slug} />
              <button
                type="button"
                onClick={() => setModal(null)}
                className="min-h-11 cursor-pointer rounded-[12px] bg-navy-050 px-4 font-bold text-navy-900"
              >
                {t.close}
              </button>
              <button
                type="submit"
                className="inline-flex min-h-11 flex-1 cursor-pointer items-center justify-center gap-1.5 rounded-[12px] bg-indigo-600 px-4 font-bold text-white hover:bg-indigo-700"
              >
                {t.start} <ArrowIcon className="size-4" />
              </button>
            </form>
          </div>
        )}
      </Dialog>
    </>
  );
}

function TopicCard({ c, rank, grown, onFix }: { c: CardData; rank: number; grown: boolean; onFix: () => void }) {
  const tone = TONE[c.status];
  const few = c.status === "few";
  return (
    <article
      aria-labelledby={`wt-${c.slug}`}
      className="relative flex h-full flex-col gap-3.5 rounded-[20px] border border-line bg-white p-5 transition-[transform,box-shadow] duration-200 hover:-translate-y-1 hover:shadow-[0_18px_36px_-20px_rgba(15,27,61,.35)]"
    >
      <span aria-hidden="true" className={cn("absolute top-[18px] bottom-[18px] left-0 w-1 rounded-r", tone.stripe)} />
      <div className="flex items-start justify-between gap-2.5">
        <span className={cn("grid size-[34px] flex-none place-items-center rounded-[10px] font-extrabold", tone.soft, tone.text)}>{rank}</span>
        <div className="min-w-0 flex-1">
          <h3 id={`wt-${c.slug}`} className="m-0 text-[16.5px] leading-snug font-bold text-navy-900">
            {c.name}
          </h3>
          <small className="text-[12.5px] text-ink-muted">
            {c.section ? `${c.section} · ` : ""}
            {c.freq}
          </small>
        </div>
        {!few && (
          <div className="flex-none text-right">
            <b className={cn("block text-[22px] font-extrabold tabular", tone.text)}>−{c.loss}</b>
            <small className="text-[11.5px] text-ink-muted">{t.lossLabel}</small>
          </div>
        )}
      </div>

      {few ? (
        <p className="m-0 rounded-[12px] bg-slate-50 px-3.5 py-3 text-[13.5px] text-ink-muted">{t.few(c.needed)}</p>
      ) : (
        <>
          <div className="flex items-center gap-2.5 text-[13px] font-bold">
            <span className={tone.text}>{t.status[c.status]}</span>
            <div
              role="progressbar"
              aria-label={`${c.name}: ${t.status[c.status]}`}
              aria-valuemin={0}
              aria-valuemax={100}
              aria-valuenow={c.pct}
              className="h-2.5 flex-1 overflow-hidden rounded-pill bg-[#eef1f7]"
            >
              <span
                className={cn("block h-full rounded-pill transition-[width] duration-[1200ms] ease-[cubic-bezier(.2,.8,.2,1)]", tone.bar)}
                style={{ width: grown ? `${c.pct}%` : 0 }}
              />
            </div>
            <span className="tabular">{c.pct}%</span>
          </div>
          <p className={cn("m-0 rounded-[12px] px-3.5 py-3 text-[13.5px] leading-normal text-ink", tone.soft)}>
            {c.diag.title && <b className={tone.text}>{c.diag.title}. </b>}
            {c.diag.text}
          </p>
          {c.root && (
            <p className="m-0 flex items-start gap-2 rounded-[10px] bg-indigo-50 px-3 py-2 text-[12.5px] font-semibold text-indigo-700">
              <span aria-hidden="true">🧩</span>
              {c.root}
            </p>
          )}
          <ul className="m-0 flex list-none flex-wrap gap-1.5 p-0">
            <li className="rounded-pill bg-[#f1f3f8] px-2.5 py-1 text-[11.5px] font-semibold text-ink-muted">{t.answersPill(c.attempts)}</li>
            {c.guesses > 0 && (
              <li className="rounded-pill bg-orange-50 px-2.5 py-1 text-[11.5px] font-semibold text-orange-800">{t.guessPill(c.guesses)}</li>
            )}
            {c.review && (
              <li className="rounded-pill bg-[#f1f3f8] px-2.5 py-1 text-[11.5px] font-semibold text-ink-muted">{t.reviewPill(c.review)}</li>
            )}
          </ul>
          <div className="mt-auto flex gap-2">
            {c.status === "mastered" ? (
              <form action={startRecheckAction} className="flex flex-1">
                <input type="hidden" name="topic" value={c.slug} />
                <button
                  type="submit"
                  className={cn("inline-flex min-h-11 flex-1 cursor-pointer items-center justify-center gap-1.5 rounded-[12px] px-3 font-bold text-white", tone.btn)}
                >
                  {t.recheck} <ArrowIcon className="size-4" />
                </button>
              </form>
            ) : (
              <button
                type="button"
                onClick={onFix}
                className={cn("inline-flex min-h-11 flex-1 cursor-pointer items-center justify-center gap-1.5 rounded-[12px] px-3 font-bold text-white", tone.btn)}
              >
                {t.fix(c.fixN)} <ArrowIcon className="size-4" />
              </button>
            )}
            <Link
              href={`/statistika/${c.slug}`}
              aria-label={t.explain(c.name)}
              className="grid min-h-11 min-w-11 place-items-center rounded-[12px] bg-[#f4f6fb] text-navy-900 hover:bg-navy-100"
            >
              <BookIcon className="size-5" />
            </Link>
          </div>
        </>
      )}
    </article>
  );
}
