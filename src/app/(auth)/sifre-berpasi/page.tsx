import type { Metadata } from "next";
import { AuthShell } from "@/components/auth-shell";
import { az } from "@/content/az";
import { ForgotForm } from "./forgot-form";

export const metadata: Metadata = { title: az.forgot.metaTitle };

export default function ForgotPasswordPage() {
  return (
    <AuthShell>
      <ForgotForm />
    </AuthShell>
  );
}
