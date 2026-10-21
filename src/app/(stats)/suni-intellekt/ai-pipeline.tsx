import type { CSSProperties, ReactNode } from "react";

type Step = { title: string; text: string };

const v = (vars: Record<string, string | number>) => vars as CSSProperties;

/* Hər addımın mini-animasiyası (dekorativ SVG, 64×48). Animasiyalar globals.css-də (.aip-*). */
const ART: ReactNode[] = [
  // 1. Toplama — imtahan vərəqləri yığına düşür
  <svg key="collect" viewBox="0 0 64 48" className="aip-art size-full" aria-hidden="true">
    <rect x="14" y="38" width="36" height="4" rx="2" fill="#ddd6fe" />
    {[0, 1, 2].map((d) => (
      <g key={d} className="aip-drop" style={v({ "--d": d })}>
        <rect x={18 + d * 4} y={10 + d * 8} width="22" height="26" rx="3" fill="#fff" stroke="#7c3aed" strokeWidth="1.6" />
        <path d={`M${22 + d * 4} ${17 + d * 8}h14M${22 + d * 4} ${22 + d * 8}h10M${22 + d * 4} ${27 + d * 8}h12`} stroke="#c4b5fd" strokeWidth="1.6" strokeLinecap="round" />
      </g>
    ))}
  </svg>,
  // 2. Emal — skan xətti, rəqəmlər və şəkil tanınır
  <svg key="process" viewBox="0 0 64 48" className="aip-art size-full" aria-hidden="true">
    <rect x="12" y="6" width="40" height="38" rx="4" fill="#fff" stroke="#7c3aed" strokeWidth="1.6" />
    <text x="17" y="20" fontSize="9" fontWeight="700" fill="#5b21b6" className="aip-blink" style={v({ "--d": 0 })}>
      x²
    </text>
    <text x="31" y="20" fontSize="9" fontWeight="700" fill="#c026d3" className="aip-blink" style={v({ "--d": 1 })}>
      7
    </text>
    <path d="M18 33l6-7 5 5 4-4 6 6" fill="none" stroke="#a78bfa" strokeWidth="1.6" className="aip-blink" style={v({ "--d": 2 })} />
    <rect x="13" y="8" width="38" height="3" rx="1.5" fill="#c026d3" opacity="0.55" className="aip-scan" />
  </svg>,
  // 3. Təsnifat — suallar üç qutuya (mövzu / tip / alt tip) paylanır
  <svg key="classify" viewBox="0 0 64 48" className="aip-art size-full" aria-hidden="true">
    {[10, 26, 42].map((x, i) => (
      <rect key={x} x={x} y="32" width="12" height="12" rx="3" fill="none" stroke={["#7c3aed", "#c026d3", "#6366f1"][i]} strokeWidth="1.6" />
    ))}
    {[
      { x: -16, c: "#7c3aed" },
      { x: 0, c: "#c026d3" },
      { x: 16, c: "#6366f1" },
    ].map((p, d) => (
      <circle key={d} cx="32" cy="14" r="4" fill={p.c} className="aip-sort" style={v({ "--d": d, "--x": `${p.x}px` })} />
    ))}
  </svg>,
  // 4. Tezlik — sütunlar böyüyür (Yüksək / Orta / Aşağı rəngləri)
  <svg key="freq" viewBox="0 0 64 48" className="aip-art size-full" aria-hidden="true">
    <path d="M8 42h48" stroke="#ddd6fe" strokeWidth="2" strokeLinecap="round" />
    {[
      { x: 12, h: 30, c: "#b42318" },
      { x: 22, h: 22, c: "#ea580c" },
      { x: 32, h: 26, c: "#b42318" },
      { x: 42, h: 12, c: "#94a3b8" },
    ].map((b, d) => (
      <rect key={b.x} x={b.x} y={41 - b.h} width="8" height={b.h} rx="2" fill={b.c} className="aip-bar" style={v({ "--d": d })} />
    ))}
  </svg>,
  // 5. Tövsiyə — hədəf və təsdiq işarəsi
  <svg key="advice" viewBox="0 0 64 48" className="aip-art size-full" aria-hidden="true">
    <circle cx="32" cy="24" r="12" fill="none" stroke="#c4b5fd" strokeWidth="2" className="aip-ring" />
    <circle cx="32" cy="24" r="14" fill="#f5f3ff" stroke="#7c3aed" strokeWidth="1.6" />
    <circle cx="32" cy="24" r="8" fill="none" stroke="#a78bfa" strokeWidth="1.6" />
    <path d="M25 24.5l5 5 9-10" fill="none" stroke="#16a34a" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round" className="aip-check" />
  </svg>,
];

/**
 * "Analiz addım-addım": 5 addım xətt üzərində düyünlərdir, "məlumat paketi" addımdan addıma axır və hər addım
 * növbə ilə işıqlanır (10s dövr). Mobildə şaquli. prefers-reduced-motion — animasiya yoxdur, hər şey statik görünür.
 */
export function AiPipeline({ steps }: { steps: Step[] }) {
  return (
    <div className="relative">
      {/* Xətt, paket və nömrəli düyünlər — kartların üstündə ayrıca qat */}
      <div
        aria-hidden="true"
        className="pointer-events-none absolute top-[54px] bottom-[54px] left-[28px] z-[1] w-[3px] -translate-x-1/2 md:top-[34px] md:right-[10%] md:bottom-auto md:left-[10%] md:h-[3px] md:w-auto md:translate-x-0 md:-translate-y-1/2"
      >
        <span className="absolute inset-0 rounded-pill bg-violet-200" />
        <span className="aip-fill absolute top-0 left-0 h-full w-full rounded-pill bg-linear-to-b from-violet-600 to-fuchsia-500 md:bg-linear-to-r" />
        <span className="aip-packet absolute top-0 left-1/2 z-[2] size-3.5 -translate-1/2 rounded-full bg-fuchsia-500 shadow-[0_0_0_5px_rgba(217,70,239,.25),0_0_18px_4px_rgba(192,38,211,.55)] md:top-1/2 md:left-0" />
        {steps.map((_, i) => (
          <span
            key={i}
            style={v({ "--i": i, "--p": `${i * 25}%` })}
            className="aip-num absolute top-(--p) left-1/2 z-[3] grid size-9 -translate-1/2 place-items-center rounded-full border-[3px] border-white bg-violet-100 font-display text-[15px] font-extrabold text-violet-800 tabular md:top-1/2 md:left-(--p)"
          >
            {i + 1}
          </span>
        ))}
      </div>

      <ol className="m-0 grid list-none gap-3 p-0 md:grid-cols-5 md:gap-0">
        {steps.map((s, i) => (
          <li key={s.title} className="md:px-1.5">
            <div
              style={v({ "--i": i })}
              className="aip-step flex h-[108px] items-center gap-3 rounded-[18px] border border-line bg-white py-3 pr-3 pl-14 md:h-full md:flex-col md:items-center md:gap-2 md:px-3 md:pt-14 md:pb-4 md:text-center"
            >
              <span className="grid min-w-0 flex-1 gap-0.5 md:order-2 md:flex-none">
                <b className="font-display text-[16px] text-navy-900">{s.title}</b>
                <span className="text-[13px] leading-[1.4] text-ink-muted">{s.text}</span>
              </span>
              <span className="h-12 w-16 flex-none md:order-1 md:h-[60px] md:w-20">{ART[i]}</span>
            </div>
          </li>
        ))}
      </ol>
    </div>
  );
}
