import { LETTERS, type Letter } from "@/lib/demo/content";

/** Göstərilən hərf → sualın orijinal hərfi. */
export type LetterMap = Record<Letter, Letter>;

/**
 * Dəstdə düzgün cavablar bir hərfdə toplanmasın: i-ci sualın düzgün cavabı A–E üzrə növbə ilə
 * (start-dan başlayaraq) yerləşdirilir — düzgün variant hədəf yerdəki variantla yerini dəyişir.
 */
export function spreadCorrect(correct: Letter[], start = 0): LetterMap[] {
  return correct.map((c, i) => {
    const target = LETTERS[(start + i) % LETTERS.length];
    const map = Object.fromEntries(LETTERS.map((l) => [l, l])) as LetterMap;
    map[target] = c;
    map[c] = target;
    return map;
  });
}

/** Göstərilən hərf (dəstdə) — orijinal düzgün cavab üçün. */
export const shownLetter = (map: LetterMap, original: Letter) => LETTERS.find((l) => map[l] === original)!;
