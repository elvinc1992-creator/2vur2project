import { and, count, desc, eq, inArray, isNull } from "drizzle-orm";
import type { Metadata } from "next";
import { db } from "@/db";
import { teacherAccounts, teacherApplications, teacherBalanceTx, teacherGroupMembers, teacherGroups, teacherTests, users } from "@/db/schema";
import { decideTeacherAction, teacherBalanceAction, teacherLimitAction } from "@/lib/admin/teacher-actions";
import { Notice, PageHead, Table, btn, btnGhost, fmtDate, input, td, th } from "../ui";

export const metadata: Metadata = { title: "Müəllimlər" };

const azn = (v: number) => `${v.toFixed(2)} ₼`;

/** Müəllim müraciətləri; müəllimlər: qruplar, şagirdlər, sınaqlar, balans və ödənişlər; balans əməliyyatı və gündəlik limit. */
export default async function AdminTeachers(props: PageProps<"/admin/muellimler">) {
  const sp = await props.searchParams;
  const [apps, teachers] = await Promise.all([
    db
      .select({ a: teacherApplications, name: users.name, surname: users.surname, email: users.email })
      .from(teacherApplications)
      .innerJoin(users, eq(users.id, teacherApplications.userId))
      .orderBy(desc(teacherApplications.createdAt)),
    db.select({ u: users, acc: teacherAccounts }).from(users).leftJoin(teacherAccounts, eq(teacherAccounts.userId, users.id)).where(eq(users.role, "teacher")),
  ]);
  const ids = teachers.map((t) => t.u.id);
  const [groups, members, tests, tx] = ids.length
    ? await Promise.all([
        db.select({ id: teacherGroups.id, teacherId: teacherGroups.teacherId }).from(teacherGroups).where(inArray(teacherGroups.teacherId, ids)),
        db
          .select({ teacherId: teacherGroups.teacherId, n: count() })
          .from(teacherGroupMembers)
          .innerJoin(teacherGroups, eq(teacherGroups.id, teacherGroupMembers.groupId))
          .where(and(inArray(teacherGroups.teacherId, ids), isNull(teacherGroupMembers.leftAt)))
          .groupBy(teacherGroups.teacherId),
        db.select({ teacherId: teacherTests.teacherId, mode: teacherTests.mode, n: count() }).from(teacherTests).where(inArray(teacherTests.teacherId, ids)).groupBy(teacherTests.teacherId, teacherTests.mode),
        db.select().from(teacherBalanceTx).where(inArray(teacherBalanceTx.teacherId, ids)).orderBy(desc(teacherBalanceTx.createdAt)).limit(200),
      ])
    : [[], [], [], []];
  const pending = apps.filter((x) => x.a.status === "pending");

  return (
    <>
      <PageHead title="Müəllimlər" lead="Müəllim paneli yalnız təsdiqlənmiş müəllimlər üçündür. Sınağın qiyməti (kağız və onlayn) sınaq başınadır, balansdan tutulur — “Sınaq strukturu” bölməsində dəyişilir." />
      {sp.tesdiq && <Notice tone="ok">Müraciət təsdiqləndi — istifadəçi müəllim oldu.</Notice>}
      {sp.redd && <Notice tone="ok">Müraciət rədd edildi.</Notice>}
      {sp.balans && <Notice tone="ok">Balans əməliyyatı yazıldı.</Notice>}
      {sp.limit && <Notice tone="ok">Gündəlik limit dəyişdirildi.</Notice>}

      <Table caption={`Müraciətlər (${pending.length} gözləyir)`}>
        <thead className="bg-navy-050">
          <tr>
            {["İstifadəçi", "Məktəb / qeyd", "Tarix", "Status", "Qərar"].map((h) => (
              <th key={h} scope="col" className={th}>
                {h}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {apps.length === 0 && (
            <tr>
              <td className={td} colSpan={5}>
                Müraciət yoxdur.
              </td>
            </tr>
          )}
          {apps.map(({ a, name, surname, email }) => (
            <tr key={a.userId} className="border-t border-line">
              <td className={td}>
                <b>
                  {name} {surname}
                </b>
                <span className="block text-[12.5px] text-ink-muted">{email}</span>
              </td>
              <td className={td}>
                {a.school}
                {a.note && <span className="block text-[12.5px] text-ink-muted">{a.note}</span>}
              </td>
              <td className={td}>{fmtDate(a.createdAt)}</td>
              <td className={td}>{a.status === "pending" ? "Gözləyir" : a.status === "approved" ? "Təsdiqlənib" : "Rədd edilib"}</td>
              <td className={td}>
                {a.status === "pending" && (
                  <form action={decideTeacherAction} className="flex flex-wrap gap-1.5">
                    <input type="hidden" name="userId" value={a.userId} />
                    <input name="note" placeholder="Qeyd (könüllü)" aria-label={`${name}: qeyd`} className={`${input} w-40`} />
                    <button name="decision" value="approve" className={btn}>
                      Təsdiqlə
                    </button>
                    <button name="decision" value="reject" className={btnGhost}>
                      Rədd et
                    </button>
                  </form>
                )}
              </td>
            </tr>
          ))}
        </tbody>
      </Table>

      <Table caption="Müəllimlər">
        <thead className="bg-navy-050">
          <tr>
            {["Müəllim", "Qrup / şagird", "Sınaqlar (kağız / onlayn)", "Balans", "Gündəlik limit", "Balansa əməliyyat"].map((h) => (
              <th key={h} scope="col" className={th}>
                {h}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {teachers.length === 0 && (
            <tr>
              <td className={td} colSpan={6}>
                Hələ müəllim yoxdur.
              </td>
            </tr>
          )}
          {teachers.map(({ u, acc }) => {
            const tp = tests.filter((x) => x.teacherId === u.id);
            return (
              <tr key={u.id} className="border-t border-line">
                <td className={td}>
                  <b>
                    {u.name} {u.surname}
                  </b>
                  <span className="block text-[12.5px] text-ink-muted">{u.email}</span>
                </td>
                <td className={`${td} tabular`}>
                  {groups.filter((g) => g.teacherId === u.id).length} / {members.find((m) => m.teacherId === u.id)?.n ?? 0}
                </td>
                <td className={`${td} tabular`}>
                  {tp.find((x) => x.mode === "paper")?.n ?? 0} / {tp.find((x) => x.mode === "online")?.n ?? 0}
                </td>
                <td className={`${td} font-bold tabular`}>{azn(acc?.balance ?? 0)}</td>
                <td className={td}>
                  <form action={teacherLimitAction} className="flex gap-1.5">
                    <input type="hidden" name="userId" value={u.id} />
                    <input name="dailyLimit" type="number" min={0} max={200} defaultValue={acc?.dailyLimit ?? 10} aria-label={`${u.name}: gündəlik limit`} className={`${input} w-20`} />
                    <button className={btnGhost}>Saxla</button>
                  </form>
                </td>
                <td className={td}>
                  <form action={teacherBalanceAction} className="flex flex-wrap gap-1.5">
                    <input type="hidden" name="userId" value={u.id} />
                    <input name="amount" type="number" step="0.01" required placeholder="± AZN" aria-label={`${u.name}: məbləğ`} className={`${input} w-24`} />
                    <select name="kind" aria-label={`${u.name}: əməliyyat`} className={input}>
                      <option value="bonus">Bonus</option>
                      <option value="refund">Geri qaytarma</option>
                      <option value="adjust">Düzəliş</option>
                    </select>
                    <input name="note" placeholder="Qeyd" aria-label={`${u.name}: qeyd`} className={`${input} w-32`} />
                    <button className={btnGhost}>Yaz</button>
                  </form>
                </td>
              </tr>
            );
          })}
        </tbody>
      </Table>

      {tx.length > 0 && (
        <Table caption="Balans əməliyyatları və ödənişlər (son 200)">
          <thead className="bg-navy-050">
            <tr>
              {["Tarix", "Müəllim", "Növ", "Qeyd", "Məbləğ"].map((h) => (
                <th key={h} scope="col" className={th}>
                  {h}
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {tx.map((x) => {
              const t = teachers.find((y) => y.u.id === x.teacherId)?.u;
              return (
                <tr key={x.id} className="border-t border-line">
                  <td className={td}>{fmtDate(x.createdAt)}</td>
                  <td className={td}>{t ? `${t.name} ${t.surname ?? ""}` : "—"}</td>
                  <td className={td}>{{ topup: "Artırma", charge: "Onlayn sınaq", refund: "Geri qaytarma", bonus: "Bonus", adjust: "Düzəliş" }[x.kind]}</td>
                  <td className={`${td} text-[13px]`}>{x.note}</td>
                  <td className={`${td} font-bold tabular`}>{azn(x.amount)}</td>
                </tr>
              );
            })}
          </tbody>
        </Table>
      )}
    </>
  );
}
