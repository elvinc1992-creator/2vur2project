import { createHash, timingSafeEqual } from "node:crypto";

// Epoint.az API (sənəd: "API Epoint en.pdf", v1.0.3).
// Hər sorğu: data = base64(json), signature = base64(sha1_raw(private_key + data + private_key)).
// Ödənişin nəticəsi result_url-ə eyni formatda (data, signature) POST ilə gəlir — kabinetdə {APP_URL}/api/epoint/result.

const BASE = "https://epoint.az/api/1";

export type EpointKeys = { publicKey: string; privateKey: string };

/** Açarlar .env-dədirsə real Epoint, yoxdursa — null (inkişafda demo ödəniş). */
export function epointKeys(): EpointKeys | null {
  const publicKey = process.env.EPOINT_PUBLIC_KEY?.trim();
  const privateKey = process.env.EPOINT_PRIVATE_KEY?.trim();
  return publicKey && privateKey ? { publicKey, privateKey } : null;
}

export const encodeData = (payload: object) => Buffer.from(JSON.stringify(payload), "utf8").toString("base64");

export const signData = (data: string, privateKey: string) =>
  createHash("sha1").update(privateKey + data + privateKey, "utf8").digest("base64");

/** Epoint-dən gələn imzanı yoxlayır; düzgündürsə data-nın JSON-unu qaytarır, deyilsə — null. */
export function verifyEpoint(data: string, signature: string, privateKey: string): Record<string, unknown> | null {
  const expected = Buffer.from(signData(data, privateKey));
  const given = Buffer.from(signature);
  if (expected.length !== given.length || !timingSafeEqual(expected, given)) return null;
  try {
    const json: unknown = JSON.parse(Buffer.from(data, "base64").toString("utf8"));
    return json && typeof json === "object" ? (json as Record<string, unknown>) : null;
  } catch {
    return null;
  }
}

async function call(path: string, payload: Record<string, unknown>, keys: EpointKeys): Promise<Record<string, unknown>> {
  const data = encodeData({ public_key: keys.publicKey, ...payload });
  const res = await fetch(`${BASE}/${path}`, {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: new URLSearchParams({ data, signature: signData(data, keys.privateKey) }),
    cache: "no-store",
    signal: AbortSignal.timeout(20_000),
  });
  if (!res.ok) throw new Error(`Epoint ${path}: HTTP ${res.status}`);
  return (await res.json()) as Record<string, unknown>;
}

export type PaymentRequest = {
  orderId: string;
  /** AZN */
  amount: number;
  description: string;
  successUrl: string;
  errorUrl: string;
};

/** Ödəniş yaradır: istifadəçi qaytarılan redirectUrl-də (bankın səhifəsi) kart məlumatını daxil edir. */
export async function createPayment(req: PaymentRequest, keys: EpointKeys) {
  const r = await call(
    "request",
    {
      amount: req.amount,
      currency: "AZN",
      language: "az",
      order_id: req.orderId,
      description: req.description.slice(0, 1000),
      success_redirect_url: req.successUrl,
      error_redirect_url: req.errorUrl,
    },
    keys,
  );
  if (r.status !== "success" || typeof r.redirect_url !== "string") {
    throw new Error(`Epoint ödəniş yaratmadı: ${String(r.message ?? r.status ?? "naməlum xəta")}`);
  }
  return { redirectUrl: r.redirect_url, transaction: typeof r.transaction === "string" ? r.transaction : null };
}

/** Ödənişin vəziyyəti (new | success | returned | error | server_error). */
export async function paymentStatus(transaction: string, keys: EpointKeys) {
  return call("get-status", { transaction }, keys);
}
