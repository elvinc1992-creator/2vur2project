/** Yalnız saytın daxili yollarına icazə verir (`//evil.com`, `https://…` rədd edilir). */
export function safeRedirect(value: unknown, fallback = "/panel"): string {
  if (typeof value !== "string") return fallback;
  if (!value.startsWith("/") || value.startsWith("//") || value.startsWith("/\\")) return fallback;
  if (/[\u0000-\u001f]/.test(value)) return fallback;
  return value;
}
