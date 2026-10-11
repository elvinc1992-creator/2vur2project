import type { Metadata } from "next";
import Link from "next/link";
import { Page, Topbar } from "@/components/app/topbar";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { Card, Tag, h1Class, h3Class } from "@/components/ui/display";
import { requireDemo } from "@/lib/demo/session";
import { joinGroupAction, leaveGroupAction, startOnlineAction } from "@/lib/teacher/actions";
import { fullName, groupsOfStudent, onlineTestsOfStudent } from "@/lib/teacher/data";
import { attemptOf, closesAt, deadlineOf, settleTest } from "@/lib/teacher/online";
import { answersOf, itemsOf, studentPercents } from "@/lib/teacher/data";

export const metadata: Metadata = { title: "Qruplarım" };

const serverNow = () => Date.now();
const fmt = (d: Date | number) => new Intl.DateTimeFormat("az-AZ", { timeZone: "Asia/Baku", dateStyle: "medium", timeStyle: "short" }).format(d);

/** Şagird: müəllimin qrupuna kodla qoşulmaq, qruplar və müəllimin onlayn sınaqları. */
export default async function MyGroups(props: PageProps<"/qruplarim">) {
  const { user } = await requireDemo("/qruplarim");
  const sp = await props.searchParams;
  const [groups, tests] = await Promise.all([groupsOfStudent(user.id!), onlineTestsOfStudent(user.id!)]);
  const now = serverNow();
  const rows = await Promise.all(
    tests.map(async ({ t, group }) => {
      await settleTest(t, now);
      const a = await attemptOf(t.id, user.id!);
      let pct: number | null = null;
      if (a?.finishedAt) {
        const [items, answers] = await Promise.all([itemsOf(t.id), answersOf(t.id)]);
        pct = studentPercents(answers.filter((x) => x.userId === user.id), items.length).get(user.id!) ?? 0;
      }
      return { t, group, a, pct, open: now >= t.opensAt.getTime() && now < closesAt(t), done: Boolean(a?.finishedAt) || (a ? now >= deadlineOf(t, a.startedAt) : false) };
    }),
  );

  return (
    <>
      <Topbar title="Qruplarım" />
      <Page narrow>
        <h1 className={h1Class}>Qruplarım</h1>
        {sp.qosuldu && <Alert tone="success">Qrupa qoşuldun. Müəllimin sınaqları burada görünəcək.</Alert>}
        {sp.cixdi && <Alert tone="success">Qrupdan çıxdın.</Alert>}
        {sp.xeta === "kod" && <Alert tone="danger">Bu kodla qrup tapılmadı. Kodu müəllimindən yenidən soruş.</Alert>}
        {sp.xeta === "sinaq" && <Alert tone="danger">Sınaq hazırda açıq deyil.</Alert>}

        <Card as="section" aria-labelledby="join" className="grid gap-3">
          <h2 id="join" className={h3Class}>
            Qrupa qoşul
          </h2>
          <form action={joinGroupAction} className="flex flex-wrap items-end gap-2">
            <label className="grid flex-1 gap-1 text-small font-semibold">
              Qrup kodu
              <input
                name="code"
                required
                defaultValue={typeof sp.kod === "string" ? sp.kod : ""}
                placeholder="Məs. K7F-3Q2"
                className="min-h-12 rounded-md border-[1.5px] border-control-border bg-white px-3 font-mono text-[18px] font-bold uppercase"
              />
            </label>
            <Button type="submit">Qoşul</Button>
          </form>
          <p className="text-small text-ink-muted">Kodu müəllimin verir. Qrupdan çıxsan, müəllim yeni nəticələrini görməyəcək.</p>
        </Card>

        {rows.length > 0 && (
          <section aria-labelledby="tests" className="grid gap-3">
            <h2 id="tests" className={h3Class}>
              Müəllimin onlayn sınaqları
            </h2>
            {rows.map(({ t, group, a, pct, open, done }) => (
              <Card key={t.id} className="grid gap-2">
                <div className="flex flex-wrap items-center justify-between gap-2">
                  <b>
                    Sınaq №{t.number} · {group}
                  </b>
                  {done ? <Tag tone="success">Bitib{pct !== null ? ` · ${pct}%` : ""}</Tag> : a ? <Tag tone="warning">Davam edir</Tag> : open ? <Tag tone="coral">Açıqdır</Tag> : <Tag>{now < t.opensAt.getTime() ? "Açılmayıb" : "Bağlanıb"}</Tag>}
                </div>
                <p className="text-small text-ink-muted">
                  Açılır: {fmt(t.opensAt)} · 24 saat açıq · {t.durationMin} dəqiqə (başlayandan sonra vaxt dayanmır)
                </p>
                {!done && open && (
                  a ? (
                    <Link href={`/muellim-sinaq/${t.id}`} className="justify-self-start font-bold text-navy-500 underline">
                      Davam et →
                    </Link>
                  ) : (
                    <form action={startOnlineAction.bind(null, t.id)}>
                      <Button type="submit">Sınağa başla</Button>
                    </form>
                  )
                )}
              </Card>
            ))}
          </section>
        )}

        <section aria-labelledby="mine" className="grid gap-3">
          <h2 id="mine" className={h3Class}>
            Qruplar
          </h2>
          {groups.length === 0 && <p className="text-ink-muted">Hələ heç bir qrupda deyilsən.</p>}
          {groups.map(({ g, teacher, teacherSurname }) => (
            <Card key={g.id} className="flex flex-wrap items-center justify-between gap-3">
              <span>
                <b>{g.name}</b>
                <span className="block text-small text-ink-muted">Müəllim: {fullName({ name: teacher, surname: teacherSurname })}</span>
              </span>
              <form action={leaveGroupAction}>
                <input type="hidden" name="groupId" value={g.id} />
                <button className="cursor-pointer text-small font-semibold text-danger-700 hover:underline">Qrupdan çıx</button>
              </form>
            </Card>
          ))}
        </section>
      </Page>
    </>
  );
}
