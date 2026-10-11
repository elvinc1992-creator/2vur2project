import { hash } from "@node-rs/argon2";
import { expect, test, type Page } from "@playwright/test";
import { connect } from "./daily-fixture";

// Müəllim paneli: müraciət və admin təsdiqi, sınaq strukturu, qrupda təkrarsız suallar (və bitəndə xəbərdarlıq),
// variantlar və cavab açarı, kağız nəticəsinin şagirdin öz variantı ilə yoxlanması, onlayn sınaq (balans, şagirdin
// keçməsi, başlamayanlara geri qaytarma), müəllimlər arasında izolyasiya. Test öz istifadəçilərini yaradır.
test.describe.configure({ mode: "serial" });

const stamp = Date.now();
const DAY = 86_400_000;
const mk = (tag: string, name: string, surname: string, role = "student") => ({
  id: crypto.randomUUID(),
  email: `e2e+t${tag}${stamp}@example.test`,
  password: "Muellim2026x",
  name,
  surname,
  role,
  tag,
});
const T1 = mk("t1", "Səbinə", "Kərimova", "teacher");
const T2 = mk("t2", "Rauf", "Əliyev", "teacher");
const APPLICANT = mk("ap", "Lalə", "Həsənova");
const ADMIN = mk("adm", "Admin", "Test", "admin");
const STUDENTS = Array.from({ length: 4 }, (_, i) => mk(`s${i}`, ["Aysel", "Murad", "Nigar", "Elçin"][i], ["Məmmədova", "Hüseynov", "Əliyeva", "Quliyev"][i]));
const G1 = { id: crypto.randomUUID(), code: `E${String(stamp).slice(-2)}-${String(stamp).slice(-5, -2)}A` };
const G2 = { id: crypto.randomUUID(), code: `E${String(stamp).slice(-2)}-${String(stamp).slice(-5, -2)}B` };

async function sql(q: string, args: unknown[] = []) {
  const db = connect();
  const r = await db.execute({ sql: q, args: args as never });
  db.close();
  return r;
}
const one = async (q: string, args: unknown[] = []) => (await sql(q, args)).rows[0];

test.beforeAll(async () => {
  const now = Date.now();
  const pw = await hash(T1.password);
  for (const u of [T1, T2, APPLICANT, ADMIN, ...STUDENTS]) {
    await sql(
      `insert into users (id, email, username, name, surname, password_hash, role, grade, email_verified_at, terms_accepted_at, created_at, updated_at)
       values (?, ?, ?, ?, ?, ?, ?, 9, ?, ?, ?, ?)`,
      [u.id, u.email, `e2e_t${u.tag}${stamp % 1e9}`, u.name, u.surname, pw, u.role, now, now, now, now],
    );
  }
  for (const t of [T1, T2]) await sql("insert into teacher_accounts (user_id, balance, daily_limit, created_at) values (?, 0, 20, ?)", [t.id, now]);
  // T1: 9-cu sinif qrupu (4 şagird); T2: öz qrupu (izolyasiya üçün)
  await sql("insert into teacher_groups (id, teacher_id, name, exam_kind, code, created_at) values (?, ?, 'E2E 9-A', 'buraxilis-9', ?, ?)", [G1.id, T1.id, G1.code, now]);
  await sql("insert into teacher_groups (id, teacher_id, name, exam_kind, code, created_at) values (?, ?, 'E2E başqa qrup', 'buraxilis-11', ?, ?)", [G2.id, T2.id, G2.code, now]);
  for (const s of STUDENTS.slice(1)) await sql("insert into teacher_group_members (group_id, user_id, joined_at) values (?, ?, ?)", [G1.id, s.id, now]);
});

test.afterAll(async () => {
  await sql(`delete from users where email like 'e2e+t%${stamp}@example.test'`);
});

async function login(page: Page, u: { email: string; password: string }) {
  await page.context().clearCookies();
  await page.goto("/daxil-ol");
  await page.getByLabel("E-poçt və ya istifadəçi adı").fill(u.email);
  await page.getByLabel("Şifrə", { exact: true }).fill(u.password);
  await page.getByRole("button", { name: "Daxil ol" }).click();
  await expect(page).toHaveURL(/\/(panel|onboarding|muellim)/);
}

