import Link from "next/link";
import { BookIcon, LockIcon } from "@/components/icons";
import { ButtonLink } from "@/components/ui/button";
import { Tag, h3Class } from "@/components/ui/display";
import { az } from "@/content/az";
import { fmtPct } from "@/lib/format";
import { getTopicRefs, type RankingRow } from "@/lib/stats/queries";
import type { Personal } from "@/lib/demo/personal";

type Access = "anon" | "free" | "paid";

/**
 * Prioritet plan (ödənişli). Kilid serverdədir: pulsuz/qonaq üçün real data heç sorğulanmır,
 * yalnız bulanıq nümunə göstərilir.
 */
export async function PriorityPlan({
  access,
  ranking,
  personal,
  hasData,
  topicIds,
}: {
  access: Access;
  ranking: RankingRow[];
  personal: Map<string, Personal>;
  hasData: boolean;
  topicIds: Map<string, number>;
}) {
  const t = az.app.stats.plan;

  if (access !== "paid") {
    return (
      <div className="relative overflow-hidden rounded-lg border border-line bg-white">
        <ul aria-hidden="true" className="m-0 grid list-none gap-3 p-5 blur-[5px] select-none">
          {["█████████ ████", "███████ ██████████", "████ ███████", "██████████ ███", "███████ █████"].map((x, i) => (
            <li key={i} className="flex items-center justify-between gap-3 text-ink-muted">
              <span>
                {i + 1}. {x}
              </span>
              <span>██ %</span>
            </li>
          ))}
        </ul>
        <div className="absolute inset-0 grid content-end gap-3 bg-gradient-to-b from-white/40 to-white/95 p-5">
          <span className="grid size-10 place-items-center rounded-[12px] bg-navy-100 text-navy-900">
            <LockIcon className="size-5" />
          </span>
          <p className="font-bold text-navy-900">{t.lockedTitle}</p>
          <p className="text-small text-ink">{access === "anon" ? t.loginText : t.lockedText}</p>
          <div className="flex flex-wrap gap-2">
            {access === "anon" ? (
              <ButtonLink href="/daxil-ol?next=/statistika" size="sm">
                {az.app.stats.login}
              </ButtonLink>
            ) : (
              <ButtonLink href="/odenis" variant="primary" size="sm">
                {t.subscribe}
              </ButtonLink>
            )}
          </div>
        </div>
      </div>
    );
  }

  if (!hasData) {
    return <p className="rounded-lg border border-dashed border-control-border bg-white p-5 text-ink">{t.noData}</p>;
  }

  // Bal = çıxma payı × (1 − düzgün faiz). Yalnız istifadəçinin məlumatı olan mövzular.
  const plan = ranking
    .filter((r) => personal.has(r.name))
    .map((r) => ({ ...r, mine: personal.get(r.name)!, score: r.share * (1 - personal.get(r.name)!.pct) }))
    .sort((a, b) => b.score - a.score)
    .slice(0, 5);

  const refs = await Promise.all(plan.map((p) => getTopicRefs(topicIds.get(p.slug)!, 3)));

  return (
    <ol className="m-0 grid list-none gap-3 p-0">
      {plan.map((p, i) => (
        <li key={p.slug} className="grid gap-2 rounded-lg border border-line bg-white p-4">
          <div className="flex flex-wrap items-center justify-between gap-2">
            <h3 className={h3Class}>
              <span className="tabular">{i + 1}.</span>{" "}
              <Link href={`/statistika/${p.slug}`} className="text-navy-900 underline-offset-3 hover:underline">
                {p.name}
              </Link>
            </h3>
            <Tag tone={p.mine.pct < 0.5 ? "coral" : "topic"}>{t.score(fmtPct(p.share), fmtPct(p.mine.pct, 0))}</Tag>
          </div>
          {refs[i].rows.length ? (
            <div className="grid gap-1 text-small">
              <span className="text-ink-muted">{t.refs}</span>
              <ul className="m-0 grid list-none gap-1 p-0">
                {refs[i].rows.map((r) => (
                  <li key={`${r.exam}-${r.no}`} className="flex items-start gap-2 font-semibold text-navy-900">
                    <BookIcon className="mt-0.5 size-4 flex-none" />
                    {r.ref2025 ? `2025 toplu, ${r.ref2025}` : `2023 toplu, ${r.ref2023}`}
                  </li>
                ))}
              </ul>
            </div>
          ) : (
            <p className="text-small text-ink-muted">{t.noRefs}</p>
          )}
        </li>
      ))}
    </ol>
  );
}
