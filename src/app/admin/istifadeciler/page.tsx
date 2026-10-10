import type { Metadata } from "next";
import Link from "next/link";
import { USER_ROLES } from "@/db/schema";
import { setUserRoleAction } from "@/lib/admin/actions";
import { listUsers, PAGE_SIZE } from "@/lib/admin/queries";
import { Notice, PageHead, Table, btn, btnGhost, fmtDate, input, isoToAz, td, th } from "../ui";

export const metadata: Metadata = { title: "İstifadəçilər" };

const ROLE: Record<string, string> = { student: "Şagird", teacher: "Müəllim", editor: "Redaktor", admin: "Admin" };

export default async function AdminUsers(props: PageProps<"/admin/istifadeciler">) {
  const sp = await props.searchParams;
  const q = typeof sp.q === "string" ? sp.q.trim() : "";
  const page = Math.max(1, Number(sp.s) || 1);
  const { rows, total } = await listUsers(q, page);
  const pages = Math.max(1, Math.ceil(total / PAGE_SIZE));
  const today = new Date().toISOString().slice(0, 10);
  const link = (s: number) => `/admin/istifadeciler?${new URLSearchParams({ ...(q ? { q } : {}), s: String(s) })}`;

  return (
    <>
      <PageHead title="İstifadəçilər" lead={`Cəmi ${total} istifadəçi. Rolu dəyişmək üçün seçib "Saxla" basın.`} />
      {sp.xeta === "ozun" && <Notice tone="error">Öz admin rolunuzu dəyişə bilməzsiniz.</Notice>}
      <form className="flex flex-wrap gap-2" role="search">
        <label className="sr-only" htmlFor="q">
          Axtarış
        </label>
        <input id="q" name="q" defaultValue={q} placeholder="Ad, soyad, e-poçt və ya istifadəçi adı" className={`${input} min-w-[260px] flex-1`} />
        <button className={btn}>Axtar</button>
      </form>
      <Table caption="İstifadəçilər">
        <thead className="bg-navy-050">
          <tr>
            {["İstifadəçi", "Əlaqə", "Sinif", "Plan", "Cavab", "Qeydiyyat", "Rol"].map((h) => (
              <th key={h} scope="col" className={th}>
                {h}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {rows.map(({ u, status, tier, periodEnd, answers }) => {
            const active = (status === "active" || status === "canceled") && (periodEnd ?? "") >= today;
            return (
              <tr key={u.id} className="border-t border-line">
                <td className={td}>
                  <b>
                    {u.name} {u.surname}
                  </b>
                  {u.username && <span className="block text-[12.5px] text-ink-muted">@{u.username}</span>}
                </td>
                <td className={td}>
                  {u.email ?? "—"}
                  {u.phone && <span className="block text-[12.5px] text-ink-muted">{u.phone}</span>}
                </td>
                <td className={`${td} tabular`}>{u.grade ?? "—"}</td>
                <td className={td}>
                  {active ? (
                    <>
                      <b>{tier === "pro" ? "Pro" : "Premium"}</b>
                      <span className="block text-[12.5px] text-ink-muted">
                        {status === "canceled" ? "ləğv edilib · " : ""}
                        {isoToAz(periodEnd ?? "")}-dək
                      </span>
                    </>
                  ) : (
                    "Free"
                  )}
                </td>
                <td className={`${td} tabular`}>{answers}</td>
                <td className={td}>{fmtDate(u.createdAt)}</td>
                <td className={td}>
                  <form action={setUserRoleAction} className="flex gap-1.5">
                    <input type="hidden" name="id" value={u.id} />
                    <select name="role" defaultValue={u.role} aria-label={`${u.name}: rol`} className={input}>
                      {USER_ROLES.map((r) => (
                        <option key={r} value={r}>
                          {ROLE[r]}
                        </option>
                      ))}
                    </select>
                    <button className={btnGhost}>Saxla</button>
                  </form>
                </td>
              </tr>
            );
          })}
        </tbody>
      </Table>
      {pages > 1 && (
        <nav aria-label="Səhifələr" className="flex flex-wrap items-center gap-2">
          {page > 1 && (
            <Link href={link(page - 1)} className={btnGhost}>
              ← Əvvəlki
            </Link>
          )}
          <span className="text-small text-ink-muted">
            {page} / {pages}
          </span>
          {page < pages && (
            <Link href={link(page + 1)} className={btnGhost}>
              Növbəti →
            </Link>
          )}
        </nav>
      )}
    </>
  );
}
