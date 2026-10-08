import Link from "next/link";
import type { ReactNode } from "react";
import { BackIcon, CloseIcon } from "@/components/icons";
import { Logo } from "@/components/logo";
import { az } from "@/content/az";

export const iconBtnClass =
  "grid size-12 flex-none cursor-pointer place-items-center rounded-[12px] border border-line bg-white text-navy-900 no-underline [&>svg]:size-[22px]";

/**
 * Yuxarı panel. Mobil-də brend adı (və ya geri düyməsi + başlıq), desktop-da səhifə başlığı.
 */
export function Topbar({
  title,
  back,
  close,
  right,
  avatar,
}: {
  title: string;
  back?: string;
  close?: string;
  right?: ReactNode;
  avatar?: string;
}) {
  const t = az.app.nav;
  return (
    <div className="sticky top-0 z-10 flex min-h-16 items-center justify-between gap-3 border-b border-line bg-white px-4 py-3 lg:px-8 lg:py-4">
      <div className="flex min-w-0 items-center gap-2">
        {back && (
          <Link href={back} aria-label={t.back} className={`${iconBtnClass} border-0`}>
            <BackIcon />
          </Link>
        )}
        <strong className="font-display text-lg leading-6 font-extrabold break-words text-navy-900">
          {back ? (
            title
          ) : (
            <>
              <span className="lg:hidden">
                <Logo asLink={false} />
              </span>
              <span className="hidden lg:inline">{title}</span>
            </>
          )}
        </strong>
      </div>
      <div className="flex items-center gap-2">
        {right}
        {close && (
          <Link href={close} aria-label={t.close} className={iconBtnClass}>
            <CloseIcon />
          </Link>
        )}
        {avatar && (
          <Link
            href="/profil"
            aria-label={az.app.nav.profile}
            className="grid size-11 flex-none place-items-center rounded-full bg-navy-100 font-display text-base font-extrabold text-navy-900 no-underline"
          >
            {avatar}
          </Link>
        )}
      </div>
    </div>
  );
}

export function Page({ children, narrow }: { children: ReactNode; narrow?: boolean }) {
  return (
    <main className="grid grid-cols-1 content-start gap-6 px-4 pt-5 pb-8 lg:gap-8 lg:p-8">
      {narrow ? <div className="mx-auto grid w-full max-w-[640px] gap-4">{children}</div> : children}
    </main>
  );
}
