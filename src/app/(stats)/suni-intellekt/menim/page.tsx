import type { Metadata } from "next";
import Link from "next/link";
import { FreqChip } from "@/components/ai-badge";
import { Page, Topbar } from "@/components/app/topbar";
import { ChipIcon } from "@/components/icons";
import { ButtonLink } from "@/components/ui/button";
import { Card, Meter, h1Class, h3Class } from "@/components/ui/display";
import { EmptyState } from "@/components/ui/empty-art";
import { aiText } from "@/content/az-ai";
import { personalAnalysis, type PersonalTypeRow } from "@/lib/ai/personal";
import { requireDemo } from "@/lib/demo/session";
import { AiTabs } from "../ai-tabs";

const t = aiText.mine;

export const metadata: Metadata = { title: t.title };

/** Şəxsi AI analizi: tez düşən və səhv edilən tiplər öndə, güclü tərəflər ayrıca. */
export default async function AiMinePage() {
  const { user } = await requireDemo("/suni-intellekt/menim");
  const a = await personalAnalysis(user.id!);
  const empty = a.priority.length === 0 && a.strong.length === 0;

  return (
    <>
      <Topbar title={t.title} />
      <Page>
        <div className="grid min-w-0 grid-cols-[minmax(0,1fr)] gap-5">
          <AiTabs current="/suni-intellekt/menim" />
          <div className="grid gap-2">
            <h1 className={h1Class}>{t.h1}</h1>
            <p className="m-0 max-w-3xl text-ink-muted">{t.lead}</p>
            {a.answers > 0 && <p className="m-0 text-small text-ink-muted">{t.basis(a.answers)}</p>}
          </div>

          {empty ? (
            <EmptyState icon={<ChipIcon />} title={t.title}>
              <p>{t.empty}</p>
              <ButtonLink href="/gunun-suallari" variant="primary" className="mt-3">
                {t.start}
              </ButtonLink>
            </EmptyState>
          ) : (
            <div className="grid items-start gap-6 lg:grid-cols-[1.4fr_1fr]">
              {a.priority.length > 0 && <Rows id="ai-pri" title={t.priorityTitle} rows={a.priority} showScore />}
              {a.strong.length > 0 && <Rows id="ai-str" title={t.strongTitle} rows={a.strong} />}
            </div>
          )}
        </div>
      </Page>
    </>
  );
}

function Rows({ id, title, rows, showScore }: { id: string; title: string; rows: PersonalTypeRow[]; showScore?: boolean }) {
  return (
    <Card as="section" aria-labelledby={id} className="grid gap-3">
      <h2 id={id} className={h3Class}>
        {title}
      </h2>
      <ol className="m-0 grid list-none gap-2 p-0">
        {rows.map((r) => {
          const pct = Math.round((r.correct / r.total) * 100);
          return (
            <li key={r.type.id}>
              <Link
                href={`/suni-intellekt/tipler/${r.type.id}`}
                className="grid gap-1.5 rounded-[12px] border border-line px-3 py-2.5 no-underline hover:border-violet-400 hover:bg-violet-50"
              >
                <span className="flex items-start justify-between gap-3">
                  <span className="grid min-w-0">
                    <span className="font-semibold text-navy-900">{r.type.title}</span>
                    <span className="text-[12.5px] text-ink-muted">{r.topic}</span>
                  </span>
                  <FreqChip level={r.type.level} className="flex-none" />
                </span>
                <span className="flex flex-wrap justify-between gap-2 text-[12.5px] text-ink-muted tabular">
                  <span>{t.row(r.correct, r.total)}</span>
                  <span>{aiText.types.shown(r.type.shown)}</span>
                  {showScore && (
                    <b className="text-ink">
                      {t.score}: {r.score.toLocaleString("az")}
                    </b>
                  )}
                </span>
                <Meter value={pct} label={`${r.type.title}: ${pct}%`} tone={pct >= 80 ? "success" : pct < 50 ? "coral" : "navy"} />
              </Link>
            </li>
          );
        })}
      </ol>
    </Card>
  );
}
