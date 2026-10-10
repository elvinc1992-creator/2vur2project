"use client";

import { useEffect, useState } from "react";

export type SessionUser = { name?: string | null; email?: string | null };

/**
 * Daxil olmuş istifadəçi (brauzerdə yoxlanılır). Ana səhifə statik keşlənir — server sessiyanı orada oxumur,
 * ona görə başlıq və CTA-lar sessiyanı Auth.js-in /api/auth/session endpoint-indən götürür.
 * undefined — hələ yoxlanılır, null — qonaq.
 */
export function useSessionUser(): SessionUser | null | undefined {
  const [user, setUser] = useState<SessionUser | null | undefined>(undefined);
  useEffect(() => {
    let alive = true;
    fetch("/api/auth/session", { credentials: "same-origin" })
      .then((r) => (r.ok ? r.json() : null))
      .then((s: { user?: SessionUser } | null) => alive && setUser(s?.user ?? null))
      .catch(() => alive && setUser(null));
    return () => {
      alive = false;
    };
  }, []);
  return user;
}
