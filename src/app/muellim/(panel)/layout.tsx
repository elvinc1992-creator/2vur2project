import Link from "next/link";
import { Logo } from "@/components/logo";
import { TeacherMenu } from "@/components/teacher/menu";
import { azn, brand } from "@/components/teacher/ui";
import { cn } from "@/lib/cn";
import { requireTeacher } from "@/lib/teacher/guard";

// Müəllim paneli: yalnız təsdiqlənmiş müəllim (rol "teacher"). Yan menyu + balans.
export default async function TeacherLayout({ children }: { children: React.ReactNode }) {
  const me = await requireTeacher();
  return (
    <div className="min-h-dvh bg-[#f4f6fb] text-[#0f1b3d] lg:grid lg:grid-cols-[250px_minmax(0,1fr)]">
      <aside className="border-b border-[#e6e9f2] bg-white px-3.5 py-4 lg:sticky lg:top-0 lg:h-dvh lg:border-r lg:border-b-0">
        <div className="flex items-center justify-between gap-2 px-2 pb-4">
          <div>
            <Logo />
            <small className="mt-1 block text-[11px] font-semibold text-[#5b6785]">Müəllim paneli</small>
          </div>
          <Link href="/panel" className="text-[12px] font-semibold text-[#5b6785] lg:hidden">
            Sayta qayıt
          </Link>
        </div>
        <TeacherMenu />
        <div className={cn(brand, "mt-4 hidden rounded-[16px] p-3.5 text-white lg:block")}>
          <small className="text-white/85">Balans</small>
          <b className="block text-[24px] font-black">{azn(me.balance)}</b>
          <small className="text-white/85">Onlayn sınaq: 1 ₼ / şagird</small>
          <br />
          <Link href="/muellim/balans" className="mt-2 inline-block rounded-[9px] bg-white px-3 py-1.5 text-[13px] font-extrabold text-[#4f46e5] no-underline">
            Balansı artır
          </Link>
        </div>
        <Link href="/panel" className="mt-4 hidden px-3 text-[13px] font-semibold text-[#5b6785] lg:block">
          ← Sayta qayıt
        </Link>
      </aside>
      <main className="min-w-0 px-4 pt-5 pb-14 lg:px-7 lg:pt-6">{children}</main>
    </div>
  );
}
