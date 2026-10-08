import "server-only";
import { sql, type SQL } from "drizzle-orm";
import { cache } from "react";
import { db } from "@/db";
import type { FilterOptions, StatFilters } from "./filters";

// Bütün rəqəmlər view-lardan: topic_exam_stats, exam_stats, topic_stats, topic_match_stats, topic_type_stats.

const num = (v: unknown) => Number(v ?? 0);

/** Süzgəcləri view sahələrinə (exam_kind, exam_group, year) tətbiq edir. */
function where(f: StatFilters): SQL {
  const parts: SQL[] = [sql`1 = 1`];
  if (f.kind !== "all") parts.push(sql`exam_kind = ${f.kind}`);
  if (f.group) parts.push(sql`exam_group = ${f.group}`);
  if (f.years.length) parts.push(sql`year in (${sql.join(f.years.map((y) => sql`${y}`), sql`, `)})`);
  return sql.join(parts, sql` and `);
}

export const getFilterOptions = cache(async (): Promise<FilterOptions> => {
  const years = await db.all<{ year: number }>(sql`select distinct year from exam_stats order by year`);
  const groups = await db.all<{ g: string }>(
    sql`select distinct exam_group as g from exam_stats where exam_kind = 'qebul' and exam_group is not null`,
  );
  const order = ["I", "II", "III", "IV", "V"];
  return {
    years: years.map((r) => num(r.year)),
    groups: groups.map((r) => r.g).sort((a, b) => order.indexOf(a) - order.indexOf(b)),
  };
});

export type Overview = {
  questions: number;
  exams: number;
  topics: number;
  found2023: number;
  found2025: number;
  foundBoth: number;
};

export async function getOverview(f: StatFilters): Promise<Overview> {
  const [q] = await db.all<Record<string, number>>(sql`
    select coalesce(sum(n), 0) as questions, count(distinct topic_id) as topics,
           coalesce(sum(found_2023), 0) as found2023, coalesce(sum(found_2025), 0) as found2025,
           coalesce(sum(found_both), 0) as foundBoth
    from topic_exam_stats where ${where(f)}`);
  const [e] = await db.all<{ exams: number }>(sql`select count(*) as exams from exam_stats where ${where(f)}`);
  return {
    questions: num(q?.questions),
    exams: num(e?.exams),
    topics: num(q?.topics),
    found2023: num(q?.found2023),
    found2025: num(q?.found2025),
    foundBoth: num(q?.foundBoth),
  };
}

export type RankingRow = {
  slug: string;
  name: string;
  part: string;
  n: number;
  share: number;
  /** Süzgəcə uyğun imtahanlar üzrə: orta, ən az, ən çox. */
  avg: number;
  min: number;
  max: number;
};

export async function getRanking(f: StatFilters): Promise<RankingRow[]> {
  const rows = await db.all<Record<string, string | number>>(sql`
    select t.slug, t.name, t.part, t.sort_order,
           sum(s.n) as n, count(*) as exams_with, min(s.n) as min_n, max(s.n) as max_n
    from topic_exam_stats s join topics t on t.id = s.topic_id
    where ${where(f)}
    group by s.topic_id
    order by n desc, t.sort_order`);
  const [e] = await db.all<{ exams: number }>(sql`select count(*) as exams from exam_stats where ${where(f)}`);
  const exams = num(e?.exams);
  const total = rows.reduce((s, r) => s + num(r.n), 0);
  return rows.map((r) => ({
    slug: String(r.slug),
    name: String(r.name),
    part: String(r.part),
    n: num(r.n),
    share: total ? num(r.n) / total : 0,
    avg: exams ? num(r.n) / exams : 0,
    // Mövzu bəzi imtahanlarda heç çıxmayıbsa, ən az = 0.
    min: num(r.exams_with) < exams ? 0 : num(r.min_n),
    max: num(r.max_n),
  }));
}

export type TopicDetail = {
  id: number;
  slug: string;
  name: string;
  part: string;
  total: number;
  share: number;
  avgPerExam: number;
  buraxilis: number;
  qebul: number;
  found2023: number;
  found2025: number;
  foundBoth: number;
};

