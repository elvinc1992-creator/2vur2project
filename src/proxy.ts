import NextAuth from "next-auth";
import { NextResponse } from "next/server";
import { authConfig } from "@/auth.config";

// Optimist yoxlama: əsas giriş yoxlaması server komponentlərində və API-də aparılır.
const { auth } = NextAuth(authConfig);

const PROTECTED = [
  "/panel",
  "/profil",
  "/onboarding",
  "/gunun-suallari",
  "/onlayn-repetitor",
  "/sehvlerim",
  "/bal-simulyatoru",
  "/tapshiriq",
  "/sinaq",
  "/abune",
  "/abunelikler",
  "/imtahan-qarsiligi",
  "/zeif-movzular",
  "/admin",
  // Demo mərhələsində mağaza da tətbiq daxilindədir (TZ-də ictimai /sinaqlar — landing mərhələsində).
  "/sinaqlar",
  "/odenis",
];
// /daxil-ol və /qeydiyyat daxil olmuş istifadəçiyə də açıqdır: başqa hesabla daxil olmaq və ya
// yeni hesab yaratmaq sessiyanı həmin hesaba keçirir (səhifədə xəbərdarlıq göstərilir).
const STAFF_ROLES = new Set(["teacher", "editor", "admin"]);

const matches = (path: string, prefixes: string[]) =>
  prefixes.some((p) => path === p || path.startsWith(`${p}/`));

export default auth((req) => {
  const { pathname, search } = req.nextUrl;
  const user = req.auth?.user;

  if (!user && matches(pathname, PROTECTED)) {
    const url = new URL("/daxil-ol", req.nextUrl);
    url.searchParams.set("next", `${pathname}${search}`);
    return NextResponse.redirect(url);
  }
  if (user && matches(pathname, ["/admin"]) && !STAFF_ROLES.has(user.role)) {
    return NextResponse.redirect(new URL("/panel", req.nextUrl));
  }
  return NextResponse.next();
});

export const config = {
  matcher: ["/((?!api|_next/static|_next/image|favicon.ico|.*\\.[a-z0-9]+$).*)"],
};
