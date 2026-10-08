import type { Metadata } from "next";
import { Page, Topbar } from "@/components/app/topbar";
import { CheckCircleIcon } from "@/components/icons";
import { Button, ButtonLink } from "@/components/ui/button";
import { EmptyState } from "@/components/ui/empty-art";
import { az } from "@/content/az";
import { resumeSubscriptionAction } from "@/lib/demo/actions";
import { formatDate } from "@/lib/demo/logic";
import { requireDemo } from "@/lib/demo/session";

export const metadata: Metadata = { title: az.app.cancel.doneTitle };

export default async function CanceledPage() {
  const { state } = await requireDemo("/profil");
  const t = az.app.cancel;
  return (
    <>
      <Topbar title={az.app.profile.title} back="/profil" />
      <Page narrow>
        <EmptyState icon={<CheckCircleIcon />} title={t.doneTitle}>
          {t.doneText(formatDate(state.sub.periodEnd))}
        </EmptyState>
        <ButtonLink href="/panel" block>
          {t.toPanel}
        </ButtonLink>
        <form action={resumeSubscriptionAction}>
          <Button type="submit" variant="ghost" block>
            {t.undo}
          </Button>
        </form>
      </Page>
    </>
  );
}
