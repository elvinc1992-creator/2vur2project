import { describe, expect, it, vi } from "vitest";

vi.mock("server-only", () => ({}));
vi.mock("next/headers", () => ({ cookies: vi.fn() }));

const { LETTERS } = await import("@/lib/demo/content");
const { seedState } = await import("@/lib/demo/state");
const { MOCK_KEYS, MOCK_QUESTIONS, MOCK_TOPICS } = await import("./mock");
const { listRepetitorTopics } = await import("./source");
const { nextRepetitorHref, repetitorPager, topicProgress } = await import("./progress");

describe("onlayn repetitor: mock məlumat", () => {
  it("hər sualın mövzusu, açarı, ipucu və izahı var; variantlar təkrarlanmır", () => {
    const slugs = new Set(MOCK_TOPICS.map((t) => t.slug));
    expect(new Set(MOCK_QUESTIONS.map((q) => q.id)).size).toBe(MOCK_QUESTIONS.length);
    for (const q of MOCK_QUESTIONS) {
      expect(slugs.has(q.topic), q.id).toBe(true);
      const key = MOCK_KEYS[q.id];
      expect(key, q.id).toBeDefined();
      expect(LETTERS).toContain(key.answer);
      expect(key.hint.length, q.id).toBeGreaterThan(0);
      expect(key.steps.length, q.id).toBeGreaterThan(0);
      expect(new Set(Object.values(q.options)).size, q.id).toBe(5);
    }
    expect(Object.keys(MOCK_KEYS).sort()).toEqual(MOCK_QUESTIONS.map((q) => q.id).sort());
  });
});

describe("onlayn repetitor: proqres", () => {
  it("cavab pager-də düz/səhv kimi görünür, növbəti — cavabsız sual", async () => {
    const topics = await listRepetitorTopics();
    const s = seedState("u");
    const [first, second] = topics[0].questions;
    expect(nextRepetitorHref(s, topics)).toBe(`/onlayn-repetitor/${topics[0].slug}/1`);
    s.tutor = { [first.id]: { a: "A", ok: true }, [second.id]: { hint: true } };
    expect(repetitorPager(s, topics[0]).map((p) => p.status)).toEqual(["ok", "open", "open", "open"]);
    expect(topicProgress(s, topics[0])).toEqual({ done: 1, ok: 1, total: 4 });
    // Yalnız ipucuna baxılıb — sual hələ cavabsızdır
    expect(nextRepetitorHref(s, topics, first)).toBe(`/onlayn-repetitor/${topics[0].slug}/2`);
  });
});
