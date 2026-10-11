"use server";

import { and, eq, max } from "drizzle-orm";
import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import { db } from "@/db";
import { CONTEST_STATUSES, contestPrizes, contestRegistrations, contestResults, contests, contestTemplates } from "@/db/schema";
import { requireAdmin } from "@/lib/admin/guard";
import { contestById } from "./data";
import { sendContestMail } from "./mail";
import { computeResults, publishFinal, sendFinalistMails, sendResultMails } from "./process";
import { OPENING_TEMPLATES } from "./templates";
import { LETTERS, makeVariant } from "./variant";

// Admin: yarışın yaradılması və redaktəsi, sual şablonları, diskvalifikasiya, final, mükafatlar, e-poçtlar.

const back = (id: string, tab = "", extra = "") => `/admin/yaris/${id}${tab ? `?tab=${tab}` : ""}${extra ? `${tab ? "&" : "?"}${extra}` : ""}`;
/** datetime-local (Bakı vaxtı) → Date */
const baku = (v: unknown) => (typeof v === "string" && v ? new Date(`${v}:00+04:00`) : null);

const settings = z.object({
  title: z.string().trim().min(3).max(120),
  slug: z.string().trim().toLowerCase().regex(/^[a-z0-9-]{3,40}$/),
  description: z.string().trim().max(400).optional().default(""),
  entryWindowMin: z.coerce.number().int().min(1).max(60),
  durationMin: z.coerce.number().int().min(5).max(180),
  questionCount: z.coerce.number().int().min(1).max(60),
  finalistCount: z.coerce.number().int().min(1).max(500),
  prizeFund: z.coerce.number().min(0).max(1_000_000),
  boostThreshold: z.coerce.number().int().min(0).optional(),
  boostFirstPrize: z.coerce.number().min(0).optional(),
  status: z.enum(CONTEST_STATUSES),
  finalPlace: z.string().trim().max(200).optional(),
});

/** Mükafatlar sətir-sətir: "1 | 300 | + 6 ay Premium", "4-10 | | 1 ay pulsuz Pro". */
function parsePrizes(text: string) {
  return text
    .split("\n")
    .map((l) => l.trim())
    .filter(Boolean)
    .map((l) => {
      const [range, amount, ...desc] = l.split("|").map((x) => x.trim());
      const [from, to] = range.split(/[-–]/).map((x) => Number(x.trim()));
      if (!from) throw new Error(`Mükafat sətri səhvdir: ${l}`);
      return { placeFrom: from, placeTo: to || from, amount: amount ? Number(amount) : null, description: desc.join(" | ") };
    });
}

export async function createContestAction(formData: FormData) {
  await requireAdmin();
  const p = z
    .object({ title: z.string().trim().min(3).max(120), slug: z.string().trim().toLowerCase().regex(/^[a-z0-9-]{3,40}$/), templates: z.string().optional() })
    .parse(Object.fromEntries(formData));
  const id = p.slug;
  const start = baku(formData.get("startAt")) ?? new Date(Date.now() + 30 * 86_400_000);
  await db.insert(contests).values({
    id,
    slug: p.slug,
    title: p.title,
    regStartAt: baku(formData.get("regStartAt")) ?? new Date(),
    regEndAt: baku(formData.get("regEndAt")) ?? new Date(start.getTime() - 86_400_000),
    startAt: start,
    status: "draft",
  });
  if (p.templates === "on") {
    await db.insert(contestTemplates).values(
      OPENING_TEMPLATES.map((t, i) => ({
        contestId: id,
        n: i + 1,
        body: t.body,
        vars: JSON.stringify(t.vars),
        condition: t.condition ?? null,
        answer: t.answer,
        distractors: JSON.stringify(t.distractors),
        solution: t.solution ?? "",
        timeSec: t.timeSec ?? 75,
      })),
    );
  }
  revalidatePath("/admin/yaris");
  redirect(back(id, "", "yaradildi=1"));
}

export async function updateContestAction(formData: FormData) {
  await requireAdmin();
  const id = String(formData.get("id"));
  const p = settings.parse(Object.fromEntries([...formData].filter(([, v]) => v !== "")));
  let prizes;
  try {
    prizes = parsePrizes(String(formData.get("prizes") ?? ""));
  } catch {
    redirect(back(id, "", "xeta=mukafat"));
  }
  const regStartAt = baku(formData.get("regStartAt"));
  const regEndAt = baku(formData.get("regEndAt"));
  const startAt = baku(formData.get("startAt"));
  if (!regStartAt || !regEndAt || !startAt || regEndAt < regStartAt) redirect(back(id, "", "xeta=tarix"));
  await db
    .update(contests)
    .set({
      ...p,
      boostThreshold: p.boostThreshold || null,
      boostFirstPrize: p.boostFirstPrize || null,
      finalPlace: p.finalPlace || null,
      regStartAt,
      regEndAt,
      startAt,
      finalAt: baku(formData.get("finalAt")),
      awardsAt: baku(formData.get("awardsAt")),
    })
    .where(eq(contests.id, id));
  await db.delete(contestPrizes).where(eq(contestPrizes.contestId, id));
  if (prizes.length) await db.insert(contestPrizes).values(prizes.map((x) => ({ ...x, contestId: id })));
  revalidatePath("/yaris");
  redirect(back(id, "", "saxlanildi=1"));
}

/* ---------------- Sual şablonları ---------------- */

const templateSchema = z.object({
  topicId: z.coerce.number().int().positive().optional(),
  body: z.string().trim().min(5),
  vars: z.string().trim().min(2),
  condition: z.string().trim().optional(),
  answer: z.string().trim().min(1),
  distractors: z.string().trim().min(1),
  solution: z.string().trim().optional(),
  timeSec: z.coerce.number().int().min(10).max(600),
});

