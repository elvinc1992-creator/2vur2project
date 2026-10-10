// Sual şəkillərindəki sadə TikZ-i (xətlər, düzbucaqlı, çevrə, nöqtə adları) SVG üçün həndəsəyə çevirir.
// Dəstəklənməyən əmr olarsa null qaytarır — şəkil göstərilmir, sual yenə görünür.

export type Pt = { x: number; y: number };
export type Anchor = "center" | "above" | "below" | "left" | "right" | "above left" | "above right" | "below left" | "below right";
export type TikzFigure = {
  polylines: { points: Pt[]; closed: boolean; dashed: boolean }[];
  circles: { c: Pt; r: number; dashed: boolean }[];
  labels: { at: Pt; anchor: Anchor; text: string }[];
  box: { minX: number; minY: number; maxX: number; maxY: number };
};

const ANCHORS = new Set<string>(["above", "below", "left", "right", "above left", "above right", "below left", "below right"]);
const NUM = String.raw`(-?\d*\.?\d+)`;
const POINT = new RegExp(String.raw`^\(\s*${NUM}\s*,\s*${NUM}\s*\)`);
const NAME = /^\(\s*([A-Za-z]\w*)\s*\)/;

/** `{…}` balanslı mötərizənin içi və sonrakı mövqe. */
function braced(s: string, from: number): [string, number] | null {
  if (s[from] !== "{") return null;
  let depth = 0;
  for (let i = from; i < s.length; i++) {
    if (s[i] === "{") depth++;
    else if (s[i] === "}" && --depth === 0) return [s.slice(from + 1, i), i + 1];
  }
  return null;
}

/** Əmrlərə böl (`;` ilə), `{…}` içindəki `;`-ə toxunmadan. */
function statements(body: string): string[] {
  const out: string[] = [];
  let depth = 0;
  let cur = "";
  for (const ch of body) {
    if (ch === "{") depth++;
    if (ch === "}") depth--;
    if (ch === ";" && depth === 0) {
      if (cur.trim()) out.push(cur.trim());
      cur = "";
    } else cur += ch;
  }
  if (cur.trim()) out.push(cur.trim());
  return out;
}

export function parseTikz(src: string): TikzFigure | null {
  const m = src.match(/\\begin\{tikzpicture\}(?:\[[^\]]*\])?([\s\S]*?)\\end\{tikzpicture\}/);
  if (!m) return null;
  const coords = new Map<string, Pt>();
  const fig: TikzFigure = { polylines: [], circles: [], labels: [], box: { minX: 0, minY: 0, maxX: 0, maxY: 0 } };

  const readPoint = (s: string): [Pt, number] | null => {
    const p = s.match(POINT);
    if (p) return [{ x: Number(p[1]), y: Number(p[2]) }, p[0].length];
    const n = s.match(NAME);
    if (n && coords.has(n[1])) return [coords.get(n[1])!, n[0].length];
    return null;
  };

  for (const st of statements(m[1])) {
    let s: string;
    if ((s = st.replace(/^\\coordinate\s*/, "")) !== st) {
      const c = s.match(/^\(\s*([A-Za-z]\w*)\s*\)\s*at\s*(.*)$/);
      const p = c && readPoint(c[2].trim());
      if (!c || !p) return null;
      coords.set(c[1], p[0]);
    } else if ((s = st.replace(/^\\node\s*/, "")) !== st) {
      const opt = s.match(/^\[([^\]]*)\]\s*/);
      const anchor = (opt?.[1].trim() ?? "center") as Anchor;
      if (anchor !== "center" && !ANCHORS.has(anchor)) return null;
      s = s.slice(opt?.[0].length ?? 0).replace(/^at\s*/, "");
      const p = readPoint(s);
      if (!p) return null;
      const txt = braced(s.slice(p[1]).trimStart(), 0);
      if (!txt) return null;
      fig.labels.push({ at: p[0], anchor, text: txt[0] });
    } else if ((s = st.replace(/^\\draw\s*/, "")) !== st) {
      const opt = s.match(/^\[([^\]]*)\]\s*/);
      const dashed = /\bdashed\b/.test(opt?.[1] ?? "");
      s = s.slice(opt?.[0].length ?? 0).trim();
      let line: Pt[] = [];
      let last: Pt | null = null;
      let op: "--" | "rectangle" | null = null;
      const flush = (closed: boolean) => {
        if (line.length > 1) fig.polylines.push({ points: line, closed, dashed });
        line = [];
      };
      while (s.length) {
        s = s.trimStart();
        if (s.startsWith("--")) {
          op = "--";
          s = s.slice(2);
        } else if (s.startsWith("rectangle")) {
          op = "rectangle";
          s = s.slice(9);
        } else if (s.startsWith("cycle")) {
          flush(true);
          op = null;
          s = s.slice(5);
        } else if (s.startsWith("circle")) {
          const c = s.match(new RegExp(String.raw`^circle\s*\(\s*${NUM}(?:cm)?\s*\)`));
          if (!c || !last) return null;
          fig.circles.push({ c: last, r: Number(c[1]), dashed });
          s = s.slice(c[0].length);
        } else {
          const p = readPoint(s);
          if (!p) return null;
          s = s.slice(p[1]);
          const pt = p[0];
          if (op === "rectangle" && last) {
            fig.polylines.push({ points: [last, { x: pt.x, y: last.y }, pt, { x: last.x, y: pt.y }], closed: true, dashed });
            line = [];
          } else if (op === "--") line.push(pt);
          else {
            flush(false);
            line = [pt];
          }
          last = pt;
          op = null;
        }
      }
      flush(false);
    } else return null;
  }

  const pts = [
    ...fig.polylines.flatMap((l) => l.points),
    ...fig.circles.flatMap(({ c, r }) => [
      { x: c.x - r, y: c.y - r },
      { x: c.x + r, y: c.y + r },
    ]),
    ...fig.labels.map((l) => l.at),
  ];
  if (!pts.length) return null;
  fig.box = {
    minX: Math.min(...pts.map((p) => p.x)),
    minY: Math.min(...pts.map((p) => p.y)),
    maxX: Math.max(...pts.map((p) => p.x)),
    maxY: Math.max(...pts.map((p) => p.y)),
  };
  return fig;
}
