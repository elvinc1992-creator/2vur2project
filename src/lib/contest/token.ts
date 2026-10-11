import "server-only";
import { createHmac, timingSafeEqual } from "node:crypto";
import { env } from "@/lib/env";

// Qeydiyyata bağlı imzalı linklər (e-poçtdan imtina, sertifikat) — giriş tələb olunmadan, saxtalaşdırıla bilməz.

export const contestToken = (registrationId: string, purpose: "unsub" | "cert") =>
  createHmac("sha256", env.AUTH_SECRET).update(`${purpose}:${registrationId}`).digest("base64url").slice(0, 32);

export function checkContestToken(registrationId: string, purpose: "unsub" | "cert", token: string | null | undefined) {
  if (!token) return false;
  const a = Buffer.from(contestToken(registrationId, purpose));
  const b = Buffer.from(token);
  return a.length === b.length && timingSafeEqual(a, b);
}

export const unsubscribeUrl = (registrationId: string) =>
  `${env.APP_URL}/yaris/imtina?r=${registrationId}&t=${contestToken(registrationId, "unsub")}`;

export const certificateUrl = (registrationId: string) =>
  `${env.APP_URL}/yaris/sertifikat/${registrationId}?t=${contestToken(registrationId, "cert")}`;
