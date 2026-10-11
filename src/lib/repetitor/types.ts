import type { MatchingOptions, PracticeFormat } from "@/lib/bank/check";
import type { Letter } from "@/lib/demo/content";

// Onlayn repetitor: təhlil nəticəsində imtahanda çıxma ehtimalı yüksək olan suallar.
// Suallar müəllifin sual bankından (bank_tasks) gəlir — bax: source.ts.

export type RepetitorTopic = {
  /** Statistikadakı mövzunun slug-ı (/statistika/[slug] ilə eyni). */
  slug: string;
  name: string;
};

/** Brauzerə gedə bilən hissə — cavab, ipucu və həll yoxdur. */
export type RepetitorQuestion = {
  id: string;
  topic: string;
  type: string;
  /** Təhlilə görə bu tip keçmiş imtahanlarda neçə dəfə çıxıb. */
  freq: number;
  text: string;
  /** Sualın şəkli (/images/tasks/KOD.png) və təsviri. */
  imageUrl?: string | null;
  imageAlt?: string | null;
  format: PracticeFormat;
  /** Yalnız qapalı suallarda (A–E). */
  options?: Record<Letter, string>;
  /** Yalnız uyğunluq suallarında. */
  matching?: MatchingOptions;
  /** Yazılı sualın yekun cavabı ədəd deyil (isbat) — şagird həllə baxıb özünü yoxlayır. */
  selfCheck?: boolean;
  /** Toplu istinadı: "2025 toplu, II hissə, səh.210 №4–9". */
  ref: string;
};

/** Yalnız serverdə: düzgün cavab, ipucu (istəyəndə) və addım-addım izah. */
export type RepetitorKey = {
  format: PracticeFormat;
  /** closed: hərf; open/written: ədəd(lər); matching: "1:ad;2:b…". */
  answer: string;
  /** Ekranda göstərilən düzgün cavab. */
  answerText: string;
  selfCheck: boolean;
  hint: string;
  steps: string[];
};
