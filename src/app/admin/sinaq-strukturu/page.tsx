import { asc } from "drizzle-orm";
import type { Metadata } from "next";
import { db } from "@/db";
import { examKinds, topics } from "@/db/schema";
import { saveStructureAction, saveTeacherPricesAction, saveTopicDistributionAction } from "@/lib/admin/teacher-actions";
import { sectionsOf } from "@/lib/exams/create";
import { Notice, PageHead, Table, btn, input, td, th } from "../ui";

export const metadata: Metadata = { title: "Sınaq strukturu" };

const lbl = "grid gap-1 text-[13px] font-semibold";

/**
 * Hər imtahan növü üçün sınaq strukturu: bölmələrin sual sayı və müddət (saytın sınaqları və müəllim sınaqları),
 * mövzu bölgüsü — mövzunun imtahan növləri və DİM tezliyi (sualların paylanma çəkisi). Müəllim bunu dəyişə bilmir.
 */
export default async function ExamStructure(props: PageProps<"/admin/sinaq-strukturu">) {
  const sp = await props.searchParams;
  const allKinds = await db.select().from(examKinds).orderBy(asc(examKinds.sortOrder));
  const kinds = allKinds.filter((k) => k.key !== "movzu");
  const [sections, topicRows] = await Promise.all([Promise.all(kinds.map((k) => sectionsOf(k.key))), db.select().from(topics).orderBy(asc(topics.curriculumOrder))]);

  return (
    <>
      <PageHead title="Sınaq strukturu" lead="Saytın sınaqları və müəllim sınaqları bu struktura görə yaradılır. Müəllim strukturu dəyişə bilmir." />
      {sp.saxlanildi && <Notice tone="ok">Yadda saxlanıldı.</Notice>}
      <div className="grid gap-3 lg:grid-cols-3">
        {kinds.map((k, i) => {
          const c = (f: string) => sections[i].find((s) => s.format === f)?.count ?? 0;
          return (
            <form key={k.key} action={saveStructureAction} className="grid gap-2 rounded-[16px] border border-line bg-white p-4">
              <input type="hidden" name="kind" value={k.key} />
              <h2 className="m-0 text-[16px] font-extrabold text-navy-900">{k.name}</h2>
              <p className="m-0 text-[13px] text-ink-muted">Cəmi {c("closed") + c("coded") + c("written")} sual</p>
              <div className="grid grid-cols-2 gap-2">
                <label className={lbl}>
                  Qapalı
                  <input name="closed" type="number" min={0} max={60} defaultValue={c("closed")} className={input} />
                </label>
                <label className={lbl}>
                  Kodlaşdırılan
                  <input name="open" type="number" min={0} max={30} defaultValue={c("coded")} className={input} />
                </label>
                <label className={lbl}>
                  Yazılı
                  <input name="written" type="number" min={0} max={30} defaultValue={c("written")} className={input} />
                </label>
                <label className={lbl}>
                  Müddət (dəq)
                  <input name="durationMin" type="number" min={10} max={300} defaultValue={k.durationMin} className={input} />
                </label>
              </div>
              <button className={`${btn} justify-self-start`}>Saxla</button>
            </form>
          );
        })}
      </div>

      <form action={saveTeacherPricesAction} className="grid gap-3 rounded-[16px] border border-line bg-white p-4">
        <h2 className="m-0 text-[16px] font-extrabold text-navy-900">Müəllim sınağının qiyməti</h2>
        <p className="m-0 text-[13px] text-ink-muted">Sınaq başına, müəllimin balansından tutulur (şagird sayından asılı deyil).</p>
        <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
          {allKinds.map((k) => (
            <fieldset key={k.key} className="m-0 grid gap-2 rounded-[12px] border border-line p-3">
              <legend className="px-1 text-[13px] font-bold">{k.name}</legend>
              <label className={lbl}>
                Onlayn (₼)
                <input name={`price-${k.key}`} inputMode="decimal" defaultValue={k.teacherPrice} className={input} />
              </label>
              <label className={lbl}>
                Kağız (₼)
                <input name={`paper-${k.key}`} inputMode="decimal" defaultValue={k.teacherPaperPrice} className={input} />
              </label>
            </fieldset>
          ))}
        </div>
        <button className={`${btn} justify-self-start`}>Qiymətləri saxla</button>
      </form>

      <form action={saveTopicDistributionAction} className="grid gap-3">
        <Table caption="Mövzu bölgüsü">
          <thead className="bg-navy-050">
            <tr>
              {["Mövzu", "9-cu sinif", "11-ci sinif", "Blok", "DİM tezliyi (çəki)"].map((h) => (
                <th key={h} scope="col" className={th}>
                  {h}
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {topicRows.map((t) => {
              const types = t.examTypes.split(",").map((x) => x.trim());
              return (
                <tr key={t.id} className="border-t border-line">
                  <td className={td}>{t.name}</td>
                  {(["9", "11", "blok"] as const).map((x) => (
                    <td key={x} className={td}>
                      <input type="checkbox" name={`t${t.id}-${x}`} defaultChecked={types.includes(x)} aria-label={`${t.name}: ${x === "blok" ? "blok" : `${x}-cu/ci sinif`}`} className="size-4" />
                    </td>
                  ))}
                  <td className={td}>
                    <input name={`t${t.id}-w`} inputMode="decimal" defaultValue={t.dimFrequency} aria-label={`${t.name}: DİM tezliyi`} className={`${input} w-24`} />
                  </td>
                </tr>
              );
            })}
          </tbody>
        </Table>
        <p className="m-0 text-[13px] text-ink-muted">Çəki — mövzunun sınaqdakı payı (DİM statistikasına görə). Çəki 0 olsa da mövzu az sayda iştirak edə bilər.</p>
        <button className={`${btn} justify-self-start`}>Mövzu bölgüsünü saxla</button>
      </form>
    </>
  );
}
