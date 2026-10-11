import { normalizeCoded } from "@/lib/exams/grade";
import { LETTERS, type Letter } from "@/lib/demo/content";
import type { LetterMap } from "@/lib/weak/spread";

// Müəllim sınağının variantları — təmiz funksiyalar (server və testlər).
// Sıra bölmə daxilində qarışdırılır (cavab kartının quruluşu — qapalı / kodlaşdırılan / yazılı — dəyişmir);
// qapalı sualların variantları elə qarışdırılır ki, düzgün cavablar A–E arasında paylansın.

export type ItemFormat = "closed" | "coded" | "written";
export type TestItem = { n: number; format: ItemFormat; correct?: Letter | null; answer?: string | null };
export type Variant = {
  letter: string;
  /** Göstərilən i-ci sual (0-dan) → əsas n */
  order: number[];
  /** Əsas n → (göstərilən hərf → orijinal hərf) */
  maps: Record<number, LetterMap>;
};

const IDENTITY = Object.fromEntries(LETTERS.map((l) => [l, l])) as LetterMap;
const VARIANT_LETTERS = "ABCDEFGH";

function shuffle<T>(xs: T[], rand: () => number): T[] {
  const a = [...xs];
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(rand() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a;
}

/** Variantlar: hər şagirdə ayrıca (fərqli sıra və variant yerləri) və ya hamıya eyni ("A"). */
export function makeVariants(items: TestItem[], count: number, shuffled: boolean, rand: () => number = Math.random): Variant[] {
  const base = items.map((i) => i.n);
  if (!shuffled) {
    const maps = Object.fromEntries(items.filter((i) => i.format === "closed").map((i) => [i.n, IDENTITY]));
    return Array.from({ length: count }, () => ({ letter: "A", order: base, maps }));
  }
  return Array.from({ length: count }, (_, k) => {
    const order = (["closed", "coded", "written"] as const).flatMap((f) => shuffle(items.filter((i) => i.format === f).map((i) => i.n), rand));
    const closed = order.map((n) => items.find((i) => i.n === n)!).filter((i) => i.format === "closed" && i.correct);
    // Düzgün cavabların yerləri: A–E bərabər sayda, amma sırası təsadüfi (dövri ardıcıllıq təxmin edilə bilər)
    const targets = shuffle(
      closed.map((_, j) => LETTERS[j % LETTERS.length]),
      rand,
    );
    const maps: Record<number, LetterMap> = {};
    closed.forEach((i, j) => {
      // Düzgün cavab hədəf hərfə keçir, qalan variantlar da qarışır
      const target = targets[j];
      const others = shuffle(
        LETTERS.filter((l) => l !== i.correct),
        rand,
      );
      const m = {} as LetterMap;
      for (const l of LETTERS) m[l] = l === target ? i.correct! : others.pop()!;
      maps[i.n] = m;
    });
    return { letter: VARIANT_LETTERS[k % VARIANT_LETTERS.length], order, maps };
  });
}

/** Variantda göstərilən hərf (orijinal düzgün cavab üçün). */
export const shownOf = (map: LetterMap | undefined, original: Letter) => (map ? LETTERS.find((l) => map[l] === original)! : original);

/** Cavab açarı: variantda göstərilən i-ci sualın düzgün cavabı (hərf və ya ədəd; yazılı — "yazılı"). */
export function answerKey(v: Variant, items: TestItem[]): string[] {
  return v.order.map((n) => {
    const it = items.find((i) => i.n === n)!;
    if (it.format === "closed") return it.correct ? shownOf(v.maps[n], it.correct) : "—";
    if (it.format === "coded") return it.answer ?? "—";
    return "yazılı";
  });
}

export type Graded = { n: number; given: string | null; score: number | null };

/**
 * Kağız cavab kartından daxil edilən cavablar (göstərilən sıra ilə) → əsas n üzrə qiymət.
 * Qapalı: göstərilən hərf variant xəritəsi ilə orijinala çevrilir; kodlaşdırılan: ədəd; yazılı: bal (0 / 0,5 / 1).
 */
export function gradeEntries(v: Variant, items: TestItem[], entries: string[]): Graded[] {
  return v.order.map((n, i) => {
    const it = items.find((x) => x.n === n)!;
    const raw = (entries[i] ?? "").trim();
    if (!raw) return { n, given: null, score: it.format === "written" ? null : 0 };
    if (it.format === "closed") {
      const shown = raw.toUpperCase() as Letter;
      if (!(LETTERS as readonly string[]).includes(shown)) return { n, given: null, score: 0 };
      const original = v.maps[n]?.[shown] ?? shown;
      return { n, given: original, score: original === it.correct ? 1 : 0 };
    }
    if (it.format === "coded") {
      const a = normalizeCoded(raw);
      return { n, given: raw, score: a !== null && it.answer != null && a === normalizeCoded(it.answer) ? 1 : 0 };
    }
    const s = Number(raw.replace(",", "."));
    return { n, given: null, score: [0, 0.5, 1].includes(s) ? s : null };
  });
}

/** Bal faizlə: (qapalı + kodlaşdırılan + yazılı ballar) / sual sayı. */
export const percentOf = (graded: Array<{ score: number | null }>, total: number) =>
  total ? Math.round((graded.reduce((s, g) => s + (g.score ?? 0), 0) / total) * 100) : 0;
