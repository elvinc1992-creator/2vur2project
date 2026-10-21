import { describe, expect, it } from "vitest";
import { freqLevel, parseToplu, priorityScore, shownCounts, subtopicOf } from "./analysis";

describe("toplu istinadı", () => {
  it("hissə, səhifə və nömrələr", () => {
    expect(parseToplu("səh.96 №35")).toEqual([{ part: "I", page: 96, nos: [35] }]);
    expect(parseToplu("II h. səh.207 №23; səh.208 №44, 45")).toEqual([
      { part: "II", page: 207, nos: [23] },
      { part: "II", page: 208, nos: [44, 45] },
    ]);
    expect(parseToplu("II h. səh.268 №36–38")).toEqual([{ part: "II", page: 268, nos: [36, 37, 38] }]);
    expect(parseToplu("səh.197–198 (situasiya modelləri)")).toEqual([{ part: "I", page: 197, nos: [] }]);
    expect(parseToplu(null)).toEqual([]);
  });

  it("alt mövzu: eyni mövzu və hissədə ən yaxın başlanğıc səhifəsi", () => {
    const subs = [
      { id: 1, topicId: 7, part: "I", startPage: 20 },
      { id: 2, topicId: 7, part: "I", startPage: 22 },
      { id: 3, topicId: 8, part: "I", startPage: 21 },
      { id: 4, topicId: 7, part: "II", startPage: 5 },
    ];
    expect(subtopicOf(subs, 7, { part: "I", page: 21, nos: [] })).toBe(1);
    expect(subtopicOf(subs, 7, { part: "I", page: 30, nos: [] })).toBe(2);
    expect(subtopicOf(subs, 7, { part: "I", page: 10, nos: [] })).toBeNull();
    expect(subtopicOf(subs, 7, { part: "II", page: 9, nos: [] })).toBe(4);
  });
});

describe("tezlik və prioritet", () => {
  it("səviyyə göstərilən saydan: ≥30 yüksək, 20–29 orta, ≤19 aşağı", () => {
    expect(freqLevel(40)).toBe("high");
    expect(freqLevel(30)).toBe("high");
    expect(freqLevel(29)).toBe("mid");
    expect(freqLevel(20)).toBe("mid");
    expect(freqLevel(19)).toBe("low");
    expect(freqLevel(12)).toBe("low");
  });

  it("göstərilən sual sayı 12–40, tezliyə görə artır", () => {
    const shown = shownCounts([0, 3, 3, 10, 60]);
    expect(shown[0]).toBe(12);
    expect(shown[4]).toBe(40);
    expect(shown[1]).toBe(shown[2]);
    expect(shown[1]).toBeLessThan(shown[3]);
    expect(shownCounts([5])).toEqual([40]);
  });
  it("tez düşən və səhv edilən tip öndədir", () => {
    expect(priorityScore(10, 0, 4)).toBe(10);
    expect(priorityScore(10, 4, 4)).toBe(0);
    expect(priorityScore(10, 0, 1)).toBeCloseTo(3.33);
    expect(priorityScore(5, 1, 0)).toBe(0);
  });
});
