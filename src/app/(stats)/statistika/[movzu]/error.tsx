"use client";

import { AlertIcon } from "@/components/icons";
import { Button } from "@/components/ui/button";
import { EmptyState } from "@/components/ui/empty-art";
import { az } from "@/content/az";

export default function StatsError({ reset }: { error: Error & { digest?: string }; reset: () => void }) {
  const t = az.app.stats.error;
  return (
    <main className="mx-auto grid w-full max-w-[520px] content-start gap-4 px-4 py-10">
      <EmptyState tone="danger" icon={<AlertIcon />} title={t.title}>
        {t.text}
      </EmptyState>
      <Button type="button" block onClick={reset}>
        {t.retry}
      </Button>
    </main>
  );
}
