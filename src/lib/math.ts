// LaTeX köməkçiləri: mətnin `$…$` hissələri KaTeX ilə render olunur.

export type MathPart = { kind: "text" | "math"; value: string; bold: boolean };

/** `**qalın**` və `$düstur$` hissələrinə bölür. */
export function splitMath(input: string): MathPart[] {
  const out: MathPart[] = [];
  input.split("**").forEach((chunk, i) => {
    const bold = i % 2 === 1;
    chunk.split(/(\$[^$]+\$)/g).forEach((piece) => {
      if (!piece) return;
      if (piece.startsWith("$") && piece.endsWith("$") && piece.length > 2) {
        out.push({ kind: "math", value: piece.slice(1, -1), bold });
      } else {
        out.push({ kind: "text", value: piece, bold });
      }
    });
  });
  return out;
}

const SUP: Record<string, string> = { "0": "⁰", "1": "¹", "2": "²", "3": "³", "4": "⁴", "5": "⁵", "6": "⁶", "7": "⁷", "8": "⁸", "9": "⁹", n: "ⁿ", "-": "⁻" };
const SUB: Record<string, string> = { "0": "₀", "1": "₁", "2": "₂", "3": "₃", "4": "₄", "5": "₅", "6": "₆", "7": "₇", "8": "₈", "9": "₉", n: "ₙ" };
const map = (s: string, table: Record<string, string>) =>
  [...s].every((c) => table[c]) ? [...s].map((c) => table[c]).join("") : null;

/** Ekran oxucu üçün (aria-label): LaTeX → oxunaqlı mətn. Layihədə istifadə olunan alt dəst. */
export function latexToText(input: string): string {
  return input
    .replace(/\$([^$]+)\$/g, (_, tex: string) => {
      let s = tex;
      for (let i = 0; i < 3; i++) {
        s = s
          .replace(/\\frac\{([^{}]*)\}\{([^{}]*)\}/g, "$1/$2")
          .replace(/\\sqrt\{([^{}]*)\}/g, "√$1");
      }
      s = s
        .replace(/\^\\circ/g, "°")
        .replace(/\^\{([^{}]+)\}|\^(\w)/g, (m, a, b) => map(a ?? b, SUP) ?? `^${a ?? b}`)
        .replace(/_\{([^{}]+)\}|_(\w)/g, (m, a, b) => map(a ?? b, SUB) ?? `_${a ?? b}`)
        .replace(/\\operatorname\{([^{}]+)\}/g, "$1")
        .replace(/\\alpha/g, "α")
        .replace(/\\gamma/g, "γ")
        .replace(/\\pi/g, "π")
        .replace(/\\cdot/g, "·")
        .replace(/\\Rightarrow/g, "⇒")
        .replace(/\\pm/g, "±")
        .replace(/\\%/g, "%")
        .replace(/\{,\}/g, ",")
        .replace(/\\[,;! ]/g, " ")
        .replace(/\\([a-zA-Z]+)/g, "$1")
        .replace(/[{}]/g, "");
      return s.replace(/\s+/g, " ").trim();
    })
    .replace(/\*\*/g, "");
}
