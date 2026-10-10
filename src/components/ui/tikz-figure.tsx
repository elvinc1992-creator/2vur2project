import { MathText } from "@/components/ui/math-text";
import { parseTikz, type Anchor } from "@/lib/bank/tikz";

const UNIT = 36; // 1 TikZ vahidi → px
const PAD = 0.7; // nöqtə adları üçün kənar boşluq (vahid)

// Nöqtə adı nöqtənin hansı tərəfində dursun (TikZ anchor semantikası).
const SHIFT: Record<Anchor, string> = {
  center: "translate(-50%,-50%)",
  above: "translate(-50%,calc(-100% - 4px))",
  below: "translate(-50%,4px)",
  left: "translate(calc(-100% - 4px),-50%)",
  right: "translate(4px,-50%)",
  "above left": "translate(calc(-100% - 2px),calc(-100% - 2px))",
  "above right": "translate(2px,calc(-100% - 2px))",
  "below left": "translate(calc(-100% - 2px),2px)",
  "below right": "translate(2px,2px)",
};

/** Sualın sadə TikZ şəkli: SVG xətlər + KaTeX nöqtə adları. Oxunmasa — heç nə göstərilmir. */
export function TikzFigure({ tikz, label }: { tikz: string; label: string }) {
  const f = parseTikz(tikz);
  if (!f) return null;
  const x0 = f.box.minX - PAD;
  const y1 = f.box.maxY + PAD;
  const w = f.box.maxX - f.box.minX + 2 * PAD;
  const h = f.box.maxY - f.box.minY + 2 * PAD;
  const X = (x: number) => x - x0;
  const Y = (y: number) => y1 - y;
  const pct = (v: number, of: number) => `${(v / of) * 100}%`;

  return (
    <figure role="img" aria-label={label} className="relative m-0 mx-auto w-full" style={{ maxWidth: w * UNIT, aspectRatio: `${w} / ${h}` }}>
      <svg viewBox={`0 0 ${w} ${h}`} className="absolute inset-0 size-full overflow-visible" aria-hidden="true">
        <g fill="none" stroke="currentColor" strokeWidth={0.045} strokeLinejoin="round" strokeLinecap="round">
          {f.polylines.map((l, i) => {
            const pts = l.points.map((p) => `${X(p.x)},${Y(p.y)}`).join(" ");
            const dash = l.dashed ? "0.14 0.1" : undefined;
            return l.closed ? (
              <polygon key={i} points={pts} strokeDasharray={dash} />
            ) : (
              <polyline key={i} points={pts} strokeDasharray={dash} />
            );
          })}
          {f.circles.map((c, i) => (
            <circle key={i} cx={X(c.c.x)} cy={Y(c.c.y)} r={c.r} strokeDasharray={c.dashed ? "0.14 0.1" : undefined} />
          ))}
        </g>
      </svg>
      {f.labels.map((l, i) => (
        <span
          key={i}
          aria-hidden="true"
          className="absolute text-[15px] leading-none whitespace-nowrap"
          style={{ left: pct(X(l.at.x), w), top: pct(Y(l.at.y), h), transform: SHIFT[l.anchor] }}
        >
          <MathText text={l.text} />
        </span>
      ))}
    </figure>
  );
}
