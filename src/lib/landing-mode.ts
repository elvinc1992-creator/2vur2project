// "Yalnız ana səhifə" rejimi: sayt açılana qədər production-da (2vur2.az, main budağı) yalnız ana səhifə
// (public/ana-sehife.html), statik səhifələr (haqqımızda, əlaqə, məxfilik, ödəniş nəticəsi), gözləmə siyahısının API-si
// və ödəniş bildirişi (/result) açıqdır; qalan bütün ünvanlar ana səhifəyə yönlənir.
// Lokal və preview deploy-larda sayt tam işləyir.
//   LANDING_ONLY=1 — rejimi məcburi aç (məs. lokal yoxlama), LANDING_ONLY=0 — production-da da tam sayt (açılış günü).
//   Dəyər verilməyibsə: yalnız Vercel production (VERCEL_ENV=production) üçün açıqdır.

export const LANDING_FILE = "/ana-sehife.html";

/** Hər rejimdə statik göstərilən səhifələr: ünvan → public/ faylı (ödəniş şirkətinin success / error ünvanları da). */
export const STATIC_PAGES: Record<string, string> = {
  "/haqqimizda": "/haqqimizda.html",
  "/elaqe": "/elaqe.html",
  "/success": "/success.html",
  "/error": "/error.html",
};

/** Yalnız bu rejimdə statik göstərilənlər (tam saytda bu ünvanlar Next səhifələridir). */
const LANDING_ONLY_PAGES: Record<string, string> = { "/": LANDING_FILE, "/mexfilik": "/mexfilik.html" };

/** Ünvanın statik faylı (varsa). */
export function staticFile(pathname: string, landing: boolean): string | null {
  if (Object.hasOwn(STATIC_PAGES, pathname)) return STATIC_PAGES[pathname];
  if (landing && Object.hasOwn(LANDING_ONLY_PAGES, pathname)) return LANDING_ONLY_PAGES[pathname];
  return null;
}

export function landingOnly(env: Record<string, string | undefined> = process.env) {
  if (env.LANDING_ONLY === "1") return true;
  if (env.LANDING_ONLY === "0") return false;
  return env.VERCEL_ENV === "production";
}

/** Bu rejimdə açıq qalanlar: gözləmə siyahısı API-si, ödəniş bildirişi, Next statikası, ikonlar və public/ faylları. */
const ALLOWED = [
  /^\/api\/waitlist$/,
  /^\/result$/,
  /^\/_next\//,
  /^\/(favicon\.ico|icon\.svg|apple-icon\.png|robots\.txt)$/,
  /^\/(brand|images)\//,
  /^\/(ana-sehife|haqqimizda|elaqe|mexfilik|success|error)\.html$/,
];

/** Ünvan üçün qərar: statik səhifəni göstər, olduğu kimi burax, və ya ana səhifəyə yönləndir. */
export function landingDecision(pathname: string): "landing" | "allow" | "redirect" {
  if (staticFile(pathname, true)) return "landing";
  if (ALLOWED.some((r) => r.test(pathname))) return "allow";
  return "redirect";
}
