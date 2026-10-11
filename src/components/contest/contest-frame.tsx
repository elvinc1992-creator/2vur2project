import Link from "next/link";
import type { ReactNode } from "react";
import { Logo } from "@/components/logo";

/** Turun və nəticənin sadə çərçivəsi (diqqəti yayındıran menyu yoxdur). */
export function ContestFrame({ title, back, children }: { title: string; back?: string; children: ReactNode }) {
  return (
    <div className="min-h-dvh bg-[#f4f6fb] text-[#0f1b3d]">
      <header className="border-b border-[#e6e9f2] bg-white/80">
        <div className="mx-auto flex h-[60px] max-w-[760px] items-center justify-between gap-3 px-4">
          <Logo />
          {back && (
            <Link href={back} className="text-[14px] font-semibold text-[#4f46e5]">
              ← Yarış səhifəsi
            </Link>
          )}
        </div>
      </header>
      <main className="mx-auto grid max-w-[760px] gap-5 px-4 py-6">
        <h1 className="m-0 text-[clamp(22px,3vw,28px)] font-black tracking-[-0.02em]">{title}</h1>
        {children}
      </main>
      <footer className="mx-auto max-w-[760px] px-4 pb-8 text-center text-[13px] text-[#5b6785]">© 2vur2.az · Bu material 2vur2.az saytına məxsusdur</footer>
    </div>
  );
}
