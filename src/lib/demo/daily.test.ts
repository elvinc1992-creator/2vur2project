import { describe, expect, it, vi } from "vitest";

vi.mock("server-only", () => ({}));
vi.mock("@/db", () => ({ db: {} }));
vi.mock("@/auth", () => ({ auth: vi.fn() }));

const { DAILY_PER_TOPIC, DAILY_TOPICS_PER_DAY, FREE_DAILY_PER_TOPIC } = await import("./content");
const { dailyOverview, dailyPager, examStatus, isDailyOpen, nextDailyHref, planStatus } = await import("./logic");
const { buildDailyCtx, pickDailySet } = await import("./daily");
const { examQuota, periodBounds, tierOf } = await import("./plans");
const { seedState } = await import("./state");

// Sual bankı: 6 mövzu, hər birində 8 sual (bir mövzuda 3).
const bank = ["a", "b", "c", "d", "e", "f"].map((slug) => ({
  slug,
  name: slug.toUpperCase(),
  questions: Array.from({ length: slug === "f" ? 3 : 8 }, (_, i) => ({
    id: `${slug}${i + 1}`,
    topic: slug,
    type: `tip-${i % 2}`,
    freq: 1,
    text: `${slug}${i + 1}`,
    options: { A: "1", B: "2", C: "3", D: "4", E: "5" },
    ref: "",
  })),
}));

const seq = (...xs: number[]) => {
  let i = 0;
  return () => xs[i++ % xs.length];
};

const withSet = (s: ReturnType<typeof seedState>, answered = new Set<string>()) => {
  s.dailySet = pickDailySet(bank, answered, "2026-10-09", seq(0.1, 0.7, 0.3, 0.9, 0.5));
  return buildDailyCtx(s, bank);
};

const paid = (tier: "pro" | "premium") => ({ ...seedState("u"), sub: { status: "active" as const, periodEnd: "2099-01-01", tier } });

describe("günün sualları: təsadüfi dəst", () => {
  it("4 mövzu × 5 sual (az sualı olan mövzuda — nə qədər var)", () => {
    const set = pickDailySet(bank, new Set(), "2026-10-09");
    expect(set.topics).toHaveLength(DAILY_TOPICS_PER_DAY);
    expect(new Set(set.topics.map((t) => t.slug)).size).toBe(DAILY_TOPICS_PER_DAY);
    for (const t of set.topics) {
      expect(t.ids.length).toBe(t.slug === "f" ? 3 : DAILY_PER_TOPIC);
      expect(t.ids.every((id) => id.startsWith(t.slug))).toBe(true);
    }
  });

  it("həll olunmamış suallar və mövzular üstündür", () => {
    const answered = new Set(bank.filter((t) => t.slug !== "a" && t.slug !== "b").flatMap((t) => t.questions.map((q) => q.id)));
    answered.add("a1");
    answered.add("a2");
    const set = pickDailySet(bank, answered, "2026-10-09");
    expect(set.topics.slice(0, 2).map((t) => t.slug).sort()).toEqual(["a", "b"]);
    const a = set.topics.find((t) => t.slug === "a")!;
    expect(a.ids.includes("a1") || a.ids.includes("a2")).toBe(false);
  });
});

describe("planlar: günün sualları", () => {
  it("Free: hər mövzudan ilk 2 sual açıqdır", () => {
    const s = seedState("u");
    const ctx = withSet(s);
    expect(tierOf(s)).toBe("free");
    expect(planStatus(s)).toBe("free");
    const ov = dailyOverview(s, ctx);
    expect(ov.open).toBe(ctx.topics.length * FREE_DAILY_PER_TOPIC);
    const slug = ctx.topics.find((t) => t.ids.length === DAILY_PER_TOPIC)!.slug;
    expect(dailyPager(s, ctx, slug).map((p) => p.status)).toEqual(["open", "open", "locked", "locked", "locked"]);
    // Dəstdə olmayan sual açıq deyil
    const outside = bank.flatMap((t) => t.questions).find((q) => !ctx.topics.some((t) => t.ids.includes(q.id)))!;
    expect(isDailyOpen(s, ctx, outside.id)).toBe(false);
  });

  it("növbəti sual yalnız açıq suallardan", () => {
    const s = seedState("u");
    const ctx = withSet(s);
    for (const t of ctx.topics) t.ids.slice(0, 2).forEach((id) => (s.daily[id] = "A"));
    expect(nextDailyHref(s, ctx)).toBeNull();
  });

  it("Pro və Premium bütün sualları açır; ləğv edilib dövrü bitəndə Free", () => {
    for (const tier of ["pro", "premium"] as const) {
      const s = paid(tier);
      const ctx = withSet(s);
      expect(dailyOverview(s, ctx).locked).toBe(0);
    }
    const s = paid("pro");
    expect(tierOf({ ...s, sub: { ...s.sub, status: "canceled", periodEnd: "2000-01-01" } })).toBe("free");
    // Planlardan əvvəlki abunə — Premium
    expect(tierOf({ ...s, sub: { status: "active", periodEnd: "2099-01-01" } })).toBe("premium");
  });
});

describe("planlar: sınaq kvotası", () => {
  const now = Date.parse("2026-10-09T10:00:00Z"); // cümə

  it("dövrlər Bakı vaxtı ilə: ay və bazar ertəsindən başlayan həftə", () => {
    expect(periodBounds("month", now)).toEqual({ start: "2026-10-01", next: "2026-11-01" });
    expect(periodBounds("week", now)).toEqual({ start: "2026-10-05", next: "2026-10-12" });
  });

  it("Free — ayda 1, Pro — həftədə 1, Premium — hamısı", () => {
    const free = seedState("u");
    expect(examQuota(free, now)).toMatchObject({ kind: "month", left: 1 });
    free.examClaims = [{ id: "1", at: Date.parse("2026-10-02T10:00:00Z") }];
    expect(examQuota(free, now)).toMatchObject({ kind: "month", left: 0, resetsAt: "2026-11-01" });
    free.examClaims = [{ id: "1", at: Date.parse("2026-09-30T10:00:00Z") }];
    expect(examQuota(free, now)).toMatchObject({ left: 1 });

    const pro = paid("pro");
    pro.examClaims = [{ id: "1", at: Date.parse("2026-10-04T10:00:00Z") }]; // keçən həftə (bazar)
    expect(examQuota(pro, now)).toMatchObject({ kind: "week", left: 1 });
    pro.examClaims.push({ id: "2", at: Date.parse("2026-10-06T10:00:00Z") });
    expect(examQuota(pro, now)).toMatchObject({ kind: "week", left: 0, resetsAt: "2026-10-12" });

    const premium = paid("premium");
    expect(examQuota(premium, now)).toEqual({ kind: "all" });
    const exam = { id: "b11-3", durationMin: 90 } as Parameters<typeof examStatus>[1];
    expect(examStatus(premium, exam)).toBe("purchased");
    expect(examStatus(seedState("u"), exam)).toBe("locked");
  });
});
