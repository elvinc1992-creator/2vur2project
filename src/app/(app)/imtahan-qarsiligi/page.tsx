import type { Metadata } from "next";
import Link from "next/link";
import { Page, Topbar } from "@/components/app/topbar";
import { ArrowIcon } from "@/components/icons";
import { TopicIcon } from "@/components/landing/topic-icon";
import { MathText } from "@/components/ui/math-text";
import { TikzFigure } from "@/components/ui/tikz-figure";
import { az } from "@/content/az";
import { listExamPairs, type ExamPairView, type ExamQuestionView } from "@/lib/bank/source";
import { cn } from "@/lib/cn";
import { LETTERS } from "@/lib/demo/content";
import { canUseRepetitor } from "@/lib/demo/plans";
import { initials, requireDemo } from "@/lib/demo/session";
import { GrowBar, QuizOptions } from "./quiz";

export const metadata: Metadata = { title: az.app.examMatch.title };

const t = az.app.examMatch;

/** İmtahanda düşən suallar ↔ bizim saytdakı qarşılığı (exam_samples + exam_counterparts). */
export default async function ExamMatchPage() {
  const { user, state } = await requireDemo("/imtahan-qarsiligi");
  const pairs = await listExamPairs();
  const premium = canUseRepetitor(state);
  const topicsTotal = new Set(pairs.map((p) => p.topicSlug)).size;
  const topicsReady = new Set(pairs.filter((p) => p.bankReady).map((p) => p.topicSlug)).size;
  const same = pairs.filter((p) => t.level(p.matchLevel) === t.level("EYNİ")).length;

  return (
    <>
      <Topbar title={t.nav} avatar={initials(user.name)} />
      <Page>
        <div className="grid min-w-0 grid-cols-[minmax(0,1fr)] gap-5">
          {/* ---------- Başlıq ---------- */}
          <section
            aria-labelledby="em-title"
            className="relative isolate grid gap-x-8 gap-y-4 overflow-hidden rounded-[24px] bg-[linear-gradient(135deg,#4338ca_0%,#6d28d9_50%,#a21caf_100%)] px-5 py-5 text-white shadow-[0_20px_50px_-20px_rgba(99,102,241,.6)] sm:px-7 lg:grid-cols-[minmax(0,1fr)_21rem] lg:items-center"
          >
            <span aria-hidden="true" className="absolute -top-24 -right-16 -z-10 size-56 rounded-full bg-white/12" />
            <span aria-hidden="true" className="absolute right-80 -bottom-24 -z-10 size-36 rounded-full bg-white/12" />
            <div className="grid min-w-0 gap-1.5">
              <div className="flex flex-wrap items-center gap-x-3 gap-y-1.5">
                <h1 id="em-title" className="m-0 font-display text-[clamp(24px,3vw,30px)] leading-tight font-extrabold tracking-[-0.02em]">
                  {t.title}
                </h1>
                <span className="inline-flex items-center gap-1.5 rounded-pill bg-white/20 px-2.5 py-1 text-[12.5px] font-semibold backdrop-blur-sm">
                  <span aria-hidden="true">🎯</span> {t.badge}
                </span>
              </div>
              <p className="m-0 max-w-[44rem] text-[15px] leading-[1.5] opacity-95">{t.lead}</p>
            </div>
            <div className="grid gap-2">
              <div className="flex justify-between gap-3 text-[13px] font-bold">
                <span className="whitespace-nowrap">
                  <span aria-hidden="true">✅</span> {t.progressLabel}
                </span>
                <span className="whitespace-nowrap tabular">{t.progressValue(topicsReady, topicsTotal)}</span>
              </div>
              <GrowBar value={topicsTotal ? (topicsReady / topicsTotal) * 100 : 0} label={t.progressLabel} />
              <dl className="m-0 mt-1 flex flex-wrap gap-x-4 gap-y-1 text-[13px]">
                {t.stats(pairs.length, same).map((s) => (
                  <div key={s.label} className="flex items-baseline gap-1.5">
                    <dt className="sr-only">{s.label}</dt>
                    <dd className="m-0 font-display text-[18px] font-extrabold tabular">{s.value}</dd>
                    <span aria-hidden="true" className="font-semibold opacity-90">
                      {s.label}
                    </span>
                  </div>
                ))}
              </dl>
            </div>
          </section>

          {/* ---------- Mövzuya keç ---------- */}
          <nav aria-label={t.jump} className="relative min-w-0">
            <ul className="m-0 flex list-none gap-2 overflow-x-auto p-0 pb-1">
              {pairs.map((p) => (
                <li key={p.n} className="flex-none">
                  <a
                    href={`#em-${p.n}`}
                    className="inline-flex items-center gap-1.5 rounded-pill border border-line bg-white px-3 py-1.5 text-[13px] font-semibold whitespace-nowrap text-navy-900 transition-colors hover:border-violet-400 hover:bg-violet-50"
                  >
                    <TopicIcon name={p.topicName} className="size-4 text-violet-700" />
                    {p.topicName}
                  </a>
                </li>
              ))}
            </ul>
          </nav>

          {/* ---------- Cütlər ---------- */}
          <ol className="m-0 grid list-none gap-7 p-0">
            {pairs.map((p) => (
              <li key={p.n}>
                <PairCard p={p} premium={premium} />
              </li>
            ))}
          </ol>

          <p className="m-0 text-center text-[12.5px] text-ink-muted">{t.owner}</p>
        </div>
      </Page>
    </>
  );
}

