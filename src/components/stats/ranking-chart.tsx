"use client";

import { useRouter } from "next/navigation";
import { cn } from "@/lib/cn";

export type RankingBar = {
  slug: string;
  name: string;
  n: number;
  label: string;
  personal?: { pct: number; label: string };
};

/**
 * Üfüqi bar chart: hər barda rəqəm və faiz mətni (yalnız rəng yox).
 * Siçanla bara klik — mövzu səhifəsi; klaviatura/ekran oxucu üçün eyni linklər cədvəldədir.
 */
export function RankingChart({ bars, hrefSuffix }: { bars: RankingBar[]; hrefSuffix: string }) {
  const router = useRouter();
  const max = Math.max(1, ...bars.map((b) => b.n));
  return (
    <ul className="m-0 grid list-none gap-3 p-0">
      {bars.map((b) => (
        <li
          key={b.slug}
          onClick={() => router.push(`/statistika/${b.slug}${hrefSuffix}`)}
          className="grid cursor-pointer gap-1 rounded-[10px] px-1 py-0.5 hover:bg-navy-050"
        >
          <div className="flex flex-wrap items-baseline justify-between gap-x-3 text-small">
            <span className="font-semibold text-ink">{b.name}</span>
            <b className="text-navy-900 tabular">{b.label}</b>
          </div>
          <div className="h-3 overflow-hidden rounded-pill bg-navy-100 shadow-[inset_0_0_0_1px_var(--track-edge)]">
            <i className="block h-full rounded-pill bg-navy-900" style={{ width: `${(b.n / max) * 100}%` }} />
          </div>
          {b.personal && (
            <div className="flex items-center gap-2 text-caption text-ink-muted">
              <span className="relative h-1.5 w-24 flex-none rounded-pill bg-navy-100 shadow-[inset_0_0_0_1px_var(--track-edge)]">
                <i
                  className={cn(
                    "absolute top-1/2 size-3 -translate-x-1/2 -translate-y-1/2 rounded-full border-2 border-white",
                    b.personal.pct < 0.5 ? "bg-coral-600" : "bg-success-700",
                  )}
                  style={{ left: `${b.personal.pct * 100}%` }}
                />
              </span>
              <span className="font-semibold text-ink">{b.personal.label}</span>
            </div>
          )}
        </li>
      ))}
    </ul>
  );
}
