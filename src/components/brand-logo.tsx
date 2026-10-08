import type { SVGProps } from "react";

// 2vur2 loqosu (sifarişçinin faylı: 2vur2_rhombus_c_middle_lightblue.svg).
// 9 yumru künclü romb: orta sırada sol və sağ — tünd mavi, mərkəz — açıq mavi; yanında "2vur2" monoxətti.

const COLORS = {
  light: { dark: "#3B5BDB", mid: "#8DA2FB", pale: "#DBE4FF" },
  // Tünd (navy) fonda: tünd hissələr ağ, solğun rombalar şəffaf.
  onNavy: { dark: "#FFFFFF", mid: "#8DA2FB", pale: "rgba(219, 228, 255, 0.3)" },
} as const;

const PALE = [
  [0, -24],
  [-12, -12],
  [12, -12],
  [-12, 12],
  [12, 12],
  [0, 24],
] as const;

function Rhomb({ x, y, color }: { x: number; y: number; color: string }) {
  return (
    <polygon
      points={`${x},${y - 8} ${x + 8},${y} ${x},${y + 8} ${x - 8},${y}`}
      fill={color}
      stroke={color}
      strokeWidth={2.5}
      strokeLinejoin="round"
    />
  );
}

function Mark({ c }: { c: (typeof COLORS)[keyof typeof COLORS] }) {
  return (
    <>
      {PALE.map(([x, y]) => (
        <Rhomb key={`${x},${y}`} x={x} y={y} color={c.pale} />
      ))}
      <Rhomb x={0} y={0} color={c.mid} />
      <Rhomb x={-24} y={0} color={c.dark} />
      <Rhomb x={24} y={0} color={c.dark} />
    </>
  );
}

type Props = Omit<SVGProps<SVGSVGElement>, "children"> & { onNavy?: boolean };

/** Üfüqi loqo: işarə + "2vur2" yazısı. Dekorativdir — ad yanında mətnlə verilir. */
export function BrandLogo({ onNavy, ...props }: Props) {
  const c = onNavy ? COLORS.onNavy : COLORS.light;
  return (
    <svg viewBox="-36 -36 242 72" aria-hidden="true" focusable="false" {...props}>
      <Mark c={c} />
      <g transform="translate(56,21)" fill="none" strokeLinecap="round" strokeLinejoin="round">
        <path stroke={c.dark} strokeWidth={7} d="M2.12,-35.07 A12,12 0 1 1 22.83,-23.12 L1,0 H26" />
        <g stroke={c.mid} strokeWidth={6}>
          <path d="M36,-24 L47,0 L58,-24" />
          <path d="M66,-24 V-10 A10,10 0 0 0 86,-10 M86,-24 V0" />
          <path d="M96,0 V-14 A10,10 0 0 1 106,-24 H109" />
        </g>
        <path stroke={c.dark} strokeWidth={7} d="M120.12,-35.07 A12,12 0 1 1 140.83,-23.12 L119,0 H144" />
      </g>
    </svg>
  );
}

/** Yalnız işarə (9 romb) — ikon, kiçik ölçülər. */
export function BrandMark({ onNavy, ...props }: Props) {
  return (
    <svg viewBox="-34 -34 68 68" aria-hidden="true" focusable="false" {...props}>
      <Mark c={onNavy ? COLORS.onNavy : COLORS.light} />
    </svg>
  );
}
