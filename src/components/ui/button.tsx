import Link from "next/link";
import type { ButtonHTMLAttributes, ComponentProps } from "react";
import { cn } from "@/lib/cn";

type Variant = "primary" | "navy" | "secondary" | "ghost";

const VARIANTS: Record<Variant, string> = {
  // coral — ekranda yalnız bir dəfə (Telegram-a qoşul, Abunə ol, Ödə)
  primary: "border-transparent bg-coral-600 text-white hover:bg-coral-700",
  // tətbiq daxilində əsas hərəkət
  navy: "border-transparent bg-navy-900 text-white hover:bg-navy-700",
  secondary: "border-navy-900 bg-surface text-navy-900 hover:bg-navy-050",
  ghost: "min-h-12 border-transparent bg-transparent px-3 text-navy-900 hover:bg-navy-100",
};

type Options = { variant?: Variant; block?: boolean; size?: "md" | "sm" };

export function buttonClass({ variant = "navy", block, size = "md" }: Options = {}) {
  return cn(
    "inline-flex cursor-pointer items-center justify-center gap-2 border-2 font-sans font-bold whitespace-nowrap no-underline transition-colors [&>svg]:size-[22px] [&>svg]:flex-none",
    "disabled:cursor-not-allowed disabled:border-transparent disabled:bg-navy-100 disabled:text-ink-muted",
    "aria-disabled:cursor-not-allowed aria-disabled:border-transparent aria-disabled:bg-navy-100 aria-disabled:text-ink-muted",
    size === "md" ? "min-h-[52px] rounded-md px-[22px] text-[17px] leading-none" : "min-h-11 rounded-[12px] px-4 text-[15px] leading-none",
    VARIANTS[variant],
    block && "w-full",
  );
}

type ButtonProps = ButtonHTMLAttributes<HTMLButtonElement> & Options & { loading?: boolean };

export function Button({ variant, block, size, loading, className, children, disabled, ...props }: ButtonProps) {
  return (
    <button
      className={cn(buttonClass({ variant, block, size }), className)}
      disabled={disabled || loading}
      aria-busy={loading || undefined}
      {...props}
    >
      {loading && <Spinner />}
      {children}
    </button>
  );
}

type ButtonLinkProps = ComponentProps<typeof Link> & Options;

export function ButtonLink({ variant, block, size, className, ...props }: ButtonLinkProps) {
  return <Link className={cn(buttonClass({ variant, block, size }), className)} {...props} />;
}

function Spinner() {
  return (
    <span
      aria-hidden="true"
      className="size-5 animate-spin rounded-full border-2 border-current border-r-transparent"
    />
  );
}
