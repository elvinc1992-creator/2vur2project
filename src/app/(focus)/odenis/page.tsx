import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { Page, Topbar } from "@/components/app/topbar";
import { CheckIcon, LockIcon, ShieldIcon } from "@/components/icons";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { Card, KeyValues, Placeholder } from "@/components/ui/display";
import { az } from "@/content/az";
import { mockPayAction } from "@/lib/demo/actions";
import { PRICE_PLACEHOLDER } from "@/lib/demo/content";
import { findExam } from "@/lib/demo/logic";
import { requireDemo } from "@/lib/demo/session";
import { cn } from "@/lib/cn";

export const metadata: Metadata = { title: az.app.payment.title };

export default async function PaymentPage(props: PageProps<"/odenis">) {
  const sp = await props.searchParams;
  const examId = typeof sp.exam === "string" ? sp.exam : null;
  const exam = examId ? findExam(examId) : undefined;
  if (examId && !exam) notFound();
  await requireDemo(`/odenis${examId ? `?exam=${examId}` : ""}`);
  const t = az.app.payment;
  const kind = exam ? "exam" : "monthly";
  const title = exam ? exam.title : t.monthly;

  return (
    <>
      <Topbar title={t.title} back={exam ? "/sinaqlar" : "/profil"} />
      <Page>
        <form action={mockPayAction} className="mx-auto grid w-full max-w-[560px] gap-4">
          <h1 className="sr-only">
            {t.title}: {title}
          </h1>
          <input type="hidden" name="kind" value={kind} />
          {exam && <input type="hidden" name="exam" value={exam.id} />}

          <Card tone="tint" className="grid gap-2 !p-4">
            <span className="text-small text-ink-muted">{t.selected}</span>
            <div className="flex items-center justify-between gap-3">
              <b className="font-display text-lg leading-6 font-extrabold text-navy-900">{title}</b>
              <Link href={exam ? "/sinaqlar" : "/profil"} className="text-small font-semibold">
                {t.change}
              </Link>
            </div>
            <div className="flex items-center justify-between gap-3 text-small">
              <span className="text-ink-muted">{exam ? t.examNote : t.monthlyNote}</span>
              <b className="whitespace-nowrap">{exam ? PRICE_PLACEHOLDER : t.perMonth(PRICE_PLACEHOLDER)}</b>
            </div>
          </Card>

          <fieldset className="m-0 grid min-w-0 gap-2 border-0 p-0">
            <legend className="mb-2 p-0 text-label font-semibold text-ink">{t.method}</legend>
            {t.methods.map((m, i) => (
              <label
                key={m.id}
                className={cn(
                  "group flex min-h-16 cursor-pointer items-center gap-2.5 rounded-md border-[1.5px] border-control-border bg-white px-3 py-2 text-navy-900",
                  "has-checked:border-navy-900 has-checked:bg-navy-900 has-checked:text-white",
                  "has-focus-visible:outline-3 has-focus-visible:outline-offset-2 has-focus-visible:outline-navy-500",
                )}
              >
                <input type="radio" name="method" value={m.id} defaultChecked={i === 0} className="peer sr-only" />
                <span
                  aria-hidden="true"
                  className="grid size-[22px] flex-none place-items-center rounded-full border-2 border-control-border bg-white text-navy-900 group-has-checked:border-white [&>svg]:opacity-0 group-has-checked:[&>svg]:opacity-100"
                >
                  <CheckIcon className="size-4" />
                </span>
                <span className="grid gap-0.5 text-left">
                  <b>{m.title}</b>
                  <span className="text-small font-normal">{m.sub}</span>
                </span>
              </label>
            ))}
          </fieldset>

          <Placeholder className="min-h-[150px]">{t.providerPlaceholder}</Placeholder>

          <div className="grid gap-2 rounded-lg border border-line bg-white p-5">
            <KeyValues
              rows={[
                [title, PRICE_PLACEHOLDER],
                [t.discount, "—"],
              ]}
            />
            <hr className="my-1 w-full border-0 border-t border-dashed border-control-border" />
            <dl className="m-0 grid grid-cols-[1fr_auto] gap-3">
              <dt className="font-bold text-ink">{t.total}</dt>
              <dd className="m-0 font-display text-lg leading-6 font-extrabold">{PRICE_PLACEHOLDER}</dd>
            </dl>
          </div>

          {sp.consent === "0" && <Alert tone="danger">{t.consentRequired}</Alert>}
          <label className="flex min-h-12 cursor-pointer items-start gap-3 py-1">
            <input type="checkbox" name="consent" defaultChecked className="peer sr-only" />
            <span
              aria-hidden="true"
              className="grid size-6 flex-none place-items-center rounded-[7px] border-2 border-control-border bg-white text-white peer-checked:border-navy-900 peer-checked:bg-navy-900 peer-focus-visible:outline-3 peer-focus-visible:outline-offset-2 peer-focus-visible:outline-navy-500 [&>svg]:opacity-0 peer-checked:[&>svg]:opacity-100"
            >
              <CheckIcon className="size-4" />
            </span>
            <span className="text-small">
              {exam ? t.consentExam : t.consentMonthly}{" "}
              <Link href="/geri-qaytarma" target="_blank">
                {t.refund}
              </Link>
            </span>
          </label>

          <Button type="submit" variant="primary" block>
            <LockIcon />
            {t.pay(PRICE_PLACEHOLDER)}
          </Button>
          <p className="flex items-start justify-center gap-2 text-small text-ink-muted">
            <ShieldIcon className="mt-px size-[18px] flex-none" />
            {t.safe}
          </p>
          <p className="text-center text-small text-ink-muted">
            {t.mockNote}{" "}
            <Link href={`/odenis/ugursuz${exam ? `?exam=${exam.id}` : ""}`}>{t.demoFail}</Link>
          </p>
        </form>
      </Page>
    </>
  );
}
