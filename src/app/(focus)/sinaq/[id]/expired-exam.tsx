"use client";

import { useEffect, useState } from "react";
import { ClockIcon } from "@/components/icons";
import { ButtonLink } from "@/components/ui/button";
import { EmptyState } from "@/components/ui/empty-art";
import { az } from "@/content/az";
import { examApi } from "@/lib/demo/exam-api";

/** Vaxtı bitmiş sınaq: davam etmək olmur — cavablar göndərilir, nəticəyə keçid açılır. */
export function ExpiredExam({ examId, answered }: { examId: string; answered: number }) {
  const t = az.app.exam;
  const [ready, setReady] = useState(false);
  useEffect(() => {
    // Route Handler — səhifə yenidən render olunmur, ekran nəticə linki ilə qalır.
    examApi.timeout(examId).then(
      () => setReady(true),
      () => setReady(true),
    );
  }, [examId]);
  return (
    <main className="mx-auto grid w-full max-w-[520px] content-start gap-4 px-4 py-10">
      <EmptyState tone="warning" icon={<ClockIcon />} title={t.timeoutTitle}>
        {t.timeoutText(answered)}
      </EmptyState>
      {ready ? (
        <ButtonLink href={`/sinaq/${examId}/netice`} block>
          {t.toResult}
        </ButtonLink>
      ) : (
        <p role="status" className="text-center text-small text-ink-muted">
          {t.finalizing}
        </p>
      )}
      <ButtonLink href="/panel" variant="ghost" block>
        {t.toPanel}
      </ButtonLink>
    </main>
  );
}
