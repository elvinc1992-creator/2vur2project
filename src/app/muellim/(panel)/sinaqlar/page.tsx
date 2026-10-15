import type { Metadata } from "next";
import Link from "next/link";
import { btnGhost, btnMain, Card, fmtDay, Pill, td, th, Top } from "@/components/teacher/ui";
import { groupResults, groupsOf, testsOf } from "@/lib/teacher/data";
import type { TeacherKind } from "@/lib/teacher/create";
import { requireTeacher } from "@/lib/teacher/guard";

export const metadata: Metadata = { title: "Sınaqlar" };

/** İmtahan növü üzrə tablar (sıra: 9, 11, blok, mövzu). */
const KINDS: { key: TeacherKind; label: string }[] = [
  { key: "buraxilis-9", label: "9-cu sinif" },
  { key: "buraxilis-11", label: "11-ci sinif" },
  { key: "qebul-11", label: "Blok" },
  { key: "movzu", label: "Mövzu" },
];

/** Bütün sınaqlar: çap faylları, nəticələr; "netice" — yalnız nəticəsi yazılmamış kağız sınaqları; "tip" — imtahan növü. */
export default async function TeacherTests(props: PageProps<"/muellim/sinaqlar">) {
  const me = await requireTeacher();
  const sp = await props.searchParams;
  const onlyPending = sp.netice === "1";
  const kind = KINDS.find((k) => k.key === sp.tip)?.key;
  const [tests, groups] = await Promise.all([testsOf(me.id), groupsOf(me.id)]);
  const results = (await Promise.all(groups.map((g) => groupResults(me.id, g.id)))).flat();
  const avgOf = new Map(results.map((r) => [r.test.id, r.avg]));
  const base = onlyPending ? tests.filter(({ t }) => t.mode === "paper" && !t.resultsAt) : tests;
  const list = kind ? base.filter(({ t }) => t.examKind === kind) : base;
  const href = (tip?: string) => {
    const p = new URLSearchParams();
    if (onlyPending) p.set("netice", "1");
    if (tip) p.set("tip", tip);
    const s = p.toString();
    return s ? `/muellim/sinaqlar?${s}` : "/muellim/sinaqlar";
  };
  const tab = (key: string | undefined, label: string) => (
    <Link
      key={key ?? "all"}
      href={href(key)}
      aria-current={kind === key ? "page" : undefined}
      className={`rounded-full border px-3 py-1.5 text-[13px] font-semibold no-underline ${kind === key ? "border-[#0f1b3d] bg-[#0f1b3d] text-white" : "border-[#e6e9f2] bg-white text-[#0f1b3d]"}`}
    >
      {label} <span className="tabular-nums opacity-75">{key ? base.filter(({ t }) => t.examKind === key).length : base.length}</span>
    </Link>
  );
  const labelOf = (k: string) => KINDS.find((x) => x.key === k)?.label ?? k;

  return (
    <>
      <Top title={onlyPending ? "Kağız nəticələri" : "Sınaqlar və çap"} lead={onlyPending ? "Cavab kartlarından nəticələri yazılmamış kağız sınaqları" : "Kitabçalar, cavab kartları və açar; nəticələr və analitika"}>
        <Link href="/muellim/sinaq-yarat" className={btnMain}>
          + Yeni sınaq
        </Link>
      </Top>
      <nav aria-label="İmtahan növü" className="flex flex-wrap gap-2">
        {tab(undefined, "Hamısı")}
        {KINDS.map((k) => tab(k.key, k.label))}
      </nav>
      <Card>
        {list.length === 0 ? (
          <p className="m-0 text-[14px] text-[#5b6785]">
            {kind ? "Bu növdə sınaq yoxdur." : onlyPending ? "Nəticə gözləyən kağız sınağı yoxdur. 👏" : "Hələ sınaq yoxdur."}
          </p>
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
                      <span className="block text-[12px] text-[#5b6785]">{labelOf(t.examKind)}</span>
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
