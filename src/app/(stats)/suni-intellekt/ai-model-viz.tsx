import type { CSSProperties, ReactNode } from "react";
import type { FreqLevel } from "@/lib/ai/analysis";
import { cn } from "@/lib/cn";

// "Modelin içində": neyron şəbəkə, öyrənmə (ML), qruplaşdırma və modelin cavabı — sxematik, yalnız CSS/SVG.
// Animasiyalar globals.css-də (.mv-*), prefers-reduced-motion-da son vəziyyət statik göstərilir.

const v = (vars: Record<string, string | number>) => vars as CSSProperties;

const LEVEL_COLOR: Record<FreqLevel, string> = { high: "#b42318", mid: "#ea580c", low: "#94a3b8" };
const LEVEL_NAME: Record<FreqLevel, string> = { high: "Yüksək", mid: "Orta", low: "Aşağı" };

function Panel({ title, tag, className, children }: { title: string; tag: string; className?: string; children: ReactNode }) {
  return (
    <figure className={cn("m-0 grid min-w-0 content-start gap-3 rounded-[20px] border border-line bg-white p-4 shadow-card md:p-5", className)}>
      <figcaption className="flex flex-wrap items-center justify-between gap-2">
        <b className="font-display text-[16px] text-navy-900">{title}</b>
        <span className="rounded-pill bg-violet-100 px-2.5 py-0.5 text-[11.5px] font-bold text-violet-800" lang="en">{tag}</span>
      </figcaption>
      {children}
    </figure>
  );
}

/* ---------------- 1. Neyron şəbəkə ---------------- */

const NN_W = 520;
const NN_H = 270;
const NN_X = [96, 196, 296, 372];
const NN_LAYERS = [5, 6, 6, 3];
const NN_IN = ["Mövzu", "Tip", "Səhifə", "Format", "İl"];
const nnY = (n: number) => Array.from({ length: n }, (_, i) => (NN_H / (n + 1)) * (i + 1));
const NN_NODES = NN_LAYERS.map((n, l) => nnY(n).map((y) => ({ x: NN_X[l], y })));
const NN_EDGES = NN_NODES.slice(0, -1).flatMap((layer, l) =>
  layer.flatMap((a, i) => NN_NODES[l + 1].map((b, j) => ({ a, b, l, flow: (i * 3 + j * 5 + l) % 4 === 0, d: l * 0.6 + ((i + j) % 3) * 0.12 }))),
);

function NeuralNetwork({ level }: { level: FreqLevel }) {
  const probs: Record<FreqLevel, number> = level === "high" ? { high: 78, mid: 17, low: 5 } : level === "mid" ? { high: 21, mid: 69, low: 10 } : { high: 6, mid: 19, low: 75 };
  const outs: FreqLevel[] = ["high", "mid", "low"];
  return (
    <svg viewBox={`0 0 ${NN_W} ${NN_H}`} role="img" aria-label="Neyron şəbəkə: mövzu, tip, səhifə, format və il girişlərindən Yüksək, Orta və Aşağı ehtimallarına" className="block h-auto w-full">
      <defs>
        <linearGradient id="mv-g" x1="0" x2="1">
          <stop offset="0" stopColor="#7c3aed" />
          <stop offset="1" stopColor="#d946ef" />
        </linearGradient>
      </defs>
      <g stroke="#e7e3f6" strokeWidth="1">
        {NN_EDGES.map((e, i) => (
          <line key={i} x1={e.a.x} y1={e.a.y} x2={e.b.x} y2={e.b.y} />
        ))}
      </g>
      <g stroke="url(#mv-g)" strokeWidth="2.6" strokeLinecap="round" fill="none">
        {NN_EDGES.filter((e) => e.flow).map((e, i) => (
          <path key={i} d={`M${e.a.x} ${e.a.y}L${e.b.x} ${e.b.y}`} pathLength={100} className="mv-flow" style={v({ "--d": `${e.d}s` })} />
        ))}
      </g>
      {NN_NODES.map((layer, l) =>
        layer.map((n, i) => (
          <circle
            key={`${l}-${i}`}
            cx={n.x}
            cy={n.y}
            r={l === 0 ? 9 : l === 3 ? 11 : 8}
            fill={l === 0 ? "#1f2a5c" : l === 3 ? LEVEL_COLOR[outs[i]] : "#fff"}
            stroke={l === 1 || l === 2 ? "#8b5cf6" : "#fff"}
            strokeWidth="2"
            className={l === 1 || l === 2 ? "mv-node" : l === 3 ? "mv-out" : undefined}
            style={v({ "--d": `${l * 0.6 + 0.5 + i * 0.06}s` })}
          />
        )),
      )}
      <g fontSize="16" fontWeight="600" fill="#1f2a5c">
        {NN_IN.map((s, i) => (
          <text key={s} x={NN_X[0] - 16} y={NN_NODES[0][i].y} textAnchor="end" dominantBaseline="central">
            {s}
          </text>
        ))}
      </g>
      {outs.map((o, i) => {
        const y = NN_NODES[3][i].y;
        return (
          <g key={o}>
            <text x={NN_X[3] + 20} y={y - 9} fontSize="14" fontWeight="700" fill="#1f2a5c">
              {LEVEL_NAME[o]} · {probs[o]}%
            </text>
            <rect x={NN_X[3] + 20} y={y + 1} width="118" height="7" rx="3.5" fill="#f1eefb" />
            <rect x={NN_X[3] + 20} y={y + 1} width={(118 * probs[o]) / 100} height="7" rx="3.5" fill={LEVEL_COLOR[o]} className="mv-prob" />
          </g>
        );
      })}
    </svg>
  );
}

