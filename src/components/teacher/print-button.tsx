"use client";

/** Çap / PDF (brauzerin "PDF kimi saxla" seçimi ilə). */
export function PrintButton() {
  return (
    <button type="button" onClick={() => window.print()} className="cursor-pointer rounded-[12px] bg-[#0f1b3d] px-4 py-2.5 text-[14px] font-bold text-white">
      🖨️ PDF / Çap
    </button>
  );
}
