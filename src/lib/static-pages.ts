// Statik səhifələr (public/*.html): proxy bu ünvanları fayla yönləndirir (rewrite).

/** Ünvan → public/ faylı. */
export const STATIC_PAGES: Record<string, string> = {
  "/haqqimizda": "/haqqimizda.html",
  "/elaqe": "/elaqe.html",
};

/** Ünvanın statik faylı (varsa). Obyektin prototip açarları səhifə sayılmır. */
export function staticFile(pathname: string): string | null {
  return Object.hasOwn(STATIC_PAGES, pathname) ? STATIC_PAGES[pathname] : null;
}
