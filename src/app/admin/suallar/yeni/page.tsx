import type { Metadata } from "next";
import Link from "next/link";
import { PageHead, btnGhost } from "../../ui";
import { formLists } from "../data";
import { QuestionForm } from "../question-form";

export const metadata: Metadata = { title: "Yeni sual" };

export default async function NewQuestion() {
  const { topics, subs } = await formLists();
  return (
    <>
      <PageHead title="Yeni sual" lead="Kod mövzuya görə avtomatik verilir (məs. FNT-0058).">
        <Link href="/admin/suallar" className={btnGhost}>
          ← Suallar
        </Link>
      </PageHead>
      <QuestionForm
        topics={topics}
        subtopics={subs}
        initial={{
          topicId: topics[0]?.id ?? 1,
          subtopicId: null,
          format: "closed",
          body: "",
          options: {},
          correct: "",
          answerValue: "",
          matchingJson: "",
          matchingAnswer: "",
          solution: "",
          imageUrl: "",
          imageAlt: "",
          difficulty: 2,
          points: 1,
          status: "published",
        }}
      />
    </>
  );
}
