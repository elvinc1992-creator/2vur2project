import { auth } from "@/auth";
import { isAdmin } from "@/lib/admin/guard";
import { listRegistrants } from "@/lib/contest/admin";
import { contestById } from "@/lib/contest/data";

// Qeydiyyatçıların CSV ixracı (Excel açır: UTF-8 BOM, nöqtəli vergül ayırıcı).

const cell = (v: unknown) => {
  const s = v === null || v === undefined ? "" : String(v);
  // Formula inyeksiyasının qarşısı (=, +, -, @ ilə başlayan xanalar)
  const safe = /^[=+\-@]/.test(s) ? `'${s}` : s;
  return `"${safe.replace(/"/g, '""')}"`;
};

export async function GET(req: Request, ctx: RouteContext<"/admin/yaris/[id]/csv">) {
  const session = await auth();
  if (!session?.user?.id || !(await isAdmin(session.user.id))) return new Response("İcazə yoxdur", { status: 403 });
  const { id } = await ctx.params;
  const c = await contestById(id);
  if (!c) return new Response("Tapılmadı", { status: 404 });
  const sp = new URL(req.url).searchParams;
  const { rows } = await listRegistrants(id, { q: sp.get("q") ?? undefined, grade: Number(sp.get("sinif")) || undefined, region: sp.get("rayon") ?? undefined }, 100_000);
  const head = ["Ad", "Soyad", "Sinif", "Rayon", "Məktəb", "E-poçt", "Dəvət kodu", "Dəvət edənin kodu", "E-poçta razılıq", "İmtina", "Bal", "Yer", "Finalçı", "DQ", "Qeydiyyat tarixi"];
  const lines = rows.map(({ reg, res }) =>
    [
      reg.firstName,
      reg.lastName,
      reg.grade,
      reg.region,
      reg.school,
      reg.email,
      reg.inviteCode,
      reg.invitedByCode,
      reg.agreeEmail ? "bəli" : "xeyr",
      reg.unsubscribedAt ? "bəli" : "",
      res?.score,
      res?.place,
      res?.finalist ? "bəli" : "",
      res?.disqualified ? res.dqReason ?? "bəli" : "",
      reg.createdAt.toISOString().slice(0, 16).replace("T", " "),
    ]
      .map(cell)
      .join(";"),
  );
  const body = `﻿${[head.map(cell).join(";"), ...lines].join("\r\n")}`;
  return new Response(body, {
    headers: {
      "Content-Type": "text/csv; charset=utf-8",
      "Content-Disposition": `attachment; filename="${c.slug}-qeydiyyat.csv"`,
    },
  });
}
