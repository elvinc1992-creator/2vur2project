import type { Metadata } from "next";
import Link from "next/link";
import { btnGhost, btnMain, Card, fmtDay, Kpi, Pill, td, th, TopicRows, Top } from "@/components/teacher/ui";
import { groupResults, groupsOf, groupWeakTopics, testsOf } from "@/lib/teacher/data";
import { requireTeacher } from "@/lib/teacher/guard";

export const metadata: Metadata = { title: "Müəllim paneli" };

export default async function TeacherHome() {
  const me = await requireTeacher();
  const [groups, tests] = await Promise.all([groupsOf(me.id), testsOf(me.id)]);
  const students = new Set(groups.flatMap((g) => g.members));
  const [weak, results] = await Promise.all([groupWeakTopics([...students]), Promise.all(groups.map((g) => groupResults(me.id, g.id)))]);
  const avgOf = new Map(results.flat().map((r) => [r.test.id, r.avg]));
  const recent = tests.slice(0, 6);

  return (
    <>
      <Top title={`Salam, ${me.name} müəllim 👋`} lead="Qruplarının vəziyyəti">
        <Link href="/muellim/sinaq-yarat" className={btnMain}>
          + Yeni sınaq
        </Link>
      </Top>
      <div className="grid grid-cols-1 gap-3.5 sm:grid-cols-2 xl:grid-cols-4">
        <Kpi icon="👥" value={groups.length} label="qrup" bg="#eef0ff" />
        <Kpi icon="🎓" value={students.size} label="şagird" bg="#ecfdf5" />
        <Kpi icon="📝" value={tests.length} label="sınaq keçirilib" bg="#fffbeb" />
        <Kpi icon="⚠️" value={weak[0]?.topic ?? "—"} label="ən zəif mövzu" bg="#fef2f2" />
      </div>
      <div className="mt-4 grid grid-cols-1 gap-4 xl:grid-cols-2">
        <Card title="Son sınaqlar" sub="Nəticələri yazılmayan kağız sınaqlarını unutma">
          {recent.length === 0 ? (
            <p className="m-0 text-[14px] text-[#5b6785]">
              Hələ sınaq yoxdur.{" "}
              <Link href={groups.length ? "/muellim/sinaq-yarat" : "/muellim/qruplar"} className="font-bold text-[#4f46e5]">
                {groups.length ? "İlk sınağı yarat" : "Əvvəl qrup yarat"}
              </Link>
            </p>
          ) : (
            <div className="overflow-x-auto" tabIndex={0} role="region" aria-label="Son sınaqlar">
              <table className="w-full border-collapse">
                <thead>
                  <tr>
                    {["Sınaq", "Qrup", "Növ", "Orta"].map((h) => (
                      <th key={h} scope="col" className={th}>
                        {h}
                      </th>
                    ))}
                  </tr>
                </thead>
                <tbody>
                  {recent.map(({ t, group }) => {
                    const avg = avgOf.get(t.id);
                    const needsResults = t.mode === "paper" && !t.resultsAt;
                    return (
                      <tr key={t.id}>
                        <td className={td}>
                          <Link href={`/muellim/sinaqlar/${t.id}`} className="font-bold text-[#0f1b3d]">
                            Sınaq №{t.number}
                          </Link>
                          <small className="block text-[#5b6785]">{fmtDay(t.opensAt)}</small>
                        </td>
                        <td className={td}>{group}</td>
                        <td className={td}>{t.mode === "online" ? <Pill kind="indigo">Onlayn</Pill> : <Pill kind="amber">Kağız</Pill>}</td>
                        <td className={td}>
                          {needsResults ? (
                            <Link href={`/muellim/sinaqlar/${t.id}/netice`} className={`${btnGhost} min-h-9! px-2.5!`}>
                              Nəticə yaz
                            </Link>
                          ) : (
                            <b>{avg !== null && avg !== undefined ? `${avg}%` : "—"}</b>
                          )}
                        </td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            </div>
          )}
        </Card>
        <Card title="Diqqət tələb edir" sub="Qruplar üzrə ən zəif mövzular">
          <TopicRows rows={weak.slice(0, 4)} />
        </Card>
      </div>
    </>
  );
}
