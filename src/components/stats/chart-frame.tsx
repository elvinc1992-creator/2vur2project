"use client";

import { useState, useSyncExternalStore, type ReactNode } from "react";
import { az } from "@/content/az";
import { cn } from "@/lib/cn";

const MOBILE = "(max-width: 639.98px)";
const subscribe = (cb: () => void) => {
  const mq = window.matchMedia(MOBILE);
  mq.addEventListener("change", cb);
  return () => mq.removeEventListener("change", cb);
};

/**
 * Qrafik ↔ cədvəl. Qrafik role="img" + xülasə aria-label; cədvəl əsl <table>.
 * Mobil-də (< 640px) default olaraq cədvəl göstərilir.
 */
export function ChartFrame({
  id,
  summary,
  chart,
  table,
  className,
}: {
  id: string;
  summary: string;
  chart: ReactNode;
  table: ReactNode;
  className?: string;
}) {
  const t = az.app.stats.table;
  const isMobile = useSyncExternalStore(
    subscribe,
    () => window.matchMedia(MOBILE).matches,
    () => false,
  );
  const [choice, setChoice] = useState<"chart" | "table" | null>(null);
  const view = choice ?? (isMobile ? "table" : "chart");

  return (
    <div className={cn("grid grid-cols-1 gap-3", className)}>
      {view === "chart" ? (
        <div role="img" aria-label={summary} id={`${id}-chart`}>
          {chart}
        </div>
      ) : (
        <div id={`${id}-table`}>{table}</div>
      )}
      <button
        type="button"
        aria-controls={view === "chart" ? `${id}-chart` : `${id}-table`}
        onClick={() => setChoice(view === "chart" ? "table" : "chart")}
        className="min-h-11 cursor-pointer justify-self-start rounded-[10px] px-1 text-small font-semibold text-navy-500 underline underline-offset-3"
      >
        {view === "chart" ? t.show : t.chart}
      </button>
    </div>
  );
}

/** Əlçatan cədvəl: <caption>, <th scope>. */
export function DataTable({
  caption,
  head,
  rows,
}: {
  caption: string;
  head: string[];
  rows: Array<Array<ReactNode>>;
}) {
  return (
    <div className="overflow-x-auto rounded-lg border border-line bg-white" tabIndex={0} role="region" aria-label={caption}>
      <table className="w-full border-separate border-spacing-0 text-small">
        <caption className="caption-top px-3 py-2 text-left text-small text-ink-muted">{caption}</caption>
        <thead>
          <tr>
            {head.map((h, i) => (
              <th
                key={h}
                scope="col"
                className={cn(
                  "border-b border-line bg-navy-050 px-3 py-2.5 text-caption font-bold tracking-[0.04em] text-ink-muted uppercase",
                  i === 0 ? "text-left" : "text-right",
                )}
              >
                {h}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {rows.map((r, i) => (
            <tr key={i}>
              {r.map((c, j) =>
                j === 0 ? (
                  <th
                    key={j}
                    scope="row"
                    className="border-b border-line px-3 py-2.5 text-left font-semibold text-ink"
                  >
                    {c}
                  </th>
                ) : (
                  <td key={j} className="border-b border-line px-3 py-2.5 text-right tabular">
                    {c}
                  </td>
                ),
              )}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
