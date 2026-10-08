import type { Letter } from "@/lib/demo/content";

// Onlayn repetitor: təhlil nəticəsində imtahanda çıxma ehtimalı yüksək olan suallar.
// Bu tiplər admin panelindəki formanın və gələcək DB cədvəlinin (tutor_questions) əsasıdır.

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
  options: Record<Letter, string>;
  /** Toplu istinadı: "2025 toplu, II hissə, səh.210 №4–9". */
  ref: string;
};

/** Yalnız serverdə: düzgün cavab, ipucu (istəyəndə) və addım-addım izah. */
export type RepetitorKey = {
  answer: Letter;
  hint: string;
  steps: string[];
};
