"use client";

import Link from "next/link";
import { useRouter } from "next/navigation";
import { useTransition } from "react";
import { az } from "@/content/az";
import { cn } from "@/lib/cn";
import { isDefault, toQuery, type FilterOptions, type Kind, type StatFilters } from "@/lib/stats/filters";

const KINDS: Kind[] = ["all", "buraxilis", "qebul"];

/** Süzgəc sətri: dəyişiklik dərhal URL-ə yazılır (paylaşmaq olar). */
export function FilterBar({ filters, options }: { filters: StatFilters; options: FilterOptions }) {
  const t = az.app.stats.filters;
  const router = useRouter();
  const [pending, startTransition] = useTransition();

  const apply = (next: StatFilters) =>
    startTransition(() => router.push(`/statistika${toQuery(next)}`, { scroll: false }));

  const segment = "has-checked:border-navy-900 has-checked:bg-navy-900 has-checked:text-white";
  const focus = "has-focus-visible:outline-3 has-focus-visible:outline-offset-2 has-focus-visible:outline-navy-500";

  return (
    <section aria-label={t.label} aria-busy={pending || undefined} className="grid gap-4 rounded-lg border border-line bg-white p-4 lg:p-5">
      <div className="flex flex-wrap items-end gap-x-6 gap-y-4">
        <fieldset className="m-0 grid min-w-0 gap-1.5 border-0 p-0">
          <legend className="mb-1.5 p-0 text-label font-semibold text-ink">{t.kind}</legend>
          <div className="flex flex-wrap gap-2">
            {KINDS.map((k) => (
              <label
                key={k}
                className={cn(
                  "grid min-h-11 cursor-pointer place-items-center rounded-md border-[1.5px] border-control-border bg-white px-4 text-[15px] font-bold text-navy-900",
                  segment,
                  focus,
                )}
              >
                <input
                  type="radio"
                  name="nov"
                  value={k}
                  className="sr-only"
                  checked={filters.kind === k}
                  onChange={() => apply({ kind: k, group: null, years: filters.years })}
                />
                {t.kinds[k]}
              </label>
            ))}
          </div>
        </fieldset>

        {filters.kind === "qebul" && options.groups.length > 0 && (
          <div className="grid gap-1.5">
            <label htmlFor="qrup" className="text-label font-semibold text-ink">
              {t.group}
            </label>
            <select
              id="qrup"
              value={filters.group ?? ""}
              onChange={(e) => apply({ ...filters, group: e.target.value || null })}
              className="min-h-11 rounded-md border-[1.5px] border-control-border bg-white px-3 text-body text-ink focus-visible:ring-2 focus-visible:ring-navy-500 focus-visible:ring-offset-2 focus-visible:outline-none"
            >
              <option value="">{t.allGroups}</option>
              {options.groups.map((g) => (
                <option key={g} value={g}>
                  {t.groupOpt(g)}
                </option>
              ))}
            </select>
          </div>
        )}

        <fieldset className="m-0 grid min-w-0 gap-1.5 border-0 p-0" aria-describedby="years-hint">
          <legend className="mb-1.5 p-0 text-label font-semibold text-ink">{t.years}</legend>
          <div className="flex flex-wrap gap-2">
            {options.years.map((y) => {
              const on = filters.years.includes(y);
              return (
                <label
                  key={y}
                  className={cn(
                    "grid min-h-11 cursor-pointer place-items-center rounded-md border-[1.5px] border-control-border bg-white px-4 text-[15px] font-bold text-navy-900 tabular",
                    segment,
                    focus,
                  )}
                >
                  <input
                    type="checkbox"
                    value={y}
                    className="sr-only"
                    checked={on}
                    onChange={() =>
                      apply({
                        ...filters,
                        years: on ? filters.years.filter((x) => x !== y) : [...filters.years, y].sort((a, b) => a - b),
                      })
                    }
                  />
                  {y}
                </label>
              );
            })}
          </div>
          <p id="years-hint" className="text-small text-ink-muted">
            {t.yearsHint}
          </p>
        </fieldset>
      </div>
      <div className="flex flex-wrap items-center gap-3 text-small">
        {!isDefault(filters) && (
          <Link href="/statistika" scroll={false} className="font-semibold text-navy-500 underline underline-offset-3">
            {t.reset}
          </Link>
        )}
        <span role="status" className="text-ink-muted">
          {pending ? t.updating : ""}
        </span>
      </div>
    </section>
  );
}
