import { and, eq } from "drizzle-orm";
import type { Metadata } from "next";
import Image from "next/image";
import { notFound } from "next/navigation";
import { Page, Topbar } from "@/components/app/topbar";
import { CheckCircleIcon, XCircleIcon } from "@/components/icons";
import { Button, ButtonLink } from "@/components/ui/button";
import { Card, h1Class } from "@/components/ui/display";
import { MathText } from "@/components/ui/math-text";
import { az } from "@/content/az";
import { db } from "@/db";
import { topics, weakPracticeSets } from "@/db/schema";
import { cn } from "@/lib/cn";
import { LETTERS, type Letter } from "@/lib/demo/content";
import { requireDemo } from "@/lib/demo/session";
import { findRepetitorQuestion, getRepetitorKeys } from "@/lib/repetitor/source";
import { submitPracticeAction, type SetItem } from "@/lib/weak/actions";
import { GROWING_BELOW } from "@/lib/weak/compute";
import { shownLetter } from "@/lib/weak/spread";

export const metadata: Metadata = { title: az.app.weak.title };

const t = az.app.weak;

/** Hədəfli məşq / təkrar yoxlama: bütün suallar bir formada; bitəndən sonra nəticə və düzgün cavablar. */
export default async function PracticeSetPage(props: PageProps<"/zeif-movzular/mesq/[id]">) {
  const { id } = await props.params;
  const { user } = await requireDemo(`/zeif-movzular/mesq/${id}`);
  const [set] = await db
    .select({ s: weakPracticeSets, topic: topics.name })
    .from(weakPracticeSets)
    .innerJoin(topics, eq(topics.id, weakPracticeSets.topicId))
    .where(and(eq(weakPracticeSets.id, id), eq(weakPracticeSets.userId, user.id!)));
  if (!set) notFound();

  const items = JSON.parse(set.s.questionIds) as SetItem[];
  const questions = (await Promise.all(items.map((it) => findRepetitorQuestion(it.code)))).map((q, i) => ({ q, it: items[i] }));
  const done = Boolean(set.s.finishedAt);
  const keys = done ? await getRepetitorKeys(items.map((i) => i.code)) : null;
  const answers = JSON.parse(set.s.answers) as Record<string, Letter>;
  const title = set.s.kind === "fix" ? t.setFix(set.topic) : t.setRecheck(set.topic);
  const passed = done && items.length > 0 && (set.s.correct ?? 0) / items.length >= GROWING_BELOW;

  return (
    <>
      <Topbar title={t.title} back="/zeif-movzular" />
      <Page narrow>
        <h1 className={h1Class}>{title}</h1>
        {done ? (
          <Card tone="navy" className="grid gap-1" aria-label={t.setResult(set.s.correct ?? 0, items.length)}>
            <span className="font-display text-[40px] leading-[48px] font-extrabold text-white tabular">
              {t.setResult(set.s.correct ?? 0, items.length)}
            </span>
            <span className="text-on-navy-muted">
              {set.s.kind === "fix"
                ? passed
                  ? t.setPassedFix
                  : t.setFailedFix
                : passed
                  ? t.setPassedRecheck
                  : t.setFailedRecheck}
            </span>
          </Card>
        ) : (
          <p className="text-small text-ink-muted">{t.setIntro(items.length)}</p>
        )}

        <form action={submitPracticeAction.bind(null, id)} className="grid gap-4">
          {questions.map(({ q, it }, i) =>
            q ? (
              <Card key={it.code} as="section" aria-labelledby={`wq-${it.code}`} className="grid gap-3">
                <p id={`wq-${it.code}`} className="m-0">
                  <b className="tabular">{i + 1}. </b>
                  <MathText text={q.text} />
                </p>
                {q.imageUrl && (
                  <Image
                    src={q.imageUrl}
                    alt={q.imageAlt ?? ""}
                    width={520}
                    height={360}
                    className="h-auto max-h-[280px] w-auto max-w-full justify-self-center rounded-md border border-line bg-white object-contain p-2"
                  />
                )}
                <fieldset className="m-0 grid min-w-0 gap-2 border-0 p-0 sm:grid-cols-2" disabled={done}>
                  <legend className="sr-only">{t.setOptions(i + 1)}</legend>
                  {LETTERS.map((l) => (
                    <label
                      key={l}
                      className={cn(
                        "flex min-h-12 cursor-pointer items-center gap-2 rounded-md border-[1.5px] px-3 py-2",
                        "border-control-border bg-white text-navy-900 has-checked:border-navy-900 has-checked:bg-navy-900 has-checked:text-white",
                      )}
                    >
                      <input type="radio" name={`q-${it.code}`} value={l} defaultChecked={answers[it.code] === l} className="sr-only" />
                      <b>{l})</b>
                      <MathText text={q.options[it.map[l]]} displayStyle />
                    </label>
                  ))}
                </fieldset>
                {done && keys && (
                  <Result given={answers[it.code]} correct={shownLetter(it.map, keys.get(it.code)!.answer)} />
                )}
              </Card>
            ) : null,
          )}
          {done ? (
            <ButtonLink href="/zeif-movzular" className="justify-self-start">
              {t.setBack}
            </ButtonLink>
          ) : (
            <Button type="submit" block>
              {t.setSubmit}
            </Button>
          )}
        </form>
      </Page>
    </>
  );
}

function Result({ given, correct }: { given: Letter | undefined; correct: Letter }) {
  const ok = given === correct;
  return (
    <p className={cn("m-0 flex items-center gap-2 text-small font-semibold", ok ? "text-success-700" : "text-danger-700")}>
      {ok ? <CheckCircleIcon className="size-5 flex-none" /> : <XCircleIcon className="size-5 flex-none" />}
      {ok ? t.setCorrect : given ? t.setWrong(correct) : t.setEmpty(correct)}
    </p>
  );
}
