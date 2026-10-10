import { createClient } from "@libsql/client";
import { loadEnvConfig } from "@next/env";
import { hash } from "@node-rs/argon2";
import { expect, test, type Page } from "@playwright/test";
import { FIXED_DAILY, examItem, fixDaily } from "./daily-fixture";

test.describe.configure({ mode: "serial" });

const stamp = Date.now();
const user = { name: "Nigar", email: `e2e+app${stamp}@example.test`, password: "Nigar2026" };
const userId = crypto.randomUUID();

test.beforeAll(async () => {
  // Təsdiqlənmiş test istifadəçisi birbaşa bazaya (qeydiyyat axını auth.spec.ts-də yoxlanılır).
  loadEnvConfig(process.cwd());
  const db = createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });
  const now = Date.now();
  await db.execute({
    sql: `insert into users (id, email, username, name, password_hash, role, grade, target_exam,
            email_verified_at, terms_accepted_at, created_at, updated_at)
          values (?, ?, ?, ?, ?, 'student', 11, 'both', ?, ?, ?, ?)`,
    args: [userId, user.email, `e2e_a${stamp % 1e9}`, user.name, await hash(user.password), now, now, now, now],
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

// Bir dəfə daxil oluruq, sessiya kukisini hər testə veririk (giriş rate limit-inə — 10/15 dəq — ilişməmək üçün).
// Demo vəziyyəti kukisi verilmir — hər test sıfırdan başlayır.
let authCookies: Awaited<ReturnType<import("@playwright/test").BrowserContext["cookies"]>> = [];

test.beforeEach(async ({ page, context }) => {
  // Vəziyyət bazada saxlanılır — hər test sıfırdan başlasın.
  const db = createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });
  await db.batch(
    [
      { sql: "delete from user_state where user_id = ?", args: [userId] },
      { sql: "delete from user_answers where user_id = ?", args: [userId] },
    ],
    "write",
  );
  db.close();
  // Günün sualları təsadüfidir — testdə sabit dəst.
  await fixDaily(userId);
  if (!authCookies.length) {
    await login(page);
    authCookies = (await context.cookies()).filter((c) => c.name.includes("authjs"));
  } else {
    await context.addCookies(authCookies);
    await page.goto("/panel");
    await expect(page).toHaveURL(/\/panel$/);
  }
});

/** Variantı seç (input sr-only, ona görə label-ə klikləyirik). */
const pick = (page: Page, letter: string) => page.locator(`label:has(input[aria-label^="Variant ${letter}:"])`).click();
const variant = (page: Page, letter: string) => page.locator(`input[aria-label^="Variant ${letter}:"]`);

async function buyAndStart(page: Page, id: string) {
  await page.goto(`/odenis?exam=${id}`);
  await page.getByRole("button", { name: /ödə/ }).click();
  await expect(page).toHaveURL(/\/odenis\/ugurlu\?r=/);
  await page.getByRole("button", { name: "Sınağa başla" }).click();
  await expect(page).toHaveURL(new RegExp(`/sinaq/${id}$`));
}

/** Mock ödəniş: Pro plan (yeni istifadəçi Free planda başlayır). */
async function subscribe(page: Page) {
  await page.goto("/odenis");
  await page.getByRole("button", { name: /ödə/ }).click();
  await expect(page).toHaveURL(/\/odenis\/ugurlu\?r=/);
}

async function finishExam(page: Page, id: string) {
  await page.getByRole("button", { name: "Cavab vərəqi" }).first().click();
  await page.getByRole("button", { name: "Sınağı bitir" }).last().click();
  await page.getByRole("button", { name: "Bitir", exact: true }).click();
  await expect(page).toHaveURL(new RegExp(`/sinaq/${id}/netice$`));
}

const DAILY_TOPICS = FIXED_DAILY.map((x) => x.name);
const esc = (s: string) => s.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");

test("panel: sıfırdan başlayır, Free plan — günün hər mövzusundan 2 sual", async ({ page }) => {
  await expect(page.getByRole("heading", { name: "Salam, Nigar!" })).toBeVisible();
  await expect(page.getByText("Free plan").first()).toBeVisible();
  await expect(page.getByText("0 / 20")).toBeVisible();
  await expect(page.getByText("Free planda bu gün 8 sual açıqdır, daha 12 sual Pro planı ilə açılır.")).toBeVisible();
  await expect(page.getByText("Günün sualları Pro planı ilə tam açılır")).toBeVisible();
  for (const topic of DAILY_TOPICS) {
    await expect(page.getByRole("link", { name: new RegExp(`${esc(topic)}.*2 açıq · 3 kilidli`) })).toBeVisible();
  }
  await expect(page.getByText("0 gün ardıcıl")).toBeVisible();
  await expect(page.getByText("0 tamamlanıb · 0 yarımçıq")).toBeVisible();
  await expect(page.getByText("Yeni: 9-cu №1, 9-cu №2, 9-cu №3, 9-cu №4")).toBeVisible();
  await expect(page.getByRole("link", { name: "Əsas", exact: true }).first()).toHaveAttribute("aria-current", "page");
});

