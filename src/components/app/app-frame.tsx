import type { ReactNode } from "react";
import { SideNav, TabBar } from "@/components/app/nav";
import { FooterLight } from "@/components/footer";
import { Logo } from "@/components/logo";
import { buttonClass } from "@/components/ui/button";
import { Tag } from "@/components/ui/display";
import { az } from "@/content/az";
import { daysLeft, planStatus } from "@/lib/demo/logic";
import { PLANS, tierOf } from "@/lib/demo/plans";
import type { DemoState } from "@/lib/demo/state";
import Link from "next/link";

/** Tətbiq çərçivəsi: desktop-da sol yan panel, mobil-də alt tab paneli. */
export function AppFrame({ state, children }: { state: DemoState; children: ReactNode }) {
  const t = az.app;
  const days = daysLeft(state.sub.periodEnd);
  const plan = planStatus(state);
  const name = PLANS[tierOf(state)].name;
  const tag =
    plan === "free"
      ? { tone: "lock" as const, text: t.sub.free }
      : plan === "active"
        ? { tone: "success" as const, text: `${name} · ${t.sub.active(days)}` }
        : { tone: "warning" as const, text: `${name} · ${t.sub.canceled(days)}` };

  return (
    <div className="min-h-dvh lg:grid lg:grid-cols-[248px_1fr]">
      <aside className="hidden border-r border-line bg-white px-4 py-5 lg:block">
        <div className="sticky top-5 grid gap-5">
          <div className="px-3 pt-1">
            <Logo />
          </div>
          <SideNav
            footer={
              <div className="mt-6 grid gap-2 rounded-lg border border-line bg-navy-050 p-4">
                <span className="text-small text-ink-muted">{t.nav.subscription}</span>
                <Tag tone={tag.tone} dot className="justify-self-start">
                  {tag.text}
                </Tag>
              </div>
            }
          />
        </div>
      </aside>
      <div className="grid min-h-dvh min-w-0 grid-rows-[auto_1fr_auto]">
        {children}
        <TabBar />
      </div>
    </div>
  );
}

/** Qeydiyyatsız ziyarətçi üçün sadə çərçivə (Statistika ictimaidir). */
export function PublicFrame({ children }: { children: ReactNode }) {
  const t = az.app.stats;
  return (
    <div className="flex min-h-dvh flex-col">
      <header className="sticky top-0 z-10 border-b border-line bg-bg/95 backdrop-blur-sm">
        <div className="mx-auto flex min-h-16 w-full max-w-content flex-wrap items-center justify-between gap-3 px-4 py-2 md:px-8">
          <Logo />
          <nav aria-label={az.app.nav.label} className="flex items-center gap-2">
            <Link href="/daxil-ol?next=/statistika" className={buttonClass({ variant: "ghost", size: "sm" })}>
              {t.login}
            </Link>
            <Link href="/qeydiyyat" className={buttonClass({ variant: "navy", size: "sm" })}>
              {t.register}
            </Link>
          </nav>
        </div>
      </header>
      <div className="mx-auto w-full max-w-content flex-1">{children}</div>
      <FooterLight />
    </div>
  );
}
