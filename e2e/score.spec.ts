import AxeBuilder from "@axe-core/playwright";
import { createClient } from "@libsql/client";
import { loadEnvConfig } from "@next/env";
import { hash } from "@node-rs/argon2";
import { expect, test, type Page } from "@playwright/test";

// DİM bal simulyatoru: bölmələr üzrə düzgün cavab sayı → təxmini bal (demo düstur).
const stamp = Date.now();
const user = { email: `e2e+bal${stamp}@example.test`, password: "Kamran2026x" };

test.beforeAll(async () => {
  loadEnvConfig(process.cwd());
  const db = createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });
  const now = Date.now();
  await db.execute({
    sql: `insert into users (id, email, username, name, password_hash, role, grade, target_exam,
            email_verified_at, terms_accepted_at, created_at, updated_at)
          values (?, ?, ?, 'Kamran', ?, 'student', 11, 'both', ?, ?, ?, ?)`,
    args: [crypto.randomUUID(), user.email, `e2e_b${stamp % 1e9}`, await hash(user.password), now, now, now, now],
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

test("hesablama, düymələr, sıfırla, axe, mobil", async ({ page }) => {
  await login(page);
  await page.getByRole("link", { name: /DİM bal simulyatoru/ }).click();
  await expect(page).toHaveURL(/\/bal-simulyatoru$/);
  await expect(page.getByRole("heading", { level: 1, name: "DİM bal simulyatoru" })).toBeVisible();

  const result = page.locator("[aria-live=polite]");
  await expect(result).toContainText("Təxmini bal: 0, maksimum 100");

  await page.getByLabel("Qapalı suallar (A–E): düzgün cavab sayı (0–13)").fill("10");
  await page.getByRole("button", { name: "Kodlaşdırılan suallar: bir çox" }).click();
  await page.getByRole("button", { name: "Kodlaşdırılan suallar: bir çox" }).click();
  await page.getByRole("button", { name: "Yazılı (açıq) suallar: bir çox" }).click();
  await expect(result).toContainText("Təxmini bal: 52, maksimum 100");

  // Maksimumdan çox yazmaq olmur
  await page.getByLabel("Qapalı suallar (A–E): düzgün cavab sayı (0–13)").fill("40");
  await expect(page.getByLabel("Qapalı suallar (A–E): düzgün cavab sayı (0–13)")).toHaveValue("13");
  await expect(page.getByRole("button", { name: "Qapalı suallar (A–E): bir çox" })).toBeDisabled();

  // Məzmunu olmayan növlər deaktivdir
  await expect(page.getByRole("radio", { name: /Qəbul imtahanı/ })).toBeDisabled();
  await expect(page.getByText(/Demo hesablama: hər düzgün cavab 4 bal/)).toBeVisible();

  const r = await new AxeBuilder({ page }).withTags(["wcag2a", "wcag2aa", "wcag21a", "wcag21aa", "wcag22aa"]).analyze();
  expect(r.violations.filter((v) => v.impact === "critical" || v.impact === "serious").map((v) => v.id)).toEqual([]);

  await page.getByRole("button", { name: "Sıfırla" }).click();
  await expect(result).toContainText("Təxmini bal: 0, maksimum 100");

  for (const width of [390, 1440]) {
    await page.setViewportSize({ width, height: 900 });
    await page.getByLabel("Qapalı suallar (A–E): düzgün cavab sayı (0–13)").fill("11");
    expect(await page.evaluate(() => document.documentElement.scrollWidth)).toBeLessThanOrEqual(width);
    await page.screenshot({ path: `screenshots/bal-simulyatoru-${width}.png`, fullPage: true });
  }
});
