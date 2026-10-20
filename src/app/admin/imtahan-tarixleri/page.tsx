import { asc, eq } from "drizzle-orm";
import type { Metadata } from "next";
import { revalidatePath, updateTag } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import { db } from "@/db";
import { EXAM_DATE_TYPES, examDates } from "@/db/schema";
import { az } from "@/content/az";
import { requireAdmin } from "@/lib/admin/guard";
import { bakuDate, bakuInputToMs, countdown, msToBakuInput } from "@/lib/countdown";
import { EXAM_DATES_TAG, nextExamDates } from "@/lib/exam-dates";
import { Notice, PageHead, Table, btn, btnGhost, input, td, th } from "../ui";

export const metadata: Metadata = { title: "İmtahan tarixləri" };

const NAMES = az.landing.countdown.names;
const lbl = "grid gap-1 text-[13px] font-semibold";

const schema = z.object({
  id: z.string().optional(),
  examType: z.enum(EXAM_DATE_TYPES),
  title: z.string().trim().min(3).max(120),
  examDate: z.string().transform((v, ctx) => {
    const ms = bakuInputToMs(v);
    if (Number.isNaN(ms)) ctx.addIssue({ code: "custom", message: "Tarix səhvdir" });
    return new Date(ms);
  }),
  isEstimated: z.literal("on").optional(),
  isActive: z.literal("on").optional(),
});

function refresh() {
  // Ana səhifə və panel geri sayımı dərhal yeni tarixi götürsün.
  updateTag(EXAM_DATES_TAG);
  revalidatePath("/");
  revalidatePath("/admin/imtahan-tarixleri");
}

/** Əlavə et / redaktə et (id varsa). Vaxt Asia/Baku ilə daxil edilir. */
async function saveAction(formData: FormData) {
  "use server";
  await requireAdmin();
  const p = schema.safeParse(Object.fromEntries(formData));
  if (!p.success) redirect("/admin/imtahan-tarixleri?xeta=1");
  const { id, isEstimated, isActive, ...rest } = p.data;
  const values = { ...rest, isEstimated: isEstimated === "on", isActive: isActive === "on" };
  if (id) await db.update(examDates).set(values).where(eq(examDates.id, id));
  else await db.insert(examDates).values(values);
  refresh();
  redirect("/admin/imtahan-tarixleri?saxlanildi=1");
}

async function toggleAction(formData: FormData) {
  "use server";
  await requireAdmin();
  const id = String(formData.get("id") ?? "");
  if (id) await db.update(examDates).set({ isActive: formData.get("active") === "1" }).where(eq(examDates.id, id));
  refresh();
}

/** İmtahan tarixləri: ana səhifədəki və paneldəki geri sayım bunlardan hesablanır (hər tip üçün ən yaxın aktiv gələcək tarix). */
export default async function AdminExamDates(props: PageProps<"/admin/imtahan-tarixleri">) {
  const sp = await props.searchParams;
  const [rows, { now }] = await Promise.all([db.select().from(examDates).orderBy(asc(examDates.examDate)), nextExamDates()]);

  return (
    <>
      <PageHead
        title="İmtahan tarixləri"
        lead="Ana səhifədəki və paneldəki geri sayım. Hər imtahan tipi üçün ən yaxın aktiv gələcək tarix göstərilir. Vaxt — Bakı vaxtı ilə. DİM rəsmi tarixi elan edəndə tarixi yeniləyin və “təxmini” işarəsini götürün."
      />
      {sp.saxlanildi && <Notice tone="ok">Yadda saxlanıldı.</Notice>}
      {sp.xeta && <Notice tone="error">Məlumat səhvdir: başlıq (ən azı 3 hərf) və tarix-saat lazımdır.</Notice>}

      <Table caption="İmtahan tarixləri">
        <thead className="bg-navy-050">
          <tr>
            {["Tip", "Başlıq", "Tarix (Bakı)", "Təxmini", "Aktiv", "Qalıb", ""].map((h, i) => (
              <th key={i} scope="col" className={th}>
                {h}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {rows.length === 0 && (
            <tr>
              <td className={td} colSpan={7}>
                Hələ tarix yoxdur.
              </td>
            </tr>
          )}
          {rows.map((r) => {
            const at = r.examDate.getTime();
            const form = `f-${r.id}`;
            return (
              <tr key={r.id} className={`border-t border-line ${r.isActive ? "" : "opacity-60"}`}>
                <td className={td}>
                  <form id={form} action={saveAction} />
                  <input form={form} type="hidden" name="id" value={r.id} />
                  <select form={form} name="examType" defaultValue={r.examType} aria-label="Tip" className={input}>
                    {EXAM_DATE_TYPES.map((x) => (
                      <option key={x} value={x}>
                        {NAMES[x]}
                      </option>
                    ))}
                  </select>
                </td>
                <td className={td}>
                  <input form={form} name="title" defaultValue={r.title} aria-label="Başlıq" className={`${input} w-64`} />
                </td>
                <td className={td}>
                  <input form={form} type="datetime-local" name="examDate" defaultValue={msToBakuInput(at)} aria-label="Tarix (Bakı vaxtı)" className={input} />
                  <span className="block text-[12px] text-ink-muted">{bakuDate(at)}</span>
                </td>
                <td className={td}>
                  <input form={form} type="checkbox" name="isEstimated" defaultChecked={r.isEstimated} aria-label="Təxmini" className="size-4" />
                </td>
                <td className={td}>
                  <input form={form} type="checkbox" name="isActive" defaultChecked={r.isActive} aria-label="Aktiv" className="size-4" />
                </td>
                <td className={`${td} whitespace-nowrap tabular`}>{at > now ? `${countdown(at, now).days} gün` : "keçib"}</td>
                <td className={`${td} whitespace-nowrap`}>
                  <span className="flex gap-2">
                    <button form={form} className={btn}>
                      Saxla
                    </button>
                    <form action={toggleAction}>
                      <input type="hidden" name="id" value={r.id} />
                      <input type="hidden" name="active" value={r.isActive ? "0" : "1"} />
                      <button className={btnGhost}>{r.isActive ? "Passiv et" : "Aktiv et"}</button>
                    </form>
                  </span>
                </td>
              </tr>
            );
          })}
        </tbody>
      </Table>

      <form action={saveAction} className="grid gap-3 rounded-[16px] border border-line bg-white p-4">
        <h2 className="m-0 text-[16px] font-extrabold text-navy-900">Yeni tarix əlavə et</h2>
        <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
          <label className={lbl}>
            Tip
            <select name="examType" className={input}>
              {EXAM_DATE_TYPES.map((x) => (
                <option key={x} value={x}>
                  {NAMES[x]}
                </option>
              ))}
            </select>
          </label>
          <label className={lbl}>
            Başlıq
            <input name="title" required minLength={3} placeholder="9-cu sinif buraxılış imtahanı" className={input} />
          </label>
          <label className={lbl}>
            Tarix və saat (Bakı)
            <input name="examDate" type="datetime-local" required className={input} />
          </label>
          <div className="flex items-end gap-4 pb-2 text-[13px] font-semibold">
            <label className="flex items-center gap-2">
              <input type="checkbox" name="isEstimated" className="size-4" /> Təxmini
            </label>
            <label className="flex items-center gap-2">
              <input type="checkbox" name="isActive" defaultChecked className="size-4" /> Aktiv
            </label>
          </div>
        </div>
        <button className={`${btn} justify-self-start`}>Əlavə et</button>
      </form>
    </>
  );
}
