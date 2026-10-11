import { MathText } from "@/components/ui/math-text";
import { topicOptions } from "@/lib/admin/queries";
import { listBankTasks } from "@/lib/bank/tasks";
import { templatesOf } from "@/lib/contest/admin";
import { deleteTemplateAction, saveTemplateAction } from "@/lib/contest/admin-actions";
import type { ContestRow } from "@/lib/contest/data";
import { LETTERS, makeVariant, shuffle } from "@/lib/contest/variant";
import { btn, btnDanger, btnGhost, input } from "../../ui";

const lbl = "grid gap-1 text-[13px] font-semibold";

type Row = Awaited<ReturnType<typeof templatesOf>>[number];
type Bank = Awaited<ReturnType<typeof listBankTasks>>;

/**
 * Yarışın sual yerləri. Mənbə:
 *  • sual bankı — yerin mövzusunun qapalı (A–E) suallarından hər iştirakçıya təsadüfi biri (iştirakçıda təkrarsız);
 *  • düstur — şablon: mətn [[a]], [[=ifadə]], rəqəmlərin qaydası, cavab və 4 yanlış variant.
 */
export async function TemplatesTab({ c, editId }: { c: ContestRow; editId: number | null }) {
  const [rows, topics, bank] = await Promise.all([templatesOf(c.id), topicOptions(), listBankTasks()]);
  const closed = bank.filter((b) => b.format === "closed" && b.options && b.correct);
  const fromBank = rows.filter((r) => r.t.source === "bank").length;
  return (
    <>
      <p className="m-0 text-[13px] text-ink-muted">
        {rows.length} sual yeri ({fromBank} — sual bankından, {rows.length - fromBank} — düsturla); turda ilk {c.questionCount} yer istifadə olunur. Sual bankı yerində hər
        iştirakçıya həmin mövzunun qapalı suallarından təsadüfi biri düşür, variantların yeri dəyişdirilir ki, düzgün cavablar A–E üzrə bərabər paylansın.
      </p>
      <ol className="m-0 grid list-none gap-3 p-0">
        {rows.map((r) => (
          <li key={r.t.id} className="grid gap-2 rounded-[16px] border border-line bg-white p-4">
            <div className="flex flex-wrap items-baseline justify-between gap-2">
              <b>
                №{r.t.n} · {r.topic ?? "mövzusuz"} · {r.t.timeSec} s ·{" "}
                <span className={r.t.source === "bank" ? "text-success-700" : "text-ink-muted"}>{r.t.source === "bank" ? "Sual bankından" : "Düsturla"}</span>
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
            {r.t.source === "bank" ? <BankPreview r={r} bank={closed} /> : <FormulaPreview r={r} />}
            {editId === r.t.id && <TemplateForm c={c} r={r} topics={topics} />}
          </li>
        ))}
      </ol>
      <details className="rounded-[16px] border border-line bg-white p-4" open={rows.length === 0}>
        <summary className="cursor-pointer font-bold">+ Yeni sual yeri</summary>
        <TemplateForm c={c} topics={topics} />
      </details>
    </>
  );
}

/** Mövzuda neçə qapalı sual var və 2 nümunə (düzgün cavab qalın). */
function BankPreview({ r, bank }: { r: Row; bank: Bank }) {
  const pool = bank.filter((b) => b.topicId === r.t.topicId);
  if (!pool.length) return <p className="m-0 rounded-md bg-danger-100 p-2.5 text-[13px] text-danger-700">Bu mövzuda sual bankında qapalı sual yoxdur.</p>;
  return (
    <div className="grid gap-2">
      <p className="m-0 text-[13px] text-ink-muted">Mövzuda {pool.length} qapalı sual — iştirakçılar bunlardan fərqli suallar alır. Nümunələr:</p>
      <ul className="m-0 grid list-none gap-2 p-0 lg:grid-cols-2">
        {shuffle(pool)
          .slice(0, 2)
          .map((b) => (
            <li key={b.code} className="rounded-md bg-navy-050 p-2.5 text-[13px]">
              <span className="font-mono text-[11px] font-bold text-ink-muted">{b.code} </span>
              <MathText text={b.body} />
              <span className="mt-1 flex flex-wrap gap-x-3">
                {LETTERS.map((l) => (
                  <span key={l} className={l === b.correct ? "font-bold text-success-700" : ""}>
                    {l}) <MathText text={b.options![l]} />
                  </span>
                ))}
              </span>
            </li>
          ))}
      </ul>
    </div>
  );
}

/** 3 variant (hər iştirakçıya fərqli rəqəmlər) — düzgün cavab qalın. */
function FormulaPreview({ r }: { r: Row }) {
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
          Mənbə
          <select name="source" defaultValue={t?.source ?? "bank"} className={input}>
            <option value="bank">Sual bankından (mövzu üzrə)</option>
            <option value="formula">Düsturla (şablon)</option>
          </select>
        </label>
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
      <details className="rounded-md border border-line p-3" open={t?.source === "formula"}>
        <summary className="cursor-pointer text-[13px] font-semibold">Düstur şablonu (yalnız “Düsturla” mənbəsi üçün)</summary>
        <div className="mt-2 grid gap-2">
          <p className="m-0 text-[12.5px] text-ink-muted">
            Mətndə <code>[[a]]</code> — dəyişən, <code>[[=a*b]]</code> — hesablanan qiymət (LaTeX: $…$). Dəyişənlər JSON: <code>{`{"a":[min,max,addım]}`}</code>. İfadələrdə: + − * / % ^,
            gcd, lcm, sqrt, abs, min, max, floor, ceil, round, müqayisə və && ||.
          </p>
          <label className={lbl}>
            Sualın mətni
            <textarea name="body" rows={2} defaultValue={t?.body} className={`${input} py-2`} placeholder="Məhsulun qiyməti [[a]] manat idi. Qiymət [[p]]% artırıldı…" />
          </label>
          <div className="grid gap-2 md:grid-cols-3">
            <label className={lbl}>
              Dəyişənlər (JSON)
              <input name="vars" defaultValue={t?.vars} className={`${input} font-mono`} placeholder='{"a":[40,400,20],"p":[5,50,5]}' />
            </label>
            <label className={lbl}>
              Şərt (könüllü)
              <input name="condition" defaultValue={t?.condition ?? ""} className={`${input} font-mono`} placeholder="(a*p) % 100 == 0" />
            </label>
            <label className={lbl}>
              Düzgün cavab (ifadə)
              <input name="answer" defaultValue={t?.answer} className={`${input} font-mono`} placeholder="a + a*p/100" />
            </label>
          </div>
          <label className={lbl}>
            Yanlış variantlar — hər sətirdə bir ifadə (tipik səhvlər)
            <textarea name="distractors" rows={4} defaultValue={t ? (JSON.parse(t.distractors) as string[]).join("\n") : ""} className={`${input} py-2 font-mono`} />
          </label>
          <label className={lbl}>
            Həll (tur bitəndən sonra göstərilir)
            <textarea name="solution" rows={2} defaultValue={t?.solution} className={`${input} py-2`} />
          </label>
        </div>
      </details>
      <button className={`${btn} justify-self-start`}>{t ? "Saxla" : "Əlavə et"}</button>
    </form>
  );
}
