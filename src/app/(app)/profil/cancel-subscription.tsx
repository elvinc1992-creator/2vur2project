"use client";

import { useState } from "react";
import { CheckIcon, LockIcon } from "@/components/icons";
import { Button } from "@/components/ui/button";
import { h3Class } from "@/components/ui/display";
import { Dialog } from "@/components/ui/dialog";
import { az } from "@/content/az";
import { cancelSubscriptionAction } from "@/lib/demo/actions";
import { cn } from "@/lib/cn";

/** "Abunəni ləğv et" → təsdiq paneli (təzyiqsiz: "Abunədə qal" əsas düymədir). */
export function CancelSubscription() {
  const t = az.app.cancel;
  const [open, setOpen] = useState(false);
  const [reason, setReason] = useState<string | null>(null);

  return (
    <>
      <Button type="button" variant="ghost" size="sm" className="text-danger-700!" onClick={() => setOpen(true)}>
        {az.app.profile.cancel}
      </Button>
      <Dialog open={open} onClose={() => setOpen(false)} labelledBy="cancel-title">
        <h2 id="cancel-title" className={h3Class}>
          {t.title}
        </h2>
        <p className="text-ink-muted">{t.text}</p>
        <ul className="m-0 grid list-none gap-2.5 p-0 text-[15px] leading-[22px]">
          <li className="flex items-start gap-2.5 text-ink-muted">
            <LockIcon className="mt-px size-5 flex-none" />
            {t.lose}
          </li>
          <li className="flex items-start gap-2.5">
            <CheckIcon className="mt-px size-5 flex-none text-success-700" />
            {t.keep1}
          </li>
          <li className="flex items-start gap-2.5">
            <CheckIcon className="mt-px size-5 flex-none text-success-700" />
            {t.keep2}
          </li>
        </ul>
        <fieldset className="m-0 grid min-w-0 gap-1.5 border-0 p-0">
          <legend className="mb-1.5 p-0 text-label font-semibold text-ink">
            {t.reason} <span className="font-normal text-ink-muted">{t.optional}</span>
          </legend>
          <div className="grid grid-cols-2 gap-2">
            {t.reasons.map((r) => (
              <button
                key={r}
                type="button"
                aria-pressed={reason === r}
                onClick={() => setReason(reason === r ? null : r)}
                className={cn(
                  "min-h-[52px] cursor-pointer rounded-md border-[1.5px] px-3 text-left font-semibold",
                  reason === r ? "border-navy-900 bg-navy-900 text-white" : "border-control-border bg-white text-navy-900",
                )}
              >
                {r}
              </button>
            ))}
          </div>
        </fieldset>
        <Button type="button" block onClick={() => setOpen(false)}>
          {t.stay}
        </Button>
        <form action={cancelSubscriptionAction}>
          <Button type="submit" variant="secondary" block className="border-danger-700! text-danger-700!">
            {t.confirm}
          </Button>
        </form>
      </Dialog>
    </>
  );
}