function PairCard({ p, premium }: { p: ExamPairView; premium: boolean }) {
  const level = t.level(p.matchLevel);
  return (
    <article
      id={`em-${p.n}`}
      aria-labelledby={`em-h-${p.n}`}
      className="scroll-mt-24 rounded-[28px] border border-line bg-white p-4 shadow-[0_10px_40px_-18px_rgba(15,27,61,.25)] sm:p-6"
    >
      <div className="mb-4 flex flex-wrap items-center gap-3">
        <span className="grid size-12 flex-none place-items-center rounded-[14px] bg-[linear-gradient(135deg,#4f46e5,#7c3aed,#c026d3)] text-white shadow-[0_8px_18px_-6px_rgba(139,92,246,.6)]">
          <TopicIcon name={p.topicName} className="size-6" />
        </span>
        <h2 id={`em-h-${p.n}`} className="m-0 font-display text-[22px] leading-tight font-extrabold text-navy-900">
          {p.topicName}
        </h2>
        <span className="rounded-pill bg-indigo-50 px-3 py-1.5 text-[12.5px] font-semibold text-indigo-700">{p.type}</span>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-[minmax(0,1fr)_64px_minmax(0,1fr)]">
        {/* İmtahan */}
        <section aria-label={t.examTitle} className="flex min-w-0 flex-col rounded-[20px] border-2 border-orange-200 bg-orange-50 p-4">
          <Label tone="exam" icon="📝" text={t.examTitle} />
          <Meta>
            <span>
              <span aria-hidden="true">📅</span> {p.exam}
            </span>
            <span>{t.examQno(p.questionNo)}</span>
            <span className="border-orange-200! bg-orange-100! text-orange-800!">
              <span aria-hidden="true">🔥</span> {level}
            </span>
          </Meta>
          <Question q={p.examQuestion} tone="exam" answerLabel={t.examAnswer} />
        </section>

        <Connector />

        {/* Bizim sayt */}
        <section aria-label={t.ourTitle} className="flex min-w-0 flex-col rounded-[20px] border-2 border-emerald-200 bg-emerald-50 p-4">
          <Label tone="site" icon="💡" text={t.ourTitle} />
          <Meta>
            <span>{t.closed}</span>
            <span>{p.topicName}</span>
            <span className="border-emerald-200! bg-emerald-100! text-emerald-800!">✔ {t.similar}</span>
          </Meta>
          {p.counterparts.map((c, i) => (
            <div key={i} className={cn(i > 0 && "mt-4 border-t border-emerald-200 pt-4")}>
              {c.figureTikz && (
                <div className="mt-3 rounded-[14px] border border-emerald-100 bg-white px-3 py-2 text-navy-900">
                  <TikzFigure tikz={c.figureTikz} label={t.figure(p.topicName)} />
                </div>
              )}
              <Question q={c} tone="site" answerLabel={t.ourAnswer} />
            </div>
          ))}
          <div className="mt-3 flex flex-wrap items-center justify-between gap-3 rounded-[14px] bg-[linear-gradient(135deg,#047857,#0e7490)] px-4 py-3 text-white">
            <span className="font-semibold">
              {p.topicQuestions > 0 ? (
                <>
                  {t.more} <strong className="font-display text-[22px] tabular">{p.topicQuestions}</strong> {t.moreUnit}
                </>
              ) : (
                t.soon
              )}
            </span>
            <Link
              href={premium ? `/onlayn-repetitor/${p.topicSlug}` : "/abunelikler"}
              className="inline-flex min-h-11 items-center gap-1.5 rounded-[10px] bg-white px-4 font-bold text-emerald-800 transition-transform hover:scale-105 focus-visible:outline-3 focus-visible:outline-offset-2 focus-visible:outline-white"
            >
              {premium ? t.start : t.unlock}
              <ArrowIcon className="size-4" />
            </Link>
          </div>
        </section>
      </div>
    </article>
  );
}

