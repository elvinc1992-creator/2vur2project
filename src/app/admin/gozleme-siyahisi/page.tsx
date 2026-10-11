import { desc } from "drizzle-orm";
import type { Metadata } from "next";
import { db } from "@/db";
import { waitlist } from "@/db/schema";
import { PageHead, Stat, Table, fmtDate, td, th } from "../ui";

export const metadata: Metadata = { title: "Gözləmə siyahısı" };

const ROLE: Record<string, string> = { sagird: "Şagird", muellim: "Müəllim", valideyn: "Valideyn" };

/** Ana səhifədən (sayt açılana qədər) gözləmə siyahısına qoşulanlar. */
export default async function AdminWaitlist() {
  const rows = await db.select().from(waitlist).orderBy(desc(waitlist.createdAt));
  return (
    <>
      <PageHead title="Gözləmə siyahısı" lead="Ana səhifədən qoşulanlar — hamısı e-poçt almağa razılıq verib. Açılış günü onlara xəbər göndəriləcək." />
      <div className="grid grid-cols-2 gap-3 sm:grid-cols-4">
        <Stat label="Cəmi" value={rows.length} tone="navy" />
        {Object.entries(ROLE).map(([k, v]) => (
          <Stat key={k} label={v} value={rows.filter((r) => r.role === k).length} />
        ))}
      </div>
      <Table caption="Qoşulanlar">
        <thead className="bg-navy-050">
          <tr>
            {["Tarix", "Ad", "E-poçt", "Kim", "Sinif"].map((h) => (
              <th key={h} scope="col" className={th}>
                {h}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {rows.length === 0 && (
            <tr>
              <td className={td} colSpan={5}>
                Hələ qoşulan yoxdur.
              </td>
            </tr>
          )}
          {rows.map((r) => (
            <tr key={r.email} className="border-t border-line">
              <td className={td}>{fmtDate(r.createdAt)}</td>
              <td className={td}>{r.name}</td>
              <td className={td}>{r.email}</td>
              <td className={td}>{ROLE[r.role]}</td>
              <td className={td}>{r.grade ?? "—"}</td>
            </tr>
          ))}
        </tbody>
      </Table>
    </>
  );
}
