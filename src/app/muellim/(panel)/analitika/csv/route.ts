import { fullName, groupResults, groupsOf, membersOf } from "@/lib/teacher/data";
import { requireTeacher } from "@/lib/teacher/guard";

// Qrupun nəticələri CSV (Excel): şagird × sınaq faizləri və orta.

const cell = (v: unknown) => {
  const s = v === null || v === undefined ? "" : String(v);
  return `"${(/^[=+\-@]/.test(s) ? `'${s}` : s).replace(/"/g, '""')}"`;
};

export async function GET(req: Request) {
  const me = await requireTeacher("/muellim/analitika");
  const groupId = new URL(req.url).searchParams.get("qrup");
  const g = (await groupsOf(me.id)).find((x) => x.id === groupId);
  if (!g) return new Response("Tapılmadı", { status: 404 });
  const [results, members] = await Promise.all([groupResults(me.id, g.id), membersOf(g.id)]);
  const head = ["Şagird", "E-poçt", ...results.map((r) => `Sınaq №${r.test.number} (%)`), "Orta (%)"];
  const lines = members.map((m) => {
    const xs = results.map((r) => r.per.get(m.id));
    const got = xs.filter((x): x is number => x !== undefined);
    return [fullName(m), m.email, ...xs.map((x) => x ?? ""), got.length ? Math.round(got.reduce((s, x) => s + x, 0) / got.length) : ""].map(cell).join(";");
  });
  return new Response(`﻿${[head.map(cell).join(";"), ...lines].join("\r\n")}`, {
    headers: { "Content-Type": "text/csv; charset=utf-8", "Content-Disposition": `attachment; filename="qrup-netice.csv"` },
  });
}
