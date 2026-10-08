import type { ReactNode } from "react";
import { cn } from "@/lib/cn";

/* ---------- Tag ---------- */

const TAG_TONES = {
  topic: "bg-navy-100 text-navy-900",
  type: "border border-line bg-surface text-ink",
  coral: "bg-coral-100 text-coral-700",
  success: "bg-success-100 text-success-700",
  danger: "bg-danger-100 text-danger-700",
  warning: "bg-warning-100 text-warning-700",
  solid: "bg-navy-900 text-white",
  lock: "bg-navy-050 text-ink-muted",
  onNavy: "bg-white/14 text-white",
} as const;

export type TagTone = keyof typeof TAG_TONES;

export function Tag({
  tone = "topic",
  dot,
  icon,
  className,
  children,
}: {
  tone?: TagTone;
  dot?: boolean;
  icon?: ReactNode;
  className?: string;
  children: ReactNode;
}) {
  return (
    <span
      className={cn(
        "inline-flex min-h-7 items-center gap-1.5 rounded-sm px-2.5 py-1 text-[13px] leading-[18px] font-semibold [&>svg]:size-4",
        TAG_TONES[tone],
        className,
      )}
    >
      {dot && <i aria-hidden="true" className="size-2 rounded-full bg-current" />}
      {icon}
      {children}
    </span>
  );
}

/** "İmtahanda çıxıb: N dəfə" göstəricisi. Mini sütunlar dekorativdir. */
export function Freq({ count, label }: { count: number; label: string }) {
  const bars = [6, 10, 14, 8];
  return (
    <span className="inline-flex items-center gap-2 rounded-pill bg-coral-100 py-1.5 pr-3 pl-2 text-small font-bold text-coral-700">
      <span aria-hidden="true" className="inline-flex h-4 items-end gap-[3px]">
        {bars.map((h, i) => (
          <i
            key={i}
            className={cn("block w-1 rounded-[2px]", i < Math.min(count, 4) ? "bg-coral-600" : "bg-[#F5C6B8]")}
            style={{ height: h }}
          />
        ))}
      </span>
      {label}
    </span>
  );
}

/* ---------- Proqres ---------- */

/** Tamamlanma halqası (dizayn: .b-ring). */
export function Ring({ done, total, size = 52 }: { done: number; total: number; size?: number }) {
  const complete = total > 0 && done >= total;
  const pct = total ? Math.round((done / total) * 100) : 0;
  return (
    <span
      role="img"
      aria-label={`${done} / ${total} tamamlanıb`}
      className="grid flex-none place-items-center rounded-full"
      style={{
        width: size,
        height: size,
        background: complete
          ? "var(--success-700)"
          : `conic-gradient(var(--navy-900) ${pct}%, var(--track-edge) 0)`,
      }}
    >
      <span
        className="col-start-1 row-start-1 rounded-full bg-white"
        style={{ width: size - 12, height: size - 12 }}
      />
      <span
        className={cn(
          "relative col-start-1 row-start-1 font-display text-[13px] leading-none font-extrabold tabular",
          complete ? "text-success-700" : "text-navy-900",
        )}
      >
        {complete ? "✓" : `${done}/${total}`}
      </span>
    </span>
  );
}

/** Faiz zolağı. 50%-dən az — coral (zəif). */
export function Meter({
  value,
  label,
  tone,
  size = "md",
  className,
}: {
  value: number;
  label: string;
  tone?: "navy" | "coral" | "success";
  size?: "md" | "lg";
  className?: string;
}) {
  const color = tone ?? (value < 50 ? "coral" : "navy");
  return (
    <div
      role="meter"
      aria-label={label}
      aria-valuenow={value}
      aria-valuemin={0}
      aria-valuemax={100}
      className={cn(
        "overflow-hidden rounded-pill bg-navy-100 shadow-[inset_0_0_0_1px_var(--track-edge)]",
        size === "lg" ? "h-2.5" : "h-1.5",
        className,
      )}
    >
      <i
        className={cn(
          "block h-full rounded-pill",
          color === "coral" ? "bg-coral-600" : color === "success" ? "bg-success-700" : "bg-navy-900",
        )}
        style={{ width: `${Math.max(0, Math.min(100, value))}%` }}
      />
    </div>
  );
}

