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
  page.locator("dl").first().locator("> div").filter({ has: page.getByText(label, { exact: true }) });

test("qonaq: əsas rəqəmlər view-lardan, reytinq, kilidli plan, metodika", async ({ page }) => {
  await page.goto("/statistika");
  await expect(page.getByRole("heading", { level: 1, name: "İmtahan statistikası" })).toBeVisible();
  await expect(card(page, "Analiz olunmuş sual")).toContainText(/1\s053/);
  await expect(card(page, "İmtahan")).toContainText("41");
  await expect(card(page, "Mövzu")).toContainText("27");
  await expect(card(page, "Toplu ilə uyğunluq")).toContainText("94,7%");

  const chart = page.getByRole("img", { name: /Ən çox çıxan mövzu: Stereometriya, 92 sual, 8,7%/ });
  await expect(chart).toBeVisible();
  await expect(chart.locator("li").first()).toContainText("92 sual · 8,7%");

  // Cədvəl kimi göstər → əsl <table> (caption + th scope)
  await page.getByRole("button", { name: "Cədvəl kimi göstər" }).click();
  const table = page.getByRole("table", { name: "Mövzular üzrə imtahanda çıxan sual sayı" });
  await expect(table).toBeVisible();
  await expect(table.getByRole("rowheader").first()).toContainText("Stereometriya");

  await expect(page.getByText("Prioritet plan abunə ilə açılır")).toBeVisible();
  await page.getByText("Metodika və qeydlər").click();
  await expect(page.getByText("Subyektivlik")).toBeVisible();
  await expect(page.getByText(/EYNİ: sual toplu ilə eynidir/)).toBeVisible();
});

test("süzgəclər URL-də: buraxılış, il, boş nəticə, sıfırla, qəbul qrupu", async ({ page }) => {
  await page.goto("/statistika");
  await page.locator("label").filter({ hasText: "Buraxılış" }).click();
  await expect(page).toHaveURL(/\/statistika\?nov=buraxilis$/);
  await expect(card(page, "Analiz olunmuş sual")).toContainText("75");
  await expect(page.getByRole("heading", { name: "Hər buraxılış imtahanında neçə tapşırıq" })).toBeVisible();

  await page.locator("label").filter({ hasText: "2017" }).click();
  await expect(page).toHaveURL(/nov=buraxilis&il=2017$/);
  await expect(page.getByRole("heading", { name: "Bu seçim üçün məlumat yoxdur" })).toBeVisible();
  await page.getByRole("link", { name: "Süzgəcləri sıfırla" }).first().click();
  await expect(page).toHaveURL(/\/statistika$/);

  // Paylaşıla bilən URL birbaşa açılır
  await page.goto("/statistika?nov=qebul&qrup=II&il=2017");
  await expect(page.getByLabel("Qrup")).toHaveValue("II");
  await expect(page.getByRole("checkbox", { name: "2017" })).toBeChecked();
  await expect(card(page, "Analiz olunmuş sual")).toContainText("99");
});

test("mövzu detalı: illər, bölgü, uyğunluq; pulsuz üçün yalnız 3 istinad (serverdə)", async ({ page }) => {
  await page.goto("/statistika/stereometriya");
  await expect(page.getByRole("heading", { level: 1, name: "Stereometriya" })).toBeVisible();
  await expect(page.getByRole("img", { name: /İllər üzrə sual sayı: 2017 — 34, 2018 — 32, 2023 — 8, 2025 — 18/ })).toBeVisible();
  await expect(page.getByRole("heading", { name: "Uyğunluq dərəcələri" })).toBeVisible();
  const refs = page.getByRole("table", { name: "Toplu istinadları" });
  await expect(refs.locator("tbody tr")).toHaveCount(3);
  await expect(page.getByText("3 / 92 istinad göstərilir")).toBeVisible();
  const html = await (await page.request.get("/statistika/stereometriya")).text();
  // İstinadlar ildən azalan sıra ilə: pulsuz istifadəçiyə yalnız ilk 3 (2025) gedir, 2017-ci il heç HTML-ə düşmür.
  expect(html).toContain("2025");
  expect(html).not.toContain("Qəbul 2017");
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
  await page.goto("/sinaq/1");
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

  // Mövzu detalında bütün istinadlar (Free planda da)
  await page.goto("/statistika/stereometriya");
  await expect(page.getByRole("table", { name: "Toplu istinadları" }).locator("tbody tr")).toHaveCount(92);
});