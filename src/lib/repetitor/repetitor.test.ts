import { describe, expect, it, vi } from "vitest";

vi.mock("server-only", () => ({}));
vi.mock("@/db", () => ({ db: {} }));

const { LETTERS } = await import("@/lib/demo/content");
const { seedState } = await import("@/lib/demo/state");
const { MOCK_KEYS, MOCK_QUESTIONS, MOCK_TOPICS } = await import("./mock");
const { nextRepetitorHref, repetitorPager, topicProgress } = await import("./progress");
const plan = await import("./plan");

const topic = (slug: string, n: number) => ({
  slug,
  name: slug.toUpperCase(),
  questions: Array.from({ length: n }, (_, i) => ({ id: `${slug}${i + 1}` })),
});

describe("onlayn repetitor: fikstur (bazadakı ilkin suallar)", () => {
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
  });
});

describe("onlayn repetitor: plan", () => {
  it("60-dan çox sualı olan mövzu iki dərsə bölünür; sualsız mövzu plana düşmür", () => {
    const c = plan.buildCurriculum([topic("a", 61), topic("bos", 0), topic("b", 60), topic("c", 5)]);
    expect(c.lessons.map((l) => [l.topic, l.part, l.parts, l.questionIds.length, l.firstN])).toEqual([
      ["a", 1, 2, 31, 1],
      ["a", 2, 2, 30, 32],
      ["b", 1, 1, 60, 1],
      ["c", 1, 1, 5, 1],
    ]);
  });

  it("hər 2 mövzudan sonra 20 suallıq sınaq — hər mövzudan növbə ilə", () => {
    const c = plan.buildCurriculum([topic("a", 30), topic("b", 4), topic("c", 10), topic("d", 3), topic("e", 9)]);
    expect(c.exams).toHaveLength(2);
    const [e1, e2] = c.exams;
    expect(e1.topics.map((t) => t.slug)).toEqual(["a", "b"]);
    expect(e1.afterLesson).toBe(1);
    expect(e1.questionIds).toHaveLength(20);
    expect(e1.questionIds.slice(0, 4)).toEqual(["a1", "b1", "a2", "b2"]);
    expect(new Set(e1.questionIds).size).toBe(20);
    // Az sual varsa, hamısı (10 + 3 = 13)
    expect(e2.questionIds).toHaveLength(13);
  });

  it("həftənin 2-ci və 4-cü günləri: dərslər həmin günlərdə açılır", () => {
    // 2026-10-05 — bazar ertəsi
    expect(plan.weekdayOf("2026-10-05")).toBe(1);
    const p = { days: [2, 4], start: "2026-10-05", offset: 0 };
    expect(plan.unlockedCount(p, "2026-10-05", 10)).toBe(0);
    expect(plan.unlockedCount(p, "2026-10-06", 10)).toBe(1); // çərşənbə axşamı
    expect(plan.unlockedCount(p, "2026-10-08", 10)).toBe(2); // cümə axşamı
    expect(plan.unlockedCount(p, "2026-10-13", 10)).toBe(3);
    expect(plan.unlockedCount(p, "2027-12-31", 10)).toBe(10);
    expect([0, 1, 2, 3].map((i) => plan.lessonDate(p, i))).toEqual(["2026-10-06", "2026-10-08", "2026-10-13", "2026-10-15"]);
  });

  it("qrafik dəyişəndə açılmış dərslər açıq qalır, qalanları sabahdan yeni günlərə düşür", () => {
    const old = { days: [2, 4], start: "2026-10-05", offset: 0 };
    const p = plan.changePlan(old, [6], "2026-10-08", 10); // cümə axşamı → şənbə
    expect(p).toEqual({ days: [6], start: "2026-10-09", offset: 2 });
    expect(plan.unlockedCount(p, "2026-10-09", 10)).toBe(2);
    expect(plan.lessonDate(p, 1)).toBeNull();
    expect(plan.lessonDate(p, 2)).toBe("2026-10-10");
  });

  it("status: bitmiş mövzu ✓, sınaq hər iki mövzu bitəndə açılır", () => {
    const c = plan.buildCurriculum([topic("a", 2), topic("b", 2), topic("c", 2)]);
    const p = { days: [1, 2, 3, 4, 5, 6, 7], start: "2026-10-05", offset: 0 };
    const answered = new Set(["a1", "a2", "b1"]);
    let v = plan.planView(c, p, (id) => answered.has(id), {}, "2026-10-06"); // 2 dərs açıq
    expect(v.lessons.map((l) => l.status)).toEqual(["done", "open", "locked"]);
    expect([...v.doneTopics]).toEqual(["a"]);
    expect(v.exams[0].status).toBe("locked");

    answered.add("b2");
    v = plan.planView(c, p, (id) => answered.has(id), {}, "2026-10-06");
    expect([...v.doneTopics]).toEqual(["a", "b"]);
    expect(v.exams[0].status).toBe("open");

    const rec = { answers: { a1: "A" as const }, results: { a1: true, b1: false }, finishedAt: 1 };
    v = plan.planView(c, p, (id) => answered.has(id), { [plan.examKey(1)]: rec }, "2026-10-06");
    expect(v.exams[0]).toMatchObject({ status: "done", correct: 1 });
  });
});

describe("onlayn repetitor: proqres", () => {
  const topics = MOCK_TOPICS.map((t) => ({ ...t, questions: MOCK_QUESTIONS.filter((q) => q.topic === t.slug) }));

  it("cavab pager-də düz/səhv kimi görünür, bağlı dərsin sualı kilidlidir, növbəti — açıq cavabsız sual", () => {
    const s = seedState("u");
    const [first, second, third] = topics[0].questions;
    expect(nextRepetitorHref(s, topics)).toBe(`/onlayn-repetitor/${topics[0].slug}/1`);
    s.tutor = { [first.id]: { a: "A", ok: true }, [second.id]: { hint: true } };
    const isOpen = (id: string) => id !== third.id;
    expect(repetitorPager(s, topics[0], undefined, isOpen).map((p) => p.status)).toEqual(["ok", "open", "locked", "open"]);
    expect(topicProgress(s, topics[0])).toEqual({ done: 1, ok: 1, total: 4 });
    // Yalnız ipucuna baxılıb — sual hələ cavabsızdır
    expect(nextRepetitorHref(s, topics, first, isOpen)).toBe(`/onlayn-repetitor/${topics[0].slug}/2`);
    expect(nextRepetitorHref(s, topics, second, isOpen)).toBe(`/onlayn-repetitor/${topics[0].slug}/4`);
  });
});
