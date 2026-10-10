// Müəllifin sual bankını (topic_questions/) Turso-ya yükləyir.
// İşə salma: npm run bank:import [-- qovluq]
//
// - question_bank_v2.sql → subtopics (alt mövzular = toplu bölmələri; yalnız INSERT INTO subtopics sətirləri)
// - tasks_*.sql → bank_tasks. Fayllar PostgreSQL üçündür: yaddaşdakı SQLite-də (::jsonb təmizlənərək) işə salınır,
//   nəticə Turso-ya yazılır — faylları əl ilə çevirmək lazım deyil. Yeni mövzunun faylını qovluğa qoyub təkrar işə salın.
// - imtahan_27_movzu_numune_suallar.json → exam_samples (imtahan sualı) + exam_counterparts (qarsiligi — bizim qarşılıq)
// İdempotentdir (upsert). Mövzu adı bazada yoxdursa, idxal dayanır.
import { createClient, type InStatement } from "@libsql/client";
import nextEnv from "@next/env";
import { copyFileSync, mkdirSync, readFileSync, readdirSync } from "node:fs";
import path from "node:path";

nextEnv.loadEnvConfig(process.cwd());

const DIR = process.argv[2] ?? "topic_questions";
const db = createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });
const mem = createClient({ url: ":memory:" });

const read = (f: string) => readFileSync(path.join(DIR, f), "utf8");
// Alt qovluqlar da oxunur (questions/<mövzu>/tasks_*.sql, images_*/KOD.png).
const files = (readdirSync(DIR, { recursive: true }) as string[]).map((f) => f.split(path.sep).join("/"));
const base = (f: string) => path.posix.basename(f);
const depth = (f: string) => f.split("/").length;

async function batched(stmts: InStatement[], size = 50) {
  for (let i = 0; i < stmts.length; i += size) await db.batch(stmts.slice(i, i + size), "write");
}

/* ---------------- Mövzular ---------------- */
const topicRows = (await db.execute("select id, name from topics")).rows;
const topicId = new Map(topicRows.map((r) => [String(r.name), Number(r.id)]));
const needTopic = (name: string, where: string) => {
  const id = topicId.get(name);
  if (!id) throw new Error(`Mövzu bazada yoxdur: "${name}" (${where})`);
  return id;
};

