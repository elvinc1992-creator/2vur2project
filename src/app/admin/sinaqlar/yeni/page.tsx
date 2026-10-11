import type { Metadata } from "next";
import Link from "next/link";
import { MathText } from "@/components/ui/math-text";
import { createExamAction } from "@/lib/admin/actions";
import { topicOptions } from "@/lib/admin/queries";
import { DEFAULT_DURATION, sectionsOf, TOPIC_EXAM_COUNTS } from "@/lib/exams/create";
import type { ItemFormat } from "@/lib/exams/generate";
import { listExamKinds } from "@/lib/exams/source";
import { priceText } from "@/lib/exams/types";
import { pickLists } from "../data";
import { Notice, PageHead, btn, btnGhost, input } from "../../ui";
import { PickCounter } from "./pick-counter";

export const metadata: Metadata = { title: "Yeni sınaq" };

const FORMAT: Record<ItemFormat, string> = { closed: "Qapalı", coded: "Açıq (kodlaşdırılan)", written: "Yazılı (izahlı)" };
const ERRORS: Record<string, string> = {
  say: "Mövzu sınağında ən azı bir sual olmalıdır.",
  movzu: "Mövzu seçilməyib.",
  bos: "Bu sınaq üçün bankda uyğun sual tapılmadı.",
  "cox-closed": "Qapalı bölmə üçün lazım olandan çox sual seçilib.",
  "cox-coded": "Açıq bölmə üçün lazım olandan çox sual seçilib.",
  "cox-written": "Yazılı bölmə üçün lazım olandan çox sual seçilib.",
};

/**
 * Yeni sınaq: 1) tip (mövzu sınağında — mövzu) seçilir; 2) ad, müddət, (mövzu sınağı: bölmələrin sayı) və istəyə görə
 * sualların əl ilə seçimi. "Sınağı yarat" — sınaq passiv statusda yaranır; seçilməyən yerlər avtomatik doldurulur.
 */
export default async function NewExam(props: PageProps<"/admin/sinaqlar/yeni">) {
  const sp = await props.searchParams;
  const [kinds, topics] = await Promise.all([listExamKinds(), topicOptions()]);
  const kind = kinds.find((k) => k.key === sp.tip);
  const topicId = Number(sp.movzu) || undefined;
  const topic = topics.find((t) => t.id === topicId);
  const ready = kind && (kind.key !== "movzu" || topic);

  return (
    <>
      <PageHead title="Yeni sınaq" lead="Əvvəl sınağın tipini seç. Sualları özün seçə bilərsən — seçmədiyin yerlər bankdan avtomatik (təkrarsız) doldurulur.">
        <Link href="/admin/sinaqlar" className={btnGhost}>
          ← Sınaqlar
        </Link>
      </PageHead>
      {typeof sp.xeta === "string" && ERRORS[sp.xeta] && <Notice tone="error">{ERRORS[sp.xeta]}</Notice>}

      <form method="get" className="flex flex-wrap items-end gap-2 rounded-[16px] border border-line bg-white p-4">
        <label className="grid flex-1 gap-1 text-[13px] font-semibold">
          Sınağın tipi
          <select name="tip" defaultValue={kind?.key ?? ""} className={input} required>
            <option value="" disabled>
              — seç —
            </option>
            {kinds.map((k) => (
              <option key={k.key} value={k.key}>
                {k.name} · {priceText(k.price)}
              </option>
            ))}
          </select>
        </label>
        <label className="grid flex-1 gap-1 text-[13px] font-semibold">
          Mövzu (yalnız mövzu sınağı üçün)
          <select name="movzu" defaultValue={topic?.id ?? ""} className={input}>
            <option value="">—</option>
            {topics.map((t) => (
              <option key={t.id} value={t.id}>
                {t.name}
              </option>
            ))}
          </select>
        </label>
        <button className={btnGhost}>Davam et</button>
      </form>
      {kind?.key === "movzu" && !topic && <Notice tone="error">Mövzu sınağı üçün mövzu seç.</Notice>}

      {ready && <ExamForm kind={kind.key} kindName={kind.name} topicId={topic?.id} topicName={topic?.name} />}
    </>
  );
}

