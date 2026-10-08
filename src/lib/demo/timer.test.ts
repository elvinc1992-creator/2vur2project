import { describe, expect, it } from "vitest";
import { MAX_GAP_MS, activeElapsed, remainingOf } from "./timer";

const D = 90 * 60_000;

describe("sınaq sayğacı (fasilə ilə)", () => {
  it("fasilədə vaxt getmir", () => {
    const a = { startedAt: 0, elapsedMs: 10_000, lastSeenAt: null };
    expect(activeElapsed(a, D, 10_000_000)).toBe(10_000);
    expect(remainingOf(a, D, 99_999_999)).toBe(D - 10_000);
  });
  it("açıq seans son siqnaldan bəri sayılır", () => {
    const a = { startedAt: 0, elapsedMs: 10_000, lastSeenAt: 100_000 };
    expect(activeElapsed(a, D, 105_000)).toBe(15_000);
  });
  it("siqnal kəsilibsə (vərəq bağlanıb), ən çox MAX_GAP sayılır", () => {
    const a = { startedAt: 0, elapsedMs: 0, lastSeenAt: 100_000 };
    expect(activeElapsed(a, D, 100_000 + 60 * 60_000)).toBe(MAX_GAP_MS);
  });
  it("müddətdən çox ola bilməz; qalan 0", () => {
    const a = { startedAt: 0, elapsedMs: D - 1_000, lastSeenAt: 0 };
    expect(activeElapsed(a, D, 20_000)).toBe(D);
    expect(remainingOf(a, D, 20_000)).toBe(0);
  });
  it("köhnə format (elapsedMs yoxdur) — başlanğıcdan bəri", () => {
    expect(activeElapsed({ startedAt: 0 }, D, 60_000)).toBe(60_000);
    expect(remainingOf({ startedAt: 0 }, D, 2 * D)).toBe(0);
  });
});
