import { cn } from "@/lib/cn";

// Hero-dakı neyron şəbəkə (4-7-7-4): girişlər → iki gizli qat → çıxışlar.
// Statik SVG; işıq axını CSS ilə (globals.css → .nn-flow), prefers-reduced-motion-da söndürülür.

const W = 560;
const H = 400;
const LAYERS = [4, 7, 7, 4];
const X = [112, 232, 352, 472];
const INPUTS = ["Sual", "Rəqəm", "Şəkil", "İl"];
const OUTPUTS = ["Mövzu", "Tip", "Alt tip", "Ehtimal"];

const ys = (n: number) => Array.from({ length: n }, (_, i) => H / 2 + (i - (n - 1) / 2) * (n === 4 ? 80 : 50));
const NODES = LAYERS.map((n, l) => ys(n).map((y) => ({ x: X[l], y })));

type Edge = { x1: number; y1: number; x2: number; y2: number; flow: boolean; delay: number };
const EDGES: Edge[] = NODES.slice(0, -1).flatMap((layer, l) =>
  layer.flatMap((a, i) =>
    NODES[l + 1].map((b, j) => {
      const k = l * 49 + i * 7 + j;
      // Sabit "təsadüfi" seçim: hər render eyni (hidratasiya fərqi yoxdur).
      return { x1: a.x, y1: a.y, x2: b.x, y2: b.y, flow: (i * 5 + j * 3 + l) % 6 === 0, delay: ((k * 37) % 30) / 10 + l * 0.6 };
    }),
  ),
);

export function NeuralNet({ className }: { className?: string }) {
  return (
    <figure className={cn("m-0 grid gap-3 rounded-xl border border-line bg-surface p-4 shadow-raised md:p-5", className)}>
      <figcaption className="flex flex-wrap items-center justify-between gap-2 text-caption font-bold tracking-[0.06em] text-ink-muted uppercase">
        <span>Giriş</span>
        <span className="text-violet-700">Neyron şəbəkə · sual təsnifatı</span>
        <span>Çıxış</span>
      </figcaption>
      <svg
        viewBox={`0 0 ${W} ${H}`}
        role="img"
        aria-label="Neyron şəbəkə: sual, rəqəm, şəkil və il girişlərindən mövzu, tip, alt tip və ehtimal çıxışlarına"
        className="block h-auto w-full"
      >
        <defs>
          <linearGradient id="nn-grad" gradientUnits="userSpaceOnUse" x1="0" x2={W} y1="0" y2="0">
            <stop offset="0" stopColor="#7c3aed" />
            <stop offset="1" stopColor="#db2777" />
          </linearGradient>
        </defs>
        <g stroke="var(--navy-200)" strokeWidth="1">
          {EDGES.map((e, i) => (
            <line key={i} x1={e.x1} y1={e.y1} x2={e.x2} y2={e.y2} />
          ))}
        </g>
        <g stroke="url(#nn-grad)" strokeWidth="2.5" strokeLinecap="round" fill="none">
          {EDGES.filter((e) => e.flow).map((e, i) => (
            <path key={i} d={`M${e.x1} ${e.y1}L${e.x2} ${e.y2}`} pathLength={100} className="nn-flow" style={{ animationDelay: `${e.delay}s` }} />
          ))}
        </g>
        {NODES.map((layer, l) =>
          layer.map((n, i) => (
            <circle
              key={`${l}-${i}`}
              cx={n.x}
              cy={n.y}
              r={l === 0 || l === 3 ? 11 : 8}
              fill={l === 0 ? "var(--navy-900)" : l === 3 ? "url(#nn-grad)" : "#fff"}
              stroke={l === 1 || l === 2 ? "#8b5cf6" : "none"}
              strokeWidth="2"
              className={l === 3 ? "nn-pulse" : undefined}
              style={l === 3 ? { animationDelay: `${i * 0.5}s` } : undefined}
            />
          )),
        )}
        <g fontFamily="var(--font-inter), system-ui, sans-serif" fontSize="17" fontWeight="600" fill="var(--navy-900)">
          {INPUTS.map((s, i) => (
            <text key={s} x={X[0] - 20} y={NODES[0][i].y} textAnchor="end" dominantBaseline="central">
              {s}
            </text>
          ))}
          {OUTPUTS.map((s, i) => (
            <text key={s} x={X[3] + 20} y={NODES[3][i].y} dominantBaseline="central">
              {s}
            </text>
          ))}
        </g>
      </svg>
    </figure>
  );
}
