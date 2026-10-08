import type { ReactNode } from "react";

// Klient komponentləri də istifadə edir — burada server asılılığı olmamalıdır.
export function AuthHeading({ title, subtitle, eyebrow }: { title: string; subtitle?: string; eyebrow?: string }) {
  return (
    <div className="grid gap-2">
      {eyebrow && <span className="text-small text-ink-muted">{eyebrow}</span>}
      <h1 className="font-display text-h2 font-extrabold text-navy-900 lg:text-h2-lg">{title}</h1>
      {subtitle && <p className="text-ink-muted">{subtitle}</p>}
    </div>
  );
}

export function Divider({ children }: { children: ReactNode }) {
  return (
    <div className="flex items-center gap-3 text-small text-ink-muted before:h-px before:flex-1 before:bg-line after:h-px after:flex-1 after:bg-line">
      {children}
    </div>
  );
}
