// Sual bankından sınaqlar yaradır (hər imtahan tipi üçün N sınaq; mövcud sınaqlara əlavə olunur).
// İşə salma: npm run exams:generate [-- N]   (N — hər tip üçün yeni sınaq sayı, ilkin 4)
// Qaydalar: src/lib/exams/generate.ts (sual_tipleri_cedveli.txt + dim-movzular.md → exam_blueprint_sections, topics.exam_types).
import { createClient } from "@libsql/client";
import nextEnv from "@next/env";
import { generateExam, type ExamType, type GenSection } from "../src/lib/exams/generate.ts";

nextEnv.loadEnvConfig(process.cwd());

const N = Number(process.argv[2] ?? 4);
const db = createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });
const TYPE: Record<string, ExamType> = { "buraxilis-9": "9", "buraxilis-11": "11", "qebul-11": "blok" };
const TITLE: Record<string, string> = {
  "buraxilis-9": "9-cu sinif buraxılış sınağı",
  "buraxilis-11": "11-ci sinif buraxılış sınağı",
  "qebul-11": "Blok (qəbul) sınağı",
};
const PREFIX: Record<string, string> = { "buraxilis-9": "b9", "buraxilis-11": "b11", "qebul-11": "q11" };
const DURATION: Record<string, number> = { "buraxilis-9": 90, "buraxilis-11": 90, "qebul-11": 120 };

const topics = (await db.execute("select id, curriculum_order, dim_frequency, exam_types from topics")).rows.map((t) => ({
  id: Number(t.id),
  curriculumOrder: Number(t.curriculum_order),
  dimFrequency: Number(t.dim_frequency),
  examTypes: String(t.exam_types).split(",") as ExamType[],
}));
const tasks = (await db.execute("select code, topic_id, format, answer_value, options from bank_tasks")).rows.map((t) => ({
  code: String(t.code),
  topicId: Number(t.topic_id),
  format: String(t.format),
  answerValue: t.answer_value === null ? null : String(t.answer_value),
  hasOptions: t.options !== null,
}));

for (const key of Object.keys(TYPE)) {
  const sections: GenSection[] = (
    await db.execute({ sql: "select format, question_count, first_no from exam_blueprint_sections where blueprint_key = ? order by sort_order", args: [key] })
  ).rows.map((s) => ({
    format: s.format === "closed" ? "closed" : s.format === "open" ? "coded" : "written",
    count: Number(s.question_count),
    firstNo: Number(s.first_no),
  }));
  for (let k = 0; k < N; k++) {
    const usage = new Map(
      (
        await db.execute({
          sql: "select i.task_code code, count(*) n from exam_items i join exams e on e.id = i.exam_id where e.blueprint_key = ? group by i.task_code",
          args: [key],
        })
      ).rows.map((r) => [String(r.code), Number(r.n)]),
    );
    const items = generateExam({ sections, examType: TYPE[key], topics, tasks, usage });
    const last = Number((await db.execute({ sql: "select coalesce(max(number), 0) n from exams where blueprint_key = ?", args: [key] })).rows[0].n);
    const number = last + 1;
    const id = `${PREFIX[key]}-${number}`;
    await db.batch(
      [
        {
          sql: "insert into exams (id, blueprint_key, number, title, duration_min, status, created_at) values (?, ?, ?, ?, ?, 'published', ?)",
          args: [id, key, number, `${TITLE[key]} №${number}`, DURATION[key], Date.now()],
        },
        ...items.map((i) => ({ sql: "insert into exam_items (exam_id, n, task_code, format) values (?, ?, ?, ?)", args: [id, i.n, i.code, i.format] })),
      ],
      "write",
    );
    const by = items.reduce<Record<string, number>>((a, i) => ((a[i.format] = (a[i.format] ?? 0) + 1), a), {});
    console.log(`${id}: ${items.length} sual`, by);
  }
}
db.close();
