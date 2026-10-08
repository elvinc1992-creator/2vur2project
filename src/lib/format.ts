// Azərbaycan formatı: onluq vergül (8,7%), minliklər boşluqla (1 053).
const NBSP = " ";

export function fmtInt(n: number): string {
  return Math.round(n)
    .toString()
    .replace(/\B(?=(\d{3})+(?!\d))/g, NBSP);
}

export function fmtDec(n: number, digits = 1): string {
  const [int, frac] = n.toFixed(digits).split(".");
  return frac ? `${fmtInt(Number(int))},${frac}` : fmtInt(Number(int));
}

/** Pay (0–1) → "8,7%". */
export function fmtPct(ratio: number, digits = 1): string {
  if (!Number.isFinite(ratio)) return "—";
  // 0% və 100% onluq hissəsiz; qalanları sabit dəqiqliklə (4,0%, 8,7%).
  if (ratio === 0 || ratio === 1) return `${ratio * 100}%`;
  return `${fmtDec(ratio * 100, digits)}%`;
}
