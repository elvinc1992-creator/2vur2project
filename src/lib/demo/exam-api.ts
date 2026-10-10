// Klient: /api/exam/[id] çağırışları (Route Handler).
import type { TickResult } from "./exam-session";

type Body =
  | { op: "tick" }
  | { op: "pause" }
  | { op: "save"; n: number; value: string; ms?: number }
  | { op: "flag"; n: number }
  | { op: "timeout" };

// Sorğular növbə ilə gedir ki, cavablar serverə göndərildiyi ardıcıllıqla yazılsın
// (paralel yazılardan server özü də qorunur — bax: updateDemoState).
let queue: Promise<unknown> = Promise.resolve();

function call<T>(id: string, body: Body): Promise<T> {
  const run = async () => {
    const res = await fetch(`/api/exam/${id}`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(body),
      keepalive: body.op === "pause",
    });
    if (!res.ok) throw new Error(`exam api ${res.status}`);
    return res.json() as Promise<T>;
  };
  const next = queue.then(run, run);
  queue = next.catch(() => {});
  return next;
}

export const examApi = {
  tick: (id: string) => call<TickResult | null>(id, { op: "tick" }),
  pause: (id: string) => call<TickResult | null>(id, { op: "pause" }),
  /** ms — suala indiyədək sərf olunan ümumi vaxt (zəif mövzuların təhlili üçün). */
  save: (id: string, n: number, value: string, ms?: number) =>
    call<{ ok: boolean; expired?: boolean; answered?: number }>(id, { op: "save", n, value, ms }),
  flag: (id: string, n: number) => call<{ ok: boolean }>(id, { op: "flag", n }),
  timeout: (id: string) => call<{ answered: number }>(id, { op: "timeout" }),
  /** Vərəq bağlananda: brauzer sorğunu səhifə getdikdən sonra da göndərir. */
  beaconPause: (id: string) =>
    navigator.sendBeacon(`/api/exam/${id}`, new Blob([JSON.stringify({ op: "pause" })], { type: "application/json" })),
};
