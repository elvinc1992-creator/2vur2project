import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { EntryGrid } from "@/components/teacher/entry-grid";
import { Top, TLink } from "@/components/teacher/ui";
import { LETTERS } from "@/lib/demo/content";
import { answersOf, itemsOf, ownTest, variantsOf } from "@/lib/teacher/data";
import { requireTeacher } from "@/lib/teacher/guard";

export const metadata: Metadata = { title: "Kağız nəticələri" };

/** Cavab kartlarından nəticələrin daxil edilməsi (onlayn sınaqda — yazılı tapşırıqların qiyməti). */
export default async function EntryPage(props: PageProps<"/muellim/sinaqlar/[id]/netice">) {
  const me = await requireTeacher();
  const { id } = await props.params;
  const t = await ownTest(me.id, id);
  if (!t) notFound();
  const [items, variants, answers] = await Promise.all([itemsOf(t.id), variantsOf(t.id), answersOf(t.id)]);
  // Əvvəl yazılmış cavablar şagirdin kitabçasındakı sıra ilə (qapalı — göstərilən hərf)
  // Onlayn: yalnız sınağa başlayan şagirdlər
  const started = t.mode === "online" ? new Set(answers.map((a) => a.userId)) : null;
  const rows = variants.filter((v) => !started || started.has(v.userId)).map((v) => ({
    ...v,
    entries: v.order.map((n) => {
      const a = answers.find((x) => x.userId === v.userId && x.n === n);
      const it = items.find((x) => x.n === n)!;
      if (!a) return "";
      if (it.format === "written") return a.score !== null ? String(a.score).replace(".", ",") : "";
      if (it.format === "closed" && a.given) return v.maps[n] ? (LETTERS.find((l) => v.maps[n][l] === a.given) ?? "") : a.given;
      return a.given ?? "";
    }),
  }));

  return (
    <>
      <Top
        title={t.mode === "paper" ? "Kağız sınağının nəticələri" : "Onlayn sınaq — yazılı tapşırıqlar"}
        lead={`Sınaq №${t.number} · cavab kartlarından cavabları daxil et, yoxlama avtomatikdir (hər şagirdin öz variantına görə)`}
      >
        <TLink href={`/muellim/sinaqlar/${t.id}`}>← Sınaq</TLink>
      </Top>
      <p className="m-0 mb-3 text-[13px] text-[#5b6785]">
        {t.mode === "online"
          ? "Qapalı və kodlaşdırılan cavablar şagirdin onlayn cavablarıdır (dəyişmir). Yazılı tapşırıqlar üçün balı (0, 0,5, 1) bənövşəyi xanalara yaz. Siyahıda yalnız sınağa başlayan şagirdlər var."
          : "Hərfləri yaz (A–E) — kursor özü növbəti xanaya keçir. Kodlaşdırılan suallar üçün rəqəm, yazılı suallar üçün balı (0, 0,5, 1) daxil et (bənövşəyi xanalar). Sütunlar şagirdin kitabçasındakı nömrələrdir."}
      </p>
      <EntryGrid writtenOnly={t.mode === "online"} testId={t.id} items={items.map((i) => ({ n: i.n, format: i.format, correct: i.correct, answer: i.answer }))} rows={rows} />
    </>
  );
}
