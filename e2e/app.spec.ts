import { createClient } from "@libsql/client";
import { loadEnvConfig } from "@next/env";
import { hash } from "@node-rs/argon2";
import { expect, test, type Page } from "@playwright/test";

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
const pick = (page: Page, letter: string, value: string) =>
  page.locator(`label:has(input[aria-label="Variant ${letter}: ${value}"])`).click();

async function buyAndStart(page: Page, id: string) {
  await page.goto(`/odenis?exam=${id}`);
  await page.getByRole("button", { name: /ödə/ }).click();
  await expect(page).toHaveURL(/\/odenis\/ugurlu\?r=/);
  await page.getByRole("button", { name: "Sınağa başla" }).click();
  await expect(page).toHaveURL(new RegExp(`/sinaq/${id}$`));
}

/** Mock ödəniş: aylıq abunə (yeni istifadəçi pulsuz planda başlayır). */
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

const DAILY_TOPICS = [
  "Triqonometriya",
  "Loqarifmlər",
  "Fəza fiqurları",
  "Faiz və nisbət",
  "Funksiyalar",
  "Üçbucaqlar",
  "Ardıcıllıqlar",
];

test("panel: sıfırdan başlayır, pulsuz plan — hər mövzudan 1 sual", async ({ page }) => {
  await expect(page.getByRole("heading", { name: "Salam, Nigar!" })).toBeVisible();
  await expect(page.getByText("Pulsuz plan").first()).toBeVisible();
  await expect(page.getByText("0 / 70")).toBeVisible();
  await expect(page.getByText("Pulsuz planda bu gün 7 sual açıqdır, daha 63 sual abunə ilə açılır.")).toBeVisible();
  await expect(page.getByText("Günün sualları abunə ilə tam açılır")).toBeVisible();
  for (const topic of DAILY_TOPICS) {
    await expect(page.getByRole("link", { name: new RegExp(`${topic}.*1 pulsuz · 9 kilidli`) })).toBeVisible();
  }
  await expect(page.getByText("0 gün ardıcıl")).toBeVisible();
  await expect(page.getByText("0 tamamlanıb · 0 yarımçıq")).toBeVisible();
  await expect(page.getByText("Yeni: №1, №2, №3, №4")).toBeVisible();
  await expect(page.getByRole("link", { name: "Əsas", exact: true }).first()).toHaveAttribute("aria-current", "page");
});

test("günün sualı: düzgün və yanlış cavab, proqres artır", async ({ page }) => {
  await page.getByRole("link", { name: /Triqonometriya/ }).first().click();
  await expect(page).toHaveURL(/\/gunun-suallari\/triqonometriya\/1$/);
  await expect(page.getByRole("heading", { name: "Günün sualı: Triqonometriya, 1 / 10" })).toBeAttached();

  // Cavab seçilməyib — yoxla düyməsi deaktivdir.
  await expect(page.getByRole("button", { name: "Cavabı yoxla" })).toHaveAttribute("aria-disabled", "true");
  await pick(page, "C", "1");
  await page.getByRole("button", { name: "Cavabı yoxla" }).click();
  await expect(page.getByText("Düzgündür!")).toBeVisible();
  await expect(page.getByText("Bu tipdə düzgün cavabların: 1 / 1.")).toBeVisible();
  await expect(page.getByText("Qısa həll")).toBeVisible();

  // Pulsuz plan: növbəti — başqa mövzunun pulsuz sualı (2-ci sual kilidlidir)
  await page.getByRole("link", { name: "Növbəti sual" }).click();
  await expect(page).toHaveURL(/\/gunun-suallari\/loqarifm\/1$/);

  // Abunədən sonra 2-ci sual açılır
  await subscribe(page);
  await page.goto("/gunun-suallari/triqonometriya/2");
  await pick(page, "B", "0");
  await page.getByRole("button", { name: "Cavabı yoxla" }).click();
  await expect(page.getByText("Yanlışdır. Düzgün cavab: A")).toBeVisible();

  await page.goto("/panel");
  await expect(page.getByText("2 / 70")).toBeVisible();
  await expect(page.getByText("1 gün ardıcıl")).toBeVisible();
});

