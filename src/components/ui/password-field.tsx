"use client";

import { useState, type InputHTMLAttributes, type ReactNode } from "react";
import { EyeIcon, EyeOffIcon } from "@/components/icons";
import { az } from "@/content/az";
import { checkPassword, passwordScore } from "@/lib/auth/password-policy";
import { cn } from "@/lib/cn";
import { Field, inputClass } from "./field";

type Props = Omit<InputHTMLAttributes<HTMLInputElement>, "id" | "type"> & {
  id: string;
  label: ReactNode;
  labelAside?: ReactNode;
  error?: string;
  /** Qeydiyyat və yeni şifrə üçün güc göstəricisi. */
  showStrength?: boolean;
};

export function PasswordField({ id, label, labelAside, error, showStrength, onChange, ...props }: Props) {
  const [visible, setVisible] = useState(false);
  const [value, setValue] = useState("");

  return (
    <Field
      id={id}
      label={label}
      labelAside={labelAside}
      error={error}
      after={showStrength ? <PasswordStrength value={value} /> : null}
    >
      {(aria) => (
        <div className="relative">
          <input
            {...aria}
            {...props}
            type={visible ? "text" : "password"}
            className={cn(inputClass, "pr-14")}
            onChange={(e) => {
              setValue(e.target.value);
              onChange?.(e);
            }}
          />
          <button
            type="button"
            className="absolute top-1/2 right-1 grid h-11 w-12 -translate-y-1/2 cursor-pointer place-items-center rounded-[10px] text-navy-900"
            aria-label={visible ? az.common.hidePassword : az.common.showPassword}
            aria-pressed={visible}
            aria-controls={id}
            onClick={() => setVisible((v) => !v)}
          >
            {visible ? <EyeOffIcon className="size-[22px]" /> : <EyeIcon className="size-[22px]" />}
          </button>
        </div>
      )}
    </Field>
  );
}

const STRENGTH_COLOR = ["", "bg-danger-700", "bg-warning-700", "bg-success-700", "bg-success-700"];
const STRENGTH_TEXT = ["", "text-danger-700", "text-warning-700", "text-success-700", "text-success-700"];

function PasswordStrength({ value }: { value: string }) {
  const t = az.register;
  const checks = checkPassword(value);
  const score = passwordScore(value);
  const items: Array<[keyof typeof checks, string]> = [
    ["length", t.reqs.length],
    ["cases", t.reqs.cases],
    ["digit", t.reqs.digit],
    ["symbol", t.reqs.symbol],
  ];

  return (
    <div className="mt-1 grid gap-1.5">
      {value && (
        <>
          <div
            className="grid grid-cols-4 gap-1"
            role="meter"
            aria-label={`${t.strengthLabel}: ${t.strength[score]}`}
            aria-valuenow={score}
            aria-valuemin={0}
            aria-valuemax={4}
          >
            {[1, 2, 3, 4].map((i) => (
              <i key={i} className={cn("h-1.5 rounded-pill", i <= score ? STRENGTH_COLOR[score] : "bg-navy-100")} />
            ))}
          </div>
          <div className="flex items-center justify-between gap-3 text-small">
            <span className="text-ink-muted">{t.strengthLabel}</span>
            <b className={STRENGTH_TEXT[score]}>{t.strength[score]}</b>
          </div>
        </>
      )}
      <ul className="m-0 grid list-none gap-1 p-0 text-small">
        {items.map(([key, text]) => (
          <li key={key} className={cn("flex items-center gap-2", checks[key] ? "text-success-700" : "text-ink-muted")}>
            <span
              aria-hidden="true"
              className={cn(
                "grid size-4 flex-none place-items-center rounded-full border-[1.5px]",
                checks[key] ? "border-success-700 bg-success-700 text-white" : "border-control-border",
              )}
            >
              {checks[key] && (
                <svg viewBox="0 0 16 16" className="size-3.5" fill="none" stroke="currentColor" strokeWidth={2} strokeLinecap="round" strokeLinejoin="round">
                  <path d="M4.5 8.2l2.2 2.2 4.8-4.8" />
                </svg>
              )}
            </span>
            <span>
              {text}
              {checks[key] && <span className="sr-only"> — ödənilib</span>}
            </span>
          </li>
        ))}
      </ul>
    </div>
  );
}
