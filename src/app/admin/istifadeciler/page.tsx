import type { Metadata } from "next";
import Link from "next/link";
import { USER_ROLES } from "@/db/schema";
import { setUserRoleAction, setUserStatusAction } from "@/lib/admin/actions";
import { cn } from "@/lib/cn";
import { listUsers, PAGE_SIZE } from "@/lib/admin/queries";
import { Notice, PageHead, Table, btn, btnGhost, fmtDate, input, isoToAz, td, th } from "../ui";

export const metadata: Metadata = { title: "İstifadəçilər" };

const ROLE: Record<string, string> = { student: "Şagird", teacher: "Müəllim", editor: "Redaktor", admin: "Admin" };

export default async function AdminUsers(props: PageProps<"/admin/istifadeciler">) {
  const sp = await props.searchParams;
  const q = typeof sp.q === "string" ? sp.q.trim() : "";
  const page = Math.max(1, Number(sp.s) || 1);
  const st = sp.st === "active" || sp.st === "passive" ? sp.st : undefined;
  const { rows, total } = await listUsers(q, page, st);
  const pages = Math.max(1, Math.ceil(total / PAGE_SIZE));
  const today = new Date().toISOString().slice(0, 10);
  const link = (s: number) => `/admin/istifadeciler?${new URLSearchParams({ ...(q ? { q } : {}), ...(st ? { st } : {}), s: String(s) })}`;
  const here = link(page);

  return (
    <>
      <PageHead title="İstifadəçilər" lead={`Cəmi ${total} istifadəçi. Rolu dəyişmək üçün seçib "Saxla" basın.`} />
      {sp.xeta === "ozun" && <Notice tone="error">Öz admin rolunuzu dəyişə bilməzsiniz.</Notice>}
      {sp.xeta === "ozun-status" && <Notice tone="error">Öz hesabınızı passiv edə bilməzsiniz.</Notice>}
      {sp.status === "passive" && <Notice tone="ok">Hesab passiv edildi — istifadəçi daxil ola bilməyəcək.</Notice>}
      {sp.status === "active" && <Notice tone="ok">Hesab aktiv edildi.</Notice>}
      <form className="flex flex-wrap gap-2" role="search">
        <label className="sr-only" htmlFor="q">
          Axtarış
        </label>
        <input id="q" name="q" defaultValue={q} placeholder="Ad, soyad, e-poçt və ya istifadəçi adı" className={`${input} min-w-[260px] flex-1`} />
        <label className="sr-only" htmlFor="st">
          Status
        </label>
        <select id="st" name="st" defaultValue={st ?? ""} className={input}>
          <option value="">Bütün statuslar</option>
          <option value="active">Aktiv</option>
          <option value="passive">Passiv</option>
        </select>
        <button className={btn}>Axtar</button>
      </form>
      <Table caption="İstifadəçilər">
        <thead className="bg-navy-050">
          <tr>
            {["İstifadəçi", "Əlaqə", "Sinif", "Plan", "Cavab", "Qeydiyyat", "Status", "Rol"].map((h) => (
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
                  <form action={setUserStatusAction} className="flex items-center gap-1.5">
                    <input type="hidden" name="id" value={u.id} />
                    <input type="hidden" name="back" value={here} />
                    <input type="hidden" name="status" value={u.status === "active" ? "passive" : "active"} />
                    <span
                      className={cn(
                        "rounded-pill px-2 py-0.5 text-[12px] font-bold",
                        u.status === "active" ? "bg-success-100 text-success-700" : "bg-danger-100 text-danger-700",
                      )}
                    >
                      {u.status === "active" ? "Aktiv" : "Passiv"}
                    </span>
                    <button className={btnGhost} aria-label={`${u.name}: ${u.status === "active" ? "passiv et" : "aktiv et"}`}>
                      {u.status === "active" ? "Passiv et" : "Aktiv et"}
                    </button>
                  </form>
                </td>
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
