import { MathText } from "@/components/ui/math-text";
import { az } from "@/content/az";
import { decodeMatching, MAX_TEXT_ANSWER, type MatchingOptions, type PracticeFormat } from "@/lib/bank/check";
import { cn } from "@/lib/cn";
import { LETTERS, type Letter } from "@/lib/demo/content";
import { latexToText } from "@/lib/math";

type Props = {
  /** Sahənin adı: qapalı/açıq — name, uyğunluq — name-1, name-2… (readFormAnswer ilə oxunur). */
  name: string;
  legend: string;
  q: { format: PracticeFormat; options?: Record<Letter, string>; matching?: MatchingOptions };
  /** Qapalı sual: göstərilən hərfin mətni (variantların yeri dəyişdirilə bilər). */
  optionText?: (l: Letter) => string;
  defaultValue?: string;
  disabled?: boolean;
};

const choiceClass = cn(
  "flex min-h-12 cursor-pointer items-center gap-2 rounded-md border-[1.5px] px-3 py-2",
  "border-control-border bg-white text-navy-900 has-checked:border-navy-900 has-checked:bg-navy-900 has-checked:text-white",
  "has-focus-visible:outline-3 has-focus-visible:outline-offset-2 has-focus-visible:outline-navy-500",
);

/** Bir formada bir neçə bank sualı (repetitor sınağı, zəif mövzu məşqi) — formata görə cavab sahəsi. */
export function FormAnswerFields({ name, legend, q, optionText, defaultValue, disabled }: Props) {
  const ta = az.app.answer;
  if (q.format === "closed" && q.options) {
    const text = optionText ?? ((l: Letter) => q.options![l]);
    return (
      <fieldset className="m-0 grid min-w-0 gap-2 border-0 p-0 sm:grid-cols-2" disabled={disabled}>
        <legend className="sr-only">{legend}</legend>
        {LETTERS.map((l) => (
          <label key={l} className={choiceClass}>
            <input
              type="radio"
              name={name}
              value={l}
              defaultChecked={defaultValue === l}
              className="sr-only"
              aria-label={az.app.daily.option(l, latexToText(text(l)))}
            />
            <b>{l})</b>
            <MathText text={text(l)} displayStyle />
          </label>
        ))}
      </fieldset>
    );
  }
  if (q.format === "matching" && q.matching) {
    const sel = decodeMatching(defaultValue ?? "");
    return (
      <fieldset className="m-0 grid min-w-0 gap-3 border-0 p-0" disabled={disabled}>
        <legend className="mb-1 text-small text-ink-muted">{ta.matchingHint}</legend>
        <ul className="m-0 grid list-none gap-1.5 rounded-md bg-navy-050 p-3 text-small">
          {q.matching.right.map((r) => (
            <li key={r.key} className="flex gap-2">
              <b className="text-navy-900">{r.key})</b>
              <MathText text={r.text} />
            </li>
          ))}
        </ul>
        {q.matching.left.map((item) => (
          <div key={item.key} role="group" aria-label={ta.matchingItem(item.key)} className="grid gap-2">
            <p className="m-0 flex gap-2 font-semibold text-navy-900">
              <b>{item.key}.</b>
              <MathText text={item.text} />
            </p>
            <div className="flex flex-wrap gap-2">
              {q.matching!.right.map((r) => (
                <label key={r.key} className={cn(choiceClass, "size-11 min-h-11 justify-center p-0 font-display font-extrabold")}>
                  <input
                    type="checkbox"
                    name={`${name}-${item.key}`}
                    value={r.key}
                    defaultChecked={(sel[item.key] ?? []).includes(r.key)}
                    className="sr-only"
                    aria-label={ta.matchingPick(item.key, r.key)}
                  />
                  {r.key}
                </label>
              ))}
            </div>
          </div>
        ))}
      </fieldset>
    );
  }
  return (
    <div className="grid gap-1.5">
      <label htmlFor={`${name}-in`} className="text-small font-semibold text-navy-900">
        {ta.openLabel}
      </label>
      <input
        id={`${name}-in`}
        name={name}
        type="text"
        autoComplete="off"
        maxLength={MAX_TEXT_ANSWER}
        defaultValue={defaultValue}
        disabled={disabled}
        placeholder={ta.openPlaceholder}
        aria-describedby={`${name}-hint`}
        className="min-h-12 w-full max-w-xs rounded-md border-[1.5px] border-control-border bg-white px-3 font-display text-lg font-extrabold text-navy-900 focus-visible:outline-3 focus-visible:outline-offset-2 focus-visible:outline-navy-500"
      />
      <p id={`${name}-hint`} className="text-caption text-ink-muted">
        {ta.openHint}
      </p>
    </div>
  );
}
