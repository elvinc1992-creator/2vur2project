import { getTopicBook } from "@/lib/repetitor/source";
import { theoryAccess } from "@/lib/repetitor/theory";

// Nəzəriyyə kitabının HTML-i (nezeriyye səhifəsindəki iframe üçün). Müəllifin üslubu saytınkından ayrı qalsın deyə
// kitab ayrıca sənəddə açılır; vərəqləyəni saytın oxuyucusu (public/theoria/book.js) qurur.

const attr = (s: string) => s.replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/</g, "&lt;");

export async function GET(_req: Request, ctx: RouteContext<"/onlayn-repetitor/[movzu]/nezeriyye/kitab">) {
  const { movzu } = await ctx.params;
  const a = await theoryAccess(movzu);
  const html = a?.allowed && a.hasBook ? await getTopicBook(movzu) : null;
  if (!a || !html) return new Response("Tapılmadı", { status: 404 });
  const head = [
    `<meta name="topic" content="${attr(a.topic.name)}">`,
    a.next ? `<meta name="next-topic" content="${attr(a.next)}">` : "",
    `<link rel="stylesheet" href="/theoria/book.css">`,
  ].join("");
  const body = html.replace("</head>", `${head}</head>`).replace("</body>", `<script src="/theoria/book.js"></script></body>`);
  return new Response(body, {
    headers: { "Content-Type": "text/html; charset=utf-8", "Cache-Control": "private, no-cache" },
  });
}
