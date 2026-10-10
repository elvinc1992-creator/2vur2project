import { and, eq } from "drizzle-orm";
import type { Metadata } from "next";
import Link from "next/link";
import { logoutAction } from "@/app/(auth)/actions";
import { Page, Topbar } from "@/components/app/topbar";
import { ChevronIcon, LogoutIcon, PlusIcon, ReceiptIcon, RetryIcon } from "@/components/icons";
import { Button, ButtonLink } from "@/components/ui/button";
import { Card, KeyValues, Tag, eyebrowClass, listClass } from "@/components/ui/display";
import { az } from "@/content/az";
import { db } from "@/db";
import { oauthAccounts, users } from "@/db/schema";
import { resetDemoAction } from "@/lib/demo/actions";
import { CARD_LABEL } from "@/lib/demo/content";
import { addDays, formatDate } from "@/lib/demo/logic";
import { PLANS, priceOf } from "@/lib/demo/plans";
import { initials, requireDemo } from "@/lib/demo/session";
import { cn } from "@/lib/cn";
import { CancelSubscription } from "./cancel-subscription";
import { EmailForm, PhoneForm } from "./contact-forms";

export const metadata: Metadata = { title: az.app.profile.title };

export default async function ProfilePage() {
  const { user, state } = await requireDemo("/profil");
  // Profil məlumatları — real, DB-dən.
  const me = await db.query.users.findFirst({ where: eq(users.id, user.id) });
  const googleLinked = Boolean(
    await db.query.oauthAccounts.findFirst({
      where: and(eq(oauthAccounts.userId, user.id), eq(oauthAccounts.provider, "google")),
    }),
  );
  const t = az.app.profile;
  const target = me?.targetExam ? t.targets[me.targetExam] : "—";
  const active = state.sub.status === "active";
  const paidTier = state.sub.tier ?? "premium";

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
                    {[me?.name, me?.surname, me?.fatherName ? `(${me.fatherName})` : null].filter(Boolean).join(" ")}
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

            <section className="grid gap-2" aria-labelledby="p-contacts">
              <h2 id="p-contacts" className={eyebrowClass}>
                {t.contacts}
              </h2>
              <Card className="grid gap-5">
                {/* key: təsdiqdən sonra (yeni e-poçt) forma sıfırdan qurulur. */}
                <EmailForm
                  key={`${me?.email ?? ""}:${Boolean(me?.emailVerifiedAt)}`}
                  email={me?.email ?? null}
                  verified={Boolean(me?.email && me.emailVerifiedAt)}
                />
                <hr className="m-0 border-0 border-t border-line" />
                <PhoneForm phone={me?.phone ?? null} />
              </Card>
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
                      <span className="text-small text-ink-muted">{googleLinked ? me?.email : t.googleNone}</span>
                    </span>
                  </span>
                  <Tag tone={googleLinked ? "success" : "lock"}>{googleLinked ? t.googleLinked : t.googleNotLinked}</Tag>
                </div>
              </div>
            </section>
          </div>

          <div className="grid gap-6">
            <section className="grid gap-2" aria-labelledby="p-sub">
              <h2 id="p-sub" className={eyebrowClass}>
                {t.sections.subscription}
              </h2>
              {/* Abunə yoxdursa və ya ləğv edilibsə — Free plan (Pro/Premium təklifi). */}
              {!active ? (
                <Card className="grid gap-4">
                  <div className="flex items-center justify-between gap-3">
                    <b className="font-display text-lg leading-6 font-extrabold text-navy-900">{PLANS.free.name}</b>
                    <Tag tone="lock">{az.app.sub.free}</Tag>
                  </div>
                  <ul className="m-0 grid list-none gap-1 p-0 text-small text-ink">
                    {az.app.payment.planFeatures.free.map((f) => (
                      <li key={f}>· {f}</li>
                    ))}
                  </ul>
                  <div className="flex flex-wrap gap-2">
                    <ButtonLink href="/odenis?plan=pro" variant="navy" size="sm">
                      {PLANS.pro.name} · {az.app.payment.perMonth(priceOf("pro"))}
                    </ButtonLink>
                    <ButtonLink href="/odenis?plan=premium" variant="secondary" size="sm">
                      {PLANS.premium.name} · {az.app.payment.perMonth(priceOf("premium"))}
                    </ButtonLink>
                  </div>
                </Card>
              ) : (
                <Card className="grid gap-4">
                  <div className="flex items-center justify-between gap-3">
                    <b className="font-display text-lg leading-6 font-extrabold text-navy-900">{az.app.payment.planTitle(PLANS[paidTier].name, state.sub.period === "year")}</b>
                    <Tag tone="success">{t.active}</Tag>
                  </div>
                  <KeyValues
                    rows={[
                      [t.nextPayment, formatDate(addDays(state.sub.periodEnd, 1))],
                      [
                        t.amount,
                        state.sub.period === "year"
                          ? az.app.payment.perYear(priceOf(paidTier, "year"))
                          : az.app.payment.perMonth(priceOf(paidTier)),
                      ],
                      [t.method, CARD_LABEL],
                    ]}
                  />
                  <div className="flex flex-wrap items-center gap-3">
                    <CancelSubscription />
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
                      <b className="text-small">{p.amount ?? "—"}</b>
                      <ReceiptIcon />
                      <span className="sr-only">{t.receiptSr}</span>
                    </span>
                  </Link>
                ))}
              </div>
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
