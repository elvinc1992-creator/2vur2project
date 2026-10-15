// Mövzuların vərəqlənən nəzəriyyə kitablarını (topic_questions/theoria/kitab-<mövzu slug>.html) Turso-ya yükləyir.
// Fayl adında slug qısaldıla bilər (kitab-kvadrat-kokler-quvvet.html) — sözləri uyğun gələn yeganə mövzu götürülür.
// İşə salma: npm run theory:import [-- qovluq]
//
// Fayl müəllifin hazır HTML-idir. İdxalda:
// - içinə yerləşdirilmiş KaTeX üslubu (şriftlərlə, ~370 KB) və StPageFlip kitabxanası public/theoria/-yə ayrıca fayl kimi
//   çıxarılır (bütün kitablar üçün ortaq, brauzer keşləyir);
// - müəllifin öz kitab rejimi (CSS və skript) silinir — kitabı saytın oxuyucusu (public/theoria/book.js) qurur;
// - aidiyyət yazısı "2vur2.az saytına məxsusdur" olur.
// İdempotentdir (upsert). Mövzu slug-u bazada yoxdursa, idxal dayanır.
import { createClient } from "@libsql/client";
import nextEnv from "@next/env";
import { createHash } from "node:crypto";
import { existsSync, mkdirSync, readFileSync, readdirSync, writeFileSync } from "node:fs";
import path from "node:path";

nextEnv.loadEnvConfig(process.cwd());

const DIR = process.argv[2] ?? "topic_questions/theoria";
const OUT = "public/theoria";
const OWNER = "Bu material 2vur2.az saytına məxsusdur";
const db = createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });
mkdirSync(OUT, { recursive: true });

/** Ortaq faylı public/theoria/-yə yazır (eyni məzmun — eyni ad) və onun ünvanını qaytarır. */
function shared(name: string, ext: string, content: string) {
  const file = `${name}-${createHash("sha256").update(content).digest("hex").slice(0, 10)}.${ext}`;
  if (!existsSync(path.join(OUT, file))) writeFileSync(path.join(OUT, file), content);
  return `/theoria/${file}`;
}

function processBook(src: string, file: string) {
  let html = src.replace(/<\/style>\s*<\/style>/g, "</style>");

  html = html.replace(/<style>([\s\S]*?)<\/style>/g, (_, css: string) => {
    if (css.trimStart().startsWith("@font-face{font-family:KaTeX")) {
      return `<link rel="stylesheet" href="${shared("katex", "css", css)}">`;
    }
    const cut = css.indexOf("/* ===== KİTAB");
    return `<style>${cut >= 0 ? css.slice(0, cut) : css}</style>`;
  });

  html = html.replace(/<script>([\s\S]*?)<\/script>/g, (_, js: string) => {
    if (js.includes("PageFlip") && js.trimStart().startsWith("!function")) {
      return `<script src="${shared("page-flip", "js", js)}"></script>`;
    }
    const cut = js.indexOf("// ===== KİTAB");
    return `<script>${cut >= 0 ? js.slice(0, cut) : js}</script>`;
  });

  html = html
    .replace(/<div class="owner">[\s\S]*?<\/div>/g, `<div class="owner">2vur2.az · ${OWNER}</div>`)
    .replace(/Bu material [^<"]*?məxsusdur/g, OWNER);

  for (const need of ["<main", 'class="hero"', "<section", "</head>", "</body>"]) {
    if (!html.includes(need)) throw new Error(`${file}: "${need}" tapılmadı — kitabın quruluşu gözləniləndən fərqlidir`);
  }
  if (/PageFlip|KİTAB|Cəfərli/.test(html)) throw new Error(`${file}: köhnə kitab rejimi və ya aidiyyət yazısı qaldı`);
  return html;
}

const topics = new Map(
  (await db.execute("select id, slug from topics")).rows.map((r) => [String(r.slug), Number(r.id)] as const),
);
const books = readdirSync(DIR).filter((f) => /^kitab-.+\.html$/.test(f));
if (!books.length) throw new Error(`${DIR}: kitab-*.html faylı yoxdur`);

/** Fayl adındakı slug: dəqiq uyğunluq, yoxdursa sözləri slug-da olan YEGANƏ mövzu (məs. kvadrat-kokler-quvvet). */
function resolve(file: string, name: string) {
  if (topics.has(name)) return name;
  const words = name.split("-");
  // əvvəl tam sözlər, sonra söz əvvəli (hendese → hendesenin, anlayislar → anlayislari)
  for (const same of [(a: string, b: string) => a === b, (a: string, b: string) => a.startsWith(b)]) {
    const hits = [...topics.keys()].filter((s) => words.every((w) => s.split("-").some((x) => same(x, w))));
    if (hits.length === 1) return hits[0];
    if (hits.length > 1) throw new Error(`${file}: "${name}" mövzusu bazada birmənalı deyil (${hits.join(", ")})`);
  }
  throw new Error(`${file}: "${name}" mövzusu bazada yoxdur`);
}

for (const f of books) {
  const slug = resolve(f, f.slice("kitab-".length, -".html".length));
  const topicId = topics.get(slug)!;
  const html = processBook(readFileSync(path.join(DIR, f), "utf8"), f);
  await db.execute({
    sql: `insert into tutor_theory (topic_id, body, book_html) values (?, '', ?)
          on conflict (topic_id) do update set book_html = excluded.book_html`,
    args: [topicId, html],
  });
  console.log(`${f} → ${slug}: ${Math.round(html.length / 1024)} KB`);
}
db.close();
