"use client";

import { useEffect, useRef } from "react";

/**
 * Cavab davranışı (zəif mövzuların təhlili üçün): sual açılandan cavaba qədər vaxt (ms)
 * və seçimin neçə dəfə dəyişdirildiyi.
 */
export function useAnswerMeta() {
  const start = useRef(0);
  const last = useRef<string | null>(null);
  const changes = useRef(0);
  useEffect(() => {
    start.current = Date.now();
  }, []);
  return {
    /** Hər seçimdə çağırılır. */
    track(choice: string | null) {
      if (!choice) return;
      if (last.current && last.current !== choice) changes.current += 1;
      last.current = choice;
    },
    meta: () => ({ ms: start.current ? Date.now() - start.current : 0, ch: changes.current }),
  };
}