/** Günün sualları addım zolağı: ok / bad / on / boş. */
export function Steps({ items, label }: { items: Array<"ok" | "bad" | "on" | null>; label: string }) {
  const done = items.filter((s) => s === "ok" || s === "bad").length;
  return (
    <div
      role="progressbar"
      aria-label={label}
      aria-valuenow={done}
      aria-valuemin={0}
      aria-valuemax={items.length}
      className="grid grid-flow-col gap-1.5"
    >
      {items.map((s, i) => (
        <i
          key={i}
          className={cn(
            "h-1.5 rounded-pill",
            s === "ok" ? "bg-success-700" : s === "bad" ? "bg-danger-700" : s === "on" ? "bg-navy-900" : "bg-navy-100",
          )}
        />
      ))}
    </div>
  );
}

/** Həftəlik aktivlik (0–3 intensivlik), bu gün coral çərçivə. */
export function Week({ days }: { days: Array<{ label: string; level: 0 | 1 | 2 | 3; today?: boolean }> }) {
  const LEVEL = ["bg-navy-050 border-line", "bg-navy-200 border-navy-200", "bg-navy-700 border-navy-700", "bg-navy-900 border-navy-900"];
  return (
    <div className="grid grid-cols-7 gap-1.5 text-center" aria-label="Həftəlik aktivlik">
      {days.map((d) => (
        <div key={d.label}>
          <span className="text-caption font-semibold text-ink-muted">{d.label}</span>
          <i
            className={cn(
              "mt-1 block h-9 rounded-[10px] border",
              LEVEL[d.level],
              d.today && "outline-2 outline-offset-2 outline-coral-600",
            )}
          />
        </div>
      ))}
    </div>
  );
}

/* ---------- Kart, siyahı, başlıqlar ---------- */

export function Card({
  tone = "default",
  className,
  children,
  as: As = "div",
  ...rest
}: {
  tone?: "default" | "flat" | "navy" | "tint";
  className?: string;
  children: ReactNode;
  as?: "div" | "section" | "article" | "aside";
  "aria-labelledby"?: string;
  "aria-label"?: string;
}) {
  return (
    <As
      className={cn(
        "relative rounded-lg border p-5 lg:p-6",
        tone === "default" && "border-line bg-surface shadow-card",
        tone === "flat" && "border-line bg-surface",
        tone === "navy" && "border-navy-900 bg-navy-900 text-white",
        tone === "tint" && "border-line bg-navy-050",
        className,
      )}
      {...rest}
    >
      {children}
    </As>
  );
}

export const listClass =
  "grid overflow-hidden rounded-lg border border-line bg-white [&>*]:flex [&>*]:min-h-14 [&>*]:items-center [&>*]:justify-between [&>*]:gap-3 [&>*]:border-b [&>*]:border-line [&>*]:px-4 [&>*]:py-3.5 [&>*]:text-inherit [&>*]:no-underline [&>*:last-child]:border-b-0 [&_svg]:size-5 [&_svg]:flex-none [&_svg]:text-ink-muted";

export const h1Class = "font-display text-h2 font-extrabold text-navy-900 lg:text-h2-lg";
export const h3Class = "font-display text-h3 font-bold text-navy-900";
export const eyebrowClass = "text-caption font-bold tracking-[0.06em] text-ink-muted uppercase";

/** Şəkil/çertyoj yer tutucusu. */
export function Placeholder({ children, className }: { children: ReactNode; className?: string }) {
  return (
    <div
      className={cn(
        "grid min-h-[110px] place-items-center rounded-lg border-2 border-dashed border-navy-200 p-4 text-center text-small font-semibold text-ink-muted",
        "bg-[repeating-linear-gradient(45deg,var(--navy-050)_0_10px,#fff_10px_20px)]",
        className,
      )}
    >
      {children}
    </div>
  );
}

/** Sınaq formatı zolağı: 13 qapalı / 5 kodlaşdırılan / 7 yazılı. */
export function FormatBar({ closed, coded, written, label }: { closed: number; coded: number; written: number; label: string }) {
  return (
    <div role="img" aria-label={label} className="flex h-3.5 gap-[3px] overflow-hidden rounded-pill">
      <i className="block bg-navy-900" style={{ flex: closed }} />
      <i className="block bg-coral-600" style={{ flex: coded }} />
      <i className="block bg-navy-200" style={{ flex: written }} />
    </div>
  );
}

/** Qəbz / açar-dəyər siyahısı. */
export function KeyValues({ rows }: { rows: Array<[ReactNode, ReactNode]> }) {
  return (
    <dl className="m-0 grid grid-cols-[1fr_auto] gap-x-3 gap-y-2 text-[15px]">
      {rows.map(([k, v], i) => (
        <div key={i} className="contents">
          <dt className="text-ink-muted">{k}</dt>
          <dd className="m-0 text-right font-semibold tabular">{v}</dd>
        </div>
      ))}
    </dl>
  );
}
