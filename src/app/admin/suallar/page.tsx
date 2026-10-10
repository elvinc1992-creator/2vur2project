import { and, asc, count, eq, like, or } from "drizzle-orm";
import type { Metadata } from "next";
import Link from "next/link";
import { MathText } from "@/components/ui/math-text";
import { db } from "@/db";
import { bankTasks, examItems, subtopics, topics } from "@/db/schema";
import { topicOptions } from "@/lib/admin/queries";
import { Notice, PageHead, Table, btn, btnGhost, input, td, th } from "../ui";

export const metadata: Metadata = { title: "Suallar" };

const FORMATS: Record<string, string> = { closed: "Qapalı", open: "Açıq", matching: "Uyğunluq", written: "Yazılı" };
const SIZE = 40;

export default async function AdminQuestions(props: PageProps<"/admin/suallar">) {
  const sp = await props.searchParams;
  const str = (k: string) => (typeof sp[k] === "string" ? (sp[k] as string).trim() : "");
  const q = str("q");
  const topic = str("movzu");
  const format = str("format");
  const page = Math.max(1, Number(str("s")) || 1);
  const topicList = await topicOptions();
  const topicId = topicList.find((t) => t.slug === topic)?.id;

  const where = and(
    topicId ? eq(bankTasks.topicId, topicId) : undefined,
    format && FORMATS[format] ? eq(bankTasks.format, format as "closed") : undefined,
    q ? or(like(bankTasks.code, `%${q.toUpperCase()}%`), like(bankTasks.body, `%${q}%`)) : undefined,
  );
  const [rows, [total], used] = await Promise.all([
    db
      .select({ t: bankTasks, topic: topics.name, subtopic: subtopics.title })
      .from(bankTasks)
      .innerJoin(topics, eq(topics.id, bankTasks.topicId))
      .leftJoin(subtopics, eq(subtopics.id, bankTasks.subtopicId))
      .where(where)
      .orderBy(asc(topics.curriculumOrder), asc(bankTasks.sortOrder))
      .limit(SIZE)
      .offset((page - 1) * SIZE),
    db.select({ n: count() }).from(bankTasks).where(where),
    db.select({ code: examItems.taskCode, n: count() }).from(examItems).groupBy(examItems.taskCode),
  ]);
  const usedIn = new Map(used.map((u) => [u.code, u.n]));
  const pages = Math.max(1, Math.ceil(total.n / SIZE));
  const link = (s: number) =>
    `/admin/suallar?${new URLSearchParams({ ...(q ? { q } : {}), ...(topic ? { movzu: topic } : {}), ...(format ? { format } : {}), s: String(s) })}`;

  return (
    <>
      <PageHead title="Suallar" lead={`Sual bankı: ${total.n} sual (süzgəcə görə). Mətn və düsturlar LaTeX ilə ($...$) yazılır.`}>
        <Link href="/admin/suallar/yeni" className={btn}>
          + Yeni sual
        </Link>
      </PageHead>
      {sp.silindi && <Notice tone="ok">Sual silindi.</Notice>}
      <form className="flex flex-wrap gap-2" role="search">
        <label className="sr-only" htmlFor="q">
          Axtarış
        </label>
        <input id="q" name="q" defaultValue={q} placeholder="Kod və ya mətn" className={`${input} min-w-[220px] flex-1`} />
        <select name="movzu" defaultValue={topic} aria-label="Mövzu" className={input}>
          <option value="">Bütün mövzular</option>
          {topicList.map((t) => (
            <option key={t.slug} value={t.slug}>
              {t.name}
            </option>
          ))}
        </select>
        <select name="format" defaultValue={format} aria-label="Format" className={input}>
          <option value="">Bütün formatlar</option>
          {Object.entries(FORMATS).map(([k, v]) => (
            <option key={k} value={k}>
              {v}
            </option>
          ))}
        </select>
        <button className={btn}>Süz</button>
      </form>
      <Table caption="Suallar">
        <thead className="bg-navy-050">
          <tr>
            {["Kod", "Mövzu", "Format", "Sual", "Cavab", "Sınaqda", ""].map((h) => (
              <th key={h} scope="col" className={th}>
                {h}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {rows.map(({ t, topic: topicName, subtopic }) => (
            <tr key={t.code} className="border-t border-line">
              <td className={`${td} font-mono font-bold whitespace-nowrap`}>{t.code}</td>
              <td className={td}>
                {topicName}
                {subtopic && <span className="block text-[12px] text-ink-muted">{subtopic}</span>}
              </td>
              <td className={td}>{FORMATS[t.format]}</td>
              <td className={`${td} max-w-[420px]`}>
                <span className="line-clamp-3">
                  <MathText text={t.body} />
                </span>
                {t.imageUrl && <span className="block text-[12px] text-ink-muted">🖼 şəkil</span>}
              </td>
              <td className={td}>{t.correctOption ?? (t.answerValue ? <MathText text={t.answerValue} /> : "—")}</td>
              <td className={`${td} tabular`}>{usedIn.get(t.code) ?? 0}</td>
              <td className={td}>
                <Link href={`/admin/suallar/${t.code}`} className={btnGhost}>
                  Redaktə
                </Link>
              </td>
            </tr>
          ))}
        </tbody>
      </Table>
      {pages > 1 && (
        <nav aria-label="Səhifələr" className="flex flex-wrap items-center gap-2">
          {page > 1 && (
            <Link href={link(page - 1)} className={btnGhost}>
              ← Əvvəlki
            </Link>
          )}
          <span className="text-small text-ink-muted">
            {page} / {pages}
          </span>
          {page < pages && (
            <Link href={link(page + 1)} className={btnGhost}>
              Növbəti →
            </Link>
          )}
        </nav>
      )}
    </>
  );
}
