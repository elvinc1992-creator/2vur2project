"use client";

import { useId, useState, useTransition } from "react";
import { AlertIcon } from "@/components/icons";
import { Button } from "@/components/ui/button";
import { Dialog } from "@/components/ui/dialog";
import { h3Class } from "@/components/ui/display";
import type { QuestionReportSource } from "@/db/schema";
import { cn } from "@/lib/cn";
import { reportQuestionAction } from "@/lib/reports/actions";

const MAX = 500;

export type ReportTarget = { code: string; source: QuestionReportSource; context?: string | null };

/** Sualın yanındakı ikon: sualda səhv varsa, istifadəçi qısa rəyini yazıb göndərir. */
export function ReportQuestion({ target, n, className }: { target: ReportTarget; n?: number; className?: string }) {
  const id = useId();
  const [open, setOpen] = useState(false);
  const [text, setText] = useState("");
  const [error, setError] = useState<string | null>(null);
  const [sent, setSent] = useState(false);
  const [pending, start] = useTransition();

  const close = () => {
    setOpen(false);
    if (sent) {
      setSent(false);
      setText("");
    }
  };
  const send = () =>
    start(async () => {
      const r = await reportQuestionAction(target, text).catch(() => ({ ok: false, error: "Göndərilmədi — yenidən cəhd et." }));
      if (r?.ok) {
        setSent(true);
        setError(null);
      } else setError(r?.error ?? "Göndərilmədi — yenidən cəhd et.");
    });

  return (
    <>
      <button
        type="button"
        onClick={() => setOpen(true)}
        title="Sualda səhv var? Bildir"
        aria-label={n ? `Sual ${n}: səhv bildir` : "Sualda səhv bildir"}
        className={cn(
          "inline-grid size-10 flex-none cursor-pointer place-items-center rounded-[12px] border-0 bg-transparent text-ink-muted hover:bg-navy-100 hover:text-coral-600 focus-visible:ring-2 focus-visible:ring-navy-500 focus-visible:outline-none print:hidden",
          className,
        )}
      >
        <AlertIcon className="size-5" />
      </button>
      <Dialog open={open} onClose={close} labelledBy={`${id}-title`} describedBy={`${id}-text`}>
        <h2 id={`${id}-title`} className={h3Class}>
          {n ? `Sual ${n}: səhv bildir` : "Sualda səhv bildir"}
        </h2>
        {sent ? (
          <>
            <p id={`${id}-text`} role="status" className="font-semibold text-success-700">
              Təşəkkürlər! Bildirişin göndərildi — sualı yoxlayacağıq.
            </p>
            <Button type="button" variant="secondary" block onClick={close}>
              Bağla
            </Button>
          </>
        ) : (
          <>
            <p id={`${id}-text`} className="text-small text-ink-muted">
              Sualda, variantlarda və ya cavabda nə səhvdir? Qısa yaz.
            </p>
            <textarea
              rows={3}
              maxLength={MAX}
              value={text}
              autoFocus
              aria-label="Səhv barədə rəyin"
              placeholder="Məs.: C variantı ilə D eynidir"
              onChange={(e) => setText(e.target.value)}
              className="min-h-[96px] w-full rounded-md border-[1.5px] border-control-border bg-white px-4 py-3 text-body text-ink focus:border-navy-500 focus-visible:ring-2 focus-visible:ring-navy-500 focus-visible:ring-offset-2 focus-visible:outline-none"
            />
            <div className="flex items-center justify-between gap-2 text-small text-ink-muted">
              <span role="alert" className="font-semibold text-danger-700">
                {error}
              </span>
              <span className="tabular">
                {text.length} / {MAX}
              </span>
            </div>
            <div className="grid gap-3 sm:grid-cols-2">
              <Button type="button" variant="secondary" block disabled={pending} onClick={close}>
                Ləğv et
              </Button>
              <Button type="button" variant="navy" block loading={pending} disabled={text.trim().length < 3} onClick={send}>
                Göndər
              </Button>
            </div>
          </>
        )}
      </Dialog>
    </>
  );
}
