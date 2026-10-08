import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { Page } from "@/components/app/topbar";
import { CheckCircleIcon, ReceiptIcon } from "@/components/icons";
import { Button, ButtonLink } from "@/components/ui/button";
import { KeyValues, Tag } from "@/components/ui/display";
import { EmptyState } from "@/components/ui/empty-art";
import { az } from "@/content/az";
import { startExamAction } from "@/lib/demo/actions";
import { PRICE_PLACEHOLDER } from "@/lib/demo/content";
import { addDays, examStatus, formatDate } from "@/lib/demo/logic";
import { requireDemo } from "@/lib/demo/session";
import { PrintButton } from "./print-button";

export const metadata: Metadata = { title: az.app.payment.okTitle };

export default async function PaymentSuccessPage(props: PageProps<"/odenis/ugurlu">) {
  const { r } = await props.searchParams;
  const { user, state } = await requireDemo("/profil");
  const p = state.payments.find((x) => x.id === r);
  if (!p) notFound();
  const t = az.app.payment;
  const isExam = Boolean(p.examId);
  const canStart = p.examId && examStatus(state, p.examId) === "purchased";

  return (
    <Page>
      <div className="mx-auto grid w-full max-w-[520px] gap-4">
        <EmptyState tone="success" icon={<CheckCircleIcon />} title={t.okTitle}>
          {isExam ? t.okTextExam : t.okTextMonthly}
        </EmptyState>
        <section aria-label={t.receipt} className="grid gap-2.5 rounded-lg border border-line bg-white p-5 text-[15px]">
          <div className="flex items-center justify-between gap-3">
            <b className="flex items-center gap-2 font-display text-base font-extrabold text-navy-900">
              <ReceiptIcon className="size-5" />
              {t.receipt}
            </b>
            <Tag tone="success">{t.paid}</Tag>
          </div>
          <KeyValues
            rows={[
              [t.receiptNo, p.id],
              [t.date, formatDate(p.date)],
              [t.plan, p.title],
              ...(isExam ? [] : [[t.period, `${formatDate(p.date)} – ${formatDate(addDays(p.date, 30))}`] as [string, string]]),
              [az.app.profile.method, p.method],
            ]}
          />
          <hr className="my-1 w-full border-0 border-t border-dashed border-control-border" />
          <dl className="m-0 grid grid-cols-[1fr_auto] gap-3">
            <dt className="font-bold text-ink">{t.total}</dt>
            <dd className="m-0 font-display text-lg leading-6 font-extrabold">{PRICE_PLACEHOLDER}</dd>
          </dl>
          <PrintButton label={t.print} />
        </section>
        {canStart ? (
          <form action={startExamAction.bind(null, p.examId!)}>
            <Button type="submit" block>
              {t.toExam}
            </Button>
          </form>
        ) : (
          <ButtonLink href={isExam ? "/sinaqlar" : "/gunun-suallari"} block>
            {isExam ? az.app.nav.exams : t.toDaily}
          </ButtonLink>
        )}
        <p className="text-center text-small text-ink-muted">{t.copySent(user.email ?? "")}</p>
      </div>
    </Page>
  );
}
