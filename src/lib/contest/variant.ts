import { evaluate, formatNum, renderTemplate } from "./expr";

// İştirakçının variantı: şablondan təsadüfi rəqəmlər → mətn, 5 variant (A–E), düzgün cavab.
// Cavab yoxlanılır: sonlu ədəd, şərt ödənir, 5 variant bir-birindən fərqlidir. Təmiz funksiyalar.

export const LETTERS = ["A", "B", "C", "D", "E"] as const;
export type ContestLetter = (typeof LETTERS)[number];

export type TemplateInput = {
  body: string;
  /** {"a":[min,max,addım]} */
  vars: Record<string, [number, number, number?]>;
  condition?: string | null;
  answer: string;
  distractors: string[];
  solution?: string;
};

export type Variant = {
  values: Record<string, number>;
  text: string;
  options: Record<ContestLetter, string>;
  correct: ContestLetter;
  solution: string;
};

const pick = (min: number, max: number, step: number, rand: () => number) => {
  const n = Math.floor((max - min) / step) + 1;
  return Math.round((min + Math.floor(rand() * n) * step) * 1e6) / 1e6;
};

/** Şablondan bir variant; uyğun rəqəmlər tapılmasa — null (şablonu yoxlamaq lazımdır). */
export function makeVariant(t: TemplateInput, target: ContestLetter, rand: () => number = Math.random, tries = 200): Variant | null {
  for (let k = 0; k < tries; k++) {
    const values: Record<string, number> = {};
    for (const [name, [min, max, step = 1]] of Object.entries(t.vars)) values[name] = pick(min, max, step, rand);
    try {
      if (t.condition && !evaluate(t.condition, values)) continue;
      const answer = evaluate(t.answer, values);
      if (!Number.isFinite(answer)) continue;
      const right = formatNum(answer);
      // Yanlış variantlar: ifadələr, sonra lazım olsa cavaba yaxın ədədlər.
      const wrong: string[] = [];
      for (const d of t.distractors) {
        const v = evaluate(d, values);
        const s = Number.isFinite(v) ? formatNum(v) : null;
        if (s && s !== right && !wrong.includes(s)) wrong.push(s);
      }
      for (let delta = 1; wrong.length < 4 && delta < 50; delta++) {
        for (const v of [answer + delta, answer - delta]) {
          const s = formatNum(v);
          if (wrong.length < 4 && s !== right && !wrong.includes(s)) wrong.push(s);
        }
      }
      if (wrong.length < 4) continue;
      const shuffled = shuffle(wrong.slice(0, 4), rand);
      const options = {} as Record<ContestLetter, string>;
      for (const l of LETTERS) options[l] = l === target ? right : shuffled.pop()!;
      return {
        values,
        text: renderTemplate(t.body, values),
        options,
        correct: target,
        solution: t.solution ? renderTemplate(t.solution, values) : "",
      };
    } catch {
      continue;
    }
  }
  return null;
}

export function shuffle<T>(xs: T[], rand: () => number = Math.random): T[] {
  const a = [...xs];
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(rand() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a;
}

/** Düzgün cavabların hərfləri: A–E bərabər paylanır (20 sual → hər hərf 4 dəfə), sırası qarışıq. */
export function spreadLetters(count: number, rand: () => number = Math.random): ContestLetter[] {
  const base = Array.from({ length: count }, (_, i) => LETTERS[i % LETTERS.length]);
  return shuffle(base, rand);
}
