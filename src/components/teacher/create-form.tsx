"use client";

import { useMemo, useState } from "react";
import { createTestAction } from "@/lib/teacher/actions";
import { cn } from "@/lib/cn";
import { card, field, label } from "./ui";

type Kind = { key: string; name: string; total: number; durationMin: number; sections: Array<{ format: string; count: number }>; topics: number };
type Group = { id: string; name: string; kind: string; size: number };

const FORMAT: Record<string, string> = { closed: "Qapalı", coded: "Kodlaşdırılan", written: "Yazılı" };

const opt = (on: boolean) =>
  cn(
    "grid cursor-pointer gap-1 rounded-[16px] border-2 bg-white p-4 text-left has-focus-visible:outline-3 has-focus-visible:outline-offset-2 has-focus-visible:outline-[#4f46e5]",
    on ? "border-[#8b5cf6] bg-[#f5f3ff]" : "border-[#e6e9f2] hover:border-[#c7cbe0]",
  );

/** Sınaq yaratmaq: növ → format → qrup, tarix, müddət. Struktur avtomatikdir; suallar yaradılana qədər göstərilmir. */
export function CreateTestForm({ kinds, groups, balance, initialGroup, today }: { kinds: Kind[]; groups: Group[]; balance: number; initialGroup?: string; today: string }) {
  const first = groups.find((g) => g.id === initialGroup) ?? groups[0];
  const [kind, setKind] = useState<string | undefined>(first?.kind ?? kinds[0]?.key);
  const [mode, setMode] = useState<"paper" | "online">("paper");
  const options = useMemo(() => groups.filter((g) => g.kind === kind), [groups, kind]);
  const [groupId, setGroupId] = useState<string | undefined>(first?.kind === kind ? first?.id : options[0]?.id);
  const k = kinds.find((x) => x.key === kind)!;
  const [duration, setDuration] = useState(k?.durationMin ?? 90);
  const group = options.find((g) => g.id === groupId) ?? options[0];
  const cost = mode === "online" ? (group?.size ?? 0) : 0;
  const short = mode === "online" && cost > balance;

  return (
    <form action={createTestAction} className="grid gap-4">
      <section className={card} aria-labelledby="s1">
        <h2 id="s1" className="m-0 mb-1 text-[17px] font-extrabold">
          1. İmtahan növü
        </h2>
        <p className="m-0 mb-3.5 text-[13px] text-[#5b6785]">Sualların sayı, tipləri və mövzuları DİM formatına uyğun avtomatik təyin olunur</p>
        <div role="radiogroup" aria-label="İmtahan növü" className="grid gap-3 md:grid-cols-3">
          {kinds.map((x) => (
            <label key={x.key} className={opt(kind === x.key)}>
              <input
                type="radio"
                name="kind"
                value={x.key}
                checked={kind === x.key}
                onChange={() => {
                  setKind(x.key);
                  setDuration(x.durationMin);
                  setGroupId(groups.find((g) => g.kind === x.key)?.id);
                }}
                className="sr-only"
              />
              <b className="text-[15.5px]">{x.name}</b>
              <small className="text-[#5b6785]">
                {x.total} sual · {x.durationMin} dəq
              </small>
            </label>
          ))}
        </div>
        {k && (
          <div className="mt-3 grid gap-2.5 sm:grid-cols-4">
            {k.sections
              .filter((s) => s.count)
              .map((s) => (
                <div key={s.format} className="rounded-[12px] border border-[#e6e9f2] bg-[#f8fafc] px-3 py-2.5">
                  <small className="font-bold text-[#5b6785]">{FORMAT[s.format]}</small>
                  <br />
                  <b className="text-[20px]">{s.count}</b> sual
                </div>
              ))}
            <div className="rounded-[12px] border border-[#e6e9f2] bg-[#f8fafc] px-3 py-2.5">
              <small className="font-bold text-[#5b6785]">Mövzular</small>
              <br />
              <b className="text-[20px]">{k.topics}</b> mövzu
            </div>
          </div>
        )}
      </section>

      <section className={card} aria-labelledby="s2">
        <h2 id="s2" className="m-0 mb-3 text-[17px] font-extrabold">
          2. Keçirilmə formatı
        </h2>
        <div role="radiogroup" aria-label="Format" className="grid gap-3 md:grid-cols-2">
          <label className={opt(mode === "paper")}>
            <input type="radio" name="mode" value="paper" checked={mode === "paper"} onChange={() => setMode("paper")} className="sr-only" />
            <b className="text-[15.5px]">🖨️ Kağız (əyani dərs)</b>
            <small className="text-[#5b6785]">Sual kitabçası və cavab kartı çap olunur. Kitabçada hər şagirdin adı yazılır.</small>
            <span className="mt-2 text-[18px] font-black text-[#047857]">Pulsuz</span>
          </label>
          <label className={opt(mode === "online")}>
            <input type="radio" name="mode" value="online" checked={mode === "online"} onChange={() => setMode("online")} className="sr-only" />
            <b className="text-[15.5px]">💻 Onlayn</b>
            <small className="text-[#5b6785]">Şagirdlər saytda cavab kartında işləyir. Nəticə və təhlil avtomatik hazırlanır.</small>
            <span className="mt-2 text-[18px] font-black">
              1 ₼ <small className="text-[13px] font-semibold">/ şagird</small>
            </span>
          </label>
        </div>
        <label className="mt-3 flex items-start gap-2.5 text-[14px]">
          <input type="checkbox" name="shuffle" defaultChecked className="mt-0.5 size-[18px] accent-[#8b5cf6]" />
          Hər şagirdə fərqli variant ver (sualların və variantların sırası qarışdırılır)
        </label>
        <label className="mt-2 flex items-start gap-2.5 text-[14px]">
          <input type="checkbox" name="noRepeat" defaultChecked className="mt-0.5 size-[18px] accent-[#8b5cf6]" />
          Bu qrupda əvvəl düşmüş sualları təkrarlama
        </label>
      </section>

      <section className={card} aria-labelledby="s3">
        <h2 id="s3" className="m-0 mb-3 text-[17px] font-extrabold">
          3. Qrup və vaxt
        </h2>
        {options.length === 0 ? (
          <p className="m-0 text-[14px] text-[#5b6785]">Bu imtahan növündə qrupun yoxdur. Əvvəlcə “Qruplarım” bölməsində qrup yarat.</p>
        ) : (
          <div className="grid gap-3 md:grid-cols-4">
            <label className={label}>
              Qrup
              <select name="groupId" value={group?.id} onChange={(e) => setGroupId(e.target.value)} className={field}>
                {options.map((g) => (
                  <option key={g.id} value={g.id}>
                    {g.name} ({g.size})
                  </option>
                ))}
              </select>
            </label>
            <label className={label}>
              Tarix
              <input name="date" type="date" required defaultValue={today} className={field} />
            </label>
            <label className={label}>
              {mode === "online" ? "Açılma saatı" : "Saat"}
              <input name="time" type="time" defaultValue="09:00" className={field} />
            </label>
            <label className={label}>
              Müddət (dəq)
              <input name="durationMin" type="number" min={10} max={300} value={duration} onChange={(e) => setDuration(Number(e.target.value))} className={field} />
            </label>
          </div>
        )}
        <p className="m-0 mt-3 rounded-[12px] bg-[#eef0ff] px-3.5 py-2.5 text-[13.5px] font-semibold text-[#3730a3]">
          🔒 Sınaq yaradılana qədər suallar sənə göstərilmir. Kitabça yalnız çap üçün açılır, cavab açarı isə ayrıca vərəqdə verilir.
          {mode === "online" && " Onlayn sınaq açılandan 24 saat əlçatandır; başlamayan şagirdlərin məbləği balansa qaytarılır."}
        </p>
      </section>

      <div className="flex flex-wrap items-center justify-between gap-3 rounded-[16px] bg-[#0f1b3d] px-[18px] py-4 text-white">
        <div>
          <small className="text-white/80">Yekun</small>
          <br />
          <b className="text-[20px]">
            {k?.name} · {k?.total} sual · {group?.size ?? 0} şagird · {mode === "online" ? `${cost} ₼ (${group?.size ?? 0} × 1 ₼)` : "Pulsuz"}
          </b>
          {short && <p className="m-0 mt-1 text-[13px] font-semibold text-[#fca5a5]">Balans kifayət etmir ({balance.toFixed(2)} ₼). Əvvəlcə balansı artır.</p>}
        </div>
        <button
          disabled={!group || short || (group?.size ?? 0) === 0}
          className="inline-flex min-h-11 cursor-pointer items-center rounded-[12px] bg-white px-4 font-bold text-[#0f1b3d] disabled:cursor-not-allowed disabled:opacity-60"
        >
          Sınağı yarat →
        </button>
      </div>
    </form>
  );
}
