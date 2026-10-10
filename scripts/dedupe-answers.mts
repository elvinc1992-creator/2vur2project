// user_answers-dəki təkrar sətirləri təmizləyir (köhnə state.ts xətası: hər yazıda bütün cavablar yenidən düşürdü)
// və köhnə statik sınaqların cavablarını silir. Deploy-dan sonra bir dəfə işə salın: npm run db:dedupe-answers
import { createClient } from "@libsql/client";
import nextEnv from "@next/env";

nextEnv.loadEnvConfig(process.cwd());
const db = createClient({ url: process.env.TURSO_DATABASE_URL!, authToken: process.env.TURSO_AUTH_TOKEN });

const dup = await db.execute(`
  DELETE FROM user_answers
  WHERE question_ref NOT LIKE 'w:%'
    AND id NOT IN (SELECT min(id) FROM user_answers GROUP BY user_id, source, question_ref)`);
// Köhnə sınaq istinadları "1:5" formatındadır (yeni: "b11-1:KOD").
const oldExam = await db.execute(`DELETE FROM user_answers WHERE source = 'exam' AND question_ref GLOB '[0-9]*:[0-9]*'`);
// Zəif mövzular təmiz məlumatla yenidən hesablansın (səhifə açılanda).
await db.execute("DELETE FROM user_topic_stats");
await db.execute("DELETE FROM user_loss_history");
console.log(`Silindi: ${dup.rowsAffected} təkrar, ${oldExam.rowsAffected} köhnə sınaq cavabı.`);
db.close();
