import { desc } from "drizzle-orm";
import type { Metadata } from "next";
import Link from "next/link";
import { db } from "@/db";
import { contests } from "@/db/schema";
import { createContestAction } from "@/lib/contest/admin-actions";
import { registrationCount } from "@/lib/contest/data";
import { PageHead, Table, btn, btnGhost, fmtDate, input, td, th } from "../ui";
import { CONTEST_STATUS_LABEL } from "./labels";

export const metadata: Metadata = { title: "Yarış" };

export default async function AdminContests() {
  const rows = await db.select().from(contests).orderBy(desc(contests.startAt));
  const counts = await Promise.all(rows.map((c) => registrationCount(c.id)));
  return (
    <>
      <PageHead title="Riyaziyyat yarışı" lead="Yarış pulsuzdur və bütün istifadəçilər üçün eynidir. Onlayn tur → əyani final (ilk N nəfər) → mükafatlandırma. Bildirişlər yalnız e-poçtla." />
      <Table caption="Yarışlar">
        <thead className="bg-navy-050">
          <tr>
            {["Yarış", "Onlayn tur", "Qeydiyyat", "Status", ""].map((h) => (
              <th key={h} scope="col" className={th}>
                {h}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {rows.map((c, i) => (
            <tr key={c.id} className="border-t border-line">
              <td className={td}>
                <b>{c.title}</b>
                <span className="block font-mono text-[12px] text-ink-muted">/yaris/{c.slug}</span>
              </td>
              <td className={`${td} tabular`}>{fmtDate(c.startAt)}</td>
              <td className={`${td} tabular`}>{counts[i]}</td>
              <td className={td}>{CONTEST_STATUS_LABEL[c.status]}</td>
              <td className={td}>
                <Link href={`/admin/yaris/${c.id}`} className={btnGhost}>
                  İdarə et
                </Link>
              </td>
            </tr>
          ))}
        </tbody>
      </Table>

      <form action={createContestAction} className="grid gap-3 rounded-[16px] border border-line bg-white p-4">
        <h2 className="m-0 text-[17px] font-extrabold text-navy-900">Yeni yarış</h2>
        <div className="flex flex-wrap items-end gap-2">
          <label className="grid min-w-[240px] flex-1 gap-1 text-[13px] font-semibold">
            Ad
            <input name="title" required className={input} placeholder="2vur2 Riyaziyyat Yarışı" />
          </label>
          <label className="grid gap-1 text-[13px] font-semibold">
            Ünvan (slug)
            <input name="slug" required pattern="[a-z0-9-]{3,40}" className={`${input} font-mono`} placeholder="yaz-2027" />
          </label>
          <label className="grid gap-1 text-[13px] font-semibold">
            Qeydiyyat başlayır
            <input name="regStartAt" type="datetime-local" className={input} />
          </label>
          <label className="grid gap-1 text-[13px] font-semibold">
            Qeydiyyat bitir
            <input name="regEndAt" type="datetime-local" className={input} />
          </label>
          <label className="grid gap-1 text-[13px] font-semibold">
            Onlayn tur
            <input name="startAt" type="datetime-local" className={input} />
          </label>
        </div>
        <label className="flex items-center gap-2 text-[14px]">
          <input type="checkbox" name="templates" defaultChecked className="size-4" />
          20 hazır sual şablonunu əlavə et (sonra redaktə etmək olar)
        </label>
        <p className="m-0 text-[13px] text-ink-muted">Yarış qaralama kimi yaranır; parametrləri yoxlayıb statusu “Qeydiyyat” et.</p>
        <button className={`${btn} justify-self-start`}>Yarışı yarat</button>
      </form>
    </>
  );
}
