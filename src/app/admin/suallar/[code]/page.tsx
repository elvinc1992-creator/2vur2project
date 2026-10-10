import { count, eq } from "drizzle-orm";
import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { db } from "@/db";
import { bankTasks, examItems } from "@/db/schema";
import { deleteQuestionAction } from "@/lib/admin/actions";
import { Notice, PageHead, btnDanger, btnGhost } from "../../ui";
import { formLists } from "../data";
import { QuestionForm } from "../question-form";

export const metadata: Metadata = { title: "Sualın redaktəsi" };

export default async function EditQuestion(props: PageProps<"/admin/suallar/[code]">) {
  const { code } = await props.params;
  const sp = await props.searchParams;
  const [[t], { topics, subs }, [used]] = await Promise.all([
    db.select().from(bankTasks).where(eq(bankTasks.code, code)),
    formLists(),
    db.select({ n: count() }).from(examItems).where(eq(examItems.taskCode, code)),
  ]);
  if (!t) notFound();
  const raw = t.options ? (JSON.parse(t.options) as unknown) : null;
  const options = Array.isArray(raw) ? Object.fromEntries((raw as Array<{ key: string; text: string }>).map((o) => [o.key, o.text])) : {};

  return (
    <>
      <PageHead title={`Sual ${t.code}`} lead={used.n ? `Bu sual ${used.n} sınaqda istifadə olunur — dəyişiklik orada da görünəcək.` : undefined}>
        <div className="flex flex-wrap gap-2">
          <Link href="/admin/suallar" className={btnGhost}>
            ← Suallar
          </Link>
          <form action={deleteQuestionAction}>
            <input type="hidden" name="code" value={t.code} />
            <button className={btnDanger}>Sil</button>
          </form>
        </div>
      </PageHead>
      {sp.saxlanildi && <Notice tone="ok">Yadda saxlanıldı.</Notice>}
      {sp.xeta === "sinaqda" && <Notice tone="error">Sual sınaqda istifadə olunur — əvvəlcə sınaqda başqa sualla əvəz edin.</Notice>}
      <QuestionForm
        key={t.code}
        topics={topics}
        subtopics={subs}
        initial={{
          code: t.code,
          topicId: t.topicId,
          subtopicId: t.subtopicId,
          format: t.format,
          body: t.body,
          options,
          correct: t.correctOption ?? "",
          answerValue: t.answerValue ?? "",
          matchingJson: t.format === "matching" && t.options ? JSON.stringify(JSON.parse(t.options), null, 2) : "",
          matchingAnswer: t.matchingAnswer ?? "",
          solution: t.solution,
          imageUrl: t.imageUrl ?? "",
          imageAlt: t.imageAlt ?? "",
          difficulty: t.difficulty ?? 2,
          points: t.points,
          status: t.status === "draft" ? "draft" : "published",
        }}
      />
    </>
  );
}