test("pulsuz plan: kilidli sualın mətni və variantları serverdən gəlmir, abunə hamısını açır", async ({ page }) => {
  // İcmal: 7 mövzu, hər birində 10 sual — 1 açıq, 9 kilidli
  await page.goto("/gunun-suallari");
  await expect(page.getByRole("heading", { level: 1, name: "Günün sualları" })).toBeVisible();
  await expect(page.getByText("Pulsuz planda hər mövzudan 1 sual açıqdır. Qalan 63 sual abunə ilə açılır.")).toBeVisible();
  for (const topic of DAILY_TOPICS) {
    const pager = page.getByRole("navigation", { name: `${topic}: suallar` });
    await expect(pager.getByRole("link")).toHaveCount(10);
    await expect(pager.getByRole("link", { name: /kilidli/ })).toHaveCount(9);
    await expect(pager.getByRole("link", { name: "Sual 1, açıq" })).toBeVisible();
  }

  // Kilidli sual: paywall, variant yoxdur, mətn HTML-də yoxdur
  await page.getByRole("navigation", { name: "Faiz və nisbət: suallar" }).getByRole("link", { name: /^Sual 2,/ }).click();
  await expect(page).toHaveURL(/\/gunun-suallari\/faiz\/2$/);
  await expect(page.getByRole("heading", { name: "Bu sual abunə ilə açılır", exact: true })).toBeVisible();
  await expect(page.getByRole("radio")).toHaveCount(0);
  await expect(page.getByRole("link", { name: "Abunə ol" })).toHaveAttribute("href", "/odenis");
  const locked = await (await page.request.get("/gunun-suallari/faiz/2")).text();
  expect(locked).not.toContain("45% artırıldı");
  expect(locked).not.toContain("səh.146 №11–15");

  // Abunə → bütün 70 sual açıqdır
  await subscribe(page);
  await page.goto("/gunun-suallari");
  await expect(page.getByText("Bu gün 7 mövzu üzrə 70 sual. Hər mövzuda 10 sual.")).toBeVisible();
  await expect(page.getByRole("link", { name: /kilidli/ })).toHaveCount(0);
  await page.goto("/gunun-suallari/faiz/2");
  await expect(page.getByText("45% artırıldı")).toBeVisible();
  await expect(page.getByRole("radio")).toHaveCount(5);
});

test("günün sualı: cavab açarı HTML-də yoxdur", async ({ page }) => {
  const html = await (await page.request.get("/gunun-suallari/feza/1")).text();
  expect(html).toContain("Tili 3 sm olan kubun");
  expect(html).not.toContain("Kubun həcmi");
  expect(html).not.toMatch(/"answer":"[A-E]"/);
});

test("kodlaşdırılan cavab: icazəsiz simvol daxil edilmir, xəta göstərilir", async ({ page }) => {
  await buyAndStart(page, "3");
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
  await buyAndStart(page, "4");
  // A–E qısayolu (fokus mətn sahəsində deyil)
  await page.keyboard.press("c");
  await expect(page.getByLabel("Variant C: 16%")).toBeChecked();
  // Ox düyməsi ilə dəyiş
  await page.keyboard.press("ArrowDown");
  await expect(page.getByLabel("Variant D: 18%")).toBeChecked();
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
  await expect(page).toHaveURL(/\/sinaq\/4\/netice$/);
});

test("cavabı silmək: sınaqda, cavab vərəqində, kodlaşdırılanda, günün sualında", async ({ page }) => {
  await buyAndStart(page, "1");
  const cell1 = page.getByRole("button", { name: /^Sual 1,/ });

  // Seç → "Cavabı sil" → sual yenidən boşdur (serverdə də)
  await pick(page, "C", "16%");
  await expect(cell1).toHaveAccessibleName("Sual 1, cavablanıb");
  await page.getByRole("button", { name: "Cavabı sil" }).click();
  await expect(page.getByLabel("Variant C: 16%")).not.toBeChecked();
  await expect(cell1).toHaveAccessibleName("Sual 1, boş");
  await page.waitForTimeout(400);
  await page.reload();
  await expect(page.getByRole("button", { name: /^Sual 1,/ })).toHaveAccessibleName("Sual 1, boş");

  // Delete klavişi ilə
  await pick(page, "B", "20%");
  await page.getByLabel("Variant B: 20%").focus();
  await page.keyboard.press("Delete");
  await expect(page.getByLabel("Variant B: 20%")).not.toBeChecked();

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
  await page.goto("/gunun-suallari/faiz/1");
  await pick(page, "B", "12");
  await page.getByRole("button", { name: "Seçimi sil" }).click();
  await expect(page.getByLabel("Variant B: 12")).not.toBeChecked();
  await expect(page.getByRole("button", { name: "Cavabı yoxla" })).toHaveAttribute("aria-disabled", "true");
});

/** Demo vəziyyətini (kuki) birbaşa qurur — 90 dəqiqə gözləmədən vaxtın bitməsini yoxlamaq üçün. */
async function setDemo(page: Page, attempt: Record<string, unknown>) {
  const state = {
    uid: userId,
    daily: {},
    purchased: ["1"],
    attempts: { "1": { answers: { "1": "C" }, flags: [], ...attempt } },
    results: {},
    sub: { status: "active", periodEnd: "2099-01-01" },
    payments: [],
  };
  await page.context().addCookies([
    {
      name: "demo_v3",
      value: Buffer.from(JSON.stringify(state)).toString("base64url"),
      domain: "localhost",
      path: "/",
      httpOnly: true,
      sameSite: "Lax",
    },
  ]);
}

