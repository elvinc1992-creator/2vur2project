"use client";

import Link from "next/link";
import { registerAction } from "@/app/(auth)/actions";
import { useFormAction } from "@/components/forms/use-form-action";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { Checkbox, Segmented } from "@/components/ui/choice";
import { TextField } from "@/components/ui/field";
import { PasswordField } from "@/components/ui/password-field";
import { az } from "@/content/az";

const GRADES = [
  { value: "9", label: "9" },
  { value: "10", label: "10" },
  { value: "11", label: "11" },
] as const;

const TARGETS = (["buraxilis", "qebul", "both"] as const).map((value) => ({
  value,
  label: az.register.targets[value],
}));

export function RegisterForm() {
  const { state, pending, formProps } = useFormAction(registerAction);
  const t = az.register;
  const err = state.fieldErrors ?? {};

  return (
    <form {...formProps} className="grid gap-5">
      {state.formError && <Alert tone="danger">{state.formError}</Alert>}

      <TextField id="name" name="name" label={t.name} autoComplete="given-name" maxLength={60} error={err.name} />
      <TextField
        id="username"
        name="username"
        label={t.username}
        hint={t.usernameHint}
        autoComplete="username"
        autoCapitalize="none"
        spellCheck={false}
        maxLength={20}
        error={err.username}
      />
      <TextField
        id="email"
        name="email"
        type="email"
        label={t.email}
        inputMode="email"
        autoComplete="email"
        autoCapitalize="none"
        spellCheck={false}
        error={err.email}
      />
      {state.notice === "email_taken" && (
        <Alert tone="info">
          {t.emailTakenPrefix} <Link href="/daxil-ol">{t.emailTakenLogin}</Link> {t.emailTakenOr}{" "}
          <Link href="/sifre-berpasi">{t.emailTakenReset}</Link>.
        </Alert>
      )}
      <PasswordField
        id="password"
        name="password"
        label={t.password}
        autoComplete="new-password"
        showStrength
        error={err.password}
      />
      <Segmented name="grade" label={t.grade} options={GRADES} defaultValue="11" error={err.grade} />
      <Segmented name="targetExam" label={t.target} options={TARGETS} fit error={err.targetExam} />
      <Checkbox name="terms" error={err.terms}>
        <Link href="/sertler" target="_blank">
          {az.legalLinks.terms}
        </Link>{" "}
        {t.termsAnd}{" "}
        <Link href="/mexfilik" target="_blank">
          {t.termsPrivacy}
        </Link>{" "}
        {t.termsAfter}
      </Checkbox>

      <Button type="submit" block loading={pending}>
        {t.submit}
      </Button>
      <p className="text-center text-ink-muted">
        {t.hasAccount}{" "}
        <Link href="/daxil-ol" className="font-bold text-navy-500 underline underline-offset-3">
          {t.login}
        </Link>
      </p>
    </form>
  );
}
