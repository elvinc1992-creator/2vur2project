import type { ReportData } from "@/lib/teacher/actions";
import { brand, TopicRows } from "./ui";

const MONTHS = ["yanvar", "fevral", "mart", "aprel", "may", "iyun", "iyul", "avqust", "sentyabr", "oktyabr", "noyabr", "dekabr"];

/** Aylıq valideyn hesabatı — yalnız bir şagirdin məlumatı (yaradılan anın görüntüsü). */
export function ReportView({ d, note }: { d: ReportData; note: string | null }) {
  const [y, m] = d.month.split("-").map(Number);
  return (
    <article className="mx-auto grid max-w-[620px] gap-4 rounded-[18px] border border-[#e6e9f2] bg-white p-6 text-[#0f1b3d]" aria-label={`Aylıq hesabat: ${d.student}`}>
      <div className="flex flex-wrap items-center justify-between gap-3">
        <div>
          <small className="font-bold text-[#5b6785] uppercase">
            Aylıq hesabat · {MONTHS[m - 1]} {y}
          </small>
          <h2 className="m-0 mt-1 text-[22px] font-black">{d.student}</h2>
          <small className="text-[#5b6785]">
            Müəllim: {d.teacher} · {d.group}
          </small>
        </div>
        <div className={`${brand} rounded-[16px] px-4 py-3 text-center text-white`}>
          <b className="text-[28px] font-black">{d.avg !== null ? `${d.avg}%` : "—"}</b>
          <br />
          <small>orta nəticə</small>
        </div>
      </div>
      <div className="grid grid-cols-3 gap-3">
        {[
          [d.tests, "sınaq"],
          [d.tasks, "tapşırıq (saytda)"],
          [d.place ? `${d.place}/${d.size}` : "—", "qrupda yer"],
        ].map(([v, l]) => (
          <div key={String(l)} className="rounded-[14px] border border-[#e6e9f2] p-3">
            <b className="block text-[22px] font-black">{v}</b>
            <small className="font-semibold text-[#5b6785]">{l}</small>
          </div>
        ))}
      </div>
      <section aria-label="Güclü tərəflər">
        <h3 className="m-0 mb-1 text-[15px]">Güclü tərəflər</h3>
        <TopicRows rows={d.strong} />
      </section>
      <section aria-label="Üzərində işləmək lazımdır">
        <h3 className="m-0 mb-1 text-[15px]">Üzərində işləmək lazımdır</h3>
        <TopicRows rows={d.weak} />
      </section>
      {note && <p className="m-0 rounded-[12px] bg-[#eef0ff] px-3.5 py-2.5 text-[13.5px] font-semibold text-[#3730a3]">💬 Müəllimin qeydi: {note}</p>}
      <p className="m-0 text-center text-[12px] text-[#5b6785]">2vur2.az · Bu material 2vur2.az saytına məxsusdur</p>
    </article>
  );
}
