import { NextResponse, type NextRequest } from "next/server";

// Epoint-in uğursuz ödəniş ünvanı (error_redirect_url): sifariş nömrəsi (?o=) ilə uğursuz ödəniş səhifəsinə yönləndirir.
export function GET(req: NextRequest) {
  const o = req.nextUrl.searchParams.get("o");
  return NextResponse.redirect(new URL(o ? `/odenis/ugursuz?o=${encodeURIComponent(o)}` : "/odenis/ugursuz", req.nextUrl));
}
