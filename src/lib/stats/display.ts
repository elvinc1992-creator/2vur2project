// Statistikada mövzu üzrə göstərilən sual sayı (yalnız ekran üçün; faizlər real qalır):
// 1) real say × SCALE (bütün sual bazası);
// 2) nəticə FLOOR-dan azdırsa — sıra saxlanmaqla [MIN_SHOWN, FLOOR) aralığına çəkilir (ən kiçik → MIN_SHOWN).

export const SCALE = 2;
export const FLOOR = 40;
export const MIN_SHOWN = 30;

/** `n` — mövzunun real sual sayı; `minN` — bütün mövzular arasında ən kiçik real say. */
export function shownCount(n: number, minN: number): number {
  const d = n * SCALE;
  if (d >= FLOOR) return d;
  const minD = minN * SCALE;
  if (minD >= FLOOR - 1) return Math.max(MIN_SHOWN, d);
  const span = FLOOR - MIN_SHOWN; // 10 → 30..39
  return Math.min(FLOOR - 1, MIN_SHOWN + Math.floor(((d - minD) * span) / (FLOOR - minD)));
}

/** Göstərilən cəmi `parts`-ın real nisbətinə görə bölür (cəm dəqiq `shown`-dur). */
export function splitShown(shown: number, parts: number[]): number[] {
  const total = parts.reduce((s, p) => s + p, 0);
  if (!total) return parts.map(() => 0);
  const out = parts.map((p) => Math.floor((shown * p) / total));
  let rest = shown - out.reduce((s, p) => s + p, 0);
  for (let i = 0; rest > 0; i = (i + 1) % out.length, rest--) if (parts[i] > 0) out[i]++;
  return out;
}
