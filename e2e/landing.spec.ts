import AxeBuilder from "@axe-core/playwright";
import { createClient } from "@libsql/client";
import { loadEnvConfig } from "@next/env";
import { hash } from "@node-rs/argon2";
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
  await expect(page.getByRole("heading", { level: 1 })).toHaveText("DİM imtahanlarına süni intellektlə hazırlıq");
  await expect(page).toHaveTitle("2vur2.az — DİM imtahanlarına süni intellektlə hazırlıq");
  await expect(page.locator('meta[property="og:image"]')).toHaveAttribute("content", /\/img\/og-cover\.jpg$/);

  // Hero: düymələr və neyron şəbəkə
  await expect(page.getByRole("link", { name: "Pulsuz başla" })).toHaveAttribute("href", "/qeydiyyat");
  await expect(page.getByRole("link", { name: "Necə işləyir?" })).toHaveAttribute("href", "#nece-isleyir");
  await expect(page.getByRole("img", { name: /Neyron şəbəkə/ })).toBeVisible();

  // Rəqəmlər zolağı: 0-dan sayır, sonda son qiymət
  await expect(stat(page, "analiz olunmuş sual")).toHaveText("30 000+");
  await expect(stat(page, "DİM imtahanı")).toHaveText("100+");
  await expect(stat(page, /^mövzu$/)).toHaveText("27");
  await expect(stat(page, "buraxılış və blok qəbul")).toHaveText("9 · 11 · Blok");

  // Necə işləyir: 4 addım; imtahan qarşılığı: iki kart + AI qeydi
  await expect(page.locator("#nece-isleyir").getByRole("listitem")).toHaveCount(4);
  const match = page.locator("#imtahan-qarsiligi");
  await expect(match.getByRole("heading", { level: 2 })).toHaveText("Suallarımız təsadüfi deyil!");
  await expect(match.getByRole("article")).toHaveCount(2);
  await expect(match).toContainText("Bu sual tipi AI tərəfindən əvvəlcədən müəyyənləşdirilmişdi.");

  // Mövzular: 8 kart + bütün mövzular düyməsi
  const topics = page.locator("#movzular");
  await expect(topics.getByRole("heading", { level: 2 })).toHaveText("27 mövzu, hər biri rəqəmlə");
  await expect(topics.getByRole("listitem")).toHaveCount(8);
  await expect(topics.getByRole("link", { name: "Bütün 27 mövzunu gör" })).toHaveAttribute("href", "/statistika");

  // Header anker linkləri və bölmələr
  for (const id of ["movzular", "nece-isleyir", "repetitor", "sinaqlar", "imtahan-qarsiligi", "qiymetler", "numune"]) {
    await expect(page.locator(`#${id}`)).toHaveCount(1);
  }
  const nav = page.getByRole("banner").getByRole("navigation", { name: "Əsas" });
  await expect(nav.getByRole("link")).toHaveCount(6);

  // Qiymətlər: Abunəliklər səhifəsindəki kartlar — Free / Pro / Premium, Premium — "Ən çox seçilən"
  const pricing = page.locator("#qiymetler");
  await expect(pricing.getByRole("region")).toHaveCount(3);
  await expect(pricing.getByRole("region", { name: "Premium" })).toContainText("Ən çox seçilən");
  await expect(pricing.getByRole("link", { name: "Pro-ya keç · aylıq" })).toHaveAttribute("href", "/odenis?plan=pro&period=month");
  await expect(pricing.getByRole("link", { name: "Ödənişsiz başla" })).toHaveAttribute("href", "/qeydiyyat");

  // Footer: məcburi cümlə
  await expect(page.getByRole("contentinfo")).toContainText("Bu layihə müstəqildir və DİM-ə məxsus deyil.");
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

  // Mobil-də kartlar bir sütunda: Free, Pro, Premium (alt-alta)
  const plans = page.locator("#qiymetler").getByRole("region");
  const boxes = await Promise.all([0, 1, 2].map((i) => plans.nth(i).boundingBox()));
  expect(boxes[0]!.y).toBeLessThan(boxes[1]!.y);
  expect(boxes[1]!.y).toBeLessThan(boxes[2]!.y);
  expect(await page.evaluate(() => document.documentElement.scrollWidth)).toBeLessThanOrEqual(390);
  expect(await axe(page)).toEqual([]);
});

test("daxil olmuş istifadəçi ana səhifədə çıxmış görünmür: başlıqda 'Panelə keç'", async ({ page }) => {
  const stamp = Date.now();
  const user = { email: `e2e+land${stamp}@example.test`, password: "Lale2026x" };
  loadEnvConfig(process.cwd());
  const db = createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });
  const now = Date.now();
  await db.execute({
    sql: `insert into users (id, email, username, name, password_hash, role, grade, email_verified_at, terms_accepted_at, created_at, updated_at)
          values (?, ?, ?, 'Lalə', ?, 'student', 11, ?, ?, ?, ?)`,
    args: [crypto.randomUUID(), user.email, `e2e_l${stamp % 1e9}`, await hash(user.password), now, now, now, now],
  });
  db.close();

  // Qonaq: Daxil ol
  await page.goto("/");
  const header = page.getByRole("banner");
  await expect(header.getByRole("link", { name: "Daxil ol" })).toBeVisible();

  // Daxil ol → ana səhifəyə qayıt (loqo) → sessiya qalır
  await page.goto("/daxil-ol");
  await page.getByLabel("E-poçt və ya istifadəçi adı").fill(user.email);
  await page.getByLabel("Şifrə", { exact: true }).fill(user.password);
  await page.getByRole("button", { name: "Daxil ol" }).click();
  await expect(page).toHaveURL(/\/panel$/);
  await page.goto("/");
  await expect(header.getByRole("link", { name: "Panelə keç" })).toBeVisible();
  await expect(header.getByRole("link", { name: "Daxil ol" })).toHaveCount(0);
  await header.getByRole("link", { name: "Panelə keç" }).click();
  await expect(page).toHaveURL(/\/panel$/);
});