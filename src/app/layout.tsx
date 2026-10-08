import type { Metadata, Viewport } from "next";
import { Inter, Manrope } from "next/font/google";
import { brand } from "@/config/brand";
import "katex/dist/katex.min.css";
import "./globals.css";

// latin-ext: ə ı ö ü ş ç ğ İ Ə
const manrope = Manrope({
  variable: "--font-manrope",
  subsets: ["latin", "latin-ext"],
  weight: ["600", "700", "800"],
  display: "swap",
});

const inter = Inter({
  variable: "--font-inter",
  subsets: ["latin", "latin-ext"],
  display: "swap",
});

export const metadata: Metadata = {
  title: { default: brand.name, template: `%s · ${brand.name}` },
  description: "İmtahanda nə çıxıb, nəyi işləməlisən — rəqəmlərlə.",
};

export const viewport: Viewport = {
  themeColor: "#1F3864",
  width: "device-width",
  initialScale: 1,
};

export default function RootLayout({ children }: LayoutProps<"/">) {
  return (
    <html lang="az" className={`${manrope.variable} ${inter.variable}`}>
      <body>{children}</body>
    </html>
  );
}
