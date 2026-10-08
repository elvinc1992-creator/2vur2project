import Link from "next/link";
import { InfoIcon } from "@/components/icons";
import { az } from "@/content/az";

/** Açıq footer (hesab və hüquqi səhifələr). Məcburi cümlə hər səhifədə var. */
export function FooterLight() {
  return (
    <footer className="border-t border-line py-6 text-ink-muted">
      <div className="mx-auto grid w-full max-w-content gap-2 px-4 md:px-8">
        <p className="flex items-start gap-2 text-small">
          <InfoIcon className="mt-px size-[18px] flex-none" />
          <strong className="font-bold text-navy-900">{az.common.independence}</strong>
        </p>
        <div className="flex flex-wrap items-center gap-3 text-small">
          <Link href="/sertler" className="text-navy-900 no-underline hover:underline">
            {az.legalLinks.terms}
          </Link>
          <Link href="/mexfilik" className="text-navy-900 no-underline hover:underline">
            {az.legalLinks.privacy}
          </Link>
          <Link href="/geri-qaytarma" className="text-navy-900 no-underline hover:underline">
            {az.legalLinks.refund}
          </Link>
          <span>{az.common.copyright}</span>
        </div>
      </div>
    </footer>
  );
}
