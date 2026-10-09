import { az } from "@/content/az";

/** Statistikanın əhatəsi — yalnız məlumat (klik olunmur): imtahan növü və illər. */
export function ScopeBar() {
  const t = az.app.stats.filters;
  return (
    <dl className="m-0 flex flex-wrap gap-x-8 gap-y-3 rounded-lg border border-line bg-white p-4 lg:p-5">
      {[
        [t.kind, t.kindsValue],
        [t.years, t.yearsValue],
      ].map(([label, value]) => (
        <div key={label} className="grid gap-1">
          <dt className="text-label font-semibold text-ink-muted">{label}</dt>
          <dd className="m-0 font-display text-lg leading-6 font-extrabold text-navy-900 tabular">{value}</dd>
        </div>
      ))}
    </dl>
  );
}
