import type { ReactNode } from "react";
import { cn } from "@/lib/cn";

const TONES = {
  neutral: "bg-navy-050 text-navy-900",
  success: "bg-success-100 text-success-700",
  warning: "bg-warning-100 text-warning-700",
  danger: "bg-danger-100 text-danger-700",
} as const;

/** Boş/xəta halının böyük ikon sahəsi + başlıq + mətn. */
export function EmptyState({
  icon,
  tone = "neutral",
  title,
  children,
}: {
  icon: ReactNode;
  tone?: keyof typeof TONES;
  title: ReactNode;
  children?: ReactNode;
}) {
  return (
    <div className="grid justify-items-center gap-3 py-4 text-center">
      <div className={cn("grid size-[120px] place-items-center rounded-[32px] [&>svg]:size-14", TONES[tone])}>{icon}</div>
      <h1 className="font-display text-h2 font-extrabold text-navy-900 lg:text-h2-lg">{title}</h1>
      {children && <div className="text-ink-muted">{children}</div>}
    </div>
  );
}
