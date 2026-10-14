import Link from "next/link";
import { Logo } from "@/components/logo";
import { cn } from "@/lib/cn";

// Aktiv yarış yoxdur (və ya yarış passivdir): normal görünüşlü səhifə, bildiriş və yarış haqqında qısa məlumat.

const brand = "bg-[linear-gradient(135deg,#6366f1,#8b5cf6_55%,#ec4899)]";
const h2 = "m-0 mb-1.5 text-[clamp(24px,3.2vw,32px)] font-black tracking-[-0.02em] text-[#0f1b3d]";
const sub = "m-0 mb-5 text-[#5b6785]";

const STEPS = [
  ["Qeydiyyat", "Yarış elan olunanda hesabına daxil olub bir dəqiqəyə qeydiyyatdan keçirsən. İştirak ödənişsizdir."],
  ["Onlayn tur", "Hamı eyni anda başlayır: DİM formatında suallar, suallar bir-bir göstərilir, geri qayıtmaq olmur."],
  ["Əyani final", "Ən yüksək nəticə göstərən iştirakçılar finala keçir. Final yalnız əyani keçirilir."],
  ["Mükafatlandırma", "Qaliblər pul mükafatı və Premium abunə alır, hər iştirakçı sertifikat və şəxsi təhlil."],
] as const;

const RULES = [
  ["🆓", "Ödənişsiz və hamı üçün eyni", "Free, Pro və Premium hesablar arasında yarışda heç bir fərq yoxdur."],
  ["🔢", "Hər iştirakçıya fərqli suallar", "Suallar saytın sual bankından seçilir — hər iştirakçıya öz variantı düşür."],
  ["⚡", "Bal: düzgünlük + sürət", "Bərabər nəticədə daha tez bitirən irəlidə olur."],
  ["🤖", "AI və kənar kömək qadağandır", "ChatGPT, kalkulyator və başqasının köməyi qadağandır."],
] as const;

const FAQ = [
  ["Növbəti yarış nə vaxt olacaq?", "Tarix elan olunan kimi bu səhifədə görünəcək. Hesabın varsa, qeydiyyatın açıldığını burada görəcəksən."],
  ["İştirak pulludur?", "Xeyr. Qeydiyyatdan keçən hər kəs ödənişsiz iştirak edir və mükafat qazana bilir."],
  ["Necə hazırlaşım?", "Günün sualları, onlayn repetitor və sınaqlar yarışdakı suallarla eyni sual bankındandır — onları həll etmək ən yaxşı hazırlıqdır."],
] as const;

export function ContestSoon() {
  return (
    <div className="min-h-dvh bg-[#f4f6fb] text-[#0f1b3d]">
      <nav aria-label="Yarış" className="sticky top-0 z-20 border-b border-[#e6e9f2] bg-[#f4f6fb]/85 backdrop-blur-md">
        <div className="mx-auto flex h-[60px] max-w-[1140px] items-center justify-between gap-3 px-4">
          <Logo />
          <Link href="/" className="text-[14px] font-semibold text-[#5b6785] no-underline hover:text-[#0f1b3d]">
            Ana səhifə
          </Link>
        </div>
      </nav>

      <main className="mx-auto max-w-[1140px] px-4">
        <header
          className={cn(
            brand,
            "relative mt-[22px] grid gap-4 overflow-hidden rounded-[30px] px-[22px] py-[34px] text-white shadow-[0_30px_60px_-30px_rgba(99,102,241,.8)] lg:px-10 lg:py-12",
          )}
        >
          <span aria-hidden="true" className="absolute -top-[140px] -right-[90px] size-[340px] rounded-full bg-white/10" />
          <span aria-hidden="true" className="absolute -bottom-[120px] left-[38%] size-[200px] rounded-full bg-white/10" />
          <span role="status" className="relative z-[1] inline-flex items-center gap-2 justify-self-start rounded-full bg-white/20 px-3.5 py-[7px] text-[13px] font-bold">
            <i className="size-2 rounded-full bg-[#fde68a]" aria-hidden="true" />
            Hal-hazırda yarış yoxdur · tezliklə olacaq
          </span>
          <h1 className="relative z-[1] m-0 text-[clamp(32px,5vw,54px)] leading-[1.05] font-black tracking-[-0.03em] text-white">2vur2 Riyaziyyat Yarışı</h1>
          <p className="relative z-[1] m-0 max-w-[620px] text-[17px] text-white/95">
            Hazırda aktiv yarış yoxdur. Növbəti yarış tezliklə elan olunacaq — tarixlər və mükafat fondu bu səhifədə görünəcək. O vaxta qədər hazırlaşmağa
            başla!
          </p>
          <div className="relative z-[1] flex flex-wrap gap-2.5">
            <Link href="/gunun-suallari" className="inline-flex items-center gap-2 rounded-[14px] bg-white px-[22px] py-3.5 font-extrabold text-[#4f46e5] no-underline shadow-[0_12px_26px_-12px_rgba(0,0,0,.4)]">
              Günün suallarını həll et →
            </Link>
            <Link href="/onlayn-repetitor" className="inline-flex items-center gap-2 rounded-[14px] border border-white/35 bg-white/16 px-[22px] py-3.5 font-extrabold text-white no-underline">
              Ödənişsiz ilk dərs
            </Link>
          </div>
        </header>

        <section aria-labelledby="soon-format" className="pt-11">
          <h2 id="soon-format" className={h2}>Yarış necə keçirilir?</h2>
          <p className={sub}>İki mərhələ: onlayn turda hamı iştirak edə bilər, mükafatlar isə əyani finalda müəyyən olunur.</p>
          <ol className="m-0 grid list-none gap-3.5 p-0 sm:grid-cols-2 lg:grid-cols-4">
            {STEPS.map(([title, text], i) => (
              <li key={title} className="rounded-[20px] border border-[#e6e9f2] bg-white p-5">
                <div className={cn(brand, "mb-3 grid size-10 place-items-center rounded-[12px] font-black text-white")} aria-hidden="true">
                  {i + 1}
                </div>
                <b className="mb-1 block text-[16px]">{title}</b>
                <p className="m-0 text-[14px] text-[#5b6785]">{text}</p>
              </li>
            ))}
          </ol>
        </section>

        <section aria-labelledby="soon-rules" className="pt-11">
          <h2 id="soon-rules" className={h2}>Qaydalar qısaca</h2>
          <p className={sub}>Ətraflı qaydalar yarış elan olunanda dərc ediləcək.</p>
          <ul className="m-0 grid list-none gap-3.5 p-0 md:grid-cols-2">
            {RULES.map(([icon, title, text]) => (
              <li key={title} className="flex gap-3 rounded-[16px] border border-[#e6e9f2] bg-white p-4">
                <span className="flex-none text-[22px]" aria-hidden="true">{icon}</span>
                <div>
                  <b className="block text-[15px]">{title}</b>
                  <p className="m-0 mt-0.5 text-[13.5px] text-[#5b6785]">{text}</p>
                </div>
              </li>
            ))}
          </ul>
        </section>

        <section aria-labelledby="soon-faq" className="pt-11">
          <h2 id="soon-faq" className={cn(h2, "mb-5")}>Tez-tez verilən suallar</h2>
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
        © 2vur2.az · Bu material 2vur2.az saytına məxsusdur · Əlaqə: info@2vur2.az
      </footer>
    </div>
  );
}
