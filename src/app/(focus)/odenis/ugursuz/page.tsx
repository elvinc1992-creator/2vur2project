import type { Metadata } from "next";
import { redirect } from "next/navigation";
import { Page } from "@/components/app/topbar";
import { CardIcon } from "@/components/icons";
import { Alert } from "@/components/ui/alert";
import { ButtonLink } from "@/components/ui/button";
import { Card } from "@/components/ui/display";
import { EmptyState } from "@/components/ui/empty-art";
import { brand } from "@/config/brand";
import { az } from "@/content/az";
import { PLANS, priceOf } from "@/lib/demo/plans";
import { findExam } from "@/lib/exams/source";
import { priceText } from "@/lib/exams/types";
import { requireDemo } from "@/lib/demo/session";
import { syncOrder } from "@/lib/payments/purchase";

export const metadata: Metadata = { title: az.app.payment.failTitle };

export default async function PaymentFailPage(props: PageProps<"/odenis/ugursuz">) {
  const sp = await props.searchParams;
  const { user } = await requireDemo("/odenis");
  // Epoint-dən qayıdış (?o=sifariş): nə alınırdı və bankın cavabı sifarişdən götürülür.
  const order = typeof sp.o === "string" ? await syncOrder(sp.o, user.id!) : null;
  if (order?.status === "success") redirect(`/odenis/ugurlu?o=${order.id}`);
  const examId = order ? order.examId : typeof sp.exam === "string" ? sp.exam : null;
  const exam = examId ? await findExam(examId) : undefined;
  const t = az.app.payment;
  const tier = (order?.tier ?? sp.plan) === "premium" ? "premium" : "pro";
  const period = (order?.period ?? sp.period) === "year" ? "year" : "month";
  const retry = exam ? `/odenis?exam=${exam.id}` : `/odenis?plan=${tier}&period=${period}`;

  return (
    <Page>
      <div className="mx-auto grid w-full max-w-[520px] gap-4">
        <EmptyState tone="danger" icon={<CardIcon />} title={t.failTitle}>
          {t.failText}
        </EmptyState>
        <Alert tone="danger" title={order?.message ? t.failBank(order.message) : t.failReason}>
          {t.failHint}
        </Alert>
        <Card tone="tint" className="grid gap-2 !p-4">
          <span className="text-small text-ink-muted">{t.selected}</span>
          <b className="font-display text-lg leading-6 font-extrabold text-navy-900">{exam ? exam.title : t.planTitle(PLANS[tier].name, period === "year")}</b>
          <div className="flex items-center justify-between gap-3 text-small">
            <span className="text-ink-muted">{exam ? t.examNote : t.monthlyNote}</span>
            <b className="whitespace-nowrap">{exam ? priceText(exam.price) : period === "year" ? t.perYear(priceOf(tier, "year")) : t.perMonth(priceOf(tier))}</b>
          </div>
        </Card>
        <ButtonLink href={retry} variant="primary" block>
          {t.retry}
        </ButtonLink>
        <ButtonLink href={retry} variant="secondary" block>
          {t.otherMethod}
        </ButtonLink>
        <p className="text-center text-small text-ink-muted">
          {t.support}{" "}
          <a href={brand.telegramUrl} target="_blank" rel="noopener noreferrer">
            {t.supportLink}
          </a>
        </p>
      </div>
    </Page>
  );
}
