"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { BagIcon, BookIcon, CalcIcon, CapIcon, CardIcon, ChartIcon, HomeIcon, RetryIcon, TargetIcon, UserIcon } from "@/components/icons";
import { az } from "@/content/az";
import { cn } from "@/lib/cn";

const t = az.app.nav;

const ITEMS = [
  { href: "/panel", match: ["/panel"], label: t.home, long: t.home, Icon: HomeIcon },
  { href: "/gunun-suallari", match: ["/gunun-suallari"], label: t.today, long: t.todayLong, Icon: TargetIcon },
  { href: "/onlayn-repetitor", match: ["/onlayn-repetitor"], label: t.tutor, long: t.tutorLong, Icon: CapIcon },
  { href: "/sinaqlar", match: ["/sinaqlar", "/sinaq"], label: t.exams, long: t.exams, Icon: BagIcon },
  { href: "/profil", match: ["/profil"], label: t.profile, long: t.profile, Icon: UserIcon },
];
const MISTAKES = { href: "/sehvlerim", match: ["/sehvlerim"], label: t.mistakes, long: t.mistakes, Icon: RetryIcon };
const SCORE = { href: "/bal-simulyatoru", match: ["/bal-simulyatoru"], label: t.score, long: t.score, Icon: CalcIcon };
const STATS = { href: "/statistika", match: ["/statistika"], label: t.stats, long: t.stats, Icon: ChartIcon };
const EXAM_MATCH = { href: "/imtahan-qarsiligi", match: ["/imtahan-qarsiligi"], label: az.app.examMatch.nav, long: az.app.examMatch.nav, Icon: BookIcon };
const PLANS = { href: "/abunelikler", match: ["/abunelikler", "/odenis"], label: t.plans, long: t.plans, Icon: CardIcon };

function useActive() {
  const path = usePathname();
  return (match: string[]) => match.some((m) => path === m || path.startsWith(`${m}/`));
}

/** Desktop yan panel (≥1024px). */
export function SideNav({ footer }: { footer?: React.ReactNode }) {
  const isActive = useActive();
  return (
    <nav aria-label={t.label} className="grid content-start gap-1">
      {[...ITEMS, MISTAKES, SCORE, STATS, EXAM_MATCH, PLANS].map(({ href, match, long, Icon }) => {
        const active = isActive(match);
        return (
          <Link
            key={href}
            href={href}
            aria-current={active ? "page" : undefined}
            className={cn(
              "relative flex min-h-12 items-center gap-3 rounded-[12px] px-3 font-semibold no-underline",
              active
                ? "bg-navy-100 text-navy-900 before:absolute before:inset-y-2 before:left-0 before:w-[3px] before:rounded-pill before:bg-navy-900"
                : "text-ink hover:bg-navy-050",
            )}
          >
            <Icon className={cn("size-[22px]", active ? "text-navy-900" : "text-ink-muted")} />
            {long}
          </Link>
        );
      })}
      {footer}
    </nav>
  );
}

/** Mobil alt tab paneli. Aktiv: navy mətn + coral ikon. */
export function TabBar() {
  const isActive = useActive();
  return (
    <nav
      aria-label={t.label}
      className="sticky bottom-0 z-10 grid grid-cols-5 border-t border-line bg-white px-1 pt-1.5 pb-[max(10px,env(safe-area-inset-bottom))] lg:hidden"
    >
      {ITEMS.map(({ href, match, label, Icon }) => {
        const active = isActive(match);
        return (
          <Link
            key={href}
            href={href}
            aria-current={active ? "page" : undefined}
            className={cn(
              "grid min-h-[52px] justify-items-center gap-0.5 rounded-[12px] py-1.5 text-caption font-semibold no-underline",
              active ? "text-navy-900" : "text-ink-muted",
            )}
          >
            <Icon className={cn("size-6", active && "text-coral-600")} />
            {label}
          </Link>
        );
      })}
    </nav>
  );
}
