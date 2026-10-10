import type { Metadata } from "next";
import { listPayments, overview } from "@/lib/admin/queries";
import { Bars, PageHead, Panel, Stat, Table, azn, fmtDate, td, th } from "../ui";

export const metadata: Metadata = { title: "Qazanc" };

export default async function AdminRevenue() {
  const [o, list] = await Promise.all([overview(), listPayments(200)]);
  const sub = o.revenue.byKind.find((k) => k.kind === "subscription");
  const exam = o.revenue.byKind.find((k) => k.kind === "exam");
  return (
    <>
      <PageHead title="Qazanc" lead="Bütün ödənişlər (abunələr və tək sınaqlar). Ödəniş hələ test rejimindədir (mock)." />
      <div className="grid grid-cols-2 gap-3 lg:grid-cols-4">
        <Stat tone="navy" label="Cəmi" value={azn(o.revenue.total)} hint={`${o.revenue.count} ödəniş`} />
        <Stat label="Son 30 gün" value={azn(o.revenue.last30)} />
        <Stat label="Abunələr" value={azn(Number(sub?.s ?? 0))} hint={`${sub?.n ?? 0} ödəniş`} />
        <Stat label="Tək sınaqlar" value={azn(Number(exam?.s ?? 0))} hint={`${exam?.n ?? 0} ödəniş`} />
      </div>
      <Panel title="Aylar üzrə">
        <Bars data={[...o.revenue.byMonth].reverse().map((m) => ({ k: m.month, v: Number(m.s ?? 0) }))} label="Aylıq qazanc" unit="" />
      </Panel>
      <Table caption="Ödənişlər">
        <thead className="bg-navy-050">
          <tr>
            {["Tarix", "İstifadəçi", "Ödəniş", "Növ", "Məbləğ"].map((h) => (
              <th key={h} scope="col" className={th}>
                {h}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {list.map(({ p, name, surname, email, username }) => (
            <tr key={p.id} className="border-t border-line">
              <td className={td}>{fmtDate(p.createdAt)}</td>
              <td className={td}>
                {name} {surname}
                <span className="block text-[12.5px] text-ink-muted">{email ?? (username ? `@${username}` : "")}</span>
              </td>
              <td className={td}>{p.title}</td>
              <td className={td}>{p.kind === "exam" ? "Tək sınaq" : p.period === "year" ? "Abunə · illik" : "Abunə · aylıq"}</td>
              <td className={`${td} font-bold tabular`}>{azn(p.amount)}</td>
            </tr>
          ))}
          {!list.length && (
            <tr>
              <td className={td} colSpan={5}>
                Hələ ödəniş yoxdur.
              </td>
            </tr>
          )}
        </tbody>
      </Table>
    </>
  );
}
