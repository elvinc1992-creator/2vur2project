"use client";

import { useEffect } from "react";
import { ExamRunner, type RunnerClient } from "@/app/(focus)/sinaq/[id]/exam-runner";
import type { TickResult } from "@/lib/demo/exam-session";
import type { ExamMeta, ExamQuestion } from "@/lib/exams/types";

// Müəllimin onlayn sınağı — saytın mövcud cavab kartı interfeysi (ExamRunner) öz API-si ilə:
// vaxt serverdə gedir və dayanmır, yazılı cavabın mətni saxlanılır, tab dəyişmə jurnala yazılır.

let queue: Promise<unknown> = Promise.resolve();
function call<T>(id: string, body: object): Promise<T> {
  const run = async () => {
    const res = await fetch(`/api/muellim-sinaq/${id}`, { method: "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify(body) });
    if (!res.ok) throw new Error(`api ${res.status}`);
    return res.json() as Promise<T>;
  };
  const next = queue.then(run, run);
  queue = next.catch(() => {});
  return next;
}

const event = (id: string, kind: string) =>
  navigator.sendBeacon(`/api/muellim-sinaq/${id}`, new Blob([JSON.stringify({ op: "event", kind })], { type: "application/json" }));

const CLIENT: RunnerClient = {
  tick: (id) => call<TickResult | null>(id, { op: "tick" }),
  pause: (id) => call<TickResult | null>(id, { op: "pause" }),
  save: (id, n, value, ms) => call(id, { op: "save", n, value, ms }),
  flag: (id, n) => call(id, { op: "flag", n }),
  timeout: (id) => call(id, { op: "timeout" }),
  beaconPause: () => true,
  finish: (id) => call(id, { op: "finish" }),
  resultHref: (id) => `/muellim-sinaq/${id}`,
  writtenText: true,
  onHidden: (id) => event(id, "tab_hidden"),
  reportSource: "teacher",
};

type Props = {
  exam: ExamMeta;
  questions: ExamQuestion[];
  initialAnswers: Record<string, string>;
  remaining: number;
  studentName: string;
  today: string;
};

export function OnlineTestRunner(props: Props) {
  const id = props.exam.id;
  // Pəncərədən çıxma, bağlantı, kopyalama — jurnala (diskvalifikasiya üçün avtomatik səbəb deyil).
  useEffect(() => {
    const blur = () => event(id, "window_blur");
    const off = () => event(id, "offline");
    const on = () => event(id, "online");
    const copy = (e: Event) => {
      e.preventDefault();
      event(id, "copy");
    };
    window.addEventListener("blur", blur);
    window.addEventListener("offline", off);
    window.addEventListener("online", on);
    document.addEventListener("copy", copy);
    return () => {
      window.removeEventListener("blur", blur);
      window.removeEventListener("offline", off);
      window.removeEventListener("online", on);
      document.removeEventListener("copy", copy);
    };
  }, [id]);
  return <ExamRunner {...props} initialFlags={[]} client={CLIENT} />;
}
