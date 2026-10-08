import { describe, expect, it } from "vitest";
import { az } from "@/content/az";
import { mailInboxUrl } from "@/lib/mail-link";
import { safeRedirect } from "@/lib/safe-redirect";
import { checkPassword, isPasswordAcceptable, passwordScore } from "./password-policy";
import { generateToken, hashToken } from "./tokens";
import { fieldErrors, loginSchema, registerSchema } from "./validation";

describe("şifrə qaydaları", () => {
  it("dizayndakı 4 şərti yoxlayır (Azərbaycan hərfləri ilə)", () => {
    expect(checkPassword("aysel2026")).toEqual({ length: true, cases: false, digit: true, symbol: false });
    expect(checkPassword("Şəhla2026!")).toEqual({ length: true, cases: true, digit: true, symbol: true });
    expect(checkPassword("Əli1")).toMatchObject({ length: false, cases: true, digit: true });
  });

  it("güc 0–4 arasıdır", () => {
    expect(passwordScore("")).toBe(0);
    expect(passwordScore("Aysel2026")).toBe(3);
    expect(passwordScore("Aysel2026!")).toBe(4);
  });

  it("simvol məcburi deyil, qalanlar məcburidir", () => {
    expect(isPasswordAcceptable("Aysel2026")).toBe(true);
    expect(isPasswordAcceptable("aysel2026")).toBe(false);
    expect(isPasswordAcceptable("Ay1")).toBe(false);
    expect(isPasswordAcceptable(`Aa1${"x".repeat(200)}`)).toBe(false);
  });
});

describe("qeydiyyat validasiyası", () => {
  const valid = {
    name: " Aysel ",
    username: "Aysel_M",
    email: " Aysel.M@Mail.AZ ",
    password: "Aysel2026",
    grade: "11",
    targetExam: "both",
    terms: "on",
  };

  it("e-poçt və istifadəçi adını normallaşdırır", () => {
    const r = registerSchema.parse(valid);
    expect(r).toMatchObject({ name: "Aysel", username: "aysel_m", email: "aysel.m@mail.az", grade: 11 });
  });

  it("xətaları Azərbaycan dilində, sahə üzrə qaytarır", () => {
    const r = registerSchema.safeParse({ ...valid, email: "yox", password: "aysel2026", terms: undefined });
    expect(r.success).toBe(false);
    if (r.success) return;
    expect(fieldErrors(r.error)).toEqual({
      email: az.errors.emailInvalid,
      password: az.errors.passwordWeak,
      terms: az.errors.termsRequired,
    });
  });

  it("səhv istifadəçi adını rədd edir", () => {
    for (const username of ["ab", "aysel m", "ayşel", "a".repeat(21)]) {
      expect(registerSchema.safeParse({ ...valid, username }).success).toBe(false);
    }
  });

  it("sinif yalnız 9/10/11", () => {
    expect(registerSchema.safeParse({ ...valid, grade: "12" }).success).toBe(false);
  });

  it("giriş identifikatorunu kiçik hərfə salır", () => {
    expect(loginSchema.parse({ identifier: " Aysel_M ", password: "x" }).identifier).toBe("aysel_m");
  });
});

describe("tokenlər", () => {
  it("təsadüfi və 256 bitlikdir", () => {
    const a = generateToken();
    expect(a).toMatch(/^[A-Za-z0-9_-]{43}$/);
    expect(generateToken()).not.toBe(a);
  });

  it("bazaya yalnız SHA-256 hash gedir", () => {
    const t = generateToken();
    expect(hashToken(t)).toMatch(/^[a-f0-9]{64}$/);
    expect(hashToken(t)).toBe(hashToken(t));
    expect(hashToken(t)).not.toContain(t);
  });
});

describe("safeRedirect", () => {
  it("daxili yollara icazə verir", () => {
    expect(safeRedirect("/panel")).toBe("/panel");
    expect(safeRedirect("/sinaq/3?x=1")).toBe("/sinaq/3?x=1");
  });

  it("xarici və şübhəli ünvanları rədd edir", () => {
    for (const v of ["https://evil.com", "//evil.com", "/\\evil.com", "panel", "/x\n", null, undefined]) {
      expect(safeRedirect(v)).toBe("/panel");
    }
  });
});

describe("Poçtu aç", () => {
  it("məşhur xidmətləri tanıyır, qalanında null", () => {
    expect(mailInboxUrl("a@gmail.com")).toBe("https://mail.google.com/");
    expect(mailInboxUrl("a@Mail.ru")).toBe("https://e.mail.ru/");
    expect(mailInboxUrl("a@mail.az")).toBeNull();
    expect(mailInboxUrl(null)).toBeNull();
  });
});
