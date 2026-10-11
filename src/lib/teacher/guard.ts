import "server-only";
import { eq } from "drizzle-orm";
import { redirect } from "next/navigation";
import { cache } from "react";
import { auth } from "@/auth";
import { db } from "@/db";
import { teacherAccounts, users } from "@/db/schema";

// Müəllim paneli yalnız "teacher" rolu üçün (rolu admin müraciəti təsdiqləyəndə verir). Rol hər sorğuda bazadan oxunur.

export const requireTeacher = cache(async (next = "/muellim") => {
  const session = await auth();
  if (!session?.user?.id) redirect(`/daxil-ol?next=${encodeURIComponent(next)}`);
  const [u] = await db
    .select({ id: users.id, name: users.name, surname: users.surname, role: users.role, status: users.status })
    .from(users)
    .where(eq(users.id, session.user.id));
  if (!u || u.status === "passive") redirect("/hesab-deaktiv");
  if (u.role !== "teacher") redirect("/muellim/muraciet");
  await db.insert(teacherAccounts).values({ userId: u.id }).onConflictDoNothing();
  const [acc] = await db.select().from(teacherAccounts).where(eq(teacherAccounts.userId, u.id));
  return { ...u, balance: acc.balance, dailyLimit: acc.dailyLimit };
});

export type Teacher = Awaited<ReturnType<typeof requireTeacher>>;
