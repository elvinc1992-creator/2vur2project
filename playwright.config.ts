import { defineConfig, devices } from "@playwright/test";

export default defineConfig({
  testDir: "./e2e",
  // Testlər eyni bazanı və rate limit sayğaclarını istifadə edir — ardıcıl işləyir.
  workers: 1,
  timeout: 60_000,
  expect: { timeout: 10_000 },
  reporter: [["list"]],
  globalTeardown: "./e2e/teardown.ts",
  use: {
    baseURL: "http://localhost:3000",
    // Sistemdəki Google Chrome — ayrıca brauzer yükləmək lazım deyil.
    channel: "chrome",
    trace: "retain-on-failure",
  },
  projects: [{ name: "chrome", use: { ...devices["Desktop Chrome"], channel: "chrome" } }],
  webServer: {
    command: "npm run dev",
    url: "http://localhost:3000",
    reuseExistingServer: true,
    timeout: 120_000,
  },
});
