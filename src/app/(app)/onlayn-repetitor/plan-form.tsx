import { Button } from "@/components/ui/button";
import { answerHeadClass } from "@/components/ui/question";
import { az } from "@/content/az";
import { cn } from "@/lib/cn";
import { saveTutorPlanAction } from "@/lib/repetitor/actions";

/** Həftənin dərs günlərini seçmək (bir və ya bir neçə). */
export function PlanForm({ defaultDays, submitLabel }: { defaultDays: number[]; submitLabel: string }) {
  const t = az.app.tutor;
  return (
    <form action={saveTutorPlanAction} className="grid gap-4">
      <fieldset className="m-0 grid min-w-0 gap-2 border-0 p-0">
        <legend className={cn(answerHeadClass, "mb-2 p-0")}>{t.planDaysLabel}</legend>
        <div className="grid grid-cols-2 gap-2 sm:grid-cols-4 lg:grid-cols-7">
          {t.weekdays.map((name, i) => (
            <label
              key={name}
              className={cn(
                "flex min-h-[48px] cursor-pointer items-center justify-center gap-2 rounded-md border-[1.5px] px-3 py-2 text-center text-small font-bold",
                "border-control-border bg-white text-navy-900 has-checked:border-navy-900 has-checked:bg-navy-900 has-checked:text-white",
                "has-focus-visible:outline-3 has-focus-visible:outline-offset-2 has-focus-visible:outline-navy-500",
              )}
            >
              <input
                type="checkbox"
                name="days"
                value={i + 1}
                defaultChecked={defaultDays.includes(i + 1)}
                className="sr-only"
              />
              {name}
            </label>
          ))}
        </div>
      </fieldset>
      <Button type="submit" className="justify-self-start">
        {submitLabel}
      </Button>
    </form>
  );
}
