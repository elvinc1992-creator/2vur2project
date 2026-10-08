import type { Metadata } from "next";
import { LegalPage } from "@/components/legal-page";
import { az } from "@/content/az";

export const metadata: Metadata = { title: az.legalLinks.terms };

export default function Page() {
  return <LegalPage title={az.legalLinks.terms} />;
}