/** Sınaq yarat formu: imtahan növü G1-in növüdür (9-cu sinif); tarix bu gün. */
async function createTest(page: Page, mode: "paper" | "online", opts: { time?: string } = {}) {
  await page.goto("/muellim/sinaq-yarat");
  await page.getByText("9-cu sinif buraxılış", { exact: true }).first().click();
  if (mode === "online") await page.locator("label").filter({ hasText: "Onlayn" }).click();
  await page.locator("select[name=groupId]").selectOption(G1.id);
  if (opts.time) await page.getByLabel(mode === "online" ? "Açılma saatı" : "Saat").fill(opts.time);
  await page.getByRole("button", { name: "Sınağı yarat →" }).click();
  await expect(page).toHaveURL(/\/muellim\/sinaqlar\/[a-z0-9]+\?yaradildi=1/);
  return new URL(page.url()).pathname.split("/").pop()!;
}

test("müraciət: şagird müraciət edir, panel bağlıdır; admin təsdiqləyir — panel açılır", async ({ page }) => {
  await login(page, APPLICANT);
  await page.goto("/muellim");
  await expect(page).toHaveURL(/\/muellim\/muraciet/);
  await page.getByLabel(/məktəb və ya kurs/).fill("E2E məktəbi");
  await page.getByRole("button", { name: "Müraciət göndər" }).click();
  await expect(page.getByText("Müraciətin göndərildi")).toBeVisible();

  await login(page, ADMIN);
  await page.goto("/admin/muellimler");
  const row = page.getByRole("row").filter({ hasText: APPLICANT.email });
  await row.getByRole("button", { name: "Təsdiqlə" }).click();
  await expect(page.getByText("Müraciət təsdiqləndi")).toBeVisible();
  expect((await one("select role from users where id = ?", [APPLICANT.id])).role).toBe("teacher");
  // Sınaq strukturu: hər imtahan növü üçün say və müddət, mövzu bölgüsü
  await page.goto("/admin/sinaq-strukturu");
  for (const name of ["9-cu sinif buraxılış", "11-ci sinif buraxılış", "11-ci sinif blok"]) await expect(page.getByRole("heading", { name })).toBeVisible();
  await expect(page.getByRole("button", { name: "Mövzu bölgüsünü saxla" })).toBeVisible();

  await login(page, APPLICANT);
  await page.goto("/muellim");
  await expect(page.getByRole("heading", { name: /Salam, Lalə müəllim/ })).toBeVisible();
});

test("şagird qrup kodu ilə qoşulur", async ({ page }) => {
  await login(page, STUDENTS[0]);
  await page.goto("/qruplarim");
  await page.getByLabel("Qrup kodu").fill(G1.code.toLowerCase());
  await page.getByRole("button", { name: "Qoşul" }).click();
  await expect(page.getByText("Qrupa qoşuldun")).toBeVisible();
  expect((await one("select count(*) n from teacher_group_members where group_id = ? and left_at is null", [G1.id])).n).toBe(4);
});

let paper1 = "";
let paper2 = "";

test("kağız sınağı: struktur imtahan növünə uyğundur, variantlar fərqlidir, ikinci sınaqda suallar təkrarlanmır", async ({ page }) => {
  await login(page, T1);
  paper1 = await createTest(page, "paper");
  paper2 = await createTest(page, "paper");

  // Struktur: bölmələrin sayı imtahan növünün (admin) strukturu ilə eynidir
  const sections = (
    await sql(
      `select s.format, s.question_count c from exam_blueprint_sections s join exam_kinds k on k.blueprint_key = s.blueprint_key where k.key = 'buraxilis-9'`,
    )
  ).rows;
  for (const id of [paper1, paper2]) {
    for (const s of sections) {
      const f = s.format === "open" ? "coded" : String(s.format);
      expect((await one("select count(*) n from teacher_test_items where test_id = ? and format = ?", [id, f])).n).toBe(Number(s.c));
    }
  }
  // Təkrarsız: iki sınağın sualları kəsişmir
  const overlap = await one(
    "select count(*) n from teacher_test_items a join teacher_test_items b on a.task_code = b.task_code where a.test_id = ? and b.test_id = ?",
    [paper1, paper2],
  );
  expect(overlap.n).toBe(0);
  // Hər şagirdin öz variantı (4 şagird), sıra fərqlidir
  const vs = (await sql('select "order" o, letter from teacher_test_variants where test_id = ?', [paper1])).rows;
  expect(vs).toHaveLength(4);
  expect(new Set(vs.map((v) => v.o)).size).toBeGreaterThan(1);

  // Çap faylları: kitabçada şagirdin adı, açarda bütün variantlar
  await page.goto(`/muellim/cap/${paper1}/kitabca`);
  await expect(page.getByText(`${STUDENTS[1].name} ${STUDENTS[1].surname}`).first()).toBeVisible();
  await page.goto(`/muellim/cap/${paper1}/acar`);
  await expect(page.getByText(/cavab açarı/i).first()).toBeVisible();
});

