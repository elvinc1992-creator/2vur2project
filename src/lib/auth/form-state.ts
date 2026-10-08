export type FormState = {
  status: "idle" | "error" | "success";
  fieldErrors?: Partial<Record<string, string>>;
  formError?: string;
  /** Formanın altında əlavə izah üçün (məs. "Yeni istifadəçisən?"). */
  notice?: "not_found" | "unverified" | "email_taken";
  /** "Yenidən göndər" üçün gözləmə müddəti, saniyə. */
  cooldown?: number;
};

export const initialFormState: FormState = { status: "idle" };
