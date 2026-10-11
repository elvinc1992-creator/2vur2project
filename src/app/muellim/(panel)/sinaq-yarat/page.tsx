import type { Metadata } from "next";
import Link from "next/link";
import { CreateTestForm } from "@/components/teacher/create-form";
import { Notice, Top } from "@/components/teacher/ui";
import { asc } from "drizzle-orm";
import { db } from "@/db";
import { topics } from "@/db/schema";
import { academicYear, structureOf, TEACHER_KINDS, usedTopicsThisYear } from "@/lib/teacher/create";
import { groupsOf } from "@/lib/teacher/data";
import { requireTeacher } from "@/lib/teacher/guard";

export const metadata: Metadata = { title: "Sınaq yarat" };

const ERRORS: Record<string, string> = {
  limit: "Bu gün üçün sınaq limitinə çatmısan. Sabah yenidən cəhd et.",
  empty: "Qrupda şagird yoxdur — əvvəlcə şagirdlər qrup kodu ilə qoşulsun.",
  group: "Qrup tapılmadı.",
  bank: "Bu imtahan növü üçün bazada uyğun sual tapılmadı.",
  topic: "Mövzu sınağı üçün mövzunu və sual sayını (15, 20 və ya 25) seç.",
  "topic-used": "Bu mövzu üzrə mövzu sınağını bu tədris ilində artıq yaratmısan (1 sentyabr – 1 iyul arasında bir dəfə).",
};

const serverNow = () => Date.now();
const todayBaku = () => new Intl.DateTimeFormat("en-CA", { timeZone: "Asia/Baku" }).format(new Date());

export default async function CreateTestPage(props: PageProps<"/muellim/sinaq-yarat">) {
  const me = await requireTeacher("/muellim/sinaq-yarat");
  const sp = await props.searchParams;
  const [groups, kinds, topicRows, used] = await Promise.all([
    groupsOf(me.id),
    Promise.all(TEACHER_KINDS.map(async (k) => ({ key: k, ...(await structureOf(k)) }))),
    db.select({ id: topics.id, name: topics.name }).from(topics).orderBy(asc(topics.curriculumOrder)),
    usedTopicsThisYear(me.id),
  ]);
  const err = typeof sp.xeta === "string" ? sp.xeta : null;

  return (
    <>
      <Top title="Sınaq yarat" lead="Suallar bazadan avtomatik seçilir. Seçdiyin qruplara əvvəl verilmiş suallar təkrarlanmır." />
      {err === "balance" && (
        <Notice tone="error">
          Balans kifayət etmir: {String(sp.mebleg ?? "")} ₼ lazımdır.{" "}
          <Link href="/muellim/balans" className="underline">
            Balansı artır
          </Link>
        </Notice>
      )}
      {err && ERRORS[err] && <Notice tone="error">{ERRORS[err]}</Notice>}
      <CreateTestForm
        kinds={kinds.map((k) => ({
          key: k.key,
          name: k.name,
          total: k.total,
          durationMin: k.durationMin,
          price: k.price,
          sections: k.sections.map((s) => ({ format: s.format, count: s.count })),
          topics: k.topics,
        }))}
        groups={groups.map((g) => ({ id: g.id, name: g.name, members: g.members }))}
        topics={topicRows.map((t) => ({ id: t.id, name: t.name, used: used.has(t.id) }))}
        yearLabel={academicYear(serverNow()).label}
        balance={me.balance}
        initialGroup={typeof sp.qrup === "string" ? sp.qrup : undefined}
        today={todayBaku()}
      />
    </>
  );
}
