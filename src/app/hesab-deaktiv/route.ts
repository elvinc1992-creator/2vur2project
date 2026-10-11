import { signOut } from "@/auth";

// Admin hesabı passiv edib: sessiya bağlanır, giriş səhifəsində səbəb göstərilir.
export async function GET() {
  await signOut({ redirectTo: "/daxil-ol?deaktiv=1" });
}