const toSec = (t: string) => t.split(":").reduce((s, x) => s * 60 + Number(x), 0);

test("sayğac: sınaq səhifəsindən çıxanda vaxt dayanır, qayıdanda davam edir", async ({ page }) => {
  await buyAndStart(page, "1");
  const timer = page.getByRole("timer");
  await expect(timer).toContainText(/^1:(30:00|29:\d\d)$/);
  await page.waitForTimeout(1500);
  const before = toSec((await timer.textContent())!);

  await page.goto("/panel");
  await expect(page.getByText(/dəq qalıb · fasilədə/)).toBeVisible();
  await page.waitForTimeout(8000); // fasilə: bu vaxt sayılmamalıdır
  await page.goto("/sinaqlar");
  await expect(page.getByText(/Fasilədə · \d+ dəq qalıb/)).toBeVisible();

  await page.goto("/sinaq/1");
  await page.waitForTimeout(1000);
  const after = toSec((await timer.textContent())!);
  // Fasilə (8 s) + keçidlər sayılsaydı, fərq ≥ 10 s olardı; yalnız açıq qalan anlar (≈ 2–4 s) sayılır.
  expect(before - after).toBeLessThan(6);
});

test("sayğac: vaxt səhifədə bitəndə sınaq avtomatik bitir və bağlanır", async ({ page }) => {
  await setDemo(page, { startedAt: Date.now() - 100_000, elapsedMs: 90 * 60_000 - 3_000, lastSeenAt: null });
  await page.goto("/sinaq/1");
  await expect(page.getByRole("heading", { name: "Sınaq vaxtı bitdi" })).toBeVisible({ timeout: 15_000 });
  await expect(page.getByText("Cavabladığın 1 sual avtomatik göndərildi.")).toBeVisible();
  // Bağlanıb: yenidən açanda sual yox, nəticəyə yönləndirir
  await page.goto("/sinaq/1");
  await expect(page).toHaveURL(/\/sinaq\/1\/netice$/);
  await expect(page.getByText(/Vaxt bitdiyi üçün sınaq avtomatik göndərildi/)).toBeVisible();
  await page.goto("/sinaqlar");
  await expect(page.getByText("Bal: 4")).toBeVisible();
});

test("sayğac: vaxtı bitmiş sınaq aktiv deyil — davam etmək olmur", async ({ page }) => {
  await setDemo(page, { startedAt: Date.now() - 200_000, elapsedMs: 90 * 60_000, lastSeenAt: null });
  await page.goto("/panel");
  await expect(page.getByText("Sınaq · yarımçıq")).toHaveCount(0);
  await page.goto("/sinaqlar");
  const card = page.getByRole("article").filter({ hasText: "Buraxılış sınağı №1" });
  await expect(card.getByText("Vaxt bitib")).toBeVisible();
  await expect(card.getByRole("link", { name: /Davam et/ })).toHaveCount(0);
  await card.getByRole("link", { name: "Nəticəyə bax" }).click();
  await expect(page.getByRole("heading", { name: "Sınaq vaxtı bitdi" })).toBeVisible();
  await expect(page.getByRole("radio")).toHaveCount(0); // sual interfeysi yoxdur
  await page.getByRole("link", { name: "Nəticəyə bax" }).click();
  await expect(page).toHaveURL(/\/sinaq\/1\/netice$/);
});