test("günün sualı: düzgün və yanlış cavab, proqres artır", async ({ page }) => {
  await page.getByRole("link", { name: /Triqonometriya/ }).first().click();
  await expect(page).toHaveURL(/\/gunun-suallari\/triqonometriya\/1$/);
  await expect(page.getByRole("heading", { name: "Günün sualı: Triqonometriya, 1 / 5" })).toBeAttached();

  // Cavab seçilməyib — yoxla düyməsi deaktivdir.
  await expect(page.getByRole("button", { name: "Cavabı yoxla" })).toHaveAttribute("aria-disabled", "true");
  // TRQ-0001 düzgün: C
  await pick(page, "C");
  await page.getByRole("button", { name: "Cavabı yoxla" }).click();
  await expect(page.getByText("Düzgündür!")).toBeVisible();
  await expect(page.getByText("Bu tipdə düzgün cavabların: 1 / 1.")).toBeVisible();
  await expect(page.getByText("Qısa həll")).toBeVisible();

  // Free plan: 2-ci sual da açıqdır
  await page.getByRole("link", { name: "Növbəti sual" }).click();
  await expect(page).toHaveURL(/\/gunun-suallari\/triqonometriya\/2$/);
  // TRQ-0002 düzgün: B — yanlış seçirik
  await pick(page, "A");
  await page.getByRole("button", { name: "Cavabı yoxla" }).click();
  await expect(page.getByText("Yanlışdır. Düzgün cavab: B")).toBeVisible();
  // 3-cü sual kilidlidir → növbəti başqa mövzunun açıq sualı
  await page.getByRole("link", { name: "Növbəti sual" }).click();
  await expect(page).toHaveURL(/\/gunun-suallari\/loqarifm-ustlu-tenlik-berabersizlik\/1$/);

  await page.goto("/panel");
  await expect(page.getByText("2 / 20")).toBeVisible();
  await expect(page.getByText("1 gün ardıcıl")).toBeVisible();
});

test("Free plan: kilidli sualın mətni və variantları serverdən gəlmir, Pro hamısını açır", async ({ page }) => {
  // İcmal: 4 mövzu, hər birində 5 sual — 2 açıq, 3 kilidli
  await page.goto("/gunun-suallari");
  await expect(page.getByRole("heading", { level: 1, name: "Günün sualları" })).toBeVisible();
  await expect(page.getByText("Free planda hər mövzudan 2 sual açıqdır. Qalan 12 sual Pro planı ilə açılır.")).toBeVisible();
  for (const topic of DAILY_TOPICS) {
    const pager = page.getByRole("navigation", { name: `${topic}: suallar` });
    await expect(pager.getByRole("link")).toHaveCount(5);
    await expect(pager.getByRole("link", { name: /kilidli/ })).toHaveCount(3);
    await expect(pager.getByRole("link", { name: "Sual 1, açıq" })).toBeVisible();
  }

  // Kilidli sual: paywall, variant yoxdur, mətn HTML-də yoxdur
  await page.getByRole("navigation", { name: "Faiz. Nisbət. Tənasüb: suallar" }).getByRole("link", { name: /^Sual 3,/ }).click();
  await expect(page).toHaveURL(/\/gunun-suallari\/faiz-nisbet-tenasub\/3$/);
  await expect(page.getByRole("heading", { name: "Bu sual Pro planı ilə açılır", exact: true })).toBeVisible();
  await expect(page.getByRole("radio")).toHaveCount(0);
  await expect(page.getByRole("link", { name: "Pro planına keç" })).toHaveAttribute("href", "/odenis?plan=pro");
  const locked = await (await page.request.get("/gunun-suallari/faiz-nisbet-tenasub/3")).text();
  expect(locked).not.toContain("Tənasübün kənar hədləri");
  expect(locked).not.toContain("səh.20 №2");

  // Pro → bütün 20 sual açıqdır
  await subscribe(page);
  await page.goto("/gunun-suallari");
  await expect(page.getByText("Bu gün sual bankından təsadüfi 4 mövzu üzrə 20 sual. Sabah yeni mövzular gələcək.")).toBeVisible();
  await expect(page.getByRole("link", { name: /kilidli/ })).toHaveCount(0);
  await page.goto("/gunun-suallari/faiz-nisbet-tenasub/3");
  await expect(page.getByText(/Tənasübün kənar hədləri/)).toBeVisible();
  await expect(page.getByRole("radio")).toHaveCount(5);
});

