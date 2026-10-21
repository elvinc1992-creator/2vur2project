"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { Fragment, useEffect, useRef, useState } from "react";
import { BagIcon, BookIcon, CalcIcon, CapIcon, CardIcon, ChartIcon, ChipIcon, FlameIcon, HomeIcon, MenuIcon, RetryIcon, SparkleIcon, TargetIcon, UserIcon } from "@/components/icons";
import { az } from "@/content/az";
import { aiText } from "@/content/az-ai";
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
/** AI analiz — valideyn bölmə; alt bölmələri (aiText.children) onun altında. */
const AI = { href: "/suni-intellekt", match: ["/suni-intellekt"], label: aiText.nav, long: aiText.nav, Icon: ChipIcon };
const PLANS = { href: "/abunelikler", match: ["/abunelikler", "/odenis"], label: t.plans, long: t.plans, Icon: CardIcon };
/** Riyaziyyat yarışı — pulsuz, hamı üçün eyni. Hələ hazırlanır: menyuda "Tezliklə" nişanı ilə. */
const CONTEST = { href: "/yaris", match: ["/yaris"], label: "Yarış", long: "Riyaziyyat yarışı", Icon: SparkleIcon, soon: true };
/** Müəllimin qrupları və onlayn sınaqları (şagird tərəfi). */
const GROUPS = { href: "/qruplarim", match: ["/qruplarim", "/muellim-sinaq"], label: "Qruplarım", long: "Qruplarım", Icon: UserIcon };

function useActive() {
  const path = usePathname();
  return (match: string[]) => match.some((m) => path === m || path.startsWith(`${m}/`));
}

/** AI alt bölməsi aktivdir: "Necə işləyir" — yalnız dəqiq ünvan, qalanları — ünvan və alt səhifələri. */
function useChildActive() {
  const path = usePathname();
  return (href: string) => (href === AI.href ? path === href : path === href || path.startsWith(`${href}/`));
}

/**
 * Əsas üç bölmə — yan paneldə "Əsas"-dan dərhal sonra, rəngli ikon, fon və qısa izahla seçilir.
 * Sıra: imtahan qarşılığı, sınaqlar, repetitor. Rənglər: imtahan qarşılığı — zümrüd (həmin səhifədə "bizim sual"
 * kartının rəngi), sınaqlar — brendin mərcanı, repetitor — nəzəriyyə kitabının üz qabığı kimi bənövşəyi.
 */
const FEATURED = [
  { item: EXAM_MATCH, hint: t.examMatchHint, badge: null, tile: "from-emerald-600 to-emerald-900", tint: "border-emerald-200 bg-emerald-50 hover:border-emerald-500", on: "border-emerald-600 bg-emerald-100" },
  { item: ITEMS[3], hint: t.examsHint, badge: null, tile: "from-coral-600 to-coral-700", tint: "border-coral-100 bg-coral-100/50 hover:border-coral-500", on: "border-coral-600 bg-coral-100" },
  { item: ITEMS[2], hint: t.tutorHint, badge: t.newBadge, tile: "from-violet-600 to-indigo-900", tint: "border-violet-200 bg-violet-50 hover:border-violet-400", on: "border-violet-600 bg-violet-100" },
];

