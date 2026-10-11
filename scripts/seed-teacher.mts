// Müəllim paneli üçün nümunə məlumat (dizaynı yoxlamaq üçün): 1 müəllim, 3 qrup, 60 şagird, 5 sınaq (kağız + onlayn).
//   npm run db:seed-teacher            — yaradır (müəllim: muellim-numune@2vur2.az / Muellim2026)
//   npm run db:seed-teacher -- --clean — nümunə müəllimi və şagirdlərini silir
// Sınaqlar saytın öz məntiqi ilə yaradılır (createTeacherTest, gradeEntries, saveResults).
import nextEnv from "@next/env";

nextEnv.loadEnvConfig(process.cwd());
const { hash } = await import("@node-rs/argon2");
const { createClient } = await import("@libsql/client");
const raw = createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });
const args = new Set(process.argv.slice(2));
const EMAIL = "muellim-numune@2vur2.az";
const PASSWORD = "Muellim2026";

await raw.execute(`delete from users where email = '${EMAIL}' or email like 'sagird-numune+%'`);
if (args.has("--clean")) {
  console.log("Nümunə müəllim və şagirdlər silindi.");
  process.exit(0);
}

const { createTeacherTest } = await import("../src/lib/teacher/create.ts");
const { itemsOf, variantsOf, saveResults } = await import("../src/lib/teacher/data.ts");
const { answerKey, gradeEntries } = await import("../src/lib/teacher/variants.ts");

const now = Date.now();
const DAY = 86_400_000;
const pw = await hash(PASSWORD, { memoryCost: 19456, timeCost: 2, parallelism: 1 });
const teacherId = crypto.randomUUID();
await raw.execute({
  sql: `insert into users (id, email, username, name, surname, password_hash, role, grade, email_verified_at, terms_accepted_at, created_at, updated_at)
        values (?, ?, 'muellim_numune', 'Səbinə', 'Kərimova', ?, 'teacher', null, ?, ?, ?, ?)`,
  args: [teacherId, EMAIL, pw, now, now, now - 60 * DAY, now],
});
await raw.execute({ sql: "insert into teacher_accounts (user_id, balance, daily_limit, created_at) values (?, 60, 50, ?)", args: [teacherId, now] });
await raw.execute({ sql: "insert into teacher_balance_tx (teacher_id, amount, kind, note, created_at) values (?, 60, 'topup', 'Balans artırma (nümunə)', ?)", args: [teacherId, now - 30 * DAY] });

const FIRST = ["Aysel", "Murad", "Nigar", "Elçin", "Ləman", "Rauf", "Səbinə", "Tural", "Günay", "Orxan", "Fidan", "Kamran", "Nərmin", "Vüsal", "Zəhra", "Elvin", "Aytac", "Fərid", "Lalə", "Samir"];
const LAST = ["Məmmədov", "Hüseynov", "Əliyev", "Quliyev", "Rzayev", "Kərimov", "Həsənov", "Abbasov", "İsmayılov", "Nəbiyev"];
const GROUPS = [
  { name: "9-A buraxılış", kind: "buraxilis-9", code: "NUM-9AB", grade: 9 },
  { name: "11-B buraxılış", kind: "buraxilis-11", code: "NUM-11B", grade: 11 },
  { name: "Blok qrupu (I qrup)", kind: "qebul-11", code: "NUM-BLK", grade: 11 },
];
const skill = new Map<string, number>();
const groupIds: string[] = [];
let k = 0;
for (const g of GROUPS) {
  const gid = crypto.randomUUID();
  groupIds.push(gid);
  await raw.execute({ sql: "insert into teacher_groups (id, teacher_id, name, code, created_at) values (?, ?, ?, ?, ?)", args: [gid, teacherId, g.name, g.code, now - 50 * DAY] });
  for (let i = 0; i < 20; i++, k++) {
    const id = crypto.randomUUID();
    const first = FIRST[k % FIRST.length];
    const last = LAST[(k * 7) % LAST.length] + (/[aəeiı]$/.test(first) || ["Nigar", "Günay", "Nərmin", "Aytac", "Fidan", "Lalə", "Ləman", "Səbinə", "Zəhra", "Aysel"].includes(first) ? "a" : "");
    await raw.execute({
      sql: `insert into users (id, email, username, name, surname, password_hash, role, grade, email_verified_at, terms_accepted_at, created_at, updated_at)
            values (?, ?, ?, ?, ?, ?, 'student', ?, ?, ?, ?, ?)`,
      args: [id, `sagird-numune+${k}@example.test`, `sagird_numune_${k}`, first, last, pw, g.grade, now, now, now - 50 * DAY, now],
    });
    await raw.execute({ sql: "insert into teacher_group_members (group_id, user_id, joined_at) values (?, ?, ?)", args: [gid, id, now - 45 * DAY] });
    skill.set(id, 0.3 + ((k * 37) % 60) / 100);
  }
}

