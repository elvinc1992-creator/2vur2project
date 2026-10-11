import { eq } from "drizzle-orm";
import type { Metadata } from "next";
import { ContestFrame } from "@/components/contest/contest-frame";
import { db } from "@/db";
import { contestRegistrations } from "@/db/schema";
import { unsubscribeContestAction } from "@/lib/contest/actions";
import { checkContestToken } from "@/lib/contest/token";

export const metadata: Metadata = { title: "E-poçtdan imtina" };

/** Yarış məktublarından imtina (e-poçtdakı imzalı link). Təsdiq düyməsi ilə — linkə keçid özü heç nəyi dəyişmir. */
export default async function Unsubscribe(props: PageProps<"/yaris/imtina">) {
  const sp = await props.searchParams;
  const r = typeof sp.r === "string" ? sp.r : "";
  const t = typeof sp.t === "string" ? sp.t : "";
  const valid = checkContestToken(r, "unsub", t);
  const [reg] = valid ? await db.select().from(contestRegistrations).where(eq(contestRegistrations.id, r)) : [];

  return (
    <ContestFrame title="Yarış məktublarından imtina">
      <section className="grid gap-3 rounded-[20px] border border-[#e6e9f2] bg-white p-6">
        {!reg ? (
          <p className="m-0">Link etibarsızdır.</p>
        ) : reg.unsubscribedAt ? (
          <p role="status" className="m-0 font-semibold">
            Hazırdır — {reg.email} ünvanına yarış məktubları artıq göndərilməyəcək.
          </p>
        ) : (
          <form action={unsubscribeContestAction} className="grid gap-3">
            <input type="hidden" name="r" value={r} />
            <input type="hidden" name="t" value={t} />
            <p className="m-0">
              <b>{reg.email}</b> ünvanına yarış məktubları (xatırlatma, nəticələr) göndərilməsin?
            </p>
            <button className="justify-self-start rounded-[14px] bg-[#0f1b3d] px-5 py-3 font-extrabold text-white">Bəli, imtina edirəm</button>
          </form>
        )}
      </section>
    </ContestFrame>
  );
}
