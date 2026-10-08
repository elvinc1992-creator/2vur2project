import AxeBuilder from "@axe-core/playwright";
import { expect, test, type Page } from "@playwright/test";

// Landing: bazadan rəqəmlər, bölmələr, nümunə kart (cavab sızmır), mobil menyu, axe, üfüqi sürüşmə yoxdur.

async function axe(page: Page) {
  const r = await new AxeBuilder({ page }).withTags(["wcag2a", "wcag2aa", "wcag21a", "wcag21aa", "wcag22aa"]).analyze();
  return r.violations
    .filter((v) => v.impact === "critical" || v.impact === "serious")
    .map((v) => `${v.id} (${v.impact}): ${v.nodes.map((n) => n.target.join(" ")).join(", ")}`);
}

const stat = (page: Page, label: string | RegExp) =>
  page.locator("dl > div").filter({ has: page.locator("dt", { hasText: label }) }).locator("dd");

test("desktop: rəqəmlər bazadan, bölmələr və linklər", async ({ page }) => {
  await page.goto("/");
  await expect(page.getByRole("heading", { level: 1 })).toHaveText("İmtahanda nə çıxıb, nəyi işləməlisən");

  // Rəqəmlər (Yekun vərəqi): 1 053 sual, 4 il, 27 mövzu, 997 / 1 053 = 94,7%
  await expect(stat(page, "imtahan sualı analiz olunub")).toHaveText(/1\s053/);
  await expect(stat(page, /^il:/)).toHaveText("4");
  await expect(stat(page, "mövzu üzrə təsnifat")).toHaveText("27");
  await expect(stat(page, /2025 test toplusunda/)).toHaveText("94,7%");

  // Hero reytinqi: ilk yer — Stereometriya (92), link mövzu səhifəsinə
  const rank = page.getByRole("article", { name: "Ən çox sual çıxan mövzular" });
  await expect(rank.getByRole("listitem")).toHaveCount(5);
  await expect(rank.getByRole("link").first()).toHaveAttribute("href", "/statistika/stereometriya");
  await expect(rank.getByRole("link").first()).toContainText("92");

  // Mövzular: 8 kart + bütün mövzular düyməsi
  const topics = page.locator("#movzular");
  await expect(topics.getByRole("heading", { level: 2 })).toHaveText("27 mövzu, hər biri rəqəmlə");
  await expect(topics.getByRole("listitem")).toHaveCount(8);
  await expect(topics.getByRole("link", { name: "Bütün 27 mövzunu gör" })).toHaveAttribute("href", "/statistika");

  // Header anker linkləri və bölmələr
  for (const id of ["movzular", "nece-isleyir", "sinaqlar", "qiymetler", "numune"]) {
    await expect(page.locator(`#${id}`)).toHaveCount(1);
  }
  const nav = page.getByRole("banner").getByRole("navigation", { name: "Əsas" });
  await expect(nav.getByRole("link")).toHaveCount(4);

  // Qiymətlər: 3 plan, aylıq — "Ən çox seçilən", CTA-lar düzgün səhifələrə
  const pricing = page.locator("#qiymetler");
  await expect(pricing.getByRole("article")).toHaveCount(3);
  await expect(pricing.getByRole("article", { name: "Aylıq abunə" })).toContainText("Ən çox seçilən");
  await expect(pricing.getByRole("link", { name: "Abunə ol" })).toHaveAttribute("href", "/odenis");
  await expect(pricing.getByRole("link", { name: "Pulsuz başla" })).toHaveAttribute("href", "/qeydiyyat");

  // Footer: məcburi cümlə
  await expect(page.getByRole("contentinfo")).toContainText("Bu layihə müstəqildir və DİM ilə əlaqəli deyil.");
  expect(await axe(page)).toEqual([]);
});

test("nümunə kart: seçim göstərilir, düzgün cavab brauzerə getmir", async ({ page }) => {
  await page.goto("/#numune");
  const card = page.getByRole("article", { name: "Nümunə tapşırıq kartı" });
  await expect(card.locator(".katex").first()).toBeVisible();
  const c = card.getByRole("button", { name: "Cavab C" });
  await c.click();
  await expect(c).toHaveAttribute("aria-pressed", "true");
  await expect(card.getByRole("status")).toContainText("Seçdin: C.");
  await expect(card.getByRole("link", { name: /qeydiyyatdan keç/ })).toHaveAttribute("href", "/qeydiyyat");
  // Yoxlama nəticəsi (düz/səhv) yoxdur
  await expect(card).not.toContainText(/Düzgün|Səhv/);
  await card.getByRole("button", { name: "Cavab A" }).click();
  await expect(card.getByRole("button", { name: "Cavab C" })).toHaveAttribute("aria-pressed", "false");
});

test("mobil 390: menyu açılır/bağlanır, üfüqi sürüşmə yoxdur", async ({ page }) => {
  await page.setViewportSize({ width: 390, height: 844 });
  await page.goto("/");
  expect(await page.evaluate(() => document.documentElement.scrollWidth)).toBeLessThanOrEqual(390);

  const toggle = page.getByRole("button", { name: "Menyu" });
  await expect(toggle).toHaveAttribute("aria-expanded", "false");
  await toggle.click();
  const close = page.getByRole("button", { name: "Menyunu bağla" });
  await expect(close).toHaveAttribute("aria-expanded", "true");
  const menu = page.getByRole("banner").getByRole("navigation", { name: "Əsas" });
  await expect(menu.getByRole("link", { name: "Daxil ol" })).toBeVisible();
  expect(await axe(page)).toEqual([]);
  await page.keyboard.press("Escape");
  await expect(page.getByRole("button", { name: "Menyu" })).toHaveAttribute("aria-expanded", "false");

  // Anker linki menyunu bağlayır və bölməyə keçir
  await page.getByRole("button", { name: "Menyu" }).click();
  await menu.getByRole("link", { name: "Qiymətlər" }).click();
  await expect(page).toHaveURL(/#qiymetler$/);
  await expect(page.getByRole("button", { name: "Menyu" })).toHaveAttribute("aria-expanded", "false");

  // Mobil-də aylıq plan birinci gəlir
  const plans = page.locator("#qiymetler article");
  const boxes = await Promise.all([0, 1, 2].map((i) => plans.nth(i).boundingBox()));
  const monthly = await page.getByRole("article", { name: "Aylıq abunə" }).boundingBox();
  expect(monthly!.y).toBe(Math.min(...boxes.map((b) => b!.y)));
  expect(await axe(page)).toEqual([]);
});
