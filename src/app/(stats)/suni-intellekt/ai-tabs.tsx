import Link from "next/link";
import { aiText } from "@/content/az-ai";
import { cn } from "@/lib/cn";

/** AI bölməsinin alt bölmələri — səhifənin yuxarısında (mobildə yan menyu yoxdur). */
export function AiTabs({ current }: { current: string }) {
  return (
    <nav aria-label={aiText.nav} className="min-w-0">
      <ul className="m-0 flex list-none gap-2 overflow-x-auto p-0 pb-1">
        {aiText.children.map((c) => (
          <li key={c.href} className="flex-none">
            <Link
              href={c.href}
              aria-current={c.href === current ? "page" : undefined}
              className={cn(
                "inline-flex min-h-10 items-center rounded-pill border px-3.5 text-[14px] font-semibold whitespace-nowrap no-underline transition-colors",
                c.href === current ? "border-violet-600 bg-violet-600 text-white" : "border-line bg-white text-navy-900 hover:border-violet-400 hover:bg-violet-50",
              )}
            >
              {c.label}
            </Link>
          </li>
        ))}
      </ul>
    </nav>
  );
}
