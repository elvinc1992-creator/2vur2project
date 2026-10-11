import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { contestById } from "@/lib/contest/data";
import { cn } from "@/lib/cn";
import { Notice, PageHead, btnGhost } from "../../ui";
import { CONTEST_STATUS_LABEL } from "../labels";
import { FinalTab } from "./final-tab";
import { LiveTab } from "./live-tab";
import { RegistrantsTab } from "./registrants-tab";
import { SettingsTab } from "./settings-tab";
import { TemplatesTab } from "./templates-tab";

export const metadata: Metadata = { title: "Yarış" };

const TABS = [
  ["", "Parametrlər və mükafatlar"],
  ["suallar", "Sual şablonları"],
  ["istirakcilar", "Qeydiyyatçılar"],
  ["canli", "Canlı izləmə və şübhəlilər"],
  ["final", "Final və mükafatlar"],
] as const;

const OPS: Record<string, string> = {
  compute: "Nəticələr hesablandı",
  result_mails: "Nəticə məktubları göndərildi",
  finalist_mails: "Finalçılara məktub göndərildi",
  publish_final: "Yekun nəticələr elan olundu, məktublar göndərildi",
  confirm_mails: "Təsdiq məktubları yenidən göndərildi",
  reminder_mails: "Xatırlatma göndərildi",
};
const ERRORS: Record<string, string> = {
  tarix: "Tarixləri yoxla (qeydiyyatın sonu başlanğıcından əvvəl ola bilməz).",
  mukafat: "Mükafat sətirlərini yoxla: “1 | 300 | + 6 ay Premium”.",
  sablon: "Şablon yoxlanışdan keçmədi: dəyişənlər JSON olmalı, cavab və 4 yanlış variant hesablanmalı, 5 cavab bir-birindən fərqli olmalıdır.",
  sebeb: "Diskvalifikasiyanın səbəbini yaz.",
};

export default async function AdminContest(props: PageProps<"/admin/yaris/[id]">) {
  const { id } = await props.params;
  const sp = await props.searchParams;
  const c = await contestById(id);
  if (!c) notFound();
  const tab = typeof sp.tab === "string" ? sp.tab : "";
  const str = (k: string) => (typeof sp[k] === "string" ? (sp[k] as string) : undefined);

  return (
    <>
      <PageHead title={c.title} lead={`/yaris/${c.slug} · ${CONTEST_STATUS_LABEL[c.status]}`}>
        <div className="flex flex-wrap gap-2">
          <Link href="/admin/yaris" className={btnGhost}>
            ← Yarışlar
          </Link>
          <Link href={`/yaris/${c.slug}`} className={btnGhost}>
            Səhifəyə bax
          </Link>
        </div>
      </PageHead>
      {sp.yaradildi && <Notice tone="ok">Yarış yaradıldı (qaralama).</Notice>}
      {sp.saxlanildi && <Notice tone="ok">Yadda saxlanıldı.</Notice>}
      {sp.silindi && <Notice tone="ok">Silindi.</Notice>}
      {str("ok") && OPS[str("ok")!] && <Notice tone="ok">{`${OPS[str("ok")!]} (${str("n") ?? 0}).`}</Notice>}
      {str("xeta") && ERRORS[str("xeta")!] && <Notice tone="error">{ERRORS[str("xeta")!]}</Notice>}
      <nav aria-label="Yarışın bölmələri" className="flex flex-wrap gap-1.5">
        {TABS.map(([k, label]) => (
          <Link
            key={k}
            href={`/admin/yaris/${c.id}${k ? `?tab=${k}` : ""}`}
            aria-current={tab === k ? "page" : undefined}
            className={cn(
              "rounded-pill border px-3 py-1.5 text-[13px] font-semibold no-underline",
              tab === k ? "border-navy-900 bg-navy-900 text-white" : "border-line bg-white text-navy-900",
            )}
          >
            {label}
          </Link>
        ))}
      </nav>
      {tab === "" && <SettingsTab c={c} />}
      {tab === "suallar" && <TemplatesTab c={c} editId={Number(str("t")) || null} />}
      {tab === "istirakcilar" && <RegistrantsTab c={c} q={str("q")} grade={Number(str("sinif")) || undefined} region={str("rayon")} />}
      {tab === "canli" && <LiveTab c={c} />}
      {tab === "final" && <FinalTab c={c} />}
    </>
  );
}
