// Sınaq generasiyası — təmiz funksiya (baza yoxdur; həm admin, həm də scripts/generate-exams.mts istifadə edir).
//
// Qaydalar (topic_questions/sual_tipleri_cedveli.txt və dim-movzular.md):
// - Hər bölmənin (qapalı / açıq kodlaşdırılan / izahlı yazılı) sual sayı və nömrə aralığı imtahan quruluşundan gəlir.
// - Yalnız həmin imtahana aid mövzular (exam_types: 9 / 11 / blok) iştirak edir; mövzu sınağında — seçilmiş mövzu.
// - Buraxılış və blok sınaqlarında mövzu başına sual sayı sabitdir (TOPIC_QUOTA, bütün bölmələr üzrə): 11 və blok —
//   loqarifm, limit-törəmə-inteqral və stereometriyadan 2, qalan mövzulardan 1; 9-cu sinif — hər mövzudan 1.
//   Yer mövzulardan azdırsa — DİM tezliyi aşağı olan mövzular (çəkili təsadüfi) düşür; çoxdursa — artıq yerlər
//   tezliyi yüksək mövzulara verilir. Mövzunun sualı hansı bölməyə düşəcəyi bankdakı formatlara görə bölüşdürülür.
// - Mövzu sınağında (bir mövzu): sualların bölgüsü DİM tezliyinə mütənasibdir, bir mövzudan bölmədə ən çox ceil(say/3).
// - Təkrar olmasın deyə: mövzu daxilində əvvəl digər (aktiv/passiv) sınaqlarda istifadə olunmamış suallar seçilir;
//   mövzunun bütün sualları artıq istifadə olunubsa — ən az istifadə olunanlardan təsadüfi.
// - Admin sualları əl ilə seçə bilər (preset) — qalan yerlər avtomatik doldurulur.
// - Bölmə daxilində suallar tədris sırası ilə düzülür (Natural ədədlər → … → Stereometriya).

/** "9" | "11" | "blok" | "movzu". */
export type ExamType = string;
export type ItemFormat = "closed" | "coded" | "written";

export type GenSection = { format: ItemFormat; count: number; firstNo: number };
export type GenTopic = { id: number; slug?: string; curriculumOrder: number; dimFrequency: number; examTypes: string[] };

