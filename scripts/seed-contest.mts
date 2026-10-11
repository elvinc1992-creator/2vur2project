// Riyaziyyat yarışı: açılış yarışı (20 sual şablonu, mükafatlar) və istəyə görə nümunə məlumat.
//   npm run db:seed-contest              — açılış yarışı (yoxdursa yaradır; şablonları yeniləyir)
//   npm run db:seed-contest -- --demo    — gizli nümunə yarışı: ~300 qeydiyyat, ~200 nəticə (dizaynı yoxlamaq üçün)
//   npm run db:seed-contest -- --clean   — nümunə yarışını və onun test istifadəçilərini silir
import { createClient, type InStatement } from "@libsql/client";
import nextEnv from "@next/env";
import { OPENING_TEMPLATES } from "../src/lib/contest/templates.ts";

nextEnv.loadEnvConfig(process.cwd());
const db = createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });
const args = new Set(process.argv.slice(2));
const baku = (iso: string) => new Date(`${iso}+04:00`).getTime();

const topicId = new Map((await db.execute("select id, slug from topics")).rows.map((r) => [String(r.slug), Number(r.id)]));

async function upsertContest(c: { id: string; slug: string; title: string; status: string; reg: [string, string]; start: string; awards?: string }) {
  await db.execute({
    sql: `insert into contests (id, slug, title, description, reg_start_at, reg_end_at, start_at, entry_window_min, duration_min, question_count,
            finalist_count, prize_fund, boost_threshold, boost_first_prize, status, awards_at, created_at)
          values (?, ?, ?, '', ?, ?, ?, 10, 25, 20, 25, 550, 500, 500, ?, ?, ?)
          on conflict(id) do nothing`,
    args: [c.id, c.slug, c.title, baku(c.reg[0]), baku(c.reg[1]), baku(c.start), c.status, c.awards ? baku(c.awards) : null, Date.now()],
  });
  const prizes: InStatement[] = [
    { sql: "delete from contest_prizes where contest_id = ?", args: [c.id] },
    ...(
      [
        [1, 1, 300, "+ 6 ay Premium"],
        [2, 2, 150, "+ 3 ay Premium"],
        [3, 3, 100, "+ 3 ay Premium"],
        [4, 10, null, "1 ay pulsuz Pro abunə"],
      ] as const
    ).map(([from, to, amount, d]) => ({
      sql: "insert into contest_prizes (contest_id, place_from, place_to, amount, description) values (?, ?, ?, ?, ?)",
      args: [c.id, from, to, amount, d],
    })),
    ...OPENING_TEMPLATES.map((t, i) => ({
      sql: `insert into contest_templates (contest_id, n, topic_id, body, vars, condition, answer, distractors, solution, time_sec)
            values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            on conflict(contest_id, n) do update set topic_id = excluded.topic_id, body = excluded.body, vars = excluded.vars,
              condition = excluded.condition, answer = excluded.answer, distractors = excluded.distractors,
              solution = excluded.solution, time_sec = excluded.time_sec`,
      args: [c.id, i + 1, topicId.get(t.topic) ?? null, t.body, JSON.stringify(t.vars), t.condition ?? null, t.answer, JSON.stringify(t.distractors), t.solution ?? "", t.timeSec ?? 75],
    })),
  ];
  await db.batch(prizes, "write");
}

const DEMO = "yaris-numune";

