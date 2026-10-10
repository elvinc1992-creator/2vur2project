import AxeBuilder from "@axe-core/playwright";
import { hash } from "@node-rs/argon2";
import { expect, test, type Page } from "@playwright/test";
import { connect, topicCodes } from "./daily-fixture";

// Zəif mövzular: bal itkisinə görə sıralama, kök səbəb, süzgəc, dinamika, hədəfli məşq → təkrar yoxlama.
test.describe.configure({ mode: "serial" });

const stamp = Date.now();
const user = { id: crypto.randomUUID(), email: `e2e+weak${stamp}@example.test`, password: "Zeyneb2026x" };
const DAY = 86_400_000;

// Mövzu → [düzgün, səhv] (son 20 gündə bərabər paylanmış). Rasional kəsrlərin əsas mövzusu — vuruqlara ayırma.
const PLAN: Array<[string, number, number]> = [
  ["faiz-nisbet-tenasub", 6, 14],
  ["rasional-kesrler", 6, 10],
  ["coxhedlinin-vuruqlara-ayrilmasi", 5, 7],
  ["tam-cebri-ifadeler", 14, 1],
  ["ucbucaqlar", 1, 2], // məlumat azdır
];

test.beforeAll(async () => {
  const db = connect();
  const now = Date.now();
  await db.execute({
    sql: `insert into users (id, email, username, name, password_hash, role, grade, target_exam,
            email_verified_at, terms_accepted_at, created_at, updated_at)
          values (?, ?, ?, 'Zeynəb', ?, 'student', 11, 'buraxilis', ?, ?, ?, ?)`,
    args: [user.id, user.email, `e2e_w${stamp % 1e9}`, await hash(user.password), now, now, now, now],
  });
  const rows = [];
  for (const [slug, ok, bad] of PLAN) {
    const codes = await topicCodes(slug);
    for (let i = 0; i < ok + bad; i++) {
      rows.push({
        sql: `insert into user_answers (user_id, source, question_ref, correct, answered_at, topic_slug, chosen, time_ms, changes, flagged)
              values (?, 'daily', ?, ?, ?, ?, 'A', 60000, ?, 0)`,
        args: [user.id, codes[i % codes.length], i < ok ? 1 : 0, now - (i % 20) * DAY - 3_600_000, slug, i === 0 ? 2 : 0],
      });
    }
  }
  await db.batch(rows, "write");
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

test("hesabat: bal itkisi, sıralama, kök səbəb, süzgəc, dinamika; məlumat bazaya yazılır", async ({ page }) => {
  await login(page);
  await page.getByRole("link", { name: "Zəif mövzular" }).first().click();
  await expect(page).toHaveURL(/\/zeif-movzular$/);
  await expect(page.getByRole("heading", { level: 1, name: /Zəif mövzuların sənə imtahanda ~\d+,\d bal itirdir/ })).toBeVisible();
  await expect(page.getByText("Hesablama: 11-ci sinif buraxılış imtahanı üzrə")).toBeVisible();

  const cards = page.getByRole("article");
  await expect(cards).toHaveCount(5);
  // Bal itkisinə görə azalan; "Məlumat azdır" sonda
  const losses = await cards.locator("b.text-\\[22px\\]").allInnerTexts();
  const values = losses.map((x) => Number(x.replace("−", "").replace(",", ".")));
  expect([...values].sort((a, b) => b - a)).toEqual(values);
  const last = cards.last();
  await expect(last).toContainText("Üçbucaqlar");
  await expect(last).toContainText("2 sual həll et — təhlil üçün məlumat azdır");

  // Kök səbəb: Rasional kəsrlər ← Vuruqlara ayırma
  const rasional = page.getByRole("article", { name: "Rasional kəsrlər" });
  await expect(rasional).toContainText(/Kök səbəb: Çoxhədlinin vuruqlara ayrılması də \d+%-dir/);
  await expect(page.getByRole("article", { name: "Faiz. Nisbət. Tənasüb" })).toContainText("1 təxmini cavab");

  // Süzgəc
  await page.getByRole("button", { name: "Mənimsənib" }).click();
  await expect(cards).toHaveCount(1);
  await expect(cards.first()).toContainText("Tam cəbri ifadələr");
  await page.getByRole("button", { name: "Hamısı" }).click();
  await expect(cards).toHaveCount(5);

  // Dinamika və səhvlər
  await expect(page.getByRole("img", { name: /Son 30 gündə bal itkisi/ })).toBeVisible();
  await expect(page.getByRole("heading", { name: "Ən çox etdiyin səhvlər" })).toBeVisible();
  await expect(page.getByText("Bu material 2vur2.az saytına məxsusdur")).toBeVisible();
  await page.screenshot({ path: "screenshots/zeif-movzular-1280.png", fullPage: true });
  expect(await axe(page)).toEqual([]);

  // Nəticə və tarixçə bazadadır
  const db = connect();
  const stats = await db.execute({ sql: "select count(*) n from user_topic_stats where user_id = ?", args: [user.id] });
  const hist = await db.execute({ sql: "select count(*) n from user_loss_history where user_id = ?", args: [user.id] });
  db.close();
  expect(Number(stats.rows[0].n)).toBe(5);
  // Bərpa olunmuş günlər (məlumat az olan ilk günlər qrafikə düşmür)
  expect(Number(hist.rows[0].n)).toBeGreaterThanOrEqual(10);

  await page.screenshot({ path: "screenshots/zeif-movzular-1280.png", fullPage: true });
  await page.setViewportSize({ width: 360, height: 800 });
  expect(await page.evaluate(() => document.documentElement.scrollWidth)).toBeLessThanOrEqual(360);
  await page.screenshot({ path: "screenshots/zeif-movzular-360.png", fullPage: true });
});

test("hədəfli məşq: dəst yaranır, düzgün cavablar A–E üzrə paylanır, ≥75% → 3 gün sonra təkrar yoxlama", async ({ page }) => {
  await login(page);
  await page.goto("/zeif-movzular");
  const faiz = page.getByRole("article", { name: "Faiz. Nisbət. Tənasüb" });
  await faiz.getByRole("button", { name: /sualla düzəlt/ }).click();
  const dialog = page.getByRole("dialog");
  await expect(dialog).toContainText("mövzu üzrə imtahan tipli suallar");
  await dialog.getByRole("button", { name: "Başla" }).click();
  await expect(page).toHaveURL(/\/zeif-movzular\/mesq\/[\w-]+$/);
  await expect(page.getByRole("heading", { level: 1, name: "Faiz. Nisbət. Tənasüb: hədəfli məşq" })).toBeVisible();

  // Düzgün cavabları bazadan (dəstin xəritəsi ilə) tapıb hamısını düz cavablandırırıq.
  const setId = page.url().split("/").pop()!;
  const db = connect();
  const set = (await db.execute({ sql: "select question_ids from weak_practice_sets where id = ?", args: [setId] })).rows[0];
  const items = JSON.parse(String(set.question_ids)) as Array<{ code: string; map: Record<string, string> }>;
  const keys = await db.execute({
    sql: `select code, correct_option from bank_tasks where code in (${items.map(() => "?").join(",")})`,
    args: items.map((i) => i.code),
  });
  db.close();
  const key = new Map(keys.rows.map((r) => [String(r.code), String(r.correct_option)]));
  const shown = items.map((it) => Object.keys(it.map).find((l) => it.map[l] === key.get(it.code))!);
  expect(new Set(shown).size).toBeGreaterThanOrEqual(Math.min(5, items.length));
  for (const [i, it] of items.entries()) {
    await page.locator(`section[aria-labelledby="wq-${it.code}"] label`, { hasText: `${shown[i]})` }).click();
  }
  await page.getByRole("button", { name: "Bitir" }).click();
  await expect(page.getByText(`Nəticə: ${items.length} / ${items.length}`)).toBeVisible();
  await expect(page.getByText("Əla! 3 gün sonra təkrar yoxlama təyin olundu.")).toBeVisible();

  await page.goto("/zeif-movzular");
  await expect(page.getByRole("article", { name: "Faiz. Nisbət. Tənasüb" })).toContainText("təkrar yoxlama:");

  // Vaxt çatıb (bazada tarixi bu günə çəkirik) → banner → 5 suallıq yoxlama
  const db2 = connect();
  await db2.execute({
    sql: `update user_topic_stats set next_review_at = date('now') where user_id = ? and topic_id = (select id from topics where slug = 'faiz-nisbet-tenasub')`,
    args: [user.id],
  });
  db2.close();
  await page.reload();
  await expect(page.getByRole("heading", { name: "Təkrar yoxlama vaxtıdır" })).toBeVisible();
  await page.getByRole("button", { name: "Yoxlamaya başla" }).click();
  await expect(page.getByRole("heading", { level: 1, name: "Faiz. Nisbət. Tənasüb: təkrar yoxlama" })).toBeVisible();
  await expect(page.locator("form section")).toHaveCount(5);
  expect(await axe(page)).toEqual([]);
});
