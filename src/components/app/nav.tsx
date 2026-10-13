"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { useEffect, useRef, useState } from "react";
import { BagIcon, BookIcon, CalcIcon, CapIcon, CardIcon, ChartIcon, FlameIcon, HomeIcon, MenuIcon, RetryIcon, SparkleIcon, TargetIcon, UserIcon } from "@/components/icons";
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
const WEAK = { href: "/zeif-movzular", match: ["/zeif-movzular"], label: az.app.weak.nav, long: az.app.weak.nav, Icon: FlameIcon };
const SCORE = { href: "/bal-simulyatoru", match: ["/bal-simulyatoru"], label: t.score, long: t.score, Icon: CalcIcon };
const STATS = { href: "/statistika", match: ["/statistika"], label: t.stats, long: t.stats, Icon: ChartIcon };
const EXAM_MATCH = { href: "/imtahan-qarsiligi", match: ["/imtahan-qarsiligi"], label: az.app.examMatch.nav, long: az.app.examMatch.nav, Icon: BookIcon };
const PLANS = { href: "/abunelikler", match: ["/abunelikler", "/odenis"], label: t.plans, long: t.plans, Icon: CardIcon };
/** Riyaziyyat yarışı — pulsuz, hamı üçün eyni. */
const CONTEST = { href: "/yaris", match: ["/yaris"], label: "Yarış", long: "Riyaziyyat yarışı", Icon: SparkleIcon };
/** Müəllimin qrupları və onlayn sınaqları (şagird tərəfi). */
const GROUPS = { href: "/qruplarim", match: ["/qruplarim", "/muellim-sinaq"], label: "Qruplarım", long: "Qruplarım", Icon: UserIcon };

function useActive() {
  const path = usePathname();
  return (match: string[]) => match.some((m) => path === m || path.startsWith(`${m}/`));
}

/**
 * Əsas üç bölmə — yan paneldə "Əsas"-dan dərhal sonra, rəngli ikon, fon və qısa izahla seçilir.
 * Rənglər: repetitor — nəzəriyyə kitabının üz qabığı kimi bənövşəyi, sınaqlar — brendin mərcanı,
 * imtahan qarşılığı — zümrüd (həmin səhifədə "bizim sual" kartının rəngi).
 */
const FEATURED = [
  { item: ITEMS[2], hint: t.tutorHint, badge: t.newBadge, tile: "from-violet-600 to-indigo-900", tint: "border-violet-200 bg-violet-50 hover:border-violet-400", on: "border-violet-600 bg-violet-100" },
  { item: ITEMS[3], hint: t.examsHint, badge: null, tile: "from-coral-600 to-coral-700", tint: "border-coral-100 bg-coral-100/50 hover:border-coral-500", on: "border-coral-600 bg-coral-100" },
  { item: EXAM_MATCH, hint: t.examMatchHint, badge: null, tile: "from-emerald-600 to-emerald-900", tint: "border-emerald-200 bg-emerald-50 hover:border-emerald-500", on: "border-emerald-600 bg-emerald-100" },
];

/** Desktop yan panel (≥1024px). */
export function SideNav({ footer }: { footer?: React.ReactNode }) {
  const isActive = useActive();
  return (
    <nav aria-label={t.label} className="grid content-start gap-1">
      <NavLink {...ITEMS[0]} active={isActive(ITEMS[0].match)} />
      <div className="my-1.5 grid gap-2">
        {FEATURED.map(({ item: { href, match, long, Icon }, hint, badge, tile, tint, on }) => {
          const active = isActive(match);
          return (
            <Link
              key={href}
              href={href}
              aria-current={active ? "page" : undefined}
              className={cn("relative flex items-center gap-3 rounded-[14px] border-[1.5px] px-2.5 py-2 no-underline transition-colors", active ? on : tint)}
            >
              <span className={cn("grid size-10 flex-none place-items-center rounded-[11px] bg-linear-to-br text-white shadow-[0_6px_14px_-8px_rgba(15,27,61,.7)]", tile)}>
                <Icon className="size-[22px]" />
              </span>
              <span className="grid min-w-0 gap-0.5">
                <span className="leading-5 font-bold text-navy-900">{long}</span>
                <span className="truncate text-[12.5px] leading-4 font-medium text-ink-muted">{hint}</span>
              </span>
              {badge && (
                <b className="absolute -top-2 right-2 rounded-pill bg-coral-600 px-1.5 py-px text-[10.5px] leading-4 font-bold tracking-[0.04em] text-white uppercase shadow-card">
                  {badge}
                </b>
              )}
            </Link>
          );
        })}
      </div>
      {[ITEMS[1], ITEMS[4], MISTAKES, WEAK, SCORE, STATS, CONTEST, GROUPS, PLANS].map((item) => (
        <NavLink key={item.href} {...item} active={isActive(item.match)} />
      ))}
      {footer}
    </nav>
  );
}

