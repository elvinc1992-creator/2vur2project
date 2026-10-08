"use client";

import Link from "next/link";
import { useEffect, useId, useState } from "react";
import { CloseIcon, MenuIcon, SendIcon } from "@/components/icons";
import { Logo } from "@/components/logo";
import { buttonClass } from "@/components/ui/button";
import { brand, socialUrl } from "@/config/brand";
import { az } from "@/content/az";
import { cn } from "@/lib/cn";

const t = az.landing.nav;
const telegram = socialUrl(brand.telegramUrl);
const LINKS = [
  { href: "#movzular", label: t.topics },
  { href: "#nece-isleyir", label: t.how },
  { href: "#sinaqlar", label: t.exams },
  { href: "#qiymetler", label: t.pricing },
];

/** İctimai header: desktop-da 4 link + Daxil ol + Telegram; mobil-də açılan menyu. */
export function SiteHeader() {
  const [open, setOpen] = useState(false);
  const menuId = useId();

  useEffect(() => {
    if (!open) return;
    const onKey = (e: KeyboardEvent) => e.key === "Escape" && setOpen(false);
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [open]);

  return (
    <header className="sticky top-0 z-20 border-b border-line bg-bg/92 backdrop-blur-sm">
      <div className="mx-auto flex min-h-16 w-full max-w-content items-center justify-between gap-3 px-4 md:px-8">
        <Logo />
        <nav aria-label={t.label} className="hidden gap-1 lg:flex">
          {LINKS.map((l) => (
            <a key={l.href} href={l.href} className="rounded-[10px] px-3 py-2.5 font-semibold text-ink no-underline hover:bg-navy-100">
              {l.label}
            </a>
          ))}
        </nav>
        <div className="flex items-center gap-2">
          <Link href="/daxil-ol" className={cn(buttonClass({ variant: "ghost" }), "max-lg:hidden")}>
            {t.login}
          </Link>
          <PrimaryCta className={cn(buttonClass({ variant: "primary", size: "sm" }), "max-lg:hidden")} />
          <button
            type="button"
            aria-expanded={open}
            aria-controls={menuId}
            aria-label={open ? t.close : t.menu}
            onClick={() => setOpen((v) => !v)}
            className="grid size-12 cursor-pointer place-items-center rounded-[12px] border border-line bg-white text-navy-900 lg:hidden"
          >
            {open ? <CloseIcon className="size-[22px]" /> : <MenuIcon className="size-[22px]" />}
          </button>
        </div>
      </div>
      {open && (
        <nav id={menuId} aria-label={t.label} className="border-t border-line bg-white px-4 pt-2 pb-4 lg:hidden">
          <ul className="m-0 grid list-none gap-1 p-0">
            {LINKS.map((l) => (
              <li key={l.href}>
                <a
                  href={l.href}
                  onClick={() => setOpen(false)}
                  className="flex min-h-12 items-center rounded-[12px] px-3 font-semibold text-ink no-underline hover:bg-navy-050"
                >
                  {l.label}
                </a>
              </li>
            ))}
          </ul>
          <div className="mt-3 grid gap-2">
            <Link href="/daxil-ol" className={buttonClass({ variant: "secondary", block: true })}>
              {t.login}
            </Link>
            <PrimaryCta className={buttonClass({ variant: "primary", block: true })} />
          </div>
        </nav>
      )}
    </header>
  );
}

/** Telegram linki varsa — kanal, yoxdursa — pulsuz qeydiyyat. */
function PrimaryCta({ className }: { className: string }) {
  if (!telegram)
    return (
      <Link href="/qeydiyyat" className={className}>
        {t.signup}
      </Link>
    );
  return (
    <a href={telegram} target="_blank" rel="noopener noreferrer" className={className}>
      <SendIcon />
      {t.telegram}
    </a>
  );
}
