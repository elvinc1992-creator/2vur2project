import "server-only";
import { and, eq } from "drizzle-orm";
import { db } from "@/db";
import { oauthAccounts, users, type UserRole } from "@/db/schema";

// Google ilə giriş: hesab e-poçta görə tapılır (və ya yaradılır) və oauth_accounts-a bağlanır.
// Sessiyada həmişə bizim users.id saxlanılır (Google sub yox).

/**
 * Google Console-da qeydiyyatdan keçmiş yönləndirmə ünvanı: {APP_URL}/api/auth/google/callback.
 * Auth.js-in öz callback-i /api/auth/callback/google-dur — route ona ötürür (bax: app/api/auth/google/callback).
 */
export const googleRedirectUri = () => `${(process.env.APP_URL ?? "http://localhost:3000").replace(/\/$/, "")}/api/auth/google/callback`;

export type GoogleProfile = {
  sub: string;
  email?: string;
  email_verified?: boolean;
  name?: string;
  given_name?: string;
  family_name?: string;
};

/** E-poçtun yerli hissəsindən unikal istifadəçi adı (3–20: kiçik hərf, rəqəm, "_"). */
async function uniqueUsername(email: string): Promise<string> {
  const base =
    email
      .split("@")[0]
      .toLowerCase()
      .replace(/[^a-z0-9_]/g, "_")
      .replace(/_+/g, "_")
      .slice(0, 14)
      .padEnd(3, "0") || "user";
  for (let i = 0; i < 20; i++) {
    const candidate = i === 0 ? base : `${base}_${Math.floor(1000 + Math.random() * 9000)}`;
    const taken = await db.query.users.findFirst({ where: eq(users.username, candidate), columns: { id: true } });
    if (!taken) return candidate;
  }
  return `user_${crypto.randomUUID().slice(0, 12).replace(/-/g, "")}`;
}

/** Google profili → bizim istifadəçi (yoxdursa yaradılır). Təsdiqlənməmiş Google e-poçtu qəbul olunmur. */
export async function upsertGoogleUser(profile: GoogleProfile): Promise<{ id: string; role: UserRole } | null> {
  const email = profile.email?.trim().toLowerCase();
  if (!email || profile.email_verified === false) return null;

  const linked = await db
    .select({ id: users.id, role: users.role })
    .from(oauthAccounts)
    .innerJoin(users, eq(users.id, oauthAccounts.userId))
    .where(and(eq(oauthAccounts.provider, "google"), eq(oauthAccounts.providerAccountId, profile.sub)));
  if (linked[0]) return linked[0];

  const now = new Date();
  let user = await db.query.users.findFirst({ where: eq(users.email, email) });
  if (user) {
    // Mövcud hesab: Google e-poçtu təsdiqləyib.
    if (!user.emailVerifiedAt) await db.update(users).set({ emailVerifiedAt: now }).where(eq(users.id, user.id));
  } else {
    [user] = await db
      .insert(users)
      .values({
        email,
        username: await uniqueUsername(email),
        name: (profile.given_name || profile.name || email.split("@")[0]).slice(0, 60),
        surname: profile.family_name?.slice(0, 60) ?? null,
        passwordHash: null,
        emailVerifiedAt: now,
        termsAcceptedAt: now,
      })
      .returning();
  }
  await db
    .insert(oauthAccounts)
    .values({ userId: user.id, provider: "google", providerAccountId: profile.sub })
    .onConflictDoNothing();
  return { id: user.id, role: user.role };
}
