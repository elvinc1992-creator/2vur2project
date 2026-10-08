import "server-only";
import { env } from "@/lib/env";

export type EmailMessage = { to: string; subject: string; text: string };

export interface EmailProvider {
  send(message: EmailMessage): Promise<void>;
}

/**
 * İnkişaf üçün: məktubu göndərmir, terminala yazır. Production-dan kənarda
 * həm də `.dev-mail/` qovluğuna yazır — e2e testlər linkləri oradan oxuyur.
 */
class ConsoleEmailProvider implements EmailProvider {
  async send({ to, subject, text }: EmailMessage) {
    const line = "─".repeat(64);
    console.info(`\n${line}\n📧 E-poçt (console)\nKimdən: ${env.EMAIL_FROM}\nKimə:   ${to}\nMövzu:  ${subject}\n\n${text}\n${line}\n`);
    if (process.env.NODE_ENV !== "production") {
      const { mkdir, writeFile } = await import("node:fs/promises");
      const dir = `${process.cwd()}/.dev-mail`;
      await mkdir(dir, { recursive: true });
      await writeFile(`${dir}/${Date.now()}-${to}.json`, JSON.stringify({ to, subject, text }, null, 2));
    }
  }
}

let provider: EmailProvider | undefined;

export function emailProvider(): EmailProvider {
  if (!provider) {
    switch (env.EMAIL_PROVIDER) {
      case "console":
        provider = new ConsoleEmailProvider();
        break;
    }
  }
  return provider;
}
