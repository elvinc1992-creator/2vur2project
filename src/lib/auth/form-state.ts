export type FormState = {
  status: "idle" | "error" | "success";
  fieldErrors?: Partial<Record<string, string>>;
  formError?: string;
  /** Formanın altında əlavə izah üçün (məs. "Yeni istifadəçisən?"). */
  notice?: "not_found" | "unverified" | "email_taken" | "code_sent" | "email_verified" | "phone_saved";
  /** Kod göndərilmiş e-poçt (profil: e-poçt təsdiqi). */
  pendingEmail?: string;
  /** Kodun göndərildiyi an (geri sayımı yenidən başlatmaq üçün). */
  sentAt?: number;
  /** "Yenidən göndər" üçün gözləmə müddəti, saniyə. */
  cooldown?: number;
};

export const initialFormState: FormState = { status: "idle" };
