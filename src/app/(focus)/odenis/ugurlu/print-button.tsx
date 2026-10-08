"use client";

import { DownloadIcon } from "@/components/icons";
import { Button } from "@/components/ui/button";

/** Brauzerin çap pəncərəsi — oradan "PDF kimi saxla" seçmək olur. */
export function PrintButton({ label }: { label: string }) {
  return (
    <Button type="button" variant="ghost" size="sm" className="justify-self-start print:hidden" onClick={() => window.print()}>
      <DownloadIcon />
      {label}
    </Button>
  );
}
