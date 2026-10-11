import { finalists } from "@/lib/contest/admin";
import { saveFinalistAction } from "@/lib/contest/admin-actions";
import { prizesOf, type ContestRow } from "@/lib/contest/data";
import { fmtDay, fmtTime } from "@/lib/contest/mail";
import { btnGhost, input, Table, td, th } from "../../ui";

/** Final: finalçılar, iştirakın qeydə alınması, final balı; mükafatlar: ödəniş üsulu və statusu. */
export async function FinalTab({ c }: { c: ContestRow }) {
  const [rows, prizes] = await Promise.all([finalists(c.id), prizesOf(c.id)]);
  const prizeOf = (place: number | null) => (place ? prizes.find((p) => place >= p.placeFrom && place <= p.placeTo) : undefined);
  return (
    <>
      <p className="m-0 text-[14px]">
        Final: <b>{c.finalAt ? `${fmtDay(c.finalAt)}, ${fmtTime(c.finalAt)}` : "tarix təyin olunmayıb"}</b> · Məkan: <b>{c.finalPlace ?? "təyin olunmayıb"}</b>. Vaxtı və məkanı
        “Parametrlər” bölməsində yaz, sonra finalçılara dəvət göndər.
      </p>
      <Table caption="Finalçılar">
        <thead className="bg-navy-050">
          <tr>
            {["Onlayn yer", "Finalçı", "Gəldi", "Final balı", "Final yeri", "Mükafat", "Ödəniş", ""].map((h) => (
              <th key={h} scope="col" className={th}>
                {h}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {rows.length === 0 && (
            <tr>
              <td className={td} colSpan={8}>
                Finalçılar onlayn turun nəticələri hesablanandan sonra görünəcək.
              </td>
            </tr>
          )}
          {rows.map(({ reg, res }) => {
            const prize = prizeOf(res.finalPlace);
            const form = `fin-${reg.id}`;
            return (
              <tr key={reg.id} className="border-t border-line">
                <td className={`${td} tabular`}>
                  {res.place} ({res.score} bal)
                </td>
                <td className={td}>
                  <b>
                    {reg.firstName} {reg.lastName}
                  </b>
                  <span className="block text-[12px] text-ink-muted">
                    {reg.grade}-ci sinif · {reg.region} · {reg.email}
                  </span>
                </td>
                <td className={td}>
                  <input form={form} type="checkbox" name="attended" defaultChecked={Boolean(res.finalAttended)} aria-label={`${reg.firstName}: finala gəldi`} className="size-5" />
                </td>
                <td className={td}>
                  <input form={form} name="finalScore" inputMode="decimal" defaultValue={res.finalScore ?? ""} aria-label={`${reg.firstName}: final balı`} className={`${input} w-20`} />
                </td>
                <td className={`${td} tabular`}>{res.finalPlace ?? "—"}</td>
                <td className={`${td} text-[13px]`}>{prize ? `${prize.amount ? `${prize.amount} ₼ ` : ""}${prize.description}` : "—"}</td>
                <td className={td}>
                  <div className="grid gap-1">
                    <select form={form} name="prizeMethod" defaultValue={res.prizeMethod ?? ""} aria-label={`${reg.firstName}: ödəniş üsulu`} className={input}>
                      <option value="">Üsul —</option>
                      <option value="parent_account">Valideynin hesabı</option>
                      <option value="cash">Nağd</option>
                    </select>
                    <select form={form} name="prizeStatus" defaultValue={res.prizeStatus ?? ""} aria-label={`${reg.firstName}: ödəniş statusu`} className={input}>
                      <option value="">Status —</option>
                      <option value="pending">Gözləyir</option>
                      <option value="paid">Ödənilib</option>
                    </select>
                  </div>
                </td>
                <td className={td}>
                  <form id={form} action={saveFinalistAction}>
                    <input type="hidden" name="contestId" value={c.id} />
                    <input type="hidden" name="id" value={reg.id} />
                    <button className={btnGhost}>Saxla</button>
                  </form>
                </td>
              </tr>
            );
          })}
        </tbody>
      </Table>
      <p className="m-0 text-[13px] text-ink-muted">Final yerləri “Yekun nəticələri elan et” düyməsi ilə final balına görə hesablanır (Parametrlər bölməsi).</p>
    </>
  );
}