async function ExamForm({ kind, kindName, topicId, topicName }: { kind: string; kindName: string; topicId?: number; topicName?: string }) {
  const isTopic = kind === "movzu";
  const [sections, lists] = await Promise.all([sectionsOf(kind), pickLists(kind, topicId)]);
  const formats: ItemFormat[] = isTopic ? ["closed", "coded", "written"] : sections.map((s) => s.format);
  const countOf = (f: ItemFormat) => sections.find((s) => s.format === f);

  return (
    <form action={createExamAction} className="grid gap-4">
      <input type="hidden" name="kind" value={kind} />
      {topicId && <input type="hidden" name="topicId" value={topicId} />}
      <section aria-labelledby="exam-main" className="grid gap-3 rounded-[16px] border border-line bg-white p-4">
        <h2 id="exam-main" className="m-0 text-[17px] font-extrabold text-navy-900">
          {kindName}
          {topicName ? `: ${topicName}` : ""}
        </h2>
        <div className="flex flex-wrap items-end gap-2">
          <label className="grid min-w-[260px] flex-1 gap-1 text-[13px] font-semibold">
            Ad (boş qalsa — avtomatik, nömrə ilə)
            <input name="title" maxLength={120} className={input} placeholder={isTopic ? `Mövzu sınağı: ${topicName} №…` : `${kindName} sınağı №…`} />
          </label>
          <label className="grid gap-1 text-[13px] font-semibold">
            Müddət (dəq)
            <input name="durationMin" type="number" min={10} max={300} defaultValue={DEFAULT_DURATION[kind] ?? 90} className={`${input} w-28`} />
          </label>
          {isTopic &&
            (["closed", "coded", "written"] as const).map((f) => (
              <label key={f} className="grid gap-1 text-[13px] font-semibold">
                {FORMAT[f]}
                <input name={f} type="number" min={0} max={f === "closed" ? 60 : 30} defaultValue={TOPIC_EXAM_COUNTS[f]} className={`${input} w-24`} />
              </label>
            ))}
        </div>
        {!isTopic && (
          <p className="m-0 text-[13px] text-ink-muted">
            Quruluş: {sections.map((s) => `${FORMAT[s.format]} ${s.count} (№${s.firstNo}–${s.firstNo + s.count - 1})`).join(" · ")}
          </p>
        )}
        <PickCounter sections={formats.map((f) => ({ format: f, label: FORMAT[f], count: isTopic ? null : (countOf(f)?.count ?? 0) }))} />
        <p className="m-0 text-[13px] text-ink-muted">Sınaq passiv statusda yaranır — saytda görünməsi üçün sonra statusu “Aktiv” et.</p>
        <button className={`${btn} justify-self-start`}>Sınağı yarat</button>
      </section>

      {formats.map((f) => (
        <fieldset key={f} className="m-0 grid min-w-0 gap-2 rounded-[16px] border border-line bg-white p-4">
          <legend className="px-1 text-[15px] font-extrabold text-navy-900">
            {FORMAT[f]} suallar — əl ilə seçim (istəyə görə)
          </legend>
          {lists[f].length === 0 && <p className="m-0 text-[13px] text-ink-muted">Bankda bu bölməyə uyğun sual yoxdur.</p>}
          {lists[f].map((t) => (
            <details key={t.id} className="rounded-md border border-line">
              <summary className="cursor-pointer px-3 py-2 text-[14px] font-semibold">
                {t.name} <span className="font-normal text-ink-muted">({t.tasks.length} sual, istifadə olunmamış: {t.tasks.filter((x) => x.used === 0).length})</span>
              </summary>
              <ul className="m-0 grid list-none gap-1 p-2">
                {t.tasks.map((x) => (
                  <li key={x.code}>
                    <label className="flex cursor-pointer items-start gap-2 rounded-md px-2 py-1.5 hover:bg-navy-050">
                      <input type="checkbox" name={`pick-${f}`} value={x.code} className="mt-1 size-4 flex-none" />
                      <span className="font-mono text-[12px] font-bold whitespace-nowrap">{x.code}</span>
                      <span className="line-clamp-2 flex-1 text-[13px]">
                        <MathText text={x.body} />
                      </span>
                      <span className={`flex-none text-[12px] whitespace-nowrap ${x.used ? "text-warning-700" : "text-success-700"}`}>
                        {x.used ? `${x.used} sınaqda` : "yeni"}
                      </span>
                    </label>
                  </li>
                ))}
              </ul>
            </details>
          ))}
        </fieldset>
      ))}
    </form>
  );
}
