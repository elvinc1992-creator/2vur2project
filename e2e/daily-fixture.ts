import { createClient } from "@libsql/client";
import { loadEnvConfig } from "@next/env";

// Günün sualları hər gün təsadüfi seçilir — testlər üçün bu günün dəstini bazada sabit qururuq.

/** Bakı vaxtı ilə bu gün (tətbiqdəki kimi). */
export const todayBaku = () => new Intl.DateTimeFormat("en-CA", { timeZone: "Asia/Baku" }).format(new Date());

/** 4 mövzu × 5 sual; faizdə f2 ("45% artırıldı") 3-cü yerdədir — Free planda kilidli. */
export const FIXED_DAILY = [
  { slug: "triqonometriya", name: "Triqonometriya", ids: ["t1", "t2", "t3", "t4", "t5"] },
  { slug: "loqarifm-ustlu-tenlik-berabersizlik", name: "Loqarifm, üstlü tənlik/bərabərsizlik", ids: ["l1", "l2", "l3", "l4", "l5"] },
  { slug: "stereometriya", name: "Stereometriya", ids: ["s1", "s2", "s3", "s4", "s5"] },
  { slug: "faiz-nisbet-tenasub", name: "Faiz. Nisbət. Tənasüb", ids: ["f1", "f3", "f2", "f4", "f5"] },
];

const connect = () => {
  loadEnvConfig(process.cwd());
  return createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });
};

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
