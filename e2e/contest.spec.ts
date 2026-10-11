import AxeBuilder from "@axe-core/playwright";
import { hash } from "@node-rs/argon2";
import { expect, test, type Page } from "@playwright/test";
import { connect } from "./daily-fixture";
import { waitForMail } from "./mail";

// Riyaziyyat yarışı: qeydiyyat (avtomatik doldurma, təkrar, bağlı), onlayn tur (vaxtdan əvvəl, gec giriş, geri qayıtma,
// yeniləmədə vaxtın davam etməsi), nəticə və e-poçt (yalnız razılıq verənlərə), sertifikat. Test öz yarışını yaradır.
test.describe.configure({ mode: "serial" });

const stamp = Date.now();
const CID = `e2e-yaris-${stamp}`;
const SLUG = CID;
const mk = (tag: string, name: string, surname: string, role = "student") => ({
  id: crypto.randomUUID(),
  email: `e2e+y${tag}${stamp}@example.test`,
  password: "Yaris2026x",
  name,
  surname,
  role,
  tag,
});
const A = mk("a", "Aysel", "Məmmədova");
const B = mk("b", "Murad", "Hüseynov");
const C = mk("c", "Nigar", "Əliyeva");
const D = mk("d", "Elçin", "Quliyev");
const ADMIN = mk("adm", "Admin", "Test", "admin");
const MIN = 60_000;

async function sql(q: string, args: unknown[] = []) {
  const db = connect();
  const r = await db.execute({ sql: q, args: args as never });
  db.close();
  return r;
}

test.beforeAll(async () => {
  const now = Date.now();
  for (const u of [A, B, C, D, ADMIN]) {
    await sql(
      `insert into users (id, email, username, name, surname, password_hash, role, grade, email_verified_at, terms_accepted_at, created_at, updated_at)
       values (?, ?, ?, ?, ?, ?, ?, 10, ?, ?, ?, ?)`,
      [u.id, u.email, `e2e_y${u.tag}${stamp % 1e9}`, u.name, u.surname, await hash(u.password), u.role, now, now, now, now],
    );
  }
  // 3 suallıq yarış, hər suala 20 s; tur 2 saatdan sonra
  await sql(
    `insert into contests (id, slug, title, reg_start_at, reg_end_at, start_at, entry_window_min, duration_min, question_count, finalist_count,
       prize_fund, status, created_at) values (?, ?, 'E2E Yarışı', ?, ?, ?, 10, 1, 3, 2, 550, 'registration', ?)`,
    [CID, SLUG, now - 86_400_000, now + 86_400_000, now + 2 * 60 * MIN, now],
  );
  await sql(
    `insert into contest_templates (contest_id, n, source, topic_id, body, vars, condition, answer, distractors, solution, time_sec)
     select ?, n, 'bank', topic_id, body, vars, condition, answer, distractors, solution, 20 from contest_templates where contest_id = 'acilis-2026' and n <= 3`,
    [CID],
  );
});

test.afterAll(async () => {
  await sql("delete from contests where id = ?", [CID]);
  await sql(`delete from users where email like 'e2e+y%${stamp}@example.test'`);
});

async function login(page: Page, u: { email: string; password: string }) {
  await page.goto("/daxil-ol");
  await page.getByLabel("E-poçt və ya istifadəçi adı").fill(u.email);
  await page.getByLabel("Şifrə", { exact: true }).fill(u.password);
  await page.getByRole("button", { name: "Daxil ol" }).click();
  await expect(page).toHaveURL(/\/(panel|onboarding)/);
}

async function axe(page: Page) {
  const r = await new AxeBuilder({ page }).withTags(["wcag2a", "wcag2aa", "wcag21a", "wcag21aa", "wcag22aa"]).analyze();
  return r.violations.filter((v) => v.impact === "critical" || v.impact === "serious").map((v) => `${v.id}: ${v.nodes.map((n) => n.target.join(" ")).join(", ")}`);
}

