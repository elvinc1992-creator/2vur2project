// "Poçtu aç" düyməsi üçün məşhur poçt xidmətlərinin veb ünvanları.
const PROVIDERS: Record<string, string> = {
  "gmail.com": "https://mail.google.com/",
  "googlemail.com": "https://mail.google.com/",
  "outlook.com": "https://outlook.live.com/mail/",
  "hotmail.com": "https://outlook.live.com/mail/",
  "live.com": "https://outlook.live.com/mail/",
  "icloud.com": "https://www.icloud.com/mail/",
  "me.com": "https://www.icloud.com/mail/",
  "yahoo.com": "https://mail.yahoo.com/",
  "mail.ru": "https://e.mail.ru/",
  "inbox.ru": "https://e.mail.ru/",
  "list.ru": "https://e.mail.ru/",
  "bk.ru": "https://e.mail.ru/",
  "yandex.ru": "https://mail.yandex.ru/",
  "yandex.com": "https://mail.yandex.com/",
};

export function mailInboxUrl(email: string | null | undefined): string | null {
  const domain = email?.split("@")[1]?.toLowerCase();
  return (domain && PROVIDERS[domain]) || null;
}
