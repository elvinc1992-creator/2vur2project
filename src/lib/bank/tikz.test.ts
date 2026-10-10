import { readFileSync } from "node:fs";
import { describe, expect, it } from "vitest";
import { parseTikz } from "./tikz";

describe("parseTikz", () => {
  it("koordinatlar, cycle, kəsik xətt və nöqtə adları", () => {
    const f = parseTikz(
      String.raw`\begin{tikzpicture}[scale=1]\coordinate(A)at(0,0);\coordinate(B)at(2,2);\draw(A)--(B)--(4,0)--cycle;\draw[dashed](B)--(2,0);\node[below left]at(A){$A$};\node at(1,1){$6\sqrt2$};\end{tikzpicture}`,
    )!;
    expect(f.polylines).toEqual([
      { points: [{ x: 0, y: 0 }, { x: 2, y: 2 }, { x: 4, y: 0 }], closed: true, dashed: false },
      { points: [{ x: 2, y: 2 }, { x: 2, y: 0 }], closed: false, dashed: true },
    ]);
    expect(f.labels).toEqual([
      { at: { x: 0, y: 0 }, anchor: "below left", text: "$A$" },
      { at: { x: 1, y: 1 }, anchor: "center", text: "$6\\sqrt2$" },
    ]);
    expect(f.box).toEqual({ minX: 0, minY: 0, maxX: 4, maxY: 2 });
  });

  it("düzbucaqlı və çevrə", () => {
    const f = parseTikz(String.raw`\begin{tikzpicture}\draw(0,0)rectangle(2,1);\draw(0,0)circle(2);\end{tikzpicture}`)!;
    expect(f.polylines[0].points).toHaveLength(4);
    expect(f.circles).toEqual([{ c: { x: 0, y: 0 }, r: 2, dashed: false }]);
    expect(f.box).toEqual({ minX: -2, minY: -2, maxX: 2, maxY: 2 });
  });

  it("dəstəklənməyən əmr → null", () => {
    expect(parseTikz(String.raw`\begin{tikzpicture}\fill(0,0)circle(1);\end{tikzpicture}`)).toBeNull();
    expect(parseTikz("şəkil yoxdur")).toBeNull();
  });

  it("imtahan faylındakı bütün şəkillər oxunur", () => {
    const items = JSON.parse(readFileSync("topic_questions/imtahan_27_movzu_numune_suallar.json", "utf8")) as {
      qarsiligi: { sekil_tikz?: string };
    }[];
    const figs = items.map((x) => x.qarsiligi.sekil_tikz).filter(Boolean) as string[];
    expect(figs.length).toBeGreaterThan(0);
    for (const s of figs) expect(parseTikz(s)).not.toBeNull();
  });
});
