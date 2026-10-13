import type { Metadata } from "next";
import Link from "next/link";
import { Page, Topbar } from "@/components/app/topbar";
import { EXAM_TYPE_LOOK, ExamTypeBand } from "@/components/exam-type";
import { CalendarIcon, CheckCircleIcon, ClockIcon, ListIcon } from "@/components/icons";
import { Button, ButtonLink } from "@/components/ui/button";
import { Card, FormatBar, Tag, h1Class, h3Class } from "@/components/ui/display";
import { az } from "@/content/az";
import { claimExamAction, startExamAction } from "@/lib/demo/actions";
import { listExams } from "@/lib/exams/source";
import { priceText, type ExamMeta } from "@/lib/exams/types";
import { answeredCount, examStatus, formatDate, isExamOpenForSale, isExamVisible, remainingMs, type ExamStatus } from "@/lib/demo/logic";
import { examQuota } from "@/lib/demo/plans";
import { initials, requireDemo } from "@/lib/demo/session";
import type { DemoState } from "@/lib/demo/state";
import { cn } from "@/lib/cn";

export const metadata: Metadata = { title: az.app.store.title };

const FILTERS = ["all", "new", "progress", "done"] as const;
type Filter = (typeof FILTERS)[number];
const TYPES = ["9", "11", "blok", "movzu"] as const;
type ExamTypeFilter = (typeof TYPES)[number];

/** Şagird üçün vəziyyət: işlənib (nəticə var), yarımçıq (başlayıb), hələ işlənməyib. */
type Progress = Exclude<Filter, "all">;
const progressOf = (s: ExamStatus): Progress => (s === "done" ? "done" : s === "in_progress" || s === "expired" ? "progress" : "new");

const isoOf = (ms: number) => new Date(ms).toISOString().slice(0, 10);

