import AxeBuilder from "@axe-core/playwright";
import { createClient } from "@libsql/client";
import { loadEnvConfig } from "@next/env";
import { hash } from "@node-rs/argon2";
import { expect, test, type Page } from "@playwright/test";

// DİM bal simulyatoru: bölmələr üzrə düzgün cavab sayı → təxmini bal (demo düstur).
const stamp = Date.now();
const user = { id: crypto.randomUUID(), email: `e2e+bal${stamp}@example.test`, password: "Kamran2026x" };

const connect = () => {
  loadEnvConfig(process.cwd());
  return createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });
};

test.beforeAll(async () => {
  const db = connect();
  const now = Date.now();
  await db.execute({
    sql: `insert into users (id, email, username, name, password_hash, role, grade, target_exam,
            email_verified_at, terms_accepted_at, created_at, updated_at)
          values (?, ?, ?, 'Kamran', ?, 'student', 11, 'both', ?, ?, ?, ?)`,
    args: [user.id, user.email, `e2e_b${stamp % 1e9}`, await hash(user.password), now, now, now, now],
  });
  db.close();
});

test("son 7 gün: 200 sualdan 120 düzgün → buraxılış 14, blok 17", async ({ page }) => {
  await login(page);
  await page.goto("/bal-simulyatoru");
  await expect(page.getByText(/Son 7 gündə heç bir suala cavab verməmisən/)).toBeVisible();

  // 200 cavab son həftədə (120 düzgün) + 50 köhnə cavab (8 gün əvvəl — nəzərə alınmır).
  const db = connect();
  const now = Date.now();
  const rows = [
    ...Array.from({ length: 200 }, (_, i) => [i < 120 ? 1 : 0, now - i * 60_000]),
    ...Array.from({ length: 50 }, () => [1, now - 8 * 24 * 3600_000]),
  ];
  await db.batch(
    rows.map(([ok, at], i) => ({
      sql: "insert into user_answers (user_id, source, question_ref, correct, answered_at) values (?, 'daily', ?, ?, ?)",
      args: [user.id, `e2e${i}`, ok, at],
    })),
    "write",
  );
  db.close();

  await page.reload();
  const week = page.locator("section[aria-labelledby=score-week]");
  await expect(week.getByText("200", { exact: true })).toBeVisible();
  await expect(week.getByText("120", { exact: true })).toBeVisible();
  await expect(week.getByText("int(25 × 60 / 100) − 1 = 14")).toBeVisible();
  await expect(week.getByText("60%", { exact: true })).toBeVisible();
  await expect(week.getByText("int(30 × 60 / 100) − 1 = 17")).toBeVisible();
  await page.screenshot({ path: "screenshots/bal-simulyatoru-hefte.png", fullPage: true });
});

async function login(page: Page) {
  await page.goto("/daxil-ol");
  await page.getByLabel("E-poçt və ya istifadəçi adı").fill(user.email);
  await page.getByLabel("Şifrə", { exact: true }).fill(user.password);
  await page.getByRole("button", { name: "Daxil ol" }).click();
  await expect(page).toHaveURL(/\/panel$/);
}

test("səhifə: paneldən keçid, əl ilə hesablama yoxdur, axe, mobil", async ({ page }) => {
  await login(page);
  await page.getByRole("link", { name: /DİM bal simulyatoru/ }).click();
  await expect(page).toHaveURL(/\/bal-simulyatoru$/);
  await expect(page.getByRole("heading", { level: 1, name: "DİM bal simulyatoru" })).toBeVisible();
  await expect(page.getByText("Balı özün hesabla")).toHaveCount(0);
  await expect(page.getByRole("spinbutton")).toHaveCount(0);

  const r = await new AxeBuilder({ page }).withTags(["wcag2a", "wcag2aa", "wcag21a", "wcag21aa", "wcag22aa"]).analyze();
  expect(r.violations.filter((v) => v.impact === "critical" || v.impact === "serious").map((v) => v.id)).toEqual([]);

  for (const width of [390, 1440]) {
    await page.setViewportSize({ width, height: 900 });
    expect(await page.evaluate(() => document.documentElement.scrollWidth)).toBeLessThanOrEqual(width);
    await page.screenshot({ path: `screenshots/bal-simulyatoru-${width}.png`, fullPage: true });
  }
});