import { readFile, readdir } from "node:fs/promises";
import path from "node:path";

const DIR = path.join(process.cwd(), ".dev-mail");

type Mail = { to: string; subject: string; text: string };

/** ConsoleEmailProvider-in `.dev-mail/` qovluğundan son məktubu gözləyir. */
export async function waitForMail(to: string, subject: string, after: number): Promise<Mail> {
  for (let i = 0; i < 60; i++) {
    const files = await readdir(DIR).catch(() => [] as string[]);
    const mine = files
      .filter((f) => f.endsWith(`-${to}.json`) && Number(f.split("-")[0]) >= after)
      .sort()
      .reverse();
    for (const f of mine) {
      const mail = JSON.parse(await readFile(path.join(DIR, f), "utf8")) as Mail;
      if (mail.subject.includes(subject)) return mail;
    }
    await new Promise((r) => setTimeout(r, 250));
  }
  throw new Error(`Məktub gəlmədi: ${to} / ${subject}`);
}

export function linkFrom(mail: Mail): string {
  const url = mail.text.match(/https?:\/\/\S+/)?.[0];
  if (!url) throw new Error("Məktubda link yoxdur");
  return url;
}
