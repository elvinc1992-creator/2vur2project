import { describe, expect, it } from "vitest";
import { estimateCorrect, weeklyEstimate } from "./weekly";

describe("weeklyEstimate", () => {
  it("200 sualdan 120 düzgün → 60%, buraxılışda 14", () => {
    const r = weeklyEstimate({ total: 200, correct: 120 });
    expect(r.pct).toBe(60);
    expect(r.buraxilis).toBe(14);
    expect(r.blok).toBe(17);
  });

  it("cavab yoxdursa və ya çox azdırsa 0 olur", () => {
    expect(estimateCorrect(25, { total: 0, correct: 0 })).toBe(0);
    expect(estimateCorrect(25, { total: 10, correct: 0 })).toBe(0);
  });

  it("hamısı düzgündürsa N − 1", () => {
    expect(estimateCorrect(25, { total: 40, correct: 40 })).toBe(24);
  });
});