async function register(page: Page, u: typeof A, opts: { email?: boolean } = {}) {
  await login(page, u);
  await page.goto(`/yaris/${SLUG}#register`);
  await page.getByLabel("Sinif").selectOption("10");
  await page.getByLabel("Rayon / şəhər").fill("Bakı, Nəsimi");
  await page.getByLabel("Məktəb (könüllü)").fill("20 nömrəli məktəb");
  await page.getByLabel("Yarışın qaydaları ilə tanış oldum və razıyam.").check();
  await page.getByLabel(/valideynim iştirakıma razıdır/).check();
  if (opts.email === false) await page.getByLabel("Nəticələrin e-poçtuma göndərilməsinə razıyam.").uncheck();
  await page.getByRole("button", { name: "Qeydiyyatdan keç →" }).click();
  await expect(page.getByRole("status")).toContainText("Qeydiyyat tamamlandı!");
  await page.context().clearCookies();
}

test("qeydiyyat: qonağa giriş təklifi, avtomatik doldurma, təkrar qeydiyyat, bağlı qeydiyyat", async ({ page }) => {
  await page.goto(`/yaris/${SLUG}`);
  await expect(page.getByRole("heading", { level: 1, name: "E2E Yarışı" })).toBeVisible();
  await expect(page.getByText("Nəticələr tur bitdikdən sonra yayımlanacaq.")).toBeVisible();
  await expect(page.getByText("Qeydiyyat üçün əvvəlcə hesabına daxil ol.")).toBeVisible();
  expect(await axe(page)).toEqual([]);

  const t0 = Date.now();
  await login(page, A);
  await page.goto(`/yaris/${SLUG}#register`);
  await expect(page.getByText("Məlumatlar hesabından götürüldü. Lazım olsa, dəyişə bilərsən.")).toBeVisible();
  await expect(page.getByLabel("Ad", { exact: true })).toHaveValue("Aysel");
  await expect(page.getByLabel("Soyad")).toHaveValue("Məmmədova");
  await expect(page.getByRole("textbox", { name: "E-poçt" })).toHaveValue(A.email);
  await expect(page.getByLabel("Nəticələrin e-poçtuma göndərilməsinə razıyam.")).toBeChecked();
  // Vacib xana boşdur
  await page.getByRole("button", { name: "Qeydiyyatdan keç →" }).click();
  // Sinif hesabdan doldurulub; rayon boşdur
  await expect(page.getByLabel("Sinif")).toHaveValue("10");
  await expect(page.locator("#register").getByRole("alert")).toHaveText("Rayon və ya şəhəri yaz");
  expect(Number((await sql("select count(*) n from contest_registrations where contest_id = ?", [CID])).rows[0].n)).toBe(0);
  await page.context().clearCookies();
  await register(page, A);
  const confirm = await waitForMail(A.email, "Qeydiyyat təsdiqləndi", t0);
  expect(confirm.text).toMatch(/Sənin dəvət kodun: 2V2-[A-Z0-9]{5}/);
  expect(confirm.text).toContain("/yaris/imtina?r=");

  // Təkrar: forma yoxdur, "Artıq qeydiyyatdasan" və tur vaxtı
  await login(page, A);
  await page.goto(`/yaris/${SLUG}`);
  await expect(page.getByRole("heading", { name: "Artıq qeydiyyatdasan" })).toBeVisible();
  await expect(page.getByRole("button", { name: "Qeydiyyatdan keç →" })).toHaveCount(0);
  await page.context().clearCookies();

  await register(page, B, { email: false });
  await register(page, C);
  expect(Number((await sql("select count(*) n from contest_registrations where contest_id = ?", [CID])).rows[0].n)).toBe(3);

  // Qeydiyyat bağlanıb
  await sql("update contests set reg_end_at = ? where id = ?", [Date.now() - 1000, CID]);
  await login(page, D);
  await page.goto(`/yaris/${SLUG}`);
  await expect(page.getByText("Qeydiyyat bağlanıb.")).toBeVisible();
  await expect(page.getByRole("button", { name: "Qeydiyyatdan keç →" })).toHaveCount(0);
});

