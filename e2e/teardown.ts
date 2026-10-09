import { createClient } from "@libsql/client";
import { loadEnvConfig } from "@next/env";

/** e2e istifadəçilərini və lokal IP-nin rate limit sayğaclarını silir. */
export default async function teardown() {
  loadEnvConfig(process.cwd());
  const db = createClient({
    url: process.env.TURSO_DATABASE_URL!,
    authToken: process.env.TURSO_AUTH_TOKEN,
  });
  // E-poçtsuz qeydiyyat (UI) — istifadəçi adı e2e_ ilə başlayır.
  const testUsers = "select id from users where email like 'e2e+%@example.test' or username like 'e2e\\_%' escape '\\'";
  await db.batch(
    [
      `delete from email_verification_tokens where user_id in (${testUsers})`,
      `delete from password_reset_tokens where user_id in (${testUsers})`,
      `delete from oauth_accounts where user_id in (${testUsers})`,
      `delete from user_answers where user_id in (${testUsers})`,
      `delete from user_state where user_id in (${testUsers})`,
      `delete from rate_limits where key like '%e2e%'
         or key in (select 'verify-resend:' || id from users where email like 'e2e+%@example.test')
         or key in (select 'verify-resend:hour:' || id from users where email like 'e2e+%@example.test')
         or key like '%:ip:::1' or key like '%:ip:127.0.0.1' or key like '%:ip:::ffff:127.0.0.1'
         or key like '%:ip:unknown'`,
      `delete from email_codes where user_id in (${testUsers})`,
      `delete from users where email like 'e2e+%@example.test' or username like 'e2e\\_%' escape '\\'`,
    ],
    "write",
  );
  db.close();
}
