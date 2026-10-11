import { desc, eq } from "drizzle-orm";
import type { Metadata } from "next";
import { azn, brand, btnMain, Card, fmtDayLong, Notice, Pill, td, th, Top } from "@/components/teacher/ui";
import { db } from "@/db";
import { teacherBalanceTx } from "@/db/schema";
import { topupAction } from "@/lib/teacher/actions";
import { requireTeacher } from "@/lib/teacher/guard";

export const metadata: Metadata = { title: "Balans" };

const KIND: Record<string, { label: string; kind: "green" | "amber" | "red" | "indigo" }> = {
  topup: { label: "Artırma", kind: "green" },
  charge: { label: "Onlayn sınaq", kind: "amber" },
  refund: { label: "Geri qaytarma", kind: "indigo" },
  bonus: { label: "Bonus (admin)", kind: "green" },
  adjust: { label: "Düzəliş (admin)", kind: "red" },
};

/** Balans: onlayn sınaq üçün (1 AZN / şagird). Ödəniş saytın mövcud (test rejimində) ödəniş sistemi ilə. */
export default async function Balance(props: PageProps<"/muellim/balans">) {
  const me = await requireTeacher("/muellim/balans");
  const sp = await props.searchParams;
  const tx = await db.select().from(teacherBalanceTx).where(eq(teacherBalanceTx.teacherId, me.id)).orderBy(desc(teacherBalanceTx.createdAt)).limit(100);
  return (
    <>
      <Top title="Balans" lead="Onlayn sınaq: 1 ₼ / şagird. Kağız sınaq pulsuzdur." />
      {sp.ok && <Notice tone="ok">Balans artırıldı.</Notice>}
      {sp.xeta && <Notice tone="error">Məbləği seç və şərtlərlə razılığı təsdiqlə.</Notice>}
      <div className="grid gap-4 xl:grid-cols-[1fr_1.4fr]">
        <div className={`${brand} rounded-[20px] p-5 text-white`}>
          <small className="text-white/85">Cari balans</small>
          <b className="block text-[40px] font-black">{azn(me.balance)}</b>
          <form action={topupAction} className="mt-3 grid gap-3 rounded-[14px] bg-white p-4 text-[#0f1b3d]">
            <fieldset className="m-0 flex flex-wrap gap-2 border-0 p-0">
              <legend className="mb-2 text-[13px] font-bold text-[#5b6785]">Məbləğ</legend>
              {[10, 20, 50, 100].map((a, i) => (
                <label key={a} className="cursor-pointer rounded-[12px] border-2 border-[#e6e9f2] px-4 py-2 font-black has-checked:border-[#8b5cf6] has-checked:bg-[#f5f3ff]">
                  <input type="radio" name="amount" value={a} defaultChecked={i === 1} className="sr-only" />
                  {a} ₼
                </label>
              ))}
            </fieldset>
            <label className="flex items-start gap-2 text-[13.5px]">
              <input type="checkbox" name="consent" required className="mt-0.5 size-[18px] accent-[#8b5cf6]" />
              Ödəniş şərtləri ilə razıyam (test rejimi — kart məlumatı alınmır)
            </label>
            <button className={`${btnMain} justify-self-start`}>Ödə və balansı artır</button>
          </form>
        </div>
        <Card title="Balans tarixçəsi" sub="Ödənişlər, onlayn sınaq üçün tutulmalar və geri qaytarmalar">
          {tx.length === 0 ? (
            <p className="m-0 text-[14px] text-[#5b6785]">Hələ əməliyyat yoxdur.</p>
          ) : (
            <div className="overflow-x-auto" tabIndex={0} role="region" aria-label="Balans tarixçəsi">
              <table className="w-full border-collapse">
                <thead>
                  <tr>
                    {["Tarix", "Əməliyyat", "Qeyd", "Məbləğ"].map((h) => (
                      <th key={h} scope="col" className={th}>
                        {h}
                      </th>
                    ))}
                  </tr>
                </thead>
                <tbody>
                  {tx.map((x) => (
                    <tr key={x.id}>
                      <td className={td}>{fmtDayLong(x.createdAt)}</td>
                      <td className={td}>
                        <Pill kind={KIND[x.kind].kind}>{KIND[x.kind].label}</Pill>
                      </td>
                      <td className={`${td} text-[13px] text-[#5b6785]`}>{x.note}</td>
                      <td className={`${td} font-black tabular-nums`} style={{ color: x.amount >= 0 ? "#047857" : "#b91c1c" }}>
                        {x.amount >= 0 ? "+" : "−"}
                        {azn(Math.abs(x.amount))}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </Card>
      </div>
    </>
  );
}
