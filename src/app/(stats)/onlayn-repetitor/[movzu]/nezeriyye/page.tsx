import type { Metadata } from "next";
import { notFound, redirect } from "next/navigation";
import { Topbar } from "@/components/app/topbar";
import { ButtonLink } from "@/components/ui/button";
import { az } from "@/content/az";
import { theoryAccess } from "@/lib/repetitor/theory";
import { BookFrame } from "./book-frame";

export const metadata: Metadata = { title: az.app.tutor.theoryTitle };

/** Mövzunun nəzəriyyə kitabı: saytın çərçivəsində, ekranın qalan hissəsini tutan vərəqlənən kitab. */
export default async function TheoryBookPage(props: PageProps<"/onlayn-repetitor/[movzu]/nezeriyye">) {
  const { movzu } = await props.params;
  const a = await theoryAccess(movzu);
  if (!a) notFound();
  const back = `/onlayn-repetitor/${movzu}`;
  if (!a.allowed || !a.hasBook) redirect(back);
  const t = az.app.tutor;

  return (
    <>
      <Topbar
        title={t.theoryBookTitle(a.topic.name)}
        back={back}
        right={
          a.topic.questions.length > 0 && (
            <span className="hidden sm:block">
              <ButtonLink href={`${back}#practice`} variant="secondary" size="sm">
                {t.theoryBookPractice}
              </ButtonLink>
            </span>
          )
        }
      />
      <main className="min-w-0">
        <BookFrame src={`${back}/nezeriyye/kitab`} title={t.theoryBookFrame(a.topic.name)} />
      </main>
    </>
  );
}
