import "server-only";
import { cookies } from "next/headers";
import type { Letter, TopicSlug } from "./content";

// DEMO VƏZİYYƏTİ — httpOnly kukidə (alışlar, cavablar, nəticələr).
// Real versiyada bunlar DB cədvəlləri olacaq (mock_exam_purchases, attempts, payments…).

// Versiya dəyişəndə köhnə kukilər nəzərə alınmır — hamı sıfırdan başlayır.
// v3: 7 mövzu × 10 günün sualı, yeni istifadəçi abunəsiz (pulsuz plan) başlayır.
const COOKIE = "demo_v3";

export type DailyAnswer = Letter | "skip";

export type ReviewSession = {
  items: Array<{ ref: string; kind: "mistake" | "similar" }>;
  answers: Record<string, { a: Letter | "skip"; ok: boolean }>;
  startedAt: number;
};

/** Onlayn repetitor: cavab (və düz olub-olmadığı) və ipucuna baxılıb-baxılmadığı. */
export type TutorProgress = { a?: Letter | "skip"; ok?: boolean; hint?: boolean };

export type Attempt = {
  /** Server vaxtı (ms): ilk başlanğıc. */
  startedAt: number | null;
  /** Yığılmış aktiv vaxt — sayğac yalnız səhifə açıq olanda gedir (bax: timer.ts). */
  elapsedMs?: number;
  /** Açıq seansın son siqnalı; null — fasilədə. */
  lastSeenAt?: number | null;
  /** n → hərf (qapalı), ədəd (kodlaşdırılan), "w" (yazılı — mətn brauzerdə saxlanılır). */
  answers: Record<string, string>;
  flags: number[];
};

export type ExamResult = {
  score: number;
  correct: number;
  wrong: number;
  empty: number;
  /** Əl ilə yoxlanmalı yazılı cavablar. */
  pending: number;
  byTopic: Array<{ topic: TopicSlug; ok: number; total: number }>;
  weak: Array<{ topic: TopicSlug; type: string; ref: string }>;
  answers: Record<string, string>;
  timedOut?: boolean;
  finishedAt: number;
};

export type Payment = { id: string; title: string; date: string; method: string; examId?: string };

export type DemoState = {
  uid: string;
  daily: Record<string, DailyAnswer>;
  purchased: string[];
  attempts: Record<string, Attempt>;
  results: Record<string, ExamResult>;
  /** "none" — heç abunə olmayıb (pulsuz plan); periodEnd boşdur. */
  sub: { status: "active" | "canceled" | "none"; periodEnd: string };
  payments: Payment[];
  /** Səhvlərim: aktiv təkrar seansı (sual ref-ləri: d:…, r:…, e:…). */
  review?: ReviewSession;
  /** Təkrarda düzgün həll olunmuş səhvlər: ref → vaxt. */
  fixed?: Record<string, number>;
  /** Təkrarda oxşar suala verilmiş səhv cavablar — onlar da "Səhvlərim"ə düşür. */
  practiceMistakes?: Record<string, Letter | "skip">;
  /** Onlayn repetitor: sual id → proqres (köhnə kukilərdə yoxdur). */
  tutor?: Record<string, TutorProgress>;
  /** Demo: abunə olsa da pulsuz plan kimi bax (ödənişli hissələr kilidlənir). */
  free?: boolean;
};

/** Sıfır vəziyyət: heç bir sual həll olunmayıb, sınaq alınmayıb, abunə yoxdur (pulsuz plan). */
export function seedState(uid: string): DemoState {
  return {
    uid,
    daily: {},
    purchased: [],
    attempts: {},
    results: {},
    sub: { status: "none", periodEnd: "" },
    payments: [],
  };
}

export async function getDemoState(uid: string): Promise<DemoState> {
  const raw = (await cookies()).get(COOKIE)?.value;
  if (raw) {
    try {
      const parsed = JSON.parse(Buffer.from(raw, "base64url").toString("utf8")) as DemoState;
      if (parsed.uid === uid && parsed.daily && parsed.attempts) return parsed;
    } catch {
      // korlanmış kuki — yenidən seed edirik
    }
  }
  return seedState(uid);
}

/** Yalnız server action / route handler daxilində. */
export async function saveDemoState(state: DemoState) {
  (await cookies()).set(COOKIE, Buffer.from(JSON.stringify(state)).toString("base64url"), {
    httpOnly: true,
    sameSite: "lax",
    secure: process.env.NODE_ENV === "production",
    path: "/",
    maxAge: 60 * 60 * 24 * 30,
  });
}

export async function resetDemoState() {
  (await cookies()).delete(COOKIE);
}