/* ---------------- Alt mövzular ---------------- */
// Bir neçə nüsxə olarsa, ən dərindəki (questions/ içindəki) götürülür.
const bankFile = files.filter((f) => /^question_bank.*\.sql$/.test(base(f))).sort((a, b) => depth(b) - depth(a))[0];
if (bankFile) {
  const re =
    /INSERT INTO subtopics\(topic_id,book_id,title,start_page,page_verified,sort_order\) SELECT t\.id,b\.id,'((?:[^']|'')*)',(\d+),(true|false),(\d+) FROM topics t, books b WHERE t\.name='((?:[^']|'')*)' AND b\.year=(\d+) AND b\.part='(I+)'/g;
  const subs = [...read(bankFile).matchAll(re)].map((m) => ({
    title: m[1].replace(/''/g, "'"),
    page: Number(m[2]),
    verified: m[3] === "true" ? 1 : 0,
    sort: Number(m[4]),
    topic: m[5].replace(/''/g, "'"),
    year: Number(m[6]),
    part: m[7],
  }));
  await batched(
    subs.map((s) => ({
      sql: `insert into subtopics (topic_id, book_year, book_part, title, start_page, page_verified, sort_order)
            values (?, ?, ?, ?, ?, ?, ?)
            on conflict(topic_id, title) do update set book_year = excluded.book_year, book_part = excluded.book_part,
              start_page = excluded.start_page, page_verified = excluded.page_verified, sort_order = excluded.sort_order`,
      args: [needTopic(s.topic, bankFile), s.year, s.part, s.title, s.page, s.verified, s.sort],
    })),
  );
  console.log(`subtopics: ${subs.length}`);
}

/* ---------------- Sual bankı (tasks_*.sql → yaddaşdakı SQLite → bank_tasks) ---------------- */
const subRows = (await db.execute("select id, topic_id, title from subtopics")).rows;
await mem.executeMultiple(`
  create table topics (id integer primary key, name text unique);
  create table subtopics (id integer primary key, topic_id integer, title text);
  create table tasks (
    seq integer primary key autoincrement, code text unique, image_url text, image_alt text, topic_id integer, subtopic_id integer,
    origin text, rights_status text, language text, status text, format text, body_md text, options text, correct_option text,
    matching_answer text, answer_value text, solution_md text, based_on_year integer, based_on_part text, based_on_page integer,
    based_on_task_no integer, difficulty integer
  );`);
await mem.batch(
  [
    ...topicRows.map((r) => ({ sql: "insert into topics (id, name) values (?, ?)", args: [r.id, r.name] })),
    ...subRows.map((r) => ({ sql: "insert into subtopics (id, topic_id, title) values (?, ?, ?)", args: [r.id, r.topic_id, r.title] })),
  ],
  "write",
);

const taskFiles = files.filter((f) => /^tasks_.*\.sql$/.test(base(f))).sort((a, b) => base(a).localeCompare(base(b)));
// Tədris sırası: tasks_NN faylının nömrəsi (01 — Natural ədədlər…) → topics.curriculum_order.
const curriculum: InStatement[] = [];
for (const f of taskFiles) {
  const before = Number((await mem.execute("select coalesce(max(seq), 0) m from tasks")).rows[0].m);
  const sqlText = read(f)
    .replace(/^\s*(BEGIN|COMMIT);\s*$/gim, "")
    .replace(/::jsonb/g, "");
  await mem.executeMultiple(sqlText);
  const no = Number(base(f).match(/^tasks_(\d+)/)?.[1]);
  if (!no) continue;
  const ids = (await mem.execute({ sql: "select distinct topic_id from tasks where seq > ?", args: [before] })).rows;
  for (const r of ids) if (r.topic_id) curriculum.push({ sql: "update topics set curriculum_order = ? where id = ?", args: [no, r.topic_id] });
}
await batched(curriculum);
const tasks = (await mem.execute("select * from tasks order by seq")).rows;
const missing = tasks.filter((t) => !t.topic_id).map((t) => t.code);
if (missing.length) throw new Error(`Mövzusu tapılmayan suallar: ${missing.join(", ")}`);

await batched(
  tasks.map((t) => ({
    sql: `insert into bank_tasks (code, topic_id, subtopic_id, format, body, options, correct_option, matching_answer, answer_value,
            solution, image_url, image_alt, difficulty, based_on_year, based_on_part, based_on_page, based_on_task_no, status, sort_order)
          values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
          on conflict(code) do update set topic_id = excluded.topic_id, subtopic_id = excluded.subtopic_id, format = excluded.format,
            body = excluded.body, options = excluded.options, correct_option = excluded.correct_option,
            matching_answer = excluded.matching_answer, answer_value = excluded.answer_value, solution = excluded.solution,
            image_url = excluded.image_url, image_alt = excluded.image_alt, difficulty = excluded.difficulty,
            based_on_year = excluded.based_on_year, based_on_part = excluded.based_on_part, based_on_page = excluded.based_on_page,
            based_on_task_no = excluded.based_on_task_no, status = excluded.status, sort_order = excluded.sort_order`,
    args: [
      t.code, t.topic_id, t.subtopic_id, t.format, t.body_md, t.options, t.correct_option, t.matching_answer, t.answer_value,
      t.solution_md, t.image_url, t.image_alt, t.difficulty, t.based_on_year, t.based_on_part, t.based_on_page, t.based_on_task_no,
      t.status ?? "draft", Number(t.seq),
    ],
  })),
);
const byFormat = tasks.reduce<Record<string, number>>((acc, t) => ((acc[String(t.format)] = (acc[String(t.format)] ?? 0) + 1), acc), {});
console.log(`bank_tasks: ${tasks.length} (${taskFiles.length} fayl) —`, byFormat);

// Fayllardan çıxarılmış suallar bazada qalmasın (heç bir yerdə istifadə olunmasın).
if (tasks.length) {
  const codes = tasks.map((t) => String(t.code));
  const removed = await db.execute({
    sql: `delete from bank_tasks where code not in (${codes.map(() => "?").join(",")})`,
    args: codes,
  });
  if (removed.rowsAffected) console.log(`bank_tasks: ${removed.rowsAffected} köhnə sual silindi`);
}

// Şəkillər: images_*/KOD.png → public/images/tasks/KOD.png (bank_tasks.image_url = /images/tasks/KOD.png).
const images = files.filter((f) => /\.(png|jpe?g|svg|webp)$/i.test(f));
mkdirSync("public/images/tasks", { recursive: true });
for (const f of images) copyFileSync(path.join(DIR, f), path.join("public/images/tasks", base(f)));
const missingImages = tasks
  .map((t) => (t.image_url ? base(String(t.image_url)) : null))
  .filter((n): n is string => !!n && !images.some((f) => base(f) === n));
console.log(`şəkillər: ${images.length} kopyalandı${missingImages.length ? `; tapılmayan: ${missingImages.join(", ")}` : ""}`);

/* ---------------- İmtahan nümunələri ---------------- */
const examFile = files.find((f) => /^imtahan.*\.json$/.test(base(f)));
if (examFile) {
  type Counterpart = { q: string; opts: string[]; ans: string; sekil_tikz?: string };
  type Sample = {
    n: number; topic: string; year: number; exam: string; qno: number; type: string; toplu: string; match: string; q: string; opts: string[]; ans: string;
    qarsiligi?: Counterpart | Counterpart[];
  };
  const counterparts = (s: Sample) => (Array.isArray(s.qarsiligi) ? s.qarsiligi : s.qarsiligi ? [s.qarsiligi] : []);
  const samples = JSON.parse(read(examFile)) as Sample[];
  await batched(
    samples.map((s) => ({
      sql: `insert into exam_samples (n, topic_id, year, exam, question_no, type, toplu, match_level, question, options, answer)
            values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            on conflict(n) do update set topic_id = excluded.topic_id, year = excluded.year, exam = excluded.exam,
              question_no = excluded.question_no, type = excluded.type, toplu = excluded.toplu, match_level = excluded.match_level,
              question = excluded.question, options = excluded.options, answer = excluded.answer`,
      args: [s.n, needTopic(s.topic, examFile), s.year, s.exam, s.qno, s.type, s.toplu, s.match, s.q, JSON.stringify(s.opts), s.ans],
    })),
  );
  console.log(`exam_samples: ${samples.length}`);

  // Qarşılıqlar: faylda artıq olmayanlar silinir, qalanlar upsert (exam_n + sıra).
  const cps = samples.flatMap((s) => counterparts(s).map((c, i) => ({ s, c, i })));
  await batched([
    ...samples.map((s) => ({ sql: "delete from exam_counterparts where exam_n = ? and sort_order >= ?", args: [s.n, counterparts(s).length] })),
    ...cps.map(({ s, c, i }) => ({
      sql: `insert into exam_counterparts (exam_n, topic_id, question, options, answer, figure_tikz, sort_order)
            values (?, ?, ?, ?, ?, ?, ?)
            on conflict(exam_n, sort_order) do update set topic_id = excluded.topic_id, question = excluded.question,
              options = excluded.options, answer = excluded.answer, figure_tikz = excluded.figure_tikz`,
      args: [s.n, needTopic(s.topic, examFile), c.q, JSON.stringify(c.opts), c.ans, c.sekil_tikz ?? null, i],
    })),
  ]);
  console.log(`exam_counterparts: ${cps.length}`);
}

/* ---------------- İmtahan quruluşu (sual tipləri üzrə bölgü) ---------------- */
const blueprintFile = files.find((f) => /^sual_tipleri.*\.txt$/.test(base(f)));
if (blueprintFile) {
  // "9-cu sinif buraxılış | 15 (№61-75), 60% | 6 (№76-81), 24% | 4 (№82-85), 16% | 25"
  const SECTION = /^(\d+)\s*\(№(\d+)\s*[-–]\s*(\d+)\)/;
  const FORMATS = ["closed", "open", "written"] as const;
  const rows = read(blueprintFile)
    .split(/\r?\n/)
    .map((l) => l.split("|").map((c) => c.trim()))
    .filter((c) => c.length === 5 && /sinif/.test(c[0]));
  const stmts: InStatement[] = [];
  rows.forEach((c, i) => {
    const grade = Number(c[0].match(/^(\d+)/)?.[1]);
    const kind = /qəbul|blok/i.test(c[0]) ? "qebul" : "buraxilis";
    const key = `${kind}-${grade}`;
    const total = Number(c[4]);
    const sections = c.slice(1, 4).map((s, j) => {
      const m = s.match(SECTION);
      if (!m) throw new Error(`Sətir oxunmadı: "${s}" (${blueprintFile})`);
      return { format: FORMATS[j], count: Number(m[1]), first: Number(m[2]), last: Number(m[3]) };
    });
    const sum = sections.reduce((a, s) => a + s.count, 0);
    if (sum !== total) console.warn(`⚠ ${c[0]}: bölmələrin cəmi ${sum}, ümumi say ${total}`);
    stmts.push({
      sql: `insert into exam_blueprints (key, name, grade, kind, subject, total_questions, sort_order) values (?, ?, ?, ?, 'Riyaziyyat', ?, ?)
            on conflict(key) do update set name = excluded.name, grade = excluded.grade, kind = excluded.kind,
              total_questions = excluded.total_questions, sort_order = excluded.sort_order`,
      args: [key, c[0], grade, kind, total, i],
    });
    sections.forEach((s, j) =>
      stmts.push({
        sql: `insert into exam_blueprint_sections (blueprint_key, format, question_count, first_no, last_no, sort_order) values (?, ?, ?, ?, ?, ?)
              on conflict(blueprint_key, format) do update set question_count = excluded.question_count,
                first_no = excluded.first_no, last_no = excluded.last_no, sort_order = excluded.sort_order`,
        args: [key, s.format, s.count, s.first, s.last, j],
      }),
    );
  });
  await batched(stmts);
  console.log(`exam_blueprints: ${rows.length}`);
}

db.close();
mem.close();
