import "server-only";
import { createClient } from "@libsql/client";
import { drizzle } from "drizzle-orm/libsql";
import { env } from "@/lib/env";
import * as schema from "./schema";

// HTTP rejimi (libsql:// → https://): hər sorğu ayrıca fetch — serverless üçün uyğundur
// və vaxt limiti qoymaq olur. Bağlantı "ilişəndə" səhifə dəqiqələrlə gözləməsin.
const DB_TIMEOUT_MS = 10_000;

function fetchWithTimeout(input: RequestInfo | URL, init?: RequestInit) {
  const timeout = AbortSignal.timeout(DB_TIMEOUT_MS);
  return fetch(input, { ...init, signal: init?.signal ? AbortSignal.any([init.signal, timeout]) : timeout });
}

const client = createClient({
  url: env.TURSO_DATABASE_URL.replace(/^libsql:\/\//, "https://"),
  authToken: env.TURSO_AUTH_TOKEN,
  fetch: fetchWithTimeout,
});

export const db = drizzle(client, { schema });