/* ---------------- 2. Öyrənmə (machine learning) ---------------- */

function Training({ mapped }: { mapped: number }) {
  return (
    <div className="grid gap-3">
      <svg viewBox="0 0 300 170" role="img" aria-label="Öyrənmə əyriləri: xəta azalır, dəqiqlik artır" className="block h-auto w-full">
        <g stroke="#eef0f6" strokeWidth="1">
          {[30, 65, 100, 135].map((y) => (
            <line key={y} x1="28" x2="290" y1={y} y2={y} />
          ))}
        </g>
        <path d="M28 150H290M28 18V150" stroke="#c9cfe0" strokeWidth="1.5" fill="none" />
        <path d="M30 28C70 104 118 124 288 140" pathLength={100} fill="none" stroke="#d946ef" strokeWidth="3" strokeLinecap="round" className="mv-curve" />
        <path d="M30 146C78 74 138 46 288 36" pathLength={100} fill="none" stroke="#7c3aed" strokeWidth="3" strokeLinecap="round" className="mv-curve" />
        <g fontSize="11" fontWeight="600">
          <text x="34" y="14" fill="#7c3aed">● dəqiqlik</text>
          <text x="118" y="14" fill="#d946ef">● xəta</text>
          <text x="290" y="165" textAnchor="end" fill="#64748b">
            epoxa →
          </text>
        </g>
      </svg>
      <dl className="m-0 grid grid-cols-3 gap-2 text-center">
        <div className="rounded-[12px] bg-navy-050 px-2 py-2">
          <dt className="text-[11.5px] text-ink-muted">Epoxa</dt>
          <dd className="mv-count m-0 font-display text-[20px] font-extrabold text-navy-900 tabular" style={v({ "--to": 50 })} />
        </div>
        <div className="rounded-[12px] bg-fuchsia-50 px-2 py-2">
          <dt className="text-[11.5px] text-ink-muted">Xəta</dt>
          <dd className="mv-loss m-0 font-display text-[20px] font-extrabold text-fuchsia-700 tabular" />
        </div>
        <div className="rounded-[12px] bg-violet-50 px-2 py-2">
          <dt className="text-[11.5px] text-ink-muted">Tipə bağlanma</dt>
          <dd className="mv-count mv-pct m-0 font-display text-[20px] font-extrabold text-violet-800 tabular" style={v({ "--to": mapped })} />
        </div>
      </dl>
    </div>
  );
}

/* ---------------- 3. Qruplaşdırma (təsnifat modeli) ---------------- */

const CENTERS: Record<FreqLevel, { x: number; y: number }> = { high: { x: 228, y: 58 }, mid: { x: 82, y: 68 }, low: { x: 150, y: 158 } };
const POINTS = Array.from({ length: 21 }, (_, i) => {
  const level = (["high", "mid", "low"] as const)[i % 3];
  const c = CENTERS[level];
  const a = (i * 137.5 * Math.PI) / 180;
  const r = 8 + ((i * 7) % 17);
  const x = Math.round(c.x + Math.cos(a) * r);
  const y = Math.round(c.y + Math.sin(a) * r * 0.8);
  // Başlanğıc — səpələnmiş (sabit "təsadüfi")
  const sx = ((i * 53) % 260) + 20 - x;
  const sy = ((i * 89) % 160) + 20 - y;
  return { x, y, sx, sy, level, d: (i % 7) * 0.08 };
});

