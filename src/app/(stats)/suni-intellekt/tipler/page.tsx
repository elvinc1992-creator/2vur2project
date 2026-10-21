import type { Metadata } from "next";
import Link from "next/link";
import { FreqChip } from "@/components/ai-badge";
import { Page, Topbar } from "@/components/app/topbar";
import { h1Class } from "@/components/ui/display";
import { aiText } from "@/content/az-ai";
import { getAiIndex } from "@/lib/ai";
import { cn } from "@/lib/cn";
import { AiTabs } from "../ai-tabs";

const t = aiText.types;

export const metadata: Metadata = { title: t.title };

/** Bütün sual tipləri (toplunun bölmələri) — imtahanda düşmə tezliyinə görə; mövzu süzgəci (?movzu=slug). */
export default async function AiTypesPage(props: PageProps<"/suni-intellekt/tipler">) {
  const { movzu } = await props.searchParams;
  const ix = await getAiIndex();
  const topic = typeof movzu === "string" ? ix.topics.find((x) => x.slug === movzu) : undefined;
  const topicsWithTypes = ix.topics.filter((x) => ix.types.some((y) => y.topicId === x.id));
  const rows = ix.types
    .filter((x) => !topic || x.topicId === topic.id)
    .sort((a, b) => b.shown - a.shown || a.title.localeCompare(b.title, "az"));
  const nameOf = new Map(ix.topics.map((x) => [x.id, x.name]));

  return (
    <>
      <Topbar title={t.title} />
      <Page>
        <div className="grid min-w-0 grid-cols-[minmax(0,1fr)] gap-5">
          <AiTabs current="/suni-intellekt/tipler" />
          <div className="grid gap-2">
            <h1 className={h1Class}>{t.h1}</h1>
            <p className="m-0 max-w-3xl text-ink-muted">{t.lead}</p>
          </div>

          <nav aria-label={t.filter} className="min-w-0">
            <ul className="m-0 flex list-none flex-wrap gap-2 p-0">
              {[{ slug: "", name: t.all }, ...topicsWithTypes].map((x) => {
                const on = x.slug ? topic?.slug === x.slug : !topic;
                return (
                  <li key={x.slug || "all"}>
                    <Link
                      href={x.slug ? `/suni-intellekt/tipler?movzu=${x.slug}` : "/suni-intellekt/tipler"}
                      aria-current={on ? "true" : undefined}
                      className={cn(
                        "inline-flex min-h-9 items-center rounded-pill border px-3 text-[13px] font-semibold no-underline",
                        on ? "border-navy-900 bg-navy-900 text-white" : "border-line bg-white text-navy-900 hover:bg-navy-050",
                      )}
                    >
                      {x.name}
                    </Link>
                  </li>
                );
              })}
            </ul>
          </nav>

          <p className="m-0 text-small text-ink-muted">{t.sort}</p>
          {rows.length === 0 ? (
            <p className="m-0 text-ink-muted">{t.empty}</p>
          ) : (
            <ol className="m-0 grid list-none gap-2 p-0 lg:grid-cols-2">
              {rows.map((x) => (
                <li key={x.id} className="min-w-0">
                  <Link
                    href={`/suni-intellekt/tipler/${x.id}`}
                    className="grid h-full gap-1.5 rounded-[14px] border border-line bg-white px-4 py-3 no-underline hover:border-violet-400 hover:bg-violet-50"
                  >
                    <span className="flex items-start justify-between gap-3">
                      <span className="font-semibold text-navy-900">{x.title}</span>
                      <FreqChip level={x.level} className="flex-none" />
                    </span>
                    <span className="flex flex-wrap gap-x-3 gap-y-0.5 text-[12.5px] text-ink-muted">
                      {!topic && <span>{nameOf.get(x.topicId)}</span>}
                      <b className="font-semibold text-ink tabular">{t.shown(x.shown)}</b>
                    </span>
                  </Link>
                </li>
              ))}
            </ol>
          )}
        </div>
      </Page>
    </>
  );
}
