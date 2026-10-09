import type { Metadata } from "next";
import { AuthHeading, AuthShell } from "@/components/auth-shell";
import { GoogleSignIn } from "@/components/google-button";
import { Alert } from "@/components/ui/alert";
import { az } from "@/content/az";
import { safeRedirect } from "@/lib/safe-redirect";
import { LoginForm } from "./login-form";

export const metadata: Metadata = { title: az.login.metaTitle };

export default async function LoginPage(props: PageProps<"/daxil-ol">) {
  const sp = await props.searchParams;
  const next = typeof sp.next === "string" ? safeRedirect(sp.next) : undefined;
  const t = az.login;

  return (
    <AuthShell variant="login">
      <AuthHeading title={t.title} subtitle={t.subtitle} />
      {sp.reset === "1" && <Alert tone="success">{t.resetDone}</Alert>}
      {sp.verified === "1" && <Alert tone="success">{t.verifiedDone}</Alert>}
      {typeof sp.error === "string" && <Alert tone="danger">{az.errors.generic}</Alert>}
      <GoogleSignIn label={t.google} next={next} />
      <LoginForm next={next} />
    </AuthShell>
  );
}
