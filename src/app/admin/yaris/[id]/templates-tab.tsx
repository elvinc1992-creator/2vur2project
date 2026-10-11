import { MathText } from "@/components/ui/math-text";
import { topicOptions } from "@/lib/admin/queries";
import { templatesOf } from "@/lib/contest/admin";
import { deleteTemplateAction, saveTemplateAction } from "@/lib/contest/admin-actions";
import type { ContestRow } from "@/lib/contest/data";
import { LETTERS, makeVariant } from "@/lib/contest/variant";
import { btn, btnDanger, btnGhost, input } from "../../ui";

const lbl = "grid gap-1 text-[13px] font-semibold";

type Row = Awaited<ReturnType<typeof templatesOf>>[number];

/** Sual şablonları: mətn [[a]], [[=ifadə]]; rəqəmlərin qaydası (vars), şərt, cavab, 4 yanlış variant; 3 variantın önbaxışı. */
export async function TemplatesTab({ c, editId }: { c: ContestRow; editId: number | null }) {
  const [rows, topics] = await Promise.all([templatesOf(c.id), topicOptions()]);
  return (
    <>
      <p className="m-0 text-[13px] text-ink-muted">
        {rows.length} şablon; turda ilk {c.questionCount} şablon istifadə olunur. Mətndə <code>[[a]]</code> — dəyişən, <code>[[=a*b]]</code> — hesablanan qiymət (LaTeX: $…$).
        Dəyişənlər JSON: <code>{`{"a":[min,max,addım]}`}</code>. İfadələrdə: + − * / % ^, gcd, lcm, sqrt, abs, min, max, floor, ceil, round, müqayisə və && ||.
      </p>
      <ol className="m-0 grid list-none gap-3 p-0">
        {rows.map((r) => (
          <li key={r.t.id} className="grid gap-2 rounded-[16px] border border-line bg-white p-4">
            <div className="flex flex-wrap items-baseline justify-between gap-2">
              <b>
                №{r.t.n} · {r.topic ?? "mövzusuz"} · {r.t.timeSec} s
              </b>
              <div className="flex gap-2">
                <a href={`?tab=suallar&t=${r.t.id}#edit-${r.t.id}`} className={btnGhost}>
                  Redaktə
                </a>
                <form action={deleteTemplateAction}>
                  <input type="hidden" name="contestId" value={c.id} />
                  <input type="hidden" name="templateId" value={r.t.id} />
                  <button className={btnDanger}>Sil</button>
                </form>
              </div>
            </div>
            <Preview r={r} />
            {editId === r.t.id && <TemplateForm c={c} r={r} topics={topics} />}
          </li>
        ))}
      </ol>
      <details className="rounded-[16px] border border-line bg-white p-4" open={rows.length === 0}>
        <summary className="cursor-pointer font-bold">+ Yeni şablon</summary>
        <TemplateForm c={c} topics={topics} />
      </details>
    </>
  );
}

/** 3 variant (hər iştirakçıya fərqli rəqəmlər) — düzgün cavab qalın. */
function Preview({ r }: { r: Row }) {
  const input = { body: r.t.body, vars: JSON.parse(r.t.vars), condition: r.t.condition, answer: r.t.answer, distractors: JSON.parse(r.t.distractors), solution: r.t.solution };
  const vs = LETTERS.slice(0, 3).map((l) => makeVariant(input, l));
  return (
    <ul className="m-0 grid list-none gap-2 p-0 lg:grid-cols-3">
      {vs.map((v, i) =>
        v ? (
          <li key={i} className="rounded-md bg-navy-050 p-2.5 text-[13px]">
            <MathText text={v.text} />
            <span className="mt-1 flex flex-wrap gap-x-3">
              {LETTERS.map((l) => (
                <span key={l} className={l === v.correct ? "font-bold text-success-700" : ""}>
                  {l}) <MathText text={v.options[l]} />
                </span>
              ))}
            </span>
          </li>
        ) : (
          <li key={i} className="rounded-md bg-danger-100 p-2.5 text-[13px] text-danger-700">
            Variant yaranmadı — şərti və dəyişənləri yoxla.
          </li>
        ),
      )}
    </ul>
  );
}

function TemplateForm({ c, r, topics }: { c: ContestRow; r?: Row; topics: Array<{ id: number; name: string }> }) {
  const t = r?.t;
  return (
    <form action={saveTemplateAction} id={t ? `edit-${t.id}` : undefined} className="mt-3 grid gap-2">
      <input type="hidden" name="contestId" value={c.id} />
      {t && <input type="hidden" name="templateId" value={t.id} />}
      <div className="flex flex-wrap gap-2">
        <label className={lbl}>
          Mövzu
          <select name="topicId" defaultValue={t?.topicId ?? ""} className={input}>
            <option value="">—</option>
            {topics.map((x) => (
              <option key={x.id} value={x.id}>
                {x.name}
              </option>
            ))}
          </select>
        </label>
        <label className={lbl}>
          Vaxt (saniyə)
          <input name="timeSec" type="number" min={10} max={600} defaultValue={t?.timeSec ?? 75} className={`${input} w-28`} />
        </label>
      </div>
      <label className={lbl}>
        Sualın mətni
        <textarea name="body" required rows={2} defaultValue={t?.body} className={`${input} py-2`} placeholder="Məhsulun qiyməti [[a]] manat idi. Qiymət [[p]]% artırıldı…" />
      </label>
      <div className="grid gap-2 md:grid-cols-3">
        <label className={lbl}>
          Dəyişənlər (JSON)
          <input name="vars" required defaultValue={t?.vars} className={`${input} font-mono`} placeholder='{"a":[40,400,20],"p":[5,50,5]}' />
        </label>
        <label className={lbl}>
          Şərt (könüllü)
          <input name="condition" defaultValue={t?.condition ?? ""} className={`${input} font-mono`} placeholder="(a*p) % 100 == 0" />
        </label>
        <label className={lbl}>
          Düzgün cavab (ifadə)
          <input name="answer" required defaultValue={t?.answer} className={`${input} font-mono`} placeholder="a + a*p/100" />
        </label>
      </div>
      <label className={lbl}>
        Yanlış variantlar — hər sətirdə bir ifadə (tipik səhvlər)
        <textarea name="distractors" required rows={4} defaultValue={t ? (JSON.parse(t.distractors) as string[]).join("\n") : ""} className={`${input} py-2 font-mono`} />
      </label>
      <label className={lbl}>
        Həll (tur bitəndən sonra göstərilir)
        <textarea name="solution" rows={2} defaultValue={t?.solution} className={`${input} py-2`} />
      </label>
      <button className={`${btn} justify-self-start`}>{t ? "Saxla" : "Əlavə et"}</button>
    </form>
  );
}
