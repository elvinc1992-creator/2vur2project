import { createClient } from "@libsql/client";
import { loadEnvConfig } from "@next/env";
import type { Locator, Page } from "@playwright/test";

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

export type BankKey = {
  code: string;
  format: "closed" | "open" | "matching" | "written";
  /** closed: hərf; open/written: yekun cavab; matching: {"1":["a"],…} (JSON). */
  answer: string;
  subtopic: string;
  topic: string;
};

/** Sual kodları → format, düzgün cavab, alt mövzu, mövzu (slug). Kod verilməsə — bütün suallar (bankdakı sıra ilə). */
export async function bankKeys(codes?: string[]): Promise<Map<string, BankKey>> {
  const db = connect();
  const r = await db.execute({
    sql: `select b.code, b.format, b.correct_option, b.answer_value, b.matching_answer, coalesce(s.title, t.name) subtopic, t.slug topic
          from bank_tasks b join topics t on t.id = b.topic_id left join subtopics s on s.id = b.subtopic_id
          ${codes ? `where b.code in (${codes.map(() => "?").join(",")})` : ""}
          order by t.curriculum_order, b.sort_order`,
    args: codes ?? [],
  });
  db.close();
  return new Map(
    r.rows.map((x) => {
      const format = String(x.format) as BankKey["format"];
      const answer = format === "closed" ? x.correct_option : format === "matching" ? x.matching_answer : x.answer_value;
      return [String(x.code), { code: String(x.code), format, answer: String(answer), subtopic: String(x.subtopic), topic: String(x.topic) }];
    }),
  );
}

/** Mövzunun sual kodları (bankdakı sıra ilə); format verilsə — yalnız o format. */
export async function topicCodes(slug: string, format?: BankKey["format"]): Promise<string[]> {
  return [...(await bankKeys()).values()].filter((k) => k.topic === slug && (!format || k.format === format)).map((k) => k.code);
}

/** Düzgün olmayan hər hansı variant. */
export const wrongOf = (letter: string) => (letter === "A" ? "B" : "A");

/** Səhifədə (və ya bölmədə) bank sualını cavablandırır: düzgün və ya yanlış — formata görə. */
export async function answerBank(scope: Page | Locator, k: BankKey, right: boolean) {
  if (k.format === "closed") {
    const letter = right ? k.answer : wrongOf(k.answer);
    await scope.locator(`label:has(input[aria-label^="Variant ${letter}:"])`).click();
  } else if (k.format === "matching") {
    const pairs = JSON.parse(k.answer) as Record<string, string[]>;
    for (const [n, ls] of Object.entries(pairs)) {
      const pick = right ? ls : ["a", "b", "c", "d", "e"].filter((l) => !ls.includes(l)).slice(0, 1);
      for (const l of pick) await scope.getByRole("checkbox", { name: `Bənd ${n}: ${l}` }).check({ force: true });
    }
  } else {
    await scope.getByRole("textbox").fill(right ? k.answer : "987654");
  }
}

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

/** Sınağın n-ci sualı: kod, format, düzgün cavab (hərf və ya ədəd), həll və mətn (bazadan). */
export async function examItem(examId: string, n: number) {
  const db = connect();
  const r = await db.execute({
    sql: `select i.task_code code, i.format, b.correct_option, b.answer_value, b.solution, b.body
          from exam_items i join bank_tasks b on b.code = i.task_code where i.exam_id = ? and i.n = ?`,
    args: [examId, n],
  });
  db.close();
  const x = r.rows[0];
  return {
    code: String(x.code),
    format: String(x.format),
    answer: String(x.format === "closed" ? x.correct_option : x.answer_value),
    solution: String(x.solution ?? ""),
    body: String(x.body),
  };
}
