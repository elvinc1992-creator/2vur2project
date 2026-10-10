import { describe, expect, it, vi } from "vitest";

vi.mock("server-only", () => ({}));
vi.mock("@/db", () => ({ db: {} }));

const { newAnswers } = await import("./answer-log");
const { seedState } = await import("./state");
const { gradeExam } = await import("./logic");

describe("newAnswers", () => {
  it("yalnız yeni cavabları qaytarır, skip-i saymır", () => {
    const prev = seedState("u");
    prev.daily = { t1: "C" };
    const next = structuredClone(prev);
    next.daily = { t1: "C", t2: "B", t3: "skip" };
    next.tutor = { x1: { a: "A", ok: true }, x2: { hint: true } };
    // Vaxt və dəyişiklik sayı (zəif mövzuların təhlili üçün) cavabla birlikdə yazılır.
    next.answerMeta = { "daily:t2": { ms: 42_000, ch: 2 } };
    expect(newAnswers(prev, next)).toEqual([
      { source: "daily", questionRef: "t2", correct: false, chosen: "B", timeMs: 42_000, changes: 2 },
      { source: "tutor", questionRef: "x1", correct: true, chosen: "A" },
    ]);
  });

  it("bitmiş sınağın qapalı/kodlaşdırılan cavablarını yazır, yazılıları yox", () => {
    const prev = seedState("u");
    const next = structuredClone(prev);
    next.results["1"] = { ...gradeExam({ "1": "C", "2": "A", "14": "42", "21": "w" }), meta: { "2": { ms: 5000, ch: 3 } }, flags: [2] };
    const e = { source: "exam", examId: "1" };
    expect(newAnswers(prev, next)).toEqual([
      { ...e, questionRef: "1:1", correct: true, chosen: "C", flagged: false },
      { ...e, questionRef: "1:2", correct: false, chosen: "A", flagged: true, timeMs: 5000, changes: 3 },
      { ...e, questionRef: "1:14", correct: true, chosen: "42", flagged: false },
    ]);
    // Eyni nəticə ikinci dəfə yazılmır
    expect(newAnswers(next, structuredClone(next))).toEqual([]);
  });

  it("yeni təkrar seansında köhnə cavablar təkrar sayılmır", () => {
    const prev = seedState("u");
    prev.review = { items: [], answers: { "d:t1": { a: "C", ok: true } }, startedAt: 1 };
    const same = structuredClone(prev);
    same.review!.answers["d:t2"] = { a: "B", ok: false };
    expect(newAnswers(prev, same)).toEqual([{ source: "review", questionRef: "d:t2", correct: false, chosen: "B" }]);
  });
});
