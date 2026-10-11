import { and, eq } from "drizzle-orm";
import { z } from "zod";
import { auth } from "@/auth";
import { db } from "@/db";
import { CONTEST_EVENT_KINDS, teacherTestAnswers, teacherTestEvents, teacherTests } from "@/db/schema";
import { isPassive } from "@/lib/auth/account";
import { itemsOf } from "@/lib/teacher/data";
import { attemptOf, deadlineOf, finishAttempt, gradeOne, variantOf } from "@/lib/teacher/online";

// Onlayn müəllim sınağı — cavab kartının API-si (mövcud sınaq interfeysi ilə eyni əməliyyatlar).
// Fərq: vaxt dayanmır ("pause" sayğacı saxlamır), cavab şagirdin variantına görə orijinal suala çevrilib yazılır.

const n = z.number().int().min(1).max(200);
const body = z.discriminatedUnion("op", [
  z.object({ op: z.literal("tick") }),
  z.object({ op: z.literal("pause") }),
  z.object({ op: z.literal("save"), n, value: z.string().max(2000), ms: z.number().int().min(0).optional() }),
  z.object({ op: z.literal("flag"), n }),
  z.object({ op: z.literal("timeout") }),
  z.object({ op: z.literal("finish") }),
  z.object({ op: z.literal("event"), kind: z.enum(CONTEST_EVENT_KINDS) }),
]);

export async function POST(req: Request, ctx: RouteContext<"/api/muellim-sinaq/[id]">) {
  const origin = req.headers.get("origin");
  if (origin && new URL(origin).host !== req.headers.get("host")) return Response.json({ error: "origin" }, { status: 403 });
  const session = await auth();
  if (!session?.user?.id || (await isPassive(session.user.id))) return Response.json({ error: "auth" }, { status: 401 });
  const parsed = body.safeParse(await req.json().catch(() => null));
  if (!parsed.success) return Response.json({ error: "input" }, { status: 400 });

  const { id } = await ctx.params;
  const uid = session.user.id;
  const [t] = await db.select().from(teacherTests).where(and(eq(teacherTests.id, id), eq(teacherTests.mode, "online")));
  const [v, a] = t ? await Promise.all([variantOf(t.id, uid), attemptOf(t.id, uid)]) : [null, null];
  if (!t || !v || !a) return Response.json({ error: "test" }, { status: 404 });

  const now = Date.now();
  const deadline = deadlineOf(t, a.startedAt);
  const answeredCount = async () =>
    (await db.select({ n: teacherTestAnswers.n }).from(teacherTestAnswers).where(and(eq(teacherTestAnswers.testId, t.id), eq(teacherTestAnswers.userId, uid)))).length;
  const expire = async () => {
    await finishAttempt(t, uid, Math.min(now, deadline));
    return { expired: true as const, answered: await answeredCount() };
  };
  const cmd = parsed.data;
  if (a.finishedAt && cmd.op !== "event") return Response.json({ expired: true, answered: await answeredCount() });

  switch (cmd.op) {
    case "tick":
    case "pause":
      return Response.json(now >= deadline ? await expire() : { expired: false, remaining: deadline - now });
    case "save": {
      if (now >= deadline) return Response.json({ ok: false, ...(await expire()) });
      const base = v.order[cmd.n - 1];
      const item = (await itemsOf(t.id)).find((x) => x.n === base);
      if (!item) return Response.json({ ok: false });
      const g = gradeOne(item, v, cmd.value.trim());
      if (g.given === null) {
        await db.delete(teacherTestAnswers).where(and(eq(teacherTestAnswers.testId, t.id), eq(teacherTestAnswers.userId, uid), eq(teacherTestAnswers.n, base)));
      } else {
        await db
          .insert(teacherTestAnswers)
          .values({ testId: t.id, userId: uid, n: base, given: g.given, score: g.score, updatedAt: new Date(now) })
          .onConflictDoUpdate({
            target: [teacherTestAnswers.testId, teacherTestAnswers.userId, teacherTestAnswers.n],
            set: { given: g.given, score: g.score, updatedAt: new Date(now) },
          });
      }
      return Response.json({ ok: true });
    }
    case "flag":
      return Response.json({ ok: true });
    case "timeout":
    case "finish":
      return Response.json(await expire());
    case "event":
      if (!a.finishedAt) await db.insert(teacherTestEvents).values({ testId: t.id, userId: uid, kind: cmd.kind, at: new Date(now) });
      return Response.json({ ok: true });
  }
}