/** Sınaqda mövzu başına sual sayı (bütün bölmələr üzrə cəmi): double — 2 sual, qalan mövzular — base. */
const DOUBLE_11 = ["loqarifm-ustlu-tenlik-berabersizlik", "limit-toreme-inteqral", "stereometriya"];
export const TOPIC_QUOTA: Record<string, { base: number; double: string[] }> = {
  "9": { base: 1, double: [] },
  "11": { base: 1, double: DOUBLE_11 },
  blok: { base: 1, double: DOUBLE_11 },
};
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
  /** Kod → neçə sınaqda istifadə olunub. */
  usage?: Map<string, number>;
  /** Adminin əl ilə seçdiyi suallar (bölmə üzrə); qalan yerlər avtomatik doldurulur. */
  preset?: Partial<Record<ItemFormat, string[]>>;
  rand?: () => number;
}): GenItem[] {
  if (TOPIC_QUOTA[input.examType]) return generateByQuota({ ...input, rule: TOPIC_QUOTA[input.examType] });
  const { sections, examType, topics, tasks, usage = new Map(), preset = {}, rand = Math.random } = input;
  const topicById = new Map(topics.filter((t) => t.examTypes.includes(examType)).map((t) => [t.id, t]));
  const taskByCode = new Map(tasks.map((t) => [t.code, t]));
  const used = new Set<string>();
  const items: GenItem[] = [];

  for (const section of sections) {
    // Əl ilə seçilmiş suallar (bölməyə yarayan, təkrarsız) — əvvəl yerləşdirilir.
    const fixed = [...new Set(preset[section.format] ?? [])]
      .map((c) => taskByCode.get(c))
      .filter((t): t is GenTask => Boolean(t && !used.has(t.code) && fitsFormat(t, section.format)))
      .slice(0, section.count);
    for (const t of fixed) used.add(t.code);
    const need = section.count - fixed.length;

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
    const ids = need > 0 ? [...pool.keys()] : [];
    const cap = Math.max(1, Math.ceil(section.count / 3));
    const weight = (id: number) => Math.max(MIN_WEIGHT, topicById.get(id)!.dimFrequency);
    const total = ids.reduce((s, id) => s + weight(id), 0);
    const quota = new Map(ids.map((id) => [id, Math.min(cap, pool.get(id)!.length, Math.floor((need * weight(id)) / total))]));

    // Qalan yerlər — çəkili təsadüfi (artıq çox sualı olan mövzunun şansı azalır).
    let left = need - [...quota.values()].reduce((s, v) => s + v, 0);
    let limit = cap;
    while (left > 0 && ids.length) {
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

    const order = (t: GenTask) => topicById.get(t.topicId)?.curriculumOrder ?? 999;
    const chosen = [...fixed, ...ids.flatMap((id) => pool.get(id)!.slice(0, quota.get(id)!))]
      .map((t) => ({ t, order: order(t), tie: rand() }))
      .sort((a, b) => a.order - b.order || a.tie - b.tie);
    chosen.forEach(({ t }, i) => {
      used.add(t.code);
      items.push({ n: section.firstNo + i, code: t.code, format: section.format });
    });
  }
  return items;
}

/** Çəkili təsadüfi seçim (çəkilər müsbət). */
function pickWeighted<T>(xs: T[], w: (x: T) => number, rand: () => number): T {
  const ws = xs.map(w);
  let r = rand() * ws.reduce((s, v) => s + v, 0);
  for (let i = 0; i < xs.length; i++) {
    r -= ws[i];
    if (r <= 0) return xs[i];
  }
  return xs[xs.length - 1];
}

/**
 * Buraxılış / blok sınağı: mövzu başına sabit sual sayı (TOPIC_QUOTA). Addımlar:
 * 1) hədəf — qaydaya görə (əl ilə seçilmiş suallar hədəfdən çıxılır), sınaqdakı yer sayına uyğunlaşdırılır;
 * 2) hər mövzunun sualları bölmələrə bölüşdürülür (artırıcı yol — bankda formatı olmayan mövzu başqa bölməyə keçir);
 * 3) bölüşdürülə bilməyən yerlər qaydadan ən az payı olan mövzulardan doldurulur (sınaq həmişə tam olur).
 */
function generateByQuota(input: {
  sections: GenSection[];
  examType: ExamType;
  topics: GenTopic[];
  tasks: GenTask[];
  usage?: Map<string, number>;
  preset?: Partial<Record<ItemFormat, string[]>>;
  rand?: () => number;
  rule: { base: number; double: string[] };
}): GenItem[] {
  const { sections, examType, topics, tasks, usage = new Map(), preset = {}, rand = Math.random, rule } = input;
  const topicById = new Map(topics.filter((t) => t.examTypes.includes(examType)).map((t) => [t.id, t]));
  const taskByCode = new Map(tasks.map((t) => [t.code, t]));
  const weight = (id: number) => Math.max(MIN_WEIGHT, topicById.get(id)!.dimFrequency);
  const ruleOf = (id: number) => (rule.double.includes(topicById.get(id)!.slug ?? "") ? 2 : rule.base);

  // Əl ilə seçilmiş suallar
  const used = new Set<string>();
  const fixed = sections.map((s) => {
    const list = [...new Set(preset[s.format] ?? [])]
      .map((c) => taskByCode.get(c))
      .filter((t): t is GenTask => Boolean(t && !used.has(t.code) && fitsFormat(t, s.format)))
      .slice(0, s.count);
    for (const t of list) used.add(t.code);
    return list;
  });
  const need = sections.map((s, i) => s.count - fixed[i].length);
  const total = need.reduce((a, b) => a + b, 0);
  const presetCount = new Map<number, number>();
  for (const t of fixed.flat()) presetCount.set(t.topicId, (presetCount.get(t.topicId) ?? 0) + 1);

  // Mövzu → bölmə → yarayan suallar (az istifadə olunanlar öndə, bərabərlər təsadüfi)
  const pool = new Map<number, GenTask[][]>();
  for (const id of topicById.keys()) pool.set(id, sections.map(() => []));
  for (const t of tasks) {
    if (!topicById.has(t.topicId) || used.has(t.code)) continue;
    sections.forEach((s, i) => fitsFormat(t, s.format) && pool.get(t.topicId)![i].push(t));
  }
  for (const lists of pool.values())
    lists.forEach((list, i) => {
      const keyed = list.map((t) => ({ t, k: (usage.get(t.code) ?? 0) + rand() * 0.99 }));
      lists[i] = keyed.sort((a, b) => a.k - b.k).map((x) => x.t);
    });
  // Bir sual bir neçə bölməyə yaraya bilər — mövzunun bütün bölmələrdə ən çox neçə fərqli sualı ola bilər
  const capOf = (id: number) => new Set(pool.get(id)!.flat().map((t) => t.code)).size;
  const ids = [...topicById.keys()].filter((id) => capOf(id) > 0);

  // 1) Hədəf
  const target = new Map(ids.map((id) => [id, Math.max(0, Math.min(capOf(id), ruleOf(id) - (presetCount.get(id) ?? 0)))]));
  const sum = () => [...target.values()].reduce((a, b) => a + b, 0);
  while (sum() > total) {
    // Yer azdır: əvvəl 1 suallı mövzulardan, DİM tezliyi aşağı olan daha çox ehtimalla düşür
    const ones = ids.filter((id) => target.get(id)! > 0 && ruleOf(id) === 1);
    const from = ones.length ? ones : ids.filter((id) => target.get(id)! > 0);
    const id = pickWeighted(from, (x) => 1 / weight(x), rand);
    target.set(id, target.get(id)! - 1);
  }
  while (sum() < total) {
    // Yer çoxdur: artıq yerlər DİM tezliyi yüksək mövzulara (hələ az payı olanlar üstün)
    const open = ids.filter((id) => target.get(id)! < capOf(id));
    if (!open.length) break;
    const low = Math.min(...open.map((id) => target.get(id)! - ruleOf(id)));
    const id = pickWeighted(open.filter((x) => target.get(x)! - ruleOf(x) === low), weight, rand);
    target.set(id, target.get(id)! + 1);
  }

  // 2) Bölüşdürmə: flow[mövzu][bölmə]; hər dəfə bir sual üçün artırıcı yol (lazım gələrsə, başqa mövzunu bölmələr arasında yerdəyişir)
  const flow = new Map(ids.map((id) => [id, sections.map(() => 0)]));
  const assigned = (id: number) => flow.get(id)!.reduce((a, b) => a + b, 0);
  const load = (i: number) => ids.reduce((s, id) => s + flow.get(id)![i], 0);
  const order = [...ids].sort(() => rand() - 0.5);
  const augment = (start: number) => {
    // BFS: mövzu → bölmə (yer varsa — son), bölmə → oradakı başqa mövzu (o, başqa bölməyə keçə bilərsə)
    const prevSection = new Map<number, { topic: number }>();
    const prevTopic = new Map<number, { section: number }>();
    const seenTopics = new Set([start]);
    const queue = [start];
    while (queue.length) {
      const id = queue.shift()!;
      for (const i of sections.map((_, k) => k).sort(() => rand() - 0.5)) {
        if (prevSection.has(i) || flow.get(id)![i] >= pool.get(id)![i].length) continue;
        prevSection.set(i, { topic: id });
        if (load(i) < need[i]) {
          // Yolu tətbiq et
          let sec = i;
          for (;;) {
            const { topic } = prevSection.get(sec)!;
            flow.get(topic)![sec]++;
            const back = prevTopic.get(topic);
            if (!back) return true;
            flow.get(topic)![back.section]--;
            sec = back.section;
          }
        }
        for (const other of order) {
          if (seenTopics.has(other) || flow.get(other)![i] === 0) continue;
          seenTopics.add(other);
          prevTopic.set(other, { section: i });
          queue.push(other);
        }
      }
    }
    return false;
  };
  for (const id of order) while (assigned(id) < target.get(id)! && augment(id));

  // 3) Doldurulmayan yerlər — qaydaya görə ən az payı olan mövzulardan (eyni olanda — DİM tezliyi yüksək)
  sections.forEach((_, i) => {
    while (load(i) < need[i]) {
      const open = ids.filter((id) => flow.get(id)![i] < pool.get(id)![i].length);
      if (!open.length) break;
      const low = Math.min(...open.map((id) => assigned(id) - ruleOf(id)));
      const id = pickWeighted(open.filter((x) => assigned(x) - ruleOf(x) === low), weight, rand);
      flow.get(id)![i]++;
    }
  });

  // Suallar: hər bölmədə mövzunun ən az istifadə olunan sualları (bir sual iki bölməyə düşmür)
  const items: GenItem[] = [];
  sections.forEach((section, i) => {
    const chosen = [...fixed[i]];
    for (const id of ids) {
      let k = flow.get(id)![i];
      for (const t of pool.get(id)![i]) {
        if (k === 0) break;
        if (used.has(t.code)) continue;
        used.add(t.code);
        chosen.push(t);
        k--;
      }
    }
    chosen
      .map((t) => ({ t, order: topicById.get(t.topicId)?.curriculumOrder ?? 999, tie: rand() }))
      .sort((a, b) => a.order - b.order || a.tie - b.tie)
      .forEach(({ t }, j) => items.push({ n: section.firstNo + j, code: t.code, format: section.format }));
  });
  return items;
}
