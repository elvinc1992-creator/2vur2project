import { NextResponse, type NextRequest } from "next/server";

// Epoint-in uğurlu ödəniş ünvanı (success_redirect_url): sifariş nömrəsi (?o=) ilə qəbz səhifəsinə yönləndirir.
// Nömrə yoxdursa (kabinetdəki ümumi ünvan) — ödəniş tarixçəsi profildədir.
export function GET(req: NextRequest) {
  const o = req.nextUrl.searchParams.get("o");
  return NextResponse.redirect(new URL(o ? `/odenis/ugurlu?o=${encodeURIComponent(o)}` : "/profil", req.nextUrl));
}
