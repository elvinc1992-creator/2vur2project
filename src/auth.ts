import "server-only";
import { eq } from "drizzle-orm";
import NextAuth, { CredentialsSignin, customFetch } from "next-auth";
import Credentials from "next-auth/providers/credentials";
import Google from "next-auth/providers/google";
import { authConfig } from "@/auth.config";
import { features } from "@/config/features";
import { db } from "@/db";
import { users } from "@/db/schema";
import { googleRedirectUri, upsertGoogleUser, type GoogleProfile } from "@/lib/auth/google";
import { verifyPassword } from "@/lib/auth/password";
import { loginSchema } from "@/lib/auth/validation";

export type LoginErrorCode =
  | "invalid_input"
  | "not_found_email"
  | "not_found_username"
  | "google_only"
  | "wrong_password"
  | "unverified";

export class LoginError extends CredentialsSignin {
  constructor(code: LoginErrorCode) {
    super();
    this.code = code;
  }
}

export function findUserByIdentifier(identifier: string) {
  const byEmail = identifier.includes("@");
  return db.query.users.findFirst({
    where: byEmail ? eq(users.email, identifier) : eq(users.username, identifier),
  });
}

export const { handlers, auth, signIn, signOut } = NextAuth({
  ...authConfig,
  providers: [
    Credentials({
      credentials: { identifier: {}, password: {} },
      async authorize(raw) {
        const parsed = loginSchema.safeParse(raw);
        if (!parsed.success) throw new LoginError("invalid_input");
        const { identifier, password } = parsed.data;

        const user = await findUserByIdentifier(identifier);
        if (!user) {
          throw new LoginError(identifier.includes("@") ? "not_found_email" : "not_found_username");
        }
        if (!user.passwordHash) throw new LoginError("google_only");
        if (!(await verifyPassword(user.passwordHash, password))) {
          throw new LoginError("wrong_password");
        }
        // E-poçt təsdiqi tələb olunmur — köhnə təsdiqlənməmiş hesablar da daxil ola bilir.

        return { id: user.id, name: user.name, email: user.email, role: user.role };
      },
    }),
    ...(features.google
      ? [
          Google({
            clientId: process.env.GOOGLE_CLIENT_ID,
            clientSecret: process.env.GOOGLE_CLIENT_SECRET,
            // Google Console-dakı ünvan /api/auth/google/callback-dir (Auth.js-in standartı yox).
            authorization: { params: { redirect_uri: googleRedirectUri(), prompt: "select_account" } },
            // Token mübadiləsində də eyni redirect_uri göndərilməlidir.
            [customFetch]: (input: RequestInfo | URL, init?: RequestInit) => {
              if (init?.body instanceof URLSearchParams && init.body.get("grant_type") === "authorization_code") {
                init.body.set("redirect_uri", googleRedirectUri());
              }
              return fetch(input, init);
            },
          }),
        ]
      : []),
  ],
  callbacks: {
    ...authConfig.callbacks,
    /** Google: istifadəçi bazada tapılır/yaradılır; sessiyaya bizim users.id düşür (jwt callback-də token.uid). */
    async signIn({ user, account, profile }) {
      if (account?.provider !== "google") return true;
      const found = profile ? await upsertGoogleUser(profile as GoogleProfile) : null;
      if (!found) return false;
      user.id = found.id;
      user.role = found.role;
      return true;
    },
  },
});
