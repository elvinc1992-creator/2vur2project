import type { Metadata } from "next";
import { Page, Topbar } from "@/components/app/topbar";
import { ArrowIcon } from "@/components/icons";
import { az } from "@/content/az";
import { initials, requireDemo } from "@/lib/demo/session";
import { fixSize, MIN_ATTEMPTS, WINDOW_DAYS, type TopicResult } from "@/lib/weak/compute";
import { startRecheckAction } from "@/lib/weak/actions";
import { weakReport } from "@/lib/weak/data";
import { WeakView, type CardData } from "./weak-view";

export const metadata: Metadata = { title: az.app.weak.title };

const t = az.app.weak;
const num = (v: number, d = 1) => v.toFixed(d).replace(".", ",");
const MONTHS = ["yan", "fev", "mar", "apr", "may", "iyn", "iyl", "avq", "sen", "okt", "noy", "dek"];
const shortDate = (iso: string) => `${Number(iso.slice(8, 10))} ${MONTHS[Number(iso.slice(5, 7)) - 1]}`;
const longDate = (iso: string) => `${iso.slice(8, 10)}.${iso.slice(5, 7)}.${iso.slice(0, 4)}`;

function toCard(r: TopicResult, review: string | undefined): CardData {
  const err = r.mainError;
  const diag =
    r.status === "mastered"
      ? { title: null, text: t.diagMastered }
      : err
        ? { title: err.name, text: err.errorTypeId ? t.diagType(err.name, err.count) : t.diagSub(err.count) }
        : { title: null, text: t.diagNone };
  return {
    slug: r.topic.slug,
    name: r.topic.name,
    section: r.topic.section,
    freq: r.topic.dimFrequency >= 0.5 ? t.freq(num(r.topic.dimFrequency)) : t.freqRare,
    status: r.status,
    loss: num(r.loss),
    pct: Math.round(r.mastery * 100),
    diag,
    root: r.root ? t.root(r.root.name, Math.round((r.rootMastery ?? 0) * 100)) : null,
    attempts: r.attempts,
    guesses: r.guesses,
    review: review ? longDate(review) : null,
    fixN: fixSize(r.mastery),
    needed: Math.max(1, MIN_ATTEMPTS - r.attempts),
  };
}

