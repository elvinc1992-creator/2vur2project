import type { ReactNode } from "react";
import { ArrowIcon, ClockIcon, InfoIcon } from "@/components/icons";
import { ButtonLink } from "@/components/ui/button";
import { LiveClock, LiveDays, LiveQuestions } from "@/components/exam-countdown-live";
import type { ExamDateType } from "@/db/schema";
import { az } from "@/content/az";
import { cn } from "@/lib/cn";
import { bakuDate, countdown, prepProgress, urgencyOf, type Urgency } from "@/lib/countdown";
import { nextExamDates, type ExamDateView } from "@/lib/exam-dates";

const t = az.landing.countdown;

// Rəng vəziyyəti: >60 gün — bənövşəyi, 30–60 — narıncı, <30 — qırmızı + yüngül pulsasiya (globals.css → .countdown-pulse).
const LOOK: Record<Urgency, { card: string; ink: string; bar: string }> = {
  calm: { card: "border-violet-200 bg-violet-50", ink: "text-violet-700", bar: "bg-violet-600" },
  soon: { card: "border-orange-200 bg-orange-50", ink: "text-orange-700", bar: "bg-orange-500" },
  urgent: { card: "countdown-pulse border-danger-700/30 bg-danger-100", ink: "text-danger-700", bar: "bg-danger-700" },
};

/**
 * İmtahana geri sayım. Gün sayı serverdə hesablanır (JS-siz də görünür), saat/dəqiqə brauzerdə hər dəqiqə yenilənir.
 * mode="cards" — seçilmiş imtahanlar üçün kartlar; mode="banner" — tək böyük banner (panel).
 */
export async function ExamCountdown({
  types,
  mode = "cards",
  ctaHref = "/qeydiyyat",
  title,
}: {
  types: readonly ExamDateType[];
  mode?: "cards" | "banner";
  ctaHref?: string;
  /** Kartların üstündəki başlıq (kart yoxdursa başlıq da göstərilmir). */
  title?: ReactNode;
}) {
  const { now, dates } = await nextExamDates();
  // Deaktiv, keçmiş və ya daxil edilməmiş imtahan ümumiyyətlə göstərilmir.
  const shown = types.filter((x) => dates[x]);
  if (!shown.length) return null;
  if (mode === "banner") return <Banner type={shown[0]} exam={dates[shown[0]]!} now={now} />;
  const estimated = shown.some((x) => dates[x]!.estimated);
  return (
    <section aria-labelledby={title ? "countdown-title" : undefined} aria-label={title ? undefined : t.label} className="bg-notebook pb-10 md:pb-14">
      <div className="mx-auto grid w-full max-w-content gap-4 px-4 md:px-8">
        {title}
        <ul className={cn("m-0 grid list-none gap-3 p-0 md:gap-4", shown.length === 3 ? "md:grid-cols-3" : shown.length === 2 ? "md:grid-cols-2" : "md:max-w-md")}>
          {shown.map((x) => (
            <li key={x}>
              <CountdownCard type={x} exam={dates[x]!} now={now} />
            </li>
          ))}
        </ul>
        <div className="flex flex-wrap items-center gap-x-5 gap-y-2">
          <ButtonLink href={ctaHref} variant="primary">
            {t.cta}
            <ArrowIcon className="size-[22px]" />
          </ButtonLink>
          {estimated && (
            <p className="m-0 flex items-start gap-2 text-small font-semibold text-warning-700">
              <InfoIcon className="mt-px size-[18px] flex-none" />
              {t.estimatedNote}
            </p>
          )}
        </div>
      </div>
    </section>
  );
}

/** Rəsmi elan olunmamış tarix üçün aydın nişan. */
function EstimatedBadge() {
  return (
    <span
      title={t.estimatedNote}
      className="inline-flex items-center gap-1.5 justify-self-start rounded-pill border border-warning-700/30 bg-warning-100 px-2.5 py-0.5 text-[12.5px] font-bold text-warning-700"
    >
      <ClockIcon className="size-3.5" />
      {t.estimatedBadge}
    </span>
  );
}

function CountdownCard({ type, exam, now }: { type: ExamDateType; exam: ExamDateView; now: number }) {
  const look = LOOK[urgencyOf(countdown(exam.at, now).days)];
  return (
    <article aria-label={t.names[type]} className={cn("grid h-full content-start gap-2 rounded-lg border p-5", look.card)}>
      <div className="flex flex-wrap items-center justify-between gap-2">
        <h3 className="m-0 font-display text-base font-bold text-navy-900">{t.names[type]}</h3>
        {exam.estimated && <EstimatedBadge />}
      </div>
      <p className={cn("m-0 font-display text-[44px] leading-[52px] font-extrabold tracking-[-0.02em] tabular", look.ink)}>
        <LiveDays at={exam.at} serverNow={now} /> <span className="text-[24px]">{t.days}</span>
      </p>
      <LiveClock at={exam.at} serverNow={now} className={look.ink} />
      <p className="m-0 mt-1 text-small text-ink-muted">
        {exam.estimated ? `${t.estimatedDate}: ≈ ` : ""}
        {bakuDate(exam.at)}
      </p>
    </article>
  );
}

function Banner({ type, exam, now }: { type: ExamDateType; exam: ExamDateView; now: number }) {
  const look = LOOK[urgencyOf(countdown(exam.at, now).days)];
  const pct = prepProgress(exam.at, now);
  return (
    <section aria-label={t.label} className={cn("grid gap-3 rounded-lg border p-5 lg:p-6", look.card)}>
      {exam.estimated && <EstimatedBadge />}
      <h2 className="m-0 font-display text-h3 font-extrabold text-navy-900 md:text-[24px] md:leading-8">
        {t.bannerTitle[type]}{" "}
        <span className={cn("tabular", look.ink)}>
          <LiveDays at={exam.at} serverNow={now} /> {t.days}
        </span>{" "}
        {t.left} <span aria-hidden="true">⏳</span>
      </h2>
      <LiveClock at={exam.at} serverNow={now} className={look.ink} />
      <p className="m-0 text-ink-muted">
        {t.motivation}{" "}
        <b className="text-navy-900 tabular">
          <LiveQuestions at={exam.at} serverNow={now} perDay={10} />
        </b>{" "}
        {t.motivationEnd}.
      </p>
      <div className="grid gap-1.5">
        <div
          role="progressbar"
          aria-valuemin={0}
          aria-valuemax={100}
          aria-valuenow={pct}
          aria-label={t.progress(pct)}
          className="h-2 overflow-hidden rounded-pill bg-white"
        >
          <i className={cn("block h-full rounded-pill", look.bar)} style={{ width: `${pct}%` }} />
        </div>
        <p className="m-0 flex flex-wrap justify-between gap-x-4 text-small text-ink-muted">
          <span>{t.progress(pct)}</span>
          <span>
            {exam.estimated ? `${t.estimatedDate}: ≈ ` : ""}
            {bakuDate(exam.at)}
          </span>
        </p>
      </div>
    </section>
  );
}
