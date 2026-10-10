import { describe, expect, it } from "vitest";
import { analyze, isSuspicious, lossOf, mainError, mastery, statusOf, topGain, totalLoss, type Attempt, type TopicMeta } from "./compute";
import { shownLetter, spreadCorrect } from "./spread";

const DAY = 86_400_000;
const NOW = Date.UTC(2026, 9, 10, 12);

const topic = (id: number, slug: string, over: Partial<TopicMeta> = {}): TopicMeta => ({
  id,
  slug,
  name: slug,
  section: "Cəbr",
  dimFrequency: 2,
  examTypes: ["9", "11", "blok"],
  prerequisiteId: null,
  ...over,
});

const att = (topic: string, correct: boolean, days = 0, over: Partial<Attempt> = {}): Attempt => ({
  topic,
  question: `${topic}-${Math.random()}`,
  correct,
  at: NOW - days * DAY,
  difficulty: 2,
  ...over,
});

const many = (topic: string, ok: number, bad: number, days = 0, over: Partial<Attempt> = {}) => [
  ...Array.from({ length: ok }, () => att(topic, true, days, over)),
  ...Array.from({ length: bad }, () => att(topic, false, days, over)),
];

describe("mənimsəmə", () => {
  it("cəhd yoxdursa — 50% (ilkin fərziyyə)", () => {
    expect(mastery([], NOW)).toBeCloseTo(0.5);
  });

  it("az cəhd → 'Məlumat azdır'", () => {
    expect(statusOf(0.2, 4)).toBe("few");
    expect(statusOf(0.2, 5)).toBe("weak");
    expect(statusOf(0.6, 5)).toBe("growing");
    expect(statusOf(0.8, 5)).toBe("mastered");
  });

  it("köhnə cəhdlər zəifləyir: dünənki səhvlər 30 gün əvvəlki düzlərdən ağırdır", () => {
    const oldGood = many("a", 10, 0, 30);
    const freshBad = many("a", 0, 10, 1);
    const m = mastery([...oldGood, ...freshBad], NOW);
    expect(m).toBeLessThan(0.3);
    // 90 gündən köhnə cəhdlər sayılmır
    expect(mastery(many("a", 50, 0, 120), NOW)).toBeCloseTo(0.5);
  });

  it("şübhəli düz cavab yarım çəki alır", () => {
    expect(isSuspicious(att("a", true, 0, { timeMs: 2000, medianMs: 20_000 }))).toBe(true);
    expect(isSuspicious(att("a", true, 0, { changes: 2 }))).toBe(true);
    expect(isSuspicious(att("a", true, 0, { flagged: true }))).toBe(true);
    expect(isSuspicious(att("a", true, 0, { timeMs: 10_000, medianMs: 20_000, changes: 1 }))).toBe(false);
    expect(isSuspicious(att("a", false, 0, { flagged: true }))).toBe(false);
    const sure = mastery(many("a", 6, 4), NOW);
    const guessed = mastery([...many("a", 6, 0, 0, { flagged: true }), ...many("a", 0, 4)], NOW);
    expect(guessed).toBeLessThan(sure);
  });
});

describe("bal itkisi, kök səbəb, sıralama", () => {
  it("bal itkisi imtahan tipinə görədir", () => {
    const t = topic(1, "a", { dimFrequency: 2, examTypes: ["11", "blok"] });
    expect(lossOf(0.4, t, "11", 4)).toBeCloseTo(4.8);
    expect(lossOf(0.4, t, "9", 4)).toBe(0);
  });

  it("kök səbəb: əsas mövzu < 60% olanda xəbərdarlıq", () => {
    const base = topic(1, "vuruq");
    const top = topic(2, "kvadrat", { prerequisiteId: 1 });
    const r = analyze({
      topics: [base, top],
      attempts: [...many("vuruq", 3, 5), ...many("kvadrat", 3, 5)],
      examType: "11",
      avgPoints: 4,
      now: NOW,
    });
    expect(r.find((x) => x.topic.slug === "kvadrat")!.root?.slug).toBe("vuruq");
    // Əsas mövzu yaxşıdırsa — xəbərdarlıq yoxdur
    const r2 = analyze({
      topics: [base, top],
      attempts: [...many("vuruq", 9, 1), ...many("kvadrat", 3, 5)],
      examType: "11",
      avgPoints: 4,
      now: NOW,
    });
    expect(r2.find((x) => x.topic.slug === "kvadrat")!.root).toBeNull();
  });

  it("faizə yox, bal itkisinə görə sıralanır; 'Məlumat azdır' sonda və cəmə düşmür", () => {
    const rare = topic(1, "rare", { dimFrequency: 0.3 }); // çox zəif, amma imtahanda az
    const often = topic(2, "often", { dimFrequency: 3 }); // orta, amma tez-tez
    const fresh = topic(3, "fresh");
    const r = analyze({
      topics: [rare, often, fresh],
      attempts: [...many("rare", 1, 9), ...many("often", 5, 5), ...many("fresh", 0, 2)],
      examType: "11",
      avgPoints: 4,
      now: NOW,
    });
    expect(r.map((x) => x.topic.slug)).toEqual(["often", "rare", "fresh"]);
    expect(r[2].status).toBe("few");
    expect(totalLoss(r)).toBeCloseTo(r[0].loss + r[1].loss);
    expect(topGain(r)).toBeCloseTo(r[0].loss + r[1].loss);
  });

  it("təkrar yoxlamadan keçən mövzu — 'Mənimsənib' (sonra səhv olmayınca)", () => {
    const t = topic(1, "a");
    const attempts = many("a", 4, 4, 5);
    const passed = NOW - 2 * DAY;
    expect(analyze({ topics: [t], attempts, examType: "11", avgPoints: 4, now: NOW, masteredAt: new Map([[1, passed]]) })[0].status).toBe(
      "mastered",
    );
    const later = [...attempts, att("a", false, 1)];
    expect(analyze({ topics: [t], attempts: later, examType: "11", avgPoints: 4, now: NOW, masteredAt: new Map([[1, passed]]) })[0].status).not.toBe(
      "mastered",
    );
  });
});

describe("əsas səhv", () => {
  it("səhv tipi alt mövzudan üstündür; yalnız son 30 gün", () => {
    const type = { id: 7, name: "Faizdə baza səhvi" };
    const a = [
      ...many("f", 0, 2, 1, { errorType: type, subtopic: "Faiz" }),
      ...many("f", 0, 3, 1, { subtopic: "Tənasüb" }),
      ...many("f", 0, 9, 40, { errorType: { id: 8, name: "Köhnə" } }),
    ];
    expect(mainError(a, NOW)).toEqual({ name: "Faizdə baza səhvi", count: 2, errorTypeId: 7 });
    expect(mainError(many("f", 0, 3, 1, { subtopic: "Tənasüb" }), NOW)).toEqual({ name: "Tənasüb", count: 3, errorTypeId: null });
  });
});

describe("dəstdə düzgün cavabların paylanması", () => {
  it("hamısı A olsa da, dəstdə A–E üzrə paylanır", () => {
    const maps = spreadCorrect(["A", "A", "A", "A", "A", "A"]);
    expect(maps.map((m) => shownLetter(m, "A"))).toEqual(["A", "B", "C", "D", "E", "A"]);
    // xəritə qarşılıqlıdır: hər göstərilən hərf bir orijinal hərfə
    for (const m of maps) expect(new Set(Object.values(m)).size).toBe(5);
  });
});
