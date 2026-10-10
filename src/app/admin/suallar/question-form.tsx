"use client";

import { useActionState, useState } from "react";
import { MathText } from "@/components/ui/math-text";
import { saveQuestionAction, type QuestionFormState } from "@/lib/admin/actions";
import { LETTERS } from "@/lib/demo/content";
import { cn } from "@/lib/cn";

export type QuestionInitial = {
  code?: string;
  topicId: number;
  subtopicId: number | null;
  format: "closed" | "open" | "matching" | "written";
  body: string;
  options: Record<string, string>;
  correct: string;
  answerValue: string;
  matchingJson: string;
  matchingAnswer: string;
  solution: string;
  imageUrl: string;
  imageAlt: string;
  difficulty: number;
  points: number;
  status: string;
};

const input = "min-h-10 w-full rounded-md border-[1.5px] border-control-border bg-white px-2.5 text-[14px]";
const area = "w-full rounded-md border-[1.5px] border-control-border bg-white px-2.5 py-2 font-mono text-[13.5px] leading-[1.5]";
const label = "grid gap-1 text-[13px] font-semibold text-navy-900";

/** Sual redaktoru: LaTeX ($...$) — sağda canlı önizləmə (saytdakı kimi KaTeX). */
export function QuestionForm({
  initial,
  topics,
  subtopics,
}: {
  initial: QuestionInitial;
  topics: Array<{ id: number; name: string }>;
  subtopics: Array<{ id: number; topicId: number; title: string }>;
}) {
  const [state, action, pending] = useActionState<QuestionFormState, FormData>(saveQuestionAction, undefined);
  const [v, setV] = useState(initial);
  const set = <K extends keyof QuestionInitial>(k: K, val: QuestionInitial[K]) => setV((s) => ({ ...s, [k]: val }));

  return (
    <form action={action} className="grid gap-5 xl:grid-cols-[minmax(0,1fr)_minmax(0,1fr)]">
      {v.code && <input type="hidden" name="code" value={v.code} />}
      <div className="grid content-start gap-3 rounded-[16px] border border-line bg-white p-4">
        {state?.error && (
          <p role="alert" className="m-0 rounded-md bg-danger-100 px-3 py-2 text-[14px] font-semibold text-danger-700">
            {state.error}
          </p>
        )}
        <div className="grid gap-3 sm:grid-cols-2">
          <label className={label}>
            Mövzu
            <select
              name="topicId"
              value={v.topicId}
              onChange={(e) => setV((s) => ({ ...s, topicId: Number(e.target.value), subtopicId: null }))}
              className={input}
            >
              {topics.map((t) => (
                <option key={t.id} value={t.id}>
                  {t.name}
                </option>
              ))}
            </select>
          </label>
          <label className={label}>
            Alt mövzu
            <select name="subtopicId" value={v.subtopicId ?? ""} onChange={(e) => set("subtopicId", e.target.value ? Number(e.target.value) : null)} className={input}>
              <option value="">— yoxdur —</option>
              {subtopics
                .filter((s) => s.topicId === v.topicId)
                .map((s) => (
                  <option key={s.id} value={s.id}>
                    {s.title}
                  </option>
                ))}
            </select>
          </label>
          <label className={label}>
            Format
            <select name="format" value={v.format} onChange={(e) => set("format", e.target.value as QuestionInitial["format"])} className={input}>
              <option value="closed">Qapalı (A–E)</option>
              <option value="open">Açıq (kodlaşdırılan cavab)</option>
              <option value="written">Yazılı (ətraflı həll)</option>
              <option value="matching">Uyğunluq</option>
            </select>
          </label>
          <div className="grid grid-cols-3 gap-2">
            <label className={label}>
              Çətinlik
              <select name="difficulty" value={v.difficulty} onChange={(e) => set("difficulty", Number(e.target.value))} className={input}>
                {[1, 2, 3].map((d) => (
                  <option key={d}>{d}</option>
                ))}
              </select>
            </label>
            <label className={label}>
              Bal
              <input name="points" type="number" step="0.5" min="0" max="20" value={v.points} onChange={(e) => set("points", Number(e.target.value))} className={input} />
            </label>
            <label className={label}>
              Status
              <select name="status" value={v.status} onChange={(e) => set("status", e.target.value)} className={input}>
                <option value="published">Dərc</option>
                <option value="draft">Qaralama</option>
              </select>
            </label>
          </div>
        </div>
        <label className={label}>
          Sualın mətni (LaTeX: $x^2$, $\dfrac&#123;a&#125;&#123;b&#125;$)
          <textarea name="body" rows={5} value={v.body} onChange={(e) => set("body", e.target.value)} required className={area} />
        </label>
        {v.format === "closed" && (
          <fieldset className="m-0 grid gap-2 border-0 p-0">
            <legend className="mb-1 text-[13px] font-semibold text-navy-900">Variantlar və düzgün cavab</legend>
            {LETTERS.map((l) => (
              <div key={l} className="flex items-center gap-2">
                <label className="flex items-center gap-1.5 text-[14px] font-bold">
                  <input type="radio" name="correct" value={l} checked={v.correct === l} onChange={() => set("correct", l)} />
                  {l}
                </label>
                <input
                  name={`opt${l}`}
                  aria-label={`Variant ${l}`}
                  value={v.options[l] ?? ""}
                  onChange={(e) => set("options", { ...v.options, [l]: e.target.value })}
                  className={cn(input, "font-mono")}
                />
              </div>
            ))}
          </fieldset>
        )}
        {(v.format === "open" || v.format === "written") && (
          <label className={label}>
            {v.format === "open" ? "Cavab (kodlaşdırılan: ədəd, məs. -12,5)" : "Yekun cavab (istəyə bağlı)"}
            <input name="answerValue" value={v.answerValue} onChange={(e) => set("answerValue", e.target.value)} className={cn(input, "font-mono")} />
          </label>
        )}
        {v.format === "matching" && (
          <>
            <label className={label}>
              Sütunlar (JSON: &#123;&quot;left&quot;: [...], &quot;right&quot;: [...]&#125;)
              <textarea name="matchingJson" rows={5} value={v.matchingJson} onChange={(e) => set("matchingJson", e.target.value)} className={area} />
            </label>
            <label className={label}>
              Cavab (JSON: &#123;&quot;1&quot;: [&quot;a&quot;]&#125;)
              <textarea name="matchingAnswer" rows={2} value={v.matchingAnswer} onChange={(e) => set("matchingAnswer", e.target.value)} className={area} />
            </label>
          </>
        )}
        <label className={label}>
          Həll (LaTeX)
          <textarea name="solution" rows={4} value={v.solution} onChange={(e) => set("solution", e.target.value)} className={area} />
        </label>
        <div className="grid gap-3 sm:grid-cols-2">
          <label className={label}>
            Şəkil (URL, məs. /images/tasks/FNT-0031.png)
            <input name="imageUrl" value={v.imageUrl} onChange={(e) => set("imageUrl", e.target.value)} className={input} />
          </label>
          <label className={label}>
            Şəklin təsviri
            <input name="imageAlt" value={v.imageAlt} onChange={(e) => set("imageAlt", e.target.value)} className={input} />
          </label>
        </div>
        <button disabled={pending} className="min-h-11 cursor-pointer rounded-md bg-navy-900 px-4 font-bold text-white disabled:opacity-60">
          {pending ? "Saxlanılır…" : "Saxla"}
        </button>
      </div>

      <section aria-label="Önizləmə" className="grid content-start gap-3 rounded-[16px] border border-dashed border-navy-200 bg-navy-050 p-4 xl:sticky xl:top-4">
        <span className="text-[12px] font-bold tracking-[0.06em] text-navy-900 uppercase">Önizləmə</span>
        <p className="m-0 text-[17px] leading-[1.65] text-ink">
          <MathText text={v.body || "—"} />
        </p>
        {v.imageUrl && (
          // eslint-disable-next-line @next/next/no-img-element -- önizləmə: istənilən URL
          <img src={v.imageUrl} alt={v.imageAlt} className="max-h-[260px] w-auto max-w-full justify-self-center rounded-md border border-line bg-white p-2" />
        )}
        {v.format === "closed" && (
          <ol className="m-0 grid list-none gap-1.5 p-0 sm:grid-cols-2">
            {LETTERS.map((l) => (
              <li
                key={l}
                className={cn(
                  "flex items-center gap-2 rounded-md border-[1.5px] bg-white px-3 py-2",
                  v.correct === l ? "border-success-700" : "border-line",
                )}
              >
                <b>{l})</b>
                <MathText text={v.options[l] || "—"} displayStyle />
              </li>
            ))}
          </ol>
        )}
        {v.answerValue && v.format !== "closed" && (
          <p className="m-0 text-[14px]">
            <b>Cavab:</b> <MathText text={v.answerValue} displayStyle />
          </p>
        )}
        {v.solution && (
          <div className="rounded-md bg-white p-3 text-[14px] leading-[1.6]">
            <b>Həll:</b> <MathText text={v.solution} />
          </div>
        )}
      </section>
    </form>
  );
}
