// Excel analizini (DIM_riyaziyyat_YEKUN_statistika.xlsx) Turso-ya yükləyir.
// İşə salma: npm run stats:import [-- yol/fayl.xlsx]
//
// - "Mövzular" vərəqi → topics (mövzu cədvəli; ad, hissə, sıra)
// - "Bütün suallar" → exam_questions_stats (sual MƏTNİ yoxdur — yalnız istinad və uyğunluq)
// - "Qeydlər" → stat_notes
// İdempotentdir: təkrar işə salanda upsert edir, faylda olmayan sətirləri silir.
// "Bütün suallar"-dakı mövzu adı "Mövzular"-da yoxdursa, yeni mövzu YARADILMIR — siyahı çıxarılır və idxal dayanır.
import { createClient, type InStatement } from "@libsql/client";
import nextEnv from "@next/env";
import ExcelJS from "exceljs";

nextEnv.loadEnvConfig(process.cwd());

const FILE = process.argv[2] ?? "data/DIM_riyaziyyat_YEKUN_statistika.xlsx";
const MATCHES = new Set(["EYNİ", "Çox yaxın", "Oxşar", "Zəif", "Tapılmadı", "Yoxlanmayıb"]);
const FOUND = new Set(["EYNİ", "Çox yaxın", "Oxşar"]);

type Cell = ExcelJS.CellValue;
function value(v: Cell): string | number | null {
  if (v === null || v === undefined) return null;
  if (typeof v === "object") {
    if ("result" in v) return (v.result as string | number) ?? null;
    if ("richText" in v) return v.richText.map((r) => r.text).join("");
    if ("text" in v) return String(v.text);
    if (v instanceof Date) return v.toISOString();
    return null;
  }
  return v as string | number;
}
const str = (v: Cell) => {
  const x = value(v);
  return x === null ? null : String(x).trim() || null;
};

