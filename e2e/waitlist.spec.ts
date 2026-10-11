import { expect, test } from "@playwright/test";
import { connect } from "./daily-fixture";

// Production ana səhifəsi (public/ana-sehife.html): gözləmə siyahısı forması bazaya yazır; səhv məlumat qəbul olunmur.
// (Production-da "/" bu fayla yönlənir — qərar funksiyası unit testdə: src/lib/landing-mode.test.ts.)
const stamp = Date.now();
const email = `e2e+wl${stamp}@example.test`;

async function sql(q: string, args: unknown[] = []) {
  const db = connect();
  const r = await db.execute({ sql: q, args: args as never });
  db.close();
  return r;
}

test.afterAll(async () => {
  await sql("delete from waitlist where email like 'e2e+wl%@example.test'");
});

test("ana səhifə: gözləmə siyahısına qoşulma bazaya yazılır", async ({ page }) => {
  await page.goto("/ana-sehife.html");
  await expect(page).toHaveTitle(/2vur2\.az/);
  await expect(page.getByText("2vur2.az saytına məxsusdur")).toBeVisible();
  const form = page.locator("#form");
  await form.getByPlaceholder("Adın").fill("Aysel");
  await form.getByPlaceholder("ad@mail.com").fill(email);
  // Razılıq yoxdursa — göndərilmir
  await form.getByRole("button", { name: /Siyahıya qoşul/ }).click();
  await expect(page.locator("#err")).toContainText("razılığı");
  await form.locator("select[name=sinif]").selectOption("XI sinif");
  await form.locator("input[name=razi]").check();
  await form.getByRole("button", { name: /Siyahıya qoşul/ }).click();
  await expect(page.getByText("Siyahıdasan!")).toBeVisible();
  const row = (await sql("select name, role, grade, consent from waitlist where email = ?", [email])).rows[0];
  expect([row.name, row.role, row.grade, Number(row.consent)]).toEqual(["Aysel", "sagird", "XI sinif", 1]);

  // Səhv məlumat — 400; təkrar e-poçt — yenilənir (təkrar sətir yox)
  expect((await page.request.post("/api/waitlist", { data: { name: "", email: "x", role: "sagird", consent: true } })).status()).toBe(400);
  expect((await page.request.post("/api/waitlist", { data: { name: "Aysel M.", email, role: "valideyn", consent: true } })).ok()).toBe(true);
  expect((await sql("select count(*) n, max(role) r from waitlist where email = ?", [email])).rows[0]).toMatchObject({ n: 1, r: "valideyn" });
});
