import type { Metadata } from "next";
import Link from "next/link";
import { DailyStrip, DailyUpsell } from "@/components/app/daily";
import { DemoNote } from "@/components/app/demo-note";
import { Page, Topbar } from "@/components/app/topbar";
import { CalcIcon, CapIcon, ChevronIcon, ClockIcon, FlameIcon, LockIcon, RetryIcon } from "@/components/icons";
import { Card, Meter, Ring, Tag, Week, h1Class, h3Class, listClass } from "@/components/ui/display";
import { az } from "@/content/az";
import { EXAMS, EXAM_QUESTIONS } from "@/lib/demo/content";
import { requireDaily } from "@/lib/demo/daily";
import {
  answeredCount,
  dailyOverview,
  dailyPager,
  daysLeft,
  examStatus,
  findExam,
  formatDate,
  planStatus,
  remainingMs,
  streakInfo,
  typeProgress,
} from "@/lib/demo/logic";
import { canUseRepetitor, hasFullDaily, PLANS, tierOf } from "@/lib/demo/plans";
import { initials } from "@/lib/demo/session";
import { tutorOf } from "@/lib/repetitor/progress";
import { listMistakes } from "@/lib/review/mistakes";
import { practicePool } from "@/lib/review/pool";
import { listRepetitorTopics } from "@/lib/repetitor/source";

export const metadata: Metadata = { title: az.app.panel.title };

