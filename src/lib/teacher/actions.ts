"use server";

import { and, count, eq, gte, isNull, like, lt, not } from "drizzle-orm";
import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import { auth } from "@/auth";
import { db } from "@/db";
import {
  payments,
  teacherAccounts,
  teacherApplications,
  teacherBalanceTx,
  teacherGroupMembers,
  teacherGroups,
  teacherReports,
  teacherTestAnswers,
  teacherTestAttempts,
  teacherTests,
  topics,
  userAnswers,
  users,
  userTopicStats,
} from "@/db/schema";
import { isPassive } from "@/lib/auth/account";
import { emailProvider } from "@/lib/email";
import { env } from "@/lib/env";
import { createTeacherTest, TEACHER_KINDS } from "./create";
import { fullName, groupResults, itemsOf, membersOf, ownGroup, ownTest, saveResults, variantsOf } from "./data";
import { requireTeacher } from "./guard";
import { closesAt, variantOf } from "./online";
import { gradeEntries } from "./variants";

// Müəllim paneli əməliyyatları. Hər əməliyyatda rol bazadan yoxlanılır və yalnız öz qrupu / sınağı.

const ALPHABET = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
const code6 = () => {
  const r = Array.from(crypto.getRandomValues(new Uint8Array(6)), (b) => ALPHABET[b % ALPHABET.length]).join("");
  return `${r.slice(0, 3)}-${r.slice(3)}`;
};

/* ---------------- Müraciət (müəllim olmaq istəyən istifadəçi) ---------------- */

export async function applyTeacherAction(formData: FormData) {
  const session = await auth();
  if (!session?.user?.id) redirect("/daxil-ol?next=/muellim/muraciet");
  if (await isPassive(session.user.id)) redirect("/hesab-deaktiv");
  const p = z.object({ school: z.string().trim().min(2).max(120), note: z.string().trim().max(500).optional() }).safeParse(Object.fromEntries(formData));
  if (!p.success) redirect("/muellim/muraciet?xeta=1");
  await db
    .insert(teacherApplications)
    .values({ userId: session.user.id, school: p.data.school, note: p.data.note || null, status: "pending" })
    .onConflictDoUpdate({ target: teacherApplications.userId, set: { school: p.data.school, note: p.data.note || null, status: "pending", createdAt: new Date(), decidedAt: null } });
  redirect("/muellim/muraciet?gonderildi=1");
}

/* ---------------- Qruplar ---------------- */

export async function createGroupAction(formData: FormData) {
  const me = await requireTeacher();
  const p = z.object({ name: z.string().trim().min(2).max(60) }).parse(Object.fromEntries(formData));
  const id = crypto.randomUUID();
  for (let i = 0; i < 5; i++) {
    try {
      await db.insert(teacherGroups).values({ id, teacherId: me.id, name: p.name, code: code6() });
      break;
    } catch (e) {
      if (i === 4) throw e;
    }
  }
  revalidatePath("/muellim");
  redirect(`/muellim/qruplar/${id}?yaradildi=1`);
}

export async function regenerateCodeAction(formData: FormData) {
  const me = await requireTeacher();
  const g = await ownGroup(me.id, String(formData.get("groupId")));
  if (!g) redirect("/muellim/qruplar");
  await db.update(teacherGroups).set({ code: code6() }).where(eq(teacherGroups.id, g.id));
  redirect(`/muellim/qruplar/${g.id}?kod=1`);
}

export async function removeMemberAction(formData: FormData) {
  const me = await requireTeacher();
  const g = await ownGroup(me.id, String(formData.get("groupId")));
  if (!g) redirect("/muellim/qruplar");
  await db
    .update(teacherGroupMembers)
    .set({ leftAt: new Date() })
    .where(and(eq(teacherGroupMembers.groupId, g.id), eq(teacherGroupMembers.userId, String(formData.get("userId")))));
  redirect(`/muellim/qruplar/${g.id}?cixarildi=1`);
}

/* ---------------- Sınaq ---------------- */

