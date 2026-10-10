import { describe, expect, it, vi } from "vitest";

vi.mock("server-only", () => ({}));
vi.mock("@/db", () => ({ db: {} }));

const { newAnswers } = await import("./answer-log");
const { seedState } = await import("./state");
const { gradeExam } = await import("@/lib/exams/grade");

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
    const q = (n: number, code: string, format: "closed" | "coded" | "written") =>
      ({ n, code, format, topic: "t", topicName: "T", type: "tip", text: "", ref: "" }) as const;
    const questions = [q(1, "AA-1", "closed"), q(2, "AA-2", "closed"), q(14, "AA-14", "coded"), q(21, "AA-21", "written")];
    const keys = new Map([
      [1, { code: "AA-1", format: "closed" as const, answer: "C", steps: [] }],
      [2, { code: "AA-2", format: "closed" as const, answer: "B", steps: [] }],
      [14, { code: "AA-14", format: "coded" as const, answer: "42", steps: [] }],
      [21, { code: "AA-21", format: "written" as const, answer: "", steps: [] }],
    ]);
    next.results["b11-1"] = {
      ...gradeExam(questions, keys, { "1": "C", "2": "A", "14": "42", "21": "w" }),
      meta: { "2": { ms: 5000, ch: 3 } },
      flags: [2],
    };
    const e = { source: "exam", examId: "b11-1" };
    // İstinad — sualın bank kodu (sınaq dəyişsə də mövzu tapılır)
    expect(newAnswers(prev, next)).toEqual([
      { ...e, questionRef: "b11-1:AA-1", correct: true, chosen: "C", flagged: false },
      { ...e, questionRef: "b11-1:AA-2", correct: false, chosen: "A", flagged: true, timeMs: 5000, changes: 3 },
      { ...e, questionRef: "b11-1:AA-14", correct: true, chosen: "42", flagged: false },
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
