import { createClient } from "@libsql/client";
import { loadEnvConfig } from "@next/env";
import { hash } from "@node-rs/argon2";
import { expect, test, type Page } from "@playwright/test";
import { linkFrom, waitForMail } from "./mail";

test.describe.configure({ mode: "serial" });

const stamp = Date.now();
const user = {
  name: "Aysel",
  username: `e2e_${stamp % 1_000_000_000}`,
  email: `e2e+${stamp}@example.test`,
  password: "Aysel2026",
  newPassword: "Yeni2026!",
};

async function fillRegister(page: Page, u: { name: string; username: string; password: string }) {
  await page.goto("/qeydiyyat");
  await page.getByLabel("Ad", { exact: true }).fill(u.name);
  await page.getByLabel("Soyad", { exact: true }).fill("Məmmədova");
  await page.getByLabel("Ata adı", { exact: true }).fill("Rəşid");
  await page.getByLabel("İstifadəçi adı").fill(u.username);
  await page.getByLabel("Şifrə", { exact: true }).fill(u.password);
  // Mətndə linklər var — qutunun özünə klikləyirik.
  await page.locator('label:has(input[name="terms"]) > span[aria-hidden="true"]').click();
  await expect(page.getByRole("checkbox")).toBeChecked();
}

async function login(page: Page, identifier: string, password: string) {
  await page.getByLabel("E-poçt və ya istifadəçi adı").fill(identifier);
  await page.getByLabel("Şifrə", { exact: true }).fill(password);
  await page.getByRole("button", { name: "Daxil ol" }).click();
}

test("qeydiyyat: boş forma Azərbaycan dilində xətalar göstərir", async ({ page }) => {
  await page.goto("/qeydiyyat");
  await page.getByRole("button", { name: "Davam et" }).click();
  await expect(page.getByText("Adını yaz.", { exact: true })).toBeVisible();
  await expect(page.getByText("Soyadını yaz.")).toBeVisible();
  await expect(page.getByText("Ata adını yaz.")).toBeVisible();
  await expect(page.getByText("3–20 simvol: kiçik hərf, rəqəm və “_”.")).toBeVisible();
  await expect(page.getByText("Davam etmək üçün şərtlərlə razılaş.")).toBeVisible();
  // Fokus ilk səhv sahəyə keçir və sahə aria ilə xətaya bağlıdır.
  const name = page.getByLabel("Ad", { exact: true });
  await expect(name).toBeFocused();
  await expect(name).toHaveAttribute("aria-invalid", "true");
  await expect(name).toHaveAttribute("aria-describedby", "name-err");
});

test("qeydiyyat: e-poçt soruşulmur, forma qısadır → birbaşa panelə", async ({ page }) => {
  await fillRegister(page, user);
  await expect(page.getByLabel("E-poçt")).toHaveCount(0);
  await expect(page.getByText("Hədəf imtahan")).toHaveCount(0);
  // Desktop-da forma bir ekrana sığır (sürüşdürmə demək olar ki, lazım deyil)
  await page.setViewportSize({ width: 1440, height: 900 });
  expect(await page.evaluate(() => document.querySelector("main")!.scrollHeight)).toBeLessThan(1000);
  // Şifrə gücü: 3 şərt ödənilib → "Yaxşı"
  await expect(page.getByRole("meter")).toHaveAttribute("aria-valuenow", "3");
  await expect(page.getByText("Yaxşı")).toBeVisible();
  await page.getByRole("button", { name: "Davam et" }).click();

  await expect(page).toHaveURL(/\/panel$/);
  await expect(page.getByText(/Salam, Aysel/).first()).toBeVisible();
  // Çıxıb istifadəçi adı ilə yenidən daxil olmaq
  await page.context().clearCookies();
  await page.goto("/daxil-ol");
  await login(page, user.username, user.password);
  await expect(page).toHaveURL(/\/panel$/);
});

test("qeydiyyat: eyni istifadəçi adı rədd edilir", async ({ page }) => {
  await fillRegister(page, user);
  await page.getByRole("button", { name: "Davam et" }).click();
  await expect(page.getByText("Bu istifadəçi adı tutulub. Başqasını seç.")).toBeVisible();
});

