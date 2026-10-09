import { describe, expect, it } from "vitest";
import { DEMO_YEARS, splitDemo, yearsWithDemo } from "./demo-years";

describe("illər üzrə dinamika (nümunə illər)", () => {
  it("nümunə illərin cəmi dəqiq verilən ədəddir və mövzuya görə sabitdir", () => {
    for (const total of [0, 1, 7, 92, 1053]) {
      const parts = splitDemo(total, 5);
      expect(parts).toHaveLength(DEMO_YEARS.length);
      expect(parts.reduce((s, p) => s + p, 0)).toBe(total);
      expect(parts.every((p) => p >= 0)).toBe(true);
    }
    expect(splitDemo(92, 1)).toEqual(splitDemo(92, 1));
    expect(splitDemo(92, 1)).not.toEqual(splitDemo(92, 2));
  });

  it("2016–2026: real illər qalır, cəm = 2 × real cəm", () => {
    const real = [
      { year: 2017, n: 20 },
      { year: 2018, n: 22 },
      { year: 2023, n: 25 },
      { year: 2025, n: 25 },
    ];
    const ys = yearsWithDemo(real, 1);
    expect(ys.map((y) => y.year)).toEqual([2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025, 2026]);
    expect(ys.find((y) => y.year === 2023)?.n).toBe(25);
    expect(ys.reduce((s, y) => s + y.n, 0)).toBe(2 * 92);
  });
});
