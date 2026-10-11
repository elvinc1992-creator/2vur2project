// "Yalnız ana səhifə" rejimi: sayt açılana qədər production-da (2vur2.az, main budağı) yalnız ana səhifə
// (public/ana-sehife.html) və gözləmə siyahısının API-si açıqdır; qalan bütün ünvanlar ana səhifəyə yönlənir.
// Lokal və preview deploy-larda sayt tam işləyir.
//   LANDING_ONLY=1 — rejimi məcburi aç (məs. lokal yoxlama), LANDING_ONLY=0 — production-da da tam sayt (açılış günü).
//   Dəyər verilməyibsə: yalnız Vercel production (VERCEL_ENV=production) üçün açıqdır.

export const LANDING_FILE = "/ana-sehife.html";

export function landingOnly(env: Record<string, string | undefined> = process.env) {
  if (env.LANDING_ONLY === "1") return true;
  if (env.LANDING_ONLY === "0") return false;
  return env.VERCEL_ENV === "production";
}

/** Bu rejimdə açıq qalanlar: gözləmə siyahısı API-si, Next statikası, ikonlar və public/ faylları (şəkil, brend). */
const ALLOWED = [/^\/api\/waitlist$/, /^\/_next\//, /^\/(favicon\.ico|icon\.svg|apple-icon\.png|robots\.txt)$/, /^\/(brand|images)\//, /^\/ana-sehife\.html$/];

/** Ünvan üçün qərar: ana səhifəni göstər, olduğu kimi burax, və ya ana səhifəyə yönləndir. */
export function landingDecision(pathname: string): "landing" | "allow" | "redirect" {
  if (pathname === "/") return "landing";
  if (ALLOWED.some((r) => r.test(pathname))) return "allow";
  return "redirect";
}
