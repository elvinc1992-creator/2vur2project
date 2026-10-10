import type { Letter } from "@/lib/demo/content";

// Sınaqların brauzerə gedə bilən tipləri (cavab açarı yoxdur).

export type ExamFormat = "closed" | "coded" | "written";
export type ExamType = "9" | "11" | "blok";

export type ExamMeta = {
  id: string;
  title: string;
  /** "11-ci sinif buraxılış" */
  group: string;
  durationMin: number;
  blueprintKey: string;
  examType: ExamType;
  number: number;
  total: number;
  counts: Record<ExamFormat, number>;
  status: "published" | "draft";
};

export type ExamQuestion = {
  /** İmtahan kitabçasındakı nömrə (9-cu sinif: 61–85). */
  n: number;
  code: string;
  format: ExamFormat;
  /** Mövzu (slug) və adı. */
  topic: string;
  topicName: string;
  /** Alt mövzu (sual tipi). */
  type: string;
  text: string;
  options?: Record<Letter, string>;
  imageUrl?: string | null;
  imageAlt?: string | null;
  ref: string;
};

/** Yalnız serverdə: düzgün cavab (hərf və ya ədəd) və həll. */
export type ExamKey = { code: string; format: ExamFormat; answer: string; steps: string[] };

export const EXAM_TYPE_OF: Record<string, ExamType> = { "buraxilis-9": "9", "buraxilis-11": "11", "qebul-11": "blok" };
