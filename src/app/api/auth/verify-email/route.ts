import { NextResponse, type NextRequest } from "next/server";
import { verifyEmailToken } from "@/lib/auth/flows";
import { clearPendingEmail } from "@/lib/auth/pending-email";

export async function GET(req: NextRequest) {
  const token = req.nextUrl.searchParams.get("token");
  const status = token && token.length <= 200 ? await verifyEmailToken(token) : "invalid";
  if (status === "ok") await clearPendingEmail();
  return NextResponse.redirect(new URL(`/email-tesdiqi?status=${status}`, req.nextUrl));
}
