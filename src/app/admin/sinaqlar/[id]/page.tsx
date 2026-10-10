import { eq } from "drizzle-orm";
import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { MathText } from "@/components/ui/math-text";
import { db } from "@/db";
import { exams } from "@/db/schema";
import { deleteExamAction, replaceExamItemAction, updateExamAction } from "@/lib/admin/actions";
import { getExamKeys, getExamQuestions } from "@/lib/exams/source";
import { Notice, PageHead, Table, btn, btnDanger, btnGhost, input, td, th } from "../../ui";

export const metadata: Metadata = { title: "Sınaq" };

const FORMAT: Record<string, string> = { closed: "Qapalı", coded: "Açıq (kod)", written: "Yazılı" };

export default async function AdminExam(props: PageProps<"/admin/sinaqlar/[id]">) {
  const { id } = await props.params;
  const sp = await props.searchParams;
  const [[exam], questions, keys] = await Promise.all([db.select().from(exams).where(eq(exams.id, id)), getExamQuestions(id), getExamKeys(id)]);
  if (!exam) notFound();
  const byTopic = new Map<string, number>();
  for (const q of questions) byTopic.set(q.topicName, (byTopic.get(q.topicName) ?? 0) + 1);

  return (
    <>
      <PageHead title={exam.title} lead={`${questions.length} sual · ${exam.durationMin} dəqiqə · ${exam.status === "published" ? "dərc olunub" : "qaralama"}`}>
        <div className="flex flex-wrap gap-2">
          <Link href="/admin/sinaqlar" className={btnGhost}>
            ← Sınaqlar
          </Link>
          <form action={deleteExamAction}>
            <input type="hidden" name="id" value={exam.id} />
            <button className={btnDanger}>Sınağı sil</button>
          </form>
        </div>
      </PageHead>
      {sp.yaradildi && <Notice tone="ok">Sınaq yaradıldı.</Notice>}
      {sp.saxlanildi && <Notice tone="ok">Yadda saxlanıldı.</Notice>}
      {sp.xeta === "kod" && <Notice tone="error">Bu kodla sual tapılmadı.</Notice>}

      <form action={updateExamAction} className="flex flex-wrap items-end gap-2 rounded-[16px] border border-line bg-white p-4">
        <input type="hidden" name="id" value={exam.id} />
        <label className="grid min-w-[260px] flex-1 gap-1 text-[13px] font-semibold">
          Ad
          <input name="title" defaultValue={exam.title} className={input} />
        </label>
        <label className="grid gap-1 text-[13px] font-semibold">
          Müddət (dəq)
          <input name="durationMin" type="number" min={10} max={300} defaultValue={exam.durationMin} className={`${input} w-28`} />
        </label>
        <label className="grid gap-1 text-[13px] font-semibold">
          Status
          <select name="status" defaultValue={exam.status} className={input}>
            <option value="published">Dərc olunub</option>
            <option value="draft">Qaralama</option>
          </select>
        </label>
        <button className={btn}>Saxla</button>
      </form>

      <section aria-labelledby="dist" className="grid gap-2 rounded-[16px] border border-line bg-white p-4">
        <h2 id="dist" className="m-0 text-[17px] font-extrabold text-navy-900">
          Mövzular üzrə bölgü
        </h2>
        <ul className="m-0 flex list-none flex-wrap gap-1.5 p-0">
          {[...byTopic].map(([name, n]) => (
            <li key={name} className="rounded-pill bg-navy-050 px-2.5 py-1 text-[13px]">
              {name}: <b>{n}</b>
            </li>
          ))}
        </ul>
      </section>

      <Table caption="Sınağın sualları">
        <thead className="bg-navy-050">
          <tr>
            {["№", "Format", "Mövzu", "Sual", "Cavab", "Əvəz et"].map((h) => (
              <th key={h} scope="col" className={th}>
                {h}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {questions.map((q) => (
            <tr key={q.n} className="border-t border-line">
              <td className={`${td} font-bold tabular`}>{q.n}</td>
              <td className={td}>{FORMAT[q.format]}</td>
              <td className={td}>
                {q.topicName}
                <span className="block text-[12px] text-ink-muted">{q.type}</span>
              </td>
              <td className={`${td} max-w-[420px]`}>
                <Link href={`/admin/suallar/${q.code}`} className="font-mono text-[12px] font-bold">
                  {q.code}
                </Link>
                <span className="line-clamp-3">
                  <MathText text={q.text} />
                </span>
              </td>
              <td className={td}>{keys.get(q.n)?.answer ? <MathText text={keys.get(q.n)!.answer} /> : "—"}</td>
              <td className={td}>
                <form action={replaceExamItemAction} className="flex gap-1.5">
                  <input type="hidden" name="id" value={exam.id} />
                  <input type="hidden" name="n" value={q.n} />
                  <input name="code" placeholder="Kod" aria-label={`№${q.n}: yeni sualın kodu`} className={`${input} w-28 font-mono`} />
                  <button className={btnGhost}>Əvəz et</button>
                </form>
              </td>
            </tr>
          ))}
        </tbody>
      </Table>
    </>
  );
}
