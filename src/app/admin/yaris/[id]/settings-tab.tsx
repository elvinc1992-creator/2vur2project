import { CONTEST_STATUSES } from "@/db/schema";
import { contestOpAction, updateContestAction } from "@/lib/contest/admin-actions";
import { prizesOf, registrationCount, type ContestRow } from "@/lib/contest/data";
import { mailStats } from "@/lib/contest/process";
import { btn, btnGhost, input } from "../../ui";
import { CONTEST_STATUS_LABEL, toLocalInput } from "../labels";

const lbl = "grid gap-1 text-[13px] font-semibold";

export async function SettingsTab({ c }: { c: ContestRow }) {
  const [prizes, regs, mails] = await Promise.all([prizesOf(c.id), registrationCount(c.id), mailStats(c.id)]);
  const prizeText = prizes.map((p) => `${p.placeFrom === p.placeTo ? p.placeFrom : `${p.placeFrom}-${p.placeTo}`} | ${p.amount ?? ""} | ${p.description}`).join("\n");
  const op = (name: string, label: string, note?: string) => (
    <form action={contestOpAction} className="grid gap-1">
      <input type="hidden" name="contestId" value={c.id} />
      <input type="hidden" name="op" value={name} />
      <button className={btnGhost}>{label}</button>
      {note && <span className="text-[12px] text-ink-muted">{note}</span>}
    </form>
  );

  return (
    <>
      <form action={updateContestAction} className="grid gap-4 rounded-[16px] border border-line bg-white p-4">
        <input type="hidden" name="id" value={c.id} />
        <div className="flex flex-wrap gap-2">
          <label className={`${lbl} min-w-[260px] flex-1`}>
            Ad
            <input name="title" defaultValue={c.title} required className={input} />
          </label>
          <label className={lbl}>
            Ünvan (slug)
            <input name="slug" defaultValue={c.slug} required className={`${input} font-mono`} />
          </label>
          <label className={lbl}>
            Status
            <select name="status" defaultValue={c.status} className={input}>
              {CONTEST_STATUSES.map((s) => (
                <option key={s} value={s}>
                  {CONTEST_STATUS_LABEL[s]}
                </option>
              ))}
            </select>
          </label>
        </div>
        <label className={lbl}>
          Təsvir (boş qalsa — standart mətn)
          <textarea name="description" defaultValue={c.description} rows={2} className={`${input} py-2`} />
        </label>
        <fieldset className="m-0 flex flex-wrap gap-2 border-0 p-0">
          <legend className="mb-1 text-[14px] font-bold">Tarixlər (Bakı vaxtı)</legend>
          {(
            [
              ["regStartAt", "Qeydiyyat başlayır", c.regStartAt],
              ["regEndAt", "Qeydiyyat bitir", c.regEndAt],
              ["startAt", "Onlayn tur başlayır", c.startAt],
              ["finalAt", "Final (boş — elan olunacaq)", c.finalAt],
              ["awardsAt", "Mükafatlandırma", c.awardsAt],
            ] as const
          ).map(([name, label, v]) => (
            <label key={name} className={lbl}>
              {label}
              <input name={name} type="datetime-local" defaultValue={toLocalInput(v)} required={name === "regStartAt" || name === "regEndAt" || name === "startAt"} className={input} />
            </label>
          ))}
        </fieldset>
        <fieldset className="m-0 flex flex-wrap gap-2 border-0 p-0">
          <legend className="mb-1 text-[14px] font-bold">Tur və final</legend>
          {(
            [
              ["entryWindowMin", "Giriş üçün son vaxt (dəq)", c.entryWindowMin],
              ["durationMin", "Turun müddəti (dəq)", c.durationMin],
              ["questionCount", "Sual sayı", c.questionCount],
              ["finalistCount", "Finala keçənlər", c.finalistCount],
            ] as const
          ).map(([name, label, v]) => (
            <label key={name} className={lbl}>
              {label}
              <input name={name} type="number" min={1} defaultValue={v} className={`${input} w-36`} />
            </label>
          ))}
          <label className={`${lbl} min-w-[260px] flex-1`}>
            Finalın məkanı
            <input name="finalPlace" defaultValue={c.finalPlace ?? ""} className={input} placeholder="Məs. Bakı, ... küçəsi, ... zalı" />
          </label>
        </fieldset>
        <fieldset className="m-0 grid gap-2 border-0 p-0">
          <legend className="mb-1 text-[14px] font-bold">Mükafatlar və fond (hazırda {regs} qeydiyyat)</legend>
          <div className="flex flex-wrap gap-2">
            <label className={lbl}>
              Mükafat fondu (AZN)
              <input name="prizeFund" type="number" step="0.01" min={0} defaultValue={c.prizeFund} className={`${input} w-36`} />
            </label>
            <label className={lbl}>
              Fondun artma həddi (iştirakçı)
              <input name="boostThreshold" type="number" min={0} defaultValue={c.boostThreshold ?? ""} className={`${input} w-44`} />
            </label>
            <label className={lbl}>
              Artırılmış 1-ci yer (AZN)
              <input name="boostFirstPrize" type="number" step="0.01" min={0} defaultValue={c.boostFirstPrize ?? ""} className={`${input} w-44`} />
            </label>
          </div>
          <label className={lbl}>
            Mükafatlar — hər sətirdə: yer (və ya aralıq) | məbləğ AZN (boş ola bilər) | təsvir
            <textarea name="prizes" defaultValue={prizeText} rows={5} className={`${input} py-2 font-mono text-[13px]`} />
          </label>
        </fieldset>
        <button className={`${btn} justify-self-start`}>Saxla</button>
      </form>

      <section aria-labelledby="ops" className="grid gap-3 rounded-[16px] border border-line bg-white p-4">
        <h2 id="ops" className="m-0 text-[17px] font-extrabold text-navy-900">
          Əməliyyatlar və e-poçtlar
        </h2>
        <p className="m-0 text-[13px] text-ink-muted">
          Avtomatik: turdan 1 saat əvvəl xatırlatma, tur bitəndə nəticələr və nəticə məktubları (yarış səhifəsi açılanda işə düşür). Göndərilib: təsdiq {mails.confirm ?? 0}, xatırlatma {mails.reminder ?? 0}, nəticə {mails.result ?? 0}, finalçı {mails.finalist ?? 0}, yekun {mails.final ?? 0}.
        </p>
        <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
          {op("compute", "Nəticələri indi hesabla", "Tur bitməyibsə, başlayanların cəhdi bu ana qədər bağlanır.")}
          {op("result_mails", "Nəticə məktublarını yenidən göndər", "Yalnız razılıq verənlərə.")}
          {op("confirm_mails", "Təsdiq məktublarını yenidən göndər")}
          {op("reminder_mails", "Xatırlatmanı indi göndər")}
          {op("finalist_mails", "Finalçılara dəvət göndər", "Əvvəlcə finalın vaxtını və məkanını yaz. Status “Final” olur.")}
          {op("publish_final", "Yekun nəticələri elan et", "Final ballarına görə yerlər hesablanır, hamıya yekun məktub.")}
        </div>
      </section>
    </>
  );
}
