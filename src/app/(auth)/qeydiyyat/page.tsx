import type { Metadata } from "next";
import { AuthHeading, AuthShell } from "@/components/auth-shell";
import { GoogleSignIn } from "@/components/google-button";
import { features } from "@/config/features";
import { az } from "@/content/az";
import { RegisterForm } from "./register-form";

export const metadata: Metadata = { title: az.register.metaTitle };

export default function RegisterPage() {
  const t = az.register;
  return (
    <AuthShell variant="register">
      {/* Valideyn addımı söndürülüb — onda "Addım 1 / 2" göstərmirik. */}
      <AuthHeading title={t.title} eyebrow={features.guardianConsent ? t.step(1, 2) : undefined} />
      <GoogleSignIn label={t.google} />
      <RegisterForm />
    </AuthShell>
  );
}
