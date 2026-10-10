import { describe, expect, it } from "vitest";
import { fitsFormat, generateExam, isCodedAnswer, type GenTask, type GenTopic } from "./generate";

// Sabit təsadüfilik
const seeded = (seed: number) => () => ((seed = (seed * 1103515245 + 12345) % 2 ** 31) / 2 ** 31);

const topics: GenTopic[] = [
  { id: 1, curriculumOrder: 1, dimFrequency: 2, examTypes: ["9", "11", "blok"] },
  { id: 2, curriculumOrder: 2, dimFrequency: 1, examTypes: ["9", "11", "blok"] },
  { id: 3, curriculumOrder: 3, dimFrequency: 3, examTypes: ["11", "blok"] }, // 9-cu sinifdə yoxdur
];
const tasks: GenTask[] = topics.flatMap((t) =>
  Array.from({ length: 20 }, (_, i) => [
    { code: `T${t.id}-C${i}`, topicId: t.id, format: "closed", answerValue: null, hasOptions: true },
    { code: `T${t.id}-O${i}`, topicId: t.id, format: "open", answerValue: i % 2 ? "12" : "x=3", hasOptions: false },
    { code: `T${t.id}-W${i}`, topicId: t.id, format: "written", answerValue: null, hasOptions: false },
  ]).flat(),
);

// 9-cu sinif buraxılış: 15 qapalı (61–75), 6 açıq (76–81), 4 yazılı (82–85)
const NINE = [
  { format: "closed" as const, count: 15, firstNo: 61 },
  { format: "coded" as const, count: 6, firstNo: 76 },
  { format: "written" as const, count: 4, firstNo: 82 },
];

describe("sınaq generasiyası", () => {
  it("bölmələrin sayı, nömrələri və formatı imtahan quruluşuna uyğundur", () => {
    const items = generateExam({ sections: NINE, examType: "9", topics, tasks, rand: seeded(1) });
    expect(items).toHaveLength(25);
    expect(items.filter((i) => i.format === "closed").map((i) => i.n)).toEqual(Array.from({ length: 15 }, (_, i) => 61 + i));
    expect(items.filter((i) => i.format === "coded").map((i) => i.n)).toEqual([76, 77, 78, 79, 80, 81]);
    expect(items.filter((i) => i.format === "written").map((i) => i.n)).toEqual([82, 83, 84, 85]);
    expect(new Set(items.map((i) => i.code)).size).toBe(25);
  });

  it("imtahana aid olmayan mövzu düşmür; kodlaşdırılana yalnız ədədi cavablı açıq suallar", () => {
    const items = generateExam({ sections: NINE, examType: "9", topics, tasks, rand: seeded(2) });
    expect(items.some((i) => i.code.startsWith("T3-"))).toBe(false);
    for (const i of items.filter((x) => x.format === "coded")) expect(Number(i.code.split("O")[1]) % 2).toBe(1);
    expect(isCodedAnswer("-12,5")).toBe(true);
    expect(isCodedAnswer("1234567")).toBe(false);
    expect(fitsFormat({ code: "x", topicId: 1, format: "closed", answerValue: null, hasOptions: false }, "closed")).toBe(false);
  });

  it("mövzular DİM tezliyinə mütənasib, bir mövzudan ən çox 1/3; tədris sırası ilə", () => {
    const items = generateExam({
      sections: [{ format: "closed", count: 12, firstNo: 1 }],
      examType: "11",
      topics,
      tasks,
      rand: seeded(3),
    });
    const by = (id: number) => items.filter((i) => i.code.startsWith(`T${id}-`)).length;
    expect(by(3)).toBeLessThanOrEqual(4);
    expect(by(3)).toBeGreaterThanOrEqual(by(2));
    const order = items.map((i) => Number(i.code[1]));
    expect([...order].sort()).toEqual(order);
  });

  it("az istifadə olunmuş suallar üstündür — ikinci sınaq birincini təkrarlamır", () => {
    const first = generateExam({ sections: NINE, examType: "9", topics, tasks, rand: seeded(4) });
    const usage = new Map(first.map((i) => [i.code, 1]));
    const second = generateExam({ sections: NINE, examType: "9", topics, tasks, usage, rand: seeded(5) });
    const overlap = second.filter((i) => usage.has(i.code)).length;
    expect(overlap).toBe(0);
  });
});
