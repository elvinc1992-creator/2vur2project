// Brend adı və xarici linklər bir yerdə saxlanılır.
/** Brend adı — dəyişmək üçün yalnız buranı redaktə edin (loqo komponenti də bunu istifadə edir). */
export const BRAND_NAME = "2vur2";

export const brand = {
  name: BRAND_NAME,
  domain: "2vur2.az",
  telegramUrl: process.env.NEXT_PUBLIC_TELEGRAM_URL || "#",
  instagramUrl: process.env.NEXT_PUBLIC_INSTAGRAM_URL || "#",
  year: 2026,
} as const;

/** Xarici link verilməyibsə (env boşdur) null — düymə göstərilmir və ya alternativlə əvəzlənir. */
export const socialUrl = (url: string) => (url && url !== "#" ? url : null);
