"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { cn } from "@/lib/cn";

const ITEMS = [
  { href: "/muellim", icon: "🏠", label: "Ümumi baxış", exact: true },
  { href: "/muellim/qruplar", icon: "👥", label: "Qruplarım" },
  { href: "/muellim/sinaq-yarat", icon: "📝", label: "Sınaq yarat" },
  { href: "/muellim/sinaqlar", icon: "🖨️", label: "Sınaqlar və çap" },
  { href: "/muellim/netice", icon: "✍️", label: "Kağız nəticələri" },
  { href: "/muellim/analitika", icon: "📊", label: "Analitika" },
  { href: "/muellim/hesabat", icon: "📨", label: "Valideyn hesabatı" },
];

/** Müəllim panelinin menyusu (aktiv bölmə vurğulanır). */
export function TeacherMenu() {
  const path = usePathname();
  return (
    <nav aria-label="Müəllim paneli" className="flex gap-1 overflow-x-auto lg:grid lg:overflow-visible">
      {ITEMS.map((i) => {
        const on = i.exact ? path === i.href : path === i.href || path.startsWith(`${i.href}/`);
        return (
          <Link
            key={i.href}
            href={i.href}
            aria-current={on ? "page" : undefined}
            className={cn(
              "flex min-h-11 flex-none items-center gap-2.5 rounded-[12px] px-3 text-[14.5px] font-semibold whitespace-nowrap no-underline",
              on ? "bg-[#eef0ff] text-[#4f46e5]" : "text-[#5b6785] hover:bg-[#f4f6fb] hover:text-[#0f1b3d]",
            )}
          >
            <span className="w-[22px] text-center" aria-hidden="true">
              {i.icon}
            </span>
            {i.label}
          </Link>
        );
      })}
    </nav>
  );
}
