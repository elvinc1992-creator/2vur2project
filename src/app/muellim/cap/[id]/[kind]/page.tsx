import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";
import { notFound } from "next/navigation";
import type { ReactNode } from "react";
import { PrintButton } from "@/components/teacher/print-button";
import { MathText } from "@/components/ui/math-text";
import { LETTERS } from "@/lib/demo/content";
import { itemsOf, ownTest, testGroupsOf, testKindLabel, variantsOf, type FullItem, type StudentVariant } from "@/lib/teacher/data";
import { requireTeacher } from "@/lib/teacher/guard";
import { answerKey } from "@/lib/teacher/variants";

export const metadata: Metadata = { title: "Çap" };

// Çap faylları (yalnız sınağın sahibi müəllim): sual kitabçaları, cavab kartları, cavab açarı.
// A4; sual, şəkil və variantlar səhifələr arasında bölünmür; hər səhifənin altında saytın yazısı və nömrə (@page).

const KINDS = { kitabca: "Sual kitabçası", kart: "Cavab kartı", acar: "Cavab açarı — yalnız müəllim üçün" } as const;
const SECTION: Record<string, string> = { closed: "Qapalı tipli suallar", coded: "Açıq kodlaşdırılan suallar", written: "Yazılı (izahlı) suallar" };
const FOOT = "2vur2.az · Bu material 2vur2.az saytına məxsusdur";
const CODED = ["-", ",", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];

const css = `
@page { size: A4; margin: 14mm 14mm 18mm; @bottom-left { content: "${FOOT}"; font: 9pt Inter, Arial, sans-serif; color: #777; } @bottom-right { content: "Səh. " counter(page); font: 9pt Inter, Arial, sans-serif; color: #777; } }
@media print { .noprint { display: none !important; } body { background: #fff !important; } .sheet { box-shadow: none !important; margin: 0 !important; padding: 0 !important; width: auto !important; } }
.sheet + .sheet { break-before: page; }
.avoid { break-inside: avoid; }
`;

export default async function PrintPage(props: PageProps<"/muellim/cap/[id]/[kind]">) {
  const { id, kind } = await props.params;
  const me = await requireTeacher(`/muellim/cap/${id}/${kind}`);
  if (!(kind in KINDS)) notFound();
  const t = await ownTest(me.id, id);
  if (!t) notFound();
  const [tg, items, variants, kname] = await Promise.all([
    testGroupsOf(t.id),
    itemsOf(t.id),
    variantsOf(t.id),
    testKindLabel(t),
  ]);
  const date = new Intl.DateTimeFormat("az-AZ", { timeZone: "Asia/Baku", day: "2-digit", month: "2-digit", year: "numeric" }).format(t.opensAt);
  const head = (title: string, who: string, letter: string, groupName = tg.names) => (
    <>
      <div className="flex items-center justify-between border-b-[3px] border-double border-[#c8102e] pb-3">
        <div>
          <div className="text-[17px] font-black tracking-[0.04em] uppercase">{title}</div>
          <div className="text-[12px] text-[#555]">
            {kname} · Riyaziyyat · Sınaq №{t.number}
          </div>
        </div>
        <span className="border-2 border-[#111] px-3 py-0.5 font-mono text-[16px] font-bold">{letter}</span>
      </div>
      <div className="my-3.5 grid grid-cols-[2fr_1fr_1fr] gap-2">
        {[
          ["Şagird", who],
          ["Qrup", groupName],
          ["Tarix", date],
        ].map(([l, v]) => (
          <div key={l} className="rounded-[4px] border-[1.4px] border-[#bbb] px-2.5 py-1.5">
            <span className="block text-[9.5px] font-bold tracking-[0.1em] text-[#666] uppercase">{l}</span>
            <span className="font-extrabold">{v}</span>
          </div>
        ))}
      </div>
    </>
  );

  return (
    <div className="min-h-dvh bg-[#e5e7ef] py-5 text-[#111]">
      <style dangerouslySetInnerHTML={{ __html: css }} />
      <div className="noprint mx-auto mb-4 flex max-w-[794px] flex-wrap items-center justify-between gap-2 px-4">
        <Link href={`/muellim/sinaqlar/${t.id}`} className="font-bold text-[#4f46e5]">
          ← Sınaq №{t.number}
        </Link>
        <div className="flex flex-wrap gap-2">
          {(Object.keys(KINDS) as Array<keyof typeof KINDS>)
            .filter((k) => t.mode === "paper" || k !== "kart")
            .map((k) => (
              <Link
                key={k}
                href={`/muellim/cap/${t.id}/${k}`}
                aria-current={kind === k ? "page" : undefined}
                className={`rounded-[12px] border px-3 py-2 text-[14px] font-bold no-underline ${kind === k ? "border-[#0f1b3d] bg-[#0f1b3d] text-white" : "border-[#e6e9f2] bg-white text-[#0f1b3d]"}`}
              >
                {k === "kitabca" ? "📘 Kitabçalar" : k === "kart" ? "🧾 Kartlar" : "🔑 Açar"}
              </Link>
            ))}
          <PrintButton />
        </div>
      </div>

      {kind === "kitabca" &&
        variants.map((v) => (
          <Sheet key={v.userId}>
            {head(KINDS.kitabca, v.name, v.letter, tg.groupOf.get(v.userId))}
            <Booklet v={v} items={items} />
          </Sheet>
        ))}
      {kind === "kart" &&
        variants.map((v) => (
          <Sheet key={v.userId}>
            {head(KINDS.kart, v.name, v.letter, tg.groupOf.get(v.userId))}
            <AnswerCard v={v} items={items} />
          </Sheet>
        ))}
      {kind === "acar" && (
        <Sheet>
          {head(KINDS.acar, "Bütün variantlar", t.shuffle ? `${variants.length} var.` : "A")}
          <KeyTable variants={t.shuffle ? variants : variants.slice(0, 1)} items={items} />
          <p className="mt-3.5 text-[12px] text-[#777]">Cavab açarı ayrıca vərəqdədir. Şagirdlərə paylamayın.</p>
        </Sheet>
      )}
    </div>
  );
}