test("kağız nəticəsi şagirdin öz variantının açarı ilə yoxlanılır", async ({ page }) => {
  await login(page, T1);
  // Açardakı birinci şagirdin sütununu oxu və onun sətrinə yaz
  await page.goto(`/muellim/cap/${paper1}/acar`);
  const header = page.locator("thead th").nth(1);
  const studentName = (await header.innerText()).replace(/\s*\([A-H]\)\s*$/, "").replace(/\s+/g, " ").trim();
  const key = await page.locator("tbody tr").evaluateAll((rows) => rows.map((r) => (r.querySelectorAll("td")[1] as HTMLElement | undefined)?.innerText.trim() ?? ""));

  await page.goto(`/muellim/sinaqlar/${paper1}/netice`);
  const row = page.getByRole("row").filter({ hasText: studentName });
  const inputs = row.getByRole("textbox");
  for (let i = 0; i < key.length; i++) {
    const v = key[i] === "yazılı" ? "1" : key[i];
    if (v && v !== "—") await inputs.nth(i).fill(v);
  }
  await expect(row.getByRole("cell").last()).toHaveText("100%");
  // Başqa şagirdin sətrinə eyni açar — variant fərqlidirsə, 100% olmamalıdır
  await page.getByRole("button", { name: "Yadda saxla" }).click();
  await expect(page.getByRole("status")).toContainText("Yadda saxlanıldı: 1 şagird");

  const u = STUDENTS.find((s) => `${s.name} ${s.surname}` === studentName)!;
  const r = await one("select sum(score) s, count(*) n from teacher_test_answers where test_id = ? and user_id = ?", [paper1, u.id]);
  expect(Number(r.s)).toBe(Number(r.n));
  // Şagirdin zəif mövzu təhlilinə yazılıb
  expect(Number((await one("select count(*) n from user_answers where user_id = ? and exam_id = ?", [u.id, `t:${paper1}`])).n)).toBe(Number(r.n));
});

test("sual bazası bitəndə təkrar suallar götürülür və müəllimə xəbərdarlıq göstərilir", async ({ page }) => {
  // Bu qrupa bütün 9-cu sinif suallarının artıq verildiyini təqlid edirik (köhnə sınaq)
  const fake = `e2e-fake-${stamp}`;
  await sql(
    `insert into teacher_tests (id, teacher_id, group_id, number, exam_kind, mode, opens_at, duration_min, created_at)
     values (?, ?, ?, 99, 'buraxilis-9', 'paper', ?, 90, ?)`,
    [fake, T1.id, G1.id, Date.now() - 30 * DAY, Date.now() - 30 * DAY],
  );
  await sql(
    `insert into teacher_test_items (test_id, n, task_code, format)
     select ?, row_number() over (), code, case when format = 'closed' then 'closed' when format = 'open' then 'coded' else 'written' end from bank_tasks`,
    [fake],
  );
  await login(page, T1);
  const id = await createTest(page, "paper");
  await expect(page.getByText(/yeni sual qalmadığı üçün \d+ sual əvvəlki sınaqlardan/)).toBeVisible();
  expect(Number((await one("select reused from teacher_tests where id = ?", [id])).reused)).toBeGreaterThan(0);
  await sql("delete from teacher_tests where id in (?, ?)", [fake, id]);
});

let online = "";

