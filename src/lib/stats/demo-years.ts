// Mövzu səhifəsi: "İllər üzrə dinamika" 2016–2026.
// Bazada olan illər real rəqəmlə qalır; DEMO_YEARS üçün nümunə rəqəmlər (mövzuya görə sabit — hər açılışda eyni).
// Nümunə illərin cəmi = real cəm, beləliklə bütün illərin cəmi = 2 × real cəm (kartdakı "Cəmi sual" ilə eyni).

export const YEAR_RANGE = { from: 2016, to: 2026 } as const;
export const DEMO_YEARS = [2016, 2019, 2020, 2021, 2022, 2024, 2026];

/** Sadə, deterministik təsadüfi ədədlər (mulberry32). */
function rng(seed: number) {
  let a = seed >>> 0;
  return () => {
    a = (a + 0x6d2b79f5) >>> 0;
    let t = a;
    t = Math.imul(t ^ (t >>> 15), t | 1);
    t ^= t + Math.imul(t ^ (t >>> 7), t | 61);
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
  };
}

/** `total`-ı DEMO_YEARS arasında bölür (cəm dəqiq `total`-dır). */
export function splitDemo(total: number, seed: number): number[] {
  const rand = rng(seed);
  const weights = DEMO_YEARS.map(() => 0.6 + rand());
  const sum = weights.reduce((s, w) => s + w, 0);
  const parts = weights.map((w) => Math.floor((total * w) / sum));
  let rest = total - parts.reduce((s, p) => s + p, 0);
  // Qalığı ən böyük çəkili illərə paylayırıq.
  const order = weights.map((w, i) => [w, i] as const).sort((x, y) => y[0] - x[0]);
  for (let k = 0; rest > 0; k = (k + 1) % order.length, rest--) parts[order[k][1]]++;
  return parts;
}

/** 2016–2026: real illər + nümunə illər. Cəm = `target` (default: 2 × real cəm). */
export function yearsWithDemo(real: Array<{ year: number; n: number }>, seed: number, target?: number) {
  const realSum = real.reduce((s, y) => s + y.n, 0);
  const parts = splitDemo(Math.max(0, (target ?? 2 * realSum) - realSum), seed);
  const demo = new Map(DEMO_YEARS.map((y, i) => [y, parts[i]]));
  const out: Array<{ year: number; n: number }> = [];
  for (let y = YEAR_RANGE.from; y <= YEAR_RANGE.to; y++) {
    out.push({ year: y, n: real.find((r) => r.year === y)?.n ?? demo.get(y) ?? 0 });
  }
  return out;
}
