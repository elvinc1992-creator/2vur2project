import AxeBuilder from "@axe-core/playwright";
import { createClient } from "@libsql/client";
import { loadEnvConfig } from "@next/env";
import { hash } from "@node-rs/argon2";
import { expect, test, type Page } from "@playwright/test";
import { bankKeys, topicCodes, wrongOf } from "./daily-fixture";

// Repetitor sualları müəllifin sual bankındandır: ilk mövzu — Loqarifm (69 sual → 2 dərs), sonra Triqonometriya.
const LOQ = "loqarifm-ustlu-tenlik-berabersizlik";
const LOQ_NAME = "Loqarifm, üstlü tənlik/bərabərsizlik";

// Onlayn repetitor (Pro): həftəlik qrafik → mövzular sıra ilə açılır → ✓ → hər 2 mövzudan sonra sınaq.
test.describe.configure({ mode: "serial" });

const stamp = Date.now();
const user = { id: crypto.randomUUID(), email: `e2e+rep${stamp}@example.test`, password: "Rena2026x" };

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
          values (?, ?, ?, 'Rena', ?, 'student', 11, 'both', ?, ?, ?, ?)`,
    args: [user.id, user.email, `e2e_r${stamp % 1e9}`, await hash(user.password), now, now, now, now],
  });
  db.close();
});

/** Bazadakı vəziyyəti dəyişir (testdə günləri gözləməmək üçün). */
async function patchState(fn: (s: Record<string, unknown>) => void) {
  const db = connect();
  const r = await db.execute({ sql: "select data from user_state where user_id = ?", args: [user.id] });
  const s = JSON.parse(String(r.rows[0].data));
  fn(s);
  await db.execute({ sql: "update user_state set data = ? where user_id = ?", args: [JSON.stringify(s), user.id] });
  db.close();
}

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

const pick = (page: Page, letter: string) => page.locator(`label:has(input[aria-label^="Variant ${letter}:"])`).click();

test("Free/Pro → kilid; Premium → qrafik, ilk mövzu, ipucu, cavab, bağlı mövzu", async ({ page }) => {
  await login(page);

  // Pulsuz plan: kilid, bütün mövzular siyahıda
  await page.goto("/onlayn-repetitor");
  await expect(page.getByRole("heading", { level: 1, name: "Onlayn repetitor Premium planı ilə açılır" })).toBeVisible();
  await expect(page.locator("#tutor-topics + ul > li")).toHaveCount(27);
  const html = await (await page.request.get(`/onlayn-repetitor/${LOQ}/1`)).text();
  expect(html).not.toContain("funksiyasının təyin oblastını tapın");

  // Pro repetitoru açmır — yalnız Premium
  await page.goto("/odenis?plan=pro");
  await page.getByRole("button", { name: /ödə/ }).click();
  await page.goto("/onlayn-repetitor");
  await expect(page.getByRole("heading", { level: 1, name: "Onlayn repetitor Premium planı ilə açılır" })).toBeVisible();
  // Mock Premium abunə
  await page.goto("/odenis?plan=premium");
  await page.getByRole("button", { name: /ödə/ }).click();
  await expect(page).toHaveURL(/\/odenis\/ugurlu\?r=/);

  // Qrafik: 2-ci və 4-cü günlər təklif olunur; boş seçim qəbul olunmur
  await page.goto("/onlayn-repetitor");
  await expect(page.getByRole("heading", { name: "Həftəlik qrafikini seç" })).toBeVisible();
  await expect(page.getByRole("checkbox", { name: "Çərşənbə axşamı" })).toBeChecked();
  await expect(page.getByRole("checkbox", { name: "Cümə axşamı" })).toBeChecked();
  await expect(page.getByRole("checkbox", { name: "Bazar ertəsi" })).not.toBeChecked();
  expect(await axe(page)).toEqual([]);
  await page.locator("label", { hasText: "Çərşənbə axşamı" }).click();
  await page.locator("label", { hasText: "Cümə axşamı" }).click();
  await page.getByRole("button", { name: "Qrafiki təsdiqlə" }).click();
  await expect(page.getByText("Ən azı bir gün seç.")).toBeVisible();

  // Hər gün — bu gün ilk mövzu açılır
  for (const d of ["Bazar ertəsi", "Çərşənbə axşamı", "Çərşənbə", "Cümə axşamı", "Cümə", "Şənbə", "Bazar"]) {
    // input sr-only-dir — label-ə klikləyən check()
    await page.getByRole("checkbox", { name: d, exact: true }).check({ force: true });
  }
  await page.getByRole("button", { name: "Qrafiki təsdiqlə" }).first().click();
  await expect(page.getByText(/Dərs günləri: Bazar ertəsi, Çərşənbə axşamı/)).toBeVisible();
  const plan = page.locator("#curriculum + ol");
  await expect(plan.locator("li").nth(0)).toContainText(LOQ_NAME);
  await expect(plan.locator("li").nth(0)).toContainText("Açıqdır");
  await expect(plan.locator("li").nth(1)).toContainText("açılacaq");
  await expect(plan.locator("li").nth(3)).toContainText("Sınaq 1");
  await expect(page.getByRole("heading", { name: "Tezliklə" })).toBeVisible();
  expect(await axe(page)).toEqual([]);

  // Bağlı mövzunun sualı açılmır
  await page.goto("/onlayn-repetitor/triqonometriya/1");
  await expect(page).toHaveURL(/\/onlayn-repetitor\/triqonometriya$/);
  await expect(page.getByText(/tarixində açılacaq/)).toBeVisible();

  // İlk mövzu: nəzəriyyə → praktiki testlər
  await page.goto("/onlayn-repetitor");
  await page.getByRole("link", { name: /Dərsə başla: Loqarifm/ }).first().click();
  await expect(page).toHaveURL(new RegExp(`/onlayn-repetitor/${LOQ}$`));
  await expect(page.getByRole("heading", { name: "Nəzəriyyə" })).toBeVisible();
  await page.getByRole("link", { name: "Dərsə başla" }).click();
  await expect(page).toHaveURL(new RegExp(`/onlayn-repetitor/${LOQ}/1$`));
  const qHtml = await (await page.request.get(`/onlayn-repetitor/${LOQ}/1`)).text();
  expect(qHtml).toContain("funksiyasının təyin oblastını tapın");
  expect(qHtml).not.toContain("Üstlü funksiya hər yerdə təyin olunub");

  // Bankdakı suallarda ipucu yoxdur — düymə göstərilmir. LOQ-0001 düzgün: C.
  await expect(page.getByRole("button", { name: "İpucu" })).toHaveCount(0);
  await pick(page, "C");
  await page.getByRole("button", { name: "Cavabı yoxla" }).click();
  await expect(page.getByText("Düzgündür!")).toBeVisible();
  expect(await axe(page)).toEqual([]);

  await page.getByRole("link", { name: "Növbəti sual" }).click();
  await expect(page).toHaveURL(new RegExp(`/onlayn-repetitor/${LOQ}/2$`));
  // LOQ-0002 düzgün: A — yanlış seçirik
  await pick(page, "B");
  await page.getByRole("button", { name: "Cavabı yoxla" }).click();
  await expect(page.getByText("Yanlışdır. Düzgün cavab: A")).toBeVisible();
});

test("mövzular bitir → ✓, 2 mövzudan sonra 20 suallıq sınaq → nəticə", async ({ page }) => {
  // Qrafik 3 gün əvvəl başlayıb (hər gün) → 4 dərs açıqdır; ilk iki mövzunun (Loqarifm — 2 dərs, Triqonometriya)
  // bütün suallarını cavablanmış edirik.
  const start = new Date(Date.now() - 3 * 86_400_000).toISOString().slice(0, 10);
  const ids = [...(await topicCodes(LOQ)), ...(await topicCodes("triqonometriya"))];
  await patchState((s) => {
    s.tutorPlan = { days: [1, 2, 3, 4, 5, 6, 7], start, offset: 0 };
    s.tutor = Object.fromEntries(ids.map((id, i) => [id, { a: "A", ok: i === 0 }]));
  });
  await login(page);
  await page.goto("/onlayn-repetitor");
  const plan = page.locator("#curriculum + ol");
  for (const i of [0, 1, 2]) await expect(plan.locator("li").nth(i)).toContainText("Bitib");
  await expect(plan.locator("li").nth(3)).toContainText("Sınaq hazırdır");
  // Sualı olan bütün mövzular (müəllifin bankı)
  const topicsWithQuestions = new Set([...(await bankKeys()).values()].map((k) => k.topic)).size;
  await expect(page.getByText(`2 / ${topicsWithQuestions} mövzu bitib`)).toBeVisible();

  await page.getByRole("link", { name: /Sınağa başla: Sınaq 1/ }).first().click();
  await expect(page).toHaveURL(/\/onlayn-repetitor\/sinaq\/1$/);
  await expect(page.locator("form section")).toHaveCount(20);
  const exHtml = await (await page.request.get("/onlayn-repetitor/sinaq/1")).text();
  expect(exHtml).not.toMatch(/"answer":"[A-E]"/);
  expect(await axe(page)).toEqual([]);
  // 1-ci sual düzgün, 2-ci yanlış (cavablar bazadan; sualın kodu section-un id-sindədir); qalanları boş
  const sections = page.locator("form section");
  const codeOf = async (i: number) => (await sections.nth(i).getAttribute("aria-labelledby"))!.replace(/^tq-/, "");
  const keys = await bankKeys([await codeOf(0), await codeOf(1)]);
  await sections.nth(0).locator("label", { hasText: `${keys.get(await codeOf(0))!.answer})` }).click();
  await sections.nth(1).locator("label", { hasText: `${wrongOf(keys.get(await codeOf(1))!.answer)})` }).click();
  await page.getByRole("button", { name: "Sınağı bitir" }).click();
  await expect(page.getByText("Nəticə: 1 / 20")).toBeVisible();
  await expect(page.getByText(/Səhv · düzgün cavab: [A-E]/)).toHaveCount(1);
  await expect(page.getByText(/^Cavab verilməyib/)).toHaveCount(18);

  await page.goto("/onlayn-repetitor");
  await expect(plan.locator("li").nth(3)).toContainText("Nəticə: 1 / 20");
});

test("mobil 390: üfüqi sürüşmə yoxdur, alt menyuda Repetitor var", async ({ page }) => {
  await login(page);
  await page.setViewportSize({ width: 390, height: 844 });
  for (const p of ["/onlayn-repetitor", `/onlayn-repetitor/${LOQ}`, `/onlayn-repetitor/${LOQ}/2`, "/onlayn-repetitor/sinaq/1", "/panel"]) {
    await page.goto(p);
    expect(await page.evaluate(() => document.documentElement.scrollWidth), p).toBeLessThanOrEqual(390);
  }
  await page.goto("/onlayn-repetitor");
  await page.screenshot({ path: "screenshots/repetitor-plan-390.png", fullPage: true });
  await page.setViewportSize({ width: 1280, height: 900 });
  await page.screenshot({ path: "screenshots/repetitor-plan-1280.png", fullPage: true });
  await expect(page.getByRole("navigation", { name: "Tətbiq" }).getByRole("link", { name: "Repetitor" })).toBeVisible();
});
