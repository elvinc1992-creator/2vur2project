import "server-only";
import { asc } from "drizzle-orm";
import { db } from "@/db";
import { subtopics } from "@/db/schema";
import { topicOptions } from "@/lib/admin/queries";

/** Redaktor üçün mövzular və alt mövzular. */
export async function formLists() {
  const [topics, subs] = await Promise.all([
    topicOptions(),
    db.select({ id: subtopics.id, topicId: subtopics.topicId, title: subtopics.title }).from(subtopics).orderBy(asc(subtopics.sortOrder)),
  ]);
  return { topics, subs };
}
