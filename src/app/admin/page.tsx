import type { Metadata } from "next";
import { last30Days, overview } from "@/lib/admin/queries";
import { Bars, PageHead, Panel, Stat, azn } from "./ui";

export const metadata: Metadata = { title: "Ümumi baxış" };

const FORMAT: Record<string, string> = { closed: "Qapalı", open: "Açıq", matching: "Uyğunluq", written: "Yazılı" };

export default async function AdminHome() {
  const o = await overview();
  const days = last30Days(o.registrations);
  return (
    <>
      <PageHead title="Ümumi baxış" lead="İstifadəçilər, abunələr, qazanc və məzmun bir yerdə." />
      <div className="grid grid-cols-2 gap-3 lg:grid-cols-4">
        <Stat tone="navy" label="İstifadəçilər" value={o.users} hint={`Son 7 gün: +${o.new7} · 30 gün: +${o.new30}`} />
        <Stat label="Aktiv (7 gün)" value={o.active7} hint={`${o.answers7} cavab`} />
        <Stat label="Aktiv abunələr" value={o.subs.total} hint={`Pro ${o.subs.pro} · Premium ${o.subs.premium} · illik ${o.subs.yearly}`} />
        <Stat label="Qazanc (cəmi)" value={azn(o.revenue.total)} hint={`Son 30 gün: ${azn(o.revenue.last30)}`} />
      </div>
      <div className="grid gap-4 lg:grid-cols-2">
        <Panel title="Qeydiyyatlar (son 30 gün)">
          <Bars data={days} label="Gündəlik qeydiyyatlar" />
        </Panel>
        <Panel title="Qazanc (aylar üzrə)">
          <Bars data={[...o.revenue.byMonth].reverse().map((m) => ({ k: m.month.slice(2), v: Number(m.s ?? 0) }))} label="Aylıq qazanc" />
        </Panel>
        <Panel title="Sual bankı">
          <ul className="m-0 grid list-none grid-cols-2 gap-2 p-0">
            {Object.entries(FORMAT).map(([k, label]) => (
              <li key={k} className="rounded-md bg-navy-050 px-3 py-2">
                <span className="text-[13px] text-ink-muted">{label}</span>
                <b className="block text-[20px] tabular">{o.questions[k] ?? 0}</b>
              </li>
            ))}
          </ul>
          <p className="m-0 text-small text-ink-muted">Dərc olunmuş sınaqlar: {o.exams}</p>
        </Panel>
        <Panel title="Qazanc növləri">
          <ul className="m-0 grid list-none gap-2 p-0">
            {o.revenue.byKind.map((k) => (
              <li key={k.kind} className="flex justify-between rounded-md bg-navy-050 px-3 py-2">
                <span>{k.kind === "exam" ? "Tək sınaq" : "Abunə"}</span>
                <b className="tabular">
                  {azn(Number(k.s ?? 0))} · {k.n} ödəniş
                </b>
              </li>
            ))}
            {!o.revenue.byKind.length && <li className="text-small text-ink-muted">Hələ ödəniş yoxdur.</li>}
          </ul>
          <p className="m-0 text-small text-ink-muted">Ləğv edilmiş, amma dövrü bitməmiş abunələr: {o.subs.canceled}</p>
        </Panel>
      </div>
    </>
  );
}