test("günün sualı: cavab açarı HTML-də yoxdur", async ({ page }) => {
  const html = await (await page.request.get("/gunun-suallari/ucbucaqlar/1")).text();
  expect(html).toContain("üçbucağın üçüncü tərəfinin ən böyük tam qiymətini");
  expect(html).not.toContain("Üçbucaq bərabərsizliyinə görə");
  expect(html).not.toMatch(/"answer":"[A-E]"/);
});
test("kodlaşdırılan cavab: icazəsiz simvol daxil edilmir, xəta göstərilir", async ({ page }) => {
  await buyAndStart(page, "b11-3");
  await page.getByRole("button", { name: /^Sual 15,/ }).click();
  const input = page.getByLabel("Cavab, rəqəmlərlə");
  await input.pressSequentially("14");
  await input.press("a");
  await expect(input).toHaveValue("14");
  await expect(page.getByRole("alert").filter({ hasText: "Yalnız rəqəm" })).toBeVisible();
  await expect(input).toHaveAttribute("aria-invalid", "true");
  await input.press("Backspace");
  await expect(input).toHaveValue("1");
});

test("sınaq yalnız klaviatura ilə: variant → növbəti → vərəq → bitir dialoqu", async ({ page }) => {
  await buyAndStart(page, "b11-4");
  // A–E qısayolu (fokus mətn sahəsində deyil)
  await page.keyboard.press("c");
  await expect(variant(page, "C")).toBeChecked();
  // Ox düyməsi ilə dəyiş
  await page.keyboard.press("ArrowDown");
  await expect(variant(page, "D")).toBeChecked();
  // Tab ilə "Növbəti"-yə çat və Enter
  for (let i = 0; i < 20; i++) {
    await page.keyboard.press("Tab");
    if (await page.evaluate(() => document.activeElement?.textContent?.trim() === "Növbəti")) break;
  }
  await page.keyboard.press("Enter");
  await expect(page.getByText("Sual 2 / 25")).toBeVisible();
  // "Sınağı bitir" (yuxarıda) → dialoq → Esc → fokus düyməyə qayıdır
  const topFinish = page.getByRole("button", { name: "Sınağı bitir" }).first();
  await topFinish.focus();
  await page.keyboard.press("Enter");
  await expect(page.getByRole("dialog")).toBeVisible();
  await expect(page.getByText("24 sual boşdur, 0 sual işarələnib.", { exact: false })).toBeVisible();
  await page.keyboard.press("Escape");
  await expect(page.getByRole("dialog")).toBeHidden();
  await expect(topFinish).toBeFocused();
  // Yenidən aç və klaviatura ilə "Bitir"
  await page.keyboard.press("Enter");
  await expect(page.getByRole("dialog")).toBeVisible();
  for (let i = 0; i < 5; i++) {
    if (await page.evaluate(() => document.activeElement?.textContent?.trim() === "Bitir")) break;
    await page.keyboard.press("Tab");
  }
  await page.keyboard.press("Enter");
  await expect(page).toHaveURL(/\/sinaq\/b11-4\/netice$/);
});

test("cavabı silmək: sınaqda, cavab vərəqində, kodlaşdırılanda, günün sualında", async ({ page }) => {
  await buyAndStart(page, "b11-1");
  const cell1 = page.getByRole("button", { name: /^Sual 1,/ });

  // Seç → "Cavabı sil" → sual yenidən boşdur (serverdə də)
  await pick(page, "C");
  await expect(cell1).toHaveAccessibleName("Sual 1, cavablanıb");
  await page.getByRole("button", { name: "Cavabı sil" }).click();
  await expect(variant(page, "C")).not.toBeChecked();
  await expect(cell1).toHaveAccessibleName("Sual 1, boş");
  // Sorğular növbə ilə bazaya yazılır — hamısı bitənə qədər gözləyirik.
  await page.waitForLoadState("networkidle");
  await page.reload();
  await expect(page.getByRole("button", { name: /^Sual 1,/ })).toHaveAccessibleName("Sual 1, boş");

  // Delete klavişi ilə
  await pick(page, "B");
  await variant(page, "B").focus();
  await page.keyboard.press("Delete");
  await expect(variant(page, "B")).not.toBeChecked();

  // Kodlaşdırılan: "Cavabı sil" xananı təmizləyir
  await page.getByRole("button", { name: /^Sual 14,/ }).click();
  await page.getByLabel("Cavab, rəqəmlərlə").fill("42");
  await page.getByRole("button", { name: "Cavabı sil" }).click();
  await expect(page.getByLabel("Cavab, rəqəmlərlə")).toHaveValue("");
  await expect(page.getByRole("button", { name: /^Sual 14,/ })).toHaveAccessibleName("Sual 14, boş");

  // Cavab vərəqi: seçilmiş dairəyə yenidən basmaq cavabı silir
  await page.getByRole("button", { name: "Cavab vərəqi" }).first().click();
  const row = page.getByRole("radiogroup", { name: "Sual 2" });
  await row.getByRole("radio", { name: "A", exact: true }).click();
  await expect(row.getByRole("radio", { name: /^A, seçilib/ })).toHaveAttribute("aria-checked", "true");
  await row.getByRole("radio", { name: /^A, seçilib/ }).click();
  await expect(row.getByRole("radio", { name: "A", exact: true })).toHaveAttribute("aria-checked", "false");
  await expect(page.getByText("0 / 25 cavablanıb")).toBeVisible();

  // Günün sualı: yoxlamadan əvvəl seçimi silmək olar
  await page.goto("/gunun-suallari/faiz-nisbet-tenasub/1");
  await pick(page, "B");
  await page.getByRole("button", { name: "Seçimi sil" }).click();
  await expect(variant(page, "B")).not.toBeChecked();
  await expect(page.getByRole("button", { name: "Cavabı yoxla" })).toHaveAttribute("aria-disabled", "true");
});

