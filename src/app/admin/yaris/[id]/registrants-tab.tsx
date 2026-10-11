import { listRegistrants, regionsOf, topInviters } from "@/lib/contest/admin";
import type { ContestRow } from "@/lib/contest/data";
import { Table, btnGhost, fmtDate, input, td, th } from "../../ui";

/** Qeydiyyatçılar: axtarış (ad, e-poçt, məktəb, kod), sinif və rayon filtri, CSV ixracı, dəvət statistikası. */
export async function RegistrantsTab({ c, q, grade, region }: { c: ContestRow; q?: string; grade?: number; region?: string }) {
  const [{ rows, total }, regions, inviters] = await Promise.all([listRegistrants(c.id, { q, grade, region }), regionsOf(c.id), topInviters(c.id)]);
  const qs = new URLSearchParams({ ...(q ? { q } : {}), ...(grade ? { sinif: String(grade) } : {}), ...(region ? { rayon: region } : {}) }).toString();
  return (
    <>
      <form className="flex flex-wrap items-end gap-2 rounded-[16px] border border-line bg-white p-4">
        <input type="hidden" name="tab" value="istirakcilar" />
        <label className="grid min-w-[220px] flex-1 gap-1 text-[13px] font-semibold">
          Axtarış
          <input name="q" defaultValue={q} className={input} placeholder="Ad, e-poçt, məktəb və ya kod" />
        </label>
        <label className="grid gap-1 text-[13px] font-semibold">
          Sinif
          <select name="sinif" defaultValue={grade ?? ""} className={input}>
            <option value="">Hamısı</option>
            {[9, 10, 11].map((g) => (
              <option key={g} value={g}>
                {g}-cu/cı sinif
              </option>
            ))}
          </select>
        </label>
        <label className="grid gap-1 text-[13px] font-semibold">
          Rayon / şəhər
          <select name="rayon" defaultValue={region ?? ""} className={input}>
            <option value="">Hamısı</option>
            {regions.map((r) => (
              <option key={r} value={r}>
                {r}
              </option>
            ))}
          </select>
        </label>
        <button className={btnGhost}>Süz</button>
        <a href={`/admin/yaris/${c.id}/csv${qs ? `?${qs}` : ""}`} className={btnGhost}>
          CSV ixracı (Excel)
        </a>
      </form>
      <p className="m-0 text-[13px] text-ink-muted">
        {total} qeydiyyatçı{rows.length < total ? ` (ilk ${rows.length} göstərilir)` : ""}.
      </p>
      <Table caption="Qeydiyyatçılar">
        <thead className="bg-navy-050">
          <tr>
            {["Ad, soyad", "Sinif", "Rayon / məktəb", "E-poçt", "Kod / dəvət", "Razılıq", "Bal / yer", "Tarix"].map((h) => (
              <th key={h} scope="col" className={th}>
                {h}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {rows.map(({ reg, res }) => (
            <tr key={reg.id} className="border-t border-line">
              <td className={td}>
                <b>
                  {reg.firstName} {reg.lastName}
                </b>
              </td>
              <td className={`${td} tabular`}>{reg.grade}</td>
              <td className={td}>
                {reg.region}
                <span className="block text-[12px] text-ink-muted">{reg.school ?? "—"}</span>
              </td>
              <td className={td}>{reg.email}</td>
              <td className={`${td} font-mono text-[12px]`}>
                {reg.inviteCode}
                {reg.invitedByCode && <span className="block text-ink-muted">← {reg.invitedByCode}</span>}
              </td>
              <td className={`${td} text-[12px]`}>{reg.unsubscribedAt ? "imtina" : reg.agreeEmail ? "e-poçt ✓" : "e-poçt ✗"}</td>
              <td className={`${td} tabular`}>{res ? (res.disqualified ? "DQ" : `${res.score} / ${res.place ?? "—"}`) : "—"}</td>
              <td className={`${td} tabular`}>{fmtDate(reg.createdAt)}</td>
            </tr>
          ))}
        </tbody>
      </Table>
      {inviters.length > 0 && (
        <section className="grid gap-2 rounded-[16px] border border-line bg-white p-4">
          <h2 className="m-0 text-[15px] font-extrabold">Ən çox dəvət edənlər</h2>
          <ul className="m-0 grid gap-1 pl-5 text-[14px]">
            {inviters.map((x) => (
              <li key={x.reg?.id ?? x.n}>
                {x.reg ? `${x.reg.firstName} ${x.reg.lastName} (${x.reg.inviteCode})` : "—"}: <b>{x.n}</b>
              </li>
            ))}
          </ul>
        </section>
      )}
    </>
  );
}
