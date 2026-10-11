import { eq } from "drizzle-orm";
import { auth } from "@/auth";
import { db } from "@/db";
import { contestRegistrations, contestResults, contests } from "@/db/schema";
import { fmtDay } from "@/lib/contest/mail";
import { checkContestToken } from "@/lib/contest/token";

// İştirakçının sertifikatı (SVG şəkil): ad, soyad, yarışın adı, tarix, bal və yer (ilk 10 üçün).
// Açılır: imzalı linklə (e-poçtdan) və ya sahibinin sessiyası ilə.

const esc = (s: string) => s.replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&apos;" })[c]!);

export async function GET(req: Request, ctx: RouteContext<"/yaris/sertifikat/[id]">) {
  const { id } = await ctx.params;
  const token = new URL(req.url).searchParams.get("t");
  const [row] = await db
    .select({ reg: contestRegistrations, res: contestResults, c: contests })
    .from(contestRegistrations)
    .innerJoin(contests, eq(contests.id, contestRegistrations.contestId))
    .leftJoin(contestResults, eq(contestResults.registrationId, contestRegistrations.id))
    .where(eq(contestRegistrations.id, id));
  if (!row?.res || row.res.disqualified) return new Response("Sertifikat tapılmadı", { status: 404 });
  if (!checkContestToken(id, "cert", token)) {
    const session = await auth();
    if (session?.user?.id !== row.reg.userId) return new Response("İcazə yoxdur", { status: 403 });
  }
  const { reg, res, c } = row;
  const place = res.finalPlace ?? res.place;
  const line = place && place <= 10 ? `${place}-ci yer · ${res.score} / ${c.questionCount} bal` : `${res.score} / ${c.questionCount} bal`;
  const svg = `<svg xmlns="http://www.w3.org/2000/svg" width="1600" height="1130" viewBox="0 0 1600 1130">
  <defs><linearGradient id="g" x1="0" y1="0" x2="1" y2="1"><stop offset="0" stop-color="#6366f1"/><stop offset=".55" stop-color="#8b5cf6"/><stop offset="1" stop-color="#ec4899"/></linearGradient></defs>
  <rect width="1600" height="1130" fill="#f4f6fb"/>
  <rect x="40" y="40" width="1520" height="1050" rx="40" fill="#fff" stroke="url(#g)" stroke-width="14"/>
  <rect x="40" y="40" width="1520" height="190" rx="40" fill="url(#g)"/>
  <text x="800" y="160" text-anchor="middle" font-family="Inter, Arial, sans-serif" font-size="72" font-weight="900" fill="#fff">SERTİFİKAT</text>
  <text x="800" y="360" text-anchor="middle" font-family="Inter, Arial, sans-serif" font-size="36" fill="#5b6785">Bu sertifikat təqdim olunur</text>
  <text x="800" y="480" text-anchor="middle" font-family="Inter, Arial, sans-serif" font-size="88" font-weight="900" fill="#0f1b3d">${esc(`${reg.firstName} ${reg.lastName}`)}</text>
  <text x="800" y="580" text-anchor="middle" font-family="Inter, Arial, sans-serif" font-size="36" fill="#5b6785">${esc(c.title)} iştirakçısı</text>
  <text x="800" y="690" text-anchor="middle" font-family="Inter, Arial, sans-serif" font-size="56" font-weight="800" fill="#4f46e5">${esc(line)}</text>
  <text x="800" y="790" text-anchor="middle" font-family="Inter, Arial, sans-serif" font-size="32" fill="#5b6785">${esc(fmtDay(c.startAt))}</text>
  <text x="800" y="1010" text-anchor="middle" font-family="Inter, Arial, sans-serif" font-size="30" font-weight="700" fill="#0f1b3d">2vur2.az</text>
</svg>`;
  return new Response(svg, { headers: { "Content-Type": "image/svg+xml; charset=utf-8", "Cache-Control": "private, max-age=600" } });
}
