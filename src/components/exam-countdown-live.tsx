"use client";

import { useSyncExternalStore } from "react";
import { cn } from "@/lib/cn";
import { countdown } from "@/lib/countdown";

// Saniyəlik saat: bütün sayğaclar üçün bir interval; snapshot — saniyənin nömrəsi (saniyə ərzində sabitdir).
const listeners = new Set<() => void>();
let timer: ReturnType<typeof setInterval> | undefined;
function subscribe(cb: () => void) {
  listeners.add(cb);
  timer ??= setInterval(() => listeners.forEach((l) => l()), 250);
  return () => {
    listeners.delete(cb);
    if (!listeners.size) {
      clearInterval(timer);
      timer = undefined;
    }
  };
}
const secondNow = () => Math.floor(Date.now() / 1000);

/** Server hesablayıb verdiyi "indi" ilə başlayır (HTML-də gün sayı var), brauzerdə hər saniyə yenilənir. */
function useNow(serverNow: number) {
  return useSyncExternalStore(subscribe, secondNow, () => Math.floor(serverNow / 1000)) * 1000;
}

const pad = (n: number) => String(n).padStart(2, "0");

/** Böyük rəqəm: "142". */
export function LiveDays({ at, serverNow }: { at: number; serverNow: number }) {
  return <>{countdown(at, useNow(serverNow)).days}</>;
}

/** Canlı sayğac: [14 saat] [32 dəq] [05 san] — saniyə hər an dəyişir. */
export function LiveClock({ at, serverNow, className }: { at: number; serverNow: number; className?: string }) {
  const c = countdown(at, useNow(serverNow));
  const parts: Array<[number, string]> = [
    [c.hours, "saat"],
    [c.minutes, "dəq"],
    [c.seconds, "san"],
  ];
  return (
    <span className={cn("flex items-center gap-1.5", className)} role="timer" aria-live="off">
      {parts.map(([n, label], i) => (
        <span key={label} className="flex items-center gap-1.5">
          {i > 0 && (
            <span aria-hidden="true" className="font-display font-extrabold opacity-50">
              :
            </span>
          )}
          <span className="inline-flex items-baseline gap-1 rounded-[10px] bg-white/80 px-2 py-1 ring-1 ring-black/5">
            <b className="min-w-[2ch] text-center font-display text-[20px] leading-6 font-extrabold tabular">{pad(n)}</b>
            <span className="text-[12px] font-semibold opacity-70">{label}</span>
          </span>
        </span>
      ))}
    </span>
  );
}

/** "1420" — gün × 10 sual. */
export function LiveQuestions({ at, serverNow, perDay }: { at: number; serverNow: number; perDay: number }) {
  return <>{countdown(at, useNow(serverNow)).days * perDay}</>;
}
