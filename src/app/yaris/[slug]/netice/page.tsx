import { and, asc, eq } from "drizzle-orm";
import type { Metadata } from "next";
import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { auth } from "@/auth";
import { ContestFrame } from "@/components/contest/contest-frame";
import { MathText } from "@/components/ui/math-text";
import { db } from "@/db";
import { contestAnswers, contestAttempts, contestTemplates, contestVariants } from "@/db/schema";
import { contestBySlug, participantCount, registrationOf, resultOf } from "@/lib/contest/data";
import { renderTemplate } from "@/lib/contest/expr";
import { serverNow } from "@/lib/contest/rules";
import { tourEndOf } from "@/lib/contest/tour";
import { certificateUrl } from "@/lib/contest/token";
import { cn } from "@/lib/cn";

export const metadata: Metadata = { title: "Nəticəm" };

const mmss = (ms: number) => `${Math.floor(ms / 60000)} dəq ${Math.round((ms % 60000) / 1000)} san`;

/** İştirakçının nəticəsi: bal (tur bitən kimi), yer (nəticələr hesablanandan sonra), həllər — tur hamı üçün bitəndən sonra. */
export default async function ResultPage(props: PageProps<"/yaris/[slug]/netice">) {
  const { slug } = await props.params;
  const c = await contestBySlug(slug);
  if (!c || c.status === "draft") notFound();
  const session = await auth();
  if (!session?.user?.id) redirect(`/daxil-ol?next=${encodeURIComponent(`/yaris/${slug}/netice`)}`);
  const reg = await registrationOf(c.id, session.user.id);
  if (!reg) redirect(`/yaris/${slug}#register`);

  const [[attempt], result, participants] = await Promise.all([
    db.select().from(contestAttempts).where(eq(contestAttempts.registrationId, reg.id)),
    resultOf(reg.id),
    participantCount(c.id),
  ]);
  const ended = serverNow() >= tourEndOf(c);

  if (!attempt || !attempt.finishedAt) {
    return (
      <ContestFrame title="Nəticəm" back={`/yaris/${slug}`}>
        <p className="m-0 rounded-[20px] border border-[#e6e9f2] bg-white p-6 text-[17px]">
          {attempt ? (
            <>
              Tur hələ davam edir.{" "}
              <Link href={`/yaris/${slug}/tur`} className="font-bold text-[#4f46e5]">
                Tura qayıt →
              </Link>
            </>
          ) : ended ? (
            "Onlayn turda iştirak etməmisən."
          ) : (
            "Tur hələ başlamayıb."
          )}
        </p>
      </ContestFrame>
    );
  }

  const rows = await db
    .select({ v: contestVariants, a: contestAnswers, solution: contestTemplates.solution })
    .from(contestVariants)
    .leftJoin(contestAnswers, and(eq(contestAnswers.registrationId, contestVariants.registrationId), eq(contestAnswers.n, contestVariants.n)))
    .innerJoin(contestTemplates, eq(contestTemplates.id, contestVariants.templateId))
    .where(eq(contestVariants.registrationId, reg.id))
    .orderBy(asc(contestVariants.n));
  const score = rows.filter((r) => r.a?.correct).length;
  const total = attempt.finishedAt.getTime() - attempt.startedAt.getTime();

  return (
    <ContestFrame title="Nəticəm" back={`/yaris/${slug}`}>
      <section aria-label="Nəticə" className="grid gap-4 rounded-[24px] bg-[linear-gradient(135deg,#6366f1,#8b5cf6_55%,#ec4899)] p-6 text-white sm:grid-cols-3">
        <div>
          <small className="font-semibold text-white/85">Bal</small>
          <p className="m-0 text-[40px] font-black">
            {score} / {rows.length}
          </p>
        </div>
        <div>
          <small className="font-semibold text-white/85">Sərf olunan vaxt</small>
          <p className="m-0 text-[22px] font-extrabold">{mmss(total)}</p>
        </div>
        <div>
          <small className="font-semibold text-white/85">Yer</small>
          <p className="m-0 text-[22px] font-extrabold">
            {result?.disqualified ? "Diskvalifikasiya" : result?.place ? `${result.place} / ${participants}` : "Tur bitəndən sonra"}
          </p>
        </div>
      </section>
      {result?.disqualified && result.dqReason && <p className="m-0 rounded-[16px] bg-[#fef2f2] p-4 font-semibold text-[#991b1b]">Səbəb: {result.dqReason}</p>}
      {result?.finalist && !result.disqualified && (
        <p className="m-0 rounded-[16px] bg-[#ecfdf5] p-4 font-semibold text-[#047857]">
          🎉 Təbrik edirik, finala keçdin! Finalın vaxtı və məkanı e-poçtuna göndəriləcək.
        </p>
      )}
      {result && !result.disqualified && (
        <a href={certificateUrl(reg.id)} target="_blank" rel="noopener" className="justify-self-start rounded-[14px] border-[1.5px] border-[#c4b5fd] bg-white px-5 py-3 font-extrabold text-[#4f46e5] no-underline">
          📜 Sertifikatıma bax
        </a>
      )}

      <section aria-labelledby="sol" className="grid gap-3">
        <h2 id="sol" className="m-0 text-[22px] font-black">Suallar və həllər</h2>
        {!ended ? (
          <p className="m-0 text-[#5b6785]">Sualların həlli və izahı tur hamı üçün bitdikdən sonra açılacaq.</p>
        ) : (
          <ol className="m-0 grid list-none gap-3 p-0">
            {rows.map(({ v, a, solution }) => {
              const options = JSON.parse(v.options) as Record<string, string>;
              return (
                <li key={v.n} className="grid gap-2 rounded-[18px] border border-[#e6e9f2] bg-white p-4">
                  <p className="m-0">
                    <b>{v.n}. </b>
                    <MathText text={v.text} />
                  </p>
                  <p className={cn("m-0 text-[14px] font-semibold", a?.correct ? "text-[#047857]" : "text-[#b91c1c]")}>
                    {a?.correct ? "✓ Düzgün" : a?.given ? `✗ Sənin cavabın: ${a.given}` : "✗ Cavabsız (vaxt bitib)"} · Düzgün cavab: {v.correct}){" "}
                    <MathText text={options[v.correct]} />
                  </p>
                  {solution && (
                    <p className="m-0 rounded-[12px] bg-[#f5f3ff] p-3 text-[14px]">
                      <MathText text={renderTemplate(solution, JSON.parse(v.values))} />
                    </p>
                  )}
                </li>
              );
            })}
          </ol>
        )}
      </section>
    </ContestFrame>
  );
}
