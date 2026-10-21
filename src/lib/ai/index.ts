import "server-only";
import { asc } from "drizzle-orm";
import { unstable_cache } from "next/cache";
import { db } from "@/db";
import { bankTasks, examQuestionsStats, subtopics, topics, type TaskFormat } from "@/db/schema";
import { listQuestionPool } from "@/lib/repetitor/source";
import { freqLevel, parseToplu, shownCounts, subtopicOf, type AiInsight, type FreqLevel, type SubtopicSpan } from "./analysis";

export const AI_INDEX_TAG = "ai-index";

/** Prototip sayılan uyğunluq dərəcələri (toplu tapşırığı imtahan sualı ilə eyni və ya çox yaxın). */
const PROTO_LEVELS = new Set(["EYNİ", "Çox yaxın"]);

const FORMAT_LABEL: Record<TaskFormat, string> = { closed: "Qapalı", open: "Açıq cavablı", matching: "Uyğunluq", written: "Yazılı" };

export type AiTopicStat = { id: number; slug: string; name: string; section: string | null; exams: number; years: number[]; hits: number };
export type AiTypeStat = {
  id: number;
  topicId: number;
  title: string;
  /** Düşdüyü imtahanların sayı (fərqli imtahan açarları), illər və ümumi sual sayı. */
  exams: number;
  years: number[];
  hits: number;
  /** Göstərilən sual sayı (12–40, düşmə tezliyinə görə) və səviyyə. */
  shown: number;
  level: FreqLevel;
  /** Saytdakı suallar: kod, mövzu slug-ı və repetitordakı sıra nömrəsi. */
  site: { code: string; n: number }[];
};
type TaskMeta = { t: number; s: number | null; f: TaskFormat; p: string[] };

export type AiIndex = {
  exams: number;
  questions: number;
  /** Tipə (alt mövzuya) bağlana bilən imtahan sualları. */
  mapped: number;
  years: number[];
  topics: AiTopicStat[];
  types: AiTypeStat[];
  tasks: Record<string, TaskMeta>;
  subs: SubtopicSpan[];
};

const sortNum = (s: Set<number>) => [...s].sort((a, b) => a - b);

/** Bütün statistika bir dəfə hesablanır və 1 saat cache olunur (sual bankı dəyişəndə tag ilə təzələnir). */
export const getAiIndex = unstable_cache(
  async (): Promise<AiIndex> => {
    const [rows, subRows, topicRows, taskRows, pool] = await Promise.all([
      db
        .select({
          examKey: examQuestionsStats.examKey,
          year: examQuestionsStats.year,
          topicId: examQuestionsStats.topicId,
          ref2023: examQuestionsStats.ref2023,
          match2023: examQuestionsStats.match2023,
          ref2025: examQuestionsStats.ref2025,
          match2025: examQuestionsStats.match2025,
        })
        .from(examQuestionsStats),
      db.select({ id: subtopics.id, topicId: subtopics.topicId, part: subtopics.bookPart, startPage: subtopics.startPage, title: subtopics.title }).from(subtopics).orderBy(asc(subtopics.sortOrder)),
      db.select({ id: topics.id, slug: topics.slug, name: topics.name, section: topics.section }).from(topics).orderBy(asc(topics.curriculumOrder)),
      db
        .select({
          code: bankTasks.code,
          topicId: bankTasks.topicId,
          subtopicId: bankTasks.subtopicId,
          format: bankTasks.format,
          year: bankTasks.basedOnYear,
          part: bankTasks.basedOnPart,
          page: bankTasks.basedOnPage,
          no: bankTasks.basedOnTaskNo,
        })
        .from(bankTasks),
      listQuestionPool(),
    ]);

    const subs: SubtopicSpan[] = subRows.map(({ id, topicId, part, startPage }) => ({ id, topicId, part, startPage }));
    const topicAgg = new Map<number, { exams: Set<string>; years: Set<number>; hits: number }>();
    const typeAgg = new Map<number, { exams: Set<string>; years: Set<number>; hits: number }>();
    // "2025|II|207|23" → imtahanlar (toplu tapşırığı həmin imtahanda eyni/çox yaxın düşüb)
    const proto = new Map<string, Set<string>>();
    const examKeys = new Set<string>();
    const years = new Set<number>();
    let mapped = 0;

    for (const r of rows) {
      examKeys.add(r.examKey);
      years.add(r.year);
      const ta = topicAgg.get(r.topicId) ?? { exams: new Set(), years: new Set(), hits: 0 };
      ta.exams.add(r.examKey);
      ta.years.add(r.year);
      ta.hits++;
      topicAgg.set(r.topicId, ta);

      // Tip — 2025 toplusunun bölməsi (alt mövzuların səhifələri 2025 nəşrinə görədir)
      const refs25 = parseToplu(r.ref2025);
      const sub = refs25.map((ref) => subtopicOf(subs, r.topicId, ref)).find((x) => x !== null) ?? null;
      if (sub !== null) {
        mapped++;
        const a = typeAgg.get(sub) ?? { exams: new Set(), years: new Set(), hits: 0 };
        a.exams.add(r.examKey);
        a.years.add(r.year);
        a.hits++;
        typeAgg.set(sub, a);
      }

      for (const [year, refs, level] of [
        [2025, refs25, r.match2025],
        [2023, parseToplu(r.ref2023), r.match2023],
      ] as const) {
        if (!level || !PROTO_LEVELS.has(level)) continue;
        for (const ref of refs)
          for (const no of ref.nos) {
            const k = `${year}|${ref.part}|${ref.page}|${no}`;
            proto.set(k, (proto.get(k) ?? new Set()).add(r.examKey));
          }
      }
    }

    // Saytdakı suallar (cavabı olanlar) — repetitordakı sıra ilə, link üçün
    const position = new Map<string, number>();
    for (const t of pool) t.questions.forEach((q, i) => position.set(q.id, i + 1));

    const tasks: Record<string, TaskMeta> = {};
    const siteBy = new Map<number, { code: string; n: number }[]>();
    for (const b of taskRows) {
      const k = `${b.year ?? 2025}|${b.part ?? "I"}|${b.page}|${b.no}`;
      tasks[b.code] = { t: b.topicId, s: b.subtopicId, f: b.format, p: b.page && b.no ? [...(proto.get(k) ?? [])] : [] };
      const n = position.get(b.code);
      if (b.subtopicId !== null && n) siteBy.set(b.subtopicId, [...(siteBy.get(b.subtopicId) ?? []), { code: b.code, n }]);
    }

    return {
      exams: examKeys.size,
      questions: rows.length,
      mapped,
      years: sortNum(years),
      topics: topicRows.map((t) => {
        const a = topicAgg.get(t.id);
        return { ...t, exams: a?.exams.size ?? 0, years: a ? sortNum(a.years) : [], hits: a?.hits ?? 0 };
      }),
      types: (() => {
        const hits = subRows.map((s) => typeAgg.get(s.id)?.hits ?? 0);
        const shown = shownCounts(hits);
        return subRows.map((s, i) => {
          const a = typeAgg.get(s.id);
          return {
            id: s.id,
            topicId: s.topicId,
            title: s.title,
            exams: a?.exams.size ?? 0,
            years: a ? sortNum(a.years) : [],
            hits: hits[i],
            shown: shown[i],
            level: freqLevel(shown[i]),
            site: siteBy.get(s.id) ?? [],
          };
        });
      })(),
      tasks,
      subs,
    };
  },
  ["ai-index-v2"],
  { revalidate: 3600, tags: [AI_INDEX_TAG] },
);

