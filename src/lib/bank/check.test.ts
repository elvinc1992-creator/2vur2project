import { describe, expect, it } from "vitest";
import {
  acceptsAnswer,
  checkAnswer,
  decodeMatching,
  encodeMatching,
  isSelfCheck,
  isValidGiven,
  matchingKey,
  parseNumber,
  readFormAnswer,
} from "./check";

const open = (answer: string) => ({ format: "open" as const, answer, selfCheck: false });

describe("bank cavabının yoxlanması", () => {
  it("ədədlər: vergül/nöqtə, kəsr, mənfi işarəsi", () => {
    expect(parseNumber("23,8")).toBe(23.8);
    expect(parseNumber(" −3 ")).toBe(-3);
    expect(parseNumber("1/36")).toBeCloseTo(1 / 36);
    expect(parseNumber("abc")).toBeNull();
    expect(checkAnswer(open("23,8"), "23.8")).toBe(true);
    expect(checkAnswer(open("1,5"), "3/2")).toBe(true);
    expect(checkAnswer(open("40"), "41")).toBe(false);
  });

  it("bir neçə cavab: sıra fərq etmir, say uyğun olmalıdır", () => {
    expect(checkAnswer(open("3;-1"), "-1; 3")).toBe(true);
    expect(checkAnswer(open("3;-1"), "3")).toBe(false);
  });

  it("qapalı və uyğunluq", () => {
    expect(checkAnswer({ format: "closed", answer: "B", selfCheck: false }, "B")).toBe(true);
    expect(checkAnswer({ format: "closed", answer: "B", selfCheck: false }, "skip")).toBe(false);
    const key = matchingKey('{"1": ["a", "d"], "2": ["b"], "3": ["c", "e"]}');
    expect(key).toBe("1:ad;2:b;3:ce");
    expect(checkAnswer({ format: "matching", answer: key, selfCheck: false }, encodeMatching({ 3: ["e", "c"], 1: ["d", "a"], 2: ["b"] }))).toBe(true);
    expect(checkAnswer({ format: "matching", answer: key, selfCheck: false }, "1:a;2:b;3:ce")).toBe(false);
    expect(decodeMatching("1:ad;2:")).toEqual({ 1: ["a", "d"], 2: [] });
  });

  it("isbat — özünüyoxlama: əvvəl 'self', sonra bir dəfə qiymət", () => {
    expect(isSelfCheck("written", "İsbat")).toBe(true);
    expect(isSelfCheck("written", "1/36")).toBe(false);
    const key = { format: "written" as const, answer: "İsbat", selfCheck: true };
    expect(isValidGiven("written", true, "12")).toBe(false);
    expect(checkAnswer(key, "self")).toBe(false);
    expect(checkAnswer(key, "self:1")).toBe(true);
    expect(acceptsAnswer("self", "self:1")).toBe(true);
    expect(acceptsAnswer("self:0", "self:1")).toBe(false);
    expect(acceptsAnswer("B", "C")).toBe(false);
  });

  it("formadan oxuma: açıq sahə və uyğunluq qutuları", () => {
    const form = new FormData();
    form.set("q-x", " 12 ");
    form.append("q-m-1", "a");
    form.append("q-m-1", "d");
    form.append("q-m-2", "b");
    expect(readFormAnswer(form, "q-x", { format: "open" })).toBe("12");
    const matching = { left: [{ key: "1", text: "" }, { key: "2", text: "" }], right: [] };
    expect(readFormAnswer(form, "q-m", { format: "matching", matching })).toBe("1:ad;2:b");
    expect(readFormAnswer(form, "q-y", { format: "open" })).toBeNull();
  });
});
