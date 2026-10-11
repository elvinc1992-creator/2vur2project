"use client";

import { useState } from "react";
import { cn } from "@/lib/cn";

export type LbRow = { place: string; name: string; sub: string; score: string };

const MEDAL = ["🥇", "🥈", "🥉"];

/** Reytinq: Şagirdlər / Məktəblər / Rayonlar. */
export function LeaderboardTabs({ data, labels }: { data: Record<"p" | "s" | "r", LbRow[]>; labels: { p: string; s: string; r: string; place: string; name: string; sub: string; score: string; empty: string } }) {
  const [k, setK] = useState<"p" | "s" | "r">("p");
  const rows = data[k];
  return (
    <div className="overflow-hidden rounded-[22px] border border-[#e6e9f2] bg-white">
      <div role="tablist" aria-label={labels.p} className="flex flex-wrap gap-1.5 border-b border-[#e6e9f2] p-3">
        {(["p", "s", "r"] as const).map((x) => (
          <button
            key={x}
            type="button"
            role="tab"
            aria-selected={k === x}
            onClick={() => setK(x)}
            className={cn(
              "min-h-10 cursor-pointer rounded-[10px] px-3.5 text-[13.5px] font-bold",
              "focus-visible:outline-3 focus-visible:outline-offset-2 focus-visible:outline-[#4f46e5]",
              k === x ? "bg-[#0f1b3d] text-white" : "text-[#5b6785] hover:bg-[#f4f6fb]",
            )}
          >
            {labels[x]}
          </button>
        ))}
      </div>
      <div role="tabpanel" className="overflow-x-auto" tabIndex={0} aria-label={labels[k]}>
        {rows.length === 0 ? (
          <p className="m-0 px-4 py-6 text-center text-[#5b6785]">{labels.empty}</p>
        ) : (
          <table className="w-full border-collapse text-[14.5px]">
            <thead>
              <tr className="text-left text-[12px] tracking-[0.08em] text-[#5b6785] uppercase">
                <th scope="col" className="px-4 py-3">{labels.place}</th>
                <th scope="col" className="px-4 py-3">{labels.name}</th>
                <th scope="col" className="px-4 py-3 max-sm:hidden">{labels.sub}</th>
                <th scope="col" className="px-4 py-3 text-right">{labels.score}</th>
              </tr>
            </thead>
            <tbody>
              {rows.map((r, i) => (
                <tr key={`${r.name}-${i}`} className="border-t border-[#e6e9f2]">
                  <td className="w-[60px] px-4 py-3 font-black tabular-nums">
                    {MEDAL[Number(r.place) - 1] ? <span aria-label={`${r.place}-ci yer`}>{MEDAL[Number(r.place) - 1]}</span> : r.place}
                  </td>
                  <td className="px-4 py-3">
                    <b>{r.name}</b>
                    <span className="block text-[12.5px] text-[#5b6785] sm:hidden">{r.sub}</span>
                  </td>
                  <td className="px-4 py-3 text-[#5b6785] max-sm:hidden">{r.sub}</td>
                  <td className="px-4 py-3 text-right font-extrabold tabular-nums">{r.score}</td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>
    </div>
  );
}
