"use client";

import { useActionState } from "react";
import { registerContestAction, type RegisterState } from "@/lib/contest/actions";
import { cn } from "@/lib/cn";

type Defaults = { firstName: string; lastName: string; email: string; grade: number | null };

const field =
  "min-h-12 w-full rounded-[12px] border-[1.5px] border-[#e6e9f2] bg-[#fbfcfe] px-3.5 text-[15px] text-[#0f1b3d] outline-none focus:border-[#8b5cf6] focus:bg-white aria-invalid:border-[#dc2626]";
const label = "grid gap-1.5 text-[13px] font-bold text-[#5b6785]";

/** Qeydiyyat forması: hesabdan avtomatik doldurulur, bütün xanalar redaktə edilir. */
export function ContestRegisterForm({ contestId, defaults, autofilled }: { contestId: string; defaults: Defaults; autofilled: boolean }) {
  const [state, action, pending] = useActionState<RegisterState, FormData>(registerContestAction.bind(null, contestId), null);

  if (state?.ok) {
    return (
      <div role="status" className="grid gap-3 rounded-[24px] border border-[#e6e9f2] bg-white p-6 text-center">
        <div className="text-[56px]" aria-hidden="true">🎉</div>
        <h3 className="m-0 text-[22px] font-black text-[#0f1b3d]">{state.already ? "Artıq qeydiyyatdasan" : "Qeydiyyat tamamlandı!"}</h3>
        <p className="m-0 text-[#5b6785]">
          Nəticələr <b className="text-[#0f1b3d]">{state.email}</b> ünvanına göndəriləcək. Sənin dəvət kodun:
        </p>
        <div className="rounded-[12px] bg-[#f5f3ff] px-3 py-2.5 font-mono text-[26px] font-bold text-[#0f1b3d]">{state.code}</div>
        <p className="m-0 text-[#5b6785]">Kodu dostlarınla paylaş, mükafat fondunu birlikdə böyüdək.</p>
      </div>
    );
  }

  const err = state && !state.ok ? state : null;
  const invalid = (k: string) => (err?.fields?.[k] ? true : undefined);

  return (
    <form action={action} noValidate className="grid gap-3.5 rounded-[24px] border border-[#e6e9f2] bg-white p-6">
      {autofilled && (
        <p className="m-0 rounded-[12px] border border-[#a7f3d0] bg-[#ecfdf5] px-3 py-2.5 text-[13.5px] font-semibold text-[#047857]">
          👤 Məlumatlar hesabından götürüldü. Lazım olsa, dəyişə bilərsən.
        </p>
      )}
      <div className="grid gap-3 sm:grid-cols-2">
        <label className={label}>
          Ad
          <input name="firstName" required defaultValue={defaults.firstName} autoComplete="given-name" aria-invalid={invalid("firstName")} placeholder="Adın" className={field} />
        </label>
        <label className={label}>
          Soyad
          <input name="lastName" required defaultValue={defaults.lastName} autoComplete="family-name" aria-invalid={invalid("lastName")} placeholder="Soyadın" className={field} />
        </label>
      </div>
      <div className="grid gap-3 sm:grid-cols-2">
        <label className={label}>
          Sinif
          <select name="grade" required defaultValue={defaults.grade ?? ""} aria-invalid={invalid("grade")} className={field}>
            <option value="">Seç</option>
            <option value="9">IX sinif</option>
            <option value="10">X sinif</option>
            <option value="11">XI sinif</option>
          </select>
        </label>
        <label className={label}>
          Rayon / şəhər
          <input name="region" required aria-invalid={invalid("region")} placeholder="Məs. Bakı, Nəsimi" className={field} />
        </label>
      </div>
      <label className={label}>
        Məktəb (könüllü)
        <input name="school" placeholder="Məs. 132 nömrəli məktəb" className={field} />
      </label>
      <label className={label}>
        E-poçt
        <input name="email" type="email" required defaultValue={defaults.email} autoComplete="email" aria-invalid={invalid("email")} placeholder="ad@mail.com" className={field} />
      </label>
      <label className={label}>
        Dəvət kodu (könüllü)
        <input name="invite" placeholder="Dostunun kodu, məs. 2V2-K7F3Q" className={cn(field, "uppercase")} />
      </label>
      <label className="flex items-start gap-2.5 text-[13.5px] font-medium text-[#0f1b3d]">
        <input type="checkbox" name="agreeRules" required className="mt-0.5 size-[18px] accent-[#8b5cf6]" />
        Yarışın qaydaları ilə tanış oldum və razıyam.
      </label>
      <label className="flex items-start gap-2.5 text-[13.5px] font-medium text-[#0f1b3d]">
        <input type="checkbox" name="agreeEmail" defaultChecked className="mt-0.5 size-[18px] accent-[#8b5cf6]" />
        Nəticələrin e-poçtuma göndərilməsinə razıyam.
      </label>
      <label className="flex items-start gap-2.5 text-[13.5px] font-medium text-[#0f1b3d]">
        <input type="checkbox" name="agreeParent" required className="mt-0.5 size-[18px] accent-[#8b5cf6]" />
        18 yaşım tamam olmayıbsa, valideynim iştirakıma razıdır.
      </label>
      <p role="alert" className="m-0 min-h-[18px] text-[13px] font-semibold text-[#dc2626]">
        {err?.error}
      </p>
      <button
        type="submit"
        disabled={pending}
        className="inline-flex min-h-[52px] cursor-pointer items-center justify-center rounded-[14px] bg-[linear-gradient(135deg,#6366f1,#8b5cf6_55%,#ec4899)] px-5 font-extrabold text-white shadow-[0_14px_28px_-14px_rgba(139,92,246,.8)] disabled:opacity-70"
      >
        {pending ? "Göndərilir…" : "Qeydiyyatdan keç →"}
      </button>
    </form>
  );
}
