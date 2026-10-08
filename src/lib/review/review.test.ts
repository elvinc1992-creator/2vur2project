import { describe, expect, it, vi } from "vitest";

vi.mock("server-only", () => ({}));
vi.mock("next/headers", () => ({ cookies: vi.fn() }));

const { DAILY, EXAM_QUESTIONS } = await import("@/lib/demo/content");
const { DAILY_KEYS, EXAM_KEYS } = await import("@/lib/demo/keys");
const { seedState } = await import("@/lib/demo/state");
const { practicePool, getPracticeKey } = await import("./pool");
const { buildReview, listMistakes, REVIEW_MAX } = await import("./mistakes");

const paid = () => ({ ...seedState("u"), sub: { status: "active" as const, periodEnd: "2099-01-01" } });

describe("səhvlərim: sual hovuzu", () => {
  it("günün sualları, repetitor və sınağın qapalı sualları; hər birinin açarı var", async () => {
    const pool = await practicePool();
    expect(pool.filter((q) => q.source === "daily")).toHaveLength(DAILY.length);
    expect(pool.filter((q) => q.source === "exam")).toHaveLength(EXAM_QUESTIONS.filter((q) => q.format === "closed").length);
    for (const q of pool) expect(await getPracticeKey(q.ref), q.ref).not.toBeNull();
  });

  it("sınağın günün sualından götürülmüş sualı eyni açara malikdir", () => {
    for (const q of EXAM_QUESTIONS.filter((x) => x.format === "closed")) {
      const d = DAILY.find((x) => x.text === q.text);
      if (d) expect(EXAM_KEYS[q.n].answer, `${q.n} ↔ ${d.id}`).toBe(DAILY_KEYS[d.id].answer);
    }
  });
});

describe("səhvlərim: siyahı", () => {
  it("səhv və 'Bilmirəm' cavablar düşür, düzgünlər yox; sınaq sualı günün sualı ilə birləşir", async () => {
    const pool = await practicePool();
    const s = paid();
    s.daily = { f2: "A", f1: "B", t1: "skip" }; // f1 düzgündür
    s.tutor = { st1: { a: "A", ok: false }, st2: { a: "B", ok: true } };
    s.results = {
      "1": { score: 0, correct: 0, wrong: 2, empty: 0, pending: 0, byTopic: [], weak: [], finishedAt: 1, answers: { "1": "A", "3": "A" } },
    };
    const refs = (await listMistakes(s, pool)).map((m) => m.q.ref).sort();
    // e:1 = f2 (artıq var) → bir dəfə; e:3 — öz sualı
    expect(refs).toEqual(["d:f2", "d:t1", "e:3", "r:st1"].sort());
    const f2 = (await listMistakes(s, pool)).find((m) => m.q.ref === "d:f2")!;
    expect(f2.correct).toBe(DAILY_KEYS.f2.answer);
  });

  it("təkrarda düzəldilən səhv 'fixed' olur və yeni seansa düşmür", async () => {
    const pool = await practicePool();
    const s = paid();
    s.daily = { f2: "A", t1: "A" };
    s.fixed = { "d:f2": 1 };
    const mistakes = await listMistakes(s, pool);
    expect(mistakes.find((m) => m.q.ref === "d:f2")?.fixed).toBe(true);
    const items = buildReview(s, pool, mistakes);
    expect(items.filter((i) => i.kind === "mistake").map((i) => i.ref)).toEqual(["d:t1"]);
  });
});

describe("səhvlərim: təkrar seansı", () => {
  it("hər səhvdən sonra oxşar suallar: əvvəl eyni tip; sınaq sualı oxşar kimi verilmir", async () => {
    const pool = await practicePool();
    const s = paid();
    s.daily = { f2: "A" }; // tip: "Ardıcıl faiz artımı" (f9 da bu tipdədir)
    const items = buildReview(s, pool, await listMistakes(s, pool));
    expect(items[0]).toEqual({ ref: "d:f2", kind: "mistake" });
    expect(items.slice(1).every((i) => i.kind === "similar")).toBe(true);
    expect(items[1].ref).toBe("d:f9");
    expect(items.some((i) => i.ref.startsWith("e:"))).toBe(false);
  });

  it("pulsuz planda oxşar suallar yalnız açıq suallardan; ümumi say limitdən çox deyil", async () => {
    const pool = await practicePool();
    const free = seedState("u");
    free.daily = { f1: "A" };
    const items = buildReview(free, pool, await listMistakes(free, pool));
    // Faiz mövzusunda açıq olan yeganə sual f1-dir → oxşar yoxdur
    expect(items).toEqual([{ ref: "d:f1", kind: "mistake" }]);

    const s = paid();
    s.daily = Object.fromEntries(DAILY.map((q) => [q.id, DAILY_KEYS[q.id].answer === "A" ? "B" : "A"]));
    const many = buildReview(s, pool, await listMistakes(s, pool));
    expect(many).toHaveLength(REVIEW_MAX);
    expect(many.every((i) => i.kind === "mistake")).toBe(true);
  });
});
