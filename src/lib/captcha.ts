import "server-only";
import { env } from "@/lib/env";

/**
 * CAPTCHA abstraksiyası. Provayder sonra seçiləcək (Turnstile, hCaptcha və s.);
 * hazırda `none` — həmişə keçir.
 */
export async function verifyCaptcha(_token: string | null, _ip: string): Promise<boolean> {
  switch (env.CAPTCHA_PROVIDER) {
    case "none":
      return true;
  }
}
