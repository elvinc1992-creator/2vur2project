import "server-only";
import { and, eq } from "drizzle-orm";
import { db } from "@/db";
import { userAnswers, userState } from "@/db/schema";
import { newAnswers } from "./answer-log";
import { answerTopicResolver } from "./answer-topic";
import type { TutorExamRecord, TutorPlan } from "@/lib/repetitor/plan";
import type { Letter } from "./content";

// İSTİFADƏÇİ VƏZİYYƏTİ — bazada, userId-yə bağlı (user_state: alışlar, cavablar, nəticələr, abunə).
// Hər yeni cavab həm də user_answers cədvəlinə ayrıca sətir kimi yazılır (vaxtı ilə).

// Versiya dəyişəndə köhnə vəziyyət nəzərə alınmır — hamı sıfırdan başlayır.
const VERSION = 3;

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
  /** n → suala sərf olunan vaxt (ms) və cavabın dəyişdirilmə sayı (zəif mövzuların təhlili üçün). */
  meta?: Record<string, AnswerMeta>;
};

/** Cavabın davranış məlumatı: vaxt (ms) və cavabın neçə dəfə dəyişdirildiyi. */
export type AnswerMeta = { ms: number; ch: number };

export type ExamResult = {
  score: number;
  correct: number;
  wrong: number;
  empty: number;
  /** Əl ilə yoxlanmalı yazılı cavablar. */
  pending: number;
  /** Mövzu (bank slug-ı) üzrə nəticə. */
  byTopic: Array<{ topic: string; name: string; ok: number; total: number }>;
  weak: Array<{ topic: string; topicName: string; type: string; ref: string }>;
  answers: Record<string, string>;
  /** n → sualın kodu və düzgünlüyü (yazılı — null). */
  items?: Record<string, { code: string; ok: boolean | null }>;
  /** Sınaqdakı vaxt/dəyişiklik və işarələnmiş suallar (köhnə nəticələrdə yoxdur). */
  meta?: Record<string, AnswerMeta>;
  flags?: number[];
  timedOut?: boolean;
  finishedAt: number;
};

export type Payment = { id: string; title: string; date: string; method: string; examId?: string; amount?: string; period?: "month" | "year" };

export type PaidTier = "pro" | "premium";

export type DailySet = { date: string; topics: Array<{ slug: string; ids: string[] }> };

export type DemoState = {
  uid: string;
  daily: Record<string, DailyAnswer>;
  purchased: string[];
  attempts: Record<string, Attempt>;
  results: Record<string, ExamResult>;
  /**
   * "none" — heç abunə olmayıb (Free plan); periodEnd boşdur.
   * tier — Pro və ya Premium (köhnə abunələrdə yoxdur → Premium sayılır).
   */
  sub: { status: "active" | "canceled" | "none"; periodEnd: string; tier?: PaidTier; period?: "month" | "year" };
  payments: Payment[];
  /** Günün sualı: id → düzgündürmü (bankdan yoxlanılıb). Köhnə cavablarda yoxdur — DAILY_KEYS-dən. */
  dailyOk?: Record<string, boolean>;
  /** Bu günün sual dəsti: bankdan təsadüfi 4 mövzu × 5 sual (gün ərzində sabit qalır). */
  dailySet?: DailySet;
  /** Plan üzrə pulsuz seçilmiş sınaqlar (Free — ayda 1, Pro — həftədə 1). */
  examClaims?: Array<{ id: string; at: number }>;
  /** Səhvlərim: aktiv təkrar seansı (sual ref-ləri: d:…, r:…, e:…). */
  review?: ReviewSession;
  /** Təkrarda düzgün həll olunmuş səhvlər: ref → vaxt. */
  fixed?: Record<string, number>;
  /** Təkrarda oxşar suala verilmiş səhv cavablar — onlar da "Səhvlərim"ə düşür. */
  practiceMistakes?: Record<string, Letter | "skip">;
  /** Onlayn repetitor: sual id → proqres (köhnə kukilərdə yoxdur). */
  tutor?: Record<string, TutorProgress>;
  /** Onlayn repetitor (Pro): həftəlik qrafik. */
  tutorPlan?: TutorPlan;
  /** Onlayn repetitor: hər 2 mövzudan sonrakı sınaqların nəticələri (açar: "sinaq-1"…). */
  tutorExams?: Record<string, TutorExamRecord>;
  /** Son cavabların vaxtı/dəyişiklik sayı: "source:ref" → meta (user_answers-ə yazılır; ən çox 100). */
  answerMeta?: Record<string, AnswerMeta>;
};

