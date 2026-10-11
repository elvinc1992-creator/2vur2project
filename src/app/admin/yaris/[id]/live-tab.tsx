import { liveStats, suspects } from "@/lib/contest/admin";
import { disqualifyAction } from "@/lib/contest/admin-actions";
import type { ContestRow } from "@/lib/contest/data";
import { btnDanger, btnGhost, input, Stat, Table, td, th } from "../../ui";
import { EVENT_LABEL } from "../labels";

/** Turun gedişi: aktiv / bitirən; hadisə jurnalında çox qeydi olanlar; şübhəli nəticələr və diskvalifikasiya. */
export async function LiveTab({ c }: { c: ContestRow }) {
  const [s, list] = await Promise.all([liveStats(c.id), suspects(c.id)]);
  const byReg = new Map<string, Array<{ kind: string; n: number }>>();
  for (const e of s.events) byReg.set(e.id, [...(byReg.get(e.id) ?? []), { kind: e.kind, n: e.n }]);
  const noisy = [...byReg].map(([id, ev]) => ({ id, ev, total: ev.reduce((x, y) => x + y.n, 0) })).sort((a, b) => b.total - a.total).slice(0, 10);

  return (
    <>
      <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
        <Stat label="Qeydiyyat" value={s.regs} />
        <Stat label="Tura başlayıb" value={s.started} />
        <Stat label="Hazırda turda" value={s.active} tone="navy" />
        <Stat label="Bitirib" value={s.finished} />
      </div>
      <p className="m-0 text-[13px] text-ink-muted">Səhifəni yeniləyərək canlı izlə. Tab dəyişmə avtomatik diskvalifikasiya səbəbi deyil — yoxlama üçün siqnaldır.</p>

      <Table caption="Şübhəli nəticələr">
        <thead className="bg-navy-050">
          <tr>
            {["İştirakçı", "Səbəblər", "Bal", "Qərar"].map((h) => (
              <th key={h} scope="col" className={th}>
                {h}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {list.length === 0 && (
            <tr>
              <td className={td} colSpan={4}>
                Şübhəli nəticə yoxdur.
              </td>
            </tr>
          )}
          {list.map((x) => (
            <tr key={x.id} className="border-t border-line">
              <td className={td}>
                <b>{x.name}</b>
                <span className="block text-[12px] text-ink-muted">{x.email}</span>
              </td>
              <td className={`${td} text-[13px]`}>{x.reasons.length ? x.reasons.join("; ") : "—"}</td>
              <td className={`${td} tabular`}>{x.score ?? "—"}</td>
              <td className={td}>
                <form action={disqualifyAction} className="flex flex-wrap items-center gap-1.5">
                  <input type="hidden" name="contestId" value={c.id} />
                  <input type="hidden" name="id" value={x.id} />
                  {x.disqualified ? (
                    <>
                      <span className="text-[13px] font-semibold text-danger-700">DQ: {x.dqReason}</span>
                      <input type="hidden" name="undo" value="1" />
                      <button className={btnGhost}>Ləğv et</button>
                    </>
                  ) : (
                    <>
                      <input name="reason" aria-label={`${x.name}: diskvalifikasiyanın səbəbi`} placeholder="Səbəb" className={`${input} w-48`} />
                      <button className={btnDanger}>Diskvalifikasiya</button>
                    </>
                  )}
                </form>
              </td>
            </tr>
          ))}
        </tbody>
      </Table>

      {noisy.length > 0 && (
        <Table caption="Hadisə jurnalında çox qeydi olanlar">
          <thead className="bg-navy-050">
            <tr>
              <th scope="col" className={th}>
                Qeydiyyat
              </th>
              <th scope="col" className={th}>
                Hadisələr
              </th>
            </tr>
          </thead>
          <tbody>
            {noisy.map((x) => (
              <tr key={x.id} className="border-t border-line">
                <td className={`${td} font-mono text-[12px]`}>{x.id.slice(0, 8)}</td>
                <td className={`${td} text-[13px]`}>{x.ev.map((e) => `${EVENT_LABEL[e.kind] ?? e.kind}: ${e.n}`).join(" · ")}</td>
              </tr>
            ))}
          </tbody>
        </Table>
      )}
    </>
  );
}
