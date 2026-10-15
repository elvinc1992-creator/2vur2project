import type { Metadata } from "next";
import { LegalPage } from "@/components/legal-page";
import { az } from "@/content/az";
import { privacy } from "@/content/az-legal";

export const metadata: Metadata = { title: az.legalLinks.privacy };

export default function Page() {
  return <LegalPage title={az.legalLinks.privacy} doc={privacy} />;
}
