import { describe, expect, it } from "vitest";
import { landingDecision, landingOnly } from "./landing-mode";

describe("yalnız ana səhifə rejimi", () => {
  it("yalnız Vercel production-da avtomatik açılır; LANDING_ONLY ilə idarə olunur", () => {
    expect(landingOnly({ VERCEL_ENV: "production" })).toBe(true);
    expect(landingOnly({ VERCEL_ENV: "preview" })).toBe(false);
    expect(landingOnly({})).toBe(false);
    expect(landingOnly({ VERCEL_ENV: "production", LANDING_ONLY: "0" })).toBe(false);
    expect(landingOnly({ LANDING_ONLY: "1" })).toBe(true);
  });

  it("ana səhifə göstərilir, gözləmə siyahısı və statika açıqdır, qalan hər şey ana səhifəyə yönlənir", () => {
    expect(landingDecision("/")).toBe("landing");
    for (const p of ["/api/waitlist", "/_next/static/chunks/a.js", "/icon.svg", "/favicon.ico", "/images/x.png", "/ana-sehife.html"]) expect(landingDecision(p), p).toBe("allow");
    for (const p of ["/panel", "/daxil-ol", "/qeydiyyat", "/admin", "/yaris", "/muellim", "/statistika", "/api/auth/session", "/api/exam/1", "/onlayn-repetitor"])
      expect(landingDecision(p), p).toBe("redirect");
  });
});
