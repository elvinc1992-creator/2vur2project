"use client";

import { useEffect, useState } from "react";
import { useFormAction } from "@/components/forms/use-form-action";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { Tag } from "@/components/ui/display";
import { TextField } from "@/components/ui/field";
import { az } from "@/content/az";
import { confirmEmailCodeAction, requestEmailCodeAction, savePhoneAction } from "./actions";

const t = az.app.profile;

/** E-poçt (istəyə bağlı): e-poçt → 6 rəqəmli kod məktubla → kod → hesaba yazılır və təsdiqlənir. */
export function EmailForm({ email, verified }: { email: string | null; verified: boolean }) {
  const [editing, setEditing] = useState(!email);
  const request = useFormAction(requestEmailCodeAction);
  const confirm = useFormAction(confirmEmailCodeAction);
  const pending = confirm.state.pendingEmail ?? request.state.pendingEmail;
  const codeSent = request.state.notice === "code_sent" || Boolean(confirm.state.pendingEmail);

  if (!editing) {
    return (
      <div className="grid gap-2">
        <div className="flex flex-wrap items-center justify-between gap-2">
          <span className="min-w-0 break-all">{email}</span>
          <span className="flex items-center gap-2">
            <Tag tone={verified ? "success" : "warning"}>{verified ? t.emailVerified : t.emailUnverified}</Tag>
            <Button type="button" variant="ghost" size="sm" onClick={() => setEditing(true)}>
              {t.change}
            </Button>
          </span>
        </div>
      </div>
    );
  }

  return (
    <div className="grid gap-3">
      {!codeSent ? (
        <form {...request.formProps} className="grid gap-3">
          {request.state.formError && <Alert tone="danger">{request.state.formError}</Alert>}
          <TextField
            id="email"
            name="email"
            type="email"
            label={t.emailLabel}
            hint={t.emailHint}
            inputMode="email"
            autoComplete="email"
            autoCapitalize="none"
            spellCheck={false}
            defaultValue={pending ?? ""}
            error={request.state.fieldErrors?.email}
          />
          <div className="flex flex-wrap gap-2">
            <Button type="submit" size="sm" loading={request.pending}>
              {t.sendCode}
            </Button>
            {email && (
              <Button type="button" variant="ghost" size="sm" onClick={() => setEditing(false)}>
                {t.cancelEdit}
              </Button>
            )}
          </div>
        </form>
      ) : (
        <>
          <Alert tone="info">{t.codeSentTo(pending ?? "")}</Alert>
          <form {...confirm.formProps} className="grid gap-3">
            <input type="hidden" name="pendingEmail" value={pending ?? ""} />
            <TextField
              id="code"
              name="code"
              label={t.codeLabel}
              inputMode="numeric"
              autoComplete="one-time-code"
              maxLength={6}
              pattern="\d{6}"
              className="max-w-[12rem] text-center font-display text-xl tracking-[0.3em] tabular"
              error={confirm.state.fieldErrors?.code}
            />
            <Button type="submit" size="sm" loading={confirm.pending} className="justify-self-start">
              {t.confirmCode}
            </Button>
          </form>
          <form {...request.formProps} className="flex flex-wrap items-center gap-2">
            <input type="hidden" name="email" value={pending ?? ""} />
            <ResendButton key={request.state.sentAt ?? 0} seconds={request.state.cooldown ?? 0} loading={request.pending} />
          </form>
          {request.state.formError && <Alert tone="danger">{request.state.formError}</Alert>}
        </>
      )}
    </div>
  );
}

/** Telefon (istəyə bağlı): +994 XX XXX XX XX. */
export function PhoneForm({ phone }: { phone: string | null }) {
  const { state, pending, formProps } = useFormAction(savePhoneAction);
  return (
    <form {...formProps} className="grid gap-3">
      <TextField
        id="phone"
        name="phone"
        type="tel"
        label={t.phoneLabel}
        hint={t.phoneHint}
        inputMode="tel"
        autoComplete="tel"
        defaultValue={phone ? formatPhone(phone) : "+994 "}
        error={state.fieldErrors?.phone}
      />
      <div className="flex flex-wrap items-center gap-3">
        <Button type="submit" size="sm" loading={pending}>
          {t.savePhone}
        </Button>
        {state.notice === "phone_saved" && (
          <span role="status" className="text-small font-semibold text-success-700">
            {t.phoneSaved}
          </span>
        )}
      </div>
    </form>
  );
}

/** +994501234567 → +994 50 123 45 67 */
export function formatPhone(p: string) {
  const d = p.replace(/^\+994/, "");
  return `+994 ${d.slice(0, 2)} ${d.slice(2, 5)} ${d.slice(5, 7)} ${d.slice(7, 9)}`.trim();
}

/** "Kodu yenidən göndər" — geri sayımla (hər göndərişdə key ilə yenidən başlayır). */
function ResendButton({ seconds, loading }: { seconds: number; loading: boolean }) {
  const [left, setLeft] = useState(seconds);
  useEffect(() => {
    const id = setInterval(() => setLeft((s) => (s > 0 ? s - 1 : 0)), 1000);
    return () => clearInterval(id);
  }, []);
  return (
    <Button type="submit" variant="ghost" size="sm" disabled={left > 0} loading={loading}>
      {left > 0 ? t.resendIn(left) : t.resendCode}
    </Button>
  );
}