/** İstifadəçi vəziyyətini bazada birbaşa qurur — 90 dəqiqə gözləmədən vaxtın bitməsini yoxlamaq üçün. */
async function setDemo(attempt: Record<string, unknown>) {
  // 1-ci sualın düzgün cavabı bazadan
  const first = await examItem("b11-1", 1);
  const state = {
    v: 3,
    uid: userId,
    daily: {},
    purchased: ["b11-1"],
    attempts: { "b11-1": { answers: { "1": first.answer }, flags: [], ...attempt } },
    results: {},
    sub: { status: "active", periodEnd: "2099-01-01" },
    payments: [],
  };
  const db = createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });
  await db.execute({
    sql: `insert into user_state (user_id, data, updated_at) values (?, ?, ?)
          on conflict(user_id) do update set data = excluded.data, updated_at = excluded.updated_at`,
    args: [userId, JSON.stringify(state), Date.now()],
  });
  db.close();
}

const toSec = (t: string) => t.split(":").reduce((s, x) => s * 60 + Number(x), 0);

test("sayğac: sınaq səhifəsindən çıxanda vaxt dayanır, qayıdanda davam edir", async ({ page }) => {
  await buyAndStart(page, "b11-1");
  const timer = page.getByRole("timer");
  await expect(timer).toContainText(/^1:(30:00|29:\d\d)$/);
  await page.waitForTimeout(1500);
  const before = toSec((await timer.textContent())!);

  await page.goto("/panel");
  await expect(page.getByText(/dəq qalıb · fasilədə/)).toBeVisible();
  await page.waitForTimeout(8000); // fasilə: bu vaxt sayılmamalıdır
  await page.goto("/sinaqlar");
  await expect(page.getByText(/Fasilədə · \d+ dəq qalıb/)).toBeVisible();

  await page.goto("/sinaq/b11-1");
  await page.waitForTimeout(1000);
  const after = toSec((await timer.textContent())!);
  // Fasilə (8 s) + keçidlər sayılsaydı, fərq ≥ 10 s olardı; yalnız açıq qalan anlar (≈ 2–4 s) sayılır.
  expect(before - after).toBeLessThan(6);
});

test("sayğac: vaxt səhifədə bitəndə sınaq avtomatik bitir və bağlanır", async ({ page }) => {
  await setDemo({ startedAt: Date.now() - 100_000, elapsedMs: 90 * 60_000 - 3_000, lastSeenAt: null });
  await page.goto("/sinaq/b11-1");
  await expect(page.getByRole("heading", { name: "Sınaq vaxtı bitdi" })).toBeVisible({ timeout: 15_000 });
  await expect(page.getByText("Cavabladığın 1 sual avtomatik göndərildi.")).toBeVisible();
  // Bağlanıb: yenidən açanda sual yox, nəticəyə yönləndirir
  await page.goto("/sinaq/b11-1");
  await expect(page).toHaveURL(/\/sinaq\/b11-1\/netice$/);
  await expect(page.getByText(/Vaxt bitdiyi üçün sınaq avtomatik göndərildi/)).toBeVisible();
  await page.goto("/sinaqlar");
  await expect(page.getByText("Bal: 4")).toBeVisible();
});