test("profil: e-poçt təsdiq kodu ilə əlavə olunur, telefon +994", async ({ page }) => {
  await page.goto("/daxil-ol");
  await login(page, user.username, user.password);
  await expect(page).toHaveURL(/\/panel$/);
  await page.goto("/profil");

  // E-poçt: kod göndər → yanlış kod → düzgün kod
  const t0 = Date.now();
  await page.getByLabel("E-poçt", { exact: true }).fill(user.email);
  await page.getByRole("button", { name: "Kod göndər" }).click();
  await expect(page.getByText(`${user.email} ünvanına 6 rəqəmli kod göndərdik.`, { exact: false })).toBeVisible();
  await expect(page.getByRole("button", { name: /Yenidən göndər · \d+ san/ })).toBeDisabled();
  const code = (await waitForMail(user.email, "təsdiq kodu", t0)).text.match(/\b\d{6}\b/)![0];
  await page.getByLabel("Təsdiq kodu").fill(code === "000000" ? "111111" : "000000");
  await page.getByRole("button", { name: "Təsdiqlə" }).click();
  await expect(page.getByText("Kod yanlışdır.")).toBeVisible();
  await page.getByLabel("Təsdiq kodu").fill(code);
  await page.getByRole("button", { name: "Təsdiqlə" }).click();
  await expect(page.getByText("Təsdiqlənib")).toBeVisible();
  await expect(page.getByText(user.email)).toBeVisible();

  // Telefon: səhv format → xəta; düzgün → saxlanılır və formatla göstərilir
  const phone = page.getByLabel("Telefon nömrəsi");
  await phone.fill("+994 12");
  await page.getByRole("button", { name: "Saxla" }).click();
  await expect(page.getByText(/Nömrə \+994 ilə və 9 rəqəmlə olsun/)).toBeVisible();
  const digits = String(stamp).slice(-7);
  await phone.fill(`050 ${digits}`);
  await page.getByRole("button", { name: "Saxla" }).click();
  await expect(page.getByText("Saxlanıldı ✓")).toBeVisible();
  await page.reload();
  await expect(page.getByLabel("Telefon nömrəsi")).toHaveValue(`+994 50 ${digits.slice(0, 3)} ${digits.slice(3, 5)} ${digits.slice(5, 7)}`);
});
test("giriş: xəta halları dizayndakı kimi", async ({ page }) => {
  await page.goto("/daxil-ol");
  await login(page, user.email.toUpperCase(), "Yanlis2026");
  await expect(page.getByText("Şifrə yanlışdır. Yenidən yoxla.")).toBeVisible();
  // Yanlış şifrədə e-poçt sahəsi təmizlənmir.
  await expect(page.getByLabel("E-poçt və ya istifadəçi adı")).toHaveValue(user.email.toUpperCase());

  await login(page, `e2e+yoxdur${stamp}@example.test`, "Aysel2026");
  await expect(page.getByText("Bu e-poçtla hesab tapılmadı.")).toBeVisible();
  await expect(page.getByText("Yeni istifadəçisən?")).toBeVisible();
});

test("giriş → panel → çıxış, qorunan səhifələr", async ({ page }) => {
  await page.goto("/panel");
  await expect(page).toHaveURL(/\/daxil-ol\?next=%2Fpanel$/);

  // İstifadəçi adı ilə giriş, sonra `next`-ə qayıdış.
  await login(page, user.username, user.password);
  await expect(page).toHaveURL(/\/panel$/);
  await expect(page.getByRole("heading", { name: "Salam, Aysel!" })).toBeVisible();

  // Girişdən sonra da giriş səhifəsi açılır (başqa hesaba keçmək üçün) — cari hesab göstərilir.
  await page.goto("/daxil-ol");
  await expect(page).toHaveURL(/\/daxil-ol$/);
  await expect(page.getByText(`Hazırda ${user.email} hesabındasan.`, { exact: false })).toBeVisible();

  // Çıxış dizayna görə Profil ekranındadır.
  await page.goto("/profil");
  await page.getByRole("button", { name: "Çıxış" }).click();
  await expect(page).toHaveURL("/");
  await page.goto("/panel");
  await expect(page).toHaveURL(/\/daxil-ol/);
});

