import { hash } from "@node-rs/argon2";
import { expect, test, type Page } from "@playwright/test";
import { connect } from "./daily-fixture";

// Naviqasiya: yarış səhifəsində sol panel gizlənmir; telefonda "Menyu" bütün bölmələri açır (alt menyuda olmayanlar da).
test.describe.configure({ mode: "serial" });

const stamp = Date.now();
const user = { id: crypto.randomUUID(), email: `e2e+nav${stamp}@example.test`, password: "Naviq2026x" };

async function sql(q: string, args: unknown[] = []) {
  const db = connect();
  const r = await db.execute({ sql: q, args: args as never });
  db.close();
  return r;
}

test.beforeAll(async () => {
  const now = Date.now();
  await sql(
    `insert into users (id, email, username, name, surname, password_hash, role, grade, email_verified_at, terms_accepted_at, created_at, updated_at)
     values (?, ?, ?, 'Nərgiz', 'Əliyeva', ?, 'student', 11, ?, ?, ?, ?)`,
    [user.id, user.email, `e2e_nav${stamp % 1e9}`, await hash(user.password), now, now, now, now],
  );
});

test.afterAll(async () => {
  await sql("delete from users where id = ?", [user.id]);
});

async function login(page: Page) {
  await page.goto("/daxil-ol");
  await page.getByLabel("E-poçt və ya istifadəçi adı").fill(user.email);
  await page.getByLabel("Şifrə", { exact: true }).fill(user.password);
  await page.getByRole("button", { name: "Daxil ol" }).click();
  await expect(page).toHaveURL(/\/(panel|onboarding)/);
}

test("yarış səhifəsinə keçəndə sol panel qalır", async ({ page }) => {
  await page.setViewportSize({ width: 1280, height: 900 });
  await login(page);
  await page.goto("/panel");
  const side = page.locator("aside").getByRole("navigation", { name: "Tətbiq" });
  await side.getByRole("link", { name: "Riyaziyyat yarışı" }).click();
  await expect(page).toHaveURL(/\/yaris$/);
  await expect(side).toBeVisible();
  await expect(side.getByRole("link", { name: "Riyaziyyat yarışı" })).toHaveAttribute("aria-current", "page");
});

test("telefon: Menyu bütün bölmələri açır, keçiddən sonra bağlanır, üfüqi sürüşmə yoxdur", async ({ page }) => {
  await page.setViewportSize({ width: 390, height: 844 });
  await login(page);
  await page.goto("/panel");
  const menu = page.getByRole("button", { name: "Menyu" });
  await expect(menu).toHaveAttribute("aria-expanded", "false");
  await menu.click();
  const dialog = page.getByRole("dialog", { name: "Bütün bölmələr" });
  for (const name of ["Profil", "Səhvlərim", "Zəif mövzular", "Bal simulyatoru", "Statistika", "İmtahan qarşılığı", "Riyaziyyat yarışı Tezliklə", "Qruplarım", "Abunəliklər"]) {
    await expect(dialog.getByRole("link", { name, exact: true })).toBeVisible();
  }
  await dialog.getByRole("link", { name: "Səhvlərim", exact: true }).click();
  await expect(page).toHaveURL(/\/sehvlerim$/);
  await expect(dialog).toBeHidden();
  // Escape ilə bağlanır
  await menu.click();
  await expect(dialog).toBeVisible();
  await page.keyboard.press("Escape");
  await expect(dialog).toBeHidden();
  for (const p of ["/panel", "/yaris", "/sehvlerim", "/qruplarim", "/profil"]) {
    await page.goto(p);
    expect(await page.evaluate(() => document.documentElement.scrollWidth), p).toBeLessThanOrEqual(390);
  }
});