test("sayğac: vaxtı bitmiş sınaq aktiv deyil — davam etmək olmur", async ({ page }) => {
  await setDemo({ startedAt: Date.now() - 200_000, elapsedMs: 90 * 60_000, lastSeenAt: null });
  await page.goto("/panel");
  await expect(page.getByText("Sınaq · yarımçıq")).toHaveCount(0);
  await page.goto("/sinaqlar");
  const card = page.getByRole("article").filter({ hasText: "11-ci sinif buraxılış sınağı №1" });
  await expect(card.getByText("Vaxt bitib")).toBeVisible();
  await expect(card.getByRole("link", { name: /Davam et/ })).toHaveCount(0);
  await card.getByRole("link", { name: "Nəticəyə bax" }).click();
  await expect(page.getByRole("heading", { name: "Sınaq vaxtı bitdi" })).toBeVisible();
  await expect(page.getByRole("radio")).toHaveCount(0); // sual interfeysi yoxdur
  await page.getByRole("link", { name: "Nəticəyə bax" }).click();
  await expect(page).toHaveURL(/\/sinaq\/b11-1\/netice$/);
});

test("sınaq: Free — ayın sınağını seç → başla → cavabla → yenilə → bitir → nəticə; açar sızmır", async ({ page }) => {
  // 3 imtahan növü × 4 sınaq; 11-ci sinif süzgəci — 4 sınaq
  await page.goto("/sinaqlar");
  await expect(page.getByRole("article")).toHaveCount(12);
  await page.getByRole("link", { name: "11-ci sinif buraxılış" }).click();
  await expect(page).toHaveURL(/\/sinaqlar\?tip=11$/);
  await expect(page.getByRole("article")).toHaveCount(4);
  await expect(page.getByText("Bu ay 1 pulsuz sınaq seçə bilərsən.")).toBeVisible();
  await expect(page.getByRole("button", { name: "Bu ayın sınağı kimi seç" })).toHaveCount(4);
  await page.getByRole("button", { name: "Bu ayın sınağı kimi seç" }).first().click();
  await expect(page).toHaveURL(/\/sinaq\/b11-1$/);
  await page.getByRole("button", { name: "Başla" }).click();
  await expect(page).toHaveURL(/\/sinaq\/b11-1$/);

  // Sayğac server vaxtından: 90 dəqiqə
  await expect(page.getByRole("timer")).toContainText(/^1:(30:00|29:\d\d)$/);
  // Cavab açarı səhifədə yoxdur
  const [q1, q14] = [await examItem("b11-1", 1), await examItem("b11-1", 14)];
  const html = await (await page.request.get("/sinaq/b11-1")).text();
  expect(html).toContain(`data-qid="${q1.code}"`);
  if (q1.solution.length > 20) expect(html).not.toContain(q1.solution.slice(0, 40));
  expect(q14.format).toBe("coded");

  await expect(page.getByText("Sual 1 / 25")).toBeVisible();
  await pick(page, q1.answer);
  await page.getByRole("button", { name: "Növbəti" }).click();
  await expect(page.getByText("Sual 2 / 25")).toBeVisible();

  await page.getByRole("button", { name: /^Sual 14,/ }).click();
  await page.getByLabel("Cavab, rəqəmlərlə").fill(q14.answer.replace(".", ","));
  await page.getByRole("button", { name: /^Sual 19,/ }).click();
  await page.getByLabel("Həllini yaz").fill("x · 1,21 = 242, x = 200");
  await page.waitForTimeout(800); // debounce → autosave

  await expect(page.getByText("Yadda saxlanıldı ✓")).toBeVisible();
  // Yenilədikdən sonra cavablar serverdə saxlanıb.
  await page.reload();
  await page.getByRole("button", { name: /^Sual 14,/ }).click();
  await expect(page.getByLabel("Cavab, rəqəmlərlə")).toHaveValue(q14.answer.replace(".", ","));

  await page.getByRole("button", { name: "Cavab vərəqi" }).first().click();
  await expect(page.getByText("3 / 25 cavablanıb")).toBeVisible();
  await expect(page.getByText("Yazılıb")).toBeVisible();
  await page.screenshot({ path: "screenshots/cavab-karti-1280.png", fullPage: true });
  await page.setViewportSize({ width: 390, height: 900 });
  expect(await page.evaluate(() => document.documentElement.scrollWidth)).toBeLessThanOrEqual(390);
  await page.screenshot({ path: "screenshots/cavab-karti-390.png", fullPage: true });
  await page.setViewportSize({ width: 1280, height: 900 });
  await page.getByRole("button", { name: "Sınağı bitir" }).last().click();
  await expect(page.getByRole("heading", { name: "Sınağı bitirək?" })).toBeVisible();
  await expect(page.getByText("22 sual boşdur, 0 sual işarələnib. Sınağı bitirmək istəyirsiniz?")).toBeVisible();
  await page.getByRole("button", { name: "Bitir", exact: true }).click();

  await expect(page).toHaveURL(/\/sinaq\/b11-1\/netice$/);
  await expect(page.getByText("2 düzgün")).toBeVisible();
  await expect(page.getByText("1 yoxlanılır")).toBeVisible();
  await expect(page.getByText(/İlkin bal/)).toBeVisible();
  await expect(page.getByRole("heading", { name: "Həll izahları" })).toBeVisible();

  await page.goto("/sinaqlar?tip=11");
  await expect(page.getByText("Bal: 8")).toBeVisible();
  // Ayın kvotası istifadə olunub — qalanları yalnız alına bilər (3 AZN)
  await expect(page.getByText(/Bu ayın sınağını seçmisən/)).toBeVisible();
  await expect(page.getByRole("link", { name: "Satın al · 3 AZN" })).toHaveCount(3);
  await page.goto("/panel");
  await expect(page.getByText("1 tamamlanıb · 0 yarımçıq")).toBeVisible();
});

