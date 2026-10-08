import { az } from "@/content/az";
import { getNotes } from "@/lib/stats/queries";

/** "Qeydlər" vərəqindən metodika (açılan blok). Uyğunluq izahı və subyektivlik qeydi daxildir. */
export async function Methodology() {
  const notes = await getNotes();
  const sections = [...new Set(notes.map((n) => n.section))];
  return (
    <details className="group rounded-lg border border-line bg-white">
      <summary className="flex min-h-14 cursor-pointer list-none items-center justify-between gap-3 px-4 py-3 font-display text-h3 font-bold text-navy-900 [&::-webkit-details-marker]:hidden">
        <h2 className="text-inherit">{az.app.stats.method.title}</h2>
        <span aria-hidden="true" className="text-2xl leading-none text-coral-600 group-open:hidden">
          +
        </span>
        <span aria-hidden="true" className="hidden text-2xl leading-none text-coral-600 group-open:inline">
          −
        </span>
      </summary>
      <div className="grid gap-5 px-4 pb-5">
        {sections.map((s) => (
          <section key={s} className="grid gap-2">
            <h3 className="text-caption font-bold tracking-[0.06em] text-ink-muted uppercase">{s}</h3>
            <dl className="m-0 grid gap-3">
              {notes
                .filter((n) => n.section === s)
                .map((n) => (
                  <div key={n.title} className="grid gap-0.5">
                    <dt className="font-semibold text-ink">{n.title}</dt>
                    <dd className="m-0 text-small leading-[1.6] text-ink-muted">{n.body}</dd>
                  </div>
                ))}
            </dl>
          </section>
        ))}
      </div>
    </details>
  );
}