export default async function StorePage(props: PageProps<"/sinaqlar">) {
  const sp = await props.searchParams;
  const filter: Filter = FILTERS.includes(sp.f as Filter) ? (sp.f as Filter) : "all";
  const { user, state } = await requireDemo("/sinaqlar");
  const quota = examQuota(state);
  const t = az.app.store;
  const type = TYPES.includes(sp.tip as ExamTypeFilter) ? (sp.tip as ExamTypeFilter) : null;
  const qs = (next: { f?: string; tip?: string | null }) => {
    const p = new URLSearchParams();
    const ff = next.f ?? filter;
    const tt = next.tip === undefined ? type : next.tip;
    if (ff !== "all") p.set("f", ff);
    if (tt) p.set("tip", tt);
    const s = p.toString();
    return s ? `/sinaqlar?${s}` : "/sinaqlar";
  };

  // Ən yeni sınaq birinci (yaradılma tarixi ilə); passivlər və iştirak etmədiyin bitmiş sınaqlar görünmür.
  const visible = (await listExams())
    .filter((e) => isExamVisible(state, e))
    .filter((e) => !type || e.examType === type)
    .map((e) => {
      const status = examStatus(state, e);
      return { ...e, userStatus: status, progress: progressOf(status), ended: e.status === "finished" };
    });
  const countOf = (f: Filter) => (f === "all" ? visible.length : visible.filter((e) => e.progress === f).length);
  const exams = visible.filter((e) => filter === "all" || e.progress === filter);

  return (
    <>
      <Topbar title={az.app.nav.exams} avatar={initials(user.name)} />
      <Page>
        <div className="grid gap-2">
          <h1 className={h1Class}>{t.title}</h1>
          <p className="text-ink-muted">{t.subtitle}</p>
        </div>
        <nav aria-label={t.title} className="flex flex-wrap gap-2">
          {FILTERS.map((key) => (
            <Link
              key={key}
              href={qs({ f: key })}
              aria-current={filter === key ? "page" : undefined}
              className={cn(
                "inline-flex min-h-11 items-center gap-2 rounded-md border-[1.5px] px-4 text-[15px] font-bold no-underline",
                filter === key ? "border-navy-900 bg-navy-900 text-white" : "border-control-border bg-white text-navy-900",
              )}
            >
              {key !== "all" && <StateDot progress={key} />}
              {t.filters[key]}
              <span className="tabular opacity-70">{countOf(key)}</span>
            </Link>
          ))}
        </nav>

        <nav aria-label={t.typesLabel} className="flex flex-wrap gap-2">
          {[null, ...TYPES].map((key) => (
            <Link
              key={key ?? "all"}
              href={qs({ tip: key })}
              aria-current={type === key ? "page" : undefined}
              className={cn(
                "inline-flex min-h-10 items-center gap-2 rounded-pill border-[1.5px] px-3.5 text-[14px] font-semibold no-underline",
                type === key ? "border-coral-600 bg-coral-100 text-navy-900" : "border-line bg-white text-ink-muted",
              )}
            >
              {key && <i aria-hidden="true" className={cn("size-2.5 flex-none rounded-full bg-linear-to-br", EXAM_TYPE_LOOK[key].band)} />}
              {key ? t.types[key] : t.typesAll}
            </Link>
          ))}
        </nav>

        <Card tone={quota.kind === "all" || quota.left > 0 ? "tint" : "flat"} className="grid gap-2">
          <p className="m-0 font-semibold text-navy-900">
            {quota.kind === "all"
              ? t.quotaAll
              : quota.left > 0
                ? t.quotaLeft(quota.kind)
                : t.quotaUsed(quota.kind, formatDate(quota.resetsAt))}
          </p>
          {quota.kind !== "all" && (
            <p className="m-0 text-small text-ink-muted">
              {t.quotaUpgrade(quota.kind)}{" "}
              <Link href="/odenis" className="font-semibold text-navy-500 underline underline-offset-3">
                {t.upgrade}
              </Link>
            </p>
          )}
          {sp.kvota === "0" && <p className="m-0 text-small font-semibold text-danger-700">{t.quotaEmpty}</p>}
        </Card>

        {exams.length === 0 && <p className="text-ink-muted">{t.empty}</p>}
        <div className="grid gap-4 md:grid-cols-2">
          {exams.map((e) => (
            <ExamCard key={e.id} e={e} state={state} quota={quota} />
          ))}
        </div>
      </Page>
    </>
  );
}

function StateDot({ progress }: { progress: Progress }) {
  return (
    <span
      aria-hidden="true"
      className={cn(
        "size-2.5 flex-none rounded-full",
        progress === "done" ? "bg-success-700" : progress === "progress" ? "bg-warning-700" : "border-2 border-navy-200 bg-white",
      )}
    />
  );
}

type CardExam = ExamMeta & { userStatus: ExamStatus; progress: Progress; ended: boolean };

/**
 * Sınaq kartı. Başlıq zolağı — sınağın tipi (9-cu sinif / 11-ci sinif / blok / mövzu, hər birinin öz rəngi);
 * vəziyyət — etiket və fon: işlənib — yaşıl fon və nəticə; yarımçıq — narıncı fon və irəliləyiş; hələ işlənməyib — ağ.
 */
