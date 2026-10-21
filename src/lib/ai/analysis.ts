// "AI analizi" — xarici model yoxdur: hər şey DİM imtahanlarının təsnifatından (exam_questions_stats)
// və toplu istinadlarından hesablanır. Bu fayl təmiz funksiyalardır (server və brauzer, testlər).

export type BookPart = "I" | "II";
/** Toplu istinadı: "II h. səh.207 №23" → { part: "II", page: 207, nos: [23] }. */
export type TopluRef = { part: BookPart; page: number; nos: number[] };

/**
 * "II h. səh.207 №23; səh.208 №44, 45" → iki istinad (hissə əvvəlki seqmentdən keçir).
 * "səh.197–198 (situasiya modelləri)" → nömrəsiz istinad (yalnız səhifə).
 */
export function parseToplu(s: string | null | undefined): TopluRef[] {
  if (!s) return [];
  const out: TopluRef[] = [];
  let part: BookPart = "I";
  for (const seg of s.split(";")) {
    if (/II\s*h\./.test(seg)) part = "II";
    else if (/(^|\s)I\s*h\./.test(seg)) part = "I";
    const page = /səh\.\s*(\d+)/.exec(seg);
    if (!page) continue;
    const nos: number[] = [];
    const list = /№\s*([\d\s,–-]+)/.exec(seg)?.[1] ?? "";
    for (const item of list.split(",")) {
      const [a, b] = item.split(/[–-]/).map((x) => Number.parseInt(x.trim(), 10));
      if (!Number.isFinite(a)) continue;
      if (Number.isFinite(b) && b >= a && b - a <= 30) for (let n = a; n <= b; n++) nos.push(n);
      else nos.push(a);
    }
    out.push({ part, page: Number(page[1]), nos });
  }
  return out;
}

export type SubtopicSpan = { id: number; topicId: number; part: string; startPage: number | null };

/** İstinadın aid olduğu alt mövzu (tip): eyni mövzu və hissədə başlanğıc səhifəsi ≤ səhifə olan ən sonuncu. */
export function subtopicOf(subs: SubtopicSpan[], topicId: number, ref: TopluRef): number | null {
  let best: SubtopicSpan | null = null;
  for (const s of subs) {
    if (s.topicId !== topicId || s.part !== ref.part || s.startPage === null || s.startPage > ref.page) continue;
    if (!best || s.startPage > best.startPage!) best = s;
  }
  return best?.id ?? null;
}

export type FreqLevel = "high" | "mid" | "low";

/** Göstərilən sual sayının aralığı: hər tip üçün 12–40 (düşmə tezliyinə görə). */
export const SHOWN_MIN = 12;
export const SHOWN_MAX = 40;
/** Səviyyə göstərilən sual sayından: Yüksək ≥ 30, Orta 20–29, Aşağı ≤ 19. */
export const LEVEL_FROM = { high: 30, mid: 20 };

/** Göstərilən sayına görə səviyyə. */
export const freqLevel = (shown: number): FreqLevel => (shown >= LEVEL_FROM.high ? "high" : shown >= LEVEL_FROM.mid ? "mid" : "low");

/**
 * Hər tipin göstərilən sual sayı (12–40): imtahanlarda real düşmə sayına görə sıra (persentil) xəttə köçürülür.
 * Eyni real say — eyni nəticə; ən az düşən 12, ən çox düşən 40.
 */
export function shownCounts(hits: number[]): number[] {
  const sorted = [...hits].sort((a, b) => a - b);
  const n = sorted.length;
  return hits.map((h) => {
    if (n < 2) return SHOWN_MAX;
    // Bu saydan az olanların payı (bərabərlər üçün orta yer)
    const below = sorted.findIndex((x) => x >= h);
    const last = sorted.findLastIndex((x) => x <= h);
    const rank = (below + last) / 2 / (n - 1);
    return Math.round(SHOWN_MIN + (SHOWN_MAX - SHOWN_MIN) * rank);
  });
}

/** Nişanda göstərilən hazır məlumat (cavab və həll yoxdur — sual cavablanmamış da göndərilə bilər). */
export type AiInsight = {
  topic: string;
  /** Tip — toplunun bölməsi (alt mövzu); yoxdursa null. */
  type: string | null;
  /** Alt tip — sualın formatı və ya imtahan təsnifatındakı ad. */
  subtype: string | null;
  /** Tipin düşmə tezliyi və göstərilən sual sayı (tip yoxdursa — null / 0). */
  level: FreqLevel | null;
  shown: number;
  /** Tipin səhifəsi (saytdakı suallar). */
  typeHref: string | null;
  /** Sualın toplu prototipi eyni ilə düşdüyü imtahanlar. */
  proto: string[];
};

/** Şəxsi prioritet: tip nə qədər tez-tez düşür × şagird nə qədər səhv edir. */
export function priorityScore(weight: number, correct: number, total: number) {
  if (total === 0) return 0;
  const miss = 1 - correct / total;
  // Az cavabda nəticə qeyri-müəyyəndir — 3 cavaba qədər çəki azalır.
  const confidence = Math.min(1, total / 3);
  return Math.round(weight * miss * confidence * 100) / 100;
}