import AxeBuilder from "@axe-core/playwright";
import { createClient } from "@libsql/client";
import { loadEnvConfig } from "@next/env";
import { hash } from "@node-rs/argon2";
import { expect, test, type Page } from "@playwright/test";
import { fixDaily } from "./daily-fixture";

// Səhvlərim: səhv cavablar toplanır, "Səhvlərimi təkrar et" — həmin suallar + oxşar suallar.
test.describe.configure({ mode: "serial" });

const stamp = Date.now();
const user = { id: crypto.randomUUID(), email: `e2e+mis${stamp}@example.test`, password: "Sevda2026x" };

test.beforeAll(async () => {
  loadEnvConfig(process.cwd());
  const db = createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });
  const now = Date.now();
  await db.execute({
    sql: `insert into users (id, email, username, name, password_hash, role, grade, target_exam,
            email_verified_at, terms_accepted_at, created_at, updated_at)
          values (?, ?, ?, 'Sevda', ?, 'student', 11, 'both', ?, ?, ?, ?)`,
    args: [user.id, user.email, `e2e_m${stamp % 1e9}`, await hash(user.password), now, now, now, now],
  });
  db.close();
  // Günün sualları təsadüfidir — testdə sabit dəst (faiz: f1, f3, f2…).
  await fixDaily(user.id);
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

async function answer(page: Page, letter: string, value: string) {
  await pick(page, letter, value);
  await page.getByRole("button", { name: "Cavabı yoxla" }).click();
}

test("Free: səhv → Səhvlərim → təkrar → düzəldildi", async ({ page }) => {
  await login(page);
  await page.goto("/sehvlerim");
  await expect(page.getByRole("heading", { name: "Hələ səhvin yoxdur" })).toBeVisible();

  // Günün sualı (faiz/1 = f1, düzgün: B · 12) — səhv cavab
  await page.goto("/gunun-suallari/faiz-nisbet-tenasub/1");
  await answer(page, "A", "10");
  await expect(page.getByText("Bu sual Səhvlərim bölməsinə əlavə olundu.")).toBeVisible();
  await page.getByRole("link", { name: "Səhvlərimə bax" }).click();
  await expect(page).toHaveURL(/\/sehvlerim$/);

  const card = page.getByRole("article", { name: "Faiz. Nisbət. Tənasüb: Sadə və mürəkkəb faiz" });
  await expect(card).toContainText("Sənin cavabın");
  await expect(card).toContainText("Düzgün cavab");
  await expect(card.locator("dd").first()).toContainText("A · 10");
  await expect(card.locator("dd").last()).toContainText("B · 12");
  await expect(page.getByText(/Free planda təkrar yalnız öz səhvlərindən ibarətdir/)).toBeVisible();
  expect(await axe(page)).toEqual([]);

  // Paneldə kart
  await page.goto("/panel");
  await expect(page.getByRole("link", { name: /Səhvlərim.*1 səhv təkrar gözləyir/ })).toBeVisible();

  // Təkrar: yalnız həmin sual (Free planda oxşar sual yoxdur)
  await page.goto("/sehvlerim");
  await page.getByRole("button", { name: "Səhvlərimi təkrar et" }).click();
  await expect(page).toHaveURL(/\/sehvlerim\/tekrar\/1$/);
  await expect(page.getByText("Səhv etdiyin sual", { exact: true })).toBeVisible();
  await expect(page.getByRole("navigation", { name: "Təkrar sualları" }).getByRole("link")).toHaveCount(1);
  expect(await axe(page)).toEqual([]);
  await answer(page, "B", "12");
  await expect(page.getByText("Bu səhv düzəldildi!")).toBeVisible();
  await page.getByRole("link", { name: "Nəticəyə bax" }).click();
  await expect(page).toHaveURL(/\/sehvlerim\?bitdi=1$/);
  await expect(page.getByText("1 sualdan 1-i düzgün. 1 səhv düzəldildi.")).toBeVisible();
  await expect(card.getByText("Düzəldildi")).toBeVisible();
  await expect(page.getByText("Bütün səhvlər düzəldilib!")).toBeVisible();
});

test("Pro: səhv + oxşar suallar; oxşara səhv cavab da Səhvlərimə düşür", async ({ page }) => {
  await login(page);
  await page.goto("/odenis");
  await page.getByRole("button", { name: /ödə/ }).click();
  await expect(page).toHaveURL(/\/odenis\/ugurlu\?r=/);

  // faiz/3 = f2 (Ardıcıl faiz artımı, düzgün: C · 16%) — Pro ilə açılır; səhv
  await page.goto("/gunun-suallari/faiz-nisbet-tenasub/3");
  await answer(page, "A", "12%");
  await expect(page.getByText("Yanlışdır. Düzgün cavab: C")).toBeVisible();
  await page.goto("/sehvlerim");
  await expect(page.getByText("1 səhv + 2 oxşar sual")).toBeVisible();
  await page.getByRole("button", { name: "Səhvlərimi təkrar et" }).click();

  const pager = page.getByRole("navigation", { name: "Təkrar sualları" });
  await expect(pager.getByRole("link")).toHaveCount(3);
  await expect(page.getByText("Səhv etdiyin sual", { exact: true })).toBeVisible();
  await answer(page, "C", "16%");
  await expect(page.getByText("Bu səhv düzəldildi!")).toBeVisible();

  // 2-ci: oxşar sual (eyni tip — f9), səhv cavab
  await page.getByRole("link", { name: "Növbəti sual" }).click();
  await expect(page).toHaveURL(/\/sehvlerim\/tekrar\/2$/);
  await expect(page.getByText("Oxşar sual", { exact: true })).toBeVisible();
  await expect(page.getByText("Ardıcıl faiz artımı", { exact: true })).toBeVisible();
  await answer(page, "A", "Dəyişmədi");
  await expect(page.getByText("Yanlışdır. Düzgün cavab: C")).toBeVisible();
  expect(await axe(page)).toEqual([]);

  // Yarımçıq seans: davam et
  await page.goto("/sehvlerim");
  await expect(page.getByRole("link", { name: "Təkrara davam et · 2/3" })).toHaveAttribute("href", "/sehvlerim/tekrar/3");
  // Oxşara verilən səhv cavab — "Təkrar" mənbəli yeni səhv
  await expect(page.getByRole("article", { name: "Faiz. Nisbət. Tənasüb: Ardıcıl faiz artımı" }).filter({ hasText: "Təkrar" })).toBeVisible();

  for (const width of [390, 1440]) {
    await page.setViewportSize({ width, height: 900 });
    expect(await page.evaluate(() => document.documentElement.scrollWidth)).toBeLessThanOrEqual(width);
    await page.screenshot({ path: `screenshots/sehvlerim-${width}.png`, fullPage: true });
  }
});
