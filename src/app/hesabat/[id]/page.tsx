import { eq } from "drizzle-orm";
import type { Metadata } from "next";
import { PrintButton } from "@/components/teacher/print-button";
import { ReportView } from "@/components/teacher/report-view";
import { db } from "@/db";
import { teacherReports } from "@/db/schema";
import type { ReportData } from "@/lib/teacher/actions";

export const metadata: Metadata = { title: "Aylıq hesabat", robots: { index: false, follow: false } };

const serverNow = () => Date.now();

/** Valideyn üçün hesabat: giriş tələb etmir; təxmin edilə bilməyən link, 30 gündən sonra etibarsız. */
export default async function PublicReport(props: PageProps<"/hesabat/[id]">) {
  const { id } = await props.params;
  const [r] = await db.select().from(teacherReports).where(eq(teacherReports.id, id));
  const valid = r && r.expiresAt.getTime() > serverNow();
  return (
    <main className="min-h-dvh bg-[#f4f6fb] px-4 py-8">
      <style dangerouslySetInnerHTML={{ __html: "@page{size:A4;margin:14mm}@media print{.noprint{display:none!important}main{background:#fff!important;padding:0!important}}" }} />
      {valid ? (
        <>
          <div className="noprint mx-auto mb-3 flex max-w-[620px] justify-end">
            <PrintButton />
          </div>
          <ReportView d={JSON.parse(r.data) as ReportData} note={r.note} />
        </>
      ) : (
        <p className="mx-auto max-w-[520px] rounded-[18px] border border-[#e6e9f2] bg-white p-6 text-center text-[17px] font-semibold text-[#0f1b3d]">
          Bu hesabatın linki etibarsızdır və ya müddəti (30 gün) bitib.
        </p>
      )}
    </main>
  );
}