/** Desktop yan panel (≥1024px). */
export function SideNav({ footer }: { footer?: React.ReactNode }) {
  const isActive = useActive();
  const childActive = useChildActive();
  return (
    <nav aria-label={t.label} className="grid content-start gap-1">
      <NavLink {...ITEMS[0]} active={isActive(ITEMS[0].match)} />
      <div className="my-1.5 grid gap-2">
        {FEATURED.map(({ item: { href, match, long, Icon }, hint, badge, tile, tint, on }) => {
          const active = isActive(match);
          return (
            <Fragment key={href}>
            <Link
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
            {/* "İmtahan qarşılığı"-ndan sonra — AI analiz və onun alt bölmələri */}
            {href === EXAM_MATCH.href && <AiGroup active={isActive(AI.match)} childActive={childActive} />}
            </Fragment>
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

/** Yan paneldə AI bölməsi: valideyn kart + həmişə görünən alt bölmələr (ağac kimi, sol xətlə). */
function AiGroup({ active, childActive }: { active: boolean; childActive: (href: string) => boolean }) {
  return (
    <div className="grid gap-1">
      <Link
        href={AI.href}
        aria-current={active && childActive(AI.href) ? "page" : undefined}
        className={cn(
          "relative flex items-center gap-3 rounded-[14px] border-[1.5px] px-2.5 py-2 no-underline transition-colors",
          active ? "border-fuchsia-600 bg-fuchsia-100" : "border-fuchsia-200 bg-fuchsia-50 hover:border-fuchsia-400",
        )}
      >
        <span className="grid size-10 flex-none place-items-center rounded-[11px] bg-linear-to-br from-fuchsia-600 to-violet-900 text-white shadow-[0_6px_14px_-8px_rgba(15,27,61,.7)]">
          <AI.Icon className="size-[22px]" />
        </span>
        <span className="grid min-w-0 gap-0.5">
          <span className="leading-5 font-bold text-navy-900">
            <span aria-hidden="true">🤖 </span>
            {AI.long}
          </span>
          <span className="truncate text-[12.5px] leading-4 font-medium text-ink-muted">{aiText.navHint}</span>
        </span>
      </Link>
      <ul aria-label={AI.long} className="m-0 ml-[29px] grid list-none gap-0.5 border-l-2 border-fuchsia-200 p-0 pl-2">
        {aiText.children.map((c) => {
          const on = childActive(c.href);
          return (
            <li key={c.href}>
              <Link
                href={c.href}
                aria-current={on ? "page" : undefined}
                className={cn(
                  "flex min-h-9 items-center rounded-[10px] px-2.5 text-[14px] font-semibold no-underline",
                  on ? "bg-fuchsia-100 text-navy-900" : "text-ink-muted hover:bg-navy-050 hover:text-ink",
                )}
              >
                {c.label}
              </Link>
            </li>
          );
        })}
      </ul>
    </div>
  );
}

function NavLink({ href, long, Icon, active, soon }: { href: string; long: string; Icon: (typeof ITEMS)[number]["Icon"]; active: boolean; soon?: boolean }) {
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
      <span className="grid min-w-0">
        {long}
        {soon && <SoonBadge />}
      </span>
    </Link>
  );
}

function SoonBadge() {
  return (
    <b className="text-[10px] leading-3 font-bold tracking-[0.03em] text-warning-700 uppercase">
      {t.soonBadge}
    </b>
  );
}

const TAB_TINT:Record<string, string | undefined> = { [ITEMS[2].href]: "text-violet-700", [ITEMS[3].href]: "text-coral-600", [EXAM_MATCH.href]: "text-emerald-700", [AI.href]: "text-fuchsia-700" };

/** Mobil alt menyunun "Menyu" panelindəki bölmələr (alt menyuda olmayanlar da daxil — telefonda hamısı açılsın). */
const MORE = [EXAM_MATCH, AI, ITEMS[4], MISTAKES, WEAK, SCORE, STATS, CONTEST, GROUPS, PLANS];

/**
 * Mobil alt tab paneli (<1024px): 4 əsas bölmə + "Menyu" — bütün qalan bölmələr (Profil, Səhvlərim, Zəif mövzular,
 * Statistika, Yarış, Qruplarım, Abunəliklər, müəllim / admin paneli). Aktiv: navy mətn + coral ikon.
 */
export function TabBar({ teacher = false, admin = false }: { teacher?: boolean; admin?: boolean }) {
  const isActive = useActive();
  const childActive = useChildActive();
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
              {MORE.map(({ href, match, long, Icon, ...rest }) => {
                const active = isActive(match);
                return (
                  <li key={href} className={cn(href === AI.href && "col-span-2 grid gap-1.5")}>
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
                      <span className="grid gap-0.5">
                        {long}
                        {"soon" in rest && rest.soon === true && <span className="text-[10px] leading-3 font-bold tracking-[0.03em] text-warning-700 uppercase">{t.soonBadge}</span>}
                      </span>
                    </Link>
                    {/* AI analizin alt bölmələri — valideynin altında */}
                    {href === AI.href && (
                      <ul aria-label={AI.long} className="m-0 ml-4 flex list-none flex-wrap gap-1.5 border-l-2 border-fuchsia-200 p-0 pl-2.5">
                        {aiText.children.map((c) => (
                          <li key={c.href}>
                            <Link
                              href={c.href}
                              onClick={close}
                              aria-current={childActive(c.href) ? "page" : undefined}
                              className={cn(
                                "inline-flex min-h-10 items-center rounded-pill border px-3 text-[13.5px] font-semibold no-underline",
                                childActive(c.href) ? "border-fuchsia-600 bg-fuchsia-100 text-navy-900" : "border-line text-ink",
                              )}
                            >
                              {c.label}
                            </Link>
                          </li>
                        ))}
                      </ul>
                    )}
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