test("tur: vaxtdan əvvəl gözləmə; suallar bir-bir, yeniləmədə vaxt davam edir, geri qayıtmaq olmur; gec giriş bağlıdır", async ({ page }) => {
  await login(page, A);
  await page.goto(`/yaris/${SLUG}/tur`);
  await expect(page.getByText(/Tur .* başlayır\. Bu səhifəni açıq saxla/)).toBeVisible();
  expect(Number((await sql("select count(*) n from contest_attempts where registration_id in (select id from contest_registrations where contest_id = ?)", [CID])).rows[0].n)).toBe(0);

  // Tur başladı (1 dəqiqə əvvəl)
  await sql("update contests set start_at = ?, status = 'running' where id = ?", [Date.now() - MIN, CID]);
  await page.reload();
  await expect(page.getByText("Sual 1 / 3")).toBeVisible();
  const secs = async () => Number((await page.getByRole("timer").getAttribute("aria-label"))!.match(/(\d+) saniyə/)![1]);
  const before = await secs();
  expect(before).toBeLessThanOrEqual(20);
  await page.waitForTimeout(2500);
  await page.reload();
  await expect(page.getByText("Sual 1 / 3")).toBeVisible();
  expect(await secs()).toBeLessThan(before);
  expect(await axe(page)).toEqual([]);

  // Düzgün cavablar bazadan (brauzerə göndərilmir)
  const html = await (await page.request.get(`/yaris/${SLUG}/tur`)).text();
  const reg = (await sql("select id from contest_registrations where contest_id = ? and user_id = ?", [CID, A.id])).rows[0].id;
  const vs = (
    await sql(
      `select v.n, v.correct, v.options, v.task_code, b.topic_id bt, t.topic_id tt from contest_variants v
       join bank_tasks b on b.code = v.task_code join contest_templates t on t.id = v.template_id where v.registration_id = ? order by v.n`,
      [reg],
    )
  ).rows;
  // Suallar sual bankındandır: hər yer öz mövzusunun qapalı sualı, təkrarsız
  expect(vs).toHaveLength(3);
  for (const v of vs) expect(v.bt).toBe(v.tt);
  expect(new Set(vs.map((v) => v.task_code)).size).toBe(3);
  expect(html).not.toContain('"correct"');
  const letters = vs.map((v) => String(v.correct));

  const answer = async (l: string) => {
    await page.locator(`label:has(input[aria-label^="Variant ${l}:"])`).click();
    await page.getByRole("button", { name: /Cavabı təsdiqlə/ }).click();
  };
  await answer(letters[0]);
  await expect(page.getByText("Sual 2 / 3")).toBeVisible();
  // Geri qayıtma: brauzerin "geri" düyməsi əvvəlki suala qaytarmır
  await page.goBack().catch(() => {});
  await page.goto(`/yaris/${SLUG}/tur`);
  await expect(page.getByText("Sual 2 / 3")).toBeVisible();
  await answer(letters[1] === "A" ? "B" : "A");
  await expect(page.getByText("Sual 3 / 3")).toBeVisible();
  await answer(letters[2]);
  await expect(page).toHaveURL(new RegExp(`/yaris/${SLUG}/netice$`));
  await expect(page.getByText("2 / 3")).toBeVisible();
  // Həllər tur hamı üçün bitəndən sonra
  await expect(page.getByText("Sualların həlli və izahı tur hamı üçün bitdikdən sonra açılacaq.")).toBeVisible();
  await page.context().clearCookies();

  // B turu başlayır (cavab vermir); C gec gəlir — giriş bağlıdır
  await login(page, B);
  await page.goto(`/yaris/${SLUG}/tur`);
  await expect(page.getByText("Sual 1 / 3")).toBeVisible();
  await page.context().clearCookies();
  // Giriş pəncərəsi (10 dəq) keçib, tur hələ bitməyib (+1 dəq)
  await sql("update contests set start_at = ? where id = ?", [Date.now() - 10.5 * MIN, CID]);
  await login(page, C);
  await page.goto(`/yaris/${SLUG}/tur`);
  await expect(page.getByText("Tura giriş bağlanıb.")).toBeVisible();
});

