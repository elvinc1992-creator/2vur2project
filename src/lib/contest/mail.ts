import "server-only";
import { and, eq } from "drizzle-orm";
import { db } from "@/db";
import { contestEmails, type ContestEmailKind } from "@/db/schema";
import { emailProvider } from "@/lib/email";
import { env } from "@/lib/env";
import type { ContestRow, RegistrationRow } from "./data";
import { certificateUrl, unsubscribeUrl } from "./token";

// Yarış e-poçtları (SMS yoxdur). Təsdiq və xatırlatma — hər qeydiyyatçıya (imtina etməyibsə);
// nəticə, finalçı və yekun məktublar — yalnız "nəticələrin e-poçtuma göndərilməsinə razıyam" deyənlərə.
// Hər məktubda imtina linki var. Göndərilənlər contest_emails-ə yazılır — təkrar getmir (admin əl ilə göndərə bilər).

const DT = new Intl.DateTimeFormat("az-AZ", { timeZone: "Asia/Baku", day: "numeric", month: "long", year: "numeric" });
const TM = new Intl.DateTimeFormat("az-AZ", { timeZone: "Asia/Baku", hour: "2-digit", minute: "2-digit", hour12: false });
export const fmtDay = (d: Date) => DT.format(d);
export const fmtTime = (d: Date) => TM.format(d);

const RESULT_KINDS: ContestEmailKind[] = ["result", "finalist", "final"];

/** Bu məktub bu iştirakçıya göndərilə bilərmi (razılıq və imtina). */
export const canMail = (reg: RegistrationRow, kind: ContestEmailKind) =>
  reg.status === "active" && !reg.unsubscribedAt && (!RESULT_KINDS.includes(kind) || reg.agreeEmail);

export type MailExtra = {
  score?: number;
  place?: number | null;
  participants?: number;
  finalist?: boolean;
  weak?: string[];
  finalPlace?: number | null;
  winners?: string[];
};

function compose(kind: ContestEmailKind, c: ContestRow, reg: RegistrationRow, x: MailExtra) {
  const link = `${env.APP_URL}/yaris/${c.slug}`;
  const when = `${fmtDay(c.startAt)}, saat ${fmtTime(c.startAt)} (Bakı vaxtı)`;
  const hi = `Salam, ${reg.firstName}!`;
  const footer = `\n\n—\n2vur2.az\nBu məktubları almaq istəmirsənsə: ${unsubscribeUrl(reg.id)}`;
  switch (kind) {
    case "confirm":
      return {
        subject: `Qeydiyyat təsdiqləndi — ${c.title}`,
        text: `${hi}\n\n"${c.title}" yarışına qeydiyyatın tamamlandı.\n\nOnlayn tur: ${when}.\nGiriş başlanğıcdan ${c.entryWindowMin} dəqiqə sonra bağlanır.\nKeçid: ${link}\n\nQısa qaydalar:\n• ${c.questionCount} sual, ${c.durationMin} dəqiqə; suallar bir-bir göstərilir, geri qayıtmaq olmur.\n• Hər iştirakçıya fərqli rəqəmlərlə variant düşür.\n• Vaxt sayğacı dayanmır — internet bağlantını əvvəlcədən yoxla.\n• AI, kalkulyator və kənar kömək qadağandır.\n\nSənin dəvət kodun: ${reg.inviteCode}${footer}`,
      };
    case "reminder":
      return {
        subject: `1 saatdan sonra başlayırıq — ${c.title}`,
        text: `${hi}\n\nOnlayn tur ${when} başlayır.\nKeçid: ${link}/tur\n\nGiriş başlanğıcdan ${c.entryWindowMin} dəqiqə sonra bağlanır. Uğurlar!${footer}`,
      };
    case "result":
      return {
        subject: `Nəticən — ${c.title}`,
        text: `${hi}\n\nOnlayn turun nəticəsi:\n• Bal: ${x.score} / ${c.questionCount}\n• Yer: ${x.place ?? "—"} (${x.participants} iştirakçı)\n• ${x.finalist ? "Təbrik edirik, finala keçdin! Finalın vaxtı və məkanı ayrıca bildiriləcək." : "Bu dəfə finala keçmədin — növbəti yarışda uğurlar!"}\n${x.weak?.length ? `\nDiqqət etməli mövzular: ${x.weak.join(", ")}.\n` : ""}\nHəllərə bax: ${link}/netice\nSertifikat: ${certificateUrl(reg.id)}${footer}`,
      };
    case "finalist":
      return {
        subject: `Final dəvəti — ${c.title}`,
        text: `${hi}\n\nSən "${c.title}" yarışının finalçısısan! Final yalnız əyani keçirilir.\n\nVaxt: ${c.finalAt ? `${fmtDay(c.finalAt)}, saat ${fmtTime(c.finalAt)}` : "elan olunacaq"}\nMəkan: ${c.finalPlace ?? "elan olunacaq"}\n\nŞəxsiyyət vəsiqəni (və ya doğum şəhadətnaməsini) götürməyi unutma. Finala gəlməyən iştirakçı mükafat almır.${footer}`,
      };
    case "final":
      return {
        subject: `Yekun nəticələr — ${c.title}`,
        text: `${hi}\n\n"${c.title}" yarışının yekun nəticələri elan olundu.\n${x.winners?.length ? `\nQaliblər:\n${x.winners.map((w, i) => `${i + 1}. ${w}`).join("\n")}\n` : ""}${x.finalPlace ? `\nSənin final yerin: ${x.finalPlace}.\n` : ""}\nBütün nəticələr: ${link}#leaderboard\nSertifikat: ${certificateUrl(reg.id)}${footer}`,
      };
  }
}

/** Məktubu göndərir (razılıq və təkrar yoxlanılır; force — admin yenidən göndərir). Göndərildisə true. */
export async function sendContestMail(kind: ContestEmailKind, c: ContestRow, reg: RegistrationRow, extra: MailExtra = {}, force = false) {
  if (!canMail(reg, kind)) return false;
  if (!force) {
    const [sent] = await db
      .select({ id: contestEmails.id })
      .from(contestEmails)
      .where(and(eq(contestEmails.registrationId, reg.id), eq(contestEmails.kind, kind)));
    if (sent) return false;
  }
  const m = compose(kind, c, reg, extra);
  await emailProvider().send({ to: reg.email, subject: m.subject, text: m.text });
  await db.insert(contestEmails).values({ registrationId: reg.id, kind, sentAt: new Date() });
  return true;
}
