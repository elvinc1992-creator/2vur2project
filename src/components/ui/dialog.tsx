"use client";

import { useEffect, useRef, type ReactNode } from "react";
import { cn } from "@/lib/cn";

/**
 * Native <dialog> + showModal(): səhifənin qalanı inert olur (fokus tələsi),
 * Esc ilə bağlanır. Bağlananda fokus açan elementə qayıdır.
 * Mobil-də aşağıdan çıxan panel (sheet), desktop-da mərkəzdə.
 */
export function Dialog({
  open,
  onClose,
  labelledBy,
  describedBy,
  children,
  className,
}: {
  open: boolean;
  onClose: () => void;
  labelledBy: string;
  describedBy?: string;
  children: ReactNode;
  className?: string;
}) {
  const ref = useRef<HTMLDialogElement>(null);
  const opener = useRef<HTMLElement | null>(null);

  useEffect(() => {
    const el = ref.current;
    if (!el) return;
    if (open && !el.open) {
      opener.current = document.activeElement as HTMLElement | null;
      el.showModal();
    }
    if (!open && el.open) el.close();
  }, [open]);

  return (
    <dialog
      ref={ref}
      aria-modal="true"
      aria-labelledby={labelledBy}
      aria-describedby={describedBy}
      // Esc: "cancel" sinxron gəlir — bağlanmanı state ilə idarə edirik.
      // ("close" hadisəsi asinxrondur; tez təkrar açılışda gecikmiş "close" dialoqu yenidən bağlayardı.)
      onCancel={(e) => {
        e.preventDefault();
        onClose();
      }}
      onClose={() => {
        if (ref.current?.open) return; // artıq yenidən açılıb
        onClose();
        // Fokus dialoqu açan düyməyə qayıtsın.
        requestAnimationFrame(() => opener.current?.focus());
      }}
      onClick={(e) => {
        if (e.target === ref.current) onClose();
      }}
      className={cn(
        "m-0 mt-auto w-full max-w-none border-0 bg-transparent p-0 backdrop:bg-[rgba(20,34,64,0.45)]",
        "lg:m-auto lg:w-[480px]",
      )}
    >
      <div
        className={cn(
          "grid gap-4 rounded-t-3xl bg-white px-5 pt-3 pb-6 shadow-raised lg:rounded-3xl lg:p-6",
          className,
        )}
      >
        <div aria-hidden="true" className="mx-auto h-[5px] w-10 rounded-[3px] bg-navy-200 lg:hidden" />
        {children}
      </div>
    </dialog>
  );
}
