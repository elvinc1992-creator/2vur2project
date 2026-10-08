import katex from "katex";
import { Fragment } from "react";
import { splitMath } from "@/lib/math";

/**
 * Mətn + KaTeX düsturları (`$…$`) + `**qalın**`.
 * Render xətası olsa, xam mətn göstərilir (səhifə çökmür).
 */
export function MathText({
  text,
  className,
  displayStyle,
}: {
  text: string;
  className?: string;
  /** Kəsrlər tam ölçüdə (variantlar və cavablar üçün). */
  displayStyle?: boolean;
}) {
  const parts = splitMath(text).map((p, i) => {
    let node: React.ReactNode = p.value;
    if (p.kind === "math") {
      try {
        const html = katex.renderToString(displayStyle ? `\\displaystyle ${p.value}` : p.value, { throwOnError: true, output: "htmlAndMathml", strict: "ignore" });
        node = <span dangerouslySetInnerHTML={{ __html: html }} />;
      } catch {
        node = <code>{p.value}</code>;
      }
    }
    return p.bold ? <b key={i}>{node}</b> : <Fragment key={i}>{node}</Fragment>;
  });
  return className ? <span className={className}>{parts}</span> : <>{parts}</>;
}
