import { describe, expect, it, vi } from "vitest";

vi.mock("server-only", () => ({}));
vi.mock("@/db", () => ({ db: {} }));

// Sual bankı fiksturu: faiz (f1–f9, iki tip) və triqonometriya (t1–t20). Düzgün cavab: A, B, C… növbə ilə.
const LETTERS = ["A", "B", "C", "D", "E"] as const;
const bank = [
  ...Array.from({ length: 9 }, (_, i) => ({ id: `f${i + 1}`, topic: "faiz", type: i % 3 === 1 ? "Ardıcıl faiz" : "Faizin tapılması" })),
  ...Array.from({ length: 20 }, (_, i) => ({ id: `t${i + 1}`, topic: "trig", type: "Eyniliklər" })),
].map((q, i) => ({ ...q, freq: 0, text: q.id, options: { A: "1", B: "2", C: "3", D: "4", E: "5" }, ref: "", answer: LETTERS[i % 5] }));
const keyOf = (id: string) => {
  const q = bank.find((x) => x.id === id);
  return q ? { answer: q.answer, hint: "", steps: ["həll"] } : null;
};

vi.mock("@/lib/repetitor/source", () => ({
  listQuestionPool: async () =>
    ["faiz", "trig"].map((slug) => ({ slug, name: slug, questions: bank.filter((q) => q.topic === slug) })),
  getRepetitorKey: async (id: string) => keyOf(id),
  getRepetitorKeys: async (ids: string[]) => new Map(ids.flatMap((id) => (keyOf(id) ? [[id, keyOf(id)!] as const] : []))),
}));
vi.mock("@/lib/exams/source", () => ({
  listExams: async () => [{ id: "b11-1", title: "11-ci sinif buraxılış sınağı №1" }],
}));

const { seedState } = await import("@/lib/demo/state");
const { practicePool, getPracticeKey } = await import("./pool");
const { buildReview, listMistakes, REVIEW_MAX } = await import("./mistakes");

const paid = () => ({ ...seedState("u"), sub: { status: "active" as const, periodEnd: "2099-01-01" } });
const wrong = (id: string) => (keyOf(id)!.answer === "A" ? "B" : "A");

describe("səhvlərim: sual hovuzu", () => {
  it("bütün suallar bankdandır və açarı var", async () => {
    const pool = await practicePool();
    expect(pool).toHaveLength(bank.length);
    for (const q of pool) expect(await getPracticeKey(q.ref), q.ref).not.toBeNull();
    // Köhnə statik sınaq istinadları (e:n) artıq yoxdur
    expect(await getPracticeKey("e:3")).toBeNull();
  });
});

describe("səhvlərim: siyahı", () => {
  it("səhv və 'Bilmirəm' cavablar düşür, düzgünlər yox; sınağın qapalı səhvi bank sualı kimi", async () => {
    const pool = await practicePool();
    const s = paid();
    s.daily = { f2: wrong("f2"), f1: keyOf("f1")!.answer, t1: "skip" };
    s.tutor = { t2: { a: wrong("t2"), ok: false }, t3: { a: keyOf("t3")!.answer, ok: true } };
    s.results = {
      "b11-1": {
        score: 0, correct: 0, wrong: 2, empty: 0, pending: 0, byTopic: [], weak: [], finishedAt: 1,
        answers: { "1": wrong("f2"), "2": wrong("t4"), "14": "42" },
        items: { "1": { code: "f2", ok: false }, "2": { code: "t4", ok: false }, "14": { code: "t5", ok: false } },
      },
      // Köhnə statik sınağın nəticəsi (items yoxdur) — nəzərə alınmır
      "1": { score: 0, correct: 0, wrong: 1, empty: 0, pending: 0, byTopic: [], weak: [], finishedAt: 1, answers: { "1": "A" } },
    };
    const mistakes = await listMistakes(s, pool);
    expect(mistakes.map((m) => m.q.ref).sort()).toEqual(["q:f2", "q:t1", "q:t2", "q:t4"].sort());
    expect(mistakes.find((m) => m.q.ref === "q:t4")).toMatchObject({ where: "exam", examTitle: "11-ci sinif buraxılış sınağı №1" });
    expect(mistakes.find((m) => m.q.ref === "q:f2")!.correct).toBe(keyOf("f2")!.answer);
  });

  it("təkrarda düzəldilən səhv 'fixed' olur və yeni seansa düşmür", async () => {
    const pool = await practicePool();
    const s = paid();
    s.daily = { f2: wrong("f2"), t1: wrong("t1") };
    s.fixed = { "d:f2": 1 }; // köhnə ref — q:f2 kimi tanınır
    const mistakes = await listMistakes(s, pool);
    expect(mistakes.find((m) => m.q.ref === "q:f2")?.fixed).toBe(true);
    const items = buildReview(s, pool, mistakes);
    expect(items.filter((i) => i.kind === "mistake").map((i) => i.ref)).toEqual(["q:t1"]);
  });
});

describe("səhvlərim: təkrar seansı", () => {
  it("hər səhvdən sonra oxşar suallar: əvvəl eyni tip", async () => {
    const pool = await practicePool();
    const s = paid();
    s.daily = { f2: wrong("f2") }; // tip: "Ardıcıl faiz" (f5, f8 də bu tipdədir)
    const items = buildReview(s, pool, await listMistakes(s, pool));
    expect(items[0]).toEqual({ ref: "q:f2", kind: "mistake" });
    expect(items.slice(1).every((i) => i.kind === "similar")).toBe(true);
    expect(["q:f5", "q:f8"]).toContain(items[1].ref);
  });

  it("Free planda oxşar suallar yoxdur; ümumi say limitdən çox deyil", async () => {
    const pool = await practicePool();
    const free = seedState("u");
    free.daily = { f1: wrong("f1") };
    expect(buildReview(free, pool, await listMistakes(free, pool))).toEqual([{ ref: "q:f1", kind: "mistake" }]);

    const s = paid();
    s.daily = Object.fromEntries(bank.map((q) => [q.id, wrong(q.id)]));
    const many = buildReview(s, pool, await listMistakes(s, pool));
    expect(many).toHaveLength(REVIEW_MAX);
    expect(many.every((i) => i.kind === "mistake")).toBe(true);
  });
});
