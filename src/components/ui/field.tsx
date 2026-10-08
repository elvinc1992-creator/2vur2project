import type { InputHTMLAttributes, ReactNode } from "react";
import { AlertIcon } from "@/components/icons";
import { cn } from "@/lib/cn";

export const inputClass = cn(
  "flex min-h-[52px] w-full items-center rounded-md border-[1.5px] border-control-border bg-white px-4 text-body text-ink",
  "placeholder:text-ink-placeholder",
  "focus:border-navy-500 focus-visible:ring-2 focus-visible:ring-navy-500 focus-visible:ring-offset-2 focus-visible:outline-none",
  "aria-invalid:border-danger-700 aria-invalid:shadow-[0_0_0_3px_rgba(180,35,24,0.12)]",
);

export function FieldError({ id, children }: { id: string; children: ReactNode }) {
  return (
    <p id={id} className="flex items-start gap-1.5 text-small font-medium text-danger-700">
      <AlertIcon className="mt-px size-[18px] flex-none" />
      <span>{children}</span>
    </p>
  );
}

export function FieldHint({ id, children }: { id: string; children: ReactNode }) {
  return (
    <p id={id} className="text-small text-ink-muted">
      {children}
    </p>
  );
}

export const labelClass = "text-label font-semibold text-ink";

type FieldProps = {
  id: string;
  label: ReactNode;
  /** Etiketin sağında (məs. "Şifrəni unutdum" linki). */
  labelAside?: ReactNode;
  hint?: ReactNode;
  error?: string;
  children: (aria: {
    id: string;
    "aria-invalid": true | undefined;
    "aria-describedby": string | undefined;
  }) => ReactNode;
  after?: ReactNode;
};

/** Etiket + sahə + köməkçi mətn + xəta; aria atributlarını sahəyə ötürür. */
export function Field({ id, label, labelAside, hint, error, children, after }: FieldProps) {
  const hintId = hint ? `${id}-hint` : undefined;
  const errId = error ? `${id}-err` : undefined;
  const describedBy = [errId, hintId].filter(Boolean).join(" ") || undefined;
  return (
    <div className="grid gap-1.5">
      {labelAside ? (
        <div className="flex items-center justify-between gap-3">
          <label htmlFor={id} className={labelClass}>
            {label}
          </label>
          {labelAside}
        </div>
      ) : (
        <label htmlFor={id} className={labelClass}>
          {label}
        </label>
      )}
      {children({ id, "aria-invalid": error ? true : undefined, "aria-describedby": describedBy })}
      {error && <FieldError id={errId!}>{error}</FieldError>}
      {hint && <FieldHint id={hintId!}>{hint}</FieldHint>}
      {after}
    </div>
  );
}

type TextFieldProps = Omit<InputHTMLAttributes<HTMLInputElement>, "id"> & {
  id: string;
  label: ReactNode;
  labelAside?: ReactNode;
  hint?: ReactNode;
  error?: string;
};

export function TextField({ id, label, labelAside, hint, error, className, ...props }: TextFieldProps) {
  return (
    <Field id={id} label={label} labelAside={labelAside} hint={hint} error={error}>
      {(aria) => <input {...aria} {...props} className={cn(inputClass, className)} />}
    </Field>
  );
}