export async function getTopic(slug: string): Promise<TopicDetail | null> {
  const [r] = await db.all<Record<string, string | number>>(sql`select * from topic_stats where slug = ${slug}`);
  if (!r) return null;
  return {
    id: num(r.topic_id),
    slug: String(r.slug),
    name: String(r.name),
    part: String(r.part),
    total: num(r.total),
    share: num(r.share),
    avgPerExam: num(r.avg_per_exam),
    buraxilis: num(r.buraxilis),
    qebul: num(r.qebul),
    found2023: num(r.found_2023),
    found2025: num(r.found_2025),
    foundBoth: num(r.found_both),
  };
}

export async function getTopicYears(topicId: number) {
  const years = await getFilterOptions();
  const rows = await db.all<{ year: number; n: number }>(
    sql`select year, sum(n) as n from topic_exam_stats where topic_id = ${topicId} group by year`,
  );
  const map = new Map(rows.map((r) => [num(r.year), num(r.n)]));
  return years.years.map((y) => ({ year: y, n: map.get(y) ?? 0 }));
}

export async function getTopicMatches(topicId: number) {
  const rows = await db.all<{ toplu: string; match: string; n: number }>(
    sql`select toplu, match, sum(n) as n from topic_match_stats where topic_id = ${topicId} group by toplu, match`,
  );
  return rows.map((r) => ({ toplu: String(r.toplu), match: String(r.match), n: num(r.n) }));
}

export async function getTopicTypes(topicId: number) {
  const rows = await db.all<{ type: string; n: number }>(
    sql`select type, n from topic_type_stats where topic_id = ${topicId} order by n desc, type`,
  );
  return rows.map((r) => ({ type: String(r.type), n: num(r.n) }));
}

export type RefRow = {
  exam: string;
  no: number;
  year: number;
  ref2023: string | null;
  match2023: string | null;
  ref2025: string | null;
  match2025: string | null;
};

/**
 * Toplu istinadları (yalnız mətn istinadı, sual mətni yoxdur).
 * Pulsuz istifadəçi üçün `limit` serverdə tətbiq olunur — qalan sətirlər brauzerə getmir.
 */
export async function getTopicRefs(topicId: number, limit: number | null) {
  const base = sql`from exam_questions_stats where topic_id = ${topicId} and (ref_2025 is not null or ref_2023 is not null)`;
  const [c] = await db.all<{ n: number }>(sql`select count(*) as n ${base}`);
  const rows = await db.all<Record<string, string | number | null>>(
    sql`select exam_name, question_no, year, ref_2023, match_2023, ref_2025, match_2025 ${base}
        order by year desc, exam_name, question_no ${limit === null ? sql`` : sql`limit ${limit}`}`,
  );
  return {
    total: num(c?.n),
    rows: rows.map(
      (r): RefRow => ({
        exam: String(r.exam_name),
        no: num(r.question_no),
        year: num(r.year),
        ref2023: (r.ref_2023 as string) ?? null,
        match2023: (r.match_2023 as string) ?? null,
        ref2025: (r.ref_2025 as string) ?? null,
        match2025: (r.match_2025 as string) ?? null,
      }),
    ),
  };
}

export const getNotes = cache(async () => {
  const rows = await db.all<Record<string, string | number>>(
    sql`select section, title, body from stat_notes order by sort_order`,
  );
  return rows.map((r) => ({ section: String(r.section), title: String(r.title), body: String(r.body) }));
});

/**
 * Auth panelindəki qısa rəqəmlər (view-dan). 10 dəqiqə yaddaşda saxlanılır;
 * baza 1,5 saniyədə cavab verməsə, null — giriş səhifəsi statistikanı gözləmir.
 */
let headline: { at: number; value: Overview } | null = null;
const HEADLINE_TTL_MS = 10 * 60_000;
const HEADLINE_WAIT_MS = 1_500;

export async function getHeadline(): Promise<Overview | null> {
  if (headline && Date.now() - headline.at < HEADLINE_TTL_MS) return headline.value;
  try {
    const value = await Promise.race([
      getOverview({ kind: "all", group: null, years: [] }),
      new Promise<null>((resolve) => setTimeout(() => resolve(null), HEADLINE_WAIT_MS)),
    ]);
    if (value?.questions) headline = { at: Date.now(), value };
    return value?.questions ? value : (headline?.value ?? null);
  } catch {
    return headline?.value ?? null;
  }
}
