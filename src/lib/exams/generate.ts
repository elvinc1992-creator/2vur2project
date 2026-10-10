// Sınaq generasiyası — təmiz funksiya (baza yoxdur; həm admin, həm də scripts/generate-exams.mts istifadə edir).
//
// Qaydalar (topic_questions/sual_tipleri_cedveli.txt və dim-movzular.md):
// - Hər bölmənin (qapalı / açıq kodlaşdırılan / izahlı yazılı) sual sayı və nömrə aralığı imtahan quruluşundan gəlir.
// - Yalnız həmin imtahana aid mövzular (exam_types: 9 / 11 / blok) iştirak edir.
// - Sualların mövzular üzrə bölgüsü DİM tezliyinə mütənasibdir: tam hissə sabit, qalığı çəkili təsadüfi seçilir —
//   eyni tip sınaqlar bir-birindən fərqlənir. Bir mövzudan bölmədə ən çox ceil(say/3) sual.
// - Mövzu daxilində əvvəl digər sınaqlarda az istifadə olunmuş suallar seçilir.
// - Bölmə daxilində suallar tədris sırası ilə düzülür (Natural ədədlər → … → Stereometriya).

export type ExamType = "9" | "11" | "blok";
export type ItemFormat = "closed" | "coded" | "written";

export type GenSection = { format: ItemFormat; count: number; firstNo: number };
export type GenTopic = { id: number; curriculumOrder: number; dimFrequency: number; examTypes: ExamType[] };
export type GenTask = { code: string; topicId: number; format: string; answerValue: string | null; hasOptions: boolean };
export type GenItem = { n: number; code: string; format: ItemFormat };

/** Kodlaşdırılan cavab vərəqinə sığan cavab: ən çox 6 simvol, rəqəm, "-" və bir vergül. */
export const isCodedAnswer = (v: string | null) => v !== null && /^-?\d+([.,]\d+)?$/.test(v.trim()) && v.trim().length <= 6;

/** Bankdakı sual bu bölməyə yarayırmı. */
export function fitsFormat(t: GenTask, format: ItemFormat): boolean {
  if (format === "closed") return t.format === "closed" && t.hasOptions;
  if (format === "coded") return t.format === "open" && isCodedAnswer(t.answerValue);
  return t.format === "written";
}

const MIN_WEIGHT = 0.15;

export function generateExam(input: {
  sections: GenSection[];
  examType: ExamType;
  topics: GenTopic[];
  tasks: GenTask[];
  /** Kod → neçə sınaqda istifadə olunub (eyni tip). */
  usage?: Map<string, number>;
  rand?: () => number;
}): GenItem[] {
  const { sections, examType, topics, tasks, usage = new Map(), rand = Math.random } = input;
  const topicById = new Map(topics.filter((t) => t.examTypes.includes(examType)).map((t) => [t.id, t]));
  const used = new Set<string>();
  const items: GenItem[] = [];

  for (const section of sections) {
    // Mövzu → bu bölməyə yarayan suallar (az istifadə olunanlar öndə, bərabərlər təsadüfi).
    const pool = new Map<number, GenTask[]>();
    for (const t of tasks) {
      if (!topicById.has(t.topicId) || used.has(t.code) || !fitsFormat(t, section.format)) continue;
      pool.set(t.topicId, [...(pool.get(t.topicId) ?? []), t]);
    }
    for (const [id, list] of pool) {
      const keyed = list.map((t) => ({ t, k: (usage.get(t.code) ?? 0) + rand() * 0.99 }));
      pool.set(
        id,
        keyed.sort((a, b) => a.k - b.k).map((x) => x.t),
      );
    }
    const ids = [...pool.keys()];
    if (!ids.length) continue;
    const cap = Math.max(1, Math.ceil(section.count / 3));
    const weight = (id: number) => Math.max(MIN_WEIGHT, topicById.get(id)!.dimFrequency);
    const total = ids.reduce((s, id) => s + weight(id), 0);
    const quota = new Map(ids.map((id) => [id, Math.min(cap, pool.get(id)!.length, Math.floor((section.count * weight(id)) / total))]));

    // Qalan yerlər — çəkili təsadüfi (artıq çox sualı olan mövzunun şansı azalır).
    let left = section.count - [...quota.values()].reduce((s, v) => s + v, 0);
    let limit = cap;
    while (left > 0) {
      let open = ids.filter((id) => quota.get(id)! < Math.min(limit, pool.get(id)!.length));
      if (!open.length && limit !== Infinity) {
        // Mövzu az olanda 1/3 limiti sayı doldurmağa imkan vermir — limit götürülür.
        limit = Infinity;
        open = ids.filter((id) => quota.get(id)! < pool.get(id)!.length);
      }
      if (!open.length) break;
      const w = open.map((id) => weight(id) / (1 + quota.get(id)!));
      let r = rand() * w.reduce((s, v) => s + v, 0);
      let pick = open[open.length - 1];
      for (let i = 0; i < open.length; i++) {
        r -= w[i];
        if (r <= 0) {
          pick = open[i];
          break;
        }
      }
      quota.set(pick, quota.get(pick)! + 1);
      left--;
    }

    const chosen = ids
      .flatMap((id) => pool.get(id)!.slice(0, quota.get(id)!).map((t) => ({ t, order: topicById.get(id)!.curriculumOrder, tie: rand() })))
      .sort((a, b) => a.order - b.order || a.tie - b.tie);
    chosen.forEach(({ t }, i) => {
      used.add(t.code);
      items.push({ n: section.firstNo + i, code: t.code, format: section.format });
    });
  }
  return items;
}
