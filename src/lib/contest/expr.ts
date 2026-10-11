// Yarış şablonları üçün kiçik ifadə hesablayıcısı (eval yoxdur): rəqəmlər, dəyişənlər, + - * / % ^,
// müqayisə (== != < <= > >=), && ||, mötərizə və funksiyalar: sqrt, abs, min, max, floor, ceil, round, gcd, lcm.
// Məntiqi nəticə 1 / 0 kimi qaytarılır. Təmiz funksiyalar — server və testlər.

type Token = { t: "num"; v: number } | { t: "id"; v: string } | { t: "op"; v: string };

const OPS = ["&&", "||", "==", "!=", "<=", ">=", "<", ">", "+", "-", "*", "/", "%", "^", "(", ")", ","];

function tokenize(src: string): Token[] {
  const out: Token[] = [];
  let i = 0;
  while (i < src.length) {
    const c = src[i];
    if (/\s/.test(c)) {
      i++;
      continue;
    }
    if (/[0-9.]/.test(c)) {
      const m = /^\d*\.?\d+(e[+-]?\d+)?/i.exec(src.slice(i));
      if (!m) throw new Error(`Yanlış ədəd: ${src.slice(i, i + 8)}`);
      out.push({ t: "num", v: Number(m[0]) });
      i += m[0].length;
      continue;
    }
    if (/[a-z_]/i.test(c)) {
      const m = /^[a-z_][a-z0-9_]*/i.exec(src.slice(i))!;
      out.push({ t: "id", v: m[0] });
      i += m[0].length;
      continue;
    }
    const op = OPS.find((o) => src.startsWith(o, i));
    if (!op) throw new Error(`Naməlum simvol: ${c}`);
    out.push({ t: "op", v: op });
    i += op.length;
  }
  return out;
}

const gcd = (a: number, b: number): number => (b === 0 ? Math.abs(a) : gcd(b, a % b));
const FUNCS: Record<string, (...xs: number[]) => number> = {
  sqrt: Math.sqrt,
  abs: Math.abs,
  min: Math.min,
  max: Math.max,
  floor: Math.floor,
  ceil: Math.ceil,
  round: Math.round,
  gcd: (a, b) => gcd(a, b),
  lcm: (a, b) => Math.abs(a * b) / gcd(a, b),
};

// Prioritet (aşağıdan yuxarı): || → && → müqayisə → + - → * / % → ^ (sağdan) → unar −
const BIN: Record<string, number> = { "||": 1, "&&": 2, "==": 3, "!=": 3, "<": 3, "<=": 3, ">": 3, ">=": 3, "+": 4, "-": 4, "*": 5, "/": 5, "%": 5, "^": 7 };

function apply(op: string, a: number, b: number): number {
  switch (op) {
    case "||": return a || b ? 1 : 0;
    case "&&": return a && b ? 1 : 0;
    case "==": return Math.abs(a - b) < 1e-9 ? 1 : 0;
    case "!=": return Math.abs(a - b) >= 1e-9 ? 1 : 0;
    case "<": return a < b ? 1 : 0;
    case "<=": return a <= b ? 1 : 0;
    case ">": return a > b ? 1 : 0;
    case ">=": return a >= b ? 1 : 0;
    case "+": return a + b;
    case "-": return a - b;
    case "*": return a * b;
    case "/": return a / b;
    case "%": return a % b;
    case "^": return a ** b;
  }
  throw new Error(`Naməlum əməl: ${op}`);
}

/** İfadəni dəyişənlərlə hesablayır. Xəta olsa — istisna. */
export function evaluate(src: string, vars: Record<string, number> = {}): number {
  const tokens = tokenize(src);
  let pos = 0;
  const peek = () => tokens[pos];
  const next = () => tokens[pos++];
  const expect = (v: string) => {
    const t = next();
    if (!t || t.t !== "op" || t.v !== v) throw new Error(`"${v}" gözlənilirdi`);
  };

  const primary = (): number => {
    const t = next();
    if (!t) throw new Error("İfadə yarımçıqdır");
    if (t.t === "num") return t.v;
    if (t.t === "op" && t.v === "-") return -unary();
    if (t.t === "op" && t.v === "(") {
      const v = expr(0);
      expect(")");
      return v;
    }
    if (t.t === "id") {
      const p = peek();
      if (p?.t === "op" && p.v === "(") {
        const fn = FUNCS[t.v];
        if (!fn) throw new Error(`Naməlum funksiya: ${t.v}`);
        next();
        const args: number[] = [];
        if (!(peek()?.t === "op" && peek()!.v === ")")) {
          args.push(expr(0));
          while (peek()?.t === "op" && peek()!.v === ",") {
            next();
            args.push(expr(0));
          }
        }
        expect(")");
        return fn(...args);
      }
      if (!(t.v in vars)) throw new Error(`Naməlum dəyişən: ${t.v}`);
      return vars[t.v];
    }
    throw new Error(`Gözlənilməz: ${t.v}`);
  };
  const unary = (): number => primary();

  const expr = (minPrec: number): number => {
    let left = primary();
    for (;;) {
      const t = peek();
      if (!t || t.t !== "op" || !(t.v in BIN)) break;
      const prec = BIN[t.v];
      if (prec < minPrec) break;
      next();
      // ^ — sağdan assosiativ
      const right = expr(t.v === "^" ? prec : prec + 1);
      left = apply(t.v, left, right);
    }
    return left;
  };

  const v = expr(0);
  if (pos !== tokens.length) throw new Error("İfadənin sonunda artıq simvol var");
  return v;
}

/** Ədədin göstərilməsi: tam — olduğu kimi, kəsr — ən çox 2 rəqəm, vergüllə (12,5). */
export function formatNum(v: number): string {
  if (Number.isInteger(v)) return String(v);
  return String(Math.round(v * 100) / 100).replace(".", ",");
}

/**
 * Mətndə [[a]] — dəyişənin qiyməti, [[=a*b]] — ifadənin nəticəsi.
 * Kvadrat mötərizə seçilib ki, LaTeX-in {…} mötərizələri ilə qarışmasın (\frac{[[a]]}{[[b]]}).
 */
export function renderTemplate(text: string, vars: Record<string, number>): string {
  return text.replace(/\[\[(=?)([^[\]]+)\]\]/g, (_, eq: string, body: string) => {
    const key = body.trim();
    return formatNum(!eq && key in vars ? vars[key] : evaluate(key, vars));
  });
}
