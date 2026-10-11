// Bir dəfəlik düzəliş (2026-10, miqrasiya 0024 ilə birlikdə), saytdakı mövcud sınaqlar üçün:
//  1) 11-ci sinif blok sınaqlarında №27 (açıq kodlaşdırılan) yox idi — 29 sual. Hər birinə №27 əlavə olunur.
//  2) 11-ci sinif buraxılış sınaqlarında "Limit, törəmə, inteqral" sualları eyni formatlı, 11-ci sinif
//     mövzusundan olan suallarla əvəz olunur (sınaqda olmayan və az istifadə olunanlar üstün).
// Təkrar işlədilsə, heç nə dəyişmir.
//   npx tsx scripts/fix-exams-blok30-b11.mts
import { createClient } from "@libsql/client";
import nextEnv from "@next/env";
import { isCodedAnswer } from "../src/lib/exams/generate.ts";

nextEnv.loadEnvConfig(process.cwd());
const db = createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });

type Task = { code: string; format: string; answerValue: string | null; hasOptions: boolean; types: string[]; topicSlug: string };
const tasks: Task[] = (
  await db.execute("select b.code, b.format, b.answer_value, b.options, b.correct_option, t.exam_types, t.slug from bank_tasks b join topics t on t.id = b.topic_id")
).rows.map((r) => ({
  code: String(r.code),
  format: String(r.format),
  answerValue: r.answer_value === null ? null : String(r.answer_value),
  hasOptions: Boolean(r.options) && Boolean(r.correct_option),
  types: String(r.exam_types).split(",").map((x) => x.trim()),
  topicSlug: String(r.slug),
}));
const fits = (t: Task, f: string) => (f === "closed" ? t.format === "closed" && t.hasOptions : f === "coded" ? t.format === "open" && isCodedAnswer(t.answerValue) : t.format === "written");

// İstifadə sayı (aktiv və passiv sınaqlar)
const usage = new Map(
  (await db.execute("select i.task_code c, count(*) n from exam_items i join exams e on e.id = i.exam_id where e.status in ('active','passive') group by i.task_code")).rows.map((r) => [
    String(r.c),
    Number(r.n),
  ]),
);
const pick = (pool: Task[]) => {
  const min = Math.min(...pool.map((t) => usage.get(t.code) ?? 0));
  const best = pool.filter((t) => (usage.get(t.code) ?? 0) === min);
  const t = best[Math.floor(Math.random() * best.length)];
  usage.set(t.code, (usage.get(t.code) ?? 0) + 1);
  return t;
};
const itemsOf = async (examId: string) => (await db.execute({ sql: "select n, task_code, format from exam_items where exam_id = ?", args: [examId] })).rows;

let added = 0;
let replaced = 0;

// 1) Blok: №27
for (const e of (await db.execute("select id from exams where kind = 'qebul-11'")).rows) {
  const id = String(e.id);
  const items = await itemsOf(id);
  if (items.some((i) => Number(i.n) === 27)) continue;
  const used = new Set(items.map((i) => String(i.task_code)));
  const t = pick(tasks.filter((t) => t.types.includes("blok") && fits(t, "coded") && !used.has(t.code)));
  await db.execute({ sql: "insert into exam_items (exam_id, n, task_code, format) values (?, 27, ?, 'coded')", args: [id, t.code] });
  console.log(`${id}: №27 əlavə olundu (${t.code})`);
  added++;
}

// 2) 11-ci sinif buraxılış: limit / törəmə / inteqral sualları əvəz olunur
for (const e of (await db.execute("select id from exams where kind = 'buraxilis-11'")).rows) {
  const id = String(e.id);
  const items = await itemsOf(id);
  const used = new Set(items.map((i) => String(i.task_code)));
  for (const it of items) {
    const old = tasks.find((t) => t.code === String(it.task_code));
    if (!old || old.types.includes("11")) continue;
    const t = pick(tasks.filter((t) => t.types.includes("11") && fits(t, String(it.format)) && !used.has(t.code)));
    used.add(t.code);
    await db.execute({ sql: "update exam_items set task_code = ? where exam_id = ? and n = ?", args: [t.code, id, it.n] });
    console.log(`${id} №${it.n}: ${old.code} → ${t.code}`);
    replaced++;
  }
}
console.log(`Hazırdır: ${added} sual əlavə olundu, ${replaced} sual əvəz olundu.`);
