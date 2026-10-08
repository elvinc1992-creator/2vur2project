"use client";

import Link from "next/link";
import { loginAction } from "@/app/(auth)/actions";
import { useFormAction } from "@/components/forms/use-form-action";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { TextField } from "@/components/ui/field";
import { PasswordField } from "@/components/ui/password-field";
import { az } from "@/content/az";

export function LoginForm({ next }: { next?: string }) {
  const { state, pending, formProps } = useFormAction(loginAction);
  const t = az.login;
  const err = state.fieldErrors ?? {};

  return (
    <form {...formProps} className="grid gap-5">
      {next && <input type="hidden" name="next" value={next} />}

      {state.formError && <Alert tone="danger">{state.formError}</Alert>}
      {state.notice === "unverified" && (
        <Alert tone="warning">
          {az.errors.unverified} <Link href="/email-tesdiqi">{az.errors.unverifiedCta}</Link>
        </Alert>
      )}

      <TextField
        id="identifier"
        name="identifier"
        label={t.identifier}
        inputMode="email"
        autoComplete="username"
        autoCapitalize="none"
        spellCheck={false}
        error={err.identifier}
      />
      <PasswordField
        id="password"
        name="password"
        label={t.password}
        autoComplete="current-password"
        error={err.password}
        labelAside={
          <Link href="/sifre-berpasi" className="text-small font-semibold text-navy-500 underline underline-offset-3">
            {t.forgot}
          </Link>
        }
      />

      {state.notice === "not_found" && (
        <Alert tone="info">
          {t.newUserPrefix} <Link href="/qeydiyyat">{t.register}</Link> {t.newUserSuffix}
        </Alert>
      )}

      <Button type="submit" block loading={pending}>
        {t.submit}
      </Button>
      <p className="text-center text-ink-muted">
        {t.noAccount}{" "}
        <Link href="/qeydiyyat" className="font-bold text-navy-500 underline underline-offset-3">
          {t.register}
        </Link>
      </p>
    </form>
  );
}
