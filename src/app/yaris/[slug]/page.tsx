import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { auth } from "@/auth";
import { ContestLanding } from "@/components/contest/contest-landing";
import { isAdmin } from "@/lib/admin/guard";
import { contestBySlug } from "@/lib/contest/data";

export async function generateMetadata(props: PageProps<"/yaris/[slug]">): Promise<Metadata> {
  const c = await contestBySlug((await props.params).slug);
  return { title: c?.title ?? "Riyaziyyat yarışı" };
}

/** Yarış səhifəsi; qaralamaya yalnız admin baxa bilər. */
export default async function ContestBySlug(props: PageProps<"/yaris/[slug]">) {
  const c = await contestBySlug((await props.params).slug);
  if (!c) notFound();
  if (c.status === "draft") {
    const session = await auth();
    if (!session?.user?.id || !(await isAdmin(session.user.id))) notFound();
  }
  return <ContestLanding contestId={c.id} />;
}
