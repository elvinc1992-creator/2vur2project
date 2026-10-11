import { and, eq } from "drizzle-orm";
import type { Metadata } from "next";
import { notFound, redirect } from "next/navigation";
import { Page, Topbar } from "@/components/app/topbar";
import { OnlineTestRunner } from "@/components/teacher/online-runner";
import { ButtonLink } from "@/components/ui/button";
import { Card, h1Class } from "@/components/ui/display";
import { db } from "@/db";
import { teacherTests } from "@/db/schema";
import { todayIso } from "@/lib/demo/logic";
import { requireDemo } from "@/lib/demo/session";
import { answersOf, itemsOf, studentPercents, testGroupsOf, testKindLabel } from "@/lib/teacher/data";
import { attemptOf, deadlineOf, finishAttempt, questionsFor, shownAnswers, variantOf } from "@/lib/teacher/online";

export const metadata: Metadata = { title: "Müəllimin sınağı" };

const serverNow = () => Date.now();

/** Müəllimin onlayn sınağı — şagirdin öz variantı; vaxt serverdə, dayanmır. Bitəndən sonra — bal. */
export default async function OnlineTest(props: PageProps<"/muellim-sinaq/[id]">) {
  const { id } = await props.params;
  const { user } = await requireDemo(`/muellim-sinaq/${id}`);
  const [t] = await db.select().from(teacherTests).where(and(eq(teacherTests.id, id), eq(teacherTests.mode, "online")));
  const v = t ? await variantOf(t.id, user.id!) : null;
  if (!t || !v) notFound();
  const a = await attemptOf(t.id, user.id!);
  if (!a) redirect("/qruplarim");
  const now = serverNow();
  const deadline = deadlineOf(t, a.startedAt);
  if (!a.finishedAt && now >= deadline) await finishAttempt(t, user.id!, deadline);
  const items = await itemsOf(t.id);

  if (a.finishedAt || now >= deadline) {
    const answers = (await answersOf(t.id)).filter((x) => x.userId === user.id);
    const pct = studentPercents(answers, items.length).get(user.id!) ?? 0;
    const pending = answers.some((x) => x.score === null);
    return (
      <>
        <Topbar title={`Sınaq №${t.number}`} back="/qruplarim" />
        <Page narrow>
          <h1 className={h1Class}>Sınaq bitdi</h1>
          <Card className="grid gap-2">
            <p className="m-0 text-[40px] font-black text-navy-900">{pct}%</p>
            <p className="text-ink-muted">{pending ? "Yazılı tapşırıqları müəllim yoxlayandan sonra bal yenilənəcək." : "Nəticən müəllimə və zəif mövzu təhlilinə göndərildi."}</p>
          </Card>
          <ButtonLink href="/qruplarim" className="justify-self-start">
            Qruplarım
          </ButtonLink>
        </Page>
      </>
    );
  }

  const [tg, kname, initial] = await Promise.all([testGroupsOf(t.id), testKindLabel(t), shownAnswers(t.id, user.id!, v)]);
  const group = { name: tg.groupOf.get(user.id!) ?? tg.names };
  const questions = questionsFor(items, v);
  const counts = { closed: 0, coded: 0, written: 0 };
  for (const q of questions) counts[q.format]++;
  return (
    <OnlineTestRunner
      exam={{
        id: t.id,
        title: `Müəllimin sınağı №${t.number} · ${group.name}`,
        group: kname,
        kind: t.examKind,
        durationMin: t.durationMin,
        blueprintKey: t.examKind,
        examType: t.examKind === "movzu" ? "movzu" : "11",
        number: t.number,
        total: questions.length,
        counts,
        status: "active",
        price: 0,
        createdAt: t.createdAt.getTime(),
        topicName: null,
      }}
      questions={questions}
      initialAnswers={initial}
      remaining={deadline - now}
      studentName={user.name ?? ""}
      today={todayIso()}
    />
  );
}
