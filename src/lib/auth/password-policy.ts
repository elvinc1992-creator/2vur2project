// Həm brauzerdə (güc göstəricisi), həm serverdə (zod) istifadə olunur.
export const PASSWORD_MIN = 8;
export const PASSWORD_MAX = 128;

export type PasswordChecks = {
  length: boolean;
  cases: boolean;
  digit: boolean;
  symbol: boolean;
};

export function checkPassword(value: string): PasswordChecks {
  return {
    length: value.length >= PASSWORD_MIN,
    cases: /\p{Ll}/u.test(value) && /\p{Lu}/u.test(value),
    digit: /\d/.test(value),
    symbol: /[^\p{L}\d\s]/u.test(value),
  };
}

/** 0–4: ödənilmiş şərtlərin sayı. Boş şifrə üçün 0. */
export function passwordScore(value: string): number {
  if (!value) return 0;
  return Object.values(checkPassword(value)).filter(Boolean).length;
}

/** Simvol tövsiyədir, qalan üçü məcburidir. */
export function isPasswordAcceptable(value: string): boolean {
  const c = checkPassword(value);
  return c.length && c.cases && c.digit && value.length <= PASSWORD_MAX;
}
