import { describe, expect, it } from "vitest";
import { landingDecision, landingOnly, staticFile } from "./landing-mode";

describe("yalnız ana səhifə rejimi", () => {
  it("yalnız Vercel production-da avtomatik açılır; LANDING_ONLY ilə idarə olunur", () => {
    expect(landingOnly({ VERCEL_ENV: "production" })).toBe(true);
    expect(landingOnly({ VERCEL_ENV: "preview" })).toBe(false);
    expect(landingOnly({})).toBe(false);
    expect(landingOnly({ VERCEL_ENV: "production", LANDING_ONLY: "0" })).toBe(false);
    expect(landingOnly({ LANDING_ONLY: "1" })).toBe(true);
  });

  it("ana səhifə göstərilir, gözləmə siyahısı və statika açıqdır, qalan hər şey ana səhifəyə yönlənir", () => {
    for (const p of ["/", "/haqqimizda", "/elaqe", "/mexfilik", "/success", "/error"]) expect(landingDecision(p), p).toBe("landing");
    for (const p of ["/api/waitlist", "/result", "/_next/static/chunks/a.js", "/icon.svg", "/favicon.ico", "/images/x.png", "/ana-sehife.html", "/elaqe.html"])
      expect(landingDecision(p), p).toBe("allow");
    // Obyektin prototip açarları səhifə sayılmır
    expect(landingDecision("/toString")).toBe("redirect");
    for (const p of ["/panel", "/daxil-ol", "/qeydiyyat", "/admin", "/yaris", "/muellim", "/statistika", "/api/auth/session", "/api/exam/1", "/onlayn-repetitor"])
      expect(landingDecision(p), p).toBe("redirect");
  });

  it("statik səhifələr: haqqımızda, əlaqə hər rejimdə; ana səhifə, məxfilik və ödəniş nəticəsi yalnız bu rejimdə", () => {
    expect(staticFile("/elaqe", false)).toBe("/elaqe.html");
    // Tam saytda /success və /error sifarişin səhifəsinə yönləndirir (route handler)
    expect(staticFile("/success", false)).toBeNull();
    expect(staticFile("/error", false)).toBeNull();
    expect(staticFile("/success", true)).toBe("/success.html");
    expect(staticFile("/", false)).toBeNull();
    expect(staticFile("/mexfilik", false)).toBeNull();
    expect(staticFile("/", true)).toBe("/ana-sehife.html");
    expect(staticFile("/mexfilik", true)).toBe("/mexfilik.html");
    expect(staticFile("/result", true)).toBeNull();
  });
});
