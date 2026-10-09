import { notFound, redirect } from "next/navigation";
import { requireDaily } from "@/lib/demo/daily";
import { dailyHref, dailyTopic, isDailyOpen } from "@/lib/demo/logic";

/** Mövzunun ilk açıq və cavabsız sualına (yoxdursa birincisinə) yönləndirir. */
export default async function DailyTopicPage(props: PageProps<"/gunun-suallari/[topic]">) {
  const { topic } = await props.params;
  const { state, ctx } = await requireDaily(`/gunun-suallari/${topic}`);
  const x = dailyTopic(ctx, topic);
  if (!x) notFound();
  const idx = x.ids.findIndex((id) => !state.daily[id] && isDailyOpen(state, ctx, id));
  redirect(dailyHref(topic, idx >= 0 ? idx + 1 : 1));
}