export async function createTestAction(formData: FormData) {
  const me = await requireTeacher("/muellim/sinaq-yarat");
  const groupIds = formData.getAll("groupId").map(String).filter(Boolean);
  const p = z
    .object({
      kind: z.enum(TEACHER_KINDS),
      topicId: z.coerce.number().int().optional(),
      questionCount: z.coerce.number().int().optional(),
      mode: z.enum(["paper", "online"]),
      date: z.string().regex(/^\d{4}-\d{2}-\d{2}$/),
      time: z.string().regex(/^\d{2}:\d{2}$/).optional(),
      durationMin: z.coerce.number().int().min(10).max(300),
      shuffle: z.string().optional(),
      noRepeat: z.string().optional(),
    })
    .parse(Object.fromEntries([...formData].filter(([k, v]) => v !== "" && k !== "groupId")));
  const opensAt = new Date(`${p.date}T${p.time ?? "09:00"}:00+04:00`);
  const r = await createTeacherTest({
    teacherId: me.id,
    groupIds,
    kind: p.kind,
    topicId: p.topicId,
    questionCount: p.questionCount,
    mode: p.mode,
    opensAt,
    durationMin: p.durationMin,
    shuffle: p.shuffle === "on",
    noRepeat: p.noRepeat === "on",
  });
  if (!r.ok) redirect(`/muellim/sinaq-yarat?xeta=${r.error}${r.need ? `&mebleg=${r.need}` : ""}`);
  if (p.mode === "online") await notifyOnline(r.id);
  revalidatePath("/muellim");
  redirect(`/muellim/sinaqlar/${r.id}?yaradildi=1${r.reused ? `&tekrar=${r.reused}` : ""}`);
}

/** Onlayn sınaq: şagirdlərə e-poçt (saytda isə "Qruplarım" və paneldə görünür). */
async function notifyOnline(testId: string) {
  const [t] = await db.select().from(teacherTests).where(eq(teacherTests.id, testId));
  const vs = await variantsOf(testId);
  const emails = await db.select({ id: users.id, email: users.email }).from(users);
  const when = new Intl.DateTimeFormat("az-AZ", { timeZone: "Asia/Baku", dateStyle: "long", timeStyle: "short" }).format(t.opensAt);
  for (const v of vs) {
    const to = emails.find((e) => e.id === v.userId)?.email;
    if (!to) continue;
    await emailProvider().send({
      to,
      subject: `Müəllimin onlayn sınağı №${t.number}`,
      text: `Salam, ${v.name}!\n\nMüəllimin sənin üçün onlayn sınaq təyin etdi.\nAçılır: ${when} (24 saat açıq qalır)\nMüddət: ${t.durationMin} dəqiqə — başlayandan sonra vaxt dayanmır.\n\nKeçid: ${env.APP_URL}/qruplarim\n\n—\n2vur2.az`,
    });
  }
}

/**
 * Kağız sınağının nəticələri: hər şagird üçün cavab kartından (göstərilən sıra ilə) — şagirdin öz variantına görə
 * yoxlanılır, qrup analitikasına və şagirdin zəif mövzu təhlilinə yazılır.
 */
export async function saveResultsAction(testId: string, rows: Array<{ userId: string; entries: string[] }>) {
  const me = await requireTeacher();
  const t = await ownTest(me.id, testId);
  if (!t) return { ok: false };
  const [items, variants, existing] = await Promise.all([itemsOf(t.id), variantsOf(t.id), db.select().from(teacherTestAnswers).where(eq(teacherTestAnswers.testId, t.id))]);
  let saved = 0;
  for (const row of rows) {
    const v = variants.find((x) => x.userId === row.userId);
    if (!v || !row.entries.some((e) => e.trim())) continue;
    const graded = gradeEntries(v, items, row.entries.slice(0, items.length)).map((g) => {
      // Onlayn sınaqda yazılı cavabın mətni saxlanılır (müəllim yalnız bal yazır)
      const prev = existing.find((a) => a.userId === row.userId && a.n === g.n);
      // Onlayn sınaqda qapalı / kodlaşdırılan cavablar şagirdin özünündür — müəllim dəyişə bilmir
      if (t.mode === "online" && items.find((i) => i.n === g.n)?.format !== "written") return { n: g.n, given: prev?.given ?? null, score: prev ? prev.score : 0 };
      return items.find((i) => i.n === g.n)?.format === "written" && prev?.given ? { ...g, given: prev.given } : g;
    });
    await saveResults(t.id, row.userId, items, graded);
    saved++;
  }
  await db.update(teacherTests).set({ resultsAt: new Date() }).where(eq(teacherTests.id, t.id));
  revalidatePath(`/muellim/sinaqlar/${t.id}`);
  return { ok: true, saved };
}

