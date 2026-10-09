import { describe, expect, it } from "vitest";
import { shownCount, splitShown } from "./display";

describe("statistikada göstərilən sual sayı", () => {
  it("40 və çox — sadəcə 2 qat", () => {
    expect(shownCount(92, 3)).toBe(184);
    expect(shownCount(20, 3)).toBe(40);
  });

  it("40-dan az — sıra saxlanmaqla 30–39 aralığına", () => {
    const real = [3, 5, 8, 12, 15, 19];
    const shown = real.map((n) => shownCount(n, 3));
    expect(shown[0]).toBe(30);
    expect(shown.every((s) => s >= 30 && s <= 39)).toBe(true);
    for (let i = 1; i < shown.length; i++) expect(shown[i]).toBeGreaterThanOrEqual(shown[i - 1]);
    expect(shownCount(20, 3)).toBeGreaterThan(shown.at(-1)!);
  });

  it("göstərilən cəmi real nisbətlə bölür", () => {
    expect(splitShown(36, [2, 16])).toEqual([4, 32]);
    expect(splitShown(37, [1, 1, 1]).reduce((s, x) => s + x, 0)).toBe(37);
    expect(splitShown(10, [0, 5])).toEqual([0, 10]);
  });
});