function NavLink({ href, long, Icon, active }: { href: string; long: string; Icon: (typeof ITEMS)[number]["Icon"]; active: boolean }) {
  return (
    <Link
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
}

const TAB_TINT: Record<string, string | undefined> = { [ITEMS[2].href]: "text-violet-700", [ITEMS[3].href]: "text-coral-600", [EXAM_MATCH.href]: "text-emerald-700" };

/** Mobil alt menyunun "Menyu" panelindəki bölmələr (alt menyuda olmayanlar da daxil — telefonda hamısı açılsın). */
const MORE = [EXAM_MATCH, ITEMS[4], MISTAKES, WEAK, SCORE, STATS, CONTEST, GROUPS, PLANS];

/**
 * Mobil alt tab paneli (<1024px): 4 əsas bölmə + "Menyu" — bütün qalan bölmələr (Profil, Səhvlərim, Zəif mövzular,
 * Statistika, Yarış, Qruplarım, Abunəliklər, müəllim / admin paneli). Aktiv: navy mətn + coral ikon.
 */
export function TabBar({ teacher = false, admin = false }: { teacher?: boolean; admin?: boolean }) {
  const isActive = useActive();
  const path = usePathname();
  const [openAt, setOpenAt] = useState<string | null>(null);
  // Başqa səhifəyə keçəndə panel özü bağlanır
  const open = openAt === path;
  const close = () => setOpenAt(null);
  const panelRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (!open) return;
    const onKey = (e: KeyboardEvent) => e.key === "Escape" && setOpenAt(null);
    document.addEventListener("keydown", onKey);
    panelRef.current?.querySelector<HTMLElement>("a")?.focus();
    return () => document.removeEventListener("keydown", onKey);
  }, [open]);

  const extra = [
    { href: teacher ? "/muellim" : "/muellim/muraciet", label: teacher ? "Müəllim paneli" : "Müəllimsən? Müraciət et" },
    ...(admin ? [{ href: "/admin", label: "Admin paneli" }] : []),
  ];
  const moreActive = MORE.some((m) => isActive(m.match));

  return (
    <>
      {open && (
        <div className="fixed inset-0 z-30 lg:hidden">
          <button type="button" aria-label={t.close} onClick={close} className="absolute inset-0 cursor-default bg-navy-900/40" />
          <div
            ref={panelRef}
            id="mobile-menu"
            role="dialog"
            aria-modal="true"
            aria-label="Bütün bölmələr"
            className="absolute inset-x-0 bottom-0 max-h-[85dvh] overflow-y-auto rounded-t-[22px] bg-white px-4 pt-3 pb-[max(16px,env(safe-area-inset-bottom))] shadow-[0_-20px_40px_-20px_rgba(15,27,61,.4)]"
          >
            <div className="mb-2 flex items-center justify-between">
              <b className="text-[17px] text-navy-900">Bütün bölmələr</b>
              <button type="button" onClick={close} className="min-h-11 cursor-pointer rounded-[10px] px-3 font-semibold text-navy-500">
                {t.close}
              </button>
            </div>
            <ul className="m-0 grid list-none grid-cols-2 gap-2 p-0">
              {MORE.map(({ href, match, long, Icon }) => {
                const active = isActive(match);
                return (
                  <li key={href}>
                    <Link
                      href={href}
                      onClick={close}
                      aria-current={active ? "page" : undefined}
                      className={cn(
                        "flex min-h-12 items-center gap-2.5 rounded-[12px] border px-3 py-2 text-[14.5px] font-semibold no-underline",
                        active ? "border-navy-100 bg-navy-100 text-navy-900" : "border-line text-ink",
                      )}
                    >
                      <Icon className={cn("size-[22px] shrink-0", active ? "text-coral-600" : (TAB_TINT[href] ?? "text-ink-muted"))} />
                      {long}
                    </Link>
                  </li>
                );
              })}
            </ul>
            <div className="mt-3 grid gap-1 border-t border-line pt-3">
              {extra.map((x) => (
                <Link key={x.href} href={x.href} onClick={close} className="flex min-h-11 items-center px-1 text-[14.5px] font-semibold">
                  {x.label} →
                </Link>
              ))}
            </div>
          </div>
        </div>
      )}
      <nav
        aria-label={t.label}
        data-tabbar
        className="sticky bottom-0 z-10 grid grid-cols-5 border-t border-line bg-white px-1 pt-1.5 pb-[max(10px,env(safe-area-inset-bottom))] lg:hidden"
      >
        {ITEMS.slice(0, 4).map(({ href, match, label, Icon }) => {
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
              {/* Repetitor və Sınaqlar — həmişə rəngli ikon (əsas bölmələr) */}
              <Icon className={cn("size-6", active ? "text-coral-600" : TAB_TINT[href])} />
              {label}
            </Link>
          );
        })}
        <button
          type="button"
          onClick={() => setOpenAt(open ? null : path)}
          aria-expanded={open}
          aria-controls="mobile-menu"
          className={cn(
            "grid min-h-[52px] cursor-pointer justify-items-center gap-0.5 rounded-[12px] py-1.5 text-caption font-semibold",
            moreActive || open ? "text-navy-900" : "text-ink-muted",
          )}
        >
          <MenuIcon className={cn("size-6", (moreActive || open) && "text-coral-600")} />
          Menyu
        </button>
      </nav>
    </>
  );
}
