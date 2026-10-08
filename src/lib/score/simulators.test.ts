import { describe, expect, it } from "vitest";
import { DEMO_POINTS, SIMULATORS, simulateScore } from "./simulators";

const sim = SIMULATORS.find((s) => s.id === "buraxilis-11")!;

describe("DİM bal simulyatoru (demo düstur)", () => {
  it("maksimum: 25 sual × 4 = 100", () => {
    expect(simulateScore(sim, {}).max).toBe(25 * DEMO_POINTS);
    expect(simulateScore(sim, { closed: 13, coded: 5, written: 7 }).score).toBe(100);
  });

  it("bölmələr üzrə cəm; dəyərlər 0…max aralığına və tam ədədə salınır", () => {
    const r = simulateScore(sim, { closed: 10, coded: 2, written: 3 });
    expect(r.score).toBe((10 + 2 + 3) * DEMO_POINTS);
    expect(simulateScore(sim, { closed: 99, coded: -4, written: 2.7 }).rows.map((x) => x.correct)).toEqual([13, 0, 2]);
    expect(simulateScore(sim, { closed: Number.NaN }).score).toBe(0);
  });

  it("məzmunu olmayan növlər 'Tezliklə' kimi işarələnib", () => {
    expect(SIMULATORS.filter((s) => !s.available).every((s) => s.sections.length === 0)).toBe(true);
  });
});
