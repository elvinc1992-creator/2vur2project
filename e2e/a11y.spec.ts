import AxeBuilder from "@axe-core/playwright";
import { createClient } from "@libsql/client";
import { loadEnvConfig } from "@next/env";
import { hash } from "@node-rs/argon2";
import { expect, test, type Page } from "@playwright/test";
import { fixDaily } from "./daily-fixture";

// C3: Sınaq, Nəticə, Profil (və Statistika) səhifələrində kritik və ciddi axe pozuntusu = 0.
test.describe.configure({ mode: "serial" });

const stamp = Date.now();
const user = { id: crypto.randomUUID(), email: `e2e+a11y${stamp}@example.test`, password: "Lale2026x" };

test.beforeAll(async () => {
  loadEnvConfig(process.cwd());
  const db = createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });
  const now = Date.now();
  await db.execute({
    sql: `insert into users (id, email, username, name, password_hash, role, grade, target_exam,
            email_verified_at, terms_accepted_at, created_at, updated_at)
          values (?, ?, ?, 'Lalə', ?, 'student', 11, 'both', ?, ?, ?, ?)`,
    args: [user.id, user.email, `e2e_x${stamp % 1e9}`, await hash(user.password), now, now, now, now],
  });
  db.close();
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
  const bad = r.violations.filter((v) => v.impact === "critical" || v.impact === "serious");
  return bad.map((v) => `${v.id} (${v.impact}): ${v.nodes.map((n) => n.target.join(" ")).join(", ")}`);
}

test("axe: sınaq, nəticə, profil, statistika", async ({ page, browser }) => {
  await login(page);
  // Sınaq: al, başla, bir cavab ver
  await page.goto("/odenis?exam=1");
  await page.getByRole("button", { name: /ödə/ }).click();
  await page.getByRole("button", { name: "Sınağa başla" }).click();
  await expect(page).toHaveURL(/\/sinaq\/1$/);
  await page.keyboard.press("c");
  const results: Record<string, string[]> = {};
  results["/sinaq/1"] = await axe(page);
  // Cavab vərəqi və bitir dialoqu da yoxlanılır
  await page.getByRole("button", { name: "Cavab vərəqi" }).first().click();
  results["/sinaq/1 (vərəq)"] = await axe(page);
  await page.getByRole("button", { name: "Sınağı bitir" }).last().click();
  results["/sinaq/1 (dialoq)"] = await axe(page);
  await page.getByRole("button", { name: "Bitir", exact: true }).click();
  await expect(page).toHaveURL(/\/sinaq\/1\/netice$/);
  results["/sinaq/1/netice"] = await axe(page);
  for (const p of [
    "/profil",
    "/statistika",
    "/statistika/stereometriya",
    "/panel",
    "/gunun-suallari",
    "/gunun-suallari/faiz-nisbet-tenasub/1",
    "/gunun-suallari/faiz-nisbet-tenasub/3",
  ]) {
    await page.goto(p);
    results[p] = await axe(page);
  }
  // Cədvəl görünüşü də yoxlanılır
  await page.goto("/statistika");
  await page.getByRole("button", { name: "Cədvəl kimi göstər" }).click();
  results["/statistika (cədvəl)"] = await axe(page);
  // Qonaq görünüşü (Statistika ictimaidir)
  const guestCtx = await browser.newContext();
  const guest = await guestCtx.newPage();
  for (const p of ["/statistika", "/statistika/stereometriya"]) {
    await guest.goto(p);
    results[`${p} (qonaq)`] = await axe(guest);
  }
  await guestCtx.close();

  for (const [p, v] of Object.entries(results)) console.log(`axe ${p}: ${v.length ? v.join("; ") : "0 kritik/ciddi"}`);
  expect(Object.values(results).flat()).toEqual([]);
});

// C4: ekran görüntüləri — 390px və 1440px, dörd səhifə, açıq vəziyyət.
test("ekran görüntüləri: sınaq, nəticə, profil, statistika", async ({ page }) => {
  await login(page);
  // Nəticə (sınaq 1) əvvəlki testdə bitib; yarımçıq sınaq üçün 2-ni başladırıq.
  await page.goto("/odenis?exam=2");
  await page.getByRole("button", { name: /ödə/ }).click();
  await page.getByRole("button", { name: "Sınağa başla" }).click();
  await expect(page).toHaveURL(/\/sinaq\/2$/);
  // 1-ci sınaq bu kontekstdə yoxdursa, onu da bitiririk
  await page.goto("/sinaq/1/netice");
  if (!page.url().endsWith("/netice")) {
    await page.goto("/odenis?exam=1");
    await page.getByRole("button", { name: /ödə/ }).click();
    await page.getByRole("button", { name: "Sınağa başla" }).click();
    await page.keyboard.press("c");
    await page.waitForTimeout(500);
    await page.getByRole("button", { name: "Sınağı bitir" }).first().click();
    await page.getByRole("button", { name: "Bitir", exact: true }).click();
    await expect(page).toHaveURL(/\/netice$/);
  }
  const pages: Array<[string, string]> = [
    ["sinaq", "/sinaq/2"],
    ["netice", "/sinaq/1/netice"],
    ["profil", "/profil"],
    ["statistika", "/statistika"],
  ];
  for (const width of [390, 1440]) {
    await page.setViewportSize({ width, height: width === 390 ? 844 : 900 });
    for (const [name, url] of pages) {
      await page.goto(url);
      await page.waitForLoadState("networkidle");
      await page.screenshot({ path: `screenshots/${name}-${width}.png`, fullPage: true });
    }
  }
});
