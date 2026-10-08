import type { ReactNode } from "react";
import { CheckIcon } from "@/components/icons";
import { cn } from "@/lib/cn";
import { FieldError, labelClass } from "./field";

type SegmentedProps = {
  name: string;
  label: string;
  options: ReadonlyArray<{ value: string; label: string }>;
  defaultValue?: string;
  error?: string;
  /** true — sütunlar mətnin eninə görə (Hədəf imtahan). */
  fit?: boolean;
};

/** Tək seçim (sinif, hədəf imtahan). Native radio — klaviatura dəstəyi brauzerdən. */
export function Segmented({ name, label, options, defaultValue, error, fit }: SegmentedProps) {
  const errId = error ? `${name}-err` : undefined;
  return (
    <fieldset className="m-0 grid min-w-0 gap-1.5 border-0 p-0">
      <legend className={cn(labelClass, "mb-1.5 p-0")}>{label}</legend>
      <div className={cn("grid grid-flow-col gap-2", fit ? "auto-cols-auto" : "auto-cols-fr")}>
        {options.map((o) => (
          <label
            key={o.value}
            className={cn(
              "grid min-h-[52px] cursor-pointer place-items-center rounded-md border-[1.5px] border-control-border bg-white px-3 py-2 text-center text-body leading-5 font-bold text-navy-900",
              "has-checked:border-navy-900 has-checked:bg-navy-900 has-checked:text-white",
              "has-focus-visible:outline-3 has-focus-visible:outline-offset-2 has-focus-visible:outline-navy-500",
              error && "border-danger-700",
            )}
          >
            <input
              type="radio"
              name={name}
              value={o.value}
              defaultChecked={defaultValue === o.value}
              className="sr-only"
              aria-describedby={errId}
            />
            {o.label}
          </label>
        ))}
      </div>
      {error && <FieldError id={errId!}>{error}</FieldError>}
    </fieldset>
  );
}

type CheckboxProps = {
  name: string;
  children: ReactNode;
  error?: string;
  defaultChecked?: boolean;
};

export function Checkbox({ name, children, error, defaultChecked }: CheckboxProps) {
  const errId = error ? `${name}-err` : undefined;
  return (
    <div className="grid gap-1.5">
      <label className="flex min-h-12 cursor-pointer items-start gap-3 py-1">
        <input
          type="checkbox"
          name={name}
          defaultChecked={defaultChecked}
          className="peer sr-only"
          aria-invalid={error ? true : undefined}
          aria-describedby={errId}
        />
        <span
          aria-hidden="true"
          className={cn(
            "grid size-6 flex-none place-items-center rounded-[7px] border-2 border-control-border bg-white text-white",
            "peer-checked:border-navy-900 peer-checked:bg-navy-900 [&>svg]:opacity-0 peer-checked:[&>svg]:opacity-100",
            "peer-focus-visible:outline-3 peer-focus-visible:outline-offset-2 peer-focus-visible:outline-navy-500",
            error && "border-danger-700",
          )}
        >
          <CheckIcon className="size-4" />
        </span>
        <span>{children}</span>
      </label>
      {error && <FieldError id={errId!}>{error}</FieldError>}
    </div>
  );
}