test("daxil olmuşkən yeni hesab: data yeni userId-yə bağlıdır, köhnə hesabın abunəsi görünmür", async ({ page }) => {
  await page.goto("/daxil-ol");
  await login(page, user.username, user.password);
  await expect(page).toHaveURL(/\/panel$/);
  await page.goto("/odenis");
  await page.getByRole("button", { name: /ödə/ }).click();
  await expect(page).toHaveURL(/ugurlu/);
  await page.goto("/profil");
  await expect(page.getByText("Aylıq abunə").first()).toBeVisible();

  const other = { name: "Banu", username: `e2e_b${stamp % 1e9}`, password: "Banu2026x" };
  await fillRegister(page, other);
  await expect(page.getByText(`Hazırda ${user.email} hesabındasan.`, { exact: false })).toBeVisible();
  await page.getByRole("button", { name: "Davam et" }).click();
  await expect(page).toHaveURL(/\/panel$/);
  await page.goto("/profil");
  await expect(page.getByRole("heading", { level: 1, name: /Banu/ })).toBeVisible();
  await expect(page.getByRole("link", { name: "Pro · 6.90 AZN / ay" })).toBeVisible();
  await page.goto("/onlayn-repetitor");
  await expect(page.getByRole("heading", { level: 1, name: "Onlayn repetitor Premium planı ilə açılır" })).toBeVisible();
});

test("şifrə bərpası", async ({ page }) => {
  const t0 = Date.now();
  await page.goto("/sifre-berpasi");
  await page.getByLabel("E-poçt").fill(user.email);
  await page.getByRole("button", { name: "Link göndər" }).click();
  await expect(page.getByText(/Bu e-poçtla hesab varsa/)).toBeVisible();

  const link = linkFrom(await waitForMail(user.email, "şifrə bərpası", t0));
  await page.goto(link);
  await expect(page.getByRole("heading", { name: "Yeni şifrə" })).toBeVisible();

  await page.getByLabel("Yeni şifrə").fill("abc");
  await page.getByRole("button", { name: "Şifrəni yenilə" }).click();
  await expect(page.getByText("Şifrə ən azı 8 simvol olsun.")).toBeVisible();

  await page.getByLabel("Yeni şifrə").fill(user.newPassword);
  await expect(page.getByRole("meter")).toHaveAttribute("aria-valuenow", "4");
  await page.getByRole("button", { name: "Şifrəni yenilə" }).click();
  await expect(page).toHaveURL(/\/daxil-ol\?reset=1$/);
  await expect(page.getByText("Şifrən yeniləndi.")).toBeVisible();

  // Köhnə şifrə işləmir, yenisi işləyir.
  await login(page, user.email, user.password);
  await expect(page.getByText("Şifrə yanlışdır. Yenidən yoxla.")).toBeVisible();
  await login(page, user.email, user.newPassword);
  await expect(page).toHaveURL(/\/panel$/);

  // Bərpa linki ikinci dəfə işləmir.
  await page.goto(link);
  await expect(page.getByRole("heading", { name: "Link işləmir" })).toBeVisible();
});

test("köhnə təsdiqlənməmiş hesab da daxil ola bilir", async ({ page }) => {
  const other = { email: `e2e+${stamp}u@example.test`, password: "Leyla2026" };
  loadEnvConfig(process.cwd());
  const db = createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });
  const now = Date.now();
  await db.execute({
    sql: `insert into users (id, email, username, name, password_hash, role, grade, target_exam,
            email_verified_at, terms_accepted_at, created_at, updated_at)
          values (?, ?, ?, 'Leyla', ?, 'student', 11, 'both', null, ?, ?, ?)`,
    args: [crypto.randomUUID(), other.email, `e2e_u${stamp % 1e9}`, await hash(other.password), now, now, now],
  });
  db.close();

  await page.goto("/daxil-ol");
  await login(page, other.email, other.password);
  await expect(page).toHaveURL(/\/panel$/);
});

test("brauzerə şifrə hash-i və token sızmır", async ({ page }) => {
  const bodies: string[] = [];
  page.on("response", async (r) => {
    if (r.url().startsWith("http://localhost:3000")) bodies.push(await r.text().catch(() => ""));
  });
  await page.goto("/daxil-ol");
  await login(page, user.email, user.newPassword);
  await expect(page).toHaveURL(/\/panel$/);
  const all = bodies.join("\n");
  expect(all).not.toContain("$argon2");
  expect(all).not.toContain("password_hash");
  expect(all).not.toContain("passwordHash");
});

const WIDTHS = [360, 390, 768, 1024, 1440];
const PAGES = ["/daxil-ol", "/qeydiyyat", "/email-tesdiqi", "/sifre-berpasi", "/sertler"];

test("üfüqi sürüşmə yoxdur (360–1440 px) + ekran şəkilləri", async ({ page }) => {
  for (const width of WIDTHS) {
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
    for (const p of ["/daxil-ol", "/qeydiyyat"]) {
      await page.goto(p);
      await page.screenshot({ path: `e2e/screenshots/${p.slice(1)}-${w}.png`, fullPage: true });
    }
  }
});