export default async function PanelPage() {
  const { user, state, ctx } = await requireDaily("/panel");
  const t = az.app.panel;
  const days = daysLeft(state.sub.periodEnd);
  const daily = dailyOverview(state, ctx);
  const plan = planStatus(state);
  const paid = hasFullDaily(state);
  const tierName = PLANS[tierOf(state)].name;
  const tutorOpen = canUseRepetitor(state);
  const left = daily.total - daily.done;
  const streak = streakInfo(state);
  const tutorTotal = (await listRepetitorTopics()).reduce((s, x) => s + x.questions.length, 0);
  const tutorDone = Object.values(tutorOf(state)).filter((p) => p.a).length;
  const activeMistakes = (await listMistakes(state, await practicePool())).filter((m) => !m.fixed).length;
  // Tiplər üzrə proqres — bu günün ilk mövzusu üzrə.
  const progressTopic = ctx.topics[0];
  const progress = progressTopic ? typeProgress(state, ctx, progressTopic.slug) : [];

  // Vaxtı bitmiş sınaq "Davam et"-də göstərilmir.
  const inProgressId = Object.keys(state.attempts).find((id) => examStatus(state, id) === "in_progress");
  const inProgress = inProgressId ? findExam(inProgressId) : undefined;
  const attempt = inProgressId ? state.attempts[inProgressId] : undefined;
  const doneCount = EXAMS.filter((e) => ["done", "expired"].includes(examStatus(state, e.id))).length;
  const progressCount = EXAMS.filter((e) => examStatus(state, e.id) === "in_progress").length;
  const newNames = EXAMS.filter((e) => examStatus(state, e.id) === "locked")
    .map((e) => e.title.replace(/^.*(№\d+)$/, "$1"))
    .join(", ");

  return (
    <>
      <Topbar title={t.title} avatar={initials(user.name)} />
      <Page>
        <div className="grid items-start gap-6 lg:grid-cols-[1.6fr_1fr]">
          <div className="grid gap-6">
            <div className="grid gap-2">
              <Tag
                tone={plan === "free" ? "lock" : plan === "active" ? "success" : "warning"}
                dot
                className="justify-self-start"
              >
                {plan === "free"
                  ? az.app.sub.free
                  : plan === "active"
                    ? az.app.sub.activeLong(days, tierName)
                    : az.app.sub.canceledLong(days, tierName)}
              </Tag>
              <h1 className={h1Class}>{t.hello(user.name ?? "")}</h1>
              <p className="text-ink-muted">
                {!paid
                  ? t.todaySummaryFree(daily.openLeft, daily.locked)
                  : left > 0
                    ? t.todaySummary(daily.topics.filter((x) => x.done < x.total).length, left)
                    : t.allDone}
              </p>
            </div>

            {!paid && <DailyUpsell locked={daily.locked} />}

            {plan === "canceled" && (
              <div className="grid gap-3 rounded-lg border border-[#F0DCA6] bg-warning-100 p-4 text-ink">
                <div className="flex items-start gap-3">
                  <ClockIcon className="size-[22px] flex-none text-warning-700" />
                  <div>
                    <b className="block text-warning-700">
                      {az.app.sub.endsTitle(formatDate(state.sub.periodEnd))}
                    </b>
                    {az.app.sub.endsText}
                  </div>
                </div>
                <Link
                  href="/profil"
                  className="justify-self-start font-semibold text-navy-500 underline underline-offset-3"
                >
                  {az.app.sub.renew}
                </Link>
              </div>
            )}

            <section className="grid gap-4" aria-labelledby="dq">
              <div className="flex items-center justify-between gap-3">
                <h2 className={h3Class} id="dq">
                  {t.todayTitle}
                </h2>
                <span className="flex items-center gap-3 text-small">
                  <span className="text-ink-muted tabular">
                    {daily.done} / {daily.total}
                  </span>
                  <Link
                    href="/gunun-suallari"
                    className="font-semibold text-navy-500 underline underline-offset-3"
                  >
                    {t.seeAll}
                  </Link>
                </span>
              </div>
              <div className="grid gap-2.5 md:grid-cols-2">
                {daily.topics.map((x) => (
                  <Link
                    key={x.topic}
                    href={`/gunun-suallari/${x.topic}`}
                    className="grid gap-3 rounded-lg border border-line bg-white p-3.5 text-inherit no-underline hover:border-navy-900"
                  >
                    <span className="flex items-center gap-3">
                      <Ring done={x.done} total={x.total} />
                      <span className="min-w-0 flex-1">
                        <span className="block font-display text-base leading-[22px] font-bold text-navy-900">
                          {x.name}
                        </span>
                        <span className="flex items-center gap-1.5 text-small text-ink-muted">
                          {!paid && <LockIcon className="size-4 flex-none" />}
                          {!paid
                            ? x.openLeft
                              ? az.app.daily.topicFree(x.open, x.locked)
                              : az.app.daily.freeDone(x.locked)
                            : x.done >= x.total
                              ? t.done
                              : x.done === 0
                                ? t.todayN(x.total)
                                : t.left(x.total - x.done)}
                        </span>
                      </span>
                      <ChevronIcon className="size-5 flex-none text-ink-muted" />
                    </span>
                    <DailyStrip items={dailyPager(state, ctx, x.topic)} />
                  </Link>
                ))}
              </div>
            </section>

            <Card as="section" aria-labelledby="tp" className="grid gap-4">
              <div className="flex items-center justify-between gap-3">
                <h2 className={h3Class} id="tp">
                  {t.typesTitle}
                </h2>
                {progressTopic && <Tag>{progressTopic.name}</Tag>}
              </div>
              {progress.map((it) => (
                <div key={it.type} className="grid gap-1.5">
                  <div className="flex items-center justify-between gap-3 text-small">
                    <span>{it.type}</span>
                    <b className="tabular">{it.pct}%</b>
                  </div>
                  <Meter value={it.pct} label={it.type} size="lg" />
                </div>
              ))}
              <Link
                href="/statistika"
                className="justify-self-start text-small font-semibold text-navy-500 underline underline-offset-3"
              >
                {t.allTopics}
              </Link>
            </Card>
          </div>

          <div className="grid gap-6">
            <Link
              href="/onlayn-repetitor"
              className="flex items-center gap-3 rounded-lg border border-navy-900 bg-white p-4 text-inherit no-underline hover:bg-navy-050 lg:p-5"
            >
              <span className="grid size-11 flex-none place-items-center rounded-[14px] bg-navy-900 text-white">
                <CapIcon className="size-6" />
              </span>
              <span className="min-w-0 flex-1">
                <b className="block font-display text-lg leading-6 font-extrabold text-navy-900">{az.app.tutor.title}</b>
                <span className="flex items-center gap-1.5 text-small text-ink-muted">
                  {!tutorOpen && <LockIcon className="size-4 flex-none" />}
                  {tutorOpen ? az.app.tutor.panelPaid(tutorDone, tutorTotal) : az.app.tutor.panelFree}
                </span>
              </span>
              <ChevronIcon className="size-5 flex-none text-ink-muted" />
            </Link>

            <div className="grid grid-cols-2 gap-3">
              <Link
                href="/sehvlerim"
                className="grid content-start gap-2 rounded-lg border border-line bg-white p-4 text-inherit no-underline hover:border-navy-900"
              >
                <span className="grid size-10 place-items-center rounded-[12px] bg-danger-100 text-danger-700">
                  <RetryIcon className="size-[22px]" />
                </span>
                <b className="font-display leading-[22px] font-extrabold text-navy-900">{az.app.mistakes.title}</b>
                <span className="text-small text-ink-muted">{az.app.mistakes.panelText(activeMistakes)}</span>
              </Link>
              <Link
                href="/bal-simulyatoru"
                className="grid content-start gap-2 rounded-lg border border-line bg-white p-4 text-inherit no-underline hover:border-navy-900"
              >
                <span className="grid size-10 place-items-center rounded-[12px] bg-navy-100 text-navy-900">
                  <CalcIcon className="size-[22px]" />
                </span>
                <b className="font-display leading-[22px] font-extrabold text-navy-900">{az.app.score.title}</b>
                <span className="text-small text-ink-muted">{az.app.score.panelText}</span>
              </Link>
            </div>

            <Card as="section" aria-labelledby="sk" className="grid gap-4">
              <div className="flex items-center gap-3">
                <span className="grid size-11 flex-none place-items-center rounded-[14px] bg-coral-100 text-coral-600">
                  <FlameIcon className="size-6" />
                </span>
                <div>
                  <h2 className={h3Class} id="sk">
                    <span className="tabular">{streak.days}</span> {t.streak}
                  </h2>
                  <p className="text-small text-ink-muted">{t.record(streak.record)}</p>
                </div>
              </div>
              <Week days={streak.week} />
            </Card>

            <section className="grid gap-4" aria-labelledby="ms">
              <h2 className={h3Class} id="ms">
                {t.continue}
              </h2>
              {inProgress && attempt && (
                <Link
                  href={`/sinaq/${inProgress.id}`}
                  className="grid gap-2 rounded-lg border border-navy-900 bg-navy-900 p-5 text-white no-underline lg:p-6"
                >
                  <span className="text-small text-on-navy-muted">{t.examInProgress}</span>
                  <b className="font-display text-lg leading-6 font-extrabold">{inProgress.title}</b>
                  <div className="h-1.5 overflow-hidden rounded-pill bg-white/20">
                    <i
                      className="block h-full rounded-pill bg-coral-500"
                      style={{ width: `${(answeredCount(attempt) / EXAM_QUESTIONS.length) * 100}%` }}
                    />
                  </div>
                  <span className="text-small text-on-navy-muted">
                    {t.examProgress(
                      answeredCount(attempt),
                      EXAM_QUESTIONS.length,
                      Math.ceil(remainingMs(attempt, inProgress) / 60_000),
                    )}
                  </span>
                </Link>
              )}
              <div className={listClass}>
                <Link href="/sinaqlar?f=owned" className="text-ink">
                  <span>
                    <b>{t.myExams}</b>
                    <br />
                    <span className="text-small text-ink-muted">
                      {t.myExamsSub(doneCount, progressCount)}
                    </span>
                  </span>
                  <ChevronIcon />
                </Link>
                <Link href="/sinaqlar?f=new" className="text-ink">
                  <span>
                    <b>{t.store}</b>
                    <br />
                    <span className="text-small text-ink-muted">{t.storeSub(newNames)}</span>
                  </span>
                  <ChevronIcon />
                </Link>
              </div>
            </section>
            <DemoNote />
          </div>
        </div>
      </Page>
    </>
  );
}
