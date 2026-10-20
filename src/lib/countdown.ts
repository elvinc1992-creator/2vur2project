// Geri sayım hesabları — server və brauzer eyni funksiyadan istifadə edir (Asia/Baku, UTC+4, yay vaxtı yoxdur).

const SEC = 1000;
const MIN = 60 * SEC;
const HOUR = 60 * MIN;
const DAY = 24 * HOUR;
const BAKU = 4 * HOUR;

/** İmtahana qədər qalan tam günlər, saat, dəqiqə və saniyə (keçibsə — sıfırlar). */
export function countdown(at: number, now: number) {
  const ms = Math.max(0, at - now);
  return {
    days: Math.floor(ms / DAY),
    hours: Math.floor((ms % DAY) / HOUR),
    minutes: Math.floor((ms % HOUR) / MIN),
    seconds: Math.floor((ms % MIN) / SEC),
  };
}

/** Rəng vəziyyəti: 60 gündən çox — sakit, 30–60 — diqqət, 30-dan az — təcili. */
export const urgencyOf = (days: number) => (days > 60 ? "calm" : days >= 30 ? "soon" : "urgent");
export type Urgency = ReturnType<typeof urgencyOf>;

const MONTHS = ["yanvar", "fevral", "mart", "aprel", "may", "iyun", "iyul", "avqust", "sentyabr", "oktyabr", "noyabr", "dekabr"];

/** 1804572000000 → "9 mart 2027" (Bakı vaxtı ilə; Intl-dən asılı deyil). */
export function bakuDate(at: number) {
  const d = new Date(at + BAKU);
  return `${d.getUTCDate()} ${MONTHS[d.getUTCMonth()]} ${d.getUTCFullYear()}`;
}

/** Hazırlıq ilinin başlanğıcı (imtahandan əvvəlki 1 sentyabr, Bakı vaxtı) → imtahan: keçən hissə, 0–100. */
export function prepProgress(at: number, now: number) {
  const d = new Date(at + BAKU);
  const year = d.getUTCMonth() >= 8 ? d.getUTCFullYear() : d.getUTCFullYear() - 1;
  const start = Date.UTC(year, 8, 1) - BAKU;
  return Math.min(100, Math.max(0, Math.round(((now - start) / (at - start)) * 100)));
}

/** "2027-03-09T10:00" (Bakı vaxtı, datetime-local) ↔ UTC ms. */
export const bakuInputToMs = (v: string) => {
  const m = /^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2})$/.exec(v);
  return m ? Date.UTC(+m[1], +m[2] - 1, +m[3], +m[4], +m[5]) - BAKU : NaN;
};
export const msToBakuInput = (at: number) => new Date(at + BAKU).toISOString().slice(0, 16);
