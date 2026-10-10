import type { Metadata } from "next";
import Link from "next/link";
import { requireAdmin } from "@/lib/admin/guard";
import { AdminNav } from "./admin-nav";

export const metadata: Metadata = { title: { default: "Admin", template: "%s · Admin · 2vur2" }, robots: { index: false } };

/** Admin paneli: yalnız "admin" rolu (bazadan yoxlanılır). */
export default async function AdminLayout({ children }: { children: React.ReactNode }) {
  const me = await requireAdmin();
  return (
    <div className="min-h-dvh bg-bg lg:grid lg:grid-cols-[250px_minmax(0,1fr)]">
      <aside className="grid content-start gap-4 bg-navy-900 px-4 py-4 text-white lg:sticky lg:top-0 lg:h-dvh lg:py-6">
        <div className="flex items-center justify-between gap-3 lg:grid lg:gap-1">
          <Link href="/admin" className="font-display text-[20px] font-extrabold text-white no-underline">
            2vur2 · Admin
          </Link>
          <span className="text-[12.5px] text-on-navy-muted">{me.name}</span>
        </div>
        <AdminNav />
        <Link href="/panel" className="text-[13.5px] font-semibold text-on-navy-muted no-underline hover:text-white">
          ← Sayta qayıt
        </Link>
      </aside>
      <main className="grid min-w-0 content-start gap-6 px-4 py-6 lg:px-8">{children}</main>
    </div>
  );
}
