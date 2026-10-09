import { expect, test } from "@playwright/test";

// Google ilə giriş: düymə Google-a düzgün parametrlərlə yönləndirir; Console-dakı callback ünvanı Auth.js-ə ötürülür.
// Real Google səhifəsi açılmır — sorğu tutulur.

test("giriş və qeydiyyat: 'Google ilə' düyməsi Google-a düzgün redirect_uri ilə yönləndirir", async ({ page, baseURL }) => {
  let googleUrl: URL | null = null;
  await page.route("https://accounts.google.com/**", async (route) => {
    googleUrl = new URL(route.request().url());
    await route.fulfill({ status: 200, contentType: "text/html", body: "<title>Google</title>" });
  });

  await page.goto("/qeydiyyat");
  await expect(page.getByRole("button", { name: "Google ilə qeydiyyatdan keç" })).toBeVisible();

  await page.goto("/daxil-ol?next=%2Fsinaqlar");
  await expect(page.getByText("və ya", { exact: true })).toBeVisible();
  await page.getByRole("button", { name: "Google ilə davam et" }).click();
  await expect.poll(() => googleUrl?.host).toBe("accounts.google.com");

  const u = googleUrl!;
  expect(u.searchParams.get("client_id")).toMatch(/\.apps\.googleusercontent\.com$/);
  expect(u.searchParams.get("redirect_uri")).toBe(`${baseURL}/api/auth/google/callback`);
  expect(u.searchParams.get("response_type")).toBe("code");
  expect(u.searchParams.get("scope")).toContain("email");
  // Auth.js Google üçün PKCE istifadə edir.
  expect(u.searchParams.get("code_challenge")).toBeTruthy();
  expect(u.searchParams.get("code_challenge_method")).toBe("S256");
});

test("callback ünvanı (/api/auth/google/callback) Auth.js-ə ötürülür — saxta kod girişə xəta ilə qaytarır", async ({ request }) => {
  const res = await request.get("/api/auth/google/callback?code=fake&state=fake", { maxRedirects: 0 });
  expect(res.status()).toBe(302);
  expect(res.headers()["location"]).toMatch(/\/daxil-ol\?error=/);
});