test("sınaq: satın al → başla → cavabla → yenilə → bitir → nəticə; açar sızmır", async ({ page }) => {
  await page.goto("/sinaqlar");
  await expect(page.getByRole("article")).toHaveCount(4);
  await expect(page.getByRole("link", { name: /Satın al/ })).toHaveCount(4);
  await page.getByRole("link", { name: /Satın al/ }).first().click();
  await expect(page).toHaveURL(/\/odenis\?exam=1$/);
  await page.getByRole("button", { name: /ödə/ }).click();
  await expect(page.getByRole("heading", { name: "Ödəniş uğurludur" })).toBeVisible();
  await page.getByRole("button", { name: "Sınağa başla" }).click();
  await expect(page).toHaveURL(/\/sinaq\/1$/);

  // Sayğac server vaxtından: 90 dəqiqə
  await expect(page.getByRole("timer")).toContainText(/^1:(30:00|29:\d\d)$/);
  // Cavab açarı səhifədə yoxdur
  const html = await (await page.request.get("/sinaq/1")).text();
  expect(html).toContain("Katetləri 6 və 8");
  expect(html).not.toContain("36 + 64 = 100");

  await expect(page.getByText("Sual 1 / 25")).toBeVisible();
  await pick(page, "C", "16%");
  await page.getByRole("button", { name: "Növbəti" }).click();
  await expect(page.getByText("Sual 2 / 25")).toBeVisible();

  await page.getByRole("button", { name: /^Sual 14,/ }).click();
  await page.getByLabel("Cavab, rəqəmlərlə").fill("42");
  await page.getByRole("button", { name: /^Sual 19,/ }).click();
  await page.getByLabel("Həllini yaz").fill("x · 1,21 = 242, x = 200");
  await page.waitForTimeout(800); // debounce → autosave

  await expect(page.getByText("Yadda saxlanıldı ✓")).toBeVisible();
  // Yenilədikdən sonra cavablar serverdə saxlanıb.
  await page.reload();
  await page.getByRole("button", { name: /^Sual 14,/ }).click();
  await expect(page.getByLabel("Cavab, rəqəmlərlə")).toHaveValue("42");

  await page.getByRole("button", { name: "Cavab vərəqi" }).first().click();
  await expect(page.getByText("3 / 25 cavablanıb")).toBeVisible();
  await expect(page.getByText("Yazılıb")).toBeVisible();
  await page.getByRole("button", { name: "Sınağı bitir" }).last().click();
  await expect(page.getByRole("heading", { name: "Sınağı bitirək?" })).toBeVisible();
  await expect(page.getByText("22 sual boşdur, 0 sual işarələnib. Sınağı bitirmək istəyirsiniz?")).toBeVisible();
  await page.getByRole("button", { name: "Bitir", exact: true }).click();

  await expect(page).toHaveURL(/\/sinaq\/1\/netice$/);
  await expect(page.getByText("2 düzgün")).toBeVisible();
  await expect(page.getByText("1 yoxlanılır")).toBeVisible();
  await expect(page.getByText(/İlkin bal/)).toBeVisible();
  await expect(page.getByRole("heading", { name: "Həll izahları" })).toBeVisible();

  await page.goto("/sinaqlar");
  await expect(page.getByText("Bal: 8")).toBeVisible();
  await page.goto("/panel");
  await expect(page.getByText("1 tamamlanıb · 0 yarımçıq")).toBeVisible();
});

test("abunəni ləğv et və bərpa et", async ({ page }) => {
  await page.goto("/profil");
  await expect(page.getByText("Hələ ödəniş yoxdur.")).toBeVisible();
  await page.getByRole("link", { name: "Abunə ol" }).click();
  await expect(page).toHaveURL(/\/odenis$/);
  await subscribe(page);
  await page.goto("/profil");
  await expect(page.getByText("Nigar").first()).toBeVisible();
  await page.getByRole("button", { name: "Abunəni ləğv et" }).click();
  await expect(page.getByRole("heading", { name: "Abunəni ləğv edək?" })).toBeVisible();
  await page.getByRole("button", { name: "Bəli, ləğv et" }).click();
  await expect(page).toHaveURL(/\/profil\/abune-legv-edildi$/);
  await expect(page.getByRole("heading", { name: "Abunə ləğv edildi" })).toBeVisible();

  await page.goto("/panel");
  await expect(page.getByText(/Abunən .*-də bitir/)).toBeVisible();

  await page.goto("/profil/abune-legv-edildi");
  await page.getByRole("button", { name: "Fikrimi dəyişdim — bərpa et" }).click();
  await expect(page).toHaveURL(/\/profil$/);
  await expect(page.getByText("Aktiv", { exact: true })).toBeVisible();
});

test("demo sıfırlama hər şeyi sıfıra qaytarır", async ({ page }) => {
  await page.goto("/gunun-suallari/faiz/1");
  await pick(page, "B", "12");
  await page.getByRole("button", { name: "Cavabı yoxla" }).click();
  await expect(page.getByText("Düzgündür!")).toBeVisible();
  await page.goto("/panel");
  await expect(page.getByText("1 / 70")).toBeVisible();

  await page.goto("/profil");
  await page.getByRole("button", { name: "Demo məlumatlarını sıfırla" }).click();
  await expect(page).toHaveURL(/\/panel$/);
  await expect(page.getByText("0 / 70")).toBeVisible();
});

const PAGES = ["/panel", "/gunun-suallari", "/gunun-suallari/faiz/2", "/sinaqlar", "/sinaq/2", "/sinaq/1/netice", "/profil", "/odenis?exam=3", "/statistika"];

test("tətbiq: üfüqi sürüşmə yoxdur + ekran şəkilləri", async ({ page }) => {
  // 50+ səhifə açılışı (5 en × 9 səhifə) və ekran görüntüləri — standart 60 s azdır.
  test.setTimeout(120_000);
  // Nəticə və yarımçıq sınaq ekranları üçün vəziyyət hazırlayırıq.
  await buyAndStart(page, "1");
  await finishExam(page, "1");
  await buyAndStart(page, "2");

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
