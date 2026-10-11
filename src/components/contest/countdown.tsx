"use client";

import { useRouter } from "next/navigation";
import { useEffect, useRef, useState } from "react";

const pad = (n: number) => String(Math.max(0, n)).padStart(2, "0");

/**
 * Geri sayım — server vaxtına görə (brauzerin saatı səhv olsa da düzgün qalır).
 * Vaxt çatanda səhifə yenilənir (refreshOnEnd).
 */
export function Countdown({ target, serverNow, refreshOnEnd = false, labels }: { target: number; serverNow: number; refreshOnEnd?: boolean; labels: [string, string, string, string] }) {
  const router = useRouter();
  const offset = useRef<number | null>(null);
  const [left, setLeft] = useState(target - serverNow);
  useEffect(() => {
    offset.current ??= serverNow - Date.now();
    const tick = () => {
      const l = target - (Date.now() + offset.current!);
      setLeft(l);
      if (l <= 0 && refreshOnEnd) router.refresh();
      return l;
    };
    tick();
    const id = setInterval(() => {
      if (tick() <= 0) clearInterval(id);
    }, 1000);
    return () => clearInterval(id);
  }, [target, serverNow, refreshOnEnd, router]);

  const s = Math.max(0, Math.floor(left / 1000));
  const parts = [Math.floor(s / 86400), Math.floor((s % 86400) / 3600), Math.floor((s % 3600) / 60), s % 60];
  return (
    <div role="timer" aria-label={`${parts[0]} ${labels[0]} ${parts[1]} ${labels[1]} ${parts[2]} ${labels[2]}`} className="grid grid-cols-4 gap-2">
      {parts.map((v, i) => (
        <div key={labels[i]} className="rounded-[14px] bg-white/95 px-1 py-2.5 text-center text-[#0f1b3d]">
          <b className="block font-mono text-[22px] leading-tight font-bold tabular-nums sm:text-[28px]" aria-hidden="true">
            {pad(v)}
          </b>
          <span className="text-[11px] font-bold text-[#5b6785] uppercase" aria-hidden="true">
            {labels[i]}
          </span>
        </div>
      ))}
    </div>
  );
}
