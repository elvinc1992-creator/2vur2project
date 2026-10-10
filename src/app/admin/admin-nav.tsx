"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { cn } from "@/lib/cn";

const ITEMS = [
  { href: "/admin", label: "Ümumi baxış", exact: true },
  { href: "/admin/istifadeciler", label: "İstifadəçilər" },
  { href: "/admin/abuneler", label: "Abunəçilər" },
  { href: "/admin/qazanc", label: "Qazanc" },
  { href: "/admin/suallar", label: "Suallar" },
  { href: "/admin/sinaqlar", label: "Sınaqlar" },
  { href: "/admin/zeif-movzular", label: "Mövzular və səhv tipləri" },
];

export function AdminNav() {
  const path = usePathname();
  return (
    <nav aria-label="Admin" className="flex gap-1 overflow-x-auto lg:grid lg:content-start lg:overflow-visible">
      {ITEMS.map((i) => {
        const active = i.exact ? path === i.href : path === i.href || path.startsWith(`${i.href}/`);
        return (
          <Link
            key={i.href}
            href={i.href}
            aria-current={active ? "page" : undefined}
            className={cn(
              "flex min-h-11 flex-none items-center rounded-[10px] px-3 text-[14.5px] font-semibold whitespace-nowrap no-underline",
              active ? "bg-white/15 text-white" : "text-on-navy-muted hover:bg-white/10 hover:text-white",
            )}
          >
            {i.label}
          </Link>
        );
      })}
    </nav>
  );
}
