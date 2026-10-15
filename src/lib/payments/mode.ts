import "server-only";
import { epointKeys } from "./epoint";

/**
 * Ödəniş rejimi: "epoint" — PAYMENT_PROVIDER=epoint və açarlar var; "mock" — yalnız inkişafda (düymə ödənişi təqlid edir);
 * "off" — production-da Epoint qoşulmayıbsa (demo ödəniş production-da heç vaxt işləmir).
 */
export type PaymentMode = "epoint" | "mock" | "off";

export function paymentMode(): PaymentMode {
  if (process.env.PAYMENT_PROVIDER === "epoint") return epointKeys() ? "epoint" : "off";
  return process.env.NODE_ENV === "production" ? "off" : "mock";
}
