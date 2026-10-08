import "server-only";
import { eq } from "drizzle-orm";
import NextAuth, { CredentialsSignin } from "next-auth";
import Credentials from "next-auth/providers/credentials";
import { authConfig } from "@/auth.config";
import { db } from "@/db";
import { users } from "@/db/schema";
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
        // Təsdiq statusunu yalnız düzgün şifrədən sonra bildiririk.
        if (!user.emailVerifiedAt) throw new LoginError("unverified");

        return { id: user.id, name: user.name, email: user.email, role: user.role };
      },
    }),
  ],
});
