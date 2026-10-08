"use client";

import { resetPasswordAction } from "@/app/(auth)/actions";
import { useFormAction } from "@/components/forms/use-form-action";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { PasswordField } from "@/components/ui/password-field";
import { az } from "@/content/az";

export function ResetForm({ token }: { token: string }) {
  const { state, pending, formProps } = useFormAction(resetPasswordAction);
  const t = az.reset;

  return (
    <form {...formProps} className="grid gap-5">
      <input type="hidden" name="token" value={token} />
      {state.formError && <Alert tone="danger">{state.formError}</Alert>}
      <PasswordField
        id="password"
        name="password"
        label={t.password}
        autoComplete="new-password"
        showStrength
        error={state.fieldErrors?.password}
      />
      <Button type="submit" block loading={pending}>
        {t.submit}
      </Button>
    </form>
  );
}
