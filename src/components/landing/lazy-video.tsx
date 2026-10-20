"use client";

import { useEffect, useRef } from "react";

/** Səssiz, təkrarlanan video — ekrana yaxınlaşanda yüklənir; reduced-motion-da avtomatik oynamır. */
export function LazyVideo({ src, poster, label }: { src: string; poster?: string; label: string }) {
  const ref = useRef<HTMLVideoElement>(null);

  useEffect(() => {
    const el = ref.current;
    if (!el) return;
    const start = () => {
      el.src = src;
      if (!matchMedia("(prefers-reduced-motion: reduce)").matches) el.play().catch(() => {});
    };
    if (!("IntersectionObserver" in window)) return start();
    const io = new IntersectionObserver(
      ([entry]) => {
        if (!entry.isIntersecting) return;
        io.disconnect();
        start();
      },
      { rootMargin: "300px" },
    );
    io.observe(el);
    return () => io.disconnect();
  }, [src]);

  return (
    <video
      ref={ref}
      poster={poster}
      muted
      loop
      playsInline
      preload="none"
      controls
      aria-label={label}
      className="block aspect-video w-full rounded-xl bg-navy-900 object-cover shadow-raised"
    />
  );
}