test("abunəni ləğv et və bərpa et", async ({ page }) => {
  await page.goto("/profil");
  await expect(page.getByText("Hələ ödəniş yoxdur.")).toBeVisible();
  await page.getByRole("link", { name: "Pro · 6.90 AZN / ay" }).click();
  await expect(page).toHaveURL(/\/odenis\?plan=pro$/);
  await subscribe(page);
  await page.goto("/profil");
  await expect(page.getByText("Nigar").first()).toBeVisible();
  await page.getByRole("button", { name: "Abunəni ləğv et" }).click();
  await expect(page.getByRole("heading", { name: "Abunəni ləğv edək?" })).toBeVisible();
  await page.getByRole("button", { name: "Bəli, ləğv et" }).click();
  await expect(page).toHaveURL(/\/profil\/abune-legv-edildi$/);
  await expect(page.getByRole("heading", { name: "Abunə ləğv edildi" })).toBeVisible();

  await expect(page.getByText(/Free plana keçdin/)).toBeVisible();

  // Ləğvdən dərhal sonra — Free plan (abunəliklərdə də, paneldə də)
  await page.goto("/abunelikler");
  await expect(page.getByRole("region", { name: "Free" }).getByText("Cari plan")).toBeVisible();
  await expect(page.getByRole("region", { name: "Pro" }).getByText("Cari plan")).toHaveCount(0);
  await expect(page.getByRole("link", { name: "Pro-ya keç" })).toBeVisible();
  await page.goto("/panel");
  await expect(page.getByText("Free plan").first()).toBeVisible();
  await page.goto("/profil");
  await expect(page.getByRole("button", { name: "Abunəni ləğv et" })).toHaveCount(0);

  await page.goto("/profil/abune-legv-edildi");
  await page.getByRole("button", { name: "Fikrimi dəyişdim — bərpa et" }).click();
  await expect(page).toHaveURL(/\/profil$/);
  await expect(page.getByText("Aktiv", { exact: true })).toBeVisible();
});

