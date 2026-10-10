import { describe, expect, it } from "vitest";
import { periodEndFrom, priceOf, yearlyPerMonth, yearlySavingPct } from "./plans";

describe("ödəniş dövrü", () => {
  it("aylıq — 30 gün, illik — 12 ay (eyni tarix, gələn il)", () => {
    expect(periodEndFrom("2026-10-10", "month")).toBe("2026-11-09");
    expect(periodEndFrom("2026-10-10", "year")).toBe("2027-10-10");
    // Uzatma: mövcud dövrün sonundan
    expect(periodEndFrom(periodEndFrom("2026-10-10", "year"), "year")).toBe("2028-10-10");
    // 29 fevral → gələn il 1 mart
    expect(periodEndFrom("2028-02-29", "year")).toBe("2029-03-01");
  });

  it("illik qiymətlər, ayda düşən qiymət və qənaət", () => {
    expect(priceOf("pro", "year")).toBe("49.90 AZN");
    expect(priceOf("premium", "year")).toBe("89.90 AZN");
    expect(priceOf("pro")).toBe("6.90 AZN");
    expect(yearlyPerMonth("pro")).toBe("4.15 AZN");
    expect(yearlyPerMonth("premium")).toBe("7.49 AZN");
    expect(yearlySavingPct("pro")).toBe(40);
    expect(yearlySavingPct("premium")).toBe(42);
  });
});