function Label({ tone, icon, text }: { tone: "exam" | "site"; icon: string; text: string }) {
  return (
    <span
      className={cn(
        "inline-flex items-center gap-2 self-start rounded-pill px-3.5 py-[7px] text-[12px] font-bold tracking-[0.08em] text-white uppercase",
        tone === "exam" ? "bg-[linear-gradient(135deg,#c2410c,#be123c)]" : "bg-[linear-gradient(135deg,#047857,#0e7490)]",
      )}
    >
      <span aria-hidden="true">{icon}</span>
      {text}
    </span>
  );
}

function Meta({ children }: { children: React.ReactNode }) {
  return (
    <div className="mt-2.5 mb-0.5 flex flex-wrap gap-2 [&>span]:rounded-[8px] [&>span]:border [&>span]:border-line [&>span]:bg-white [&>span]:px-2.5 [&>span]:py-[5px] [&>span]:text-[12.5px] [&>span]:font-semibold [&>span]:text-ink-muted">
      {children}
    </div>
  );
}

function Connector() {
  return (
    <div aria-hidden="true" className="relative flex h-14 items-center justify-center lg:h-auto">
      <span className="absolute inset-y-0 left-1/2 w-[3px] -translate-x-1/2 rounded bg-[linear-gradient(180deg,#f97316,#10b981)] lg:inset-x-0 lg:inset-y-auto lg:top-1/2 lg:left-0 lg:h-[3px] lg:w-auto lg:translate-x-0 lg:-translate-y-1/2 lg:bg-[linear-gradient(90deg,#f97316,#10b981)]" />
      <span className="relative grid size-11 place-items-center rounded-full border-[3px] border-white bg-white text-[20px] shadow-[0_6px_16px_-4px_rgba(0,0,0,.2)] ring-2 ring-violet-200">
        ⚡
      </span>
    </div>
  );
}

function Question({ q, tone, answerLabel }: { q: ExamQuestionView; tone: "exam" | "site"; answerLabel: string }) {
  return (
    <>
      <p className="mt-2.5 mb-3 text-[16px] leading-[1.55] font-medium text-ink">
        <MathText text={q.question} />
      </p>
      <QuizOptions
        tone={tone}
        label={tone === "exam" ? t.examTitle : t.ourTitle}
        correct={q.answer}
        rightText={t.right}
        wrongText={t.wrong}
        options={LETTERS.map((l) => ({ letter: l, node: <MathText text={q.options[l]} displayStyle /> }))}
      />
      <details className="group mt-auto pt-2">
        <summary
          className={cn(
            "cursor-pointer list-none rounded-[12px] border border-dashed border-line bg-white px-3.5 py-2.5 font-bold group-open:border-solid [&::-webkit-details-marker]:hidden",
            tone === "exam" ? "text-orange-800" : "text-emerald-800",
          )}
        >
          <span aria-hidden="true" className="inline-block transition-transform group-open:rotate-90">
            ▸
          </span>{" "}
          {answerLabel}
        </summary>
        <p className="m-0 px-1 pt-3 leading-[1.7] text-slate-700">
          <b>{q.answer})</b> <MathText text={q.options[q.answer]} displayStyle />
        </p>
      </details>
    </>
  );
}
