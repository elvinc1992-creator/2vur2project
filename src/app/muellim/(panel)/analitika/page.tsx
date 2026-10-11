import type { Metadata } from "next";
import Link from "next/link";
import { btnGhost, Card, field, Pill, td, th, tone, toneSoft, TopicRows, Top } from "@/components/teacher/ui";
import { answersOf, fullName, groupResults, groupsOf, groupWeakTopics, itemsOf, membersOf, questionStats } from "@/lib/teacher/data";
import { requireTeacher } from "@/lib/teacher/guard";

export const metadata: Metadata = { title: "Analitika" };

/** Qrup analitikası: zəif mövzular (saytın zəif mövzu sistemi), sınaq üzrə suallar, reytinq və dinamika; CSV ixracı. */
export default async function Analytics(props: PageProps<"/muellim/analitika">) {
  const me = await requireTeacher();
  const sp = await props.searchParams;
  const groups = await groupsOf(me.id);
  const g = groups.find((x) => x.id === sp.qrup) ?? groups[0];
  if (!g) {
    return (
      <>
        <Top title="Qrup analitikası" />
        <Card>
          <p className="m-0">
            Hələ qrup yoxdur. <Link href="/muellim/qruplar">Qrup yarat</Link>
          </p>
        </Card>
      </>
    );
  }
  const [results, members, weak] = await Promise.all([groupResults(me.id, g.id), membersOf(g.id), groupWeakTopics(g.members)]);
  const withResults = results.filter((r) => r.per.size);
  const current = withResults.find((r) => r.test.id === sp.sinaq) ?? withResults.at(-1);
  const stats = current ? questionStats(await itemsOf(current.test.id), await answersOf(current.test.id)) : [];
  const ranking = members
    .map((m) => {
      const xs = withResults.map((r) => r.per.get(m.id)).filter((x): x is number => x !== undefined);
      const avg = xs.length ? Math.round(xs.reduce((s, x) => s + x, 0) / xs.length) : null;
      const delta = xs.length >= 2 ? xs[xs.length - 1] - xs[xs.length - 2] : null;
      return { m, avg, delta };
    })
    .sort((a, b) => (b.avg ?? -1) - (a.avg ?? -1));

  return (
    <>
      <Top title="Qrup analitikası" lead={`${g.name} · son ${withResults.length} sınaq`}>
        <form className="flex flex-wrap gap-2">
          <label className="sr-only" htmlFor="qrup">
            Qrup
          </label>
          <select id="qrup" name="qrup" defaultValue={g.id} className={`${field} w-auto`}>
            {groups.map((x) => (
              <option key={x.id} value={x.id}>
                {x.name}
              </option>
            ))}
          </select>
          <button className={btnGhost}>Göstər</button>
          <a href={`/muellim/analitika/csv?qrup=${g.id}`} className={btnGhost}>
            ⬇️ CSV (Excel)
          </a>
        </form>
      </Top>
      <div className="grid grid-cols-1 gap-4 xl:grid-cols-2">
        <Card title="Zəif mövzular" sub="Qrupun orta mənimsəməsi, zəifdən güclüyə (saytın zəif mövzu təhlili)">
          <TopicRows rows={weak} />
        </Card>
        <Card title={current ? `Sınaq №${current.test.number}: suallar üzrə` : "Sınaq üzrə suallar"} sub="Düz cavab faizi; üzərinə gətir — ən çox seçilən səhv variant">
          {current ? (
            <>
              <ul className="m-0 grid list-none gap-2 p-0 [grid-template-columns:repeat(auto-fill,minmax(64px,1fr))]">
                {stats.map((s) => (
                  <li
                    key={s.n}
                    title={`${s.topicName}${s.wrong ? ` · ən çox səhv: ${s.wrong.letter} (${s.wrong.share}%)` : ""}`}
                    className="rounded-[12px] px-2 py-2 text-center font-extrabold"
                    style={{ background: toneSoft(s.pct), color: tone(s.pct) }}
                  >
                    {s.n}
                    <small className="block text-[10.5px] font-bold opacity-80">{s.pct !== null ? `${s.pct}%` : "—"}</small>
                  </li>
                ))}
              </ul>
              {withResults.length > 1 && (
                <nav aria-label="Sınaqlar" className="mt-3 flex flex-wrap gap-1.5 text-[13px]">
                  {withResults.map((r) => (
                    <Link
                      key={r.test.id}
                      href={`/muellim/analitika?qrup=${g.id}&sinaq=${r.test.id}`}
                      aria-current={r.test.id === current.test.id ? "page" : undefined}
                      className={`rounded-full border px-2.5 py-1 font-semibold no-underline ${r.test.id === current.test.id ? "border-[#0f1b3d] bg-[#0f1b3d] text-white" : "border-[#e6e9f2] text-[#0f1b3d]"}`}
                    >
                      №{r.test.number}
                    </Link>
                  ))}
                </nav>
              )}
            </>
          ) : (
            <p className="m-0 text-[14px] text-[#5b6785]">Nəticəsi olan sınaq yoxdur.</p>
          )}
        </Card>
      </div>
      <Card title="Qrup reytinqi" className="mt-4">
        <div className="overflow-x-auto" tabIndex={0} role="region" aria-label="Qrup reytinqi">
          <table className="w-full border-collapse">
            <thead>
              <tr>
                {["#", "Şagird", "Orta bal", "Dinamika"].map((h) => (
                  <th key={h} scope="col" className={th}>
                    {h}
                  </th>
                ))}
              </tr>
            </thead>
            <tbody>
              {ranking.map(({ m, avg, delta }, i) => (
                <tr key={m.id}>
                  <td className={`${td} font-bold`}>{avg !== null ? i + 1 : "—"}</td>
                  <td className={td}>{fullName(m)}</td>
                  <td className={`${td} font-bold`} style={{ color: tone(avg) }}>
                    {avg !== null ? `${avg}%` : "—"}
                  </td>
                  <td className={td}>{delta === null ? "—" : delta >= 0 ? <Pill kind="green">↑ {delta}%</Pill> : <Pill kind="red">↓ {Math.abs(delta)}%</Pill>}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </Card>
    </>
  );
}
