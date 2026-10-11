import AxeBuilder from "@axe-core/playwright";
import { hash } from "@node-rs/argon2";
import { expect, test, type Page } from "@playwright/test";
import { answerBank, bankKeys, connect, topicCodes } from "./daily-fixture";

// İctimai hissələr: repetitorun ilk dərsi hamıya (qonaq da) açıqdır; ana səhifədə daxil olmuş istifadəçinin adı,
// Onlayn repetitor və İmtahan qarşılığı bölmələri, Abunəliklər səhifəsi ilə eyni kartlar.
test.describe.configure({ mode: "serial" });

const stamp = Date.now();
const user = { id: crypto.randomUUID(), email: `e2e+pub${stamp}@example.test`, password: "Leyla2026x", name: "Leyla Məmmədova" };

test.beforeAll(async () => {
  const db = connect();
  const now = Date.now();
  await db.execute({
    sql: `insert into users (id, email, username, name, password_hash, role, grade, target_exam,
            email_verified_at, terms_accepted_at, created_at, updated_at)
          values (?, ?, ?, ?, ?, 'student', 11, 'both', ?, ?, ?, ?)`,
    args: [user.id, user.email, `e2e_p${stamp % 1e9}`, user.name, await hash(user.password), now, now, now, now],
  });
  db.close();
});

async function axe(page: Page) {
  const r = await new AxeBuilder({ page }).withTags(["wcag2a", "wcag2aa", "wcag21a", "wcag21aa", "wcag22aa"]).analyze();
  return r.violations
    .filter((v) => v.impact === "critical" || v.impact === "serious")
    .map((v) => `${v.id} (${v.impact}): ${v.nodes.map((n) => n.target.join(" ")).join(", ")}`);
}

test("qonaq: repetitorun ilk dərsi açıqdır (cavab yoxlanılır), qalan dərslər və sınaqlar bağlıdır", async ({ page }) => {
  await page.goto("/onlayn-repetitor");
  await expect(page).toHaveURL(/\/onlayn-repetitor$/);
  await expect(page.getByRole("heading", { name: "İlk dərs hamıya açıqdır" })).toBeVisible();
  expect(await axe(page)).toEqual([]);
  await page.getByRole("link", { name: "Pulsuz dərsə başla" }).click();
  await expect(page).toHaveURL(/\/onlayn-repetitor\/natural-ededler$/);
  await expect(page.getByRole("heading", { name: "Nəzəriyyə" })).toBeVisible();
  await expect(page.getByText(/Qonaq kimi cavabların yadda saxlanılmır/)).toBeVisible();
  await page.getByRole("link", { name: "Dərsə başla" }).click();
  await expect(page).toHaveURL(/\/onlayn-repetitor\/natural-ededler\/1$/);

  const code = (await topicCodes("natural-ededler"))[0];
  await answerBank(page, (await bankKeys([code])).get(code)!, true);
  await page.getByRole("button", { name: "Cavabı yoxla" }).click();
  await expect(page.getByText("Düzgündür!")).toBeVisible();
  await expect(page.getByRole("link", { name: "Növbəti sual" })).toHaveAttribute("href", "/onlayn-repetitor/natural-ededler/2");
  expect(await axe(page)).toEqual([]);

  // İkinci mövzu — abunəsiz bağlıdır; sınaq — girişsiz açılmır
  await page.goto("/onlayn-repetitor/adi-ve-onluq-kesrler");
  await expect(page).toHaveURL(/\/onlayn-repetitor$/);
  await page.goto("/onlayn-repetitor/adi-ve-onluq-kesrler/1");
  await expect(page).toHaveURL(/\/onlayn-repetitor\/adi-ve-onluq-kesrler$|\/onlayn-repetitor$/);
  await page.goto("/onlayn-repetitor/sinaq/1");
  await expect(page).toHaveURL(/\/daxil-ol\?next=/);
});

test("ana səhifə: repetitor və imtahan qarşılığı bölmələri, Premium — ən çox seçilən; daxil olanda ad və soyad", async ({ page }) => {
  await page.goto("/");
  await expect(page.getByRole("heading", { name: "Mövzu-mövzu, öz qrafikinlə" })).toBeVisible();
  await expect(page.getByRole("heading", { name: "İmtahanda düşən sual — bizdə artıq var" })).toBeVisible();
  const premium = page.getByRole("region", { name: "Premium", exact: true });
  await expect(premium).toContainText("Ən çox seçilən");
  await page.getByRole("button", { name: /İllik/ }).click();
  await expect(premium).toContainText("/ il");
  await expect(page.getByText(/Mövzu sınağı — 2 AZN/)).toBeVisible();
  expect(await axe(page)).toEqual([]);

  await page.goto("/daxil-ol");
  await page.getByLabel("E-poçt və ya istifadəçi adı").fill(user.email);
  await page.getByLabel("Şifrə", { exact: true }).fill(user.password);
  await page.getByRole("button", { name: "Daxil ol" }).click();
  await expect(page).toHaveURL(/\/panel$/);
  await page.goto("/");
  await expect(page.getByText(`Salam, ${user.name}!`)).toBeVisible();
  await expect(page.getByRole("link", { name: new RegExp(user.name) })).toBeVisible();
});
