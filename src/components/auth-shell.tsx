import type { ReactNode } from "react";
import { logoutAction } from "@/app/(auth)/actions";
import { auth } from "@/auth";
import { Alert } from "@/components/ui/alert";
import { cn } from "@/lib/cn";
import { FooterLight } from "@/components/footer";
import { AngleDeco } from "@/components/icons";
import { Logo } from "@/components/logo";
import { az } from "@/content/az";
import { fmtInt, fmtPct } from "@/lib/format";
import { getHeadline } from "@/lib/stats/queries";

/**
 * Giriş/qeydiyyat çərçivəsi: desktop-da solda navy panel, sağda forma;
 * mobil-də yalnız forma (yuxarıda loqo).
 */
export async function AuthShell({ variant = "login", children }: { variant?: "login" | "register"; children: ReactNode }) {
  const aside = az.authAside[variant];
  // Rəqəmlər statistika view-larından (kodda sabit rəqəm yoxdur). Baza əlçatmazdırsa, etiketlər gizlənir.
  const [h, session] = await Promise.all([getHeadline(), auth()]);
  // E-poçt istəyə bağlıdır — yoxdursa, ad göstərilir.
  const current = session?.user?.email ?? session?.user?.name ?? null;
  const tags = h ? az.authAside.tags("30000+", fmtInt(h.topics), fmtPct(h.found2025 / h.questions, 0)) : [];
  return (
    <div className="flex min-h-dvh flex-col">
      <div className="grid flex-1 lg:grid-cols-2">
        <div className="relative hidden content-between overflow-hidden bg-navy-900 p-10 text-white lg:grid">
          <div className="pointer-events-none absolute top-6 -right-2.5 text-coral-500">
            <AngleDeco />
          </div>
          <Logo onNavy />
          <div className="grid max-w-[420px] gap-4">
            <p className="font-display text-[36px] leading-[42px] font-extrabold">{aside.title}</p>
            <p className="text-lead text-on-navy-muted">{aside.text}</p>
            <div className="flex flex-wrap items-center gap-3">
              {tags.map((tag) => (
                <span
                  key={tag}
                  className="inline-flex min-h-7 items-center rounded-sm bg-white/12 px-2.5 py-1 text-[13px] leading-[18px] font-semibold text-white"
                >
                  {tag}
                </span>
              ))}
            </div>
          </div>
          <p className="text-small text-on-navy-muted">{az.common.independence}</p>
        </div>
        <main className="grid content-start gap-6 px-4 pt-4 pb-8 lg:content-center lg:p-10">
          <div className="pt-2 lg:hidden">
            <Logo />
          </div>
          {/* Qeydiyyat forması iki sütunludur — bir az genişdir (az sürüşdürmə). */}
          <div className={cn("mx-auto grid w-full gap-5", variant === "register" ? "max-w-[560px]" : "max-w-[440px]")}>
            {current && (
              <Alert tone="info">
                {az.authAside.signedInAs(current)}{" "}
                <form action={logoutAction} className="inline">
                  <button type="submit" className="cursor-pointer font-bold text-navy-500 underline underline-offset-3">
                    {az.authAside.signOut}
                  </button>
                </form>
              </Alert>
            )}
            {children}
          </div>
        </main>
      </div>
      <FooterLight />
    </div>
  );
}

export { AuthHeading, Divider } from "./auth-heading";
