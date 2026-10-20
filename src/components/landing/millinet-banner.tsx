"use client";

import { useEffect, useRef } from "react";
import { cn } from "@/lib/cn";

const SRC = "https://millinet.az/banner.js?id=624";
/** Rəsmi kod ümumi millinet.az-a aparır — bizim müsabiqə səhifəmizə yönləndiririk. */
const LINK = "https://millinet.az/az/musabiqeler/musabiqe2026/2vur2az";
const IMG = "https://millinet.az/images/participant.png?v=2";

/**
 * MilliNet2026 iştirakçı banneri. Rəsmi kod (banner.js) document.write ilə link+şəkil yazır —
 * bu yalnız səhifə serverdən ilk dəfə yüklənəndə işləyir. Buna görə skript HTML-ə olduğu kimi
 * qoyulur; client naviqasiyasında (skript işləmədikdə) eyni banner əl ilə əlavə olunur.
 */
export function MilliNetBanner({ className }: { className?: string }) {
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const el = ref.current;
    if (!el) return;
    const written = el.querySelector("img");
    if (written) {
      // Rəsmi kodun şəklində alt yoxdur (əlçatanlıq).
      if (!written.alt) written.alt = "MilliNet2026 iştirakçısı";
      const link = written.closest("a");
      if (link) {
        link.href = LINK;
        link.rel = "noopener";
      }
      return;
    }
    const a = document.createElement("a");
    a.href = LINK;
    a.target = "_blank";
    a.rel = "noopener";
    const img = document.createElement("img");
    img.src = IMG;
    img.alt = "MilliNet2026 iştirakçısı";
    a.append(img);
    el.append(a);
  }, []);

  return (
    <div
      ref={ref}
      className={cn("flex [&_a]:block [&_img]:block [&_img]:h-full [&_img]:w-auto [&_img]:max-w-none", className)}
      suppressHydrationWarning
      dangerouslySetInnerHTML={{ __html: `<!--MilliNet --><script type="text/javascript" src="${SRC}"></script>` }}
    />
  );
}
