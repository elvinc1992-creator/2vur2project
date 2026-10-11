"use client";

import { useEffect, useRef, useState } from "react";

type Section = { format: string; label: string; count: number | null };

/** Əl ilə seçilmiş sualların sayı (bölmə üzrə) — forma dəyişəndə yenilənir. */
export function PickCounter({ sections }: { sections: Section[] }) {
  const ref = useRef<HTMLOutputElement>(null);
  const [picked, setPicked] = useState<Record<string, number>>({});

  useEffect(() => {
    const form = ref.current?.closest("form");
    if (!form) return;
    const update = () => {
      const fd = new FormData(form);
      const next: Record<string, number> = {};
      for (const s of sections) {
        next[s.format] = fd.getAll(`pick-${s.format}`).length;
        // Mövzu sınağında say formadakı sahədən oxunur.
        if (s.count === null) next[`max-${s.format}`] = Number(fd.get(s.format) ?? 0);
      }
      setPicked(next);
    };
    update();
    form.addEventListener("change", update);
    form.addEventListener("input", update);
    return () => {
      form.removeEventListener("change", update);
      form.removeEventListener("input", update);
    };
  }, [sections]);

  return (
    <output ref={ref} aria-live="polite" className="flex flex-wrap gap-2 text-[13px]">
      {sections.map((s) => {
        const max = s.count ?? picked[`max-${s.format}`] ?? 0;
        const n = picked[s.format] ?? 0;
        return (
          <span
            key={s.format}
            className={`rounded-pill px-2.5 py-1 font-semibold ${n > max ? "bg-danger-100 text-danger-700" : "bg-navy-050 text-navy-900"}`}
          >
            {s.label}: {n} / {max} seçilib{n < max ? ` · ${max - n} avtomatik` : ""}
          </span>
        );
      })}
    </output>
  );
}
