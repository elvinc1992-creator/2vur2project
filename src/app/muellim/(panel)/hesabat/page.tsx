import { and, eq } from "drizzle-orm";
import type { Metadata } from "next";
import Link from "next/link";
import { ReportView } from "@/components/teacher/report-view";
import { btnDark, btnMain, Card, field, label, Notice, Top } from "@/components/teacher/ui";
import { db } from "@/db";
import { teacherReports } from "@/db/schema";
import { env } from "@/lib/env";
import { createReportAction, type ReportData } from "@/lib/teacher/actions";
import { fullName, groupsOf, membersOf } from "@/lib/teacher/data";
import { requireTeacher } from "@/lib/teacher/guard";

export const metadata: Metadata = { title: "Valideyn hesabatı" };

const monthNow = () => new Intl.DateTimeFormat("en-CA", { timeZone: "Asia/Baku", year: "numeric", month: "2-digit" }).format(new Date());

/** Aylıq hesabat: şagird seçilir, qeyd yazılır → link (30 gün) və PDF (çap). */
export default async function ReportPage(props: PageProps<"/muellim/hesabat">) {
  const me = await requireTeacher("/muellim/hesabat");
  const sp = await props.searchParams;
  const groups = await groupsOf(me.id);
  const g = groups.find((x) => x.id === sp.qrup) ?? groups[0];
  const members = g ? await membersOf(g.id) : [];
  const [report] =
    typeof sp.r === "string" ? await db.select().from(teacherReports).where(and(eq(teacherReports.id, sp.r), eq(teacherReports.teacherId, me.id))) : [];
  const link = report ? `${env.APP_URL}/hesabat/${report.id}` : null;

  return (
    <>
      <Top title="Valideyn hesabatı" lead="Linki və ya PDF-i valideynə göndər. Link giriş tələb etmir və 30 gündən sonra etibarsız olur." />
      {sp.xeta && <Notice tone="error">Şagird tapılmadı.</Notice>}
      {!g ? (
        <Card>
          <p className="m-0">
            Hələ qrup yoxdur. <Link href="/muellim/qruplar">Qrup yarat</Link>
          </p>
        </Card>
      ) : (
        <Card title="Hesabat hazırla">
          <form className="mb-3 flex flex-wrap items-end gap-2">
            <label className={label}>
              Qrup
              <select name="qrup" defaultValue={g.id} className={`${field} w-auto`}>
                {groups.map((x) => (
                  <option key={x.id} value={x.id}>
                    {x.name}
                  </option>
                ))}
              </select>
            </label>
            <button className="min-h-11 cursor-pointer rounded-[12px] border border-[#e6e9f2] bg-white px-4 text-[14px] font-bold">Seç</button>
          </form>
          <form action={createReportAction} className="grid gap-3 md:grid-cols-[1.4fr_1fr] md:items-end">
            <input type="hidden" name="groupId" value={g.id} />
            <label className={label}>
              Şagird
              <select name="userId" required defaultValue={typeof sp.sagird === "string" ? sp.sagird : undefined} className={field}>
                {members.map((m) => (
                  <option key={m.id} value={m.id}>
                    {fullName(m)}
                  </option>
                ))}
              </select>
            </label>
            <label className={label}>
              Ay
              <input name="month" type="month" required defaultValue={monthNow()} className={field} />
            </label>
            <label className={`${label} md:col-span-2`}>
              Müəllimin qeydi (könüllü)
              <textarea name="note" rows={2} maxLength={600} className={`${field} py-2`} placeholder="Məs. Faiz məsələlərində irəliləyiş var, evdə həftədə 2 dəfə 10 sual həll etməsi tövsiyə olunur." />
            </label>
            <button disabled={!members.length} className={`${btnMain} justify-self-start disabled:opacity-60`}>
              Hesabatı hazırla
            </button>
          </form>
        </Card>
      )}
      {report && link && (
        <div className="mt-4 grid gap-3">
          <Card title="Paylaş" sub={`Link ${new Intl.DateTimeFormat("az-AZ", { timeZone: "Asia/Baku", dateStyle: "long" }).format(report.expiresAt)} tarixinədək etibarlıdır.`}>
            <div className="flex flex-wrap items-center gap-2">
              <code className="min-w-0 rounded-[10px] bg-[#f8fafc] px-3 py-2 text-[13px] break-all">{link}</code>
              <a href={`/hesabat/${report.id}?cap=1`} target="_blank" rel="noopener" className={btnDark}>
                ⬇️ PDF
              </a>
            </div>
          </Card>
          <ReportView d={JSON.parse(report.data) as ReportData} note={report.note} />
        </div>
      )}
    </>
  );
}
