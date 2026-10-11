import { eq } from "drizzle-orm";
import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { btnDark, btnGhost, Card, fmtDayLong, Notice, Pill, td, th, tone, toneSoft, Top, TLink } from "@/components/teacher/ui";
import { db } from "@/db";
import { teacherGroups, teacherTests } from "@/db/schema";
import { answersOf, attemptsOf, eventsOf, itemsOf, kindName, ownTest, questionStats, studentPercents, variantsOf } from "@/lib/teacher/data";
import { requireTeacher } from "@/lib/teacher/guard";
import { closesAt, settleTest } from "@/lib/teacher/online";

export const metadata: Metadata = { title: "Sınaq" };

const FORMAT: Record<string, string> = { closed: "qapalı", coded: "kodlaşdırılan", written: "yazılı" };
const serverNow = () => Date.now();

export default async function TeacherTest(props: PageProps<"/muellim/sinaqlar/[id]">) {
  const me = await requireTeacher();
  const { id } = await props.params;
  const sp = await props.searchParams;
  let t = await ownTest(me.id, id);
  if (!t) notFound();
  if (t.mode === "online") {
    await settleTest(t);
    [t] = await db.select().from(teacherTests).where(eq(teacherTests.id, id));
  }
  const [[group], items, variants, answers, attempts, events, kind] = await Promise.all([
    db.select().from(teacherGroups).where(eq(teacherGroups.id, t.groupId)),
    itemsOf(t.id),
    variantsOf(t.id),
    answersOf(t.id),
    attemptsOf(t.id),
    eventsOf(t.id),
    kindName(t.examKind),
  ]);
  const per = studentPercents(answers, items.length);
  const stats = questionStats(items, answers);
  const avg = per.size ? Math.round([...per.values()].reduce((s, v) => s + v, 0) / per.size) : null;
  const now = serverNow();
  const open = t.mode === "online" && now >= t.opensAt.getTime() && now < closesAt(t);

  return (
    <>
      <Top title={`Sınaq №${t.number}`} lead={`${group.name} · ${kind} · ${items.length} sual · ${t.durationMin} dəq · ${fmtDayLong(t.opensAt)}`}>
        <TLink href="/muellim/sinaqlar">← Sınaqlar</TLink>
      </Top>
      {sp.yaradildi && <Notice tone="ok">Sınaq yaradıldı.{t.mode === "online" ? " Şagirdlərə bildiriş göndərildi." : " Çap fayllarını yüklə."}</Notice>}
      {t.reused > 0 && (
        <Notice tone="warn">
          Diqqət: bu qrupa uyğun yeni sual qalmadığı üçün {t.reused} sual əvvəlki sınaqlardan (ən köhnələri) təkrar götürülüb.
        </Notice>
      )}

      <div className="grid gap-4 xl:grid-cols-[1.2fr_1fr]">
        <Card title={t.mode === "paper" ? "Çap (pulsuz)" : "Onlayn sınaq"} sub={t.mode === "paper" ? "Hər şagird üçün ayrıca kitabça və kart — adları avtomatik yazılır. Brauzerdə “Çap → PDF kimi saxla”." : `Açılır: ${fmtDayLong(t.opensAt)} · 24 saat açıq qalır · ${t.charged} ₼ tutulub`}>
          <div className="flex flex-wrap gap-2">
            <Link href={`/muellim/cap/${t.id}/kitabca`} target="_blank" className={btnGhost}>
              📘 Sual kitabçaları
            </Link>
            {t.mode === "paper" && (
              <Link href={`/muellim/cap/${t.id}/kart`} target="_blank" className={btnGhost}>
                🧾 Cavab kartları
              </Link>
            )}
            <Link href={`/muellim/cap/${t.id}/acar`} target="_blank" className={btnGhost}>
              🔑 Cavab açarı
            </Link>
            {(t.mode === "paper" || (attempts.length > 0 && items.some((i) => i.format === "written"))) && (
              <Link href={`/muellim/sinaqlar/${t.id}/netice`} className={btnDark}>
                ✍️ {t.mode === "paper" ? "Nəticələri yaz" : "Yazılı tapşırıqları qiymətləndir"}
              </Link>
            )}
          </div>
          {t.mode === "online" && (
            <p className="m-0 mt-3 text-[14px]">
              {open ? <Pill kind="green">Açıqdır</Pill> : now < t.opensAt.getTime() ? <Pill kind="indigo">Açılmayıb</Pill> : <Pill kind="amber">Bağlanıb</Pill>} Başlayıb:{" "}
              <b>{attempts.length}</b> / {variants.length} · bitirib: <b>{attempts.filter((a) => a.finishedAt).length}</b>
              {t.refundedAt && ` · başlamayanların məbləği balansa qaytarılıb`}
            </p>
          )}
        </Card>
        <Card title="Orta nəticə">
          <b className="text-[40px] font-black" style={{ color: tone(avg) }}>
            {avg !== null ? `${avg}%` : "—"}
          </b>
          <p className="m-0 text-[13px] text-[#5b6785]">{per.size} şagirdin nəticəsi var.</p>
        </Card>
      </div>

      <Card title="Suallar üzrə" sub="Düz cavab faizi və ən çox seçilən səhv variant. Sualın mətni yalnız çap faylındadır." className="mt-4">
        <ul className="m-0 grid list-none gap-2 p-0 [grid-template-columns:repeat(auto-fill,minmax(64px,1fr))]">
          {stats.map((s) => (
            <li
              key={s.n}
              title={`${s.topicName}${s.wrong ? ` · ən çox səhv: ${s.wrong.letter} (${s.wrong.share}%)` : ""}`}
              className="rounded-[12px] px-2 py-2 text-center font-extrabold"
              style={{ background: toneSoft(s.pct), color: tone(s.pct) }}
            >
              {s.n}
              <small className="block text-[10.5px] font-bold opacity-80">{s.pct !== null ? `${s.pct}%` : "—"}</small>
            </li>
          ))}
        </ul>
        <details className="mt-3">
          <summary className="cursor-pointer text-[14px] font-bold text-[#4f46e5]">Cədvəl kimi göstər</summary>
          <div className="overflow-x-auto" tabIndex={0} role="region" aria-label="Suallar üzrə statistika">
            <table className="mt-2 w-full border-collapse">
              <thead>
                <tr>
                  {["№", "Mövzu", "Tip", "Düz cavab", "Ən çox seçilən səhv"].map((h) => (
                    <th key={h} scope="col" className={th}>
                      {h}
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {stats.map((s) => (
                  <tr key={s.n}>
                    <td className={`${td} font-bold`}>{s.n}</td>
                    <td className={td}>{s.topicName}</td>
                    <td className={td}>{FORMAT[s.format]}</td>
                    <td className={`${td} font-bold`} style={{ color: tone(s.pct) }}>
                      {s.pct !== null ? `${s.pct}%` : "—"}
                    </td>
                    <td className={td}>{s.wrong ? `${s.wrong.letter} (${s.wrong.share}%)` : "—"}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </details>
      </Card>

      <Card title="Şagirdlər" className="mt-4">
        <div className="overflow-x-auto" tabIndex={0} role="region" aria-label="Şagirdlərin nəticəsi">
          <table className="w-full border-collapse">
            <thead>
              <tr>
                {["Şagird", "Variant", "Nəticə", ...(t.mode === "online" ? ["Vəziyyət", "Tab dəyişmə"] : [])].map((h) => (
                  <th key={h} scope="col" className={th}>
                    {h}
                  </th>
                ))}
              </tr>
            </thead>
            <tbody>
              {variants.map((v) => {
                const p = per.get(v.userId) ?? null;
                const a = attempts.find((x) => x.userId === v.userId);
                const ev = events.filter((e) => e.userId === v.userId && (e.kind === "tab_hidden" || e.kind === "window_blur")).length;
                return (
                  <tr key={v.userId}>
                    <td className={td}>
                      <b>{v.name}</b>
                    </td>
                    <td className={`${td} font-mono font-bold`}>{v.letter}</td>
                    <td className={`${td} font-bold`} style={{ color: tone(p) }}>
                      {p !== null ? `${p}%` : "—"}
                    </td>
                    {t.mode === "online" && (
                      <>
                        <td className={td}>{a?.finishedAt ? <Pill kind="green">Bitirib</Pill> : a ? <Pill kind="amber">İşləyir</Pill> : <Pill kind="indigo">Başlamayıb</Pill>}</td>
                        <td className={td}>{ev ? <Pill kind={ev >= 3 ? "red" : "amber"}>{ev} dəfə</Pill> : "—"}</td>
                      </>
                    )}
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      </Card>
    </>
  );
}