/** Zəif mövzular: imtahanda itirilən bal, təkrarlanan səhv, kök səbəb, hədəfli məşq. */
export default async function WeakTopicsPage() {
  const { user } = await requireDemo("/zeif-movzular");
  const r = await weakReport(user.id!);
  const cards = r.results.map((x) => toCard(x, r.nextReview.get(x.topic.id)));
  const hasData = r.results.length > 0;

  return (
    <>
      <Topbar title={t.title} avatar={initials(user.name)} />
      <Page>
        <div className="grid min-w-0 grid-cols-[minmax(0,1fr)] gap-6">
          {/* ---------- Xülasə ---------- */}
          <section
            aria-labelledby="weak-title"
            className="relative isolate grid gap-6 overflow-hidden rounded-[26px] bg-[linear-gradient(135deg,#4f46e5,#7c3aed_55%,#be185d)] px-5 py-7 text-white shadow-[0_20px_50px_-22px_rgba(99,102,241,.7)] sm:px-8 lg:grid-cols-[1.4fr_1fr] lg:items-center"
          >
            <span aria-hidden="true" className="absolute -top-28 -right-20 -z-10 size-72 rounded-full bg-white/10" />
            <div className="grid gap-2.5">
              <span className="justify-self-start rounded-pill bg-white/20 px-3 py-1.5 text-[12.5px] font-bold">
                <span aria-hidden="true">🧠</span> {t.badge(WINDOW_DAYS)}
              </span>
              <h1 id="weak-title" className="m-0 font-display text-[clamp(24px,3.4vw,34px)] leading-[1.2] font-extrabold tracking-[-0.02em]">
                {t.heroBefore}{" "}
                <span className="rounded-[8px] bg-white px-2 whitespace-nowrap text-pink-700">{t.lossBig(num(r.total))}</span> {t.heroAfter}
              </h1>
              <p className="m-0 leading-[1.55] opacity-95">
                {r.gain > 0 ? (
                  <>
                    <b>{t.heroGain(num(r.gain))}</b> {t.heroSort}
                  </>
                ) : hasData ? (
                  t.heroNone
                ) : (
                  t.noData
                )}
              </p>
              <p className="m-0 text-[12.5px] opacity-85">{t.forExam(t.examType[r.examType])}</p>
            </div>
            <dl className="m-0 grid grid-cols-2 gap-3">
              {[
                [String(r.weak), t.stats.weak],
                [String(r.growing), t.stats.growing],
                [String(r.answers), t.stats.answers],
                [
                  r.weekChange === null ? t.weekNone : `${r.weekChange <= 0 ? "↓" : "↑"} ${num(Math.abs(r.weekChange))}`,
                  t.stats.week,
                ],
              ].map(([value, label]) => (
                <div key={label} className="flex flex-col-reverse rounded-[16px] border border-white/25 bg-white/15 p-3.5 backdrop-blur-sm">
                  <dt className="text-[12.5px] opacity-90">{label}</dt>
                  <dd className="m-0 text-[26px] font-extrabold tabular">{value}</dd>
                </div>
              ))}
            </dl>
          </section>

          {/* ---------- Təkrar yoxlama ---------- */}
          {r.due && (
            <section
              aria-labelledby="due-title"
              className="flex flex-wrap items-center gap-3.5 rounded-[20px] bg-[linear-gradient(135deg,#0f1b3d,#33416e)] px-5 py-4 text-white"
            >
              <span aria-hidden="true" className="text-[28px]">
                🔁
              </span>
              <div className="min-w-[200px] flex-1">
                <h2 id="due-title" className="m-0 text-[16px] font-bold">
                  {t.dueTitle}
                </h2>
                <p className="m-0 text-[13.5px] opacity-85">{t.dueText(r.due.topic.name)}</p>
              </div>
              <form action={startRecheckAction}>
                <input type="hidden" name="topic" value={r.due.topic.slug} />
                <button
                  type="submit"
                  className="inline-flex min-h-11 cursor-pointer items-center gap-1.5 rounded-[12px] bg-white px-4 font-bold text-navy-900"
                >
                  {t.dueStart} <ArrowIcon className="size-4" />
                </button>
              </form>
            </section>
          )}

          <WeakView cards={cards} />

          {/* ---------- Dinamika və səhvlər ---------- */}
          <div className="grid gap-4 lg:grid-cols-[1.5fr_1fr]">
            <section aria-labelledby="trend-title" className="min-w-0 rounded-[20px] border border-line bg-white p-5">
              <h2 id="trend-title" className="m-0 text-[19px] font-extrabold text-navy-900">
                {t.chartTitle}
              </h2>
              <p className="m-0 text-[13px] text-ink-muted">{t.chartLead}</p>
              <LossChart points={r.history} />
            </section>
            <section aria-labelledby="errs-title" className="rounded-[20px] border border-line bg-white p-5">
              <h2 id="errs-title" className="m-0 text-[19px] font-extrabold text-navy-900">
                {t.errorsTitle}
              </h2>
              <p className="m-0 text-[13px] text-ink-muted">{t.errorsLead}</p>
              {r.topErrors.length ? (
                <ul className="m-0 mt-3.5 grid list-none gap-2.5 p-0">
                  {r.topErrors.map((e) => (
                    <li key={e.name} className="grid grid-cols-[1fr_auto] items-center gap-x-2.5 gap-y-1">
                      <span className="text-[14px] font-semibold text-ink">{e.name}</span>
                      <em className="text-[14px] font-extrabold text-red-700 not-italic tabular">{t.times(e.count)}</em>
                      <span aria-hidden="true" className="col-span-2 h-1.5 overflow-hidden rounded-pill bg-[#eef1f7]">
                        <i
                          className="block h-full rounded-pill bg-[linear-gradient(90deg,#f97316,#ef4444)]"
                          style={{ width: `${(e.count / r.topErrors[0].count) * 100}%` }}
                        />
                      </span>
                    </li>
                  ))}
                </ul>
              ) : (
                <p className="m-0 mt-3.5 text-[14px] text-ink-muted">{t.errorsEmpty}</p>
              )}
            </section>
          </div>

          <p className="m-0 text-center text-[12px] text-ink-muted">{t.owner}</p>
        </div>
      </Page>
    </>
  );
}

