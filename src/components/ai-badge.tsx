import Link from "next/link";
import { aiText } from "@/content/az-ai";
import type { AiInsight, FreqLevel } from "@/lib/ai/analysis";
import { cn } from "@/lib/cn";

const t = aiText.badge;

/** Tezlik rəngləri: Yüksək — qırmızı, Orta — narıncı, Aşağı — boz. */
export const LEVEL_TONE: Record<FreqLevel, string> = {
  high: "bg-danger-100 text-danger-700",
  mid: "bg-orange-100 text-orange-800",
  low: "bg-navy-050 text-ink-muted",
};

export function FreqChip({ level, className }: { level: FreqLevel; className?: string }) {
  return (
    <b className={cn("inline-flex items-center gap-1 rounded-pill px-2 py-0.5 text-[12px] leading-4 font-bold", LEVEL_TONE[level], className)}>
      <i aria-hidden="true" className="size-1.5 rounded-full bg-current" />
      {t.levels[level]}
    </b>
  );
}

/**
 * Sual kartının yuxarısındakı yığcam "AI analizi" paneli (açılıb-bağlanan, JS-siz <details>).
 * Yalnız təsnifat və statistika — cavab və həll yoxdur. Məlumatı olmayan sahə göstərilmir.
 */
export function AiBadge({ ai, open, className }: { ai: AiInsight | null | undefined; open?: boolean; className?: string }) {
  if (!ai) return null;
  const fields = [
    [t.topic, ai.topic],
    [t.type, ai.type],
    [t.subtype, ai.subtype],
  ].filter((f): f is [string, string] => Boolean(f[1]));

  return (
    <details data-ai-badge open={open} className={cn("group rounded-[12px] border border-violet-200 bg-violet-50/70 text-[13px] leading-5", className)}>
      <summary className="flex cursor-pointer list-none flex-wrap items-center gap-x-2 gap-y-1 px-3 py-2 [&::-webkit-details-marker]:hidden">
        <span className="inline-flex items-center gap-1.5 font-bold text-violet-800">
          <span aria-hidden="true">🤖</span>
          {t.title}
        </span>
        {fields.map(([k, v]) => (
          <span key={k} className="inline-flex min-w-0 items-center gap-1 text-ink-muted">
            <span aria-hidden="true" className="text-violet-300">
              ·
            </span>
            {k}: <span className="max-w-[22ch] truncate font-semibold text-navy-900 sm:max-w-[32ch]">{v}</span>
          </span>
        ))}
        {ai.level && (
          <span className="inline-flex items-center gap-1 text-ink-muted">
            <span aria-hidden="true" className="text-violet-300">
              ·
            </span>
            {t.freq}: <FreqChip level={ai.level} />
          </span>
        )}
        <span aria-hidden="true" className="ml-auto text-violet-700 transition-transform group-open:rotate-180">
          ▾
        </span>
      </summary>
      <div className="grid gap-1.5 border-t border-violet-200 px-3 py-2.5 text-ink">
        {ai.type && <p className="m-0 font-semibold text-navy-900">{ai.type}</p>}
        {ai.shown > 0 && <p className="m-0">{t.shownLine(ai.shown)}</p>}
        {ai.proto.length > 0 && <p className="m-0">{t.proto(ai.proto)}</p>}
        {ai.typeHref && (
          <Link href={ai.typeHref} className="justify-self-start font-semibold text-violet-800">
            {t.typeLink} →
          </Link>
        )}
        <p className="m-0 text-[12px] text-ink-muted">
          {t.basis}{" "}
          <Link href="/suni-intellekt" className="font-semibold text-violet-800">
            {t.more}
          </Link>
        </p>
      </div>
    </details>
  );
}
