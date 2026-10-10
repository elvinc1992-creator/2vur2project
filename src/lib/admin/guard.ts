import "server-only";
import { eq } from "drizzle-orm";
import { redirect } from "next/navigation";
import { cache } from "react";
import { auth } from "@/auth";
import { db } from "@/db";
import { users } from "@/db/schema";

/** Admin paneli yalnız "admin" rolu üçün. Rol hər sorğuda bazadan oxunur (sessiyadakı rol köhnə ola bilər). */
export const requireAdmin = cache(async (next = "/admin") => {
  const session = await auth();
  if (!session?.user?.id) redirect(`/daxil-ol?next=${encodeURIComponent(next)}`);
  const [u] = await db.select({ id: users.id, name: users.name, role: users.role }).from(users).where(eq(users.id, session.user.id));
  if (u?.role !== "admin") redirect("/panel");
  return u;
});

export async function isAdmin(userId: string | undefined) {
  if (!userId) return false;
  const [u] = await db.select({ role: users.role }).from(users).where(eq(users.id, userId));
  return u?.role === "admin";
}
