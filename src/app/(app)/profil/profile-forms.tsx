"use client";

import { useState } from "react";
import { useFormAction } from "@/components/forms/use-form-action";
import { PlusIcon } from "@/components/icons";
import { Button } from "@/components/ui/button";
import { Segmented } from "@/components/ui/choice";
import { TextField } from "@/components/ui/field";
import { az } from "@/content/az";
import type { FormState } from "@/lib/auth/form-state";
import { saveGradeExamAction, saveGuardianAction } from "./actions";

const t = az.app.profile;

const GRADES = [
  { value: "9", label: "9" },
  { value: "10", label: "10" },
  { value: "11", label: "11" },
] as const;
const TARGETS = (["buraxilis", "qebul", "both"] as const).map((v) => ({ value: v, label: t.targets[v] }));

/**
 * Redaktə rejimi: açılanda cari cavab (state) yadda saxlanılır; yeni uğurlu cavab gələndə forma bağlanır,
 * xətada açıq qalır.
 */
function useEditing(state: FormState) {
  const [openedAt, setOpenedAt] = useState<FormState | null>(null);
  const editing = openedAt !== null && (openedAt === state || state.status === "error");
  return { editing, open: () => setOpenedAt(state), close: () => setOpenedAt(null) };
}

function Saved({ show }: { show: boolean }) {
  return show ? (
    <span role="status" className="text-small font-semibold text-success-700">
      {t.saved}
    </span>
  ) : null;
}

/** Sinif və imtahan — dəyişmək olur. */
export function GradeExamRow({ grade, target }: { grade: number | null; target: string | null }) {
  const { state, pending, formProps } = useFormAction(saveGradeExamAction);
  const { editing, open, close } = useEditing(state);

  if (!editing) {
    return (
      <div>
        <span>
          <span className="text-small text-ink-muted">{t.gradeExam}</span>
          <br />
          {t.gradeExamValue(grade, target ? t.targets[target] : "—")} <Saved show={state.notice === "grade_saved"} />
        </span>
        <Button type="button" variant="ghost" size="sm" onClick={open}>
          {t.change}
        </Button>
      </div>
    );
  }

  return (
    <form {...formProps} className="grid gap-4">
      <Segmented name="grade" label={t.gradeLabel} options={GRADES} defaultValue={grade ? String(grade) : undefined} error={state.fieldErrors?.grade} />
      <Segmented name="targetExam" label={t.targetLabel} options={TARGETS} defaultValue={target ?? undefined} error={state.fieldErrors?.targetExam} />
      <div className="flex flex-wrap gap-2">
        <Button type="submit" size="sm" loading={pending}>
          {t.save}
        </Button>
        <Button type="button" variant="ghost" size="sm" onClick={close}>
          {t.cancelEdit}
        </Button>
      </div>
    </form>
  );
}

/** Valideyn: ad və (istəyə bağlı) e-poçt — əlavə et, dəyiş, sil. */
export function GuardianRow({ name, email }: { name: string | null; email: string | null }) {
  const { state, pending, formProps } = useFormAction(saveGuardianAction);
  const remove = useFormAction(saveGuardianAction);
  const { editing, open, close } = useEditing(state);

  if (!editing) {
    return (
      <div>
        <span className="min-w-0">
          <span className="text-small text-ink-muted">{t.guardian}</span>
          <br />
          {name ? (
            <>
              {name}
              {email && <span className="text-small break-all text-ink-muted"> · {email}</span>}
            </>
          ) : (
            t.guardianNone
          )}{" "}
          <Saved show={state.notice === "guardian_saved"} />
        </span>
        {name ? (
          <span className="flex flex-none items-center gap-1">
            <Button type="button" variant="ghost" size="sm" onClick={open}>
              {t.change}
            </Button>
            <form {...remove.formProps}>
              <input type="hidden" name="remove" value="1" />
              <Button type="submit" variant="ghost" size="sm" loading={remove.pending}>
                {t.guardianRemove}
              </Button>
            </form>
          </span>
        ) : (
          <button
            type="button"
            onClick={open}
            aria-label={t.guardianAdd}
            title={t.guardianAdd}
            className="grid size-11 cursor-pointer place-items-center rounded-[12px] text-navy-900 hover:bg-navy-050"
          >
            <PlusIcon />
          </button>
        )}
      </div>
    );
  }

  return (
    <form {...formProps} className="grid gap-3">
      <TextField
        id="guardianName"
        name="guardianName"
        label={t.guardianNameLabel}
        autoComplete="off"
        maxLength={80}
        defaultValue={name ?? ""}
        error={state.fieldErrors?.guardianName}
      />
      <TextField
        id="guardianEmail"
        name="guardianEmail"
        type="email"
        label={t.guardianEmailLabel}
        inputMode="email"
        autoComplete="off"
        autoCapitalize="none"
        spellCheck={false}
        defaultValue={email ?? ""}
        error={state.fieldErrors?.guardianEmail}
      />
      <div className="flex flex-wrap gap-2">
        <Button type="submit" size="sm" loading={pending}>
          {t.save}
        </Button>
        <Button type="button" variant="ghost" size="sm" onClick={close}>
          {t.cancelEdit}
        </Button>
      </div>
    </form>
  );
}
