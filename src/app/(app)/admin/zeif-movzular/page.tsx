import { desc, eq } from "drizzle-orm";
import type { Metadata } from "next";
import { Page, Topbar } from "@/components/app/topbar";
import { Alert } from "@/components/ui/alert";
import { Card, h1Class, h3Class } from "@/components/ui/display";
import { db } from "@/db";
import { errorTypes, taskOptionErrors, topics } from "@/db/schema";
import { LETTERS } from "@/lib/demo/content";
import {
  createErrorTypeAction,
  deleteErrorTypeAction,
  linkOptionAction,
  requireStaff,
  saveTopicAction,
  unlinkOptionAction,
} from "@/lib/weak/admin-actions";

export const metadata: Metadata = { title: "Zəif mövzular — müəllim" };

const SECTIONS = ["Ədədlər", "Cəbr", "Funksiyalar", "Həndəsə", "Statistika və ehtimal"];
const EXAM_TYPES = [
  ["9", "9-cu sinif"],
  ["11", "11-ci sinif"],
  ["blok", "Blok"],
] as const;

const input = "min-h-10 rounded-md border-[1.5px] border-control-border bg-white px-2.5 text-[14px]";
const btn = "min-h-10 cursor-pointer rounded-md bg-navy-900 px-3.5 text-[14px] font-bold text-white hover:bg-navy-700";
const btnGhost = "min-h-9 cursor-pointer rounded-md px-2.5 text-[13px] font-semibold text-danger-700 hover:bg-danger-100";

