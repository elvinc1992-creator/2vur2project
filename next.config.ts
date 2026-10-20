import fs from "node:fs";
import path from "node:path";
import type { NextConfig } from "next";

// Ana səhifədəki video: fayl public/media-dadırsa göstərilir. Build zamanı yoxlanır —
// Vercel funksiyasında public qovluğu olmur, ona görə runtime fs yoxlaması işləməzdi.
const media = (file: string) => (fs.existsSync(path.join(__dirname, "public", "media", file)) ? `/media/${file}` : "");

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
  env: { INTRO_VIDEO: media("2vur2-analiz.mp4"), INTRO_POSTER: media("2vur2-analiz.jpg") },
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
