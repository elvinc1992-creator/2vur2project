"use client";

import Image from "next/image";
import { useRouter } from "next/navigation";
import { useEffect, useRef, useState, useTransition } from "react";
import { MathText } from "@/components/ui/math-text";
import { answerContestAction, logContestEventAction } from "@/lib/contest/actions";
import { cn } from "@/lib/cn";

type Q = { n: number; total: number; text: string; imageUrl?: string | null; imageAlt?: string | null; options: Record<string, string>; deadline: number; timeSec: number };

/**
 * Onlayn tur: suallar bir-bir, hər sualın öz sayğacı (server vaxtı ilə, dayanmır). Vaxt bitəndə səhifə yenilənir —
 * server sualı cavabsız sayıb növbətini göstərir. Mətn seçmək, kopyalamaq və sağ klik bağlıdır; tab dəyişmə və
 * pəncərədən çıxma jurnala yazılır və xəbərdarlıq göstərilir.
 */
export function TourRunner({ contestId, q, serverNow }: { contestId: string; q: Q; serverNow: number }) {
  const router = useRouter();
  const offset = useRef<number | null>(null);
  const [left, setLeft] = useState(q.deadline - serverNow);
  const [chosen, setChosen] = useState<string | null>(null);
  const [warn, setWarn] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [pending, start] = useTransition();
  const expired = useRef(false);

  useEffect(() => {
    offset.current ??= serverNow - Date.now();
    const tick = () => {
      const l = q.deadline - (Date.now() + offset.current!);
      setLeft(l);
      if (l <= 0 && !expired.current) {
        expired.current = true;
        router.refresh();
      }
    };
    tick();
    const id = setInterval(tick, 250);
    return () => clearInterval(id);
  }, [q.deadline, serverNow, router]);

  // Hadisə jurnalı və kopyalama qadağası
  useEffect(() => {
    const log = (kind: string, message?: string) => {
      void logContestEventAction(contestId, kind, q.n);
      if (message) setWarn(message);
    };
    const onVis = () => document.visibilityState === "hidden" && log("tab_hidden", "Tabı dəyişdin — bu, jurnala yazıldı. Yarış səhifəsində qal.");
    const onBlur = () => log("window_blur", "Pəncərədən çıxdın — bu, jurnala yazıldı.");
    const onOffline = () => log("offline", "İnternet bağlantısı kəsildi. Vaxt sayğacı dayanmır.");
    const onOnline = () => log("online");
    const block = (kind: string) => (e: Event) => {
      e.preventDefault();
      log(kind, "Kopyalamaq və sağ klik yarışda bağlıdır.");
    };
    const onCopy = block("copy");
    const onMenu = block("context_menu");
    document.addEventListener("visibilitychange", onVis);
    window.addEventListener("blur", onBlur);
    window.addEventListener("offline", onOffline);
    window.addEventListener("online", onOnline);
    document.addEventListener("copy", onCopy);
    document.addEventListener("cut", onCopy);
    document.addEventListener("contextmenu", onMenu);
    return () => {
      document.removeEventListener("visibilitychange", onVis);
      window.removeEventListener("blur", onBlur);
      window.removeEventListener("offline", onOffline);
      window.removeEventListener("online", onOnline);
      document.removeEventListener("copy", onCopy);
      document.removeEventListener("cut", onCopy);
      document.removeEventListener("contextmenu", onMenu);
    };
  }, [contestId, q.n]);

  const submit = () =>
    chosen &&
    start(async () => {
      const r = await answerContestAction(contestId, q.n, chosen);
      if (!r.ok) setError("Cavab qəbul olunmadı — sualın vaxtı bitmiş ola bilər.");
      router.refresh();
    });

  const s = Math.max(0, Math.ceil(left / 1000));
  const pct = Math.max(0, Math.min(100, (left / (q.timeSec * 1000)) * 100));
  const low = s <= 10;

  return (
    <div className="grid gap-4 select-none" onDragStart={(e) => e.preventDefault()}>
      <div className="flex flex-wrap items-center justify-between gap-3">
        <span className="rounded-full bg-[#eef0ff] px-3 py-1 text-[13px] font-extrabold text-[#4f46e5]">
          Sual {q.n} / {q.total}
        </span>
        <span
          role="timer"
          aria-live={low ? "assertive" : "off"}
          aria-label={`Bu sual üçün qalan vaxt: ${s} saniyə`}
          className={cn("rounded-[12px] px-3 py-1.5 font-mono text-[20px] font-bold tabular-nums", low ? "bg-[#fef2f2] text-[#b91c1c]" : "bg-white text-[#0f1b3d]")}
        >
          {String(Math.floor(s / 60)).padStart(2, "0")}:{String(s % 60).padStart(2, "0")}
        </span>
      </div>
      <div aria-hidden="true" className="h-2 overflow-hidden rounded-full bg-[#e6e9f2]">
        <i className={cn("block h-full rounded-full transition-[width] duration-200", low ? "bg-[#ef4444]" : "bg-[linear-gradient(90deg,#6366f1,#ec4899)]")} style={{ width: `${pct}%` }} />
      </div>

      {warn && (
        <p role="alert" className="m-0 flex items-start justify-between gap-3 rounded-[14px] border border-[#fecaca] bg-[#fef2f2] px-4 py-3 text-[14px] font-semibold text-[#991b1b]">
          ⚠️ {warn}
          <button type="button" onClick={() => setWarn(null)} className="cursor-pointer font-bold underline">
            Bağla
          </button>
        </p>
      )}

      <section aria-labelledby="tq" className="rounded-[22px] border border-[#e6e9f2] bg-white p-5 sm:p-6">
        <h2 id="tq" className="sr-only">Sual {q.n}</h2>
        <p className="m-0 text-[18px] leading-[1.6] text-[#0f1b3d]">
          <MathText text={q.text} />
        </p>
        {q.imageUrl && (
          <Image
            src={q.imageUrl}
            alt={q.imageAlt ?? ""}
            width={520}
            height={360}
            draggable={false}
            className="mt-3 h-auto max-h-[300px] w-auto max-w-full rounded-md border border-[#e6e9f2] bg-white object-contain p-2"
          />
        )}
      </section>

      <fieldset className="m-0 grid min-w-0 gap-2.5 border-0 p-0 sm:grid-cols-2" disabled={pending || left <= 0}>
        <legend className="sr-only">Cavab variantları</legend>
        {Object.entries(q.options).map(([l, v]) => (
          <label
            key={l}
            className={cn(
              "flex min-h-14 cursor-pointer items-center gap-3 rounded-[14px] border-2 bg-white px-4 py-2 text-[17px] font-semibold",
              "has-focus-visible:outline-3 has-focus-visible:outline-offset-2 has-focus-visible:outline-[#4f46e5]",
              chosen === l ? "border-[#8b5cf6] bg-[#f5f3ff]" : "border-[#e6e9f2] hover:border-[#c4b5fd]",
            )}
          >
            <input type="radio" name="answer" value={l} checked={chosen === l} onChange={() => setChosen(l)} className="sr-only" aria-label={`Variant ${l}: ${v.replace(/\$/g, "")}`} />
            <span aria-hidden="true" className={cn("grid size-9 flex-none place-items-center rounded-[10px] font-black", chosen === l ? "bg-[#8b5cf6] text-white" : "bg-[#eef0ff] text-[#4f46e5]")}>
              {l}
            </span>
            <span aria-hidden="true">
              <MathText text={v} />
            </span>
          </label>
        ))}
      </fieldset>

      {error && (
        <p role="alert" className="m-0 text-[14px] font-semibold text-[#b91c1c]">
          {error}
        </p>
      )}
      <button
        type="button"
        onClick={submit}
        aria-disabled={!chosen || pending || undefined}
        className={cn(
          "min-h-[52px] cursor-pointer rounded-[14px] px-5 font-extrabold",
          chosen ? "bg-[linear-gradient(135deg,#6366f1,#8b5cf6_55%,#ec4899)] text-white" : "bg-[#e0e7ff] text-[#3730a3]",
        )}
      >
        {pending ? "Göndərilir…" : q.n < q.total ? "Cavabı təsdiqlə və növbəti suala keç →" : "Cavabı təsdiqlə və turu bitir"}
      </button>
      <p className="m-0 text-center text-[13px] text-[#5b6785]">Təsdiqləyəndən sonra bu suala qayıtmaq olmur. Vaxt bitəndə sual cavabsız sayılır.</p>
    </div>
  );
}
