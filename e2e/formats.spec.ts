import AxeBuilder from "@axe-core/playwright";
import { hash } from "@node-rs/argon2";
import { expect, test, type Page } from "@playwright/test";
import { answerBank, bankKeys, connect, todayBaku } from "./daily-fixture";

// Sual bankının bütün formatları günün suallarında: açıq cavab, uyğunluq və isbat (özünüyoxlama).
test.describe.configure({ mode: "serial" });

const stamp = Date.now();
const user = { id: crypto.randomUUID(), email: `e2e+fmt${stamp}@example.test`, password: "Nigar2026x" };
const ISB = ["ISB-0001", "ISB-0002", "ISB-0003", "ISB-0004", "ISB-0005"];
const NAT = ["NAT-0001", "NAT-0002", "NAT-0003", "NAT-0004", "NAT-0005"];

test.beforeAll(async () => {
  const db = connect();
  const now = Date.now();
  await db.execute({
    sql: `insert into users (id, email, username, name, password_hash, role, grade, target_exam,
            email_verified_at, terms_accepted_at, created_at, updated_at)
          values (?, ?, ?, 'Nigar', ?, 'student', 11, 'both', ?, ?, ?, ?)`,
    args: [user.id, user.email, `e2e_f${stamp % 1e9}`, await hash(user.password), now, now, now, now],
  });
  // Premium (bütün günün sualları açıqdır) və sabit dəst: isbat + natural ədədlər.
  const state = {
    v: 3,
    uid: user.id,
    daily: {},
    purchased: [],
    attempts: {},
    results: {},
    sub: { status: "active", periodEnd: "2099-01-01", tier: "premium" },
    payments: [],
    dailySet: {
      date: todayBaku(),
      topics: [
        { slug: "isbat-meseleleri", ids: ISB },
        { slug: "natural-ededler", ids: NAT },
      ],
    },
  };
  await db.execute({
    sql: "insert into user_state (user_id, data, updated_at) values (?, ?, ?)",
    args: [user.id, JSON.stringify(state), now],
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

async function axe(page: Page) {
  const r = await new AxeBuilder({ page }).withTags(["wcag2a", "wcag2aa", "wcag21a", "wcag21aa", "wcag22aa"]).analyze();
  return r.violations
    .filter((v) => v.impact === "critical" || v.impact === "serious")
    .map((v) => `${v.id} (${v.impact}): ${v.nodes.map((n) => n.target.join(" ")).join(", ")}`);
}

test("isbat: həllə bax → özünü qiymətləndir; qiymətsiz baxış loqa düşmür", async ({ page }) => {
  await login(page);
  await page.goto("/gunun-suallari/isbat-meseleleri/1");
  await expect(page.getByText("İsbat tapşırığı")).toBeVisible();
  await expect(page.getByRole("button", { name: "Bilmirəm, həllə bax" })).toHaveCount(0);
  expect(await axe(page)).toEqual([]);
  await page.getByRole("button", { name: "Həllə bax" }).click();
  await expect(page.getByText("Sənin həllin müəllifin həlli ilə üst-üstə düşdü?")).toBeVisible();
  expect(await axe(page)).toEqual([]);

  // Hələ qiymət verilməyib — cavab loqunda yoxdur
  const db = connect();
  const count = async (ref: string) =>
    Number(
      (await db.execute({ sql: "select count(*) n from user_answers where user_id = ? and question_ref = ?", args: [user.id, ref] })).rows[0].n,
    );
  expect(await count("ISB-0001")).toBe(0);

  await page.getByRole("button", { name: "Bəli, düzgün həll etdim" }).click();
  await expect(page.getByText("Düzgündür!")).toBeVisible();

  // 2-ci: səhv kimi qiymətləndir → Səhvlərim
  await page.goto("/gunun-suallari/isbat-meseleleri/2");
  await page.getByRole("button", { name: "Həllə bax" }).click();
  await page.getByRole("button", { name: "Xeyr, səhv etdim" }).click();
  await expect(page.getByText("Səhv kimi qeyd olundu")).toBeVisible();

  const rows = await db.execute({
    sql: "select question_ref, correct from user_answers where user_id = ? and question_ref like 'ISB-%' order by question_ref",
    args: [user.id],
  });
  db.close();
  expect(rows.rows.map((r) => [String(r.question_ref), Number(r.correct)])).toEqual([
    ["ISB-0001", 1],
    ["ISB-0002", 0],
  ]);

  await page.goto("/sehvlerim");
  await expect(page.getByRole("article").filter({ hasText: "Xeyr, səhv etdim" })).toHaveCount(1);
});

test("açıq cavab: vergüllü/kəsr yazılış; səhv cavab Səhvlərimə düşür", async ({ page }) => {
  await login(page);
  const keys = await bankKeys(NAT.slice(0, 2));
  await page.goto("/gunun-suallari/natural-ededler/1");
  await expect(page.getByLabel("Cavabını yaz")).toBeVisible();
  // Boş cavab göndərilmir
  await expect(page.getByRole("button", { name: "Cavabı yoxla" })).toHaveAttribute("aria-disabled", "true");
  // Tam ədəd "20,0" kimi yazılsa da qəbul olunur
  await page.getByRole("textbox").fill(`${keys.get(NAT[0])!.answer},0`);
  await page.getByRole("button", { name: "Cavabı yoxla" }).click();
  await expect(page.getByText("Düzgündür!")).toBeVisible();
  expect(await axe(page)).toEqual([]);

  await page.goto("/gunun-suallari/natural-ededler/2");
  await answerBank(page, keys.get(NAT[1])!, false);
  await page.getByRole("button", { name: "Cavabı yoxla" }).click();
  await expect(page.getByText(`Yanlışdır. Düzgün cavab: ${keys.get(NAT[1])!.answer}`)).toBeVisible();
  await page.goto("/sehvlerim");
  await expect(page.getByRole("article").filter({ hasText: "987654" })).toHaveCount(1);
});

test("uyğunluq: hər bənd üçün hərflər; səhvdə düzgün uyğunluq göstərilir", async ({ page }) => {
  await login(page);
  const key = (await bankKeys([NAT[4]])).get(NAT[4])!;
  expect(key.format).toBe("matching");
  await page.goto("/gunun-suallari/natural-ededler/5");
  await expect(page.getByText("Uyğunluğu qur")).toBeVisible();
  await expect(page.getByRole("button", { name: "Cavabı yoxla" })).toHaveAttribute("aria-disabled", "true");
  await answerBank(page, key, false);
  await page.getByRole("button", { name: "Cavabı yoxla" }).click();
  await expect(page.getByText(/^Yanlışdır\. Düzgün cavab: 1 → /)).toBeVisible();
  expect(await axe(page)).toEqual([]);
});
