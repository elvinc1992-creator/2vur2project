import { describe, expect, it, vi } from "vitest";

vi.mock("server-only", () => ({}));
vi.mock("next/headers", () => ({ cookies: vi.fn() }));

const { DAILY, DAILY_TOPICS, FREE_DAILY_PER_TOPIC, LETTERS } = await import("./content");
const { DAILY_KEYS } = await import("./keys");
const { dailyOverview, dailyPager, hasPaidAccess, isDailyOpen, nextDailyHref, planStatus } = await import("./logic");
const { seedState } = await import("./state");

describe("günün sualları: məzmun", () => {
  it("hər mövzuda 10 sual, id-lər unikaldır", () => {
    for (const topic of DAILY_TOPICS) expect(DAILY.filter((q) => q.topic === topic)).toHaveLength(10);
    expect(new Set(DAILY.map((q) => q.id)).size).toBe(DAILY.length);
    expect(DAILY).toHaveLength(DAILY_TOPICS.length * 10);
  });

  it("hər sualın açarı və həlli var, variantlar təkrarlanmır", () => {
    for (const q of DAILY) {
      const key = DAILY_KEYS[q.id];
      expect(key, q.id).toBeDefined();
      expect(LETTERS).toContain(key.answer);
      expect(key.steps.length, q.id).toBeGreaterThan(0);
      expect(new Set(Object.values(q.options)).size, q.id).toBe(5);
    }
  });
});

describe("günün sualları: giriş", () => {
  const paid = () => ({ ...seedState("u"), sub: { status: "active" as const, periodEnd: "2099-01-01" } });

  it("yeni istifadəçi pulsuz planda: hər mövzudan yalnız 1-ci sual açıqdır", () => {
    const s = seedState("u");
    expect(planStatus(s)).toBe("free");
    expect(hasPaidAccess(s)).toBe(false);
    const ov = dailyOverview(s);
    expect(ov.open).toBe(DAILY_TOPICS.length * FREE_DAILY_PER_TOPIC);
    expect(ov.locked).toBe(DAILY.length - ov.open);
    const pager = dailyPager(s, "faiz");
    expect(pager.map((p) => p.status)).toEqual(["open", ...Array(9).fill("locked")]);
  });

  it("növbəti sual yalnız açıq suallardan seçilir", () => {
    const s = seedState("u");
    const first = DAILY.find((q) => q.topic === "triqonometriya")!;
    s.daily[first.id] = "A";
    expect(nextDailyHref(s, first)).toBe("/gunun-suallari/loqarifm/1");
    for (const topic of DAILY_TOPICS) s.daily[DAILY.find((q) => q.topic === topic)!.id] = "A";
    expect(nextDailyHref(s)).toBeNull();
  });

  it("abunə bütün sualları açır; ləğv edilib dövrü bitəndə yenə pulsuz", () => {
    const s = paid();
    expect(DAILY.every((q) => isDailyOpen(s, q))).toBe(true);
    expect(dailyOverview(s).locked).toBe(0);
    expect(planStatus({ ...s, sub: { status: "canceled", periodEnd: "2000-01-01" } })).toBe("free");
    expect(planStatus({ ...s, free: true })).toBe("free");
  });
});
