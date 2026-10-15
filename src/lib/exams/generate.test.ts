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

  it("mövzular arasında bərabər paylanır (qayda: hər mövzudan 1, artıq yerlər növbə ilə); tədris sırası ilə", () => {
    const items = generateExam({
      sections: [{ format: "closed", count: 12, firstNo: 1 }],
      examType: "11",
      topics,
      tasks,
      rand: seeded(3),
    });
    const by = (id: number) => items.filter((i) => i.code.startsWith(`T${id}-`)).length;
    expect([by(1), by(2), by(3)]).toEqual([4, 4, 4]);
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

  it("mövzunun bütün sualları istifadə olunubsa — təkrar ola bilər (ən az istifadə olunanlardan)", () => {
    const one = [{ id: 1, curriculumOrder: 1, dimFrequency: 1, examTypes: ["movzu"] }];
    const usage = new Map(tasks.filter((t) => t.topicId === 1 && t.format === "closed").map((t, i) => [t.code, i % 3 === 0 ? 1 : 2]));
    const items = generateExam({ sections: [{ format: "closed", count: 10, firstNo: 1 }], examType: "movzu", topics: one, tasks, usage, rand: seeded(6) });
    expect(items).toHaveLength(10);
    expect(items.every((i) => i.code.startsWith("T1-C"))).toBe(true);
    // 20 qapalı sualdan 7-si bir dəfə istifadə olunub — hamısı seçilir, qalanı ikinci dəfə istifadə olunanlardan.
    expect(items.filter((i) => usage.get(i.code) === 1)).toHaveLength(7);
  });

  describe("mövzu başına sabit say", () => {
    // 27 mövzu: 1–3 — loqarifm, limit, stereometriya; limit və 25 yalnız blokda; 21, 22 — yalnız 11 və blok
    const SLUGS: Record<number, string> = { 1: "loqarifm-ustlu-tenlik-berabersizlik", 2: "limit-toreme-inteqral", 3: "stereometriya" };
    const many: GenTopic[] = Array.from({ length: 27 }, (_, k) => {
      const id = k + 1;
      const examTypes = id === 2 || id === 25 ? ["blok"] : id === 1 || id === 3 || id === 21 || id === 22 ? ["11", "blok"] : ["9", "11", "blok"];
      return { id, slug: SLUGS[id] ?? `m${id}`, curriculumOrder: id, dimFrequency: 0.2 + (id % 7) * 0.3, examTypes };
    });
    // Mövzu 27 — yalnız yazılı sualı var (isbat kimi)
    const bank: GenTask[] = many.flatMap((t) =>
      Array.from({ length: 6 }, (_, i) =>
        t.id === 27
          ? [{ code: `M${t.id}-W${i}`, topicId: t.id, format: "written", answerValue: null, hasOptions: false }]
          : [
              { code: `M${t.id}-C${i}`, topicId: t.id, format: "closed", answerValue: null, hasOptions: true },
              { code: `M${t.id}-O${i}`, topicId: t.id, format: "open", answerValue: "12", hasOptions: false },
              { code: `M${t.id}-W${i}`, topicId: t.id, format: "written", answerValue: null, hasOptions: false },
            ],
      ).flat(),
    );
    const count = (items: { code: string }[]) => {
      const m = new Map<number, number>();
      for (const i of items) m.set(Number(i.code.slice(1).split("-")[0]), (m.get(Number(i.code.slice(1).split("-")[0])) ?? 0) + 1);
      return m;
    };
    const BLOK = [
      { format: "closed" as const, count: 22, firstNo: 1 },
      { format: "coded" as const, count: 5, firstNo: 23 },
      { format: "written" as const, count: 3, firstNo: 28 },
    ];
    const ELEVEN = [
      { format: "closed" as const, count: 13, firstNo: 1 },
      { format: "coded" as const, count: 5, firstNo: 14 },
      { format: "written" as const, count: 7, firstNo: 19 },
    ];

    it("blok: loqarifm, limit, stereometriya — 2, qalan 27 mövzudan hər biri 1 (30 sual)", () => {
      for (let seed = 1; seed <= 20; seed++) {
        const items = generateExam({ sections: BLOK, examType: "blok", topics: many, tasks: bank, rand: seeded(seed) });
        expect(items).toHaveLength(30);
        const m = count(items);
        for (const t of many) expect(m.get(t.id) ?? 0, `seed ${seed}, mövzu ${t.id}`).toBe(t.id <= 3 ? 2 : 1);
      }
    });

    it("11: loqarifm və stereometriya — 2, qalanlardan ən çox 1 (yer azdır — bəzi mövzular düşür)", () => {
      for (let seed = 1; seed <= 20; seed++) {
        const items = generateExam({ sections: ELEVEN, examType: "11", topics: many, tasks: bank, rand: seeded(seed) });
        expect(items).toHaveLength(25);
        const m = count(items);
        expect(m.get(1)).toBe(2);
        expect(m.get(3)).toBe(2);
        expect(m.has(2)).toBe(false);
        for (const [id, n] of m) if (id > 3) expect(n, `mövzu ${id}`).toBe(1);
      }
    });

    it("9: hər mövzudan 1; mövzu yerdən azdırsa — artıq yerlər, ən çox 2", () => {
      const items = generateExam({ sections: NINE, examType: "9", topics: many, tasks: bank, rand: seeded(9) });
      expect(items).toHaveLength(25);
      const m = count(items);
      const nine = many.filter((t) => t.examTypes.includes("9"));
      for (const t of nine) expect(m.get(t.id) ?? 0).toBeGreaterThanOrEqual(1);
      expect(Math.max(...m.values())).toBeLessThanOrEqual(2);
      expect([...m.keys()].every((id) => nine.some((t) => t.id === id))).toBe(true);
    });
  });

  it("əl ilə seçilmiş suallar sınağa düşür, qalan yerlər avtomatik doldurulur; yaramayan seçim nəzərə alınmır", () => {
    // T2-O2 — ədədi cavabı olmayan açıq sual: heç bir bölməyə yaramır.
    const preset = { closed: ["T2-C5", "T1-C7", "T2-O2"], written: ["T1-W3"] };
    const items = generateExam({ sections: NINE, examType: "9", topics, tasks, preset, rand: seeded(7) });
    expect(items).toHaveLength(25);
    const codes = items.map((i) => i.code);
    expect(codes).toEqual(expect.arrayContaining(["T2-C5", "T1-C7", "T1-W3"]));
    expect(codes).not.toContain("T2-O2");
    expect(new Set(codes).size).toBe(25);
  });
});
