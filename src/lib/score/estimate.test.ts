import { describe, expect, it, vi } from "vitest";

vi.mock("server-only", () => ({}));
vi.mock("@/db", () => ({ db: {} }));

const { estimateCorrect, scoreEstimate } = await import("./estimate");
const { topicOfAnswer } = await import("./estimate-db");

describe("scoreEstimate", () => {
  it("200 sualdan 120 düzgün → 60%, buraxılışda 14, blokda 17", () => {
    const r = scoreEstimate({ total: 200, correct: 120, topics: 4 });
    expect(r.ready).toBe(true);
    expect(r.pct).toBe(60);
    expect(r.buraxilis).toBe(14);
    expect(r.blok).toBe(17);
  });

  it("ən azı 4 fərqli mövzudan 20 sual olmalıdır", () => {
    expect(scoreEstimate({ total: 19, correct: 19, topics: 4 }).ready).toBe(false);
    expect(scoreEstimate({ total: 100, correct: 50, topics: 3 }).ready).toBe(false);
    expect(scoreEstimate({ total: 20, correct: 10, topics: 4 }).ready).toBe(true);
  });

  it("cavab yoxdursa və ya çox azdırsa 0; hamısı düzgündürsə N − 1", () => {
    expect(estimateCorrect(25, { total: 0, correct: 0 })).toBe(0);
    expect(estimateCorrect(25, { total: 10, correct: 0 })).toBe(0);
    expect(estimateCorrect(25, { total: 40, correct: 40 })).toBe(24);
  });
});

describe("topicOfAnswer", () => {
  const bank = new Map([
    ["t1", "Triqonometriya"],
    ["st1", "Stereometriya"],
  ]);
  it("bank sualı, təkrar, repetitor sınağı və sınaq istinadları mövzuya çevrilir", () => {
    expect(topicOfAnswer("daily", "t1", bank)).toBe("Triqonometriya");
    expect(topicOfAnswer("review", "q:st1", bank)).toBe("Stereometriya");
    expect(topicOfAnswer("review", "d:t1", bank)).toBe("Triqonometriya");
    expect(topicOfAnswer("tutor", "sinaq-1:st1", bank)).toBe("Stereometriya");
    // Sınaq: "sınaq:KOD" — sual bankdandır
    expect(topicOfAnswer("exam", "b11-1:st1", bank)).toBe("Stereometriya");
    expect(topicOfAnswer("daily", "yoxdur", bank)).toBeUndefined();
  });
});
