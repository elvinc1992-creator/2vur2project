import type { Metadata } from "next";
import { Page, Topbar } from "@/components/app/topbar";
import { Placeholder, h1Class, h3Class } from "@/components/ui/display";
import { az } from "@/content/az";
import { requireDemo } from "@/lib/demo/session";
import { Simulator } from "./simulator";

export const metadata: Metadata = { title: az.app.score.title };

/** DİM bal simulyatoru. Məzmun (düsturlar, izahlar) sonra əlavə olunacaq — bax: src/lib/score/simulators.ts. */
export default async function ScoreSimulatorPage() {
  await requireDemo("/bal-simulyatoru");
  const t = az.app.score;
  return (
    <>
      <Topbar title={t.title} back="/panel" />
      <Page>
        <div className="grid gap-2">
          <h1 className={h1Class}>{t.title}</h1>
          <p className="max-w-[46rem] text-ink-muted">{t.lead}</p>
        </div>
        <Simulator />
        <section aria-labelledby="score-info" className="grid gap-3">
          <h2 id="score-info" className={h3Class}>
            {t.infoTitle}
          </h2>
          <Placeholder className="min-h-[140px] justify-items-start text-left">{t.infoPlaceholder}</Placeholder>
        </section>
      </Page>
    </>
  );
}
