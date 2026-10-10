import type { Metadata } from "next";
import { listSubscribers } from "@/lib/admin/queries";
import { PageHead, Stat, Table, azn, isoToAz, td, th } from "../ui";

export const metadata: Metadata = { title: "Abunəçilər" };

export default async function AdminSubscribers() {
  const subs = await listSubscribers();
  const count = (f: (s: (typeof subs)[number]) => boolean) => subs.filter(f).length;
  return (
    <>
      <PageHead title="Abunəçilər" lead="Hazırda Pro və ya Premium girişi olan istifadəçilər (ləğv edib dövrü bitməyənlər də daxil)." />
      <div className="grid grid-cols-2 gap-3 lg:grid-cols-4">
        <Stat tone="navy" label="Cəmi" value={subs.length} />
        <Stat label="Pro" value={count((s) => s.tier === "pro")} />
        <Stat label="Premium" value={count((s) => s.tier === "premium")} />
        <Stat label="İllik" value={count((s) => s.period === "year")} hint={`Ləğv edilib: ${count((s) => s.status === "canceled")}`} />
      </div>
      <Table caption="Abunəçilər">
        <thead className="bg-navy-050">
          <tr>
            {["İstifadəçi", "E-poçt", "Plan", "Dövr", "Vəziyyət", "Bitmə tarixi", "Ödəyib"].map((h) => (
              <th key={h} scope="col" className={th}>
                {h}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {subs.map((s) => (
            <tr key={s.userId} className="border-t border-line">
              <td className={td}>
                <b>
                  {s.name} {s.surname}
                </b>
                {s.username && <span className="block text-[12.5px] text-ink-muted">@{s.username}</span>}
              </td>
              <td className={td}>{s.email ?? "—"}</td>
              <td className={td}>{s.tier === "pro" ? "Pro" : "Premium"}</td>
              <td className={td}>{s.period === "year" ? "İllik" : "Aylıq"}</td>
              <td className={td}>{s.status === "canceled" ? "Ləğv edilib (dövr sonunadək)" : "Aktiv"}</td>
              <td className={td}>{isoToAz(s.periodEnd)}</td>
              <td className={`${td} tabular`}>{azn(s.paid)}</td>
            </tr>
          ))}
          {!subs.length && (
            <tr>
              <td className={td} colSpan={7}>
                Hələ abunəçi yoxdur.
              </td>
            </tr>
          )}
        </tbody>
      </Table>
    </>
  );
}
