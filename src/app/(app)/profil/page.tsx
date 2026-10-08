import { eq } from "drizzle-orm";
import type { Metadata } from "next";
import Link from "next/link";
import { logoutAction } from "@/app/(auth)/actions";
import { Page, Topbar } from "@/components/app/topbar";
import { ChevronIcon, LogoutIcon, PlusIcon, ReceiptIcon, RetryIcon } from "@/components/icons";
import { Button, ButtonLink } from "@/components/ui/button";
import { Card, KeyValues, Tag, eyebrowClass, listClass } from "@/components/ui/display";
import { az } from "@/content/az";
import { db } from "@/db";
import { users } from "@/db/schema";
import { resetDemoAction, resumeSubscriptionAction, toggleFreePlanAction } from "@/lib/demo/actions";
import { CARD_LABEL, PRICE_PLACEHOLDER } from "@/lib/demo/content";
import { addDays, formatDate } from "@/lib/demo/logic";
import { initials, requireDemo } from "@/lib/demo/session";
import { cn } from "@/lib/cn";
import { CancelSubscription } from "./cancel-subscription";

export const metadata: Metadata = { title: az.app.profile.title };

export default async function ProfilePage() {
  const { user, state } = await requireDemo("/profil");
  // Profil məlumatları — real, DB-dən.
  const me = await db.query.users.findFirst({ where: eq(users.id, user.id) });
  const t = az.app.profile;
  const target = me?.targetExam ? t.targets[me.targetExam] : "—";
  const active = state.sub.status === "active";
  const none = state.sub.status === "none";

  return (
    <>
      <Topbar title={t.title} avatar={initials(user.name)} />
      <Page>
        <div className="flex items-center gap-3">
          <span className="grid size-16 flex-none place-items-center rounded-full bg-navy-100 font-display text-2xl font-extrabold text-navy-900">
            {initials(me?.name)}
          </span>
          <div className="min-w-0">
            <h1 className="font-display text-h3 font-bold text-navy-900">{me?.name}</h1>
            <p className="text-small text-ink-muted">
              {t.meta(me?.username ?? null, me?.grade ?? null, target)}
            </p>
          </div>
        </div>

        <div className="grid items-start gap-6 lg:grid-cols-[1.6fr_1fr]">
          <div className="grid gap-6">
            <section className="grid gap-2" aria-labelledby="p-profile">
              <h2 id="p-profile" className={eyebrowClass}>
                {t.sections.profile}
              </h2>
              <div className={listClass}>
                <div>
                  <span>
                    <span className="text-small text-ink-muted">{t.name}</span>
                    <br />
                    {me?.name}
                  </span>
                </div>
                <div>
                  <span className="min-w-0 break-all">
                    <span className="text-small text-ink-muted">{t.email}</span>
                    <br />
                    {me?.email}
                  </span>
                </div>
                <div>
                  <span>
                    <span className="text-small text-ink-muted">{t.gradeExam}</span>
                    <br />
                    {t.gradeExamValue(me?.grade ?? null, target)}
                  </span>
                </div>
                <div>
                  <span>
                    <span className="text-small text-ink-muted">{t.guardian}</span>
                    <br />
                    {t.guardianNone}
                  </span>
                  <button
                    type="button"
                    disabled
                    aria-label={t.guardianAdd}
                    title={t.googleSoon}
                    className="grid size-11 cursor-not-allowed place-items-center rounded-[12px] text-ink-muted"
                  >
                    <PlusIcon />
                  </button>
                </div>
              </div>
            </section>

            <section className="grid gap-2" aria-labelledby="p-sec">
              <h2 id="p-sec" className={eyebrowClass}>
                {t.sections.security}
              </h2>
              <div className={listClass}>
                <Link href="/sifre-berpasi" className="text-ink">
                  <span>{t.changePassword}</span>
                  <ChevronIcon />
                </Link>
                <div>
                  <span className="flex items-center gap-2.5">
                    <span
                      aria-hidden="true"
                      className="grid size-5 place-items-center rounded-full border-[1.5px] border-dashed border-[#747775] text-[11px] font-bold text-[#747775]"
                    >
                      G
                    </span>
                    <span>
                      {t.google}
                      <br />
                      <span className="text-small text-ink-muted">{t.googleNone}</span>
                    </span>
                  </span>
                  <Tag tone="lock">{t.googleSoon}</Tag>
                </div>
              </div>
            </section>
          </div>

          <div className="grid gap-6">
            <section className="grid gap-2" aria-labelledby="p-sub">
              <h2 id="p-sub" className={eyebrowClass}>
                {t.sections.subscription}
              </h2>
              {none ? (
                <Card className="grid gap-4">
                  <div className="flex items-center justify-between gap-3">
                    <b className="font-display text-lg leading-6 font-extrabold text-navy-900">{t.noSub}</b>
                    <Tag tone="lock">{az.app.sub.free}</Tag>
                  </div>
                  <p className="text-small text-ink-muted">{t.noSubText}</p>
                  <ButtonLink href="/odenis" variant="navy" size="sm" className="justify-self-start">
                    {t.subscribe}
                  </ButtonLink>
                </Card>
              ) : (
                <Card className="grid gap-4">
                  <div className="flex items-center justify-between gap-3">
                    <b className="font-display text-lg leading-6 font-extrabold text-navy-900">{t.plan}</b>
                    <Tag tone={active ? "success" : "warning"}>{active ? t.active : t.canceled}</Tag>
                  </div>
                  <KeyValues
                    rows={[
                      active
                        ? [t.nextPayment, formatDate(addDays(state.sub.periodEnd, 1))]
                        : [t.accessUntil, formatDate(state.sub.periodEnd)],
                      [t.amount, PRICE_PLACEHOLDER],
                      [t.method, CARD_LABEL],
                    ]}
                  />
                  <div className="flex flex-wrap items-center gap-3">
                    <Button type="button" variant="secondary" size="sm" disabled>
                      {t.changeMethod}
                    </Button>
                    {active ? (
                      <CancelSubscription periodEnd={formatDate(state.sub.periodEnd)} />
                    ) : (
                      <form action={resumeSubscriptionAction}>
                        <Button type="submit" size="sm">
                          {t.resume}
                        </Button>
                      </form>
                    )}
                  </div>
                </Card>
              )}
            </section>

            <section className="grid gap-2" aria-labelledby="p-hist">
              <h2 id="p-hist" className={eyebrowClass}>
                {t.sections.history}
              </h2>
              {state.payments.length === 0 && (
                <p className="rounded-lg border border-line bg-white px-4 py-3.5 text-small text-ink-muted">
                  {t.noPayments}
                </p>
              )}
              <div className={cn(listClass, state.payments.length === 0 && "hidden")}>
                {state.payments.map((p) => (
                  <Link key={p.id} href={`/odenis/ugurlu?r=${p.id}`} className="text-ink">
                    <span>
                      {p.title}
                      <br />
                      <span className="text-small text-ink-muted tabular">{formatDate(p.date)}</span>
                    </span>
                    <span className="flex items-center gap-2">
                      <b className="text-small">{PRICE_PLACEHOLDER}</b>
                      <ReceiptIcon />
                      <span className="sr-only">{t.receiptSr}</span>
                    </span>
                  </Link>
                ))}
              </div>
            </section>

            <section className="grid gap-2" aria-labelledby="p-demo">
              <h2 id="p-demo" className={eyebrowClass}>
                {az.app.demo.badge}
              </h2>
              <form
                action={toggleFreePlanAction}
                className="flex items-center justify-between gap-3 rounded-lg border border-line bg-white p-4"
              >
                <span className="grid gap-0.5">
                  <span className="font-semibold text-ink">{az.app.demo.freePlan}</span>
                  <span className="text-small text-ink-muted">{az.app.demo.freePlanHint}</span>
                </span>
                <Button
                  type="submit"
                  variant={state.free ? "navy" : "secondary"}
                  size="sm"
                  aria-pressed={Boolean(state.free)}
                >
                  {state.free ? az.app.demo.on : az.app.demo.off}
                </Button>
              </form>
            </section>

            <form action={logoutAction}>
              <Button type="submit" variant="ghost" block>
                <LogoutIcon />
                {t.logout}
              </Button>
            </form>
            <form action={resetDemoAction}>
              <Button type="submit" variant="ghost" size="sm" block className="text-ink-muted!">
                <RetryIcon />
                {az.app.demo.reset}
              </Button>
            </form>
          </div>
        </div>
      </Page>
    </>
  );
}
