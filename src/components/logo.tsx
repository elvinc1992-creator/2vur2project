import Link from "next/link";
import { BrandLogo } from "@/components/brand-logo";
import { BRAND_NAME } from "@/config/brand";
import { az } from "@/content/az";
import { cn } from "@/lib/cn";

/** Sayt loqosu (2vur2). Şəkil dekorativdir; linkin adı — brend adı + "ana səhifə". */
export function Logo({ onNavy, asLink = true }: { onNavy?: boolean; asLink?: boolean }) {
  const content = (
    <>
      <BrandLogo onNavy={onNavy} className="h-8 w-auto" />
      <span className="sr-only">{BRAND_NAME}</span>
    </>
  );
  const className = cn("inline-flex items-center no-underline", onNavy ? "text-white" : "text-navy-900");
  if (!asLink) return <span className={className}>{content}</span>;
  return (
    <Link href="/" className={cn(className, "rounded-[8px]")}>
      {content}
      <span className="sr-only">{az.common.homeSuffix}</span>
    </Link>
  );
}
