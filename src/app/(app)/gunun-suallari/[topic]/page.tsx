import { notFound, redirect } from "next/navigation";
import { DAILY_TOPICS, type TopicSlug } from "@/lib/demo/content";
import { dailyByTopic, isDailyOpen } from "@/lib/demo/logic";
import { requireDemo } from "@/lib/demo/session";

/** Mövzunun ilk açıq və cavabsız sualına (yoxdursa birincisinə) yönləndirir. */
export default async function DailyTopicPage(props: PageProps<"/gunun-suallari/[topic]">) {
  const { topic } = await props.params;
  if (!DAILY_TOPICS.includes(topic as TopicSlug)) notFound();
  const { state } = await requireDemo(`/gunun-suallari/${topic}`);
  const idx = dailyByTopic(topic as TopicSlug).findIndex((q) => !state.daily[q.id] && isDailyOpen(state, q));
  redirect(`/gunun-suallari/${topic}/${idx >= 0 ? idx + 1 : 1}`);
}
