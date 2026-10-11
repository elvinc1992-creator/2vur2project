import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { auth } from "@/auth";
import { ContestLanding } from "@/components/contest/contest-landing";
import { ContestSoon } from "@/components/contest/contest-soon";
import { isAdmin } from "@/lib/admin/guard";
import { contestBySlug } from "@/lib/contest/data";

export async function generateMetadata(props: PageProps<"/yaris/[slug]">): Promise<Metadata> {
  const c = await contestBySlug((await props.params).slug);
  return { title: c && c.status !== "draft" ? c.title : "Riyaziyyat yarışı" };
}

/** Yarış səhifəsi; passiv (draft) yarışı yalnız admin görür, başqalarına — "tezliklə olacaq" səhifəsi. */
export default async function ContestBySlug(props: PageProps<"/yaris/[slug]">) {
  const c = await contestBySlug((await props.params).slug);
  if (!c) notFound();
  if (c.status === "draft") {
    const session = await auth();
    if (!session?.user?.id || !(await isAdmin(session.user.id))) return <ContestSoon />;
  }
  return <ContestLanding contestId={c.id} />;
}
