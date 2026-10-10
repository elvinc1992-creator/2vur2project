"use client";

import { useState } from "react";
import { CheckIcon, CloseIcon, RetryIcon, ShieldIcon, SparkleIcon } from "@/components/icons";
import { ButtonLink } from "@/components/ui/button";
import { Tag, h3Class } from "@/components/ui/display";
import { az } from "@/content/az";
import { cn } from "@/lib/cn";

export type PlanInfo = {
  tier: "free" | "pro" | "premium";
  name: string;
  monthly: string | null;
  oldMonthly: string | null;
  discount: number | null;
  yearly: string | null;
  yearlyPerMonth: string | null;
  yearlySave: number | null;
};

type Props = {
  plans: PlanInfo[];
  current: PlanInfo["tier"];
  currentPeriod: "month" | "year";
  /** "Aylıq abunə · Növbəti ödəniş: …" — cari ödənişli plan üçün. */
  currentNote: string | null;
  examPrice: string;
};

const t = az.app.plans;
const pay = az.app.payment;

/** Abunəliklər: Aylıq/İllik keçidi, üç kart (Pro — önə çıxarılıb, Premium — tünd), müqayisə cədvəli. */
export function PlansView({ plans, current, currentPeriod, currentNote, examPrice }: Props) {
  const [period, setPeriod] = useState<"month" | "year">(currentPeriod);
  const maxSave = Math.max(0, ...plans.map((p) => p.yearlySave ?? 0));

  return (
    <div className="grid min-w-0 grid-cols-[minmax(0,1fr)] gap-7">
      {/* ---------- Başlıq + Aylıq / İllik (yığcam — kartlar ilk ekranda tam görünsün) ---------- */}
      <section
        aria-labelledby="plans-hero"
        className="relative isolate flex flex-wrap items-center justify-between gap-x-6 gap-y-4 overflow-hidden rounded-2xl bg-navy-900 px-5 py-5 text-white sm:px-7"
      >
        <span aria-hidden="true" className="absolute -top-24 -right-16 -z-10 size-72 rounded-full bg-coral-500/25 blur-3xl" />
        <span aria-hidden="true" className="absolute -bottom-28 -left-10 -z-10 size-72 rounded-full bg-navy-500/40 blur-3xl" />
        <div className="grid min-w-0 gap-2">
          <h1 id="plans-hero" className="font-display text-h2 font-extrabold text-white">
            {t.heroTitle}
          </h1>
          <ul className="m-0 flex list-none flex-wrap gap-2 p-0">
            {t.trust.map((x, i) => {
              const Icon = [RetryIcon, ShieldIcon, CheckIcon][i] ?? CheckIcon;
              return (
                <li key={x} className="inline-flex items-center gap-1.5 rounded-pill bg-white/10 px-3 py-1 text-small font-semibold">
                  <Icon className="size-4 text-coral-500" />
                  {x}
                </li>
              );
            })}
          </ul>
        </div>
        <div role="group" aria-label={t.periodLabel} className="inline-flex rounded-pill border border-line bg-white p-1 shadow-card">
          {(["month", "year"] as const).map((p) => (
            <button
              key={p}
              type="button"
              aria-pressed={period === p}
              onClick={() => setPeriod(p)}
              className={cn(
                "inline-flex min-h-11 cursor-pointer items-center gap-2 rounded-pill px-5 font-bold transition-colors",
                "focus-visible:outline-3 focus-visible:outline-offset-2 focus-visible:outline-navy-500",
                period === p ? "bg-navy-900 text-white" : "text-navy-900 hover:bg-navy-050",
              )}
            >
              {p === "month" ? t.periodMonth : t.periodYear}
              {p === "year" && maxSave > 0 && (
                <span className={cn("rounded-pill px-2 py-0.5 text-caption", period === p ? "bg-coral-500 text-white" : "bg-success-100 text-success-700")}>
                  {t.periodYearHint(maxSave)}
                </span>
              )}
            </button>
          ))}
        </div>
      </section>

      {/* ---------- Kartlar ---------- */}
      <ul className="m-0 grid list-none items-stretch gap-5 p-0 lg:grid-cols-3 lg:gap-6">
        {plans.map((p) => (
          <li key={p.tier}>
            <PlanCard plan={p} period={period} current={current} currentPeriod={currentPeriod} currentNote={currentNote} />
          </li>
        ))}
      </ul>

      {/* ---------- Müqayisə ---------- */}
      <section aria-labelledby="compare" className="grid min-w-0 grid-cols-[minmax(0,1fr)] gap-3">
        <h2 id="compare" className={h3Class}>
          {t.compareTitle}
        </h2>
        <div className="relative overflow-x-auto rounded-lg border border-line bg-white">
          <table className="w-full min-w-[34rem] border-collapse text-[15px]">
            <caption className="sr-only">{t.compareCaption}</caption>
            <thead>
              <tr className="bg-navy-050 text-left">
                <th scope="col" className="px-4 py-3 font-semibold text-ink-muted">
                  {t.compareFeature}
                </th>
                {plans.map((p) => (
                  <th
                    key={p.tier}
                    scope="col"
                    className={cn("px-4 py-3 text-center font-display font-extrabold text-navy-900", p.tier === "premium" && "bg-coral-100/60")}
                  >
                    {p.name}
                  </th>
                ))}
              </tr>
            </thead>
            <tbody>
              {t.compare.map((row) => (
                <tr key={row.label} className="border-t border-line">
                  <th scope="row" className="px-4 py-3 text-left font-semibold text-ink">
                    {row.label}
                  </th>
                  {plans.map((p) => (
                    <td key={p.tier} className={cn("px-4 py-3 text-center", p.tier === "premium" && "bg-coral-100/30")}>
                      <Cell value={row[p.tier]} />
                    </td>
                  ))}
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        <p className="text-small text-ink-muted">{t.examPrice(examPrice)}</p>
      </section>
    </div>
  );
}

function Cell({ value }: { value: boolean | string }) {
  if (value === true)
    return (
      <span className="inline-grid size-7 place-items-center rounded-full bg-success-100 text-success-700">
        <CheckIcon className="size-4" />
        <span className="sr-only">{t.yes}</span>
      </span>
    );
  if (value === false)
    return (
      <span className="inline-grid size-7 place-items-center rounded-full bg-navy-050 text-ink-muted">
        <CloseIcon className="size-4" />
        <span className="sr-only">{t.no}</span>
      </span>
    );
  return <span className="font-semibold text-navy-900">{value}</span>;
}

function PlanCard({
  plan: p,
  period,
  current,
  currentPeriod,
  currentNote,
}: {
  plan: PlanInfo;
  period: "month" | "year";
  current: PlanInfo["tier"];
  currentPeriod: "month" | "year";
  currentNote: string | null;
}) {
  const isCurrent = p.tier === current;
  const dark = p.tier === "premium";
  const featured = p.tier === "premium";
  const yearly = period === "year";

  return (
    <section
      aria-labelledby={`plan-${p.tier}`}
      className={cn(
        "relative flex h-full flex-col gap-4 rounded-2xl border p-5 lg:p-6",
        dark ? "border-navy-900 bg-navy-900 text-white" : "border-line bg-white",
        featured && "border-2 border-coral-500 shadow-raised ring-4 ring-coral-500/15",
        !featured && !dark && "shadow-card",
        isCurrent && "ring-4 ring-success-700/40",
      )}
    >
      {featured && (
        <span className="absolute -top-3.5 left-6 inline-flex items-center gap-1 rounded-pill bg-coral-600 px-3 py-1 text-caption font-bold text-white shadow-card">
          <SparkleIcon className="size-3.5" />
          {t.popular}
        </span>
      )}

      <div className="flex items-center justify-between gap-2">
        <h2 id={`plan-${p.tier}`} className={cn("font-display text-h3 font-extrabold", dark ? "text-white" : "text-navy-900")}>
          {p.name}
        </h2>
        {isCurrent ? (
          <Tag tone="success">{pay.current}</Tag>
        ) : dark ? (
          <Tag tone="onNavy">{t.allIn}</Tag>
        ) : null}
      </div>

      {/* Qiymət */}
      <div className="grid min-h-[5.5rem] content-start gap-1">
        {p.tier === "free" ? (
          <>
            <p className="m-0 font-display text-[44px] leading-[48px] font-extrabold tabular">0 AZN</p>
            <p className="m-0 text-small text-ink-muted">{t.free}</p>
          </>
        ) : yearly ? (
          <>
            <p className="m-0 flex flex-wrap items-baseline gap-x-2 font-display text-[40px] leading-[46px] font-extrabold whitespace-nowrap tabular lg:text-[34px] lg:leading-[42px] 2xl:text-[44px] 2xl:leading-[48px]">
              {p.yearly}{" "}
              <span className={cn("text-lead font-semibold", dark ? "text-on-navy-muted" : "text-ink-muted")}>/ il</span>
            </p>
            <div className="flex flex-wrap items-center gap-2">
              <span className={cn("text-small tabular", dark ? "text-on-navy-muted" : "text-ink-muted")}>
                {t.perMonthShort(p.yearlyPerMonth ?? "")} · 12 ay
              </span>
              {p.yearlySave ? <Tag tone={dark ? "onNavy" : "success"}>{t.yearlySave(p.yearlySave)}</Tag> : null}
            </div>
          </>
        ) : (
          <>
            {p.oldMonthly && (
              <div className="flex flex-wrap items-center gap-2">
                <s className={cn("tabular", dark ? "text-on-navy-muted" : "text-ink-muted")}>
                  <span className="sr-only">{t.oldPrice}: </span>
                  {pay.perMonth(p.oldMonthly)}
                </s>
                {p.discount ? <Tag tone="coral">{t.discount(p.discount)}</Tag> : null}
              </div>
            )}
            <p className="m-0 flex flex-wrap items-baseline gap-x-2 font-display text-[40px] leading-[46px] font-extrabold whitespace-nowrap tabular lg:text-[34px] lg:leading-[42px] 2xl:text-[44px] 2xl:leading-[48px]">
              {p.monthly}{" "}
              <span className={cn("text-lead font-semibold", dark ? "text-on-navy-muted" : "text-ink-muted")}>/ ay</span>
            </p>
          </>
        )}
      </div>

      <ul className="m-0 grid list-none gap-2.5 p-0">
        {pay.planFeatures[p.tier].map((f) => (
          <li key={f} className="flex items-start gap-2.5 text-[15px] leading-[22px]">
            <span
              className={cn(
                "mt-px grid size-5 flex-none place-items-center rounded-full",
                dark ? "bg-coral-500 text-white" : "bg-success-100 text-success-700",
              )}
            >
              <CheckIcon className="size-3.5" />
            </span>
            {f}
          </li>
        ))}
      </ul>

      {isCurrent && currentNote && (
        <p className={cn("m-0 text-small", dark ? "text-on-navy-muted" : "text-ink-muted")}>{currentNote}</p>
      )}

      <div className="mt-auto grid gap-2 pt-1">
        {p.tier === "free" ? (
          !isCurrent && <p className="m-0 text-small text-ink-muted">{t.freeNote}</p>
        ) : isCurrent ? (
          <>
            {/* Aylıq → illik: qalan günlər itmir, 12 ay onların üstünə gəlir. */}
            {currentPeriod !== "year" && (
              <ButtonLink href={`/odenis?plan=${p.tier}&period=year`} variant="primary" block>
                {t.toYearly(p.yearly ?? "")}
              </ButtonLink>
            )}
            <ButtonLink
              href="/profil"
              variant="secondary"
              block
              className={cn(dark && "border-white! bg-transparent! text-white! hover:bg-white/10!")}
            >
              {t.manage}
            </ButtonLink>
          </>
        ) : (
          <ButtonLink
            href={`/odenis?plan=${p.tier}&period=${period}`}
            variant={featured ? "primary" : "secondary"}
            block
            className={cn(dark && !featured && "border-white! bg-white! text-navy-900! hover:bg-navy-050!")}
          >
            {t.choosePeriod(p.name, yearly)}
          </ButtonLink>
        )}
      </div>
    </section>
  );
}