/** Azərbaycan hərflərini latın ASCII-yə çevirib slug düzəldir. */
export function slugify(name: string): string {
  const map: Record<string, string> = { ə: "e", ı: "i", ö: "o", ü: "u", ş: "s", ç: "c", ğ: "g", i̇: "i" };
  return name
    .toLocaleLowerCase("az")
    .replace(/[əıöüşçğ]/g, (c) => map[c] ?? c)
    .normalize("NFKD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "");
}

const examKey = (name: string) => name.replace(/\s*\(\d+[–-]\d+\)\s*$/, "");
const examKind = (name: string) => (name.startsWith("Buraxılış") ? "buraxilis" : name.startsWith("Qəbul") ? "qebul" : null);
const examGroup = (name: string) => name.match(/\b(IV|V|I{1,3})\s+qrup\b/)?.[1] ?? null;
const ref = (v: Cell) => {
  const s = str(v);
  return !s || s === "—" || s === "-" ? null : s;
};

async function main() {
  const wb = new ExcelJS.Workbook();
  await wb.xlsx.readFile(FILE);

  /* --- Mövzular --- */
  const topicSheet = wb.getWorksheet("Mövzular");
  if (!topicSheet) throw new Error('"Mövzular" vərəqi tapılmadı');
  const topics: Array<{ name: string; part: string; slug: string; sort: number }> = [];
  topicSheet.eachRow((row, r) => {
    if (r === 1) return;
    const name = str(row.getCell(1).value);
    const part = str(row.getCell(2).value);
    if (!name || name === "CƏMİ" || !part) return;
    topics.push({ name, part, slug: slugify(name), sort: topics.length + 1 });
  });
  const slugs = new Set(topics.map((t) => t.slug));
  if (slugs.size !== topics.length) throw new Error("Mövzu slug-ları təkrarlanır");

  /* --- Bütün suallar --- */
  const qSheet = wb.getWorksheet("Bütün suallar");
  if (!qSheet) throw new Error('"Bütün suallar" vərəqi tapılmadı');
  const topicNames = new Set(topics.map((t) => t.name));
  const unmatched = new Map<string, number>();
  const problems: string[] = [];
  type Q = {
    year: number;
    exam: string;
    no: number;
    topic: string;
    part: string;
    type: string | null;
    ref23: string | null;
    m23: string | null;
    ref25: string | null;
    m25: string | null;
  };
  const questions: Q[] = [];
  qSheet.eachRow((row, r) => {
    if (r === 1) return;
    const c = (i: number) => row.getCell(i).value;
    const year = Number(value(c(1)));
    const exam = str(c(2));
    const no = Number(value(c(3)));
    const topic = str(c(4));
    if (!exam || !topic || !Number.isInteger(year) || !Number.isInteger(no)) {
      problems.push(`sətir ${r}: boş/yanlış sahə`);
      return;
    }
    if (!topicNames.has(topic)) unmatched.set(topic, (unmatched.get(topic) ?? 0) + 1);
    const m23 = str(c(8));
    const m25 = str(c(11));
    for (const m of [m23, m25]) if (m && !MATCHES.has(m)) problems.push(`sətir ${r}: naməlum uyğunluq "${m}"`);
    if (!examKind(exam)) problems.push(`sətir ${r}: imtahan növü təyin olunmadı "${exam}"`);
    questions.push({ year, exam, no, topic, part: str(c(5)) ?? "", type: str(c(6)), ref23: ref(c(7)), m23, ref25: ref(c(10)), m25 });
  });

  console.log(`Fayl: ${FILE}`);
  console.log(`Mövzular: ${topics.length}, suallar: ${questions.length}`);
  if (unmatched.size) {
    console.error("\nUyğun gəlməyən mövzu adları (yeni mövzu yaradılmadı, idxal dayandı):");
    for (const [name, n] of unmatched) console.error(`  - "${name}" (${n} sual)`);
    process.exit(1);
  }
  if (problems.length) {
    console.error("\nProblemlər:\n  " + problems.join("\n  "));
    process.exit(1);
  }
  console.log("Uyğun gəlməyən mövzu adı: yoxdur");

  /* --- Qeydlər --- */
  const notes: Array<{ key: string; section: string; title: string; body: string; sort: number }> = [];
  const nSheet = wb.getWorksheet("Qeydlər");
  let section = "Metodika";
  nSheet?.eachRow((row) => {
    const title = str(row.getCell(1).value);
    const body = str(row.getCell(2).value);
    if (title && !body) {
      section = title;
      return;
    }
    if (title && body) notes.push({ key: slugify(`${section}-${title}`), section, title, body, sort: notes.length + 1 });
  });

  /* --- Bazaya yazma --- */
  const db = createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });
  const before = Number((await db.execute("select count(*) as n from exam_questions_stats")).rows[0].n);

  await db.batch(
    topics.map((t) => ({
      sql: `insert into topics (slug, name, part, sort_order) values (?, ?, ?, ?)
            on conflict(name) do update set slug = excluded.slug, part = excluded.part, sort_order = excluded.sort_order`,
      args: [t.slug, t.name, t.part, t.sort],
    })),
    "write",
  );
  const ids = new Map(
    (await db.execute("select id, name from topics")).rows.map((r) => [String(r.name), Number(r.id)] as const),
  );

  const stmts: InStatement[] = questions.map((q) => ({
    sql: `insert into exam_questions_stats
            (year, exam_name, exam_key, exam_kind, exam_group, question_no, topic_id, part, type, ref_2023, match_2023, ref_2025, match_2025)
          values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
          on conflict(exam_name, question_no) do update set
            year = excluded.year, exam_key = excluded.exam_key, exam_kind = excluded.exam_kind, exam_group = excluded.exam_group,
            topic_id = excluded.topic_id, part = excluded.part, type = excluded.type,
            ref_2023 = excluded.ref_2023, match_2023 = excluded.match_2023, ref_2025 = excluded.ref_2025, match_2025 = excluded.match_2025`,
    args: [
      q.year,
      q.exam,
      examKey(q.exam),
      examKind(q.exam)!,
      examGroup(q.exam),
      q.no,
      ids.get(q.topic)!,
      q.part,
      q.type,
      q.ref23,
      q.m23,
      q.ref25,
      q.m25,
    ],
  }));
  for (let i = 0; i < stmts.length; i += 200) await db.batch(stmts.slice(i, i + 200), "write");

  // Faylda olmayan köhnə sətirləri silirik (baza faylı tam əks etdirsin).
  const keep = new Set(questions.map((q) => `${q.exam}#${q.no}`));
  const existing = (await db.execute("select id, exam_name, question_no from exam_questions_stats")).rows;
  const stale = existing.filter((r) => !keep.has(`${r.exam_name}#${r.question_no}`)).map((r) => Number(r.id));
  if (stale.length) await db.execute({ sql: `delete from exam_questions_stats where id in (${stale.map(() => "?").join(",")})`, args: stale });

  await db.batch(
    notes.map((n) => ({
      sql: `insert into stat_notes (key, section, title, body, sort_order) values (?, ?, ?, ?, ?)
            on conflict(key) do update set section = excluded.section, title = excluded.title, body = excluded.body, sort_order = excluded.sort_order`,
      args: [n.key, n.section, n.title, n.body, n.sort],
    })),
    "write",
  );

  /* --- Yoxlama: view-lardan oxunan rəqəmlər "Yekun" vərəqi ilə üst-üstə düşür? --- */
  const one = async (q: string) => (await db.execute(q)).rows[0];
  const total = await one("select count(*) n, count(distinct exam_name) exams_raw, count(distinct exam_key) exams from exam_questions_stats");
  const kinds = (await db.execute("select exam_kind, count(*) n from exam_questions_stats group by exam_kind")).rows;
  const years = (await db.execute("select year, count(*) n from exam_questions_stats group by year order by year")).rows;
  const found = await one("select sum(found_2023) f23, sum(found_2025) f25, sum(found_both) fb from topic_stats");
  const typed = await one("select count(*) n from exam_questions_stats where type is not null");
  const foundLocal = questions.filter((q) => FOUND.has(q.m23 ?? "")).length;

  console.log(`\nYazıldı: ${questions.length} sual (əvvəl bazada ${before}), silinən köhnə sətir: ${stale.length}`);
  console.log(`Qeydlər: ${notes.length}, mövzular: ${ids.size}`);
  console.log(`Bazada: ${total.n} sual, ${total.exams} imtahan (${total.exams_raw} ad — səhifələrə bölünmüş imtahan birləşdirilib)`);
  console.log(`Növ: ${kinds.map((k) => `${k.exam_kind}=${k.n}`).join(", ")}`);
  console.log(`İllər: ${years.map((y) => `${y.year}=${y.n}`).join(", ")}`);
  console.log(`Tapılan (EYNİ+Çox yaxın+Oxşar): 2023=${found.f23}, 2025=${found.f25}, hər ikisində=${found.fb} (fayldan hesab: 2023=${foundLocal})`);
  console.log(`"Sual tipi" doldurulmuş sətir: ${typed.n}`);
  db.close();
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
