import { describe, expect, it } from "vitest";
import { staticFile } from "./static-pages";

describe("statik səhifələr", () => {
  it("haqqımızda və əlaqə — public faylı; qalanlar Next səhifələridir", () => {
    expect(staticFile("/haqqimizda")).toBe("/haqqimizda.html");
    expect(staticFile("/elaqe")).toBe("/elaqe.html");
    for (const p of ["/", "/mexfilik", "/success", "/error", "/result", "/panel"]) expect(staticFile(p), p).toBeNull();
    // Obyektin prototip açarları səhifə sayılmır
    expect(staticFile("/toString")).toBeNull();
  });
});
