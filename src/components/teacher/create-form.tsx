"use client";

import { useState } from "react";
import { createTestAction } from "@/lib/teacher/actions";
import { cn } from "@/lib/cn";
import { card, field, label } from "./ui";

type Kind = { key: string; name: string; total: number; durationMin: number; price: number; paperPrice: number; sections: Array<{ format: string; count: number }>; topics: number };
type Group = { id: string; name: string; members: string[] };
type Topic = { id: number; name: string; used: boolean };

const FORMAT: Record<string, string> = { closed: "Qapalı", coded: "Kodlaşdırılan", written: "Yazılı" };
const TOPIC_COUNTS = [15, 20, 25];
const TOPIC_DURATION: Record<number, number> = { 15: 30, 20: 40, 25: 50 };

const opt = (on: boolean) =>
  cn(
    "grid cursor-pointer gap-1 rounded-[16px] border-2 bg-white p-4 text-left has-focus-visible:outline-3 has-focus-visible:outline-offset-2 has-focus-visible:outline-[#4f46e5]",
    on ? "border-[#8b5cf6] bg-[#f5f3ff]" : "border-[#e6e9f2] hover:border-[#c7cbe0]",
  );
const azn = (v: number) => `${v.toFixed(2).replace(/\.00$/, "")} ₼`;

/**
 * Sınaq yaratmaq: növ (mövzu sınağı — mövzu və 15 / 20 / 25 sual) → format → qruplar (bir və ya bir neçə), tarix, müddət.
 * Struktur avtomatikdir; suallar yaradılana qədər göstərilmir. Onlayn sınağın qiyməti sınaq başınadır.
 */
