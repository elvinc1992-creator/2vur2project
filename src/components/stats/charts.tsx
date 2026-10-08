import type { ReactNode } from "react";
import { cn } from "@/lib/cn";

/** Kiçik sütun chart (illər üzrə). Hər sütunun üstündə rəqəm yazılır. */
export function ColumnChart({ items }: { items: Array<{ label: string; value: number; text: string }> }) {
  const max = Math.max(1, ...items.map((i) => i.value));
  return (
    <div className="flex h-44 items-end gap-3 border-b border-control-border px-1">
      {items.map((i) => (
        <div key={i.label} className="flex h-full flex-1 flex-col items-center justify-end gap-1">
          <b className="text-small text-navy-900 tabular">{i.text}</b>
          <div
            className="w-full max-w-14 rounded-t-[8px] bg-navy-900"
            style={{ height: `${Math.max(2, (i.value / max) * 100)}%` }}
          />
          <span className="pt-1 text-caption font-semibold text-ink-muted">{i.label}</span>
        </div>
      ))}
    </div>
  );
}

/** Sadə üfüqi zolaqlar (uyğunluq dərəcələri, buraxılış/qəbul). */
export function BarRows({
  items,
}: {
  items: Array<{ label: ReactNode; value: number; text: string; tone?: "navy" | "success" | "warning" | "danger" | "muted" }>;
}) {
  const max = Math.max(1, ...items.map((i) => i.value));
  const TONE = {
    navy: "bg-navy-900",
    success: "bg-success-700",
    warning: "bg-warning-700",
    danger: "bg-danger-700",
    muted: "bg-control-border",
  };
  return (
    <ul className="m-0 grid list-none gap-2.5 p-0">
      {items.map((i, idx) => (
        <li key={idx} className="grid gap-1">
          <div className="flex items-baseline justify-between gap-3 text-small">
            <span className="text-ink">{i.label}</span>
            <b className="text-navy-900 tabular">{i.text}</b>
          </div>
          <div className="h-2.5 overflow-hidden rounded-pill bg-navy-100 shadow-[inset_0_0_0_1px_var(--track-edge)]">
            <i className={cn("block h-full rounded-pill", TONE[i.tone ?? "navy"])} style={{ width: `${(i.value / max) * 100}%` }} />
          </div>
        </li>
      ))}
    </ul>
  );
}

export function StatCard({ label, value, sub }: { label: string; value: string; sub?: ReactNode }) {
  return (
    <div className="grid content-start gap-1 rounded-lg border border-line bg-surface p-5 lg:p-6">
      <dt className="text-[15px] leading-[22px] text-ink-muted">{label}</dt>
      <dd className="m-0 font-display text-[40px] leading-[44px] font-extrabold tracking-[-0.02em] text-navy-900 tabular lg:text-[48px] lg:leading-[52px]">
        {value}
      </dd>
      {sub && <dd className="m-0 text-small text-ink-muted">{sub}</dd>}
    </div>
  );
}

export function SkeletonCard({ className }: { className?: string }) {
  return <div aria-hidden="true" className={cn("animate-pulse rounded-lg border border-line bg-navy-050", className)} />;
}
