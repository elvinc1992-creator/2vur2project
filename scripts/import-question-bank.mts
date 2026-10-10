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
import { readFileSync, readdirSync } from "node:fs";
import path from "node:path";

nextEnv.loadEnvConfig(process.cwd());

const DIR = process.argv[2] ?? "topic_questions";
const db = createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });
const mem = createClient({ url: ":memory:" });

const read = (f: string) => readFileSync(path.join(DIR, f), "utf8");
const files = readdirSync(DIR);

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
const bankFile = files.find((f) => /^question_bank.*\.sql$/.test(f));
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

const taskFiles = files.filter((f) => /^tasks_.*\.sql$/.test(f)).sort();
for (const f of taskFiles) {
  const sqlText = read(f)
    .replace(/^\s*(BEGIN|COMMIT);\s*$/gim, "")
    .replace(/::jsonb/g, "");
  await mem.executeMultiple(sqlText);
}
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

/* ---------------- İmtahan nümunələri ---------------- */
const examFile = files.find((f) => /\.json$/.test(f));
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

db.close();
mem.close();
