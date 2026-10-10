import { cn } from "@/lib/cn";

// Admin panelinin sadə bloklari (server komponentləri).

export const azn = (v: number) => `${v.toFixed(2)} AZN`;
export const fmtDate = (d: Date | number | null | undefined) =>
  d ? new Intl.DateTimeFormat("az-AZ", { timeZone: "Asia/Baku", day: "2-digit", month: "2-digit", year: "numeric" }).format(d) : "—";
export const isoToAz = (iso: string) => (iso ? `${iso.slice(8, 10)}.${iso.slice(5, 7)}.${iso.slice(0, 4)}` : "—");

export const input = "min-h-10 rounded-md border-[1.5px] border-control-border bg-white px-2.5 text-[14px]";
export const btn = "inline-flex min-h-10 cursor-pointer items-center justify-center rounded-md bg-navy-900 px-3.5 text-[14px] font-bold text-white no-underline hover:bg-navy-700";
export const btnGhost =
  "inline-flex min-h-10 cursor-pointer items-center justify-center rounded-md border-[1.5px] border-control-border bg-white px-3.5 text-[14px] font-semibold text-navy-900 no-underline hover:bg-navy-050";
export const btnDanger = "inline-flex min-h-10 cursor-pointer items-center rounded-md px-3 text-[14px] font-semibold text-danger-700 hover:bg-danger-100";
export const th = "px-3 py-2 text-left text-[13px] font-semibold text-ink-muted";
export const td = "px-3 py-2 align-top text-[14px]";

export function PageHead({ title, lead, children }: { title: string; lead?: string; children?: React.ReactNode }) {
  return (
    <div className="flex flex-wrap items-end justify-between gap-3">
      <div className="grid gap-1">
        <h1 className="m-0 font-display text-[26px] font-extrabold text-navy-900">{title}</h1>
        {lead && <p className="m-0 max-w-[52rem] text-ink-muted">{lead}</p>}
      </div>
      {children}
    </div>
  );
}

export function Stat({ label, value, hint, tone = "plain" }: { label: string; value: string | number; hint?: string; tone?: "plain" | "navy" }) {
  return (
    <div className={cn("grid gap-1 rounded-[14px] border p-4", tone === "navy" ? "border-navy-900 bg-navy-900 text-white" : "border-line bg-white")}>
      <span className={cn("text-[13px]", tone === "navy" ? "text-on-navy-muted" : "text-ink-muted")}>{label}</span>
      <b className="font-display text-[26px] leading-tight font-extrabold tabular">{value}</b>
      {hint && <span className={cn("text-[12.5px]", tone === "navy" ? "text-on-navy-muted" : "text-ink-muted")}>{hint}</span>}
    </div>
  );
}

export function Panel({ title, children, className }: { title: string; children: React.ReactNode; className?: string }) {
  const id = `p-${title.replace(/[^\p{L}\d]+/gu, "-").toLowerCase()}`;
  return (
    <section aria-labelledby={id} className={cn("grid min-w-0 gap-3 rounded-[16px] border border-line bg-white p-4", className)}>
      <h2 id={id} className="m-0 text-[17px] font-extrabold text-navy-900">
        {title}
      </h2>
      {children}
    </section>
  );
}

/** Sadə sütun qrafiki (SVG). */
export function Bars({ data, label, unit = "" }: { data: Array<{ k: string; v: number }>; label: string; unit?: string }) {
  if (!data.length) return <p className="m-0 text-small text-ink-muted">Məlumat yoxdur.</p>;
  const max = Math.max(1, ...data.map((d) => d.v));
  return (
    <div className="overflow-x-auto" tabIndex={0} role="group" aria-label={label}>
      <ul role="list" aria-label={label} className="m-0 flex h-44 min-w-[320px] list-none items-end gap-1.5 p-0">
        {data.map((d, i) => (
          <li key={d.k} className="flex h-full min-w-0 flex-1 flex-col items-center justify-end gap-1">
            <span className="text-[11px] text-ink-muted tabular">{d.v ? `${Number.isInteger(d.v) ? d.v : d.v.toFixed(2)}${unit}` : ""}</span>
            <span className="w-full rounded-t-[6px] bg-navy-500" style={{ height: `${(d.v / max) * 100}%`, minHeight: d.v ? 3 : 0 }} />
            <span className="text-[10.5px] text-ink-muted">{data.length <= 12 || i % 5 === 0 || i === data.length - 1 ? d.k : " "}</span>
          </li>
        ))}
      </ul>
    </div>
  );
}

export function Table({ caption, children }: { caption: string; children: React.ReactNode }) {
  return (
    <div className="relative overflow-x-auto rounded-[12px] border border-line bg-white" tabIndex={0} role="region" aria-label={caption}>
      <table className="w-full border-collapse">
        <caption className="sr-only">{caption}</caption>
        {children}
      </table>
    </div>
  );
}

export function Notice({ tone, children }: { tone: "ok" | "error"; children: React.ReactNode }) {
  return (
    <p
      role={tone === "error" ? "alert" : "status"}
      className={cn("m-0 rounded-md px-3 py-2 text-[14px] font-semibold", tone === "ok" ? "bg-success-100 text-success-700" : "bg-danger-100 text-danger-700")}
    >
      {children}
    </p>
  );
}
