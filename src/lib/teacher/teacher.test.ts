import { describe, expect, it, vi } from "vitest";

vi.mock("server-only", () => ({}));

const { answerKey, gradeEntries, makeVariants, percentOf, shownOf } = await import("./variants");
const { academicYear, topicCounts } = await import("./year");

describe("mövzu sınağı: tədris ili və bölmələr", () => {
  const baku = (iso: string) => new Date(`${iso}+04:00`).getTime();
  it("tədris ili 1 sentyabr – 1 iyul; iyul–avqust gələn ilə aiddir", () => {
    expect(academicYear(baku("2026-10-11T12:00:00")).label).toBe("2026–2027");
    expect(academicYear(baku("2027-06-30T23:59:00")).label).toBe("2026–2027");
    expect(academicYear(baku("2027-07-01T00:00:00")).label).toBe("2027–2028");
    expect(academicYear(baku("2027-01-15T10:00:00")).from).toBe(baku("2026-07-01T00:00:00"));
  });
  it("15 / 20 / 25 sual: ¾ qapalı, ¼ kodlaşdırılan", () => {
    for (const n of [15, 20, 25]) {
      const c = topicCounts(n);
      expect(c.closed + c.coded).toBe(n);
    }
    expect(topicCounts(20)).toEqual({ closed: 15, coded: 5, written: 0 });
  });
});

const seeded = (seed: number) => () => ((seed = (seed * 1103515245 + 12345) % 2 ** 31) / 2 ** 31);

// 10 qapalı (hamısının düzgün cavabı B), 2 kodlaşdırılan, 1 yazılı
const items = [
  ...Array.from({ length: 10 }, (_, i) => ({ n: i + 1, format: "closed" as const, correct: "B" as const })),
  { n: 11, format: "coded" as const, answer: "12,5" },
  { n: 12, format: "coded" as const, answer: "-3" },
  { n: 13, format: "written" as const },
];

describe("müəllim sınağı: variantlar", () => {
  it("sıra bölmə daxilində qarışır, düzgün cavablar A–E arasında paylanır, variantlar fərqlidir", () => {
    const vs = makeVariants(items, 4, true, seeded(1));
    expect(vs.map((v) => v.letter)).toEqual(["A", "B", "C", "D"]);
    for (const v of vs) {
      // Bölmələrin yeri dəyişmir
      expect(v.order.slice(0, 10).sort((a, b) => a - b)).toEqual([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      expect(v.order.slice(10, 12).sort()).toEqual([11, 12]);
      expect(v.order[12]).toBe(13);
      // Hamısı "B" olsa da, göstərilən düzgün cavablar 5 hərfə paylanır (10 sual → hər hərf 2 dəfə)
      const shown = v.order.slice(0, 10).map((n) => shownOf(v.maps[n], "B"));
      for (const l of ["A", "B", "C", "D", "E"]) expect(shown.filter((x) => x === l)).toHaveLength(2);
    }
    expect(new Set(vs.map((v) => v.order.join(","))).size).toBeGreaterThan(1);
  });

  it("düzgün cavabların ardıcıllığı dövri deyil (A, B, C, D, E, A… kimi təxmin edilə bilməz)", () => {
    const rand = seeded(7);
    const cyclic = (s: string) => [...s].every((l, i) => i === 0 || "ABCDE".indexOf(l) === ("ABCDE".indexOf(s[i - 1]) + 1) % 5);
    const keys = makeVariants(items, 10, true, rand).map((v) => answerKey(v, items).slice(0, 10).join(""));
    expect(keys.filter(cyclic)).toHaveLength(0);
    expect(new Set(keys).size).toBe(10);
  });

  it("variant söndürülübsə — hamıya eyni sıra, hərf A, cavablar dəyişmir", () => {
    const [a, b] = makeVariants(items, 2, false);
    expect(a.order).toEqual(items.map((i) => i.n));
    expect(b.letter).toBe("A");
    expect(answerKey(a, items).slice(0, 3)).toEqual(["B", "B", "B"]);
  });

  it("cavab açarı hər variant üçün düzgündür; kağız nəticəsi şagirdin variantına görə yoxlanılır", () => {
    const [v] = makeVariants(items, 1, true, seeded(5));
    const key = answerKey(v, items);
    // Açardakı cavabları yazan şagird — tam bal (yazılı 1 bal)
    const entries = key.map((k) => (k === "yazılı" ? "1" : k));
    const g = gradeEntries(v, items, entries);
    expect(g.every((x) => x.score === 1)).toBe(true);
    expect(g.find((x) => x.n === 1)!.given).toBe("B"); // orijinal hərfə çevrilir
    expect(percentOf(g, items.length)).toBe(100);
    // Kodlaşdırılan: "12.5" = "12,5"; səhv hərf — 0; yazılı 0,5
    const wrong = [...entries];
    wrong[0] = key[0] === "A" ? "C" : "A";
    wrong[10] = v.order[10] === 11 ? "12.5" : "-3";
    wrong[12] = "0,5";
    const g2 = gradeEntries(v, items, wrong);
    expect(g2.find((x) => x.n === v.order[0])!.score).toBe(0);
    expect(g2.find((x) => x.n === v.order[10])!.score).toBe(1);
    expect(g2.find((x) => x.n === 13)!.score).toBe(0.5);
  });
});