/** Şagirdin kağız cavab kartını təqlid edir (bacarığına görə) və nəticəni saytın məntiqi ilə yazır. */
async function fillResults(testId: string, opts: { onlyPart?: number; online?: { startedAt: number } } = {}) {
  const items = await itemsOf(testId);
  const variants = await variantsOf(testId);
  for (const [i, v] of variants.entries()) {
    if (opts.onlyPart && i % opts.onlyPart === 0) continue;
    const p = skill.get(v.userId) ?? 0.5;
    const key = answerKey(v, items);
    const entries = v.order.map((n, j) => {
      const it = items.find((x) => x.n === n)!;
      const r = Math.random();
      if (it.format === "written") return r < p ? "1" : r < p + 0.2 ? "0,5" : "0";
      if (r < p) return key[j];
      if (r > 0.93) return "";
      return it.format === "closed" ? (["A", "B", "C", "D", "E"].filter((l) => l !== key[j])[Math.floor(Math.random() * 4)] ?? "A") : String(Math.floor(Math.random() * 50));
    });
    if (opts.online) {
      await raw.execute({ sql: "insert into teacher_test_attempts (test_id, user_id, started_at, finished_at) values (?, ?, ?, ?)", args: [testId, v.userId, opts.online.startedAt, opts.online.startedAt + 70 * 60_000] });
    }
    await saveResults(testId, v.userId, items, gradeEntries(v, items, entries));
  }
  await raw.execute({ sql: "update teacher_tests set results_at = ? where id = ?", args: [now, testId] });
}

async function make(groupIdx: number[], mode: "paper" | "online", daysAgo: number, kind: "buraxilis-9" | "buraxilis-11" | "qebul-11" | "movzu", topic?: string) {
  const topicId = topic ? Number((await raw.execute({ sql: "select id from topics where slug = ?", args: [topic] })).rows[0]?.id) : undefined;
  const r = await createTeacherTest({
    teacherId,
    groupIds: groupIdx.map((i) => groupIds[i]),
    kind,
    topicId,
    questionCount: topic ? 20 : undefined,
    mode,
    opensAt: new Date(now - daysAgo * DAY),
    durationMin: topic ? 40 : 90,
    shuffle: true,
    noRepeat: true,
  });
  if (!r.ok) throw new Error(`Sınaq yaradılmadı: ${r.error}`);
  await raw.execute({ sql: "update teacher_tests set created_at = ? where id = ?", args: [now - daysAgo * DAY - 3 * DAY, r.id] });
  await raw.execute({ sql: "update teacher_balance_tx set created_at = ? where test_id = ?", args: [now - daysAgo * DAY - 3 * DAY, r.id] });
  return r.id;
}

// 1) 9-A: iki kağız sınağı (biri mövzu sınağı); 2) 11-B + Blok: bir kağız sınağı iki qrupa;
// 3) 11-B: bitmiş onlayn (bir neçəsi başlamayıb); 4) Blok: gələcək tarixli onlayn sınaq.
const t1 = await make([0], "paper", 28, "buraxilis-9");
await fillResults(t1);
const t2 = await make([0], "paper", 7, "movzu", "natural-ededler");
await fillResults(t2);
const t3 = await make([1, 2], "paper", 14, "buraxilis-11");
await fillResults(t3);
const t4 = await make([1], "online", 3, "buraxilis-11");
await fillResults(t4, { onlyPart: 5, online: { startedAt: now - 3 * DAY + 2 * 3600_000 } });
await make([2], "online", -2, "qebul-11");

console.log(`Hazırdır. Müəllim: ${EMAIL} / ${PASSWORD} — /muellim`);
process.exit(0);
