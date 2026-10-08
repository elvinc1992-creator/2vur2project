import { z } from "zod";
import { auth } from "@/auth";
import { EXAM_QUESTIONS } from "@/lib/demo/content";
import { finalizeAttempt, pauseAttempt, saveAnswer, tickAttempt, toggleFlag } from "@/lib/demo/exam-session";
import { getDemoState, saveDemoState } from "@/lib/demo/state";

// Sınaq prosesinin tez-tez çağırılan əməliyyatları (siqnal, fasilə, cavab, işarə, vaxt bitdi).
// Route Handler — server action kimi bütün səhifəni yenidən render etmir; sendBeacon da buraya göndərir.

const body = z.discriminatedUnion("op", [
  z.object({ op: z.literal("tick") }),
  z.object({ op: z.literal("pause") }),
  z.object({ op: z.literal("save"), n: z.number().int().min(1).max(EXAM_QUESTIONS.length), value: z.string().max(8) }),
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
  const state = await getDemoState(session.user.id);
  const cmd = parsed.data;
  let result: unknown;
  switch (cmd.op) {
    case "tick":
      result = tickAttempt(state, id);
      break;
    case "pause":
      result = pauseAttempt(state, id);
      break;
    case "save":
      result = saveAnswer(state, id, cmd.n, cmd.value);
      break;
    case "flag":
      result = { ok: toggleFlag(state, id, cmd.n) };
      break;
    case "timeout":
      result = { answered: state.attempts[id] ? finalizeAttempt(state, id, true) : Object.keys(state.results[id]?.answers ?? {}).length };
      break;
  }
  await saveDemoState(state);
  return Response.json(result ?? null);
}
