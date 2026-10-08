import { SparkleIcon } from "@/components/icons";
import { az } from "@/content/az";

/** Demo məlumatlarla işləyən ekranlarda kiçik qeyd. */
export function DemoNote() {
  return (
    <p className="flex items-start gap-2 rounded-md border border-dashed border-navy-200 bg-white px-3 py-2 text-small text-ink-muted">
      <SparkleIcon className="mt-0.5 size-4 flex-none text-coral-600" />
      <span>
        <b className="text-navy-900">{az.app.demo.badge}.</b> {az.app.demo.note}
      </span>
    </p>
  );
}
