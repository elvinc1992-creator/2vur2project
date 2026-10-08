import "server-only";

export const features = {
  // Valideyn razılığı axını hüquqşünasla dəqiqləşənə qədər söndürülüb (TZ, qayda 7).
  guardianConsent: process.env.FEATURE_GUARDIAN_CONSENT === "true",
  google: Boolean(process.env.GOOGLE_CLIENT_ID && process.env.GOOGLE_CLIENT_SECRET),
} as const;
