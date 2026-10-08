import type { Metadata } from "next";
import { AuthHeading, AuthShell } from "@/components/auth-shell";
import { AlertIcon } from "@/components/icons";
import { ButtonLink } from "@/components/ui/button";
import { EmptyState } from "@/components/ui/empty-art";
import { az } from "@/content/az";
import { findValidResetToken } from "@/lib/auth/flows";
import { ResetForm } from "./reset-form";

export const metadata: Metadata = {
  title: az.reset.metaTitle,
  // Tokenli ünvan başqa sayta Referer ilə getməsin.
  referrer: "no-referrer",
};

export default async function ResetPasswordPage(props: PageProps<"/sifre-berpasi/yeni">) {
  const { token } = await props.searchParams;
  const t = az.reset;
  const valid = typeof token === "string" && token.length <= 200 && (await findValidResetToken(token));

  if (!valid) {
    return (
      <AuthShell>
        <EmptyState tone="danger" icon={<AlertIcon />} title={t.invalidTitle}>
          {t.invalidText}
        </EmptyState>
        <ButtonLink href="/sifre-berpasi" block>
          {t.again}
        </ButtonLink>
      </AuthShell>
    );
  }

  return (
    <AuthShell>
      <AuthHeading title={t.title} subtitle={t.subtitle} />
      <ResetForm token={token} />
    </AuthShell>
  );
}
