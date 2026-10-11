import type { Metadata } from "next";
import Link from "next/link";
import { btnGhost, btnMain, Card, fmtDay, Pill, td, th, Top } from "@/components/teacher/ui";
import { groupResults, groupsOf, testsOf } from "@/lib/teacher/data";
import { requireTeacher } from "@/lib/teacher/guard";

export const metadata: Metadata = { title: "Sınaqlar" };

/** Bütün sınaqlar: çap faylları, nəticələr; "netice" — yalnız nəticəsi yazılmamış kağız sınaqları. */
export default async function TeacherTests(props: PageProps<"/muellim/sinaqlar">) {
  const me = await requireTeacher();
  const sp = await props.searchParams;
  const onlyPending = sp.netice === "1";
  const [tests, groups] = await Promise.all([testsOf(me.id), groupsOf(me.id)]);
  const results = (await Promise.all(groups.map((g) => groupResults(me.id, g.id)))).flat();
  const avgOf = new Map(results.map((r) => [r.test.id, r.avg]));
  const list = onlyPending ? tests.filter(({ t }) => t.mode === "paper" && !t.resultsAt) : tests;

  return (
    <>
      <Top title={onlyPending ? "Kağız nəticələri" : "Sınaqlar və çap"} lead={onlyPending ? "Cavab kartlarından nəticələri yazılmamış kağız sınaqları" : "Kitabçalar, cavab kartları və açar; nəticələr və analitika"}>
        <Link href="/muellim/sinaq-yarat" className={btnMain}>
          + Yeni sınaq
        </Link>
      </Top>
      <Card>
        {list.length === 0 ? (
          <p className="m-0 text-[14px] text-[#5b6785]">{onlyPending ? "Nəticə gözləyən kağız sınağı yoxdur. 👏" : "Hələ sınaq yoxdur."}</p>
        ) : (
          <div className="overflow-x-auto" tabIndex={0} role="region" aria-label="Sınaqlar">
            <table className="w-full border-collapse">
              <thead>
                <tr>
                  {["Sınaq", "Qrup", "Növ", "Tarix", "Orta", ""].map((h) => (
                    <th key={h} scope="col" className={th}>
                      {h}
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {list.map(({ t, group }) => (
                  <tr key={t.id}>
                    <td className={td}>
                      <Link href={`/muellim/sinaqlar/${t.id}`} className="font-bold text-[#0f1b3d]">
                        Sınaq №{t.number}
                      </Link>
                    </td>
                    <td className={td}>{group}</td>
                    <td className={td}>{t.mode === "online" ? <Pill kind="indigo">Onlayn</Pill> : <Pill kind="amber">Kağız</Pill>}</td>
                    <td className={td}>{fmtDay(t.opensAt)}</td>
                    <td className={`${td} font-bold tabular-nums`}>{avgOf.get(t.id) != null ? `${avgOf.get(t.id)}%` : "—"}</td>
                    <td className={td}>
                      {t.mode === "paper" && !t.resultsAt ? (
                        <Link href={`/muellim/sinaqlar/${t.id}/netice`} className={`${btnGhost} min-h-9! px-2.5!`}>
                          Nəticə yaz
                        </Link>
                      ) : (
                        <Link href={`/muellim/sinaqlar/${t.id}`} className={`${btnGhost} min-h-9! px-2.5!`}>
                          Bax
                        </Link>
                      )}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </Card>
    </>
  );
}