/** Index yüklənmədisə (DB xətası) nişanlar sadəcə görünmür — sual səhifəsi işləməyə davam edir. */
async function safeIndex(): Promise<AiIndex | null> {
  try {
    return await getAiIndex();
  } catch (e) {
    console.error("[ai] statistika yüklənmədi", e);
    return null;
  }
}

function build(ix: AiIndex, topicId: number, subId: number | null, subtype: string | null, proto: string[]): AiInsight | null {
  const topic = ix.topics.find((t) => t.id === topicId);
  if (!topic) return null;
  const type = subId !== null ? ix.types.find((t) => t.id === subId) : undefined;
  return {
    topic: topic.name,
    type: type?.title ?? null,
    subtype,
    level: type?.level ?? null,
    shown: type?.shown ?? 0,
    typeHref: type ? `/suni-intellekt/tipler/${type.id}` : null,
    proto,
  };
}

/** Bank suallarının AI analizi (kod → nişan məlumatı). */
export async function aiInsights(codes: string[]): Promise<Record<string, AiInsight>> {
  const ix = await safeIndex();
  const out: Record<string, AiInsight> = {};
  if (!ix) return out;
  for (const code of codes) {
    const m = ix.tasks[code];
    const x = m && build(ix, m.t, m.s, FORMAT_LABEL[m.f], m.p);
    if (x) out[code] = x;
  }
  return out;
}

export async function aiInsight(code: string): Promise<AiInsight | null> {
  return (await aiInsights([code]))[code] ?? null;
}

/** İmtahan sualının (imtahan qarşılığı) analizi: mövzu + toplu istinadından tip, alt tip — imtahan təsnifatı. */
export async function aiInsightForExam(topicSlug: string, toplu: string, subtype: string | null): Promise<AiInsight | null> {
  const ix = await safeIndex();
  const topic = ix?.topics.find((t) => t.slug === topicSlug);
  if (!ix || !topic) return null;
  const sub = parseToplu(toplu).map((r) => subtopicOf(ix.subs, topic.id, r)).find((x) => x !== null) ?? null;
  return build(ix, topic.id, sub, subtype, []);
}

/** Tip səhifəsi üçün: tip, mövzusu və saytdakı sualların mətni (cavabsız). */
export async function getAiType(id: number) {
  const ix = await getAiIndex();
  const type = ix.types.find((t) => t.id === id);
  if (!type) return null;
  const topic = ix.topics.find((t) => t.id === type.topicId)!;
  const codes = new Set(type.site.map((s) => s.code));
  const pool = await listQuestionPool();
  const questions = (pool.find((t) => t.slug === topic.slug)?.questions ?? [])
    .map((q, i) => ({ code: q.id, n: i + 1, text: q.text, format: q.format }))
    .filter((q) => codes.has(q.code));
  return { ix, type, topic, questions };
}

export { FORMAT_LABEL };
