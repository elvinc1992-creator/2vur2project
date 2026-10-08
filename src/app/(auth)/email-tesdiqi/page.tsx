import type { Metadata } from "next";
import Link from "next/link";
import { AuthShell } from "@/components/auth-shell";
import { AlertIcon, CheckCircleIcon, ClockIcon, MailIcon } from "@/components/icons";
import { ButtonLink } from "@/components/ui/button";
import { EmptyState } from "@/components/ui/empty-art";
import { az } from "@/content/az";
import { getPendingEmail } from "@/lib/auth/pending-email";
import { mailInboxUrl } from "@/lib/mail-link";
import { ResendButton } from "./resend-button";

export const metadata: Metadata = { title: az.verify.metaTitle };

export default async function VerifyEmailPage(props: PageProps<"/email-tesdiqi">) {
  const { status } = await props.searchParams;
  const t = az.verify;

  if (status === "ok") {
    return (
      <AuthShell>
        <EmptyState tone="success" icon={<CheckCircleIcon />} title={t.okTitle}>
          {t.okText}
        </EmptyState>
        <ButtonLink href="/daxil-ol" block>
          {t.okCta}
        </ButtonLink>
      </AuthShell>
    );
  }

  if (status === "expired" || status === "invalid") {
    const expired = status === "expired";
    return (
      <AuthShell>
        <EmptyState
          tone={expired ? "warning" : "danger"}
          icon={expired ? <ClockIcon /> : <AlertIcon />}
          title={expired ? t.expiredTitle : t.invalidTitle}
        >
          {expired ? t.expiredText : t.invalidText}
        </EmptyState>
        <ButtonLink href="/daxil-ol" block>
          {t.toLogin}
        </ButtonLink>
      </AuthShell>
    );
  }

  const email = await getPendingEmail();
  const inbox = mailInboxUrl(email);
  return (
    <AuthShell>
      <EmptyState icon={<MailIcon />} title={t.title}>
        {email ? (
          <>
            <b className="text-ink">{email}</b> {t.sentTo}
          </>
        ) : (
          t.sentGeneric
        )}
      </EmptyState>
      {inbox && (
        <ButtonLink href={inbox} target="_blank" rel="noopener noreferrer" block>
          {t.openMail}
        </ButtonLink>
      )}
      {email && <ResendButton />}
      <p className="text-center text-small text-ink-muted">
        {t.noMailPrefix} <Link href="/qeydiyyat">{t.changeEmail}</Link>.
      </p>
    </AuthShell>
  );
}
