import { describe, expect, it, vi } from "vitest";

vi.mock("server-only", () => ({}));
vi.mock("@/db", () => ({ db: {} }));
// Repetitor sualları bazadan gəlir — testdə eyni məlumatı fiksturdan veririk.
vi.mock("@/lib/repetitor/source", async () => {
  const m = await import("@/lib/repetitor/mock");
  const { DAILY } = await import("@/lib/demo/content");
  const { DAILY_KEYS } = await import("@/lib/demo/keys");
  const real: Record<string, string> = {
    faiz: "faiz-nisbet-tenasub", funksiya: "funksiya-ve-qrafikler", triqonometriya: "triqonometriya", ucbucaq: "ucbucaqlar",
    loqarifm: "loqarifm-ustlu-tenlik-berabersizlik", ardicilliq: "ededi-ardicilliqlar-silsileler", feza: "stereometriya",
  };
  const questions = [...m.MOCK_QUESTIONS, ...DAILY.map((q) => ({ ...q, topic: real[q.topic] }))];
  const slugs = [...new Set(questions.map((q) => q.topic))];
  return {
    listRepetitorTopics: async () => slugs.map((slug) => ({ slug, name: slug, questions: questions.filter((q) => q.topic === slug) })),
    getRepetitorKey: async (id: string) => m.MOCK_KEYS[id] ?? (DAILY_KEYS[id] ? { ...DAILY_KEYS[id], hint: "" } : null),
  };
});
const { DAILY, EXAM_QUESTIONS } = await import("@/lib/demo/content");
const { DAILY_KEYS, EXAM_KEYS } = await import("@/lib/demo/keys");
const { seedState } = await import("@/lib/demo/state");
const { practicePool, getPracticeKey } = await import("./pool");
const { buildReview, listMistakes, REVIEW_MAX } = await import("./mistakes");

const paid = () => ({ ...seedState("u"), sub: { status: "active" as const, periodEnd: "2099-01-01" } });

describe("səhvlərim: sual hovuzu", () => {
  it("günün sualları, repetitor və sınağın qapalı sualları; hər birinin açarı var", async () => {
    const pool = await practicePool();
    expect(pool.filter((q) => q.source === "bank")).toHaveLength(DAILY.length + 20);
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
    expect(refs).toEqual(["q:f2", "q:t1", "e:3", "q:st1"].sort());
    const f2 = (await listMistakes(s, pool)).find((m) => m.q.ref === "q:f2")!;
    expect(f2.correct).toBe(DAILY_KEYS.f2.answer);
  });

  it("təkrarda düzəldilən səhv 'fixed' olur və yeni seansa düşmür", async () => {
    const pool = await practicePool();
    const s = paid();
    s.daily = { f2: "A", t1: "A" };
    s.fixed = { "d:f2": 1 }; // köhnə ref — q:f2 kimi tanınır
    const mistakes = await listMistakes(s, pool);
    expect(mistakes.find((m) => m.q.ref === "q:f2")?.fixed).toBe(true);
    const items = buildReview(s, pool, mistakes);
    expect(items.filter((i) => i.kind === "mistake").map((i) => i.ref)).toEqual(["q:t1"]);
  });
});

describe("səhvlərim: təkrar seansı", () => {
  it("hər səhvdən sonra oxşar suallar: əvvəl eyni tip; sınaq sualı oxşar kimi verilmir", async () => {
    const pool = await practicePool();
    const s = paid();
    s.daily = { f2: "A" }; // tip: "Ardıcıl faiz artımı" (f9 da bu tipdədir)
    const items = buildReview(s, pool, await listMistakes(s, pool));
    expect(items[0]).toEqual({ ref: "q:f2", kind: "mistake" });
    expect(items.slice(1).every((i) => i.kind === "similar")).toBe(true);
    expect(items[1].ref).toBe("q:f9");
    expect(items.some((i) => i.ref.startsWith("e:"))).toBe(false);
  });

  it("Free planda oxşar suallar yoxdur; ümumi say limitdən çox deyil", async () => {
    const pool = await practicePool();
    const free = seedState("u");
    free.daily = { f1: "A" };
    const items = buildReview(free, pool, await listMistakes(free, pool));
    expect(items).toEqual([{ ref: "q:f1", kind: "mistake" }]);

    const s = paid();
    s.daily = Object.fromEntries(DAILY.map((q) => [q.id, DAILY_KEYS[q.id].answer === "A" ? "B" : "A"]));
    const many = buildReview(s, pool, await listMistakes(s, pool));
    expect(many).toHaveLength(REVIEW_MAX);
    expect(many.every((i) => i.kind === "mistake")).toBe(true);
  });
});
