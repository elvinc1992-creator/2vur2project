"use client";

import Link from "next/link";
import { ArrowIcon, CheckCircleIcon } from "@/components/icons";
import { az } from "@/content/az";
import { useSessionUser } from "./use-session-user";

const t = az.landing.nav;

/** Daxil olmuş istifadəçiyə ana səhifədə adı və soyadı ilə salam — hesabına daxil olduğunu bilsin. */
export function Welcome() {
  const user = useSessionUser();
  if (!user) return null;
  const name = user.name?.trim() || user.email || "";
  return (
    <div
      role="status"
      className="flex flex-wrap items-center gap-x-3 gap-y-2 justify-self-start rounded-2xl border border-success-700/30 bg-success-100 px-4 py-2.5 text-[15px] text-ink"
    >
      <CheckCircleIcon className="size-[22px] flex-none text-success-700" />
      <span>
        <b className="text-navy-900">{t.hello(name)}</b> {t.loggedIn}
      </span>
      <Link href="/panel" className="inline-flex items-center gap-1 font-bold text-navy-500 underline underline-offset-3">
        {t.toPanel}
        <ArrowIcon className="size-4" />
      </Link>
    </div>
  );
}