test("abunəliklər: menyuda; Free — Pro/Premium təklifi, Pro — yalnız idarə", async ({ page }) => {
  await page.getByRole("link", { name: "Abunəliklər" }).first().click();
  await expect(page).toHaveURL(/\/abunelikler$/);
  await expect(page.getByRole("heading", { level: 1, name: "Hədəfinə uyğun planı seç" })).toBeVisible();
  const free = page.getByRole("region", { name: "Free" });
  await expect(free.getByText("Cari plan")).toBeVisible();
  const pro = page.getByRole("region", { name: "Pro" });
  const premium = page.getByRole("region", { name: "Premium" });
  await expect(premium.getByText("Ən çox seçilən")).toBeVisible();
  await expect(pro.getByText("Ən çox seçilən")).toHaveCount(0);

  // Kartlar ilk ekranda tam görünür (scroll lazım deyil) — 1366×768 noutbuk
  await page.setViewportSize({ width: 1366, height: 768 });
  for (const card of [free, pro, premium]) {
    const box = (await card.boundingBox())!;
    expect(box.y + box.height).toBeLessThanOrEqual(768);
  }
  await page.setViewportSize({ width: 1280, height: 900 });

  // Aylıq (default): endirimli qiymətlər, köhnə qiymət üstündən xətlə
  await expect(page.getByRole("button", { name: "Aylıq" })).toHaveAttribute("aria-pressed", "true");
  await expect(pro).toContainText("6.90 AZN / ay");
  await expect(premium).toContainText("12.90 AZN / ay");
  await expect(pro.locator("s")).toHaveText(/11\.90 AZN \/ ay/);
  await expect(pro).toContainText("−42% endirim");
  await expect(premium.locator("s")).toHaveText(/21\.90 AZN \/ ay/);
  await expect(premium).toContainText("−41% endirim");
  await expect(page.getByRole("link", { name: "Pro-ya keç · aylıq" })).toHaveAttribute("href", "/odenis?plan=pro&period=month");
  await expect(page.getByRole("link", { name: "Premium-a keç · aylıq" })).toHaveAttribute("href", "/odenis?plan=premium&period=month");
  // Desktop-da Pro və Premium düymələri bir xətdə
  await page.setViewportSize({ width: 1280, height: 900 });
  const proBtn = await page.getByRole("link", { name: "Pro-ya keç · aylıq" }).boundingBox();
  const premBtn = await page.getByRole("link", { name: "Premium-a keç · aylıq" }).boundingBox();
  expect(Math.abs(proBtn!.y - premBtn!.y)).toBeLessThan(2);
  await page.screenshot({ path: "screenshots/abunelikler-1280.png", fullPage: true });

  // İllik: 49.90 / 89.90 AZN, 12 ay, qənaət
  await page.getByRole("button", { name: /İllik/ }).click();
  await expect(page.getByRole("button", { name: /İllik/ })).toHaveAttribute("aria-pressed", "true");
  await expect(pro).toContainText("49.90 AZN / il");
  await expect(pro).toContainText("illik — 40% qənaət");
  await expect(premium).toContainText("89.90 AZN / il");
  await expect(page.getByRole("link", { name: "Pro-ya keç · illik" })).toHaveAttribute("href", "/odenis?plan=pro&period=year");
  await page.screenshot({ path: "screenshots/abunelikler-illik-1280.png", fullPage: true });

  // Müqayisə cədvəli
  const table = page.getByRole("table", { name: "Planlar üzrə imkanlar" });
  await expect(table.getByRole("rowheader", { name: "Onlayn repetitor" })).toBeVisible();
  await expect(page.getByText("Plandan əlavə tək sınaq almaq da olar — 3 AZN.")).toBeVisible();
  await page.setViewportSize({ width: 390, height: 900 });
  expect(await page.evaluate(() => document.documentElement.scrollWidth)).toBeLessThanOrEqual(390);
  await page.setViewportSize({ width: 1280, height: 900 });
  await subscribe(page);
  await page.goto("/abunelikler");
  await expect(page.getByRole("region", { name: "Pro" }).getByText("Cari plan")).toBeVisible();
  await expect(page.getByRole("link", { name: "Abunəni idarə et" })).toHaveAttribute("href", "/profil");
  // Pro → Premium-a keçmək olar (Pro kartında keçid yoxdur)
  // Cari (aylıq) Pro kartında başqa plana keçid yoxdur, yalnız "İllik paketə keç"
  const proCard = page.getByRole("region", { name: "Pro" });
  await expect(proCard.getByRole("link", { name: /· aylıq|İllik al/ })).toHaveCount(0);
  await expect(proCard.getByRole("link", { name: "İllik paketə keç · 49.90 AZN" })).toBeVisible();
  await page.getByRole("link", { name: "Premium-a keç · aylıq" }).click();
  await expect(page).toHaveURL(/\/odenis\?plan=premium&period=month$/);
  await page.getByRole("button", { name: /ödə/ }).click();
  await expect(page).toHaveURL(/\/odenis\/ugurlu/);
  await page.goto("/abunelikler");
  await expect(page.getByRole("region", { name: "Premium" }).getByText("Cari plan")).toBeVisible();
  // Aylıq Premium → illik Premium
  await expect(premium.getByRole("link", { name: "İllik paketə keç · 89.90 AZN" })).toHaveAttribute(
    "href",
    "/odenis?plan=premium&period=year",
  );
  // ...və əksinə: Premium → Pro
  await expect(page.getByRole("link", { name: "Pro-ya keç · aylıq" })).toHaveAttribute("href", "/odenis?plan=pro&period=month");
  // Profildə plan dəyişmə yoxdur — yalnız ləğv
  await page.goto("/profil");
  await expect(page.getByRole("button", { name: "Abunəni ləğv et" })).toBeVisible();
  await expect(page.getByRole("link", { name: /keç/ })).toHaveCount(0);
});
test("illik abunə: 49.90 AZN, 12 ay aktiv; profil və qəbzdə illik", async ({ page }) => {
  await page.goto("/odenis?plan=pro&period=year");
  await expect(page.getByRole("link", { name: "İllik · −40%" })).toHaveAttribute("aria-current", "true");
  await expect(page.getByText("12 ay aktivdir, hər il avtomatik yenilənir")).toBeVisible();
  await expect(page.getByText("Abunənin hər il avtomatik yenilənməsi ilə razıyam.")).toBeVisible();
  await page.getByRole("button", { name: "49.90 AZN ödə" }).click();
  await expect(page).toHaveURL(/\/odenis\/ugurlu\?r=/);

  // Qəbz: müddət — bu gündən gələn ilin eyni tarixinə qədər
  const today = new Date().toISOString().slice(0, 10);
  const [y, m, d] = today.split("-");
  const end = `${d}.${m}.${Number(y) + 1}`;
  await expect(page.getByText("Pro · illik abunə")).toBeVisible();
  await expect(page.getByText(`${d}.${m}.${y} – ${end}`)).toBeVisible();

  await page.goto("/profil");
  await expect(page.getByText("Pro · illik abunə").first()).toBeVisible();
  await expect(page.getByText("49.90 AZN / il")).toBeVisible();
  await page.goto("/abunelikler");
  await expect(page.getByRole("region", { name: "Pro" })).toContainText("İllik abunə (12 ay)");
  // İllik abunədə "illik paketə keç" yoxdur
  await expect(page.getByRole("link", { name: /İllik paketə keç/ })).toHaveCount(0);
});

