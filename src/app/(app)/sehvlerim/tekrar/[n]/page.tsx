import type { Metadata } from "next";
import { notFound, redirect } from "next/navigation";
import { DailyPager } from "@/components/app/daily";
import { Page, Topbar } from "@/components/app/topbar";
import { RetryIcon } from "@/components/icons";
import { Tag } from "@/components/ui/display";
import { QuestionCard } from "@/components/ui/question";
import { az } from "@/content/az";
import type { PagerItem } from "@/lib/demo/logic";
import { requireDemo } from "@/lib/demo/session";
import { getPracticeKey, practicePool } from "@/lib/review/pool";
import { ReviewAnswer } from "./review-answer";

export const metadata: Metadata = { title: az.app.mistakes.session };

export default async function ReviewQuestionPage(props: PageProps<"/sehvlerim/tekrar/[n]">) {
  const { n } = await props.params;
  const { state } = await requireDemo(`/sehvlerim/tekrar/${n}`);
  const review = state.review;
  if (!review) redirect("/sehvlerim");
  const idx = Number(n) - 1;
  const item = review.items[idx];
  if (!item) notFound();

  const q = (await practicePool()).find((x) => x.ref === item.ref);
  const key = await getPracticeKey(item.ref);
  if (!q || !key) notFound();

  const t = az.app.mistakes;
  const total = review.items.length;
  const given = review.answers[item.ref];
  const nextHref = idx + 1 < total ? `/sehvlerim/tekrar/${idx + 2}` : "/sehvlerim?bitdi=1";
  const pager: PagerItem[] = review.items.map((it, i) => {
    const a = review.answers[it.ref];
    return { n: i + 1, href: `/sehvlerim/tekrar/${i + 1}`, status: a ? (a.ok ? "ok" : "bad") : "open", current: i === idx };
  });
  const done = Object.keys(review.answers).length;

  return (
    <>
      <Topbar title={t.session} back="/sehvlerim" close="/panel" />
      <Page narrow>
        <h1 className="sr-only">
          {t.session}: {n} / {total}, {item.kind === "mistake" ? t.kindMistake : t.kindSimilar}
        </h1>
        <div className="grid gap-2">
          <div className="flex items-center justify-between gap-3 text-small">
            <span className="text-ink-muted">{t.title}</span>
            <b className="tabular">
              {done} / {total}
            </b>
          </div>
          <DailyPager items={pager} label={t.pagerLabel} />
        </div>
        <div className="flex flex-wrap items-center gap-2">
          {item.kind === "mistake" ? (
            <Tag tone="danger" icon={<RetryIcon />}>
              {t.kindMistake}
            </Tag>
          ) : (
            <Tag tone="coral">{t.kindSimilar}</Tag>
          )}
          <Tag>{q.topicName}</Tag>
          <Tag tone="type">{q.type}</Tag>
        </div>
        <QuestionCard id="review-q" n={idx + 1} total={total} text={q.text} />
        <ReviewAnswer
          key={item.ref}
          n={idx + 1}
          kind={item.kind}
          options={q.options}
          bookRef={q.bookRef}
          last={idx + 1 === total}
          initial={
            given
              ? {
                  chosen: given.a,
                  correct: given.ok,
                  answer: key.answer,
                  steps: key.steps,
                  fixedNow: given.ok && item.kind === "mistake",
                  nextHref,
                }
              : null
          }
        />
      </Page>
    </>
  );
}
