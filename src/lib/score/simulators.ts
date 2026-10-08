import { EXAM_FORMAT } from "@/lib/demo/content";

// DİM bal simulyatoru: imtahan növləri və hesablama qaydaları bir yerdə.
// MƏZMUN SONRA: real DİM düsturları, keçid balları və digər növlər (9-cu sinif, qəbul qrupları)
// sifarişçidən gələndə yalnız bu fayl dəyişir. İndi — demo düstur: hər düzgün cavab 4 bal.

export type ScoreSectionId = "closed" | "coded" | "written";

export type ScoreSection = {
  id: ScoreSectionId;
  /** Bu bölmədə sual sayı (daxil edilə bilən maksimum). */
  max: number;
  /** Bir düzgün cavabın balı. */
  points: number;
};

export type ScoreSimulator = {
  id: string;
  label: string;
  /** false — "Tezliklə" (məzmun hələ yoxdur). */
  available: boolean;
  sections: ScoreSection[];
};

export const DEMO_POINTS = 4;

export const SIMULATORS: ScoreSimulator[] = [
  {
    id: "buraxilis-11",
    label: "Buraxılış · 11-ci sinif",
    available: true,
    sections: [
      { id: "closed", max: EXAM_FORMAT.closed, points: DEMO_POINTS },
      { id: "coded", max: EXAM_FORMAT.coded, points: DEMO_POINTS },
      { id: "written", max: EXAM_FORMAT.written, points: DEMO_POINTS },
    ],
  },
  { id: "buraxilis-9", label: "Buraxılış · 9-cu sinif", available: false, sections: [] },
  { id: "qebul", label: "Qəbul imtahanı", available: false, sections: [] },
];

export type ScoreValues = Partial<Record<ScoreSectionId, number>>;

/** Təxmini bal: hər bölmədə düzgün cavab sayı (0…max) × bal. */
export function simulateScore(sim: ScoreSimulator, values: ScoreValues) {
  const clamp = (v: number, max: number) => Math.max(0, Math.min(max, Math.floor(Number.isFinite(v) ? v : 0)));
  const rows = sim.sections.map((s) => {
    const correct = clamp(values[s.id] ?? 0, s.max);
    return { ...s, correct, score: correct * s.points };
  });
  return {
    rows,
    score: rows.reduce((sum, r) => sum + r.score, 0),
    max: sim.sections.reduce((sum, s) => sum + s.max * s.points, 0),
  };
}
