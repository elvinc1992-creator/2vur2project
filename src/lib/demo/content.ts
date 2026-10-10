// Ümumi sabitlər. Suallar və sınaqlar bazadadır (bank_tasks, exams) — burada sual məzmunu yoxdur.

export const LETTERS = ["A", "B", "C", "D", "E"] as const;
export type Letter = (typeof LETTERS)[number];

export type IconKey = "percent" | "function" | "angle" | "triangle" | "root" | "sigma" | "cube";

/* ---------------- Günün sualları ---------------- */

/** Free planda günün hər mövzusunun ilk N sualı açıqdır, qalanları Pro/Premium ilə (serverdə yoxlanılır). */
export const FREE_DAILY_PER_TOPIC = 2;
/** Hər gün sual bankından təsadüfi seçilən mövzu və hər mövzudan sual sayı. */
export const DAILY_TOPICS_PER_DAY = 4;
export const DAILY_PER_TOPIC = 5;

/** Həftə günləri (bazar ertəsindən). */
export const WEEK_LABELS = ["B.e", "Ç.a", "Ç", "C.a", "C", "Ş", "B"];

/* ---------------- Sınaqlar ---------------- */

/** Kodlaşdırılan cavabın xana sayı — sual ekranı və cavab vərəqi eyni sabitdən istifadə edir. */
export const CODE_LEN = 6;

/* ---------------- Abunə və ödəniş ---------------- */

export const CARD_LABEL = "Kart •••• 4821";
