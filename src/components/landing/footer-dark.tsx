import Link from "next/link";
import { InfoIcon } from "@/components/icons";
import { Logo } from "@/components/logo";
import { az } from "@/content/az";

/** Tünd footer (landing). Məcburi cümlə: "Bu layihə müstəqildir və DİM ilə əlaqəli deyil." */
export function FooterDark() {
  const t = az.landing.footer;
  const link = "text-white no-underline hover:underline underline-offset-3";
  return (
    <footer className="bg-navy-900 pt-10 pb-6 text-on-navy-muted">
      <div className="mx-auto grid w-full max-w-content gap-8 px-4 md:px-8">
        <div className="grid gap-6 md:grid-cols-[2fr_1fr_1fr]">
          <div className="grid content-start gap-2">
            <Logo onNavy />
            <p className="text-small">{t.tagline}</p>
          </div>
          <nav aria-label={t.site} className="grid content-start gap-2.5">
            <a href="#movzular" className={link}>
              {t.links.topics}
            </a>
            <Link href="/statistika" className={link}>
              {t.links.stats}
            </Link>
            <a href="#sinaqlar" className={link}>
              {t.links.exams}
            </a>
            <a href="#qiymetler" className={link}>
              {t.links.pricing}
            </a>
            <Link href="/daxil-ol" className={link}>
              {t.links.login}
            </Link>
          </nav>
          <nav aria-label={t.legal} className="grid content-start gap-2.5">
            <Link href="/sertler" className={link}>
              {t.legalLinks.terms}
            </Link>
            <Link href="/mexfilik" className={link}>
              {t.legalLinks.privacy}
            </Link>
            <Link href="/geri-qaytarma" className={link}>
              {t.legalLinks.refund}
            </Link>
          </nav>
        </div>
        <div className="grid gap-2 border-t border-white/18 pt-5 text-small">
          <p className="flex items-start gap-2 text-white">
            <InfoIcon className="mt-px size-[18px] flex-none" />
            <strong className="font-bold">{az.common.independence}</strong>
          </p>
          <p>
            {az.common.copyright}. {t.note}
          </p>
        </div>
      </div>
    </footer>
  );
}
