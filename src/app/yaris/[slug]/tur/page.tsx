import type { Metadata } from "next";
import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { auth } from "@/auth";
import { ContestFrame } from "@/components/contest/contest-frame";
import { Countdown } from "@/components/contest/countdown";
import { TourRunner } from "@/components/contest/tour-runner";
import { contestBySlug, registrationOf } from "@/lib/contest/data";
import { fmtDay, fmtTime } from "@/lib/contest/mail";
import { serverNow } from "@/lib/contest/rules";
import { tourState } from "@/lib/contest/tour";

export const metadata: Metadata = { title: "Onlayn tur" };

/**
 * Onlayn tur: yalnız təyin olunmuş vaxtda açılır (əvvəl — gözləmə ekranı), giriş üçün son vaxtdan sonra yeni giriş
 * bağlanır. Səhifəyə daxil olmaq — tura başlamaq deməkdir; vaxt serverdə işləyir və dayanmır.
 */
export default async function TourPage(props: PageProps<"/yaris/[slug]/tur">) {
  const { slug } = await props.params;
  const c = await contestBySlug(slug);
  if (!c || c.status === "draft") notFound();
  const session = await auth();
  if (!session?.user?.id) redirect(`/daxil-ol?next=${encodeURIComponent(`/yaris/${slug}/tur`)}`);
  const reg = await registrationOf(c.id, session.user.id);
  if (!reg) redirect(`/yaris/${slug}#register`);

  const now = serverNow();
  const st = await tourState(c, reg, { enter: true, now });
  if (st.kind === "finished") redirect(`/yaris/${slug}/netice`);

  return (
    <ContestFrame title={c.title} back={`/yaris/${slug}`}>
      {st.kind === "before" && (
        <section className="grid gap-4 rounded-[24px] bg-[linear-gradient(135deg,#6366f1,#8b5cf6_55%,#ec4899)] p-6 text-white">
          <p className="m-0 text-[18px] font-bold">
            Tur {fmtDay(c.startAt)}, saat {fmtTime(c.startAt)}-da başlayır. Bu səhifəni açıq saxla — vaxt çatanda ilk sual avtomatik açılacaq.
          </p>
          <Countdown target={c.startAt.getTime()} serverNow={now} refreshOnEnd labels={["gün", "saat", "dəq", "san"]} />
          <ul className="m-0 grid gap-1.5 pl-5 text-white/95">
            <li>
              {c.questionCount} sual, {c.durationMin} dəqiqə; suallar bir-bir göstərilir, geri qayıtmaq olmur.
            </li>
            <li>Vaxt sayğacı dayanmır — səhifəni yeniləsən və ya bağlantı kəsilsə də vaxt gedir.</li>
            <li>Tab dəyişmə və pəncərədən çıxma jurnala yazılır.</li>
          </ul>
        </section>
      )}
      {st.kind === "closed" && (
        <section className="grid gap-3 rounded-[24px] border border-[#e6e9f2] bg-white p-6">
          <p className="m-0 text-[18px] font-bold">{st.phase === "ended" ? "Onlayn tur bitib." : "Tura giriş bağlanıb."}</p>
          <p className="m-0 text-[#5b6785]">Giriş turun başlanğıcından {c.entryWindowMin} dəqiqə sonra bağlanır.</p>
          <Link href={`/yaris/${slug}`} className="font-bold text-[#4f46e5]">
            Yarış səhifəsinə qayıt
          </Link>
        </section>
      )}
      {st.kind === "question" && <TourRunner key={st.q.n} contestId={c.id} q={st.q} serverNow={now} />}
    </ContestFrame>
  );
}
