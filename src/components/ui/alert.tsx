import type { ReactNode } from "react";
import { AlertIcon, CheckCircleIcon, InfoIcon } from "@/components/icons";
import { cn } from "@/lib/cn";

type Tone = "info" | "success" | "warning" | "danger";

const TONES: Record<Tone, string> = {
  info: "bg-navy-100 text-navy-900",
  success: "bg-success-100 text-success-700",
  warning: "bg-warning-100 text-warning-700",
  danger: "bg-danger-100 text-danger-700",
};

const ICONS = { info: InfoIcon, success: CheckCircleIcon, warning: AlertIcon, danger: AlertIcon };

/** İkon + (qalın başlıq) + izah. Rəng tək siqnal deyil — ikon və mətn də var. */
export function Alert({ tone = "info", title, children }: { tone?: Tone; title?: ReactNode; children?: ReactNode }) {
  const Icon = ICONS[tone];
  return (
    <div
      role={tone === "danger" ? "alert" : "status"}
      className={cn("flex items-start gap-3 rounded-md px-4 py-3.5 text-[15px] leading-[22px]", TONES[tone])}
    >
      <Icon className="size-[22px] flex-none" />
      <div className="text-ink">
        {title && <b className={cn("block", TONES[tone].split(" ")[1])}>{title}</b>}
        {children}
      </div>
    </div>
  );
}
