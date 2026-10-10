import AxeBuilder from "@axe-core/playwright";
import { hash } from "@node-rs/argon2";
import { expect, test, type Page } from "@playwright/test";
import { bankKeys, connect, fixDaily, FIXED_DAILY } from "./daily-fixture";

// Admin paneli (yalnız "admin" rolu) + cavabların loqu: hər cavab user_answers-də bir dəfə.
test.describe.configure({ mode: "serial" });

const stamp = Date.now();
const admin = { id: crypto.randomUUID(), email: `e2e+adm${stamp}@example.test`, password: "Admin2026x" };
const student = { id: crypto.randomUUID(), email: `e2e+std${stamp}@example.test`, password: "Sagird2026x" };
let examId = "";

test.beforeAll(async () => {
  const db = connect();
  const now = Date.now();
  for (const [u, role, tag] of [
    [admin, "admin", "a"],
    [student, "student", "s"],
  ] as const) {
    await db.execute({
      sql: `insert into users (id, email, username, name, password_hash, role, grade, target_exam, email_verified_at, terms_accepted_at, created_at, updated_at)
            values (?, ?, ?, 'Test', ?, ?, 11, 'buraxilis', ?, ?, ?, ?)`,
      args: [u.id, u.email, `e2e_${tag}${stamp % 1e9}`, await hash(u.password), role, now, now, now, now],
    });
  }
  db.close();
  await fixDaily(student.id);
});

test.afterAll(async () => {
  // Testdə yaradılan sınaq və sual qalmasın
  const db = connect();
  if (examId) await db.batch([{ sql: "delete from exam_items where exam_id = ?", args: [examId] }, { sql: "delete from exams where id = ?", args: [examId] }], "write");
  await db.execute("delete from bank_tasks where body like 'E2E sual%'");
  db.close();
});

async function login(page: Page, u: { email: string; password: string }) {
  await page.goto("/daxil-ol");
  await page.getByLabel("E-poçt və ya istifadəçi adı").fill(u.email);
  await page.getByLabel("Şifrə", { exact: true }).fill(u.password);
  await page.getByRole("button", { name: "Daxil ol" }).click();
  await expect(page).toHaveURL(/\/panel$/);
}

async function axe(page: Page) {
  const r = await new AxeBuilder({ page }).withTags(["wcag2a", "wcag2aa", "wcag21a", "wcag21aa", "wcag22aa"]).analyze();
  return r.violations.filter((v) => v.impact === "critical" || v.impact === "serious").map((v) => `${v.id}: ${v.nodes.map((n) => n.target.join(" ")).join(", ")}`);
}

test("şagird: admin panelinə buraxılmır; hər cavab bazada bir dəfə yazılır", async ({ page }) => {
  await login(page, student);
  await page.goto("/admin");
  await expect(page).toHaveURL(/\/panel$/);
  await expect(page.getByRole("link", { name: "Admin paneli →" })).toHaveCount(0);

  // İki günün sualı cavablanır; vəziyyət bir neçə dəfə yazılır — cavablar təkrarlanmamalıdır.
  const [a, b] = FIXED_DAILY[0].ids;
  const keys = await bankKeys([a, b]);
  for (const [n, id] of [
    [1, a],
    [2, b],
  ] as const) {
    await page.goto(`/gunun-suallari/${FIXED_DAILY[0].slug}/${n}`);
    await page.locator(`label:has(input[aria-label^="Variant ${keys.get(id)!.answer}:"])`).click();
    await page.getByRole("button", { name: "Cavabı yoxla" }).click();
    await expect(page.getByText("Düzgündür!")).toBeVisible();
  }
  await page.goto("/panel");
  await page.goto("/zeif-movzular");
  const db = connect();
  const rows = await db.execute({ sql: "select question_ref, count(*) n from user_answers where user_id = ? group by question_ref", args: [student.id] });
  db.close();
  expect(rows.rows.map((r) => [String(r.question_ref), Number(r.n)]).sort()).toEqual([[a, 1], [b, 1]].sort());
});

test("admin: ümumi baxış, istifadəçilər, abunəçilər, qazanc", async ({ page }) => {
  await login(page, admin);
  await page.getByRole("link", { name: "Admin paneli →" }).click();
  await expect(page).toHaveURL(/\/admin$/);
  await expect(page.getByRole("heading", { level: 1, name: "Ümumi baxış" })).toBeVisible();
  await expect(page.getByText("İstifadəçilər").first()).toBeVisible();
  expect(await axe(page)).toEqual([]);
  await page.screenshot({ path: "screenshots/admin-1280.png", fullPage: true });

  await page.getByRole("link", { name: "İstifadəçilər" }).click();
  await page.getByLabel("Axtarış").fill(student.email);
  await page.getByRole("button", { name: "Axtar" }).click();
  await expect(page.getByRole("cell", { name: student.email })).toBeVisible();

  await page.getByRole("link", { name: "Abunəçilər" }).click();
  await expect(page.getByRole("heading", { level: 1, name: "Abunəçilər" })).toBeVisible();
  await page.getByRole("link", { name: "Qazanc" }).click();
  await expect(page.getByRole("heading", { level: 1, name: "Qazanc" })).toBeVisible();
  expect(await axe(page)).toEqual([]);
});

