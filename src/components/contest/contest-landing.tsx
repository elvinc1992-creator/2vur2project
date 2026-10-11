import Link from "next/link";
import { after } from "next/server";
import { auth } from "@/auth";
import { ensureActive } from "@/lib/auth/account";
import { Logo } from "@/components/logo";
import { db } from "@/db";
import { users } from "@/db/schema";
import { eq } from "drizzle-orm";
import { contestById, leaderboard, prizesOf, prizeView, registrationCount, registrationOf, type ContestRow } from "@/lib/contest/data";
import { fmtDay, fmtTime } from "@/lib/contest/mail";
import { processContest } from "@/lib/contest/process";
import { entryDeadline, serverNow, tourPhase } from "@/lib/contest/rules";
import { cn } from "@/lib/cn";
import { Countdown } from "./countdown";
import { LeaderboardTabs } from "./leaderboard-tabs";
import { ContestRegisterForm } from "./register-form";

// "2vur2 Riyaziyyat Yarışı" səhifəsi (Prompts/yaris.html dizaynı): bütün rəqəmlər bazadan.

const brand = "bg-[linear-gradient(135deg,#6366f1,#8b5cf6_55%,#ec4899)]";
const h2 = "m-0 mb-1.5 text-[clamp(24px,3.2vw,32px)] font-black tracking-[-0.02em] text-[#0f1b3d]";
const sub = "m-0 mb-5 text-[#5b6785]";
const azn = (v: number) => `${Number.isInteger(v) ? v : v.toFixed(2)} ₼`;

const RULES = [
  ["⏱️", "Hamı eyni anda başlayır", (c: ContestRow) => `Tur ${fmtTime(c.startAt)}-da başlayır. ${fmtTime(new Date(entryDeadline({ startAt: c.startAt.getTime(), entryWindowMin: c.entryWindowMin, durationMin: c.durationMin })))}-dan sonra giriş bağlanır.`],
  ["➡️", "Suallar bir-bir göstərilir", () => "Hər suala vaxt limiti var. Növbəti suala keçəndən sonra geri qayıtmaq olmur."],
  ["🔢", "Hər iştirakçıya fərqli variant", () => "Sualların rəqəmləri hər iştirakçı üçün fərqli olur."],
  ["⚡", "Bal: düzgünlük + sürət", () => "Bərabər nəticədə daha tez bitirən irəlidə olur."],
  ["🤖", "AI və kənar kömək qadağandır", () => "ChatGPT, kalkulyator, başqasının köməyi və həlləri paylaşmaq qadağandır."],
  ["👤", "Bir nəfər — bir hesab", () => "Saxta və ya təkrar hesablar aşkarlansa, diskvalifikasiya olunur."],
  ["🎥", "Final yalnız əyani keçirilir", () => "Finalın vaxtı və məkanı finalçılara ayrıca bildiriləcək. Finala gəlməyən iştirakçı mükafat almır."],
  ["👨‍👩‍👧", "Azyaşlı qaliblər", () => "Pul mükafatı valideynin hesabına köçürülür və ya nağd şəkildə təqdim olunur."],
] as const;

const FAQ = [
  ["İştirak pulludur?", "Xeyr. Qeydiyyatdan keçən hər kəs pulsuz iştirak edir və mükafat qazana bilir. Pulsuz, Pro və Premium hesablar arasında yarışda heç bir fərq yoxdur."],
  ["Telefondan iştirak etmək olar?", "Bəli, amma kompüter və ya planşet daha rahatdır. Sabit internet bağlantısı olsun."],
  ["İnternet kəsilsə, nə olacaq?", "Verdiyin cavablar saxlanılır, amma vaxt sayğacı dayanmır. Bağlantı kəsildiyi müddətdə vaxt işləməyə davam edir və itən vaxt geri qaytarılmır. Bu, qəsdən çıxıb kənar kömək almağın qarşısını almaq üçündür. Yarışdan əvvəl internet bağlantını yoxla."],
  ["Final necə keçirilir?", "Final yalnız əyani keçirilir, onlayn variantı yoxdur. Vaxt və məkan barədə məlumat finalçılara ayrıca bildiriləcək."],
  ["Bərabər bal olarsa?", "Daha tez bitirən irəlidə olur. Vaxt da eynidirsə, mükafat bərabər bölünür."],
  ["Mükafat necə verilir?", "Pul mükafatı yekun nəticələr elan olunandan sonra 10 iş günü ərzində verilir: valideynin hesabına köçürülür və ya nağd şəkildə təqdim olunur."],
] as const;

