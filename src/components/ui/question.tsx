import Image from "next/image";
import type { ReactNode } from "react";
import { Placeholder } from "@/components/ui/display";
import { MathText } from "@/components/ui/math-text";
import { cn } from "@/lib/cn";

/** Sual və cavab bölmələrinin başlığı (eyni üslub — "SUAL", "CAVAB VARİANTLARI", "CAVABIN"). */
export const answerHeadClass = "text-caption font-bold tracking-[0.06em] text-navy-900 uppercase";

/**
 * Sual kartı: yuxarıda "SUAL n / N" zolağı, altında sualın mətni.
 * Cavab variantları kartdan kənarda, ayrıca bölmədir — sual ilə cavab qarışmır.
 */
export function QuestionCard({
  id,
  n,
  total,
  text,
  aside,
  image,
  imageLabel,
  imageUrl,
  imageAlt,
  qid,
  className,
}: {
  id: string;
  n: number;
  total: number;
  text: string;
  /** Başlıq zolağının sağ tərəfi: format teqi, "İşarələ" və s. */
  aside?: ReactNode;
  image?: boolean;
  imageLabel?: string;
  /** Sualın real şəkli (bank_tasks.image_url). */
  imageUrl?: string | null;
  imageAlt?: string | null;
  /** Sualın kodu (data-qid) — cavab deyil; testlər və analitika üçün. */
  qid?: string;
  className?: string;
}) {
  return (
    <article
      aria-labelledby={`${id}-title`}
      data-qid={qid}
      className={cn("overflow-hidden rounded-lg border border-line bg-surface shadow-card", className)}
    >
      <header className="flex min-h-12 flex-wrap items-center justify-between gap-x-3 gap-y-2 border-b border-line bg-navy-050 px-4 py-2 lg:px-6">
        <h2 id={`${id}-title`} className="flex items-center gap-2">
          <span className="rounded-pill bg-navy-900 px-3 py-1 text-caption font-bold tracking-[0.06em] text-white uppercase">
            Sual {n}
          </span>
          <span className="text-small font-semibold text-ink-muted tabular">/ {total}</span>
        </h2>
        {aside && <div className="flex flex-wrap items-center gap-2">{aside}</div>}
      </header>
      <div className="grid gap-4 px-4 py-5 lg:px-6">
        <p className="text-[18px] leading-[1.65] text-ink">
          <MathText text={text} />
        </p>
        {imageUrl ? (
          <Image
            src={imageUrl}
            alt={imageAlt ?? ""}
            width={520}
            height={360}
            className="h-auto max-h-[320px] w-auto max-w-full justify-self-center rounded-md border border-line bg-white object-contain p-2"
          />
        ) : (
          image && <Placeholder className="min-h-[120px]">{imageLabel}</Placeholder>
        )}
      </div>
    </article>
  );
}
