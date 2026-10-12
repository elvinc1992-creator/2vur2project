"use client";

import { useEffect, useRef } from "react";

/**
 * Kitab ekranın qalan hissəsini tam tutur: yuxarıdakı başlıqlar və mobil alt menyu çıxılır.
 * 100svh (ünvan sətri görünəndəki hündürlük) götürülür — telefonda sətir gizlənəndə kitab daşmır.
 */
export function BookFrame({ src, title }: { src: string; title: string }) {
  const ref = useRef<HTMLIFrameElement>(null);
  useEffect(() => {
    const fit = () => {
      const f = ref.current;
      if (!f) return;
      const top = f.getBoundingClientRect().top + window.scrollY;
      const bar = document.querySelector<HTMLElement>("[data-tabbar]");
      const below = bar && getComputedStyle(bar).display !== "none" ? bar.offsetHeight : 0;
      f.style.height = `max(480px, calc(100svh - ${Math.round(top + below)}px))`;
    };
    fit();
    window.addEventListener("resize", fit);
    return () => window.removeEventListener("resize", fit);
  }, []);
  return <iframe ref={ref} src={src} title={title} className="block h-[calc(100svh-9rem)] min-h-[480px] w-full border-0" />;
}
