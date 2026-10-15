import { desc, eq } from "drizzle-orm";
import type { Metadata } from "next";
import Link from "next/link";
import { revalidatePath } from "next/cache";
import { db } from "@/db";
import { questionReports, users } from "@/db/schema";
import { requireAdmin } from "@/lib/admin/guard";
import { PageHead, Stat, Table, btnGhost, fmtDate, td, th } from "../ui";

export const metadata: Metadata = { title: "Səhv bildirişləri" };

const SOURCE: Record<string, string> = {
  exam: "Sınaq",
  daily: "Günün sualları",
  tutor: "Onlayn repetitor",
  review: "Səhvlərim",
  teacher: "Müəllim sınağı",
};

/** Bildirişi baxılmış / yenidən açıq etmək. */
async function toggleResolvedAction(formData: FormData) {
  "use server";
  await requireAdmin();
  const id = String(formData.get("id") ?? "");
  const resolved = formData.get("resolved") === "1";
  if (id) await db.update(questionReports).set({ resolved }).where(eq(questionReports.id, id));
  revalidatePath("/admin/sual-bildirisleri");
}

/** İstifadəçilərin sualdakı səhv barədə bildirişləri (sualın yanındakı ikon) — ən yenisi birinci. */
export default async function AdminQuestionReports() {
  const rows = await db
    .select({ r: questionReports, name: users.name, email: users.email })
    .from(questionReports)
    .leftJoin(users, eq(users.id, questionReports.userId))
    .orderBy(questionReports.resolved, desc(questionReports.createdAt))
    .limit(500);
  const open = rows.filter((x) => !x.r.resolved).length;
  return (
    <>
      <PageHead title="Səhv bildirişləri" lead="İstifadəçilər sualın yanındakı ikonla sualda gördükləri səhvi yazır. Düzəltdikdən sonra bildirişi “baxıldı” et." />
      <div className="grid grid-cols-2 gap-3 sm:grid-cols-4">
        <Stat label="Açıq" value={open} tone="navy" />
        <Stat label="Baxılıb" value={rows.length - open} />
      </div>
      <Table caption="Bildirişlər">
        <thead className="bg-navy-050">
          <tr>
            {["Tarix", "Sual", "Harada", "Rəy", "Kim", ""].map((h, i) => (
              <th key={i} scope="col" className={th}>
                {h}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {rows.length === 0 && (
            <tr>
              <td className={td} colSpan={6}>
                Hələ bildiriş yoxdur.
              </td>
            </tr>
          )}
          {rows.map(({ r, name, email }) => (
            <tr key={r.id} className={`border-t border-line ${r.resolved ? "opacity-60" : ""}`}>
              <td className={`${td} whitespace-nowrap`}>{fmtDate(r.createdAt)}</td>
              <td className={td}>
                <Link href={`/admin/suallar/${encodeURIComponent(r.code)}`} className="font-semibold text-navy-500 underline underline-offset-3">
                  {r.code}
                </Link>
              </td>
              <td className={td}>
                {SOURCE[r.source] ?? r.source}
                {r.context && <span className="block text-[12px] text-ink-muted">{r.context}</span>}
              </td>
              <td className={`${td} max-w-[420px] whitespace-pre-wrap`}>{r.text}</td>
              <td className={td}>
                {name ?? "—"}
                {email && <span className="block text-[12px] text-ink-muted">{email}</span>}
              </td>
              <td className={td}>
                <form action={toggleResolvedAction}>
                  <input type="hidden" name="id" value={r.id} />
                  <input type="hidden" name="resolved" value={r.resolved ? "0" : "1"} />
                  <button type="submit" className={btnGhost}>
                    {r.resolved ? "Yenidən aç" : "Baxıldı"}
                  </button>
                </form>
              </td>
            </tr>
          ))}
        </tbody>
      </Table>
    </>
  );
}