/** Müəllim: mövzuların DİM tezliyi, imtahan tipləri, əsas mövzu; səhv tipləri və yanlış variantların bağlantısı. */
export default async function WeakAdminPage(props: PageProps<"/admin/zeif-movzular">) {
  await requireStaff();
  const sp = await props.searchParams;
  const [topicRows, types, links] = await Promise.all([
    db.select().from(topics).orderBy(topics.sortOrder),
    db.select().from(errorTypes).orderBy(errorTypes.topicId, errorTypes.name),
    db
      .select({ code: taskOptionErrors.taskCode, option: taskOptionErrors.option, type: errorTypes.name, topicId: errorTypes.topicId })
      .from(taskOptionErrors)
      .innerJoin(errorTypes, eq(errorTypes.id, taskOptionErrors.errorTypeId))
      .orderBy(desc(taskOptionErrors.taskCode))
      .limit(200),
  ]);
  const topicName = new Map(topicRows.map((t) => [t.id, t.name]));

  return (
    <>
      <Topbar title="Zəif mövzular — müəllim" back="/panel" />
      <Page>
        <h1 className={h1Class}>Zəif mövzular: müəllim tənzimləmələri</h1>
        <p className="max-w-[48rem] text-ink-muted">
          DİM tezliyi — bir imtahanda bu mövzudan orta sual sayı (ilkin dəyər imtahan təhlilindən hesablanıb). Əsas mövzu kök səbəb təhlilində
          istifadə olunur. Səhv tipləri yanlış variantlara bağlandıqda şagirdə diaqnoz kimi göstərilir.
        </p>

        <Card as="section" aria-labelledby="adm-topics" className="grid gap-3">
          <h2 id="adm-topics" className={h3Class}>
            Mövzular
          </h2>
          <div className="relative overflow-x-auto">
            <table className="w-full min-w-[60rem] border-collapse text-[14px]">
              <caption className="sr-only">Mövzuların tənzimləmələri</caption>
              <thead>
                <tr className="bg-navy-050 text-left">
                  {["Mövzu", "Bölmə", "DİM tezliyi", "İmtahan tipləri", "Əsas mövzu", ""].map((h) => (
                    <th key={h} scope="col" className="px-2 py-2 font-semibold text-ink-muted">
                      {h}
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {topicRows.map((t) => {
                  const form = `topic-${t.id}`;
                  const types = t.examTypes.split(",");
                  return (
                    <tr key={t.id} className="border-t border-line">
                      <th scope="row" className="px-2 py-2 text-left font-semibold">
                        {t.name}
                        <form id={form} action={saveTopicAction}>
                          <input type="hidden" name="id" value={t.id} />
                        </form>
                      </th>
                      <td className="px-2 py-2">
                        <select form={form} name="section" defaultValue={t.section ?? "Cəbr"} aria-label={`${t.name}: bölmə`} className={input}>
                          {SECTIONS.map((s) => (
                            <option key={s}>{s}</option>
                          ))}
                        </select>
                      </td>
                      <td className="px-2 py-2">
                        <input
                          form={form}
                          name="dimFrequency"
                          type="number"
                          step="0.01"
                          min="0"
                          max="30"
                          defaultValue={t.dimFrequency}
                          aria-label={`${t.name}: DİM tezliyi`}
                          className={`${input} w-24`}
                        />
                      </td>
                      <td className="px-2 py-2">
                        <fieldset className="m-0 flex gap-3 border-0 p-0">
                          <legend className="sr-only">{t.name}: imtahan tipləri</legend>
                          {EXAM_TYPES.map(([v, label]) => (
                            <label key={v} className="flex items-center gap-1.5 whitespace-nowrap">
                              <input form={form} type="checkbox" name="examTypes" value={v} defaultChecked={types.includes(v)} />
                              {label}
                            </label>
                          ))}
                        </fieldset>
                      </td>
                      <td className="px-2 py-2">
                        <select
                          form={form}
                          name="prerequisiteId"
                          defaultValue={t.prerequisiteId ?? ""}
                          aria-label={`${t.name}: əsas mövzu`}
                          className={`${input} max-w-[16rem]`}
                        >
                          <option value="">— yoxdur —</option>
                          {topicRows
                            .filter((p) => p.id !== t.id)
                            .map((p) => (
                              <option key={p.id} value={p.id}>
                                {p.name}
                              </option>
                            ))}
                        </select>
                      </td>
                      <td className="px-2 py-2">
                        <button form={form} type="submit" className={btn}>
                          Saxla
                        </button>
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        </Card>

        <Card as="section" aria-labelledby="adm-types" className="grid gap-3">
          <h2 id="adm-types" className={h3Class}>
            Səhv tipləri
          </h2>
          <form action={createErrorTypeAction} className="grid gap-2 md:grid-cols-[1fr_1fr_2fr_auto] md:items-end">
            <label className="grid gap-1 text-[13px] font-semibold">
              Mövzu
              <select name="topicId" className={input} required>
                {topicRows.map((t) => (
                  <option key={t.id} value={t.id}>
                    {t.name}
                  </option>
                ))}
              </select>
            </label>
            <label className="grid gap-1 text-[13px] font-semibold">
              Ad
              <input name="name" required minLength={2} maxLength={120} placeholder="Faizdə baza səhvi" className={input} />
            </label>
            <label className="grid gap-1 text-[13px] font-semibold">
              Qısa izah
              <input name="description" maxLength={500} placeholder="Ardıcıl faiz dəyişməsində bazanı səhv götürür" className={input} />
            </label>
            <button type="submit" className={btn}>
              Əlavə et
            </button>
          </form>
          {types.length ? (
            <ul className="m-0 grid list-none gap-1.5 p-0">
              {types.map((e) => (
                <li key={e.id} className="flex flex-wrap items-center gap-2 rounded-md bg-navy-050 px-3 py-2 text-[14px]">
                  <b>{e.name}</b>
                  <span className="text-ink-muted">· {topicName.get(e.topicId)}</span>
                  {e.description && <span className="text-ink-muted">— {e.description}</span>}
                  <form action={deleteErrorTypeAction} className="ml-auto">
                    <input type="hidden" name="id" value={e.id} />
                    <button type="submit" className={btnGhost} aria-label={`${e.name}: sil`}>
                      Sil
                    </button>
                  </form>
                </li>
              ))}
            </ul>
          ) : (
            <p className="m-0 text-ink-muted">Hələ səhv tipi yoxdur. Bağlantı olmayanda diaqnoz kimi ən çox səhv edilən alt mövzu göstərilir.</p>
          )}
        </Card>

        <Card as="section" aria-labelledby="baglantilar" className="grid gap-3">
          <h2 id="baglantilar" className={h3Class}>
            Yanlış variant → səhv tipi
          </h2>
          {sp.xeta === "variant" && <Alert tone="danger">Sual tapılmadı və ya seçilən variant düzgün cavabdır.</Alert>}
          {types.length ? (
            <form action={linkOptionAction} className="grid gap-2 md:grid-cols-[1fr_auto_2fr_auto] md:items-end">
              <label className="grid gap-1 text-[13px] font-semibold">
                Sualın kodu
                <input name="taskCode" required placeholder="FNT-0012" className={input} />
              </label>
              <label className="grid gap-1 text-[13px] font-semibold">
                Variant
                <select name="option" className={input}>
                  {LETTERS.map((l) => (
                    <option key={l}>{l}</option>
                  ))}
                </select>
              </label>
              <label className="grid gap-1 text-[13px] font-semibold">
                Səhv tipi
                <select name="errorTypeId" className={input}>
                  {types.map((e) => (
                    <option key={e.id} value={e.id}>
                      {topicName.get(e.topicId)}: {e.name}
                    </option>
                  ))}
                </select>
              </label>
              <button type="submit" className={btn}>
                Bağla
              </button>
            </form>
          ) : (
            <p className="m-0 text-ink-muted">Əvvəlcə səhv tipi yaradın.</p>
          )}
          {links.length > 0 && (
            <ul className="m-0 grid list-none gap-1.5 p-0">
              {links.map((l) => (
                <li key={`${l.code}-${l.option}`} className="flex flex-wrap items-center gap-2 rounded-md bg-navy-050 px-3 py-2 text-[14px]">
                  <b className="tabular">
                    {l.code} · {l.option}
                  </b>
                  <span>→ {l.type}</span>
                  <span className="text-ink-muted">({topicName.get(l.topicId)})</span>
                  <form action={unlinkOptionAction} className="ml-auto">
                    <input type="hidden" name="taskCode" value={l.code} />
                    <input type="hidden" name="option" value={l.option} />
                    <button type="submit" className={btnGhost} aria-label={`${l.code} ${l.option}: bağlantını sil`}>
                      Sil
                    </button>
                  </form>
                </li>
              ))}
            </ul>
          )}
        </Card>
      </Page>
    </>
  );
}
