import { FooterLight } from "@/components/footer";
import { Logo } from "@/components/logo";
import { az } from "@/content/az";

/** Hüquqi səhifə şablonu — mətn hüquqşünasdan gələnə qədər yer tutucudur. */
export function LegalPage({ title }: { title: string }) {
  return (
    <div className="flex min-h-dvh flex-col">
      <header className="border-b border-line">
        <div className="mx-auto flex min-h-16 w-full max-w-content items-center px-4 md:px-8">
          <Logo />
        </div>
      </header>
      <main className="mx-auto grid w-full max-w-content flex-1 content-start gap-4 px-4 py-10 md:px-8">
        <h1 className="font-display text-h2 font-extrabold text-navy-900 lg:text-h2-lg">{title}</h1>
        <p className="text-small text-ink-muted">{az.legal.updated}</p>
        <p className="max-w-[720px]">{az.legal.placeholder}</p>
      </main>
      <FooterLight />
    </div>
  );
}