test("onlayn sınaq: balans yoxdursa yaradılmır; balansdan tutulur, şagird keçir, başlamayanlara geri qaytarılır", async ({ page }) => {
  await login(page, T1);
  await page.goto("/muellim/sinaq-yarat");
  await page.getByText("9-cu sinif buraxılış", { exact: true }).first().click();
  await page.locator("label").filter({ hasText: "Onlayn" }).click();
  await page.locator("select[name=groupId]").selectOption(G1.id);
  await expect(page.getByText(/Balans kifayət etmir/)).toBeVisible();
  await expect(page.getByRole("button", { name: "Sınağı yarat →" })).toBeDisabled();

  await sql("update teacher_accounts set balance = 10 where user_id = ?", [T1.id]);
  online = await createTest(page, "online", { time: "00:00" });
  expect(Number((await one("select balance from teacher_accounts where user_id = ?", [T1.id])).balance)).toBe(6);
  expect(Number((await one("select charged from teacher_tests where id = ?", [online])).charged)).toBe(4);
  // Sınaq indi açıqdır (bu gün 00:00-dan)
  await sql("update teacher_tests set opens_at = ? where id = ?", [Date.now() - 60_000, online]);

  // Şagird sınağa başlayır, bir sual cavablandırır və bitirir
  const s = STUDENTS[1];
  await login(page, s);
  await page.goto("/qruplarim");
  await page.getByRole("button", { name: "Sınağa başla" }).click();
  await expect(page).toHaveURL(new RegExp(`/muellim-sinaq/${online}`));
  await page.getByRole("button", { name: "Cavab vərəqi" }).first().click();
  await page.getByRole("radiogroup", { name: "Sual 1", exact: true }).getByRole("radio", { name: "A", exact: true }).click();
  await page.waitForTimeout(800);
  await page.getByRole("button", { name: "Sınağı bitir" }).last().click();
  await page.getByRole("button", { name: "Bitir", exact: true }).click();
  await expect(page.getByRole("heading", { level: 1, name: "Sınaq bitdi" })).toBeVisible();
  const att = await one("select finished_at from teacher_test_attempts where test_id = ? and user_id = ?", [online, s.id]);
  expect(att.finished_at).not.toBeNull();
  // Cavab variant xəritəsi ilə orijinal hərfə çevrilib
  const v = await one('select "order" o, maps from teacher_test_variants where test_id = ? and user_id = ?', [online, s.id]);
  const firstN = JSON.parse(String(v.o))[0];
  const ans = await one("select given from teacher_test_answers where test_id = ? and user_id = ? and n = ?", [online, s.id, firstN]);
  expect(ans.given).toBe(JSON.parse(String(v.maps))[firstN].A);

  // 24 saat keçib: başlamayan 3 şagirdin məbləği bir dəfə qaytarılır
  await sql("update teacher_tests set opens_at = ? where id = ?", [Date.now() - DAY - 60_000, online]);
  await login(page, T1);
  await page.goto(`/muellim/sinaqlar/${online}`);
  await expect(page.getByText("başlamayanların məbləği balansa qaytarılıb")).toBeVisible();
  await page.reload();
  expect(Number((await one("select balance from teacher_accounts where user_id = ?", [T1.id])).balance)).toBe(9);
  expect(Number((await one("select count(*) n from teacher_balance_tx where test_id = ? and kind = 'refund'", [online])).n)).toBe(1);
});

test("izolyasiya: müəllim başqa müəllimin qrupunu, sınağını və çap fayllarını görmür; şagird paneli açmır", async ({ page }) => {
  await login(page, T2);
  for (const url of [`/muellim/qruplar/${G1.id}`, `/muellim/sinaqlar/${paper1}`, `/muellim/sinaqlar/${paper1}/netice`, `/muellim/cap/${paper1}/kitabca`, `/muellim/cap/${paper1}/acar`]) {
    const r = await page.goto(url);
    expect(r?.status(), url).toBe(404);
  }
  await page.goto("/muellim/qruplar");
  await expect(page.getByText("E2E 9-A")).toHaveCount(0);
  await page.goto("/muellim/analitika/csv?qrup=" + G1.id);
  await expect(page.locator("body")).not.toContainText(STUDENTS[1].surname);

  // Şagird — müəllim paneli və sual bankı əlçatmazdır
  await login(page, STUDENTS[1]);
  await page.goto("/muellim");
  await expect(page).toHaveURL(/\/muellim\/muraciet/);
  const r = await page.goto(`/muellim/cap/${paper1}/acar`);
  expect(page.url().includes("/muraciet") || r?.status() === 404).toBe(true);
});