/** Son 30 günün bal itkisi — xətt qrafiki (SVG, kitabxanasız). */
function LossChart({ points }: { points: Array<{ date: string; loss: number }> }) {
  if (points.length < 2) return <p className="m-0 mt-6 text-[14px] text-ink-muted">{t.chartEmpty}</p>;
  const W = 600;
  const H = 240;
  const pad = { l: 44, r: 12, t: 12, b: 28 };
  const max = Math.max(1, ...points.map((p) => p.loss)) * 1.1;
  const x = (i: number) => pad.l + (i / (points.length - 1)) * (W - pad.l - pad.r);
  const y = (v: number) => pad.t + (1 - v / max) * (H - pad.t - pad.b);
  const line = points.map((p, i) => `${i ? "L" : "M"}${x(i).toFixed(1)},${y(p.loss).toFixed(1)}`).join(" ");
  const area = `${line} L${x(points.length - 1).toFixed(1)},${y(0)} L${x(0).toFixed(1)},${y(0)} Z`;
  const ticks = [0, 0.25, 0.5, 0.75, 1].map((k) => k * (max / 1.1));
  const labelIdx = [...new Set([0, Math.round((points.length - 1) / 3), Math.round(((points.length - 1) * 2) / 3), points.length - 1])];
  const last = points[points.length - 1];
  return (
    <div className="mt-3 overflow-x-auto">
      <svg
        viewBox={`0 0 ${W} ${H}`}
        role="img"
        aria-label={t.chartLabel(shortDate(points[0].date), shortDate(last.date), num(last.loss))}
        className="h-[240px] w-full min-w-[320px]"
        preserveAspectRatio="none"
      >
        <defs>
          <linearGradient id="loss-fill" x1="0" y1="0" x2="0" y2="1">
            <stop offset="0" stopColor="rgba(139,92,246,.35)" />
            <stop offset="1" stopColor="rgba(236,72,153,0)" />
          </linearGradient>
        </defs>
        {ticks.map((v) => (
          <g key={v}>
            <line x1={pad.l} x2={W - pad.r} y1={y(v)} y2={y(v)} stroke="#eef1f7" />
            <text x={pad.l - 6} y={y(v) + 4} textAnchor="end" fontSize="11" fill="#5b6785">
              −{num(v)}
            </text>
          </g>
        ))}
        <path d={area} fill="url(#loss-fill)" />
        <path d={line} fill="none" stroke="#8b5cf6" strokeWidth="3" strokeLinejoin="round" strokeLinecap="round" />
        {points.map((p, i) => (
          <circle key={p.date} cx={x(i)} cy={y(p.loss)} r={points.length > 20 ? 2.5 : 4} fill="#fff" stroke="#8b5cf6" strokeWidth="2">
            <title>{`${shortDate(p.date)}: −${num(p.loss)} bal`}</title>
          </circle>
        ))}
        {labelIdx.map((i) => (
          <text key={i} x={x(i)} y={H - 8} textAnchor={i === 0 ? "start" : i === points.length - 1 ? "end" : "middle"} fontSize="11" fill="#5b6785">
            {shortDate(points[i].date)}
          </text>
        ))}
      </svg>
    </div>
  );
}
