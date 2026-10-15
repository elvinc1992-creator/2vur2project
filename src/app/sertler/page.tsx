import type { Metadata } from "next";
import { LegalPage } from "@/components/legal-page";
import { az } from "@/content/az";
import { terms } from "@/content/az-legal";

export const metadata: Metadata = { title: az.legalLinks.terms };

export default function Page() {
  return <LegalPage title={az.legalLinks.terms} doc={terms} />;
}
