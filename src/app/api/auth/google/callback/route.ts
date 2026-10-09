import { NextRequest } from "next/server";
import { handlers } from "@/auth";

// Google Console-da qeydiyyatdan keçmiş yönləndirmə ünvanı: /api/auth/google/callback.
// Sorğu (code, state və kukilərlə) Auth.js-in öz callback-inə — /api/auth/callback/google — ötürülür.
export async function GET(req: NextRequest) {
  const url = new URL(req.url);
  url.pathname = "/api/auth/callback/google";
  return handlers.GET(new NextRequest(url, { headers: req.headers }));
}
