"use server";

import { and, eq } from "drizzle-orm";
import { revalidatePath } from "next/cache";
import { z } from "zod";
import { auth } from "@/auth";
import { db } from "@/db";
import { CONTEST_EVENT_KINDS, contestAttempts, contestEvents, contestRegistrations } from "@/db/schema";
import { contestById, registrationOf } from "./data";
import { sendContestMail } from "./mail";
import { checkContestToken } from "./token";
import { submitAnswer } from "./tour";

// Yarış: qeydiyyat, onlayn turda cavab və hadisə jurnalı. Hər əməliyyatda giriş və vaxt serverdə yoxlanılır.

export type RegisterState =
  | { ok: true; code: string; email: string; already?: boolean }
  | { ok: false; error: string; fields?: Record<string, string> }
  | null;

// Boş xana formdan çıxarılır — "tələb olunur" mesajı da azərbaycanca olsun.
const schema = z.object({
  firstName: z.string({ error: "Adını yaz" }).trim().min(2, "Adını yaz").max(40),
  lastName: z.string({ error: "Soyadını yaz" }).trim().min(2, "Soyadını yaz").max(40),
  grade: z.coerce.number({ error: "Sinfini seç" }).int().refine((g) => [9, 10, 11].includes(g), "Sinfini seç"),
  region: z.string({ error: "Rayon və ya şəhəri yaz" }).trim().min(2, "Rayon və ya şəhəri yaz").max(60),
  school: z.string().trim().max(80).optional(),
  email: z.email({ error: "E-poçt ünvanı düzgün deyil" }).max(120),
  invite: z.string().trim().toUpperCase().max(12).optional(),
  agreeRules: z.literal("on", { error: "Qaydalarla razılığı təsdiqlə" }),
  agreeParent: z.literal("on", { error: "Valideyn razılığını təsdiqlə" }),
  agreeEmail: z.literal("on").optional(),
});

const ALPHABET = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
const newCode = () => `2V2-${Array.from(crypto.getRandomValues(new Uint8Array(5)), (b) => ALPHABET[b % ALPHABET.length]).join("")}`;

export async function registerContestAction(contestId: string, _prev: RegisterState, formData: FormData): Promise<RegisterState> {
  const session = await auth();
  if (!session?.user?.id) return { ok: false, error: "Qeydiyyat üçün hesabına daxil ol." };
  const c = await contestById(contestId);
  if (!c) return { ok: false, error: "Yarış tapılmadı." };

  const existing = await registrationOf(c.id, session.user.id);
  if (existing) return { ok: true, code: existing.inviteCode, email: existing.email, already: true };

  const now = Date.now();
  if (c.status !== "registration" || now < c.regStartAt.getTime() || now > c.regEndAt.getTime()) {
    return { ok: false, error: "Qeydiyyat bağlıdır." };
  }

  const parsed = schema.safeParse(Object.fromEntries([...formData].filter(([, v]) => v !== "")));
  if (!parsed.success) {
    const fields: Record<string, string> = {};
    for (const i of parsed.error.issues) fields[String(i.path[0])] ??= i.message;
    return { ok: false, error: Object.values(fields)[0] ?? "Məlumatları yoxla.", fields };
  }
  const p = parsed.data;

  // Dəvət kodu — yalnız statistika və fondun artması üçün (dəvət edənə bal verilmir).
  let invitedById: string | null = null;
  if (p.invite) {
    const [inv] = await db
      .select({ id: contestRegistrations.id })
      .from(contestRegistrations)
      .where(and(eq(contestRegistrations.contestId, c.id), eq(contestRegistrations.inviteCode, p.invite)));
    invitedById = inv?.id ?? null;
  }

  for (let attempt = 0; attempt < 5; attempt++) {
    const reg = {
      id: crypto.randomUUID(),
      contestId: c.id,
      userId: session.user.id,
      firstName: p.firstName,
      lastName: p.lastName,
      grade: p.grade,
      region: p.region,
      school: p.school || null,
      email: p.email.toLowerCase(),
      inviteCode: newCode(),
      invitedByCode: p.invite || null,
      invitedById,
      agreeRules: true,
      agreeParent: true,
      agreeEmail: p.agreeEmail === "on",
      createdAt: new Date(now),
    };
    try {
      await db.insert(contestRegistrations).values(reg);
    } catch (e) {
      // Eyni anda iki sorğu — artıq qeydiyyatdadır; kod təkrarlanıbsa — yenidən.
      const again = await registrationOf(c.id, session.user.id);
      if (again) return { ok: true, code: again.inviteCode, email: again.email, already: true };
      if (attempt === 4) throw e;
      continue;
    }
    await sendContestMail("confirm", c, { ...reg, unsubscribedAt: null });
    // Səhifə yenidən render olunmur — iştirakçı "Qeydiyyat tamamlandı" və kodunu görsün (sayğac növbəti açılışda yenilənir).
    return { ok: true, code: reg.inviteCode, email: reg.email };
  }
  return { ok: false, error: "Yenidən cəhd et." };
}

async function myRegistration(contestId: string) {
  const session = await auth();
  if (!session?.user?.id) return null;
  const c = await contestById(contestId);
  if (!c) return null;
  const reg = await registrationOf(c.id, session.user.id);
  return reg ? { c, reg } : null;
}

/** Cari suala cavab (geri qayıtmaq yoxdur). */
export async function answerContestAction(contestId: string, n: number, letter: string) {
  const me = await myRegistration(contestId);
  if (!me) return { ok: false };
  const ok = await submitAnswer(me.c, me.reg, n, letter);
  return { ok };
}

/** Tab dəyişmə, pəncərədən çıxma, bağlantı — jurnala (diskvalifikasiya üçün avtomatik səbəb deyil). */
export async function logContestEventAction(contestId: string, kind: string, n: number | null) {
  const k = z.enum(CONTEST_EVENT_KINDS).safeParse(kind);
  const me = await myRegistration(contestId);
  if (!me || !k.success) return;
  const [a] = await db.select({ f: contestAttempts.finishedAt }).from(contestAttempts).where(eq(contestAttempts.registrationId, me.reg.id));
  if (!a || a.f) return;
  await db.insert(contestEvents).values({ registrationId: me.reg.id, kind: k.data, n, at: new Date() });
}

/** E-poçtdan imtina (imzalı link). */
export async function unsubscribeContestAction(formData: FormData) {
  const r = String(formData.get("r") ?? "");
  const t = String(formData.get("t") ?? "");
  if (!checkContestToken(r, "unsub", t)) return;
  await db.update(contestRegistrations).set({ unsubscribedAt: new Date(), agreeEmail: false }).where(eq(contestRegistrations.id, r));
  revalidatePath("/yaris/imtina");
}