test("admin: sual əlavə et (LaTeX önizləmə) → redaktə → sil", async ({ page }) => {
  await login(page, admin);
  await page.goto("/admin/suallar?movzu=natural-ededler&format=closed");
  await expect(page.getByRole("heading", { level: 1, name: "Suallar" })).toBeVisible();
  await page.getByRole("link", { name: "+ Yeni sual" }).click();
  await page.getByLabel("Sualın mətni").fill("E2E sual: $\\dfrac{1}{2}+\\dfrac{1}{3}$ cəmini tapın.");
  for (const [l, v] of [
    ["A", "$\\dfrac{5}{6}$"],
    ["B", "$\\dfrac{2}{5}$"],
    ["C", "$1$"],
    ["D", "$\\dfrac{1}{6}$"],
    ["E", "$\\dfrac{3}{5}$"],
  ]) {
    await page.getByLabel(`Variant ${l}`, { exact: true }).fill(v);
  }
  await page.getByRole("radio", { name: "A" }).check();
  // Önizləmə KaTeX ilə
  await expect(page.getByRole("region", { name: "Önizləmə" }).locator(".katex").first()).toBeVisible();
  await page.screenshot({ path: "screenshots/admin-sual-1280.png", fullPage: true });
  await page.getByRole("button", { name: "Saxla" }).click();
  await expect(page).toHaveURL(/\/admin\/suallar\/NAT-\d{4}\?saxlanildi=1$/);
  await expect(page.getByText("Yadda saxlanıldı.")).toBeVisible();
  const code = page.url().match(/(NAT-\d{4})/)![1];

  await page.getByLabel("Həll (LaTeX)").fill("$\\dfrac{3}{6}+\\dfrac{2}{6}=\\dfrac{5}{6}$");
  await page.getByRole("button", { name: "Saxla" }).click();
  await expect(page.getByText("Yadda saxlanıldı.")).toBeVisible();
  const db = connect();
  const row = (await db.execute({ sql: "select correct_option, solution from bank_tasks where code = ?", args: [code] })).rows[0];
  db.close();
  expect(row.correct_option).toBe("A");
  expect(String(row.solution)).toContain("dfrac{5}{6}");

  await page.getByRole("button", { name: "Sil" }).click();
  await expect(page).toHaveURL(/\/admin\/suallar\?silindi=1$/);
});

test("admin: 9-cu sinif sınağı yaradılır — quruluşa uyğun 25 sual", async ({ page }) => {
  await login(page, admin);
  await page.goto("/admin/sinaqlar");
  await page.getByLabel("İmtahan növü").selectOption("buraxilis-9");
  await page.getByLabel("Status").selectOption("draft");
  await page.getByRole("button", { name: "+ Yeni sınaq yarat" }).click();
  await expect(page).toHaveURL(/\/admin\/sinaqlar\/b9-\d+\?yaradildi=1$/);
  examId = page.url().match(/(b9-\d+)/)![1];
  await expect(page.getByText("Sınaq yaradıldı.")).toBeVisible();
  const rows = page.getByRole("table", { name: "Sınağın sualları" }).locator("tbody tr");
  await expect(rows).toHaveCount(25);
  await expect(rows.first()).toContainText("61");
  await expect(rows.last()).toContainText("85");

  // Bazada: 15 qapalı, 6 açıq, 4 yazılı; 9-cu sinfə aid olmayan mövzu yoxdur
  const db = connect();
  const f = await db.execute({ sql: "select format, count(*) n from exam_items where exam_id = ? group by format", args: [examId] });
  const bad = await db.execute({
    sql: `select count(*) n from exam_items i join bank_tasks b on b.code = i.task_code join topics t on t.id = b.topic_id
          where i.exam_id = ? and t.exam_types not like '%9%'`,
    args: [examId],
  });
  db.close();
  expect(Object.fromEntries(f.rows.map((r) => [String(r.format), Number(r.n)]))).toEqual({ closed: 15, coded: 6, written: 4 });
  expect(Number(bad.rows[0].n)).toBe(0);
  // Qaralama — şagirdlər görmür
  await page.goto("/sinaqlar");
  await expect(page.getByRole("article").filter({ hasText: examId.replace("b9-", "9-cu sinif buraxılış sınağı №") })).toHaveCount(0);
});
