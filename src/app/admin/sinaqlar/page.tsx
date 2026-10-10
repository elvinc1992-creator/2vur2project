import type { Metadata } from "next";
import Link from "next/link";
import { createExamAction } from "@/lib/admin/actions";
import { listExams } from "@/lib/exams/source";
import { Notice, PageHead, Table, btn, btnGhost, input, td, th } from "../ui";

export const metadata: Metadata = { title: "Sınaqlar" };

const BLUEPRINTS = [
  ["buraxilis-9", "9-cu sinif buraxılış (25 sual: 15 qapalı, 6 açıq, 4 yazılı)"],
  ["buraxilis-11", "11-ci sinif buraxılış (25 sual: 13 qapalı, 5 açıq, 7 yazılı)"],
  ["qebul-11", "Blok / qəbul (22 qapalı, 4 açıq, 3 yazılı)"],
] as const;

export default async function AdminExams(props: PageProps<"/admin/sinaqlar">) {
  const sp = await props.searchParams;
  const exams = await listExams({ all: true });
  return (
    <>
      <PageHead
        title="Sınaqlar"
        lead="Sınaqlar sual bankından imtahan quruluşuna görə yaradılır: bölmələrin sayı və nömrələri (sual_tipleri_cedveli.txt), mövzular — imtahan tipinə aid olanlar (dim-movzular.md), bölgü — DİM tezliyinə mütənasib."
      />
      {sp.silindi && <Notice tone="ok">Sınaq silindi.</Notice>}
      <form action={createExamAction} className="flex flex-wrap items-end gap-2 rounded-[16px] border border-line bg-white p-4">
        <label className="grid flex-1 gap-1 text-[13px] font-semibold">
          İmtahan növü
          <select name="blueprint" className={input}>
            {BLUEPRINTS.map(([k, v]) => (
              <option key={k} value={k}>
                {v}
              </option>
            ))}
          </select>
        </label>
        <label className="grid gap-1 text-[13px] font-semibold">
          Status
          <select name="status" className={input} defaultValue="published">
            <option value="published">Dərhal dərc et</option>
            <option value="draft">Qaralama (yoxlamaq üçün)</option>
          </select>
        </label>
        <button className={btn}>+ Yeni sınaq yarat</button>
      </form>
      <Table caption="Sınaqlar">
        <thead className="bg-navy-050">
          <tr>
            {["Sınaq", "Növ", "Sual", "Qapalı / açıq / yazılı", "Müddət", "Status", ""].map((h) => (
              <th key={h} scope="col" className={th}>
                {h}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {exams.map((e) => (
            <tr key={e.id} className="border-t border-line">
              <td className={td}>
                <b>{e.title}</b>
                <span className="block font-mono text-[12px] text-ink-muted">{e.id}</span>
              </td>
              <td className={td}>{e.group}</td>
              <td className={`${td} tabular`}>{e.total}</td>
              <td className={`${td} tabular`}>
                {e.counts.closed} / {e.counts.coded} / {e.counts.written}
              </td>
              <td className={`${td} tabular`}>{e.durationMin} dəq</td>
              <td className={td}>
                <span className={e.status === "published" ? "font-semibold text-success-700" : "text-ink-muted"}>
                  {e.status === "published" ? "Dərc olunub" : "Qaralama"}
                </span>
              </td>
              <td className={td}>
                <Link href={`/admin/sinaqlar/${e.id}`} className={btnGhost}>
                  Bax / redaktə
                </Link>
              </td>
            </tr>
          ))}
        </tbody>
      </Table>
    </>
  );
}

