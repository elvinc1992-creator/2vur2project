import type { ReactNode } from "react";
import type { ExamType } from "@/lib/exams/types";
import { cn } from "@/lib/cn";

/**
 * Sınaq tipinin "simasi": 9-cu sinif — firuzəyi, 11-ci sinif buraxılış — göy (brend), blok — bənövşəyi, mövzu — mərcan.
 * Sınaqlar səhifəsindəki kartlarda və ana səhifədə eyni rənglər — şagird tipi rəngdən tanısın.
 * Ağ mətn bütün zolaqlarda ≥ 4,5:1 kontrastdadır (qradiyentin açıq ucu da).
 */
export const EXAM_TYPE_LOOK: Record<ExamType, { band: string; soft: string; edge: string; ink: string; mark: string }> = {
  "9": { band: "from-teal-700 to-teal-900", soft: "bg-teal-50", edge: "border-teal-200 hover:border-teal-700", ink: "text-teal-800", mark: "9" },
  "11": { band: "from-navy-700 to-navy-900", soft: "bg-navy-050", edge: "border-navy-200 hover:border-navy-700", ink: "text-navy-700", mark: "11" },
  blok: { band: "from-violet-700 to-indigo-900", soft: "bg-violet-50", edge: "border-violet-200 hover:border-violet-700", ink: "text-violet-800", mark: "B" },
  movzu: { band: "from-coral-700 to-[#8f2f1a]", soft: "bg-coral-100/60", edge: "border-coral-100 hover:border-coral-700", ink: "text-coral-700", mark: "∑" },
};

/** Kartın başlıq zolağı: tipin rəngi, adı və böyük "su nişanı" (9 / 11 / B / ∑). Kartın p-5 lg:p-6 boşluğuna oturur. */
export function ExamTypeBand({ type, label, children, className }: { type: ExamType; label: string; children?: ReactNode; className?: string }) {
  const look = EXAM_TYPE_LOOK[type];
  return (
    <div
      className={cn(
        "relative -mx-5 -mt-5 flex min-h-14 items-center gap-3 overflow-hidden rounded-t-[inherit] bg-linear-to-br px-5 py-3 text-white lg:-mx-6 lg:-mt-6 lg:px-6",
        look.band,
        className,
      )}
    >
      <span
        aria-hidden="true"
        className="pointer-events-none absolute -top-3 right-3 font-display text-[76px] leading-none font-extrabold text-white/15 select-none"
      >
        {look.mark}
      </span>
      <span className="relative text-[12.5px] font-bold tracking-[0.06em] uppercase">{label}</span>
      {children && <span className="relative ml-auto flex items-center gap-2">{children}</span>}
    </div>
  );
}