/** Şablon yoxlanılır: hər hərf üçün variant yaranmalıdır (5 fərqli cavab). */
function validTemplate(t: z.infer<typeof templateSchema>) {
  try {
    const input = { body: t.body, vars: JSON.parse(t.vars), condition: t.condition, answer: t.answer, distractors: t.distractors.split("\n").map((x) => x.trim()).filter(Boolean), solution: t.solution };
    return LETTERS.every((l) => makeVariant(input, l) !== null) ? input : null;
  } catch {
    return null;
  }
}

export async function saveTemplateAction(formData: FormData) {
  await requireAdmin();
  const contestId = String(formData.get("contestId"));
  const tid = Number(formData.get("templateId")) || null;
  const p = templateSchema.parse(Object.fromEntries([...formData].filter(([, v]) => v !== "")));
  const input = validTemplate(p);
  if (!input) redirect(back(contestId, "suallar", `xeta=sablon${tid ? `&t=${tid}` : ""}`));
  const values = {
    topicId: p.topicId ?? null,
    body: p.body,
    vars: JSON.stringify(input.vars),
    condition: p.condition || null,
    answer: p.answer,
    distractors: JSON.stringify(input.distractors),
    solution: p.solution ?? "",
    timeSec: p.timeSec,
  };
  if (tid) {
    await db.update(contestTemplates).set(values).where(and(eq(contestTemplates.id, tid), eq(contestTemplates.contestId, contestId)));
  } else {
    const [m] = await db.select({ n: max(contestTemplates.n) }).from(contestTemplates).where(eq(contestTemplates.contestId, contestId));
    await db.insert(contestTemplates).values({ ...values, contestId, n: (m?.n ?? 0) + 1 });
  }
  redirect(back(contestId, "suallar", "saxlanildi=1"));
}

export async function deleteTemplateAction(formData: FormData) {
  await requireAdmin();
  const contestId = String(formData.get("contestId"));
  await db.delete(contestTemplates).where(and(eq(contestTemplates.id, Number(formData.get("templateId"))), eq(contestTemplates.contestId, contestId)));
  redirect(back(contestId, "suallar", "silindi=1"));
}

/* ---------------- Diskvalifikasiya, final, mükafatlar ---------------- */

export async function disqualifyAction(formData: FormData) {
  await requireAdmin();
  const p = z.object({ contestId: z.string(), id: z.string(), reason: z.string().trim().max(300).optional(), undo: z.string().optional() }).parse(Object.fromEntries(formData));
  const dq = p.undo !== "1";
  if (dq && !p.reason) redirect(back(p.contestId, "canli", "xeta=sebeb"));
  const [res] = await db.select().from(contestResults).where(eq(contestResults.registrationId, p.id));
  if (res) {
    await db.update(contestResults).set({ disqualified: dq, dqReason: dq ? p.reason! : null, finalist: dq ? false : res.finalist }).where(eq(contestResults.registrationId, p.id));
  } else {
    await db.insert(contestResults).values({ registrationId: p.id, contestId: p.contestId, score: 0, totalMs: 0, disqualified: dq, dqReason: dq ? p.reason! : null });
  }
  // Nəticələr artıq hesablanıbsa — yerlər yenidən hesablanır (diskvalifikasiya olunan sıradan çıxır)
  const c = await contestById(p.contestId);
  if (c?.resultsComputedAt) await computeResults(p.contestId);
  redirect(back(p.contestId, "canli", "saxlanildi=1"));
}

export async function saveFinalistAction(formData: FormData) {
  await requireAdmin();
  const p = z
    .object({
      contestId: z.string(),
      id: z.string(),
      attended: z.string().optional(),
      finalScore: z.string().optional(),
      prizeMethod: z.enum(["", "parent_account", "cash"]).optional(),
      prizeStatus: z.enum(["", "pending", "paid"]).optional(),
    })
    .parse(Object.fromEntries(formData));
  await db
    .update(contestResults)
    .set({
      finalAttended: p.attended === "on",
      finalScore: p.finalScore ? Number(p.finalScore.replace(",", ".")) : null,
      prizeMethod: p.prizeMethod || null,
      prizeStatus: p.prizeStatus || null,
    })
    .where(eq(contestResults.registrationId, p.id));
  redirect(back(p.contestId, "final", "saxlanildi=1"));
}

/* ---------------- Əməliyyatlar və e-poçtlar ---------------- */

export async function contestOpAction(formData: FormData) {
  await requireAdmin();
  const p = z
    .object({ contestId: z.string(), op: z.enum(["compute", "result_mails", "finalist_mails", "publish_final", "confirm_mails", "reminder_mails"]), tab: z.string().optional() })
    .parse(Object.fromEntries(formData));
  const c = (await contestById(p.contestId))!;
  let n = 0;
  if (p.op === "compute") n = await computeResults(c.id);
  if (p.op === "result_mails") n = await sendResultMails(c.id, true);
  if (p.op === "finalist_mails") {
    await db.update(contests).set({ status: "final" }).where(eq(contests.id, c.id));
    n = await sendFinalistMails(c.id, true);
  }
  if (p.op === "publish_final") n = await publishFinal(c.id, true);
  if (p.op === "confirm_mails" || p.op === "reminder_mails") {
    const regs = await db.select().from(contestRegistrations).where(eq(contestRegistrations.contestId, c.id));
    for (const r of regs) if (await sendContestMail(p.op === "confirm_mails" ? "confirm" : "reminder", c, r, {}, true)) n++;
  }
  revalidatePath("/yaris");
  redirect(back(c.id, p.tab ?? "", `ok=${p.op}&n=${n}`));
}
