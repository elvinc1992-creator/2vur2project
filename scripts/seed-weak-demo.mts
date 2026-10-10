// "Zəif mövzular" üçün nümunə məlumat: 1 şagird, 6 riyaziyyat mövzusu, ~200 cəhd (son 30 gün).
// İşə salma: npm run db:seed-weak  — hər dəfə şagird yenidən yaradılır (köhnə nümunə cəhdləri silinir).
// Giriş: istifadəçi adı "numune_zeif", şifrə — .env.local-dakı WEAK_DEMO_PASSWORD və ya təsadüfi (ekrana çıxır).
import { createClient, type InStatement } from "@libsql/client";
import nextEnv from "@next/env";
import { hash } from "@node-rs/argon2";

nextEnv.loadEnvConfig(process.cwd());

const db = createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });
const USERNAME = "numune_zeif";
const password = process.env.WEAK_DEMO_PASSWORD ?? `Zeif-${crypto.randomUUID().slice(0, 8)}`;
const DAY = 86_400_000;
const now = Date.now();
const LETTERS = ["A", "B", "C", "D", "E"];

// Mövzu → [ilk 15 gündə düzgün payı, son 15 gündə düzgün payı, cəhd sayı]
const PLAN: Array<[string, number, number, number]> = [
  ["faiz-nisbet-tenasub", 0.25, 0.42, 45],
  ["rasional-kesrler", 0.3, 0.45, 35],
  ["ucbucaqlar", 0.35, 0.5, 30],
  ["coxhedlinin-vuruqlara-ayrilmasi", 0.4, 0.55, 30],
  ["ededi-ardicilliqlar-silsileler", 0.55, 0.7, 30],
  ["tam-cebri-ifadeler", 0.75, 0.9, 30],
];

// Sabit təsadüfilik (nəticə hər dəfə eyni olsun).
let seed = 20261010;
const rand = () => ((seed = (seed * 1103515245 + 12345) % 2 ** 31) / 2 ** 31);

const old = await db.execute({ sql: "select id from users where username = ?", args: [USERNAME] });
if (old.rows[0]) await db.execute({ sql: "delete from users where id = ?", args: [old.rows[0].id] });

const uid = crypto.randomUUID();
await db.execute({
  sql: `insert into users (id, username, name, surname, password_hash, role, grade, target_exam, terms_accepted_at, created_at, updated_at)
        values (?, ?, 'Nümunə', 'Şagird', ?, 'student', 11, 'buraxilis', ?, ?, ?)`,
  args: [uid, USERNAME, await hash(password, { memoryCost: 19456, timeCost: 2, parallelism: 1 }), now, now, now],
});

const rows: InStatement[] = [];
for (const [slug, early, late, count] of PLAN) {
  const tasks = (
    await db.execute({
      sql: `select b.code, b.correct_option from bank_tasks b join topics t on t.id = b.topic_id
            where t.slug = ? and b.format = 'closed' order by b.sort_order`,
      args: [slug],
    })
  ).rows;
  if (!tasks.length) throw new Error(`Mövzuda sual yoxdur: ${slug}`);
  for (let i = 0; i < count; i++) {
    const daysAgo = Math.floor(29 - (i / count) * 29);
    const p = daysAgo >= 15 ? early : late;
    const task = tasks[i % tasks.length];
    const correct = rand() < p;
    const key = String(task.correct_option);
    const wrong = LETTERS.filter((l) => l !== key);
    const guess = correct && rand() < 0.15; // təxmini düz cavab: çox tez, ya cavab dəyişib
    rows.push({
      sql: `insert into user_answers (user_id, source, question_ref, correct, answered_at, topic_slug, chosen, time_ms, changes, flagged)
            values (?, 'review', ?, ?, ?, ?, ?, ?, ?, ?)`,
      args: [
        uid,
        // Hər cəhd ayrıca sətir (eyni sual bir neçə dəfə həll oluna bilər — "w:" məşq istinadı)
        `w:seed-${slug}-${i}:${String(task.code)}`,
        correct ? 1 : 0,
        now - daysAgo * DAY - Math.floor(rand() * 8 * 3_600_000),
        slug,
        correct ? key : wrong[Math.floor(rand() * wrong.length)],
        guess ? 3000 + Math.floor(rand() * 4000) : 40_000 + Math.floor(rand() * 80_000),
        guess && rand() < 0.5 ? 2 : rand() < 0.1 ? 1 : 0,
        guess && rand() < 0.3 ? 1 : 0,
      ],
    });
  }
}
for (let i = 0; i < rows.length; i += 50) await db.batch(rows.slice(i, i + 50), "write");

console.log(`Nümunə şagird: ${USERNAME} / ${password} — ${rows.length} cəhd, ${PLAN.length} mövzu.`);
console.log("Səhifə: /zeif-movzular (ilk açılışda nəticələr və 30 günlük tarixçə hesablanıb bazaya yazılır).");
db.close();
