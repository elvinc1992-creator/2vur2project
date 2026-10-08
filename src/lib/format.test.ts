import { describe, expect, it } from "vitest";
import { fmtDec, fmtInt, fmtPct } from "./format";
import { parseFilters, toQuery } from "./stats/filters";

describe("Azərbaycan rəqəm formatı", () => {
  it("minliklər boşluqla", () => {
    expect(fmtInt(1053)).toBe("1 053");
    expect(fmtInt(27)).toBe("27");
  });
  it("onluq vergül", () => {
    expect(fmtPct(0.087369)).toBe("8,7%");
    expect(fmtPct(0.0399)).toBe("4,0%");
    expect(fmtPct(1)).toBe("100%");
    expect(fmtDec(2.244)).toBe("2,2");
  });
});

describe("statistika süzgəcləri (URL)", () => {
  const options = { years: [2017, 2018, 2023, 2025], groups: ["I", "II", "III", "IV"] };
  it("URL-dən oxuyur və yanlış dəyərləri atır", () => {
    expect(parseFilters({ nov: "qebul", qrup: "II", il: "2025,2017,1999" }, options)).toEqual({
      kind: "qebul",
      group: "II",
      years: [2017, 2025],
    });
    expect(parseFilters({ nov: "x", qrup: "II" }, options)).toEqual({ kind: "all", group: null, years: [] });
  });
  it("qrup yalnız qəbulda", () => {
    expect(parseFilters({ nov: "buraxilis", qrup: "II" }, options).group).toBeNull();
  });
  it("URL-ə yazır (paylaşmaq olar)", () => {
    expect(toQuery({ kind: "buraxilis", group: null, years: [2025] })).toBe("?nov=buraxilis&il=2025");
    expect(toQuery({ kind: "all", group: null, years: [] })).toBe("");
  });
});
