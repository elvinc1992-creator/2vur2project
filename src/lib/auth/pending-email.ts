import "server-only";
import { cookies } from "next/headers";

// Təsdiq gözləyən e-poçt: "Poçtunu yoxla" ekranı və "Yenidən göndər" üçün.
const COOKIE = "pending_email";

export async function setPendingEmail(email: string) {
  (await cookies()).set(COOKIE, email, {
    httpOnly: true,
    sameSite: "lax",
    secure: process.env.NODE_ENV === "production",
    path: "/",
    maxAge: 60 * 60 * 24,
  });
}

export async function getPendingEmail(): Promise<string | null> {
  return (await cookies()).get(COOKIE)?.value ?? null;
}

export async function clearPendingEmail() {
  (await cookies()).delete(COOKIE);
}
