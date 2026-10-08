"use client";

import { startTransition, useActionState, useEffect, useRef, type FormEvent } from "react";
import { initialFormState, type FormState } from "@/lib/auth/form-state";

type Action = (prev: FormState, formData: FormData) => Promise<FormState>;

/**
 * Server action + useActionState. Göndərişi JS ilə edirik ki, React formanı sıfırlamasın
 * (yanlış şifrədə e-poçt sahəsi təmizlənməməlidir). JS olmadan forma yenə işləyir.
 * Xətadan sonra fokus ilk səhv sahəyə keçir.
 */
export function useFormAction(action: Action) {
  const [state, formAction, pending] = useActionState(action, initialFormState);
  const formRef = useRef<HTMLFormElement>(null);

  useEffect(() => {
    if (state.status !== "error") return;
    const invalid = formRef.current?.querySelector<HTMLElement>('[aria-invalid="true"]');
    invalid?.focus();
  }, [state]);

  const onSubmit = (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    const formData = new FormData(event.currentTarget);
    startTransition(() => formAction(formData));
  };

  return { state, pending, formRef, formProps: { ref: formRef, action: formAction, onSubmit, noValidate: true } };
}
