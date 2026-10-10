import AxeBuilder from "@axe-core/playwright";
import { createClient } from "@libsql/client";
import { loadEnvConfig } from "@next/env";
import { hash } from "@node-rs/argon2";
import { expect, test } from "@playwright/test";

// İmtahan qarşılığı: imtahanda düşən sual ↔ bizim saytdakı qarşılığı (exam_counterparts).
const stamp = Date.now();
const user = { email: `e2e+em${stamp}@example.test`, password: "Kamal2026x" };

test.beforeAll(async () => {
  loadEnvConfig(process.cwd());
  const db = createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });
  const now = Date.now();
  await db.execute({
    sql: `insert into users (id, email, username, name, password_hash, role, grade, email_verified_at, terms_accepted_at, created_at, updated_at)
          values (?, ?, ?, 'Kamal', ?, 'student', 11, ?, ?, ?, ?)`,
    args: [crypto.randomUUID(), user.email, `e2e_em${stamp % 1e9}`, await hash(user.password), now, now, now, now],
  });
  db.close();
});

test("27 imtahan sualı və qarşılığı (JSON-dan); interaktiv variantlar, şəkil, toplu sözü yoxdur", async ({ page }) => {
  // Qonaq — girişə yönləndirilir
  await page.goto("/imtahan-qarsiligi");
  await expect(page).toHaveURL(/\/daxil-ol\?next=%2Fimtahan-qarsiligi/);
  await page.getByLabel("E-poçt və ya istifadəçi adı").fill(user.email);
  await page.getByLabel("Şifrə", { exact: true }).fill(user.password);
  await page.getByRole("button", { name: "Daxil ol" }).click();
  await expect(page).toHaveURL(/\/imtahan-qarsiligi$/);

  await expect(page.getByRole("heading", { level: 1, name: "İmtahan və bizim suallar" })).toBeVisible();
  await expect(page.getByRole("article")).toHaveCount(27);
  await expect(page.getByRole("progressbar", { name: "Sual bankı hazır olan mövzular" })).toBeVisible();
  await expect(page.getByText("4 / 27 mövzu")).toBeVisible();
  await expect(page.getByRole("main")).not.toContainText(/toplu/i);

  // Noutbuk ekranında (1366×768) ilk mövzunun hər iki kartı açılan kimi görünür
  await page.setViewportSize({ width: 1366, height: 768 });
  const first = page.getByRole("article").first();
  await page.screenshot({ path: "screenshots/imtahan-qarsiligi-1366.png" });
  for (const name of ["İmtahanda düşən sual", "Bizim saytda"]) {
    const box = (await first.getByRole("region", { name }).boundingBox())!;
    expect(box.y + 220).toBeLessThan(768); // nişan, tarix və sualın mətni görünür
  }
  await page.setViewportSize({ width: 1280, height: 900 });

  // Stereometriya: imtahan sualı + bizim qarşılıq (şəkil ilə)
  const stereo = page.getByRole("article", { name: "Stereometriya" });
  const exam = stereo.getByRole("region", { name: "İmtahanda düşən sual" });
  const ours = stereo.getByRole("region", { name: "Bizim saytda" });
  await expect(exam).toContainText("Buraxılış 02.04.2023");
  await expect(exam).toContainText("Sual №5");
  await expect(ours.getByRole("img", { name: "Stereometriya — sualın şəkli" })).toBeVisible();

  // Səhv variant → "Yenidən cəhd et", düzgün (B) → "Düzgün cavab"
  await ours.getByRole("button", { name: /^A/ }).click();
  await expect(ours.getByText("Yenidən cəhd et!")).toBeVisible();
  await ours.getByRole("button", { name: /^B/ }).click();
  await expect(ours.getByText("Əla! Düzgün cavab.")).toBeVisible();
  await exam.getByText("İmtahandakı düzgün cavab").click();
  await expect(exam.locator("details p")).toContainText("C)");

  // Free istifadəçi — Premium təklifi
  await expect(ours.getByRole("link", { name: "Premium ilə həll et" })).toHaveAttribute("href", "/abunelikler");
  await stereo.screenshot({ path: "screenshots/imtahan-qarsiligi-kart-1280.png" });
  const r = await new AxeBuilder({ page }).withTags(["wcag2a", "wcag2aa", "wcag21a", "wcag21aa", "wcag22aa"]).analyze();
  expect(r.violations.filter((v) => v.impact === "critical" || v.impact === "serious").map((v) => v.id)).toEqual([]);

  for (const width of [390, 1280]) {
    await page.setViewportSize({ width, height: 900 });
    expect(await page.evaluate(() => document.documentElement.scrollWidth)).toBeLessThanOrEqual(width);
  }
  await page.evaluate(() => window.scrollTo(0, 0));
  await page.screenshot({ path: "screenshots/imtahan-qarsiligi-1280.png", fullPage: false });
  await page.setViewportSize({ width: 390, height: 900 });
  await stereo.scrollIntoViewIfNeeded();
  await page.screenshot({ path: "screenshots/imtahan-qarsiligi-390.png", fullPage: false });
});
