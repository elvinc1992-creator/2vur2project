import { createHash, randomBytes } from "node:crypto";

export const VERIFY_TOKEN_TTL_MS = 24 * 60 * 60 * 1000;
export const RESET_TOKEN_TTL_MS = 30 * 60 * 1000;

/** Brauzerə/məktuba gedən təsadüfi token (256 bit, base64url). */
export function generateToken(): string {
  return randomBytes(32).toString("base64url");
}

/** Bazada yalnız bu hash saxlanılır. */
export function hashToken(token: string): string {
  return createHash("sha256").update(token).digest("hex");
}
