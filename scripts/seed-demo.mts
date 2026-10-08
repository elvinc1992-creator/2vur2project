// Demo istifadəçi (təsdiqlənmiş e-poçtla) yaradır və ya yeniləyir.
// Məlumatlar .env.local-dan: DEMO_EMAIL, DEMO_USERNAME, DEMO_PASSWORD.
// İşə salma: npm run db:seed-demo
import { createClient } from "@libsql/client";
import nextEnv from "@next/env";
import { hash } from "@node-rs/argon2";

nextEnv.loadEnvConfig(process.cwd());

const { DEMO_EMAIL, DEMO_USERNAME, DEMO_PASSWORD, TURSO_DATABASE_URL, TURSO_AUTH_TOKEN } = process.env;
if (!DEMO_EMAIL || !DEMO_USERNAME || !DEMO_PASSWORD) {
  throw new Error(".env.local-da DEMO_EMAIL, DEMO_USERNAME, DEMO_PASSWORD yoxdur");
}

const db = createClient({ url: TURSO_DATABASE_URL!, authToken: TURSO_AUTH_TOKEN });
const now = Date.now();
const passwordHash = await hash(DEMO_PASSWORD, { memoryCost: 19456, timeCost: 2, parallelism: 1 });

await db.execute({
  sql: `insert into users (id, email, username, name, password_hash, role, grade, target_exam,
          email_verified_at, terms_accepted_at, created_at, updated_at)
        values (?, ?, ?, 'Demo', ?, 'student', 11, 'both', ?, ?, ?, ?)
        on conflict(email) do update set
          username = excluded.username, password_hash = excluded.password_hash,
          email_verified_at = coalesce(users.email_verified_at, excluded.email_verified_at),
          updated_at = excluded.updated_at`,
  args: [crypto.randomUUID(), DEMO_EMAIL.toLowerCase(), DEMO_USERNAME.toLowerCase(), passwordHash, now, now, now, now],
});

console.log(`Demo istifadəçi hazırdır: ${DEMO_USERNAME} / ${DEMO_EMAIL}`);
db.close();
