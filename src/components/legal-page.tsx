import { FooterLight } from "@/components/footer";
import { Logo } from "@/components/logo";
import type { LegalDoc } from "@/content/az-legal";

/** Hüquqi səhifə şablonu: başlıq, giriş və nömrələnmiş bölmələr. */
export function LegalPage({ title, doc }: { title: string; doc: LegalDoc }) {
  return (
    <div className="flex min-h-dvh flex-col">
      <header className="border-b border-line">
        <div className="mx-auto flex min-h-16 w-full max-w-content items-center px-4 md:px-8">
          <Logo />
        </div>
      </header>
      <main className="mx-auto grid w-full max-w-content flex-1 content-start gap-4 px-4 py-10 md:px-8">
        <h1 className="font-display text-h2 font-extrabold text-navy-900 lg:text-h2-lg">{title}</h1>
        <p className="text-small text-ink-muted">{doc.updated}</p>
        <div className="grid max-w-[720px] gap-6">
          <p>{doc.intro}</p>
          {doc.sections.map((s) => (
            <section key={s.title} className="grid gap-2">
              <h2 className="font-display text-h3 font-bold text-navy-900">{s.title}</h2>
              {s.body.map((p) => (
                <p key={p}>{p}</p>
              ))}
            </section>
          ))}
        </div>
      </main>
      <FooterLight />
    </div>
  );
}
