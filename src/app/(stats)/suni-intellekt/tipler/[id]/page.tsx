import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { FreqChip } from "@/components/ai-badge";
import { Page, Topbar } from "@/components/app/topbar";
import { ArrowIcon, LockIcon } from "@/components/icons";
import { StatCard } from "@/components/stats/charts";
import { Card, Tag, h1Class, h3Class } from "@/components/ui/display";
import { MathText } from "@/components/ui/math-text";
import { aiText } from "@/content/az-ai";
import { FORMAT_LABEL, getAiType } from "@/lib/ai";
import { optionalDemo } from "@/lib/demo/session";
import { tutorContext } from "@/lib/repetitor/progress";
import { AiTabs } from "../../ai-tabs";

const t = aiText.type;

export const metadata: Metadata = { title: aiText.types.title };

/** Tip: imtahanlarda düşmə statistikası və saytdakı uyğun suallar (cavabsız; kilidli sualın mətni göstərilmir). */
export default async function AiTypePage(props: PageProps<"/suni-intellekt/tipler/[id]">) {
  const id = Number((await props.params).id);
  const data = Number.isInteger(id) ? await getAiType(id) : null;
  if (!data) notFound();
  const { type, topic, questions } = data;
  const { state } = await optionalDemo();
  const ctx = await tutorContext(state);

  return (
    <>
      <Topbar title={aiText.types.title} back="/suni-intellekt/tipler" />
      <Page>
        <div className="grid min-w-0 grid-cols-[minmax(0,1fr)] gap-5">
          <AiTabs current="/suni-intellekt/tipler" />
          <div className="grid gap-2">
            <div className="flex flex-wrap items-center gap-2">
              <Tag>{topic.name}</Tag>
              <FreqChip level={type.level} />
            </div>
            <h1 className={h1Class}>{type.title}</h1>
          </div>

          <dl className="m-0 grid gap-4 sm:grid-cols-2 lg:max-w-[720px]">
            <StatCard label={t.shown} value={String(type.shown)} sub={t.period} />
            <StatCard label={t.level} value={aiText.badge.levels[type.level]} />
          </dl>

          <section aria-labelledby="ai-q" className="grid gap-3">
            <h2 id="ai-q" className={h3Class}>
              {t.questions}
            </h2>
            {questions.length === 0 ? (
              <p className="m-0 text-ink-muted">{t.none}</p>
            ) : (
              <ol className="m-0 grid list-none gap-2 p-0 lg:grid-cols-2">
                {questions.map((q) => {
                  const open = ctx.isOpen(q.code);
                  return (
                    <li key={q.code} className="min-w-0">
                      <Card tone="flat" className="grid h-full gap-2 p-4!">
                        <div className="flex items-center justify-between gap-2 text-[12.5px] text-ink-muted">
                          <span className="font-semibold tabular">
                            Sual {q.n} · {FORMAT_LABEL[q.format]}
                          </span>
                          {!open && <LockIcon aria-label={t.locked} className="size-4" />}
                        </div>
                        {open ? (
                          <p className="m-0 line-clamp-3 text-[15px] leading-[1.55]">
                            <MathText text={q.text} />
                          </p>
                        ) : (
                          <p className="m-0 text-small text-ink-muted">{t.locked}</p>
                        )}
                        <Link
                          href={open ? `/onlayn-repetitor/${topic.slug}/${q.n}` : `/onlayn-repetitor/${topic.slug}`}
                          className="inline-flex items-center gap-1 justify-self-start text-small font-bold text-violet-800"
                        >
                          {t.open}
                          <ArrowIcon className="size-4" />
                        </Link>
                      </Card>
                    </li>
                  );
                })}
              </ol>
            )}
          </section>
        </div>
      </Page>
    </>
  );
}