export async function ContestLanding({ contestId }: { contestId: string }) {
  // Avtomatik işlər (xatırlatma, nəticələr) — cavabı gecikdirmədən.
  after(() => processContest(contestId).catch((e) => console.error("[yaris] process", e)));
  const c = (await contestById(contestId))!;
  const now = serverNow();
  const session = await auth();
  if (session?.user?.id) await ensureActive(session.user.id);
  const [prizes, regs, lb, myReg, me] = await Promise.all([
    prizesOf(c.id),
    registrationCount(c.id),
    c.resultsComputedAt ? leaderboard(c.id) : null,
    session?.user?.id ? registrationOf(c.id, session.user.id) : null,
    session?.user?.id
      ? db.select({ name: users.name, surname: users.surname, email: users.email, grade: users.grade }).from(users).where(eq(users.id, session.user.id)).then((r) => r[0])
      : null,
  ]);
  // Admin qeydiyyatı passiv edibsə — ayrıca mesajla göstərilir (tur və qeydiyyat yoxdur).
  const reg = myReg?.status === "active" ? myReg : null;
  const disabledReg = myReg?.status === "passive";
  const { prizes: shown, fund, boosted } = prizeView(c, prizes, regs);
  const times = { startAt: c.startAt.getTime(), entryWindowMin: c.entryWindowMin, durationMin: c.durationMin };
  const phase = tourPhase(times, now);
  const regOpen = c.status === "registration" && now >= c.regStartAt.getTime() && now <= c.regEndAt.getTime();
  const badge =
    phase === "open" || phase === "late"
      ? "Onlayn tur davam edir"
      : phase === "ended"
        ? c.status === "results"
          ? "Yekun nəticələr elan olunub"
          : "Onlayn tur bitib"
        : regOpen
          ? "Qeydiyyat açıqdır · iştirak pulsuzdur"
          : now < c.regStartAt.getTime()
            ? `Qeydiyyat ${fmtDay(c.regStartAt)} açılır`
            : "Qeydiyyat bağlanıb";
  const p = (place: number) => shown.find((x) => x.placeFrom === place && x.placeTo === place);
  const range = shown.find((x) => x.placeFrom > 3);
  const firstBase = prizes.find((x) => x.placeFrom === 1)?.amount ?? 0;
  const tourHref = `/yaris/${c.slug}/tur`;

  const steps = [
    { title: "Qeydiyyat", text: "Hesabına daxil ol, sinfini seç və qeydiyyatı tamamla. Bir dəqiqə çəkir.", when: `${fmtDay(c.regStartAt)} – ${fmtDay(c.regEndAt)}` },
    {
      title: "Onlayn tur",
      text: `Hamı eyni anda başlayır: ${c.questionCount} sual, ${c.durationMin} dəqiqə. Suallar bir-bir göstərilir, geri qayıtmaq olmur.`,
      when: `${fmtDay(c.startAt)} · ${fmtTime(c.startAt)}`,
    },
    {
      title: "Final",
      text: `Ən yüksək nəticə göstərən ilk ${c.finalistCount} nəfər finala keçir. Final yalnız əyani keçirilir. Vaxt və məkan barədə finalçılara ayrıca məlumat veriləcək.`,
      when: c.finalAt ? fmtDay(c.finalAt) : "Tarix elan olunacaq",
    },
    { title: "Mükafatlandırma", text: "Qaliblər elan olunur. Hər iştirakçı sertifikat və şəxsi təhlil alır.", when: c.awardsAt ? fmtDay(c.awardsAt) : "Tarix elan olunacaq" },
  ];

  const lbData = lb && {
    p: lb.students.map((s) => ({ place: String(s.place), name: s.name, sub: [s.region, s.school].filter(Boolean).join(", "), score: String(s.score) })),
    s: lb.schools.map((s, i) => ({ place: String(i + 1), name: s.key, sub: s.region, score: String(s.avg).replace(".", ",") })),
    r: lb.regions.map((s, i) => ({ place: String(i + 1), name: s.key, sub: `${s.n} iştirakçı`, score: String(s.avg).replace(".", ",") })),
  };

  return (
    <div className="min-h-dvh bg-[#f4f6fb] text-[#0f1b3d]">
      <nav aria-label="Yarış" className="sticky top-0 z-20 border-b border-[#e6e9f2] bg-[#f4f6fb]/85 backdrop-blur-md">
        <div className="mx-auto flex h-[60px] max-w-[1140px] items-center justify-between gap-3 px-4">
          <Logo />
          <div className="hidden gap-5 text-[14px] font-semibold md:flex">
            {[
              ["#format", "Format"],
              ["#prizes", "Mükafatlar"],
              ["#rules", "Qaydalar"],
              ["#leaderboard", "Reytinq"],
              ["#faq", "Suallar"],
            ].map(([href, l]) => (
              <a key={href} href={href} className="text-[#5b6785] no-underline hover:text-[#0f1b3d]">
                {l}
              </a>
            ))}
          </div>
          <a href={reg ? (phase === "open" || phase === "late" ? tourHref : "#register") : "#register"} className={cn(brand, "rounded-[14px] px-4 py-2.5 text-[14px] font-extrabold text-white no-underline")}>
            {reg && (phase === "open" || phase === "late") ? "Tura keç" : "Qeydiyyat"}
          </a>
        </div>
      </nav>

      <main className="mx-auto max-w-[1140px] px-4">
        {/* HERO */}
        <header
          className={cn(
            brand,
            "relative mt-[22px] grid items-center gap-[30px] overflow-hidden rounded-[30px] px-[22px] py-[34px] text-white shadow-[0_30px_60px_-30px_rgba(99,102,241,.8)] lg:grid-cols-[1.3fr_1fr] lg:px-10 lg:py-12",
          )}
        >
          <span aria-hidden="true" className="absolute -top-[140px] -right-[90px] size-[340px] rounded-full bg-white/10" />
          <span aria-hidden="true" className="absolute -bottom-[120px] left-[38%] size-[200px] rounded-full bg-white/10" />
          <div className="relative z-[1]">
            <span className="inline-flex items-center gap-2 rounded-full bg-white/20 px-3.5 py-[7px] text-[13px] font-bold">
              <i className="size-2 animate-pulse rounded-full bg-[#4ade80] shadow-[0_0_0_4px_rgba(74,222,128,.3)]" aria-hidden="true" />
              {badge}
            </span>
            <h1 className="mt-4 mb-3 text-[clamp(32px,5vw,54px)] leading-[1.05] font-black tracking-[-0.03em] text-white">{c.title}</h1>
            <p className="m-0 mb-6 max-w-[540px] text-[17px] text-white/95">
              {c.description ||
                `DİM formatında ${c.questionCount} sual, ${c.durationMin} dəqiqə və real rəqiblər. Biliyini sına, reytinqdə yerini gör, `}
              {!c.description && <b>{azn(fund)} mükafat fondundan payını qazan.</b>}
            </p>
            <div className="flex flex-wrap gap-2.5">
              {reg && (phase === "open" || phase === "late" || phase === "ended") ? (
                <Link href={phase === "ended" ? `/yaris/${c.slug}/netice` : tourHref} className="inline-flex items-center gap-2 rounded-[14px] bg-white px-[22px] py-3.5 font-extrabold text-[#4f46e5] no-underline shadow-[0_12px_26px_-12px_rgba(0,0,0,.4)]">
                  {phase === "ended" ? "Nəticəmə bax →" : "Tura keç →"}
                </Link>
              ) : (
                <a href="#register" className="inline-flex items-center gap-2 rounded-[14px] bg-white px-[22px] py-3.5 font-extrabold text-[#4f46e5] no-underline shadow-[0_12px_26px_-12px_rgba(0,0,0,.4)]">
                  {reg ? "Qeydiyyatın təsdiqlənib ✓" : "İndi qeydiyyatdan keç →"}
                </a>
              )}
              <a href="#format" className="inline-flex items-center gap-2 rounded-[14px] border border-white/35 bg-white/16 px-[22px] py-3.5 font-extrabold text-white no-underline">
                Necə keçirilir?
              </a>
            </div>
          </div>
          <div className="relative z-[1] rounded-[22px] border border-white/30 bg-white/14 p-[22px] backdrop-blur-md">
            <small className="font-semibold text-white/85">{phase === "before" ? "Onlayn tura qalıb" : phase === "ended" ? "Onlayn tur bitib" : "Tur davam edir"}</small>
            <div className="mt-2.5 mb-4">
              <Countdown target={c.startAt.getTime()} serverNow={now} labels={["gün", "saat", "dəq", "san"]} />
            </div>
            <div className="flex items-end justify-between border-t border-white/30 pt-3.5">
              <div>
                <small className="font-semibold text-white/85">Mükafat fondu</small>
                <br />
                <b className="text-[34px] font-black">{azn(fund)}</b>
              </div>
              <div className="text-[13px] text-white/90">
                👥 <b>{regs}</b> qeydiyyat
              </div>
            </div>
          </div>
        </header>

        {/* FORMAT */}
        <section id="format" aria-labelledby="format-title" className="scroll-mt-16 pt-11">
          <h2 id="format-title" className={h2}>Yarış necə keçirilir?</h2>
          <p className={sub}>İki mərhələ. Onlayn turda hamı iştirak edə bilər, mükafatlar isə yalnız əyani finalda müəyyən olunur.</p>
          <ol className="m-0 grid list-none gap-3.5 p-0 sm:grid-cols-2 lg:grid-cols-4">
            {steps.map((s, i) => (
              <li key={s.title} className="rounded-[20px] border border-[#e6e9f2] bg-white p-5">
                <div className={cn(brand, "mb-3 grid size-10 place-items-center rounded-[12px] font-black text-white")} aria-hidden="true">
                  {i + 1}
                </div>
                <b className="mb-1 block text-[16px]">{s.title}</b>
                <p className="m-0 text-[14px] text-[#5b6785]">{s.text}</p>
                <em className="mt-2.5 inline-block rounded-full bg-[#eef0ff] px-2.5 py-1 text-[12px] font-bold text-[#4f46e5] not-italic">{s.when}</em>
              </li>
            ))}
          </ol>
        </section>

        {/* PRIZES */}
        <section id="prizes" aria-labelledby="prizes-title" className="scroll-mt-16 pt-11">
          <h2 id="prizes-title" className={h2}>Mükafatlar</h2>
          <p className={sub}>Bütün iştirakçılar ümumi reytinqdə yarışır. Mükafatlar final nəticəsinə görə verilir.</p>
          <div className="grid items-end gap-4 sm:grid-cols-[1fr_1.15fr_1fr]">
            {[2, 1, 3].map((place) => {
              const x = p(place);
              if (!x) return <div key={place} />;
              return (
                <div
                  key={place}
                  className={cn(
                    "relative rounded-[24px] border-2 bg-white px-5 py-[26px] text-center",
                    place === 1 && "border-[#f59e0b] bg-[linear-gradient(180deg,#fffbeb,#fff)] py-9 shadow-[0_24px_44px_-24px_rgba(245,158,11,.7)] max-sm:order-first",
                    place === 2 && "border-[#cbd5e1]",
                    place === 3 && "border-[#e7c6a7]",
                  )}
                >
                  {place === 1 && (
                    <span className="absolute -top-[13px] left-1/2 -translate-x-1/2 rounded-full bg-[#b45309] px-3 py-1 text-[12px] font-black tracking-[0.12em] text-white">QALİB</span>
                  )}
                  <div className="text-[46px] leading-none" aria-hidden="true">{["🥇", "🥈", "🥉"][place - 1]}</div>
                  <div className="mt-2 text-[12px] font-extrabold tracking-[0.1em] text-[#5b6785] uppercase">{place}-{place === 1 ? "ci" : place === 2 ? "ci" : "cü"} yer</div>
                  <div className={cn("my-1 text-[42px] font-black tracking-[-0.02em]", place === 1 && "text-[#b45309]")}>
                    {x.amount ? azn(x.amount) : "—"}
                  </div>
                  <div className="text-[14px] font-semibold text-[#5b6785]">{x.description}</div>
                </div>
              );
            })}
          </div>
          <div className="mt-4 grid gap-3.5 md:grid-cols-2">
            {range && (
              <div className="flex items-center gap-3.5 rounded-[18px] border border-[#e6e9f2] bg-white px-[18px] py-4">
                <span className="text-[28px]" aria-hidden="true">🎁</span>
                <div>
                  <b className="block">{range.placeFrom}–{range.placeTo}-cu yerlər</b>
                  <small className="text-[#5b6785]">{range.description}</small>
                </div>
              </div>
            )}
            <div className="flex items-center gap-3.5 rounded-[18px] border border-[#e6e9f2] bg-white px-[18px] py-4">
              <span className="text-[28px]" aria-hidden="true">📜</span>
              <div>
                <b className="block">Bütün iştirakçılar</b>
                <small className="text-[#5b6785]">Elektron sertifikat və zəif mövzu təhlili</small>
              </div>
            </div>
          </div>
          {c.boostThreshold && c.boostFirstPrize && (
            <div className="mt-4 flex flex-wrap items-center gap-3.5 rounded-[18px] bg-[#0f1b3d] px-5 py-4 text-white">
              <span className="text-[28px]" aria-hidden="true">🚀</span>
              <div className="min-w-[220px] flex-1">
                <b>
                  {boosted
                    ? `${c.boostThreshold} iştirakçı həddi keçildi — 1-ci yerin mükafatı ${azn(c.boostFirstPrize)}-ə qalxdı!`
                    : `${c.boostThreshold} iştirakçı olarsa, 1-ci yerin mükafatı ${azn(firstBase)}-dən ${azn(c.boostFirstPrize)}-ə qalxır!`}
                </b>
                <div
                  role="progressbar"
                  aria-label="Fondun artma göstəricisi"
                  aria-valuemin={0}
                  aria-valuemax={c.boostThreshold}
                  aria-valuenow={Math.min(regs, c.boostThreshold)}
                  className="mt-2 h-2.5 overflow-hidden rounded-full bg-white/15"
                >
                  <i className="block h-full rounded-full bg-[linear-gradient(90deg,#f59e0b,#ec4899)]" style={{ width: `${Math.min(100, (regs / c.boostThreshold) * 100)}%` }} />
                </div>
                <small className="text-white/80">
                  {regs} / {c.boostThreshold} · dostlarını dəvət et
                </small>
              </div>
            </div>
          )}
        </section>

        {/* RULES */}
        <section id="rules" aria-labelledby="rules-title" className="scroll-mt-16 pt-11">
          <h2 id="rules-title" className={h2}>Qaydalar</h2>
          <p className={sub}>Yarış ədalətli olsun deyə bu qaydalar hamıya aiddir.</p>
          <ul className="m-0 grid list-none gap-3.5 p-0 md:grid-cols-2">
            {RULES.map(([icon, title, text]) => (
              <li key={title} className="flex gap-3 rounded-[16px] border border-[#e6e9f2] bg-white p-4">
                <span className="flex-none text-[22px]" aria-hidden="true">{icon}</span>
                <div>
                  <b className="block text-[15px]">{title}</b>
                  <p className="m-0 mt-0.5 text-[13.5px] text-[#5b6785]">{text(c)}</p>
                </div>
              </li>
            ))}
          </ul>
          <p className="mt-3.5 mb-0 rounded-[16px] border border-[#fecaca] bg-[#fef2f2] px-[18px] py-3.5 text-[14px] font-semibold text-[#991b1b]">
            ⚠️ Onlayn tur ilə final nəticəsi arasında kəskin fərq olarsa, münsiflər nəticəni ləğv edə bilər. Mükafatlar yalnız final təsdiqindən sonra verilir.
          </p>
        </section>

        {/* LEADERBOARD */}
        <section id="leaderboard" aria-labelledby="lb-title" className="scroll-mt-16 pt-11">
          <h2 id="lb-title" className={h2}>{lbData ? "Reytinq" : "Canlı reytinq"}</h2>
          <p className={sub}>
            {lbData ? "Onlayn turun nəticələri. Məktəb və rayon reytinqi iştirakçıların orta balına görədir (ən az 3 iştirakçı)." : "Tur bitəndən sonra nəticələr burada yenilənəcək. Məktəbin də reytinqdə yarışır!"}
          </p>
          {lbData ? (
            <LeaderboardTabs
              data={lbData}
              labels={{ p: "Şagirdlər", s: "Məktəblər", r: "Rayonlar", place: "#", name: "Ad", sub: "Məktəb / Rayon", score: "Bal", empty: "Hələ məlumat yoxdur." }}
            />
          ) : (
            <div className="rounded-[22px] border border-[#e6e9f2] bg-white px-4 py-8 text-center text-[#5b6785]">
              <p className="m-0 font-semibold">Nəticələr tur bitdikdən sonra yayımlanacaq.</p>
            </div>
          )}
        </section>

        {/* REGISTER */}
        <section id="register" aria-labelledby="reg-title" className="scroll-mt-16 pt-11">
          <div className="grid items-start gap-5 lg:grid-cols-[1fr_1.1fr]">
            <div className={cn(brand, "rounded-[24px] p-7 text-white")}>
              <h2 id="reg-title" className="m-0 mb-2 text-[26px] font-black text-white">Yerini indi tut 🎯</h2>
              <p className="m-0 text-white/95">
                Qeydiyyat {fmtDay(c.regEndAt)} saat {fmtTime(c.regEndAt)}-da bağlanır.
              </p>
              <ul className="mt-3 mb-0 grid gap-2 pl-[18px]">
                <li>İştirak tamamilə pulsuzdur</li>
                <li>
                  Tur {fmtDay(c.startAt)} saat {fmtTime(c.startAt)}-da başlayır
                </li>
                <li>Nəticələr e-poçtuna göndəriləcək</li>
                <li>Dostunu dəvət et, mükafat fondu böyüsün</li>
              </ul>
            </div>
            {disabledReg ? (
              <div role="status" className="grid gap-2 rounded-[24px] border border-[#fecaca] bg-[#fef2f2] p-6 text-center text-[#991b1b]">
                <h3 className="m-0 text-[20px] font-black">Qeydiyyatın deaktiv edilib</h3>
                <p className="m-0">Admin bu yarışa qeydiyyatını dayandırıb. Ətraflı məlumat üçün bizimlə əlaqə saxla.</p>
              </div>
            ) : reg ? (
              <div role="status" className="grid gap-3 rounded-[24px] border border-[#e6e9f2] bg-white p-6 text-center">
                <div className="text-[48px]" aria-hidden="true">✅</div>
                <h3 className="m-0 text-[22px] font-black">Artıq qeydiyyatdasan</h3>
                <p className="m-0 text-[#5b6785]">
                  Onlayn tur: <b className="text-[#0f1b3d]">{fmtDay(c.startAt)}, saat {fmtTime(c.startAt)}</b>
                </p>
                <p className="m-0 text-[#5b6785]">Sənin dəvət kodun:</p>
                <div className="rounded-[12px] bg-[#f5f3ff] px-3 py-2.5 font-mono text-[26px] font-bold">{reg.inviteCode}</div>
                {(phase === "open" || phase === "late") && (
                  <Link href={tourHref} className={cn(brand, "rounded-[14px] px-5 py-3.5 font-extrabold text-white no-underline")}>
                    Tura keç →
                  </Link>
                )}
                {phase === "ended" && (
                  <Link href={`/yaris/${c.slug}/netice`} className="font-bold text-[#4f46e5]">
                    Nəticəmə bax →
                  </Link>
                )}
              </div>
            ) : !regOpen ? (
              <div className="rounded-[24px] border border-[#e6e9f2] bg-white p-6 text-center">
                <p className="m-0 text-[18px] font-bold">{now < c.regStartAt.getTime() ? `Qeydiyyat ${fmtDay(c.regStartAt)} açılır.` : "Qeydiyyat bağlanıb."}</p>
              </div>
            ) : !session?.user ? (
              <div className="grid gap-3 rounded-[24px] border border-[#e6e9f2] bg-white p-6">
                <p className="m-0 text-[17px] font-bold">Qeydiyyat üçün əvvəlcə hesabına daxil ol.</p>
                <p className="m-0 text-[#5b6785]">Daxil olandan sonra forma ad, soyad və e-poçtunla avtomatik doldurulacaq.</p>
                <div className="flex flex-wrap gap-2.5">
                  <Link href={`/daxil-ol?next=${encodeURIComponent(`/yaris/${c.slug}#register`)}`} className={cn(brand, "rounded-[14px] px-5 py-3 font-extrabold text-white no-underline")}>
                    Daxil ol
                  </Link>
                  <Link href="/qeydiyyat" className="rounded-[14px] border-[1.5px] border-[#e6e9f2] px-5 py-3 font-extrabold text-[#0f1b3d] no-underline">
                    Hesab yarat
                  </Link>
                </div>
              </div>
            ) : (
              <ContestRegisterForm
                contestId={c.id}
                autofilled
                defaults={{ firstName: me?.name ?? "", lastName: me?.surname ?? "", email: me?.email ?? "", grade: me?.grade ?? null }}
              />
            )}
          </div>
        </section>

        {/* FAQ */}
        <section id="faq" aria-labelledby="faq-title" className="scroll-mt-16 pt-11">
          <h2 id="faq-title" className={cn(h2, "mb-5")}>Tez-tez verilən suallar</h2>
          {FAQ.map(([q, a]) => (
            <details key={q} className="group mb-2.5 rounded-[16px] border border-[#e6e9f2] bg-white px-[18px] py-1">
              <summary className="flex cursor-pointer list-none justify-between py-3.5 font-bold after:text-[22px] after:leading-none after:text-[#8b5cf6] after:content-['+'] group-open:after:content-['–'] [&::-webkit-details-marker]:hidden">
                {q}
              </summary>
              <p className="m-0 mb-3.5 text-[#5b6785]">{a}</p>
            </details>
          ))}
        </section>
      </main>

      <footer className="mx-auto mt-12 max-w-[1140px] border-t border-[#e6e9f2] px-4 pt-6 pb-9 text-center text-[13px] text-[#5b6785]">
        © 2vur2.az · Bu material 2vur2.az saytına məxsusdur
      </footer>
    </div>
  );
}
