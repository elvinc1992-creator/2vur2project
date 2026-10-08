import { describe, expect, it } from "vitest";
import { latexToText, splitMath } from "./math";

describe("splitMath", () => {
  it("mətn, düstur və qalın hissələrə bölür", () => {
    expect(splitMath("Cəm: $\\frac{1}{2}$ = **1**.")).toEqual([
      { kind: "text", value: "Cəm: ", bold: false },
      { kind: "math", value: "\\frac{1}{2}", bold: false },
      { kind: "text", value: " = ", bold: false },
      { kind: "text", value: "1", bold: true },
      { kind: "text", value: ".", bold: false },
    ]);
  });
  it("düsturu olmayan mətn olduğu kimi qalır", () => {
    expect(splitMath("80 ədədinin 15%-i")).toEqual([{ kind: "text", value: "80 ədədinin 15%-i", bold: false }]);
  });
});

describe("latexToText (aria-label üçün)", () => {
  it.each([
    ["$\\frac{1}{2}$", "1/2"],
    ["$\\frac{\\sqrt{3}}{2}$", "√3/2"],
    ["$\\sin 30^\\circ + \\cos 60^\\circ$", "sin 30° + cos 60°"],
    ["$\\sin^2\\alpha$", "sin²α"],
    ["$\\log_2 8$", "log₂ 8"],
    ["$15\\pi$", "15π"],
    ["$-1$", "-1"],
    ["$0{,}96$", "0,96"],
    ["16%", "16%"],
  ])("%s → %s", (input, out) => {
    expect(latexToText(input)).toBe(out);
  });
});
