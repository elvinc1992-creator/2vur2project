import AxeBuilder from "@axe-core/playwright";
import { createClient } from "@libsql/client";
import { loadEnvConfig } from "@next/env";
import { hash } from "@node-rs/argon2";
import { expect, test, type Page } from "@playwright/test";

// Onlayn repetitor: yalnız abunəçilər üçün (serverdə yoxlanılır), ipucu → cavab → izah → növbəti.
test.describe.configure({ mode: "serial" });

const stamp = Date.now();
const user = { email: `e2e+rep${stamp}@example.test`, password: "Rena2026x" };

test.beforeAll(async () => {
  loadEnvConfig(process.cwd());
  const db = createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });
  const now = Date.now();
  await db.execute({
    sql: `insert into users (id, email, username, name, password_hash, role, grade, target_exam,
            email_verified_at, terms_accepted_at, created_at, updated_at)
          values (?, ?, ?, 'Rena', ?, 'student', 11, 'both', ?, ?, ?, ?)`,
    args: [crypto.randomUUID(), user.email, `e2e_r${stamp % 1e9}`, await hash(user.password), now, now, now, now],
  });
  db.close();
});

async function login(page: Page) {
  await page.goto("/daxil-ol");
  await page.getByLabel("E-poçt və ya istifadəçi adı").fill(user.email);
  await page.getByLabel("Şifrə", { exact: true }).fill(user.password);
  await page.getByRole("button", { name: "Daxil ol" }).click();
  await expect(page).toHaveURL(/\/panel$/);
}

async function axe(page: Page) {
  const r = await new AxeBuilder({ page }).withTags(["wcag2a", "wcag2aa", "wcag21a", "wcag21aa", "wcag22aa"]).analyze();
  return r.violations
    .filter((v) => v.impact === "critical" || v.impact === "serious")
    .map((v) => `${v.id} (${v.impact}): ${v.nodes.map((n) => n.target.join(" ")).join(", ")}`);
}

const pick = (page: Page, letter: string, value: string) =>
  page.locator(`label:has(input[aria-label="Variant ${letter}: ${value}"])`).click();

test("pulsuz plan → kilid, abunə → ipucu, cavab, izah, proqres", async ({ page }) => {
  await login(page);

  // Panel və menyu: repetitor kilidlidir
  await expect(page.getByRole("link", { name: /Onlayn repetitor.*Abunə ilə açılır/ })).toBeVisible();
  await page.getByRole("navigation", { name: "Tətbiq" }).first().getByRole("link", { name: "Onlayn repetitor" }).click();
  await expect(page).toHaveURL(/\/onlayn-repetitor$/);
  await expect(page.getByRole("heading", { level: 1, name: "Onlayn repetitor abunə ilə açılır" })).toBeVisible();
  await expect(page.getByRole("link", { name: "Abunə ol" })).toHaveAttribute("href", "/odenis");
  expect(await axe(page)).toEqual([]);

  // Sual səhifəsi pulsuz planda açılmır, mətni HTML-də yoxdur
  await page.goto("/onlayn-repetitor/stereometriya/1");
  await expect(page).toHaveURL(/\/onlayn-repetitor$/);
  const html = await (await page.request.get("/onlayn-repetitor/stereometriya/1")).text();
  expect(html).not.toContain("Düzgün dördbucaqlı prizmanın");

  // Mock abunə
  await page.goto("/odenis");
  await page.getByRole("button", { name: /ödə/ }).click();
  await expect(page).toHaveURL(/\/odenis\/ugurlu\?r=/);

  await page.goto("/onlayn-repetitor");
  await expect(page.getByRole("heading", { level: 1, name: "Onlayn repetitor" })).toBeVisible();
  await expect(page.getByText(/bu sual tiplərinin təxminən 90%-i imtahanda çıxır/)).toBeVisible();
  await expect(page.getByRole("navigation", { name: /: repetitor sualları$/ })).toHaveCount(5);
  expect(await axe(page)).toEqual([]);

  // Sual: ipucu və açar cavabdan əvvəl HTML-də yoxdur
  await page.getByRole("link", { name: "Davam et" }).click();
  await expect(page).toHaveURL(/\/onlayn-repetitor\/stereometriya\/1$/);
  const qHtml = await (await page.request.get("/onlayn-repetitor/stereometriya/1")).text();
  expect(qHtml).toContain("Düzgün dördbucaqlı prizmanın");
  expect(qHtml).not.toContain("oturacağın perimetri");
  expect(qHtml).not.toMatch(/"answer":"[A-E]"/);

  await page.getByRole("button", { name: "İpucu" }).click();
  await expect(page.getByText("Repetitorun ipucu")).toBeVisible();
  await expect(page.getByText(/oturacağın perimetri/)).toBeVisible();
  await expect(page.getByRole("button", { name: "İpucu" })).toBeDisabled();
  expect(await axe(page)).toEqual([]);

  await pick(page, "C", "78");
  await page.getByRole("button", { name: "Cavabı yoxla" }).click();
  await expect(page.getByText("Düzgündür!")).toBeVisible();
  await expect(page.getByText("İpucu ilə həll etdin. Növbəti dəfə ipucusuz yoxla.")).toBeVisible();
  await expect(page.getByText("Repetitorun izahı")).toBeVisible();
  expect(await axe(page)).toEqual([]);

  // Yeniləyəndə cavab, ipucu və izah qalır
  await page.reload();
  await expect(page.getByText("Düzgündür!")).toBeVisible();
  await expect(page.getByText("Repetitorun ipucu")).toBeVisible();

  // Növbəti — yanlış cavab
  await page.getByRole("link", { name: "Növbəti sual" }).click();
  await expect(page).toHaveURL(/\/onlayn-repetitor\/stereometriya\/2$/);
  await pick(page, "A", "144");
  await page.getByRole("button", { name: "Cavabı yoxla" }).click();
  await expect(page.getByText("Yanlışdır. Düzgün cavab: B")).toBeVisible();

  await page.goto("/panel");
  await expect(page.getByRole("link", { name: /Onlayn repetitor.*2 \/ 20 sual/ })).toBeVisible();
  await page.goto("/onlayn-repetitor");
  const pager = page.getByRole("navigation", { name: "Stereometriya: repetitor sualları" });
  await expect(pager.getByRole("link", { name: "Sual 1, düzgün" })).toBeVisible();
  await expect(pager.getByRole("link", { name: "Sual 2, səhv" })).toBeVisible();
});

test("mobil 390: üfüqi sürüşmə yoxdur, alt menyuda Repetitor var", async ({ page }) => {
  await login(page);
  await page.setViewportSize({ width: 390, height: 844 });
  for (const p of ["/onlayn-repetitor", "/onlayn-repetitor/limit-toreme-inteqral/4", "/panel"]) {
    await page.goto(p);
    expect(await page.evaluate(() => document.documentElement.scrollWidth), p).toBeLessThanOrEqual(390);
  }
  await expect(page.getByRole("navigation", { name: "Tətbiq" }).getByRole("link", { name: "Repetitor" })).toBeVisible();
});
