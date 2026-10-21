// "AI analiz" bölməsi və sual kartlarındakı "AI analizi" nişanı — mətnlər.

/** Ümumi təhlil həcmi — bütün AI səhifələrində eyni. */
export const AI_BASIS = { exams: "100+", questions: "30000+", years: "2016–2026" };

export const aiText = {
  nav: "AI analiz",
  navHint: "Süni intellekt necə işləyir",
  children: [
    { href: "/suni-intellekt", label: "Necə işləyir" },
    { href: "/suni-intellekt/tipler", label: "Sual tipləri" },
    { href: "/suni-intellekt/menim", label: "Mənim analizim" },
  ],

  badge: {
    title: "AI analizi",
    topic: "Mövzu",
    type: "Tip",
    subtype: "Alt tip",
    freq: "Düşmə tezliyi",
    levels: { high: "Yüksək", mid: "Orta", low: "Aşağı" },
    shownLine: (n: number) => `DİM imtahanlarında bu tipdən ${n} sual düşüb.`,
    typeLink: "Bu tipdən suallar",
    proto: (exams: string[]) =>
      `Bu sualın toplu prototipi DİM imtahanında eyni və ya çox yaxın formada düşüb: ${exams.slice(0, 3).join("; ")}${exams.length > 3 ? ` və daha ${exams.length - 3}` : ""}.`,
    basis: `Hesablama: ${AI_BASIS.exams} DİM imtahanının ${AI_BASIS.questions} sualının təsnifatı əsasında (${AI_BASIS.years}).`,
    more: "Necə hesablanır?",
  },

  how: {
    title: "AI analiz",
    h1: "2vur2 süni intellekti necə işləyir?",
    lead: "Keçmiş DİM imtahanlarının hər sualını təsnif edib hansı tiplərin daha tez-tez düşdüyünü hesablayır və hazırlığını bu ehtimala görə qurur.",
    badge: "Xarici AI xidməti yoxdur — hər şey real imtahan məlumatından",
    pipelineTitle: "Analiz addım-addım",
    steps: [
      { title: "Toplama", text: "Son illərin DİM imtahan sualları toplanır" },
      { title: "Emal", text: "Sualın mətni, rəqəmləri və şəkli emal olunur" },
      { title: "Təsnifat", text: "Hər sual mövzu, tip və alt tipə ayrılır, toplu tapşırığı ilə tutuşdurulur" },
      { title: "Tezlik", text: "Hər tipin neçə imtahanda və hansı illərdə düşdüyü hesablanır" },
      { title: "Tövsiyə", text: "Sənin cavabların tezliklə müqayisə edilib prioritet plan qurulur" },
    ],
    modelTitle: "Modelin içində",
    modelLead: "Neyron şəbəkə sualı təsnif edir, model nəticələrdən öyrənir, suallar düşmə tezliyinə görə qruplara ayrılır və hər sual üçün cavab hazırlanır.",
    modelNote: "Sxematik təsvir: modelin işləmə prinsipi göstərilir.",
    numbersTitle: "Canlı rəqəmlər",
    numbers: {
      exams: "təhlil olunan DİM imtahanı",
      questions: "təsnif olunmuş imtahan sualı",
      mapped: "sual tipə bağlanıb",
      types: "sual tipi",
    },
    numbersNote: `İmtahan illəri: ${AI_BASIS.years}. Rəqəmlər saatda bir yenilənir.`,
    methodTitle: "Düşmə tezliyi necə hesablanır?",
    method: [
      "Hər imtahan sualı toplunun hansı səhifəsinə uyğun gəlirsə, həmin səhifənin bölməsi sualın tipi sayılır.",
      "Tipin tezliyi — onun düşdüyü fərqli imtahanların sayıdır (bir imtahanda bir neçə dəfə düşsə də, bir dəfə sayılır).",
    ],
    levelsText: [
      { level: "high" as const, text: "70 və daha çox imtahanda" },
      { level: "mid" as const, text: "20–70 imtahanda" },
      { level: "low" as const, text: "19 və daha az imtahanda" },
    ],
    topTitle: "Ən çox düşən 5 tip",
    topAll: "Bütün tiplər",
    exampleTitle: "Sual kartında belə görünür",
    exampleNote: "Bu nişan günün suallarında, repetitorda, sınaqlarda, nəticələrdə və imtahan qarşılığında hər sualın üstündədir.",
    mine: "Mənim analizimə bax",
    noAnswers: "Düzgün cavablar və həllər sual cavablanmamış brauzerə göndərilmir — analiz yalnız təsnifatı göstərir.",
  },

  types: {
    title: "Sual tipləri",
    h1: "Sual tipləri və düşmə tezliyi",
    lead: `${AI_BASIS.exams} DİM imtahanında (${AI_BASIS.years}) hər tipdən neçə sual düşdüyü. Tipə toxun — uyğun suallar açılsın.`,
    all: "Hamısı",
    filter: "Mövzu üzrə süz",
    sort: "Ən çox düşəndən aza doğru",
    shown: (n: number) => `${n} sual`,
    empty: "Bu mövzuda tip tapılmadı.",
  },

  type: {
    back: "Sual tipləri",
    shown: "DİM imtahanlarında bu tipdən düşən sual",
    level: "Düşmə tezliyi",
    period: `${AI_BASIS.exams} imtahan, ${AI_BASIS.years}`,
    questions: "Bu tipdən suallar",
    open: "Həll et",
    none: "Bu tipdən saytda hələ sual yoxdur.",
    locked: "Suallar onlayn repetitorda açılır.",
  },

  mine: {
    title: "Mənim analizim",
    h1: "Sənin AI analizin",
    lead: "Cavabların hər sual tipinin imtahanda düşmə tezliyi ilə müqayisə olunur: tez-tez düşən və səhv etdiyin tiplər öndədir.",
    priorityTitle: "Əvvəlcə bunları işlə",
    strongTitle: "Güclü tərəflərin",
    row: (correct: number, total: number) => `${correct} / ${total} düz`,
    score: "Prioritet",
    empty: "Hələ analiz üçün kifayət qədər cavab yoxdur. Günün suallarını və ya repetitoru həll et — analiz avtomatik qurulacaq.",
    start: "Günün suallarına keç",
    basis: (answers: number) => `${answers} cavabın əsasında.`,
  },
};
