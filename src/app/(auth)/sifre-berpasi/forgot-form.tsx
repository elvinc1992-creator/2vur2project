"use client";

import Link from "next/link";
import { forgotPasswordAction } from "@/app/(auth)/actions";
import { AuthHeading } from "@/components/auth-heading";
import { useFormAction } from "@/components/forms/use-form-action";
import { MailIcon } from "@/components/icons";
import { Alert } from "@/components/ui/alert";
import { Button, ButtonLink } from "@/components/ui/button";
import { EmptyState } from "@/components/ui/empty-art";
import { TextField } from "@/components/ui/field";
import { az } from "@/content/az";

export function ForgotForm() {
  const { state, pending, formProps } = useFormAction(forgotPasswordAction);
  const t = az.forgot;

  if (state.status === "success") {
    return (
      <>
        <EmptyState icon={<MailIcon />} title={t.sentTitle}>
          {t.sentText}
        </EmptyState>
        <ButtonLink href="/daxil-ol" variant="secondary" block>
          {t.back}
        </ButtonLink>
      </>
    );
  }

  return (
    <>
      <AuthHeading title={t.title} subtitle={t.subtitle} />
      <form {...formProps} className="grid gap-5">
        {state.formError && <Alert tone="danger">{state.formError}</Alert>}
        <TextField
          id="email"
          name="email"
          type="email"
          label={t.email}
          inputMode="email"
          autoComplete="email"
          autoCapitalize="none"
          spellCheck={false}
          error={state.fieldErrors?.email}
        />
        <Button type="submit" block loading={pending}>
          {t.submit}
        </Button>
        <p className="text-center">
          <Link href="/daxil-ol">{t.back}</Link>
        </p>
      </form>
    </>
  );
}