function ExamCard({ e, state, quota }: { e: CardExam; state: DemoState; quota: ReturnType<typeof examQuota> }) {
  const t = az.app.store;
  const result = state.results[e.id];
  const attempt = state.attempts[e.id];
  const done = answeredCount(attempt);
  const { closed, coded, written } = e.counts;
  const canSell = isExamOpenForSale(e);

  return (
    <Card
      as="article"
      aria-label={`${e.title} — ${e.progress === "done" ? t.stateDone : e.progress === "progress" ? t.stateHalf : t.stateNew}`}
      className={cn(
        "relative grid gap-3.5 overflow-hidden",
        e.progress === "done" && "border-success-700/40 bg-success-100/70",
        e.progress === "progress" && "border-warning-700/40 bg-warning-100/40",
      )}
    >
      <ExamTypeBand type={e.examType} label={t.types[e.examType] ?? e.group} />

      <div className="flex flex-wrap items-center gap-2">
        {e.progress === "done" && (
          <Tag tone="success" icon={<CheckCircleIcon />}>
            {t.stateDone}
          </Tag>
        )}
        {e.progress === "progress" && <Tag tone="warning">{e.userStatus === "expired" ? t.expired : t.stateHalf}</Tag>}
        {e.progress === "new" && <Tag>{t.stateNew}</Tag>}
        {e.ended && <Tag tone="lock">{t.stateEnded}</Tag>}
        <span className="ml-auto inline-flex items-center gap-1 text-[13px] text-ink-muted tabular">
          <CalendarIcon className="size-4" />
          {t.created(formatDate(isoOf(e.createdAt)))}
        </span>
      </div>

      <div className="flex items-start justify-between gap-3">
        <div>
          {e.topicName && <span className={cn("text-small font-semibold", EXAM_TYPE_LOOK.movzu.ink)}>{t.topicExam(e.topicName)}</span>}
          <h2 className={h3Class}>{e.title}</h2>
        </div>
        {e.userStatus === "done" && <Tag tone="solid">{t.score(result.correct, result.wrong)}</Tag>}
        {e.userStatus === "locked" && canSell && <Tag className="tabular">{priceText(e.price)}</Tag>}
        {e.userStatus === "purchased" && <Tag tone="success">{t.owned}</Tag>}
      </div>

      <div className="flex flex-wrap gap-x-4 gap-y-2 text-small text-ink-muted">
        <span className="inline-flex items-center gap-1.5">
          <ListIcon className="size-[18px] text-navy-900" />
          {t.questions(e.total)}
        </span>
        <span className="inline-flex items-center gap-1.5">
          <ClockIcon className="size-[18px] text-navy-900" />
          {t.minutes(e.durationMin)}
        </span>
      </div>

      {e.progress === "progress" && attempt ? (
        <div className="grid gap-1.5">
          <div
            role="progressbar"
            aria-label={t.answered(done, e.total)}
            aria-valuemin={0}
            aria-valuemax={e.total}
            aria-valuenow={done}
            className="h-2.5 overflow-hidden rounded-pill bg-white"
          >
            <i className="block h-full rounded-pill bg-warning-700" style={{ width: `${Math.round((done / Math.max(1, e.total)) * 100)}%` }} />
          </div>
          <p className="m-0 text-small font-semibold text-ink">
            {t.answered(done, e.total)}
            {e.userStatus === "in_progress" && ` · ${t.paused(Math.ceil(remainingMs(attempt, e) / 60_000))}`}
          </p>
        </div>
      ) : (
        <>
          <FormatBar closed={closed} coded={coded} written={written} label={t.format(closed, coded, written)} />
          <p className="text-small text-ink-muted">{t.format(closed, coded, written)}</p>
        </>
      )}

      {e.userStatus === "in_progress" && (
        <ButtonLink href={`/sinaq/${e.id}`} block>
          {t.resume(done, e.total)}
        </ButtonLink>
      )}
      {e.userStatus === "expired" && (
        <ButtonLink href={`/sinaq/${e.id}`} variant="secondary" block>
          {t.result}
        </ButtonLink>
      )}
      {e.userStatus === "locked" &&
        canSell &&
        (quota.kind !== "all" && quota.left > 0 ? (
          <form action={claimExamAction.bind(null, e.id)}>
            <Button type="submit" block>
              {t.claim(quota.kind)}
            </Button>
          </form>
        ) : (
          <ButtonLink href={`/odenis?exam=${e.id}`} variant="secondary" block>
            {t.buy(priceText(e.price))}
          </ButtonLink>
        ))}
      {e.userStatus === "done" && (
        <ButtonLink href={`/sinaq/${e.id}/netice`} variant="secondary" block>
          {t.result}
        </ButtonLink>
      )}
      {e.userStatus === "purchased" && (
        <form action={startExamAction.bind(null, e.id)}>
          <Button type="submit" block>
            {t.start}
          </Button>
        </form>
      )}
    </Card>
  );
}
