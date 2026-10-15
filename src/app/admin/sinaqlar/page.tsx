import type { Metadata } from "next";
import Link from "next/link";
import { setExamStatusAction } from "@/lib/admin/actions";
import { listExamKinds, listExams } from "@/lib/exams/source";
import { priceText } from "@/lib/exams/types";
import { cn } from "@/lib/cn";
import { Notice, PageHead, Table, btn, btnGhost, fmtDate, input, td, th } from "../ui";
import { STATUS_LABEL, STATUS_TONE } from "./data";

export const metadata: Metadata = { title: "Sınaqlar" };


export default async function AdminExams(props: PageProps<"/admin/sinaqlar">) {
  const sp = await props.searchParams;
  const [all, kinds] = await Promise.all([listExams({ all: true }), listExamKinds()]);
  const kind = kinds.find((k) => k.key === sp.tip)?.key;
  // Tip sırası ilə (exam_kinds.sort_order), tip daxilində nömrə ilə (№1, №2…)
  const kindRank = (k: string) => kinds.findIndex((x) => x.key === k);
  const exams = (kind ? all.filter((e) => e.kind === kind) : [...all]).sort((a, b) => kindRank(a.kind) - kindRank(b.kind) || a.number - b.number);
  const tab = (key: string | undefined, label: string, n: number) => (
    <Link
      key={key ?? "all"}
      href={key ? `/admin/sinaqlar?tip=${key}` : "/admin/sinaqlar"}
      aria-current={kind === key ? "page" : undefined}
      className={cn(
        "rounded-pill border px-3 py-1.5 text-[13px] font-semibold no-underline",
        kind === key ? "border-navy-900 bg-navy-900 text-white" : "border-line bg-white text-navy-900",
      )}
    >
      {label} <span className="tabular opacity-75">{n}</span>
    </Link>
  );

  return (
    <>
      <PageHead
        title="Sınaqlar"
        lead="Sınaqlar sual bankından yaradılır: buraxılış və blok — imtahan quruluşuna görə, mövzu sınağı — seçilmiş mövzudan. Saytda yalnız aktiv sınaqlar görünür; bitmiş sınağı yalnız iştirak edənlər görür."
      >
        <Link href="/admin/sinaqlar/yeni" className={btn}>
          + Yeni sınaq
        </Link>
      </PageHead>
      {sp.silindi && <Notice tone="ok">Sınaq silindi.</Notice>}
      {sp.status && <Notice tone="ok">Status dəyişdirildi.</Notice>}
      <nav aria-label="Sınağın tipi" className="flex flex-wrap gap-2">
        {tab(undefined, "Hamısı", all.length)}
        {kinds.map((k) => tab(k.key, `${k.name} · ${priceText(k.price)}`, all.filter((e) => e.kind === k.key).length))}
      </nav>
      <Table caption="Sınaqlar">
        <thead className="bg-navy-050">
          <tr>
            {["Sınaq", "Tip", "Sual", "Qapalı / açıq / yazılı", "Müddət", "Yaradılıb", "Status", ""].map((h) => (
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
              <td className={td}>
                {e.group}
                {e.topicName && <span className="block text-[12px] text-ink-muted">{e.topicName}</span>}
              </td>
              <td className={`${td} tabular`}>{e.total}</td>
              <td className={`${td} tabular`}>
                {e.counts.closed} / {e.counts.coded} / {e.counts.written}
              </td>
              <td className={`${td} tabular`}>{e.durationMin} dəq</td>
              <td className={`${td} tabular`}>{fmtDate(e.createdAt)}</td>
              <td className={td}>
                <form action={setExamStatusAction} className="flex items-center gap-1.5">
                  <input type="hidden" name="id" value={e.id} />
                  <span className={cn("rounded-pill px-2 py-0.5 text-[12px] font-bold", STATUS_TONE[e.status])}>{STATUS_LABEL[e.status]}</span>
                  <select name="status" defaultValue={e.status} aria-label={`${e.title}: status`} className={`${input} min-h-9 text-[13px]`}>
                    {(Object.keys(STATUS_LABEL) as Array<keyof typeof STATUS_LABEL>).map((s) => (
                      <option key={s} value={s}>
                        {STATUS_LABEL[s]}
                      </option>
                    ))}
                  </select>
                  <button className={btnGhost}>Saxla</button>
                </form>
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
