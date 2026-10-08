import "server-only";
import { redirect } from "next/navigation";
import { auth } from "@/auth";
import { getDemoState } from "./state";

/** Server komponentləri üçün: giriş yoxlaması + demo vəziyyəti. */
export async function requireDemo(next: string) {
  const session = await auth();
  if (!session?.user?.id) redirect(`/daxil-ol?next=${encodeURIComponent(next)}`);
  const state = await getDemoState(session.user.id);
  return { user: session.user, state };
}

export function initials(name: string | null | undefined) {
  return (name?.trim()[0] ?? "?").toLocaleUpperCase("az");
}
