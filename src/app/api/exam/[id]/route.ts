import { z } from "zod";
import { auth } from "@/auth";
import { EXAM_QUESTIONS } from "@/lib/demo/content";
import { finalizeAttempt, pauseAttempt, saveAnswer, tickAttempt, toggleFlag } from "@/lib/demo/exam-session";
import { updateDemoState } from "@/lib/demo/state";
import { afterExamFinished } from "@/lib/weak/hooks";

// Sınaq prosesinin tez-tez çağırılan əməliyyatları (siqnal, fasilə, cavab, işarə, vaxt bitdi).
// Route Handler — server action kimi bütün səhifəni yenidən render etmir; sendBeacon da buraya göndərir.

const body = z.discriminatedUnion("op", [
  z.object({ op: z.literal("tick") }),
  z.object({ op: z.literal("pause") }),
  z.object({
    op: z.literal("save"),
    n: z.number().int().min(1).max(EXAM_QUESTIONS.length),
    value: z.string().max(8),
    ms: z.number().int().min(0).max(6 * 3_600_000).optional(),
  }),
  z.object({ op: z.literal("flag"), n: z.number().int().min(1).max(EXAM_QUESTIONS.length) }),
  z.object({ op: z.literal("timeout") }),
]);

export async function POST(req: Request, ctx: RouteContext<"/api/exam/[id]">) {
  // Başqa saytdan sorğu olmasın (server action-lardakı yoxlama kimi).
  const origin = req.headers.get("origin");
  if (origin && new URL(origin).host !== req.headers.get("host")) return Response.json({ error: "origin" }, { status: 403 });

  const session = await auth();
  if (!session?.user?.id) return Response.json({ error: "auth" }, { status: 401 });
  const parsed = body.safeParse(await req.json().catch(() => null));
  if (!parsed.success) return Response.json({ error: "input" }, { status: 400 });

  const { id } = await ctx.params;
  const cmd = parsed.data;
  const result = await updateDemoState(session.user.id, (state) => {
    switch (cmd.op) {
      case "tick":
        return tickAttempt(state, id);
      case "pause":
        return pauseAttempt(state, id);
      case "save":
        return saveAnswer(state, id, cmd.n, cmd.value, Date.now(), cmd.ms);
      case "flag":
        return { ok: toggleFlag(state, id, cmd.n) };
      case "timeout":
        return { answered: state.attempts[id] ? finalizeAttempt(state, id, true) : Object.keys(state.results[id]?.answers ?? {}).length };
    }
  });
  // Vaxt bitib sınaq bağlandı — zəif mövzular yenilənir.
  const r = result as { expired?: boolean } | null;
  if (cmd.op === "timeout" || r?.expired) await afterExamFinished(session.user.id);
  return Response.json(result ?? null);
}
