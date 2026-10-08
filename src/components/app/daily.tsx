import Link from "next/link";
import {
  AngleIcon,
  CubeIcon,
  FunctionIcon,
  LockIcon,
  PercentIcon,
  RootIcon,
  SigmaIcon,
  TriangleIcon,
} from "@/components/icons";
import { ButtonLink } from "@/components/ui/button";
import { az } from "@/content/az";
import { cn } from "@/lib/cn";
import type { IconKey } from "@/lib/demo/content";
import type { PagerItem } from "@/lib/demo/logic";

const ICONS: Record<IconKey, typeof CubeIcon> = {
  percent: PercentIcon,
  function: FunctionIcon,
  angle: AngleIcon,
  triangle: TriangleIcon,
  root: RootIcon,
  sigma: SigmaIcon,
  cube: CubeIcon,
};

export function TopicIconBadge({ icon, className }: { icon: IconKey; className?: string }) {
  const Icon = ICONS[icon];
  return (
    <span
      className={cn(
        "grid size-10 flex-none place-items-center rounded-[12px] bg-navy-100 text-navy-900",
        className,
      )}
    >
      <Icon className="size-[22px]" />
    </span>
  );
}

/**
 * Mövzunun 1–10 sualı: düz / səhv / açıq / kilidli. Kilidli sualın linki paywall səhifəsinə aparır
 * (mətn və variantlar serverdən gəlmir).
 */
export function DailyPager({ items, label }: { items: PagerItem[]; label: string }) {
  const t = az.app.daily;
  return (
    <nav aria-label={label}>
      <ol className="m-0 grid list-none grid-cols-10 gap-1 p-0 md:gap-1.5">
        {items.map((it) => (
          <li key={it.n}>
            <Link
              href={it.href}
              aria-label={t.pagerItem(it.n, t.pagerStatus[it.status])}
              aria-current={it.current ? "page" : undefined}
              className={cn(
                "grid h-10 place-items-center rounded-[10px] border text-small font-bold tabular no-underline transition-colors",
                it.status === "ok" && "border-transparent bg-success-100 text-success-700",
                it.status === "bad" && "border-transparent bg-danger-100 text-danger-700",
                it.status === "open" && "border-control-border bg-white text-navy-900 hover:bg-navy-050",
                it.status === "locked" && "border-transparent bg-navy-050 text-ink-muted hover:bg-navy-100",
                it.current && "ring-2 ring-navy-900",
              )}
            >
              {it.status === "locked" ? <LockIcon className="size-4" /> : it.n}
            </Link>
          </li>
        ))}
      </ol>
    </nav>
  );
}

/** Pulsuz plan: günün sualları abunə ilə tam açılır (dizayn: Paywall, pulsuz istifadəçi). */
export function DailyUpsell({ locked, className }: { locked: number; className?: string }) {
  const t = az.app.daily;
  return (
    <div className={cn("grid gap-3 rounded-lg border border-navy-200 bg-white p-4 lg:p-5", className)}>
      <div className="flex items-start gap-3">
        <span className="grid size-11 flex-none place-items-center rounded-[14px] bg-coral-100 text-coral-700">
          <LockIcon className="size-[22px]" />
        </span>
        <div className="grid gap-1">
          <b className="font-display text-lg leading-6 font-extrabold text-navy-900">{t.upsellTitle}</b>
          <p className="text-small text-ink-muted">{t.upsellText(locked)}</p>
        </div>
      </div>
      <ButtonLink href="/odenis" variant="navy" size="sm" className="justify-self-start">
        {t.subscribe}
      </ButtonLink>
    </div>
  );
}

/** Paneldəki mövzu kartı üçün kiçik 10 xanalı zolaq (dekorativ — vəziyyət mətnlə də yazılır). */
export function DailyStrip({ items }: { items: PagerItem[] }) {
  return (
    <span aria-hidden="true" className="grid grid-cols-10 gap-[3px]">
      {items.map((it) => (
        <i
          key={it.n}
          className={cn(
            "grid h-5 place-items-center rounded-[5px]",
            it.status === "ok" && "bg-success-700",
            it.status === "bad" && "bg-danger-700",
            it.status === "open" && "border-[1.5px] border-navy-900 bg-white",
            it.status === "locked" && "bg-navy-100 text-ink-muted",
          )}
        >
          {it.status === "locked" && <LockIcon className="size-3" />}
        </i>
      ))}
    </span>
  );
}
