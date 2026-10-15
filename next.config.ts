import path from "node:path";
import type { NextConfig } from "next";

const securityHeaders = [
  { key: "X-Content-Type-Options", value: "nosniff" },
  { key: "Referrer-Policy", value: "strict-origin-when-cross-origin" },
  { key: "X-Frame-Options", value: "DENY" },
  { key: "Permissions-Policy", value: "camera=(), microphone=(), geolocation=()" },
  // CSP (nonce ilə) 8-ci mərhələdə əlavə olunacaq.
];

const nextConfig: NextConfig = {
  // Ev qovluğunda köhnə package-lock.json var — kökü açıq göstəririk.
  turbopack: { root: path.resolve(__dirname) },
  serverExternalPackages: ["@node-rs/argon2"],
  poweredByHeader: false,
  async headers() {
    return [
      { source: "/:path*", headers: securityHeaders },
      // Nəzəriyyə kitabı saytın öz səhifəsində iframe-də açılır (sonrakı qayda eyni başlığı əvəz edir).
      {
        source: "/onlayn-repetitor/:movzu/nezeriyye/kitab",
        headers: [
          { key: "X-Frame-Options", value: "SAMEORIGIN" },
          { key: "Content-Security-Policy", value: "frame-ancestors 'self'" },
        ],
      },
    ];
  },
};

export default nextConfig;
