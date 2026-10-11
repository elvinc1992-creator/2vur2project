import { eq } from "drizzle-orm";
import type { Metadata } from "next";
import Link from "next/link";
import { redirect } from "next/navigation";
import { auth } from "@/auth";
import { Logo } from "@/components/logo";
import { btnMain, card, field, label, Notice } from "@/components/teacher/ui";
import { db } from "@/db";
import { teacherApplications, users } from "@/db/schema";
import { ensureActive } from "@/lib/auth/account";
import { applyTeacherAction } from "@/lib/teacher/actions";

export const metadata: Metadata = { title: "Müəllim paneli — müraciət" };

/** Müəllim paneli yalnız təsdiqlənmiş müəllimlər üçündür: müraciət → admin təsdiqi → "teacher" rolu. */
export default async function Apply(props: PageProps<"/muellim/muraciet">) {
  const session = await auth();
  if (!session?.user?.id) redirect("/daxil-ol?next=/muellim/muraciet");
  await ensureActive(session.user.id);
  const sp = await props.searchParams;
  const [[u], [app]] = await Promise.all([
    db.select({ role: users.role }).from(users).where(eq(users.id, session.user.id)),
    db.select().from(teacherApplications).where(eq(teacherApplications.userId, session.user.id)),
  ]);
  if (u?.role === "teacher") redirect("/muellim");

  return (
    <main className="min-h-dvh bg-[#f4f6fb] px-4 py-8 text-[#0f1b3d]">
      <div className="mx-auto grid max-w-[620px] gap-4">
        <div className="flex items-center justify-between">
          <Logo />
          <Link href="/panel" className="text-[14px] font-semibold text-[#5b6785]">
            ← Sayta qayıt
          </Link>
        </div>
        <section className={card}>
          <h1 className="m-0 mb-1 text-[24px] font-black">Müəllim paneli</h1>
          <p className="m-0 mb-4 text-[#5b6785]">
            Qruplar yarat, DİM formatında sınaqlar keçir (kağız — 2 ₼, onlayn — 2–3 ₼, sınaq başına), nəticələri və zəif mövzuları izlə, valideynlərə aylıq hesabat göndər. Panel
            admin təsdiqindən sonra açılır.
          </p>
          {sp.gonderildi && <Notice tone="ok">Müraciətin göndərildi. Admin təsdiqləyəndən sonra panel açılacaq.</Notice>}
          {sp.xeta && <Notice tone="error">Məktəbin adını yaz.</Notice>}
          {app?.status === "pending" && !sp.gonderildi && <Notice tone="info">Müraciətin baxılır — admin təsdiqləyəndən sonra panel açılacaq.</Notice>}
          {app?.status === "rejected" && <Notice tone="error">Müraciətin rədd edilib{app.adminNote ? `: ${app.adminNote}` : "."} Məlumatları yeniləyib yenidən göndərə bilərsən.</Notice>}
          {(!app || app.status === "rejected") && (
            <form action={applyTeacherAction} className="grid gap-3">
              <label className={label}>
                İşlədiyin məktəb və ya kurs
                <input name="school" required minLength={2} maxLength={120} defaultValue={app?.school} className={field} placeholder="Məs. 132 nömrəli məktəb" />
              </label>
              <label className={label}>
                Qısa məlumat (könüllü)
                <textarea name="note" rows={3} maxLength={500} defaultValue={app?.note ?? ""} className={`${field} py-2`} placeholder="Neçə il dərs deyirsən, hansı siniflərlə işləyirsən…" />
              </label>
              <button className={`${btnMain} justify-self-start`}>Müraciət göndər</button>
            </form>
          )}
        </section>
      </div>
    </main>
  );
}