test("aylıq → illik: eyni plan illiyə keçir, qalan günlər itmir", async ({ page }) => {
  await subscribe(page); // Pro, aylıq: bu gün + 30 gün
  await page.goto("/abunelikler");
  await page.getByRole("region", { name: "Pro" }).getByRole("link", { name: "İllik paketə keç · 49.90 AZN" }).click();
  await expect(page).toHaveURL(/\/odenis\?plan=pro&period=year$/);
  await page.getByRole("button", { name: "49.90 AZN ödə" }).click();
  await expect(page).toHaveURL(/\/odenis\/ugurlu/);
  await page.goto("/abunelikler");
  const pro = page.getByRole("region", { name: "Pro" });
  await expect(pro).toContainText("İllik abunə (12 ay)");
  // Növbəti ödəniş: (bu gün + 30 gün) + 12 ay + 1 gün
  const end = new Date();
  end.setUTCDate(end.getUTCDate() + 30);
  end.setUTCFullYear(end.getUTCFullYear() + 1);
  end.setUTCDate(end.getUTCDate() + 1);
  const [y, m, d] = end.toISOString().slice(0, 10).split("-");
  await expect(pro).toContainText(`${d}.${m}.${y}`);
});
test("demo sıfırlama hər şeyi sıfıra qaytarır", async ({ page }) => {
  // FNT-0001 düzgün: C
  await page.goto("/gunun-suallari/faiz-nisbet-tenasub/1");
  await pick(page, "C");
  await page.getByRole("button", { name: "Cavabı yoxla" }).click();
  await expect(page.getByText("Düzgündür!")).toBeVisible();
  await page.goto("/panel");
  await expect(page.getByText("1 / 20")).toBeVisible();

  await page.goto("/profil");
  await page.getByRole("button", { name: "Demo məlumatlarını sıfırla" }).click();
  await expect(page).toHaveURL(/\/panel$/);
  // Sıfırlamadan sonra bu günün dəsti yenidən (təsadüfi) seçilir
});

const PAGES = ["/panel", "/gunun-suallari", "/gunun-suallari/faiz-nisbet-tenasub/3", "/sinaqlar", "/sinaq/b11-2", "/sinaq/b11-1/netice", "/profil", "/odenis?exam=b11-3", "/statistika", "/abunelikler"];

test("tətbiq: üfüqi sürüşmə yoxdur + ekran şəkilləri", async ({ page }) => {
  // 50+ səhifə açılışı (5 en × 9 səhifə) və ekran görüntüləri — standart 60 s azdır.
  test.setTimeout(120_000);
  // Nəticə və yarımçıq sınaq ekranları üçün vəziyyət hazırlayırıq.
  await buyAndStart(page, "b11-1");
  await finishExam(page, "b11-1");
  await buyAndStart(page, "b11-2");

  for (const width of [360, 390, 768, 1024, 1440]) {
    await page.setViewportSize({ width, height: 900 });
    for (const p of PAGES) {
      await page.goto(p);
      const overflow = await page.evaluate(() => document.documentElement.scrollWidth - window.innerWidth);
      expect(overflow, `${p} @ ${width}px`).toBeLessThanOrEqual(0);
    }
  }
  for (const [w, h] of [
    [375, 812],
    [1280, 900],
  ]) {
    await page.setViewportSize({ width: w, height: h });
    for (const p of PAGES) {
      await page.goto(p);
      const name = p.slice(1).replace(/[/?=]/g, "_");
      await page.screenshot({ path: `e2e/screenshots/app-${name}-${w}.png`, fullPage: true });
    }
  }
});
