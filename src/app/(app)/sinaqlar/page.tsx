import type { Metadata } from "next";
import Link from "next/link";
import { Page, Topbar } from "@/components/app/topbar";
import { ClockIcon, ListIcon } from "@/components/icons";
import { Button, ButtonLink } from "@/components/ui/button";
import { Card, FormatBar, Tag, h1Class, h3Class } from "@/components/ui/display";
import { az } from "@/content/az";
import { claimExamAction, startExamAction } from "@/lib/demo/actions";
import { EXAMS, EXAM_FORMAT, EXAM_QUESTIONS } from "@/lib/demo/content";
import { answeredCount, examStatus, formatDate, remainingMs } from "@/lib/demo/logic";
import { EXAM_PRICE, examQuota } from "@/lib/demo/plans";
import { initials, requireDemo } from "@/lib/demo/session";
import { cn } from "@/lib/cn";

export const metadata: Metadata = { title: az.app.store.title };

const FILTERS = ["all", "owned", "new"] as const;
type Filter = (typeof FILTERS)[number];

export default async function StorePage(props: PageProps<"/sinaqlar">) {
  const sp = await props.searchParams;
  const f = sp.f;
  const filter: Filter = FILTERS.includes(f as Filter) ? (f as Filter) : "all";
  const { user, state } = await requireDemo("/sinaqlar");
  const quota = examQuota(state);
  const t = az.app.store;
  const total = EXAM_QUESTIONS.length;
  const { closed, coded, written } = EXAM_FORMAT;

  const exams = EXAMS.map((e) => ({ ...e, status: examStatus(state, e.id) })).filter((e) =>
    filter === "all" ? true : filter === "new" ? e.status === "locked" : e.status !== "locked",
  );

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
              href={key === "all" ? "/sinaqlar" : `/sinaqlar?f=${key}`}
              aria-current={filter === key ? "page" : undefined}
              className={cn(
                "grid min-h-11 place-items-center rounded-md border-[1.5px] px-4 text-[15px] font-bold no-underline",
                filter === key ? "border-navy-900 bg-navy-900 text-white" : "border-control-border bg-white text-navy-900",
              )}
            >
              {t.filters[key]}
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
          {exams.map((e) => {
            const result = state.results[e.id];
            const done = answeredCount(state.attempts[e.id]);
            return (
              <Card as="article" key={e.id} className="grid gap-3.5">
                <div className="flex items-start justify-between gap-3">
                  <div>
                    <span className="text-small text-ink-muted">{e.group}</span>
                    <h2 className={h3Class}>{e.title}</h2>
                  </div>
                  {e.status === "in_progress" && <Tag tone="warning">{t.inProgress}</Tag>}
                  {e.status === "expired" && <Tag tone="danger">{t.expired}</Tag>}
                  {e.status === "locked" && <Tag className="tabular">{EXAM_PRICE}</Tag>}
                  {e.status === "done" && <Tag tone="solid">{t.score(result.score)}</Tag>}
                  {e.status === "purchased" && <Tag tone="success">{t.owned}</Tag>}
                </div>
                <div className="flex flex-wrap gap-x-4 gap-y-2 text-small text-ink-muted">
                  <span className="inline-flex items-center gap-1.5">
                    <ListIcon className="size-[18px] text-navy-900" />
                    {t.questions(total)}
                  </span>
                  <span className="inline-flex items-center gap-1.5">
                    <ClockIcon className="size-[18px] text-navy-900" />
                    {t.minutes(e.durationMin)}
                  </span>
                </div>
                <FormatBar closed={closed} coded={coded} written={written} label={t.format(closed, coded, written)} />
                <p className="text-small text-ink-muted">{t.format(closed, coded, written)}</p>
                {e.status === "in_progress" && (
                  <>
                    <p className="text-small font-semibold text-ink">
                      {t.paused(Math.ceil(remainingMs(state.attempts[e.id], e) / 60_000))}
                    </p>
                    <ButtonLink href={`/sinaq/${e.id}`} block>
                      {t.resume(done, total)}
                    </ButtonLink>
                  </>
                )}
                {e.status === "expired" && (
                  <ButtonLink href={`/sinaq/${e.id}`} variant="secondary" block>
                    {t.result}
                  </ButtonLink>
                )}
                {e.status === "locked" &&
                  (quota.kind !== "all" && quota.left > 0 ? (
                    <form action={claimExamAction.bind(null, e.id)}>
                      <Button type="submit" block>
                        {t.claim(quota.kind)}
                      </Button>
                    </form>
                  ) : (
                    <ButtonLink href={`/odenis?exam=${e.id}`} variant="secondary" block>
                      {t.buy(EXAM_PRICE)}
                    </ButtonLink>
                  ))}
                {e.status === "done" && (
                  <ButtonLink href={`/sinaq/${e.id}/netice`} variant="secondary" block>
                    {t.result}
                  </ButtonLink>
                )}
                {e.status === "purchased" && (
                  <form action={startExamAction.bind(null, e.id)}>
                    <Button type="submit" block>
                      {t.start}
                    </Button>
                  </form>
                )}
              </Card>
            );
          })}
        </div>
      </Page>
    </>
  );
}
