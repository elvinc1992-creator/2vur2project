import type { ContestStatus } from "@/db/schema";

export const CONTEST_STATUS_LABEL: Record<ContestStatus, string> = {
  draft: "Qaralama",
  registration: "Qeydiyyat",
  running: "Davam edir",
  finished: "Bitib (onlayn tur)",
  final: "Final",
  results: "Nəticələr elan olunub",
};

export const EVENT_LABEL: Record<string, string> = {
  tab_hidden: "Tab dəyişmə",
  window_blur: "Pəncərədən çıxma",
  offline: "Bağlantı kəsilib",
  online: "Bağlantı bərpa olunub",
  copy: "Kopyalama cəhdi",
  context_menu: "Sağ klik",
};

/** Date → datetime-local dəyəri (Bakı vaxtı). */
export function toLocalInput(d: Date | null | undefined) {
  if (!d) return "";
  const p = Object.fromEntries(
    new Intl.DateTimeFormat("en-CA", { timeZone: "Asia/Baku", year: "numeric", month: "2-digit", day: "2-digit", hour: "2-digit", minute: "2-digit", hour12: false })
      .formatToParts(d)
      .map((x) => [x.type, x.value]),
  );
  return `${p.year}-${p.month}-${p.day}T${p.hour === "24" ? "00" : p.hour}:${p.minute}`;
}
