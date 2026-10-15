"use client";

import { useSyncExternalStore } from "react";

// Köhnə nəticələr: serverdə yalnız "yazılıb" işarəsi ("w") var, mətn sınaq işlənən brauzerdə qalıb
// (exam-runner.tsx ilə eyni açar). Bu cihazda tapılmasa — "Yazılıb" göstərilir.

const subscribe = (cb: () => void) => {
  window.addEventListener("storage", cb);
  return () => window.removeEventListener("storage", cb);
};

export function LocalWrittenAnswer({ examId, n, fallback }: { examId: string; n: number; fallback: string }) {
  const text = useSyncExternalStore(
    subscribe,
    () => {
      try {
        return localStorage.getItem(`exam:${examId}:w:${n}`);
      } catch {
        return null;
      }
    },
    () => null,
  );
  if (!text?.trim()) return <span>{fallback}</span>;
  return <span className="font-normal whitespace-pre-wrap text-ink [overflow-wrap:anywhere]">{text}</span>;
}
