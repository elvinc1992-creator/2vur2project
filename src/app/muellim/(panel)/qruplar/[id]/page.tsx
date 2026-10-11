import { and, asc, eq, inArray } from "drizzle-orm";
import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { Bar, btnGhost, Card, Notice, Pill, td, th, Top, TLink } from "@/components/teacher/ui";
import { db } from "@/db";
import { topics, userTopicStats } from "@/db/schema";
import { env } from "@/lib/env";
import { regenerateCodeAction, removeMemberAction } from "@/lib/teacher/actions";
import { fullName, groupResults, kindName, membersOf, ownGroup } from "@/lib/teacher/data";
import { requireTeacher } from "@/lib/teacher/guard";

export const metadata: Metadata = { title: "Qrup" };

export default async function TeacherGroup(props: PageProps<"/muellim/qruplar/[id]">) {
  const me = await requireTeacher();
  const { id } = await props.params;
  const sp = await props.searchParams;
  const g = await ownGroup(me.id, id);
  if (!g) notFound();
  const [members, results, kind] = await Promise.all([membersOf(g.id), groupResults(me.id, g.id), kindName(g.examKind)]);
  const ids = members.map((m) => m.id);
  const weakRows = ids.length
    ? await db
        .select({ userId: userTopicStats.userId, topic: topics.name, mastery: userTopicStats.mastery })
        .from(userTopicStats)
        .innerJoin(topics, eq(topics.id, userTopicStats.topicId))
        .where(and(inArray(userTopicStats.userId, ids)))
        .orderBy(asc(userTopicStats.mastery))
    : [];
  const joinUrl = `${env.APP_URL}/qruplarim?kod=${g.code}`;

  return (
    <>
      <Top title={g.name} lead={`${kind} · ${members.length} şagird`}>
        <TLink href="/muellim/qruplar">← Qruplarım</TLink>
      </Top>
      {sp.yaradildi && <Notice tone="ok">Qrup yaradıldı. Kodu və ya linki şagirdlərə göndər.</Notice>}
      {sp.kod && <Notice tone="ok">Qrup kodu yeniləndi — köhnə kodla artıq qoşulmaq olmur.</Notice>}
      {sp.cixarildi && <Notice tone="ok">Şagird qrupdan çıxarıldı — yeni sınaqlara düşməyəcək.</Notice>}

      <Card title="Qoşulma" sub="Şagird saytda hesabı ilə daxil olub kodu yazır və ya linki açır.">
        <div className="flex flex-wrap items-center gap-3">
          <span className="rounded-[10px] bg-[#f4f6fb] px-3 py-2 font-mono text-[22px] font-bold" aria-label={`Qrup kodu: ${g.code}`}>
            {g.code}
          </span>
          <code className="min-w-0 rounded-[10px] bg-[#f8fafc] px-3 py-2 text-[13px] break-all">{joinUrl}</code>
          <form action={regenerateCodeAction}>
            <input type="hidden" name="groupId" value={g.id} />
            <button className={btnGhost}>Kodu yenilə</button>
          </form>
        </div>
      </Card>

      <Card title="Şagirdlər" className="mt-4">
        {members.length === 0 ? (
          <p className="m-0 text-[14px] text-[#5b6785]">Hələ şagird yoxdur — kodu paylaş.</p>
        ) : (
          <div className="overflow-x-auto" tabIndex={0} role="region" aria-label="Şagirdlər">
            <table className="w-full border-collapse">
              <thead>
                <tr>
                  {["Şagird", "Son nəticə", "Proqres", "Zəif mövzu", ""].map((h) => (
                    <th key={h} scope="col" className={th}>
                      {h}
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {members.map((m) => {
                  const mine = results.map((r) => r.per.get(m.id)).filter((x): x is number => x !== undefined);
                  const last = mine.at(-1) ?? null;
                  const avg = mine.length ? Math.round(mine.reduce((s, x) => s + x, 0) / mine.length) : null;
                  const weak = weakRows.find((w) => w.userId === m.id && w.mastery < 0.7);
                  return (
                    <tr key={m.id}>
                      <td className={td}>
                        <b>{fullName(m)}</b>
                      </td>
                      <td className={`${td} tabular-nums`}>{last !== null ? `${last}%` : "—"}</td>
                      <td className={td}>
                        <span className="sr-only">Orta: {avg ?? "—"}%</span>
                        <Bar value={avg} />
                      </td>
                      <td className={td}>{weak ? <Pill kind={weak.mastery < 0.5 ? "red" : "amber"}>{weak.topic}</Pill> : "—"}</td>
                      <td className={td}>
                        <form action={removeMemberAction}>
                          <input type="hidden" name="groupId" value={g.id} />
                          <input type="hidden" name="userId" value={m.id} />
                          <button className="cursor-pointer text-[13px] font-semibold text-[#b91c1c] hover:underline" aria-label={`${fullName(m)}: qrupdan çıxar`}>
                            Çıxar
                          </button>
                        </form>
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        )}
      </Card>
    </>
  );
}
