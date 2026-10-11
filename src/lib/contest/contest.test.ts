import { describe, expect, it } from "vitest";
import { evaluate, formatNum, renderTemplate } from "./expr";
import { advance, groupRanking, rank, shortName, tourPhase } from "./rules";
import { OPENING_TEMPLATES } from "./templates";
import { LETTERS, makeVariant, spreadLetters } from "./variant";

const seeded = (seed: number) => () => ((seed = (seed * 1103515245 + 12345) % 2 ** 31) / 2 ** 31);

describe("yarış: ifadələr", () => {
  it("əməllərin prioriteti, funksiyalar, müqayisə", () => {
    expect(evaluate("2 + 3*4^2")).toBe(50);
    expect(evaluate("(a + b)/2", { a: 3, b: 5 })).toBe(4);
    expect(evaluate("gcd(12, 18) + lcm(4, 6)")).toBe(18);
    expect(evaluate("a % 2 == 0 && a > 3", { a: 6 })).toBe(1);
    expect(evaluate("-a + 1", { a: 5 })).toBe(-4);
    expect(() => evaluate("x + 1")).toThrow();
    expect(() => evaluate("alert(1)")).toThrow();
    expect(formatNum(12.5)).toBe("12,5");
    expect(renderTemplate("$\\frac{[[a]]}{[[=a*2]]}$", { a: 3 })).toBe("$\\frac{3}{6}$");
  });
});

describe("yarış: variantlar", () => {
  it("20 şablonun hamısından düzgün variant yaranır: 5 fərqli cavab, düzgün cavab hədəf hərfdə", () => {
    const rand = seeded(1);
    for (const [i, t] of OPENING_TEMPLATES.entries()) {
      for (const target of LETTERS) {
        const v = makeVariant(t, target, rand);
        expect(v, `şablon ${i + 1}`).not.toBeNull();
        expect(new Set(Object.values(v!.options)).size, `şablon ${i + 1}`).toBe(5);
        expect(v!.options[target]).toBe(formatNum(evaluate(t.answer, v!.values)));
        expect(v!.text).not.toMatch(/\[\[/);
      }
    }
  });

  it("iştirakçılar üçün rəqəmlər fərqlidir", () => {
    const t = OPENING_TEMPLATES[2];
    const texts = new Set(Array.from({ length: 30 }, (_, i) => makeVariant(t, "A", seeded(i + 7))!.text));
    expect(texts.size).toBeGreaterThan(10);
  });

  it("düzgün cavablar A–E arasında bərabər paylanır", () => {
    const l = spreadLetters(20, seeded(3));
    for (const x of LETTERS) expect(l.filter((y) => y === x)).toHaveLength(4);
  });
});

describe("yarış: tur və sıralama", () => {
  const c = { startAt: 1_000_000, entryWindowMin: 10, durationMin: 25 };
  it("vaxt pəncərələri: əvvəl, açıq, gec, bitib", () => {
    expect(tourPhase(c, 999_999)).toBe("before");
    expect(tourPhase(c, 1_000_000 + 9 * 60_000)).toBe("open");
    expect(tourPhase(c, 1_000_000 + 11 * 60_000)).toBe("late");
    expect(tourPhase(c, 1_000_000 + 36 * 60_000)).toBe("ended");
  });

  it("sayğac dayanmır: qayıdanda vaxtı bitmiş suallar cavabsız sayılır, növbəti sual onların bitdiyi andan", () => {
    const a = { currentN: 1, currentStartedAt: 0, finishedAt: null };
    // 75 s-lik suallar; 200 s sonra qayıdır → 1 və 2 bitib, 3-cü sual 150 s-də başlayıb
    const r = advance(a, () => 75, 20, 200_000);
    expect(r.timedOut.map((x) => x.n)).toEqual([1, 2]);
    expect(r.state).toEqual({ currentN: 3, currentStartedAt: 150_000, finishedAt: null });
    // Son sualın vaxtı bitəndə tur bitir
    const end = advance({ currentN: 20, currentStartedAt: 0, finishedAt: null }, () => 75, 20, 80_000);
    expect(end.state.finishedAt).toBe(75_000);
  });

  it("bərabər bal — az vaxt irəlidə; bal və vaxt eynidirsə yer bölüşdürülür; diskvalifikasiya sıralanmır", () => {
    const r = rank([
      { id: "a", score: 18, totalMs: 900 },
      { id: "b", score: 19, totalMs: 1200 },
      { id: "c", score: 18, totalMs: 800 },
      { id: "d", score: 18, totalMs: 900 },
      { id: "e", score: 20, totalMs: 100, disqualified: true },
      { id: "f", score: 10, totalMs: 100 },
    ]);
    expect(r.map((x) => [x.id, x.place])).toEqual([
      ["b", 1],
      ["c", 2],
      ["a", 3],
      ["d", 3],
      ["f", 5],
      ["e", null],
    ]);
  });

  it("məktəb və rayon reytinqi: orta bal, ən az 3 iştirakçı; qısa ad", () => {
    const g = groupRanking([
      { key: "Bakı", score: 10 },
      { key: "Bakı", score: 14 },
      { key: "Bakı", score: 12 },
      { key: "Şəki", score: 20 },
      { key: "Şəki", score: 20 },
    ]);
    expect(g).toEqual([{ key: "Bakı", n: 3, avg: 12 }]);
    expect(shortName("Aysel", "Məmmədova")).toBe("Aysel M.");
  });
});
