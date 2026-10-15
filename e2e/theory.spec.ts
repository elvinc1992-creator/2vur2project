import AxeBuilder from "@axe-core/playwright";
import { expect, test, type FrameLocator, type Page } from "@playwright/test";

// Onlayn repetitorun nəzəriyyə kitabı (topic_questions/theoria/kitab-natural-ededler.html → npm run theory:import).
// Natural ədədlər — ilk (pulsuz) dərs, qonağa da açıqdır.
const TOPIC = "natural-ededler";

/** Kitabın bütün səhifələri: məzmun nə hündürlüyə, nə də eninə daşmır. */
async function overflowing(book: FrameLocator) {
  return book.locator("body").evaluate(() => {
    const bad: string[] = [];
    const pages = [...document.querySelectorAll<HTMLElement>(".page")];
    // Vərəqləyən gizli səhifələrin ölçüsünü silir — onları görünən səhifənin ölçüsü ilə yoxlayırıq
    const shown = pages.find((x) => x.offsetWidth > 0)!;
    const [pw, ph] = [shown.offsetWidth, shown.offsetHeight];
    pages.forEach((pg, i) => {
      const old = pg.getAttribute("style") ?? "";
      pg.style.cssText = `${old};display:block;width:${pw}px;height:${ph}px`;
      const box = pg.querySelector<HTMLElement>(".in")!;
      if (box.scrollHeight > box.clientHeight + 1 && !pg.classList.contains("tall")) bad.push(`${i + 1}: hündürlük`);
      const r = box.getBoundingClientRect();
      for (const e of box.querySelectorAll<HTMLElement>("*")) {
        if (e.closest(".katex svg")) continue; // kökün SVG-si kəsilmiş halda çəkilir
        const er = e.getBoundingClientRect();
        if (er.width && (er.right > r.right + 1 || er.left < r.left - 1)) {
          bad.push(`${i + 1}: en (${e.tagName})`);
          break;
        }
      }
      for (const c of box.querySelectorAll<HTMLElement>(".katex-display, td, th"))
        if (c.scrollWidth > c.clientWidth + 1) {
          bad.push(`${i + 1}: kəsilir (${c.tagName})`);
          break;
        }
      pg.setAttribute("style", old);
    });
    return bad;
  });
}

async function openBook(page: Page) {
  await page.goto(`/onlayn-repetitor/${TOPIC}`);
  const theory = page.getByRole("region", { name: "Nəzəriyyə" });
  await theory.getByRole("link", { name: "Nəzəriyyəni oxu" }).click();
  await expect(page).toHaveURL(new RegExp(`/onlayn-repetitor/${TOPIC}/nezeriyye$`));
  await expect(page.getByText("Natural ədədlər · nəzəriyyə")).toBeVisible();
  const book = page.frameLocator('iframe[title="Natural ədədlər mövzusunun nəzəriyyə kitabı"]');
  await book.locator("body.ready").waitFor({ timeout: 60_000 });
  return book;
}

test("nəzəriyyə kitabı: mövzu səhifəsindən açılır, vərəqlənir, səhifələr daşmır (1440)", async ({ page }) => {
  await page.setViewportSize({ width: 1440, height: 900 });
  const book = await openBook(page);

  // İki səhifə yan-yana: üz qabığı + mündəricat
  await expect(book.locator("#cnt")).toHaveText(/^1–2 \/ \d+$/);
  await expect(book.locator(".cover-page")).toContainText("Natural ədədlər");
  await expect(book.locator(".toc-list a")).toHaveCount(11);
  await expect(book.locator("body")).not.toContainText("Cəfərli");
  await expect(book.locator(".page .ft").first()).toContainText("Bu material 2vur2.az saytına məxsusdur");
  expect(await overflowing(book)).toEqual([]);

  // Kitab ekranın qalan hissəsini tutur — naviqasiya görünür, səhifə eninə sürüşmür
  const nav = (await book.locator(".bk-nav").boundingBox())!;
  expect(nav.y + nav.height).toBeLessThanOrEqual(900);
  expect(await page.evaluate(() => document.documentElement.scrollWidth)).toBeLessThanOrEqual(1440);

  // Növbəti səhifə, mündəricatdan bölməyə keçid, bölmə seçimi
  await book.locator("#nxt").click();
  await expect(book.locator("#cnt")).toHaveText(/^3–4 \/ \d+$/);
  await expect(book.locator("#bkSel")).toHaveValue("2");
  await book.locator("#bkSel").selectOption({ label: "10. Həll edilmiş nümunələr" });
  await expect(book.locator("#bkSel")).toHaveValue("11");

  // "Həllə bax" açılanda da səhifə daşmır (yeri əvvəlcədən saxlanılır)
  const summary = book.locator(".page:visible summary").first();
  await expect(summary).toBeVisible();
  await summary.click();
  await expect(book.locator(".page:visible details[open] .sol").first()).toBeVisible();
  expect(await overflowing(book)).toEqual([]);
  await page.screenshot({ path: "screenshots/nezeriyye-1440.png" });

  const r = await new AxeBuilder({ page }).withTags(["wcag2a", "wcag2aa", "wcag21a", "wcag21aa", "wcag22aa"]).analyze();
  expect(r.violations.filter((v) => v.impact === "critical" || v.impact === "serious").map((v) => v.id)).toEqual([]);
});

test("nəzəriyyə kitabı telefonda: bir səhifə, daşma yoxdur (390)", async ({ page }) => {
  await page.setViewportSize({ width: 390, height: 844 });
  const book = await openBook(page);
  await expect(book.locator("#cnt")).toHaveText(/^1 \/ \d+$/);
  expect(await overflowing(book)).toEqual([]);
  const nav = (await book.locator(".bk-nav").boundingBox())!;
  expect(nav.y + nav.height).toBeLessThanOrEqual(844);
  expect(await page.evaluate(() => document.documentElement.scrollWidth)).toBeLessThanOrEqual(390);
  await book.locator("#nxt").click();
  await expect(book.locator("#cnt")).toHaveText(/^2 \/ \d+$/);
  await page.screenshot({ path: "screenshots/nezeriyye-390.png" });
});

test("bağlı mövzunun kitabı qonağa verilmir (404), açıq mövzununku verilir", async ({ request, page }) => {
  // Adi və onluq kəsrlər — kitabı var, amma Premium qrafikinə görə açılır
  const res = await request.get("/onlayn-repetitor/adi-ve-onluq-kesrler/nezeriyye/kitab");
  expect(res.status()).toBe(404);
  await page.goto("/onlayn-repetitor/adi-ve-onluq-kesrler/nezeriyye");
  await expect(page).toHaveURL(/\/onlayn-repetitor$/);
  const ok = await request.get(`/onlayn-repetitor/${TOPIC}/nezeriyye/kitab`);
  expect(ok.status()).toBe(200);
  expect(ok.headers()["x-frame-options"]).toBe("SAMEORIGIN");
  expect(await ok.text()).not.toContain("Cəfərli");
});