function Sheet({ children }: { children: ReactNode }) {
  return <section className="sheet mx-auto mb-5 w-[794px] max-w-full bg-white px-12 py-10 text-[14px] shadow-[0_10px_30px_-14px_rgba(0,0,0,.35)]">{children}</section>;
}

const SecT = ({ children }: { children: ReactNode }) => (
  <div className="avoid my-2.5 inline-block bg-[#c8102e] px-2.5 py-1 text-[11px] font-extrabold tracking-[0.12em] text-white uppercase">{children}</div>
);

/** Kitabça: bölmələr (sıra şagirdin variantı ilə), qapalı suallar iki sütunda. */
function Booklet({ v, items }: { v: StudentVariant; items: FullItem[] }) {
  const shown = v.order.map((n, i) => ({ i: i + 1, it: items.find((x) => x.n === n)! }));
  return (
    <>
      {(["closed", "coded", "written"] as const).map((f) => {
        const qs = shown.filter((x) => x.it.format === f);
        if (!qs.length) return null;
        return (
          <div key={f}>
            <SecT>{SECTION[f]}</SecT>
            <ol className={`m-0 list-none p-0 ${f === "closed" ? "[column-gap:28px] [column-rule:1px_solid_#ddd] sm:columns-2" : ""}`}>
              {qs.map(({ i, it }) => (
                <li key={i} className="avoid mb-3.5">
                  <b className="mr-1">{i}.</b>
                  <MathText text={it.body} />
                  {it.imageUrl && (
                    <Image src={it.imageUrl} alt={it.imageAlt ?? ""} width={320} height={220} className="mt-1.5 block h-auto max-h-[180px] w-auto max-w-full" />
                  )}
                  {f === "closed" && it.options && (
                    <div className="mt-1 grid grid-cols-2 gap-x-2.5 gap-y-0.5 text-[13px]">
                      {LETTERS.map((l) => (
                        <span key={l}>
                          <b>{l})</b> <MathText text={it.options![v.maps[it.n]?.[l] ?? l]} />
                        </span>
                      ))}
                    </div>
                  )}
                  {f === "written" && (
                    <div aria-hidden="true">
                      {[0, 1, 2].map((k) => (
                        <div key={k} className="mt-1 h-[22px] border-b border-[#bbb]" />
                      ))}
                    </div>
                  )}
                </li>
              ))}
            </ol>
          </div>
        );
      })}
    </>
  );
}

