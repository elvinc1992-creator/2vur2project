import type { Metadata } from "next";
import Link from "next/link";
import { ContestLanding } from "@/components/contest/contest-landing";
import { currentContest } from "@/lib/contest/data";

export const metadata: Metadata = { title: "Riyaziyyat yarışı" };

/** Cari yarış (qaralama olmayan, ən son). */
export default async function ContestIndex() {
  const c = await currentContest();
  if (!c) {
    return (
      <main className="mx-auto grid min-h-dvh max-w-[640px] content-center gap-3 px-4 text-center">
        <h1 className="text-h2 font-extrabold text-navy-900">Riyaziyyat yarışı</h1>
        <p className="text-ink-muted">Yeni yarış tezliklə elan olunacaq.</p>
        <Link href="/" className="font-semibold">
          Ana səhifəyə qayıt
        </Link>
      </main>
    );
  }
  return <ContestLanding contestId={c.id} />;
}
