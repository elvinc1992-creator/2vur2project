import { notFound, redirect } from "next/navigation";
import { hasPaidAccess } from "@/lib/demo/logic";
import { requireDemo } from "@/lib/demo/session";
import { repetitorHref, tutorOf } from "@/lib/repetitor/progress";
import { getRepetitorTopic } from "@/lib/repetitor/source";

/** Mövzunun ilk cavabsız sualına (hamısı bitibsə birincisinə) yönləndirir. */
export default async function RepetitorTopicPage(props: PageProps<"/onlayn-repetitor/[movzu]">) {
  const { movzu } = await props.params;
  const topic = await getRepetitorTopic(movzu);
  if (!topic) notFound();
  const { state } = await requireDemo(`/onlayn-repetitor/${movzu}`);
  if (!hasPaidAccess(state)) redirect("/onlayn-repetitor");
  const idx = topic.questions.findIndex((q) => !tutorOf(state)[q.id]?.a);
  redirect(repetitorHref(movzu, idx >= 0 ? idx + 1 : 1));
}
