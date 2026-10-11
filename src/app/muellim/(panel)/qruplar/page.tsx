import type { Metadata } from "next";
import Link from "next/link";
import { btnMain, Card, field, label, Top } from "@/components/teacher/ui";
import { createGroupAction } from "@/lib/teacher/actions";
import { groupResults, groupsOf } from "@/lib/teacher/data";
import { requireTeacher } from "@/lib/teacher/guard";

export const metadata: Metadata = { title: "Qruplarım" };

export default async function TeacherGroups() {
  const me = await requireTeacher();
  const groups = await groupsOf(me.id);
  const extra = await Promise.all(
    groups.map(async (g) => {
      const res = await groupResults(me.id, g.id);
      const avgs = res.map((r) => r.avg).filter((x): x is number => x !== null);
      return { tests: res.length, avg: avgs.length ? Math.round(avgs.reduce((s, x) => s + x, 0) / avgs.length) : null };
    }),
  );

  return (
    <>
      <Top title="Qruplarım" lead="Şagirdlər qrup kodu ilə özləri qoşulur — məlumatları əl ilə daxil etmirsən." />
      {groups.length > 0 && (
        <ul className="m-0 grid list-none gap-3.5 p-0 [grid-template-columns:repeat(auto-fill,minmax(270px,1fr))]">
          {groups.map((g, i) => (
            <li key={g.id}>
              <Link
                href={`/muellim/qruplar/${g.id}`}
                className="block rounded-[18px] border border-[#e6e9f2] bg-white p-[18px] text-[#0f1b3d] no-underline transition-transform hover:-translate-y-0.5 hover:shadow-[0_14px_30px_-18px_rgba(15,27,61,.35)]"
              >
                <div className="flex items-start justify-between gap-2">
                  <b className="text-[16px]">{g.name}</b>
                  <span className="rounded-[8px] bg-[#f4f6fb] px-2 py-1 font-mono text-[13px]">{g.code}</span>
                </div>
                <small className="text-[#5b6785]">{extra[i].tests} sınaq</small>
                <div className="mt-2.5 flex gap-3.5 text-[13px] text-[#5b6785]">
                  <span>👥 {g.members.length} şagird</span>
                  <span>📈 orta {extra[i].avg !== null ? `${extra[i].avg}%` : "—"}</span>
                </div>
              </Link>
            </li>
          ))}
        </ul>
      )}
      <Card title="+ Yeni qrup" sub="İmtahan növü sınaq yaradılanda seçilir — bir sınağı bir neçə qrupa vermək olar." className="mt-4">
        <form action={createGroupAction} className="grid gap-3 sm:grid-cols-[1fr_auto] sm:items-end">
          <label className={label}>
            Qrupun adı
            <input name="name" required minLength={2} maxLength={60} placeholder="Məs. XI sinif – səhər" className={field} />
          </label>
          <button className={btnMain}>Qrup yarat</button>
        </form>
      </Card>
    </>
  );
}
