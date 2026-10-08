import type { NextAuthConfig } from "next-auth";

// Yüngül konfiqurasiya: proxy.ts bunu istifadə edir (DB və argon2 yoxdur).
export const authConfig = {
  pages: { signIn: "/daxil-ol", error: "/daxil-ol" },
  session: { strategy: "jwt" },
  providers: [],
  callbacks: {
    jwt({ token, user }) {
      if (user?.id) {
        token.uid = user.id;
        token.role = user.role ?? "student";
      }
      return token;
    },
    session({ session, token }) {
      if (token.uid) {
        session.user.id = token.uid;
        session.user.role = token.role ?? "student";
      }
      return session;
    },
  },
  logger: {
    // Yanlış şifrə və s. normal haldır — server loguna xəta kimi yazmırıq.
    error(error) {
      if ((error as { type?: string }).type === "CredentialsSignin") return;
      console.error(error);
    },
  },
} satisfies NextAuthConfig;
