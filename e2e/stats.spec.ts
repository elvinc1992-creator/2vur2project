import { createClient } from "@libsql/client";
import { loadEnvConfig } from "@next/env";
import { hash } from "@node-rs/argon2";
import { expect, test, type Page } from "@playwright/test";

test.describe.configure({ mode: "serial" });

const stamp = Date.now();
const user = { email: `e2e+stat${stamp}@example.test`, password: "Rauf2026x" };

test.beforeAll(async () => {
  loadEnvConfig(process.cwd());
  const db = createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });
  const now = Date.now();
  await db.execute({
    sql: `insert into users (id, email, username, name, password_hash, role, grade, target_exam,
            email_verified_at, terms_accepted_at, created_at, updated_at)
          values (?, ?, ?, 'Rauf', ?, 'student', 11, 'both', ?, ?, ?, ?)`,
    args: [crypto.randomUUID(), user.email, `e2e_s${stamp % 1e9}`, await hash(user.password), now, now, now, now],
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

const card = (page: Page, label: string) =>
  page.locator("dl > div").filter({ has: page.getByText(label, { exact: true }) });

test("qonaq: kartlar (30000+, 100+), süzgəc yoxdur, reytinqdə sual sayı 2 qat, metodika yoxdur", async ({ page }) => {
  await page.goto("/statistika");
  await expect(page.getByRole("heading", { level: 1, name: "İmtahan statistikası" })).toBeVisible();
  await expect(card(page, "Analiz olunmuş sual")).toContainText("30000+");
  await expect(card(page, "Analiz olunmuş imtahan")).toContainText("100+");
  await expect(card(page, "Mövzu")).toContainText("27");
  await expect(card(page, "Test toplularında qarşılığı tapılıb")).toContainText("94,7%");
  await expect(page.getByText(/2023|2025 toplu/)).toHaveCount(0);

  // İmtahan növü və illər — yalnız məlumat, klik olunmur
  await expect(page.getByText("Buraxılış və qəbul")).toBeVisible();
  await expect(page.getByText("2016–2026")).toBeVisible();
  await expect(page.getByRole("radio")).toHaveCount(0);
  await expect(page.getByRole("checkbox")).toHaveCount(0);

  // Reytinq: Stereometriya 92 → 184 sual, faiz eyni
  const chart = page.getByRole("img", { name: /Ən çox çıxan mövzu: Stereometriya, 184 sual, 8,7%/ });
  await expect(chart).toBeVisible();
  await expect(chart.locator("li").first()).toContainText("184 sual · 8,7%");
  await page.getByRole("button", { name: "Cədvəl kimi göstər" }).click();
  const table = page.getByRole("table", { name: "Mövzular üzrə imtahanda çıxan sual sayı" });
  await expect(table.getByRole("rowheader").first()).toContainText("Stereometriya");
  await expect(table.locator("tbody tr").first()).toContainText("184");
  // 40-dan az olan saylar 30–39 aralığına çəkilir, sıra saxlanır
  const counts = (await table.locator("tbody tr td:nth-child(2)").allTextContents()).map((s) => Number(s.replace(/\D/g, "")));
  expect(Math.min(...counts)).toBe(30);
  expect(counts.every((c, i) => i === 0 || c <= counts[i - 1])).toBe(true);

  // Ən kiçik mövzunun səhifəsi: "Cəmi sual" cədvəldəki ilə eyni, illər üzrə cəm də
  const last = table.locator("tbody tr").last();
  const lastCount = Number((await last.locator("td").first().textContent())!.replace(/\D/g, ""));
  await last.getByRole("link").click();
  await expect(card(page, "Cəmi sual")).toContainText(String(lastCount));
  const yearsLabel = (await page.getByRole("img", { name: /İllər üzrə sual sayı:/ }).getAttribute("aria-label")) ?? "";
  const yearSum = [...yearsLabel.matchAll(/\d{4} — (\d+)/g)].reduce((s, m) => s + Number(m[1]), 0);
  expect(yearSum).toBe(lastCount);
  await page.goto("/statistika");

  await expect(page.getByText("Metodika və qeydlər")).toHaveCount(0);
});

test("mövzu detalı: 2 qat sual, 2016–2026 rəngli dinamika (cəm 2 qat), uyğunluq faizlə, tiplər yoxdur, 10 nümunə istinad", async ({ page }) => {
  await page.goto("/statistika/stereometriya");
  await expect(page.getByRole("heading", { level: 1, name: "Stereometriya" })).toBeVisible();
  await expect(card(page, "Cəmi sual")).toContainText("184");

  // İllər: real illər (2017 — 34, 2018 — 32, 2023 — 8, 2025 — 18) qalır, cəmi 184
  const years = page.getByRole("img", { name: /İllər üzrə sual sayı:/ });
  const label = (await years.getAttribute("aria-label")) ?? (await years.textContent()) ?? "";
  const pairs = [...label.matchAll(/(\d{4}) — (\d+)/g)].map((m) => [Number(m[1]), Number(m[2])]);
  expect(pairs.map(([y]) => y)).toEqual([2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025, 2026]);
  expect(pairs.reduce((s, [, n]) => s + n, 0)).toBe(184);
  expect(Object.fromEntries(pairs)).toMatchObject({ 2017: 34, 2018: 32, 2023: 8, 2025: 18 });

  // Buraxılış/qəbul: sual sayı 2 qat
  const kinds = page.locator("section[aria-labelledby=kinds]");
  await expect(kinds.getByRole("img", { name: /Buraxılış: \d+ sual, qəbul: \d+ sual/ })).toBeVisible();

  // Uyğunluq: yalnız test toplusu, yalnız faiz
  const match = page.locator("section[aria-labelledby=matches]");
  await expect(match.getByRole("heading", { name: "Test toplusu ilə uyğunluq dərəcələri" })).toBeVisible();
  await expect(match.getByText(/^\d+ ·/)).toHaveCount(0);
  await expect(match.getByText(/^\d+(,\d)?%$/).first()).toBeVisible();

  await expect(page.getByRole("heading", { name: "Sual tipləri" })).toHaveCount(0);

  // İstinadlar: nümunə — 10 ədəd
  await expect(page.getByText("Nümunə", { exact: true })).toBeVisible();
  await expect(page.getByText(/Nümunə: mövzu üzrə yalnız 10 istinad/)).toBeVisible();
  await expect(page.getByRole("table", { name: "Toplu istinadları" }).locator("tbody tr")).toHaveCount(10);

  for (const width of [390, 1280]) {
    await page.setViewportSize({ width, height: 900 });
    expect(await page.evaluate(() => document.documentElement.scrollWidth)).toBeLessThanOrEqual(width);
    await page.screenshot({ path: `screenshots/statistika-movzu-${width}.png`, fullPage: true });
  }
});
test("mobil (390px): qrafiklər default olaraq cədvəl kimi", async ({ page }) => {
  await page.setViewportSize({ width: 390, height: 844 });
  await page.goto("/statistika");
  await expect(page.getByRole("table", { name: "Mövzular üzrə imtahanda çıxan sual sayı" })).toBeVisible();
  await expect(page.getByRole("button", { name: "Qrafik kimi göstər" })).toBeVisible();
});

test("daxil olmuş (Free daxil): statistika tam açıqdır — şəxsi faiz, prioritet plan, bütün istinadlar", async ({ page }) => {
  await login(page);
  // Yeni istifadəçi Free plandadır — statistika yenə tam açıqdır, plan üçün məlumat gözlənilir
  await page.goto("/statistika");
  await expect(page.getByText("Bir sınaq və ya 10 günün sualı həll et, plan hazırlansın.")).toBeVisible();
  await expect(page.getByText("Prioritet plan abunə ilə açılır")).toHaveCount(0);

  // Sınaq (Free: ayın sınağı): 1-ci (faiz) düzgün, qalanı boş → bitir
  await page.goto("/sinaq/b11-1");
  await page.getByRole("button", { name: "Bu ayın sınağı kimi seç" }).click();
  await page.getByRole("button", { name: "Başla" }).click();
  await page.keyboard.press("c");
  await page.waitForTimeout(500);
  await page.getByRole("button", { name: "Sınağı bitir" }).first().click();
  await page.getByRole("button", { name: "Bitir", exact: true }).click();
  await expect(page).toHaveURL(/\/netice$/);

  await page.goto("/statistika");
  const plan = page.locator("section").filter({ has: page.getByRole("heading", { name: "Prioritet plan" }) });
  await expect(plan.getByRole("listitem").first()).toBeVisible();
  await expect(plan).toContainText("Toplu səhifələri:");
  await expect(page.getByRole("img", { name: /Ən çox çıxan mövzu/ })).toContainText("Sənin nəticən");

});