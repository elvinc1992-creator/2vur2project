import { createClient } from "@libsql/client";
import { loadEnvConfig } from "@next/env";

// Günün sualları hər gün təsadüfi seçilir — testlər üçün bu günün dəstini bazada sabit qururuq.
// Suallar müəllifin sual bankındandır (bank_tasks); düzgün cavablar testdə bazadan oxunur (bankKeys).

/** Bakı vaxtı ilə bu gün (tətbiqdəki kimi). */
export const todayBaku = () => new Intl.DateTimeFormat("en-CA", { timeZone: "Asia/Baku" }).format(new Date());

/** 4 mövzu × 5 sual; faizdə FNT-0002 3-cü yerdədir — Free planda kilidli. */
export const FIXED_DAILY = [
  { slug: "triqonometriya", name: "Triqonometriya", ids: ["TRQ-0001", "TRQ-0002", "TRQ-0003", "TRQ-0004", "TRQ-0007"] },
  {
    slug: "loqarifm-ustlu-tenlik-berabersizlik",
    name: "Loqarifm, üstlü tənlik/bərabərsizlik",
    ids: ["LOQ-0001", "LOQ-0002", "LOQ-0005", "LOQ-0006", "LOQ-0007"],
  },
  { slug: "ucbucaqlar", name: "Üçbucaqlar", ids: ["UCB-0001", "UCB-0002", "UCB-0003", "UCB-0004", "UCB-0005"] },
  { slug: "faiz-nisbet-tenasub", name: "Faiz. Nisbət. Tənasüb", ids: ["FNT-0001", "FNT-0003", "FNT-0002", "FNT-0004", "FNT-0005"] },
];

export const connect = () => {
  loadEnvConfig(process.cwd());
  return createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });
};

export type BankKey = { code: string; answer: string; subtopic: string; topic: string };

/** Sual kodları → düzgün cavab, alt mövzu, mövzu (slug). Kod verilməsə — bütün qapalı suallar. */
export async function bankKeys(codes?: string[]): Promise<Map<string, BankKey>> {
  const db = connect();
  const r = await db.execute({
    sql: `select b.code, b.correct_option answer, coalesce(s.title, t.name) subtopic, t.slug topic
          from bank_tasks b join topics t on t.id = b.topic_id left join subtopics s on s.id = b.subtopic_id
          where b.format = 'closed' ${codes ? `and b.code in (${codes.map(() => "?").join(",")})` : ""}
          order by t.sort_order, b.sort_order`,
    args: codes ?? [],
  });
  db.close();
  return new Map(r.rows.map((x) => [String(x.code), { code: String(x.code), answer: String(x.answer), subtopic: String(x.subtopic), topic: String(x.topic) }]));
}

/** Mövzunun qapalı sual kodları (bankdakı sıra ilə). */
export async function topicCodes(slug: string): Promise<string[]> {
  return [...(await bankKeys()).values()].filter((k) => k.topic === slug).map((k) => k.code);
}

/** Düzgün olmayan hər hansı variant. */
export const wrongOf = (letter: string) => (letter === "A" ? "B" : "A");

/** İstifadəçinin vəziyyətinə bu günün sabit dəstini yazır (vəziyyət yoxdursa — sıfırdan yaradır). */
export async function fixDaily(userId: string, patch: Record<string, unknown> = {}) {
  const db = connect();
  const r = await db.execute({ sql: "select data from user_state where user_id = ?", args: [userId] });
  const state = r.rows[0]
    ? JSON.parse(String(r.rows[0].data))
    : { v: 3, uid: userId, daily: {}, purchased: [], attempts: {}, results: {}, sub: { status: "none", periodEnd: "" }, payments: [] };
  Object.assign(state, patch, {
    dailySet: { date: todayBaku(), topics: FIXED_DAILY.map(({ slug, ids }) => ({ slug, ids })) },
  });
  await db.execute({
    sql: `insert into user_state (user_id, data, updated_at) values (?, ?, ?)
          on conflict(user_id) do update set data = excluded.data, updated_at = excluded.updated_at`,
    args: [userId, JSON.stringify(state), Date.now()],
  });
  db.close();
}