if (args.has("--clean")) {
  await db.execute({ sql: "delete from users where id in (select user_id from contest_registrations where contest_id = ?) and email like 'yaris-numune+%'", args: [DEMO] });
  await db.execute({ sql: "delete from contests where id = ?", args: [DEMO] });
  console.log("Nümunə yarışı silindi.");
} else if (args.has("--demo")) {
  // Gizli (qaralama) yarış — yalnız admin görür: /yaris/numune
  await upsertContest({ id: DEMO, slug: "numune", title: "2vur2 Riyaziyyat Yarışı (nümunə)", status: "draft", reg: ["2026-09-01T00:00:00", "2026-09-20T23:59:00"], start: "2026-09-21T20:00:00", awards: "2026-10-01T12:00:00" });
  const FIRST = ["Aysel", "Murad", "Nigar", "Elçin", "Ləman", "Rauf", "Səbinə", "Tural", "Günay", "Orxan", "Fidan", "Kamran", "Nərmin", "Vüsal", "Zəhra", "Elvin", "Aytac", "Fərid", "Lalə", "Samir"];
  const LAST = ["Məmmədova", "Hüseynov", "Əliyeva", "Quliyev", "Rzayeva", "Kərimov", "Həsənova", "Abbasov", "İsmayılova", "Nəbiyev"];
  const PLACES = [
    ["Bakı, Nəsimi", "20 nömrəli məktəb"],
    ["Bakı, Yasamal", "132 nömrəli məktəb"],
    ["Sumqayıt", "4 nömrəli məktəb"],
    ["Gəncə", "1 nömrəli lisey"],
    ["Şəki", "2 nömrəli məktəb"],
    ["Lənkəran", "5 nömrəli məktəb"],
    ["Bakı, Xətai", "189 nömrəli məktəb"],
    ["Mingəçevir", "3 nömrəli məktəb"],
  ];
  let seed = 7;
  const rand = () => ((seed = (seed * 1103515245 + 12345) % 2 ** 31) / 2 ** 31);
  const now = Date.now();
  const stmts: InStatement[] = [];
  for (let i = 1; i <= 300; i++) {
    const uid = `yaris-numune-u${i}`;
    const rid = `yaris-numune-r${i}`;
    const [region, school] = PLACES[Math.floor(rand() * PLACES.length)];
    const first = FIRST[Math.floor(rand() * FIRST.length)];
    const last = LAST[Math.floor(rand() * LAST.length)];
    stmts.push({
      sql: "insert or ignore into users (id, email, username, name, surname, role, grade, created_at, updated_at) values (?, ?, ?, ?, ?, 'student', ?, ?, ?)",
      args: [uid, `yaris-numune+${i}@2vur2.test`, `yaris_numune_${i}`, first, last, 9 + (i % 3), now, now],
    });
    stmts.push({
      sql: `insert or ignore into contest_registrations (id, contest_id, user_id, first_name, last_name, grade, region, school, email, invite_code,
              agree_rules, agree_parent, agree_email, created_at) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1, 1, 1, ?)`,
      args: [rid, DEMO, uid, first, last, 9 + (i % 3), region, school, `yaris-numune+${i}@2vur2.test`, `2V2-N${String(i).padStart(4, "0")}`, now],
    });
    if (i <= 200) {
      const score = Math.max(2, Math.min(20, Math.round(8 + rand() * 12 - (i % 7))));
      stmts.push({
        sql: "insert or ignore into contest_results (registration_id, contest_id, score, total_ms) values (?, ?, ?, ?)",
        args: [rid, DEMO, score, Math.round(900_000 + rand() * 600_000)],
      });
    }
  }
  for (let k = 0; k < stmts.length; k += 200) await db.batch(stmts.slice(k, k + 200), "write");
  // Yer və finalçılar (bərabər bal — az vaxt; bal və vaxt eynidirsə — bölüşdürülür)
  const rows = (await db.execute({ sql: "select registration_id id, score, total_ms t from contest_results where contest_id = ? order by score desc, total_ms asc", args: [DEMO] })).rows;
  const upd: InStatement[] = [];
  const places: number[] = [];
  rows.forEach((r, i) => {
    const prev = i > 0 ? rows[i - 1] : null;
    const place = prev && prev.score === r.score && prev.t === r.t ? places[i - 1] : i + 1;
    places.push(place);
    upd.push({ sql: "update contest_results set place = ?, finalist = ? where registration_id = ?", args: [place, place <= 25 ? 1 : 0, r.id] });
  });
  for (let k = 0; k < upd.length; k += 200) await db.batch(upd.slice(k, k + 200), "write");
  await db.execute({ sql: "update contests set results_computed_at = ? where id = ?", args: [now, DEMO] });
  console.log(`Nümunə yarışı: 300 qeydiyyat, ${rows.length} nəticə — /yaris/numune (yalnız admin).`);
} else {
  await upsertContest({
    id: "acilis-2026",
    slug: "acilis-2026",
    title: "2vur2 Riyaziyyat Açılış Yarışı",
    status: "registration",
    reg: ["2026-10-11T00:00:00", "2026-11-24T23:59:00"],
    start: "2026-11-25T20:00:00",
    awards: "2026-12-10T12:00:00",
  });
  console.log(`Açılış yarışı hazırdır: /yaris (${OPENING_TEMPLATES.length} sual şablonu).`);
}
db.close();
