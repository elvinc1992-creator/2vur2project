"use client";

import { useRouter } from "next/navigation";
import { useMemo, useRef, useState, useTransition } from "react";
import { saveResultsAction } from "@/lib/teacher/actions";
import { gradeEntries, percentOf, type TestItem, type Variant } from "@/lib/teacher/variants";
import { cn } from "@/lib/cn";
import { btnMain } from "./ui";

type Row = Variant & { userId: string; name: string; entries: string[] };

const ALLOWED: Record<string, RegExp> = { closed: /^[A-Ea-e]?$/, coded: /^-?\d{0,5}([.,]\d{0,4})?$/, written: /^(0|1|0[.,]5?|0[.,])?$/ };

/**
 * Kağız sınağının nəticələri: hər sətir — şagird, hər sütun — sual (şagirdin kitabçasındakı sıra ilə).
 * Hərf yazılanda kursor növbəti xanaya keçir; düz / səhv rənglə; bal dərhal hesablanır (şagirdin variantına görə).
 */
export function EntryGrid({ testId, items, rows: initial, writtenOnly = false }: { testId: string; items: TestItem[]; rows: Row[]; writtenOnly?: boolean }) {
  const router = useRouter();
  const [rows, setRows] = useState(initial);
  const [saved, setSaved] = useState<number | null>(null);
  const [pending, start] = useTransition();
  const refs = useRef<Record<string, HTMLInputElement | null>>({});
  const graded = useMemo(() => rows.map((r) => gradeEntries(r, items, r.entries)), [rows, items]);

  const set = (ri: number, ci: number, raw: string) => {
    const it = items.find((x) => x.n === rows[ri].order[ci])!;
    // Onlayn sınaq: qapalı və kodlaşdırılan cavablar şagirdin özünündür, müəllim yalnız yazılı balı yazır
    if (writtenOnly && it.format !== "written") return;
    const v = it.format === "closed" ? raw.toUpperCase() : raw;
    if (!ALLOWED[it.format].test(v)) return;
    setSaved(null);
    setRows((prev) => prev.map((r, i) => (i === ri ? { ...r, entries: r.entries.map((e, j) => (j === ci ? v : e)) } : r)));
    // Hərf yazılan kimi növbəti xanaya
    if (it.format === "closed" && v) refs.current[`${ri}-${ci + 1}`]?.focus() ?? refs.current[`${ri + 1}-0`]?.focus();
  };

  const save = () =>
    start(async () => {
      const r = await saveResultsAction(
        testId,
        rows.map((x) => ({ userId: x.userId, entries: x.entries })),
      );
      if (r.ok) setSaved(r.saved ?? 0);
      router.refresh();
    });

  const n = items.length;
  return (
    <div className="grid gap-3">
      <div className="overflow-x-auto rounded-[20px] border border-[#e6e9f2] bg-white p-4" tabIndex={0} role="region" aria-label="Nəticələrin daxil edilməsi">
        <table className="border-collapse">
          <thead>
            <tr>
              <th scope="col" className="sticky left-0 bg-white px-2 py-2 text-left text-[11.5px] tracking-[0.08em] text-[#5b6785] uppercase">
                Şagird
              </th>
              {Array.from({ length: n }, (_, i) => (
                <th key={i} scope="col" className="px-0.5 py-2 text-center text-[11.5px] text-[#5b6785]">
                  {i + 1}
                </th>
              ))}
              <th scope="col" className="px-2 py-2 text-[11.5px] tracking-[0.08em] text-[#5b6785] uppercase">
                Bal
              </th>
            </tr>
          </thead>
          <tbody>
            {rows.map((r, ri) => (
              <tr key={r.userId} className="border-t border-[#e6e9f2]">
                <th scope="row" className="sticky left-0 bg-white px-2 py-1.5 text-left text-[14px] whitespace-nowrap">
                  {r.name} <span className="font-mono text-[12px] text-[#5b6785]">({r.letter})</span>
                </th>
                {r.order.map((baseN, ci) => {
                  const it = items.find((x) => x.n === baseN)!;
                  const g = graded[ri][ci];
                  const v = r.entries[ci] ?? "";
                  const state = !v ? "" : it.format === "written" ? "" : g.score === 1 ? "ok" : "bad";
                  return (
                    <td key={ci} className="px-0.5 py-1">
                      <input
                        ref={(el) => {
                          refs.current[`${ri}-${ci}`] = el;
                        }}
                        value={v}
                        readOnly={writtenOnly && it.format !== "written"}
                        onChange={(e) => set(ri, ci, e.target.value)}
                        inputMode={it.format === "closed" ? "text" : "decimal"}
                        maxLength={it.format === "closed" ? 1 : it.format === "written" ? 3 : 7}
                        aria-label={`${r.name}, sual ${ci + 1} (${it.format === "closed" ? "A–E" : it.format === "coded" ? "ədəd" : "bal 0 / 0,5 / 1"})`}
                        className={cn(
                          "h-9 rounded-[8px] border-[1.5px] text-center font-mono text-[14px] font-bold uppercase outline-none focus:border-[#8b5cf6]",
                          it.format === "coded" ? "w-[60px]" : "w-[38px]",
                          it.format === "written" && "bg-[#f5f3ff]",
                          state === "ok" ? "border-[#86efac] bg-[#f0fdf4]" : state === "bad" ? "border-[#fca5a5] bg-[#fef2f2]" : "border-[#e6e9f2] bg-[#fbfcfe]",
                        )}
                      />
                    </td>
                  );
                })}
                <td className="px-2 text-right font-black tabular-nums">{percentOf(graded[ri], n)}%</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
      <div className="flex flex-wrap items-center gap-3">
        <button type="button" onClick={save} disabled={pending} className={cn(btnMain, "disabled:opacity-70")}>
          {pending ? "Yadda saxlanılır…" : "Yadda saxla"}
        </button>
        <span role="status" className="text-[14px] font-semibold text-[#047857]">
          {saved !== null && `Yadda saxlanıldı: ${saved} şagird — nəticələr analitikaya və şagirdlərin zəif mövzu təhlilinə əlavə olundu.`}
        </span>
      </div>
    </div>
  );
}