export function CreateTestForm({
  kinds,
  groups,
  topics,
  yearLabel,
  balance,
  initialGroup,
  today,
}: {
  kinds: Kind[];
  groups: Group[];
  topics: Topic[];
  yearLabel: string;
  balance: number;
  initialGroup?: string;
  today: string;
}) {
  const [kind, setKind] = useState(kinds.find((k) => k.key !== "movzu")?.key ?? kinds[0]?.key);
  const [mode, setMode] = useState<"paper" | "online">("paper");
  const [selected, setSelected] = useState<string[]>(groups.some((g) => g.id === initialGroup) ? [initialGroup!] : groups[0] ? [groups[0].id] : []);
  const [topicId, setTopicId] = useState<number | undefined>(topics.find((t) => !t.used)?.id);
  const [count, setCount] = useState(20);
  const k = kinds.find((x) => x.key === kind)!;
  const isTopic = kind === "movzu";
  const [duration, setDuration] = useState(k?.durationMin ?? 90);
  const students = new Set(groups.filter((g) => selected.includes(g.id)).flatMap((g) => g.members)).size;
  const cost = (mode === "online" ? k?.price : k?.paperPrice) ?? 0;
  const short = cost > balance;
  const total = isTopic ? count : (k?.total ?? 0);
  const topic = topics.find((t) => t.id === topicId);
  const blocked = !selected.length || students === 0 || short || (isTopic && (!topic || topic.used));

  const toggle = (id: string) => setSelected((s) => (s.includes(id) ? s.filter((x) => x !== id) : [...s, id]));

  return (
    <form action={createTestAction} className="grid gap-4">
      <section className={card} aria-labelledby="s1">
        <h2 id="s1" className="m-0 mb-1 text-[17px] font-extrabold">
          1. İmtahan növü
        </h2>
        <p className="m-0 mb-3.5 text-[13px] text-[#5b6785]">Sualların sayı, tipləri və mövzuları DİM formatına uyğun avtomatik təyin olunur</p>
        <div role="radiogroup" aria-label="İmtahan növü" className="grid gap-3 sm:grid-cols-2 xl:grid-cols-4">
          {kinds.map((x) => (
            <label key={x.key} className={opt(kind === x.key)}>
              <input
                type="radio"
                name="kind"
                value={x.key}
                checked={kind === x.key}
                onChange={() => {
                  setKind(x.key);
                  setDuration(x.key === "movzu" ? TOPIC_DURATION[count] : x.durationMin);
                }}
                className="sr-only"
              />
              <b className="text-[15.5px]">{x.name}</b>
              <small className="text-[#5b6785]">{x.key === "movzu" ? "1 mövzu · 15 / 20 / 25 sual" : `${x.total} sual · ${x.durationMin} dəq`}</small>
            </label>
          ))}
        </div>
        {isTopic ? (
          <div className="mt-3 grid gap-3 md:grid-cols-[2fr_1fr]">
            <label className={label}>
              Mövzu
              <select name="topicId" value={topicId ?? ""} onChange={(e) => setTopicId(Number(e.target.value))} className={field}>
                {topics.map((t) => (
                  <option key={t.id} value={t.id} disabled={t.used}>
                    {t.name}
                    {t.used ? " — bu tədris ilində yaradılıb" : ""}
                  </option>
                ))}
              </select>
            </label>
            <fieldset className="m-0 grid gap-1.5 border-0 p-0">
              <legend className="mb-1.5 text-[13px] font-bold text-[#5b6785]">Sual sayı</legend>
              <div className="flex gap-2">
                {TOPIC_COUNTS.map((c) => (
                  <label key={c} className={cn(opt(count === c), "min-w-16 place-items-center px-3 py-2.5")}>
                    <input
                      type="radio"
                      name="questionCount"
                      value={c}
                      checked={count === c}
                      onChange={() => {
                        setCount(c);
                        setDuration(TOPIC_DURATION[c]);
                      }}
                      className="sr-only"
                    />
                    <b className="text-[17px]">{c}</b>
                  </label>
                ))}
              </div>
            </fieldset>
            <p className="m-0 rounded-[12px] bg-[#fff7ed] px-3.5 py-2.5 text-[13px] font-semibold text-[#9a3412] md:col-span-2">
              Hər mövzu üzrə mövzu sınağını tədris ilində ({yearLabel}, 1 sentyabr – 1 iyul) yalnız bir dəfə yaratmaq olar.
            </p>
          </div>
        ) : (
          k && (
            <div className="mt-3 grid gap-2.5 grid-cols-2 sm:grid-cols-4">
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
          )
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
            <span className="mt-2 text-[18px] font-black">
              {azn(k?.paperPrice ?? 0)} <small className="text-[13px] font-semibold">/ sınaq (şagird sayından asılı deyil)</small>
            </span>
          </label>
          <label className={opt(mode === "online")}>
            <input type="radio" name="mode" value="online" checked={mode === "online"} onChange={() => setMode("online")} className="sr-only" />
            <b className="text-[15.5px]">💻 Onlayn</b>
            <small className="text-[#5b6785]">Şagirdlər saytda cavab kartında işləyir. Nəticə və təhlil avtomatik hazırlanır.</small>
            <span className="mt-2 text-[18px] font-black">
              {azn(k?.price ?? 0)} <small className="text-[13px] font-semibold">/ sınaq (şagird sayından asılı deyil)</small>
            </span>
          </label>
        </div>
        <label className="mt-3 flex items-start gap-2.5 text-[14px]">
          <input type="checkbox" name="shuffle" defaultChecked className="mt-0.5 size-[18px] accent-[#8b5cf6]" />
          Hər şagirdə fərqli variant ver (sualların və variantların sırası qarışdırılır)
        </label>
        <label className="mt-2 flex items-start gap-2.5 text-[14px]">
          <input type="checkbox" name="noRepeat" defaultChecked className="mt-0.5 size-[18px] accent-[#8b5cf6]" />
          Seçilmiş qruplarda əvvəl düşmüş sualları təkrarlama
        </label>
      </section>

      <section className={card} aria-labelledby="s3">
        <h2 id="s3" className="m-0 mb-3 text-[17px] font-extrabold">
          3. Qruplar və vaxt
        </h2>
        {groups.length === 0 ? (
          <p className="m-0 text-[14px] text-[#5b6785]">Hələ qrupun yoxdur. Əvvəlcə “Qruplarım” bölməsində qrup yarat.</p>
        ) : (
          <>
            <fieldset className="m-0 mb-3 border-0 p-0">
              <legend className="mb-2 text-[13px] font-bold text-[#5b6785]">Sınaq hansı qrup(lar) üçündür — bir və ya bir neçəsini seç</legend>
              <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-3">
                {groups.map((g) => (
                  <label key={g.id} className={cn(opt(selected.includes(g.id)), "flex items-center gap-2.5 px-3.5 py-3")}>
                    <input type="checkbox" name="groupId" value={g.id} checked={selected.includes(g.id)} onChange={() => toggle(g.id)} className="size-[18px] accent-[#8b5cf6]" />
                    <span className="font-bold">{g.name}</span>
                    <small className="ml-auto text-[#5b6785]">{g.members.length} şagird</small>
                  </label>
                ))}
              </div>
            </fieldset>
            <div className="grid gap-3 sm:grid-cols-3">
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
          </>
        )}
        <p className="m-0 mt-3 rounded-[12px] bg-[#eef0ff] px-3.5 py-2.5 text-[13.5px] font-semibold text-[#3730a3]">
          🔒 Sınaq yaradılana qədər suallar sənə göstərilmir. Kitabça yalnız çap üçün açılır, cavab açarı isə ayrıca vərəqdə verilir.
          {mode === "online" && " Onlayn sınaq açılandan 24 saat əlçatandır; heç bir şagird başlamasa, məbləğ balansa qaytarılır."}
        </p>
      </section>

      <div className="flex flex-wrap items-center justify-between gap-3 rounded-[16px] bg-[#0f1b3d] px-[18px] py-4 text-white">
        <div className="min-w-0">
          <small className="text-white/80">Yekun</small>
          <br />
          <b className="text-[18px] sm:text-[20px]">
            {isTopic ? `Mövzu sınağı${topic ? `: ${topic.name}` : ""}` : k?.name} · {total} sual · {students} şagird · {azn(cost)}
          </b>
          {short && <p className="m-0 mt-1 text-[13px] font-semibold text-[#fca5a5]">Balans kifayət etmir ({balance.toFixed(2)} ₼). Əvvəlcə balansı artır.</p>}
        </div>
        <button
          disabled={blocked}
          className="inline-flex min-h-11 cursor-pointer items-center rounded-[12px] bg-white px-4 font-bold text-[#0f1b3d] disabled:cursor-not-allowed disabled:opacity-60"
        >
          Sınağı yarat →
        </button>
      </div>
    </form>
  );
}