/* ---------------- Balans (ödəniş — saytın mövcud test ödənişi kimi) ---------------- */

export async function topupAction(formData: FormData) {
  const me = await requireTeacher("/muellim/balans");
  const p = z.object({ amount: z.coerce.number().int().min(5).max(1000), consent: z.literal("on") }).safeParse(Object.fromEntries(formData));
  if (!p.success) redirect("/muellim/balans?xeta=1");
  const [acc] = await db.select().from(teacherAccounts).where(eq(teacherAccounts.userId, me.id));
  await db.update(teacherAccounts).set({ balance: (acc?.balance ?? 0) + p.data.amount }).where(eq(teacherAccounts.userId, me.id));
  await db.insert(teacherBalanceTx).values({ teacherId: me.id, amount: p.data.amount, kind: "topup", note: "Kartla ödəniş (test rejimi)" });
  await db.insert(payments).values({
    id: `${me.id}:bal:${Date.now()}`,
    userId: me.id,
    kind: "teacher_topup",
    title: "Müəllim balansının artırılması",
    amount: p.data.amount,
  });
  revalidatePath("/muellim");
  redirect("/muellim/balans?ok=1");
}

/* ---------------- Valideyn hesabatı ---------------- */

export type ReportData = {
  student: string;
  teacher: string;
  group: string;
  month: string;
  avg: number | null;
  tests: number;
  tasks: number;
  place: number | null;
  size: number;
  strong: Array<{ topic: string; pct: number }>;
  weak: Array<{ topic: string; pct: number }>;
};

/** Aylıq hesabat: link (təxmin edilə bilməyən, 30 gün etibarlı) — yalnız həmin şagirdin məlumatı, yaradılan anın görüntüsü. */
export async function createReportAction(formData: FormData) {
  const me = await requireTeacher("/muellim/hesabat");
  const p = z
    .object({ groupId: z.string(), userId: z.string(), month: z.string().regex(/^\d{4}-\d{2}$/), note: z.string().trim().max(600).optional() })
    .parse(Object.fromEntries(formData));
  const g = await ownGroup(me.id, p.groupId);
  const members = g ? await membersOf(g.id) : [];
  const student = members.find((m) => m.id === p.userId);
  if (!g || !student) redirect("/muellim/hesabat?xeta=1");

  const from = new Date(`${p.month}-01T00:00:00+04:00`);
  const to = new Date(from);
  to.setMonth(to.getMonth() + 1);
  const results = (await groupResults(me.id, g.id)).filter((r) => r.test.opensAt >= from && r.test.opensAt < to);
  const mine = results.map((r) => r.per.get(student.id)).filter((x): x is number => x !== undefined);
  const avgOf = (id: string) => {
    const xs = results.map((r) => r.per.get(id)).filter((x): x is number => x !== undefined);
    return xs.length ? xs.reduce((s, x) => s + x, 0) / xs.length : null;
  };
  const ranked = members
    .map((m) => ({ id: m.id, avg: avgOf(m.id) }))
    .filter((x) => x.avg !== null)
    .sort((a, b) => b.avg! - a.avg!);
  const placeIdx = ranked.findIndex((x) => x.id === student.id);
  const [[{ n: tasks }], stats] = await Promise.all([
    db
      .select({ n: count() })
      .from(userAnswers)
      .where(and(eq(userAnswers.userId, student.id), gte(userAnswers.answeredAt, from), lt(userAnswers.answeredAt, to), not(like(userAnswers.questionRef, "t:%")))),
    db
      .select({ topic: topics.name, mastery: userTopicStats.mastery })
      .from(userTopicStats)
      .innerJoin(topics, eq(topics.id, userTopicStats.topicId))
      .where(eq(userTopicStats.userId, student.id)),
  ]);
  const sorted = stats.map((s) => ({ topic: s.topic, pct: Math.round(s.mastery * 100) })).sort((a, b) => b.pct - a.pct);
  const data: ReportData = {
    student: fullName(student),
    teacher: fullName(me),
    group: g.name,
    month: p.month,
    avg: mine.length ? Math.round(mine.reduce((s, x) => s + x, 0) / mine.length) : null,
    tests: mine.length,
    tasks,
    place: placeIdx >= 0 ? placeIdx + 1 : null,
    size: members.length,
    strong: sorted.slice(0, 2),
    weak: sorted.slice(-2).reverse(),
  };
  const id = Buffer.from(crypto.getRandomValues(new Uint8Array(24))).toString("base64url");
  await db.insert(teacherReports).values({
    id,
    teacherId: me.id,
    userId: student.id,
    month: p.month,
    note: p.note || null,
    data: JSON.stringify(data),
    expiresAt: new Date(Date.now() + 30 * 86_400_000),
  });
  redirect(`/muellim/hesabat?qrup=${g.id}&sagird=${student.id}&r=${id}`);
}