test("nəticələr: sıralama, reytinq, nəticə məktubu yalnız razılıq verənə, həllər və sertifikat", async ({ page }) => {
  // Tur hamı üçün bitib (başlanğıc + 10 dəq giriş + 1 dəq tur)
  await sql("update contests set start_at = ? where id = ?", [Date.now() - 20 * MIN, CID]);
  const t0 = Date.now();
  await login(page, ADMIN);
  await page.goto(`/admin/yaris/${CID}`);
  await page.getByRole("button", { name: "Nəticələri indi hesabla" }).click();
  await expect(page.getByText(/Nəticələr hesablandı \(2\)/)).toBeVisible();
  await page.getByRole("button", { name: "Nəticə məktublarını yenidən göndər" }).click();
  await expect(page.getByText(/Nəticə məktubları göndərildi \(1\)/)).toBeVisible();
  const mail = await waitForMail(A.email, "Nəticən", t0);
  expect(mail.text).toContain("Bal: 2 / 3");
  expect(mail.text).toContain("Yer: 1 (2 iştirakçı)");
  expect(mail.text).toContain("/yaris/sertifikat/");
  // B razılıq verməyib — məktub yoxdur
  await expect(waitForMail(B.email, "Nəticən", t0)).rejects.toThrow();

  // Admin: canlı və qeydiyyatçılar, CSV
  await page.goto(`/admin/yaris/${CID}?tab=istirakcilar&q=aysel`);
  await expect(page.getByRole("table", { name: "Qeydiyyatçılar" }).locator("tbody tr")).toHaveCount(1);
  const csv = await (await page.request.get(`/admin/yaris/${CID}/csv`)).text();
  expect(csv).toContain("Məmmədova");
  await page.context().clearCookies();

  // Reytinq səhifədə: qısaldılmış ad
  await page.goto(`/yaris/${SLUG}#leaderboard`);
  await expect(page.getByRole("tabpanel")).toContainText("Aysel M.");
  await expect(page.getByRole("tabpanel")).not.toContainText("Məmmədova");

  // Nəticə səhifəsi: yer, həllər, sertifikat
  await login(page, A);
  await page.goto(`/yaris/${SLUG}/netice`);
  await expect(page.getByText("1 / 2")).toBeVisible();
  await expect(page.getByRole("heading", { name: "Suallar və həllər" })).toBeVisible();
  await expect(page.getByText(/Düzgün cavab:/).first()).toBeVisible();
  const href = await page.getByRole("link", { name: /Sertifikatıma bax/ }).getAttribute("href");
  const cert = await page.request.get(href!);
  expect(cert.status()).toBe(200);
  expect(cert.headers()["content-type"]).toContain("image/svg+xml");
  expect(await cert.text()).toContain("Aysel Məmmədova");
  expect(await axe(page)).toEqual([]);
  await page.context().clearCookies();

  // Admin qeydiyyatı passiv edir: iştirakçı sayda və reytinqdə yoxdur, səhifədə səbəb göstərilir
  await login(page, ADMIN);
  await page.goto(`/admin/yaris/${CID}?tab=istirakcilar&q=murad`);
  const row = page.getByRole("table", { name: "Qeydiyyatçılar" }).locator("tbody tr");
  await expect(row).toContainText("Aktiv");
  await row.getByRole("button", { name: /passiv et/ }).click();
  await expect(page.getByText("Yadda saxlanıldı.")).toBeVisible();
  await expect(row).toContainText("Passiv");
  await page.goto(`/admin/yaris/${CID}?tab=istirakcilar&st=passive`);
  await expect(row).toHaveCount(1);
  expect(await axe(page)).toEqual([]);
  await page.context().clearCookies();
  await login(page, B);
  await page.goto(`/yaris/${SLUG}`);
  await expect(page.getByRole("heading", { name: "Qeydiyyatın deaktiv edilib" })).toBeVisible();
  await expect(page.getByText(/👥\s*2 qeydiyyat/)).toBeVisible();
  await page.goto(`/yaris/${SLUG}/tur`);
  await expect(page.getByText("Qeydiyyatın admin tərəfindən deaktiv edilib.")).toBeVisible();
  await page.context().clearCookies();

  // Yarış passivdir: normal görünüşlü "tezliklə olacaq" səhifəsi və qısa məlumat
  await sql("update contests set status = 'draft' where id = ?", [CID]);
  await page.goto(`/yaris/${SLUG}`);
  await expect(page.getByRole("status")).toHaveText(/Hal-hazırda yarış yoxdur · tezliklə olacaq/);
  await expect(page.getByRole("heading", { level: 1, name: "2vur2 Riyaziyyat Yarışı" })).toBeVisible();
  await expect(page.getByRole("heading", { name: "Yarış necə keçirilir?" })).toBeVisible();
  await expect(page.getByText("E2E Yarışı")).toHaveCount(0);
  expect(await axe(page)).toEqual([]);
  await page.setViewportSize({ width: 360, height: 780 });
  expect(await page.evaluate(() => document.documentElement.scrollWidth)).toBeLessThanOrEqual(360);
});