/** Klientdən gələn meta: yalnız məntiqli ədədlər (≤ 6 saat, ≤ 50 dəyişiklik). */
export function cleanMeta(meta: unknown): AnswerMeta | undefined {
  if (!meta || typeof meta !== "object") return undefined;
  const { ms, ch } = meta as Record<string, unknown>;
  if (typeof ms !== "number" || typeof ch !== "number" || !Number.isFinite(ms) || !Number.isFinite(ch)) return undefined;
  return { ms: Math.min(Math.max(0, ms), 6 * 3_600_000), ch: Math.min(Math.max(0, ch), 50) };
}

/** Cavabın meta məlumatını yadda saxlayır (köhnələr silinir — vəziyyət böyüməsin). */
export function rememberMeta(state: DemoState, key: string, meta: AnswerMeta | undefined) {
  if (!meta) return;
  const m = (state.answerMeta ??= {});
  m[key] = { ms: Math.max(0, Math.round(meta.ms)), ch: Math.max(0, Math.round(meta.ch)) };
  const keys = Object.keys(m);
  for (const k of keys.slice(0, Math.max(0, keys.length - 100))) delete m[k];
}

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

type Stored = DemoState & { v?: number };

/**
 * Yüklənmiş vəziyyət haqqında: bazadakı sətir (null — sətir yox idi) və ilkin JSON.
 * Saxlayanda yeni cavabları tapmaq və paralel yazını aşkarlamaq üçün.
 */
const loaded = new WeakMap<DemoState, { row: string | null; json: string }>();

function parse(raw: string | undefined, uid: string): DemoState | null {
  if (!raw) return null;
  try {
    const parsed = JSON.parse(raw) as Stored;
    if (parsed.v === VERSION && parsed.uid === uid && parsed.daily && parsed.attempts) {
      delete parsed.v;
      return parsed;
    }
  } catch {
    // korlanmış JSON — yenidən seed edirik
  }
  return null;
}

export async function getDemoState(uid: string): Promise<DemoState> {
  const row = await db.query.userState.findFirst({ where: eq(userState.userId, uid) });
  const state = parse(row?.data, uid) ?? seedState(uid);
  loaded.set(state, { row: row?.data ?? null, json: JSON.stringify(state) });
  return state;
}

/**
 * Vəziyyəti yazır, əgər oxunandan bəri başqa sorğu onu dəyişməyibsə (optimistic concurrency).
 * false — paralel yazı olub, dəyişiklik yazılmayıb (bax: updateDemoState).
 */
async function saveDemoState(state: DemoState): Promise<boolean> {
  const before = loaded.get(state);
  const json = JSON.stringify(state);
  if (before && before.json === json) return true; // dəyişiklik yoxdur
  const data = JSON.stringify({ ...state, v: VERSION } satisfies Stored);
  const res = before?.row
    ? await db
        .update(userState)
        .set({ data, updatedAt: new Date() })
        .where(and(eq(userState.userId, state.uid), eq(userState.data, before.row)))
    : await db.insert(userState).values({ userId: state.uid, data }).onConflictDoNothing();
  if (res.rowsAffected === 0) return false;

  // Oxunan vəziyyət (versiya sahəsi olmadan saxlanılıb — parse() yox, birbaşa JSON). Əvvəl burada parse()
  // istifadə olunurdu: o, "v" sahəsini tələb etdiyi üçün null qaytarırdı və hər yazıda bütün köhnə cavablar
  // user_answers-ə yenidən düşürdü.
  const prev = before ? (JSON.parse(before.json) as DemoState) : null;
  const events = newAnswers(prev, state);
  if (events.length) {
    // Mövzu cavab anında yazılır — sual sonradan bankdan çıxsa da təhlil itmir.
    const topicOf = await answerTopicResolver();
    await db.insert(userAnswers).values(events.map((a) => ({ ...a, userId: state.uid, topicSlug: topicOf(a.source, a.questionRef) ?? null })));
  }
  loaded.set(state, { row: data, json });
  return true;
}

/**
 * Oxu → dəyiş → yaz. Paralel sorğu vəziyyəti dəyişibsə, fn təzə vəziyyətlə yenidən çağırılır,
 * ona görə fn-in yeganə yan təsiri vəziyyəti dəyişmək olmalıdır (redirect — çağırışdan sonra).
 */
export async function updateDemoState<T>(uid: string, fn: (state: DemoState) => T | Promise<T>): Promise<T> {
  for (let attempt = 0; ; attempt++) {
    const state = await getDemoState(uid);
    const result = await fn(state);
    if (await saveDemoState(state)) return result;
    if (attempt >= 4) throw new Error("Vəziyyət yazıla bilmədi: çoxlu paralel sorğu");
  }
}

/** Vəziyyəti və cavab tarixçəsini silir — istifadəçi sıfırdan başlayır. */
export async function resetDemoState(uid: string) {
  await db.batch([
    db.delete(userState).where(eq(userState.userId, uid)),
    db.delete(userAnswers).where(eq(userAnswers.userId, uid)),
  ]);
}