/* ---------------- Şagird tərəfi ---------------- */

export async function joinGroupAction(formData: FormData) {
  const session = await auth();
  if (!session?.user?.id) redirect("/daxil-ol?next=/qruplarim");
  if (await isPassive(session.user.id)) redirect("/hesab-deaktiv");
  const code = String(formData.get("code") ?? "").trim().toUpperCase().replace(/\s/g, "");
  const norm = code.includes("-") ? code : `${code.slice(0, 3)}-${code.slice(3)}`;
  const [g] = await db.select().from(teacherGroups).where(eq(teacherGroups.code, norm));
  if (!g) redirect("/qruplarim?xeta=kod");
  if (g.teacherId === session.user.id) redirect("/qruplarim?xeta=ozun");
  await db
    .insert(teacherGroupMembers)
    .values({ groupId: g.id, userId: session.user.id, joinedAt: new Date() })
    .onConflictDoUpdate({ target: [teacherGroupMembers.groupId, teacherGroupMembers.userId], set: { leftAt: null, joinedAt: new Date() } });
  redirect("/qruplarim?qosuldu=1");
}

/** Onlayn sınağa başlamaq: yalnız variantı olan şagird, sınaq açıq olanda; vaxt bu andan gedir və dayanmır. */
export async function startOnlineAction(testId: string) {
  const session = await auth();
  if (!session?.user?.id) redirect(`/daxil-ol?next=/qruplarim`);
  if (await isPassive(session.user.id)) redirect("/hesab-deaktiv");
  const [t] = await db.select().from(teacherTests).where(and(eq(teacherTests.id, testId), eq(teacherTests.mode, "online")));
  const v = t ? await variantOf(t.id, session.user.id) : null;
  const now = Date.now();
  if (!t || !v || now < t.opensAt.getTime() || now >= closesAt(t)) redirect("/qruplarim?xeta=sinaq");
  await db.insert(teacherTestAttempts).values({ testId: t.id, userId: session.user.id, startedAt: new Date(now) }).onConflictDoNothing();
  redirect(`/muellim-sinaq/${t.id}`);
}

export async function leaveGroupAction(formData: FormData) {
  const session = await auth();
  if (!session?.user?.id) redirect("/daxil-ol?next=/qruplarim");
  await db
    .update(teacherGroupMembers)
    .set({ leftAt: new Date() })
    .where(and(eq(teacherGroupMembers.groupId, String(formData.get("groupId"))), eq(teacherGroupMembers.userId, session.user.id), isNull(teacherGroupMembers.leftAt)));
  redirect("/qruplarim?cixdi=1");
}
