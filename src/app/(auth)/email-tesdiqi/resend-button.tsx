"use client";

import { useEffect, useState, useTransition } from "react";
import { resendVerificationAction } from "@/app/(auth)/actions";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { az } from "@/content/az";
import { initialFormState, type FormState } from "@/lib/auth/form-state";

const fmt = (s: number) => `${Math.floor(s / 60)}:${String(s % 60).padStart(2, "0")}`;

export function ResendButton({ initialCooldown = 60 }: { initialCooldown?: number }) {
  const [state, setState] = useState<FormState>(initialFormState);
  const [pending, startTransition] = useTransition();
  const [left, setLeft] = useState(initialCooldown);

  useEffect(() => {
    if (left <= 0) return;
    const id = setTimeout(() => setLeft((s) => s - 1), 1000);
    return () => clearTimeout(id);
  }, [left]);

  const waiting = left > 0;
  const resend = () => {
    if (waiting || pending) return;
    startTransition(async () => {
      const result = await resendVerificationAction(state);
      setState(result);
      if (result.cooldown) setLeft(result.cooldown);
    });
  };

  return (
    <>
      {state.status === "success" && <Alert tone="success">{az.verify.resent}</Alert>}
      {state.status === "error" && !state.cooldown && state.formError && <Alert tone="danger">{state.formError}</Alert>}
      <Button
        type="button"
        variant="secondary"
        block
        loading={pending}
        aria-disabled={waiting || undefined}
        onClick={resend}
      >
        {az.verify.resend}
        {waiting && <span className="tabular"> · {fmt(left)}</span>}
      </Button>
    </>
  );
}
