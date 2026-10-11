import Link from "next/link";
import type { ReactNode } from "react";
import { cn } from "@/lib/cn";

// Müəllim panelinin bloklari (Prompts/muellim-paneli.html dizaynı).

export const brand = "bg-[linear-gradient(135deg,#6366f1,#8b5cf6_55%,#ec4899)]";
export const card = "rounded-[20px] border border-[#e6e9f2] bg-white p-5";
export const btnMain = cn(brand, "inline-flex min-h-11 cursor-pointer items-center justify-center gap-2 rounded-[12px] px-4 text-[14px] font-bold text-white no-underline shadow-[0_10px_22px_-12px_rgba(139,92,246,.8)]");
export const btnGhost = "inline-flex min-h-11 cursor-pointer items-center justify-center gap-2 rounded-[12px] border border-[#e6e9f2] bg-white px-4 text-[14px] font-bold text-[#0f1b3d] no-underline hover:bg-[#f4f6fb]";
export const btnDark = "inline-flex min-h-11 cursor-pointer items-center justify-center gap-2 rounded-[12px] bg-[#0f1b3d] px-4 text-[14px] font-bold text-white no-underline";
export const field = "min-h-11 w-full rounded-[11px] border-[1.5px] border-[#e6e9f2] bg-[#fbfcfe] px-3 text-[14.5px] text-[#0f1b3d] outline-none focus:border-[#8b5cf6]";
export const label = "grid gap-1.5 text-[13px] font-bold text-[#5b6785]";
export const th = "border-b border-[#e6e9f2] px-2.5 py-2.5 text-left text-[11.5px] font-semibold tracking-[0.08em] text-[#5b6785] uppercase";
export const td = "border-t border-[#e6e9f2] px-2.5 py-2.5 text-left text-[14px]";

/** Faizin rəngi: <50 qırmızı, 50–70 sarı, >70 yaşıl. */
export const tone = (v: number | null) => (v === null ? "#94a3b8" : v < 50 ? "#dc2626" : v < 70 ? "#b45309" : "#047857");
export const toneSoft = (v: number | null) => (v === null ? "#f1f5f9" : v < 50 ? "#fef2f2" : v < 70 ? "#fffbeb" : "#ecfdf5");

export function Top({ title, lead, children }: { title: string; lead?: ReactNode; children?: ReactNode }) {
  return (
    <div className="mb-5 flex flex-wrap items-center justify-between gap-3">
      <div>
        <h1 className="m-0 text-[26px] font-black tracking-[-0.02em] text-[#0f1b3d]">{title}</h1>
        {lead && <p className="m-0 mt-0.5 text-[#5b6785]">{lead}</p>}
      </div>
      {children}
    </div>
  );
}

export function Kpi({ icon, value, label, bg }: { icon: string; value: ReactNode; label: string; bg: string }) {
  return (
    <div className="flex items-center gap-3.5 rounded-[18px] border border-[#e6e9f2] bg-white p-4">
      <div className="grid size-[46px] flex-none place-items-center rounded-[14px] text-[22px]" style={{ background: bg }} aria-hidden="true">
        {icon}
      </div>
      <div className="min-w-0">
        <b className="block truncate text-[24px] font-black text-[#0f1b3d]">{value}</b>
        <small className="font-semibold text-[#5b6785]">{label}</small>
      </div>
    </div>
  );
}

export function Card({ title, sub, children, className }: { title?: string; sub?: string; children: ReactNode; className?: string }) {
  return (
    <section className={cn(card, className)} aria-label={title}>
      {title && <h2 className="m-0 mb-1 text-[17px] font-extrabold text-[#0f1b3d]">{title}</h2>}
      {sub && <p className="m-0 mb-3.5 text-[13px] text-[#5b6785]">{sub}</p>}
      {children}
    </section>
  );
}

export function Pill({ kind, children }: { kind: "green" | "amber" | "red" | "indigo"; children: ReactNode }) {
  const c = { green: "bg-[#ecfdf5] text-[#047857]", amber: "bg-[#fffbeb] text-[#b45309]", red: "bg-[#fef2f2] text-[#b91c1c]", indigo: "bg-[#eef0ff] text-[#4f46e5]" }[kind];
  return <span className={cn("inline-block rounded-full px-2.5 py-1 text-[12px] font-bold", c)}>{children}</span>;
}

export function Bar({ value }: { value: number | null }) {
  return (
    <div className="h-2 min-w-[80px] overflow-hidden rounded-full bg-[#eef1f7]" aria-hidden="true">
      <i className="block h-full rounded-full" style={{ width: `${value ?? 0}%`, background: tone(value) }} />
    </div>
  );
}

export function TopicRows({ rows }: { rows: Array<{ topic: string; pct: number }> }) {
  if (!rows.length) return <p className="m-0 text-[14px] text-[#5b6785]">Hələ məlumat yoxdur — şagirdlər sınaq və tapşırıq işlədikcə yaranacaq.</p>;
  return (
    <ul className="m-0 grid list-none p-0">
      {rows.map((r) => (
        <li key={r.topic} className="grid grid-cols-[1.4fr_2fr_52px] items-center gap-3 border-[#e6e9f2] py-2.5 not-first:border-t max-sm:grid-cols-[1fr_52px]">
          <b className="text-[14px]">{r.topic}</b>
          <span className="max-sm:hidden">
            <Bar value={r.pct} />
          </span>
          <b className="text-right tabular-nums" style={{ color: tone(r.pct) }}>
            {r.pct}%
          </b>
        </li>
      ))}
    </ul>
  );
}

export function Notice({ tone: t = "info", children }: { tone?: "info" | "ok" | "warn" | "error"; children: ReactNode }) {
  const c = { info: "bg-[#eef0ff] text-[#3730a3]", ok: "bg-[#ecfdf5] text-[#047857]", warn: "bg-[#fffbeb] text-[#92400e]", error: "bg-[#fef2f2] text-[#991b1b]" }[t];
  return (
    <p role={t === "error" ? "alert" : "status"} className={cn("m-0 mb-4 rounded-[12px] px-3.5 py-2.5 text-[13.5px] font-semibold", c)}>
      {children}
    </p>
  );
}

export const azn = (v: number) => `${v.toFixed(2).replace(".", ",")} ₼`;
export const fmtDay = (d: Date | number) => new Intl.DateTimeFormat("az-AZ", { timeZone: "Asia/Baku", day: "numeric", month: "short" }).format(d);
export const fmtDayLong = (d: Date | number) => new Intl.DateTimeFormat("az-AZ", { timeZone: "Asia/Baku", day: "2-digit", month: "2-digit", year: "numeric" }).format(d);

export function TLink({ href, children, className }: { href: string; children: ReactNode; className?: string }) {
  return (
    <Link href={href} className={cn("font-bold text-[#4f46e5] underline-offset-3 hover:underline", className)}>
      {children}
    </Link>
  );
}