/** DİM üslubunda cavab kartı: qapalı — A–E dairələri, kodlaşdırılan — 6 xana və -, ,, 0–9 dairələri, yazılı — sahələr. */
function AnswerCard({ v, items }: { v: StudentVariant; items: FullItem[] }) {
  const shown = v.order.map((n, i) => ({ i: i + 1, it: items.find((x) => x.n === n)! }));
  const closed = shown.filter((x) => x.it.format === "closed");
  const coded = shown.filter((x) => x.it.format === "coded");
  const written = shown.filter((x) => x.it.format === "written");
  const range = (xs: typeof shown) => (xs.length ? `${xs[0].i}–${xs[xs.length - 1].i}` : "");
  return (
    <>
      {closed.length > 0 && (
        <>
          <SecT>Qapalı tipli · {range(closed)}</SecT>
          <div className="grid grid-cols-2 gap-x-7 gap-y-1">
            {closed.map(({ i }) => (
              <div key={i} className="avoid flex items-center gap-1.5">
                <span className="w-6 font-mono font-bold">{i}</span>
                {LETTERS.map((l) => (
                  <span key={l} className="grid size-6 place-items-center rounded-full border-[1.4px] border-[#111] text-[10.5px] font-bold">
                    {l}
                  </span>
                ))}
              </div>
            ))}
          </div>
        </>
      )}
      {coded.length > 0 && (
        <>
          <SecT>Açıq kodlaşdırılan · {range(coded)}</SecT>
          <div className="grid grid-cols-3 gap-2.5 sm:grid-cols-5">
            {coded.map(({ i }) => (
              <div key={i} className="avoid rounded-[4px] border-[1.3px] border-[#bbb] p-1.5">
                <b className="font-mono">{i}</b>
                <div className="grid grid-cols-6 gap-0.5">
                  {Array.from({ length: 6 }, (_, k) => (
                    <div key={k} className="h-5 border-[1.3px] border-[#111]" />
                  ))}
                </div>
                {CODED.map((s) => (
                  <div key={s} className="mt-0.5 grid grid-cols-6 gap-0.5">
                    {Array.from({ length: 6 }, (_, k) => (
                      <span key={k} className="mx-auto grid size-[15px] place-items-center rounded-full border border-[#888] text-[8px]">
                        {s}
                      </span>
                    ))}
                  </div>
                ))}
              </div>
            ))}
          </div>
        </>
      )}
      {written.length > 0 && (
        <>
          <SecT>Yazılı · {range(written)}</SecT>
          {written.map(({ i }) => (
            <div
              key={i}
              className="avoid mb-2 h-16 rounded-[4px] border-[1.3px] border-[#bbb] bg-[repeating-linear-gradient(transparent_0_19px,#e5e5e5_19px_20px)] px-2 py-1 font-bold"
            >
              {i}
            </div>
          ))}
        </>
      )}
    </>
  );
}

/** Cavab açarı: sətir — kitabçadakı nömrə, sütun — şagird (variant); 6 şagirddən bir cədvəl. */
function KeyTable({ variants, items }: { variants: StudentVariant[]; items: FullItem[] }) {
  const chunks: StudentVariant[][] = [];
  for (let i = 0; i < variants.length; i += 6) chunks.push(variants.slice(i, i + 6));
  return (
    <>
      {chunks.map((vs, ci) => {
        const keys = vs.map((v) => answerKey(v, items));
        return (
          <table key={ci} className="avoid mb-4 w-full border-collapse text-[13px]">
            <thead>
              <tr>
                <th className="border border-[#ccc] px-2 py-1 text-left">Sual</th>
                {vs.map((v) => (
                  <th key={v.userId} className="border border-[#ccc] px-2 py-1 text-left">
                    {vs.length > 1 || variants.length > 1 ? `${v.name} (${v.letter})` : "Hamı üçün"}
                  </th>
                ))}
              </tr>
            </thead>
            <tbody>
              {items.map((_, i) => (
                <tr key={i}>
                  <td className="border border-[#ccc] px-2 py-0.5 font-bold">{i + 1}</td>
                  {keys.map((k, j) => (
                    <td key={j} className="border border-[#ccc] px-2 py-0.5 font-mono font-bold">
                      {k[i]}
                    </td>
                  ))}
                </tr>
              ))}
            </tbody>
          </table>
        );
      })}
    </>
  );
}
