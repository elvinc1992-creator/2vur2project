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

async function fillRegister(page: Page, u: { name: string; username: string; email: string; password: string }) {
  await page.goto("/qeydiyyat");
  await page.getByLabel("Ad", { exact: true }).fill(u.name);
  await page.getByLabel("İstifadəçi adı").fill(u.username);
  await page.getByLabel("E-poçt").fill(u.email);
  await page.getByLabel("Şifrə", { exact: true }).fill(u.password);
  await page.getByText("Hər ikisi").click();
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
  await expect(page.getByText("Adını yaz.")).toBeVisible();
  await expect(page.getByText("3–20 simvol: kiçik hərf, rəqəm və “_”.")).toBeVisible();
  await expect(page.getByText("Hədəf imtahanı seç.")).toBeVisible();
  await expect(page.getByText("Davam etmək üçün şərtlərlə razılaş.")).toBeVisible();
  // Fokus ilk səhv sahəyə keçir və sahə aria ilə xətaya bağlıdır.
  const name = page.getByLabel("Ad", { exact: true });
  await expect(name).toBeFocused();
  await expect(name).toHaveAttribute("aria-invalid", "true");
  await expect(name).toHaveAttribute("aria-describedby", "name-err");
});

test("qeydiyyat → poçt təsdiqi", async ({ page }) => {
  const t0 = Date.now();
  await fillRegister(page, user);
  // Şifrə gücü: 3 şərt ödənilib → "Yaxşı"
  await expect(page.getByRole("meter")).toHaveAttribute("aria-valuenow", "3");
  await expect(page.getByText("Yaxşı")).toBeVisible();
  await page.getByRole("button", { name: "Davam et" }).click();

  await expect(page).toHaveURL(/\/email-tesdiqi$/);
  await expect(page.getByRole("heading", { name: "Poçtunu yoxla" })).toBeVisible();
  await expect(page.getByText(user.email)).toBeVisible();
  await expect(page.getByRole("button", { name: /Yenidən göndər · \d:\d\d/ })).toBeVisible();

  const mail = await waitForMail(user.email, "təsdiqlə", t0);
  const link = linkFrom(mail);
  await page.goto(link);
  await expect(page).toHaveURL(/status=ok/);
  await expect(page.getByRole("heading", { name: "E-poçt təsdiqləndi" })).toBeVisible();

  // Link ikinci dəfə işləmir.
  await page.goto(link);
  await expect(page.getByRole("heading", { name: "Link işləmir" })).toBeVisible();
});

test("qeydiyyat: eyni istifadəçi adı və təsdiqlənmiş e-poçt rədd edilir", async ({ page }) => {
  await fillRegister(page, { ...user, email: `e2e+${stamp}b@example.test` });
  await page.getByRole("button", { name: "Davam et" }).click();
  await expect(page.getByText("Bu istifadəçi adı tutulub. Başqasını seç.")).toBeVisible();

  await fillRegister(page, { ...user, username: `${user.username}x` });
  await page.getByRole("button", { name: "Davam et" }).click();
  await expect(page.getByText("Bu e-poçtla hesab var.")).toBeVisible();
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

  // Girişdən sonra giriş səhifəsi panelə yönləndirir.
  await page.goto("/daxil-ol");
  await expect(page).toHaveURL(/\/panel$/);

  // Çıxış dizayna görə Profil ekranındadır.
  await page.goto("/profil");
  await page.getByRole("button", { name: "Çıxış" }).click();
  await expect(page).toHaveURL("/");
  await page.goto("/panel");
  await expect(page).toHaveURL(/\/daxil-ol/);
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

test("təsdiqlənməmiş hesabla giriş: xəbərdarlıq və yeni link", async ({ page }) => {
  const other = {
    name: "Leyla",
    username: `e2e_u${stamp % 1_000_000_000}`,
    email: `e2e+${stamp}u@example.test`,
    password: "Leyla2026",
  };
  await fillRegister(page, other);
  await page.getByRole("button", { name: "Davam et" }).click();
  await expect(page).toHaveURL(/\/email-tesdiqi$/);

  await page.goto("/daxil-ol");
  await login(page, other.email, other.password);
  await expect(page.getByText(/E-poçtun hələ təsdiqlənməyib/)).toBeVisible();
  await page.getByRole("link", { name: "Təsdiq səhifəsinə keç" }).click();
  await expect(page.getByText(other.email)).toBeVisible();
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