function Clustering() {
  return (
    <svg viewBox="0 0 300 200" role="img" aria-label="Qruplaşdırma: suallar düşmə tezliyinə görə Yüksək, Orta və Aşağı qruplarına ayrılır" className="block h-auto w-full">
      <rect x="1" y="1" width="298" height="198" rx="14" fill="#fbfaff" stroke="#eee9fb" />
      <path d="M150 6C160 60 190 100 296 112" pathLength={100} fill="none" stroke="#a78bfa" strokeWidth="2" strokeDasharray="5 5" className="mv-boundary" />
      <path d="M4 120C70 112 110 100 150 6" pathLength={100} fill="none" stroke="#a78bfa" strokeWidth="2" strokeDasharray="5 5" className="mv-boundary" />
      {POINTS.map((p, i) => (
        <circle key={i} cx={p.x} cy={p.y} r="5.5" className="mv-point" style={v({ "--sx": `${p.sx}px`, "--sy": `${p.sy}px`, "--c": LEVEL_COLOR[p.level], "--d": `${p.d}s` })} />
      ))}
      <g fontSize="12" fontWeight="700" className="mv-label">
        {(Object.keys(CENTERS) as FreqLevel[]).map((l) => (
          <text key={l} x={CENTERS[l].x} y={CENTERS[l].y + (l === "low" ? 34 : -30)} textAnchor="middle" fill={LEVEL_COLOR[l]}>
            {LEVEL_NAME[l]}
          </text>
        ))}
      </g>
    </svg>
  );
}

/* ---------------- 4. Modelin cavabı (inference) ---------------- */

function Inference({ lines }: { lines: string[] }) {
  return (
    <div className="min-w-0 overflow-hidden rounded-[14px] bg-[#0f1530] p-4 font-mono text-[12.5px] leading-[1.9] text-[#c7d2fe] md:text-[13px]">
      <div aria-hidden="true" className="mb-2 flex gap-1.5">
        <i className="size-2.5 rounded-full bg-[#f87171]" />
        <i className="size-2.5 rounded-full bg-[#fbbf24]" />
        <i className="size-2.5 rounded-full bg-[#34d399]" />
      </div>
      <ol className="m-0 grid list-none p-0">
        {lines.map((l, i) => (
          <li key={i} className="mv-line break-words md:truncate" style={v({ "--d": `${i * 0.9}s` })}>
            <span className="text-[#a78bfa]">{i === lines.length - 1 ? "✓ " : "› "}</span>
            {l}
          </li>
        ))}
      </ol>
      <span aria-hidden="true" className="mv-caret mt-1 inline-block h-4 w-2 bg-[#c7d2fe]" />
    </div>
  );
}

export type ModelExample = { topic: string; type: string | null; shown: number; level: FreqLevel };

/** "Modelin içində" bölməsi: 4 animasiyalı panel (mobildə alt-alta). */
export function AiModelViz({ mapped, example }: { mapped: number; example: ModelExample | null }) {
  const level = example?.level ?? "high";
  const lines = [
    "giriş: sualın mətni, rəqəmləri və şəkli",
    `təsnifat → mövzu: ${example?.topic ?? "Loqarifm"}`,
    `təsnifat → tip: ${example?.type ?? "Üstlü və loqarifmik tənliklər"}`,
    `tezlik → ${example?.shown ?? 40} sual · ${LEVEL_NAME[level]}`,
    "nəticə: hazırlıq planında prioritet",
  ];
  return (
    <div className="grid gap-4 lg:grid-cols-3">
      <Panel title="Neyron şəbəkə" tag="Deep learning" className="lg:col-span-2">
        <NeuralNetwork level={level} />
      </Panel>
      <Panel title="Model öyrənir" tag="Machine learning">
        <Training mapped={mapped} />
      </Panel>
      <Panel title="Qruplaşdırma" tag="AI model">
        <Clustering />
      </Panel>
      <Panel title="Model cavab verir" tag="Inference" className="lg:col-span-2">
        <Inference lines={lines} />
      </Panel>
    </div>
  );
}
