import "server-only";
import { eq } from "drizzle-orm";
import { redirect } from "next/navigation";
import { cache } from "react";
import { db } from "@/db";
import { users } from "@/db/schema";

// Hesabın statusu (admin passiv edə bilər). Sessiya JWT-dir — passiv hesabın açıq sessiyası
// növbəti sorğuda bağlanır (/hesab-deaktiv → çıxış → giriş səhifəsində mesaj).

export const accountStatus = cache(async (userId: string) => {
  const [u] = await db.select({ status: users.status }).from(users).where(eq(users.id, userId));
  return u?.status ?? null;
});

export const isPassive = async (userId: string) => (await accountStatus(userId)) === "passive";

/** Səhifələr üçün: hesab passivdirsə — sessiya bağlanır. */
export async function ensureActive(userId: string) {
  if (await isPassive(userId)) redirect("/hesab-deaktiv");
}
