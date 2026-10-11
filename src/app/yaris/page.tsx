import type { Metadata } from "next";
import { ContestLanding } from "@/components/contest/contest-landing";
import { ContestSoon } from "@/components/contest/contest-soon";
import { currentContest } from "@/lib/contest/data";

export const metadata: Metadata = { title: "Riyaziyyat yarışı" };

/** Cari yarış (passiv olmayan, ən son); yoxdursa — "tezliklə olacaq" səhifəsi. */
export default async function ContestIndex() {
  const c = await currentContest();
  return c ? <ContestLanding contestId={c.id} /> : <ContestSoon />;
}
