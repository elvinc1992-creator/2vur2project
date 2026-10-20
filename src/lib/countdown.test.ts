import { describe, expect, it } from "vitest";
import { bakuDate, bakuInputToMs, countdown, msToBakuInput, prepProgress, urgencyOf } from "./countdown";

const EXAM = Date.UTC(2027, 2, 9, 6); // 9 mart 2027, 10:00 Bakı

describe("geri sayım", () => {
  it("tam günlər, saat və dəqiqə", () => {
    const now = EXAM - (142 * 24 * 60 + 14 * 60 + 32) * 60_000 - 5_000;
    expect(countdown(EXAM, now)).toEqual({ days: 142, hours: 14, minutes: 32, seconds: 5 });
    expect(countdown(EXAM, EXAM + 1)).toEqual({ days: 0, hours: 0, minutes: 0, seconds: 0 });
  });

  it("rəng vəziyyəti: >60, 30–60, <30", () => {
    expect(urgencyOf(61)).toBe("calm");
    expect(urgencyOf(60)).toBe("soon");
    expect(urgencyOf(30)).toBe("soon");
    expect(urgencyOf(29)).toBe("urgent");
  });

  it("Bakı vaxtı: tarix, datetime-local", () => {
    expect(bakuDate(EXAM)).toBe("9 mart 2027");
    expect(bakuDate(Date.UTC(2027, 4, 16, 21))).toBe("17 may 2027"); // 01:00 Bakı — artıq ertəsi gün
    expect(bakuInputToMs("2027-03-09T10:00")).toBe(EXAM);
    expect(msToBakuInput(EXAM)).toBe("2027-03-09T10:00");
    expect(bakuInputToMs("səhv")).toBeNaN();
  });

  it("hazırlıq ili 1 sentyabrdan imtahana qədər", () => {
    const start = Date.UTC(2026, 8, 1) - 4 * 3600_000;
    expect(prepProgress(EXAM, start)).toBe(0);
    expect(prepProgress(EXAM, (start + EXAM) / 2)).toBe(50);
    expect(prepProgress(EXAM, EXAM + 1)).toBe(100);
  });
});
