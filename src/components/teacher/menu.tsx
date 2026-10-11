"use client";

import Link from "next/link";
import { usePathname, useSearchParams } from "next/navigation";
import { cn } from "@/lib/cn";

type Item = { href: string; icon: string; label: string; active: (path: string, results: boolean) => boolean };

const under = (path: string, base: string) => path === base || path.startsWith(`${base}/`);
/** Kağız nəticələri: siyahı (?netice=1) və sınağın nəticə cədvəli (/muellim/sinaqlar/[id]/netice). */
const isResults = (path: string, results: boolean) => (path === "/muellim/sinaqlar" && results) || /^\/muellim\/sinaqlar\/[^/]+\/netice$/.test(path);

const ITEMS: Item[] = [
  { href: "/muellim", icon: "🏠", label: "Ümumi baxış", active: (p) => p === "/muellim" },
  { href: "/muellim/qruplar", icon: "👥", label: "Qruplarım", active: (p) => under(p, "/muellim/qruplar") },
  { href: "/muellim/sinaq-yarat", icon: "📝", label: "Sınaq yarat", active: (p) => under(p, "/muellim/sinaq-yarat") },
  { href: "/muellim/sinaqlar", icon: "🖨️", label: "Sınaqlar və çap", active: (p, r) => under(p, "/muellim/sinaqlar") && !isResults(p, r) },
  { href: "/muellim/sinaqlar?netice=1", icon: "✍️", label: "Kağız nəticələri", active: isResults },
  { href: "/muellim/analitika", icon: "📊", label: "Analitika", active: (p) => under(p, "/muellim/analitika") },
  { href: "/muellim/hesabat", icon: "📨", label: "Valideyn hesabatı", active: (p) => under(p, "/muellim/hesabat") },
];

/** Müəllim panelinin menyusu (aktiv bölmə vurğulanır — yalnız biri). */
export function TeacherMenu() {
  const path = usePathname();
  const results = useSearchParams().get("netice") === "1";
  return (
    <nav aria-label="Müəllim paneli" className="flex gap-1 overflow-x-auto lg:grid lg:overflow-visible">
      {ITEMS.map((i) => {
        const on = i.active(path, results);
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
