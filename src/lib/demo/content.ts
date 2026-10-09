// DEMO MƏZMUN — dizayndakı nümunələr əsasında. Excel/DB gələndə əvəz olunacaq.
// Burada düzgün cavab və həll YOXDUR (onlar ./keys.ts-də, yalnız serverdə).

export const LETTERS = ["A", "B", "C", "D", "E"] as const;
export type Letter = (typeof LETTERS)[number];

export type TopicSlug = "faiz" | "funksiya" | "triqonometriya" | "ucbucaq" | "loqarifm" | "ardicilliq" | "feza";

export type IconKey = "percent" | "function" | "angle" | "triangle" | "root" | "sigma" | "cube";

export const TOPICS: Record<TopicSlug, { name: string; icon: IconKey }> = {
  faiz: { name: "Faiz və nisbət", icon: "percent" },
  funksiya: { name: "Funksiyalar", icon: "function" },
  triqonometriya: { name: "Triqonometriya", icon: "angle" },
  ucbucaq: { name: "Üçbucaqlar", icon: "triangle" },
  loqarifm: { name: "Loqarifmlər", icon: "root" },
  ardicilliq: { name: "Ardıcıllıqlar", icon: "sigma" },
  feza: { name: "Fəza fiqurları", icon: "cube" },
};

/* ---------------- Günün sualları ---------------- */

export type DailyQuestion = {
  id: string;
  topic: TopicSlug;
  type: string;
  /** İmtahanda neçə dəfə çıxıb (demo rəqəm). */
  freq: number;
  text: string;
  options: Record<Letter, string>;
  /** "Bu tipi toplu üzrə işlə" istinadı. */
  ref: string;
  /** Şəkil/çertyoj (varsa). Yoxdursa, yer tutucu da göstərilmir. */
  image?: string;
};

/** Bu günün mövzuları: 7 mövzu × 10 sual. */
export const DAILY_TOPICS: TopicSlug[] = ["triqonometriya", "loqarifm", "feza", "faiz", "funksiya", "ucbucaq", "ardicilliq"];

/** Free planda günün hər mövzusunun ilk N sualı açıqdır, qalanları Pro/Premium ilə (serverdə yoxlanılır). */
export const FREE_DAILY_PER_TOPIC = 2;
/** Hər gün sual bankından təsadüfi seçilən mövzu və hər mövzudan sual sayı. */
export const DAILY_TOPICS_PER_DAY = 4;
export const DAILY_PER_TOPIC = 5;

export const DAILY: DailyQuestion[] = [
  // Triqonometriya
  { id: "t1", topic: "triqonometriya", type: "Əsas bucaqlar", freq: 3, ref: "2025 toplu, I hissə, səh.92 №1–6",
    text: "$\\sin 30^\\circ + \\cos 60^\\circ$ ifadəsinin qiymətini tapın.",
    options: { A: "0", B: "$\\frac{1}{2}$", C: "1", D: "$\\frac{\\sqrt{3}}{2}$", E: "$\\sqrt{3}$" } },
  { id: "t2", topic: "triqonometriya", type: "Əsas eynilik", freq: 4, ref: "2025 toplu, I hissə, səh.94 №2–8",
    text: "$\\sin^2\\alpha + \\cos^2\\alpha$ ifadəsinin qiyməti neçədir?",
    options: { A: "1", B: "0", C: "2", D: "$\\sin 2\\alpha$", E: "$-1$" } },
  { id: "t3", topic: "triqonometriya", type: "Əsas eynilik", freq: 4, ref: "2025 toplu, I hissə, səh.94 №2–8",
    text: "$\\sin\\alpha = \\frac{3}{5}$ və $\\alpha$ iti bucaqdır. $\\cos\\alpha$-nı tapın.",
    options: { A: "$\\frac{3}{4}$", B: "$\\frac{4}{5}$", C: "$\\frac{3}{5}$", D: "$\\frac{5}{4}$", E: "$\\frac{1}{5}$" } },
  { id: "t4", topic: "triqonometriya", type: "İkiqat bucaq düsturları", freq: 2, ref: "2023 toplu, II hissə, səh.88 №3–9",
    text: "$2\\sin 15^\\circ \\cdot \\cos 15^\\circ$ ifadəsinin qiymətini tapın.",
    options: { A: "1", B: "$\\frac{\\sqrt{3}}{2}$", C: "$\\frac{1}{4}$", D: "$\\frac{1}{2}$", E: "$\\frac{\\sqrt{2}}{2}$" } },
  { id: "t5", topic: "triqonometriya", type: "İkiqat bucaq düsturları", freq: 2, ref: "2023 toplu, II hissə, səh.88 №3–9",
    text: "$\\sin\\alpha = \\frac{1}{2}$ olarsa, $\\cos 2\\alpha$-nı tapın.",
    options: { A: "0", B: "$\\frac{1}{4}$", C: "$\\frac{1}{2}$", D: "$\\frac{3}{4}$", E: "1" } },
  { id: "t6", topic: "triqonometriya", type: "Əsas bucaqlar", freq: 3, ref: "2025 toplu, I hissə, səh.92 №1–6",
    text: "$\\operatorname{tg} 45^\\circ + \\cos 0^\\circ$ ifadəsinin qiymətini tapın.",
    options: { A: "0", B: "1", C: "2", D: "$\\sqrt{2}$", E: "$\\frac{1}{2}$" } },
  { id: "t7", topic: "triqonometriya", type: "Gətirmə düsturları", freq: 3, ref: "2025 toplu, I hissə, səh.97 №1–8",
    text: "$\\sin 150^\\circ$ ifadəsinin qiymətini tapın.",
    options: { A: "$-\\frac{1}{2}$", B: "$\\frac{1}{2}$", C: "$\\frac{\\sqrt{3}}{2}$", D: "$-\\frac{\\sqrt{3}}{2}$", E: "1" } },
  { id: "t8", topic: "triqonometriya", type: "Gətirmə düsturları", freq: 3, ref: "2025 toplu, I hissə, səh.97 №1–8",
    text: "$\\cos 120^\\circ$ ifadəsinin qiymətini tapın.",
    options: { A: "$\\frac{1}{2}$", B: "$-\\frac{\\sqrt{3}}{2}$", C: "$-\\frac{1}{2}$", D: "$\\frac{\\sqrt{3}}{2}$", E: "0" } },
  { id: "t9", topic: "triqonometriya", type: "Triqonometrik tənliklər", freq: 2, ref: "2023 toplu, II hissə, səh.91 №1–6",
    text: "$\\sin x = 1$ tənliyinin $[0^\\circ; 360^\\circ)$ aralığındakı həllini tapın.",
    options: { A: "$0^\\circ$", B: "$45^\\circ$", C: "$90^\\circ$", D: "$180^\\circ$", E: "$270^\\circ$" } },
  { id: "t10", topic: "triqonometriya", type: "Əsas eynilik", freq: 4, ref: "2025 toplu, I hissə, səh.94 №2–8",
    text: "$\\operatorname{tg}\\alpha = 2$ olarsa, $\\operatorname{ctg}\\alpha$-nı tapın.",
    options: { A: "2", B: "$-2$", C: "$\\frac{1}{2}$", D: "$-\\frac{1}{2}$", E: "4" } },
  // Loqarifmlər
  { id: "l1", topic: "loqarifm", type: "Loqarifmin tərifi", freq: 3, ref: "2025 toplu, I hissə, səh.108 №1–5",
    text: "$\\log_2 8$ ifadəsinin qiymətini tapın.",
    options: { A: "2", B: "3", C: "4", D: "8", E: "16" } },
  { id: "l2", topic: "loqarifm", type: "Loqarifmin tərifi", freq: 3, ref: "2025 toplu, I hissə, səh.108 №1–5",
    text: "$\\log_3 81$ ifadəsinin qiymətini tapın.",
    options: { A: "3", B: "9", C: "27", D: "4", E: "2" } },
  { id: "l3", topic: "loqarifm", type: "Onluq loqarifm", freq: 1, ref: "2025 toplu, I hissə, səh.110 №7–9",
    text: "$\\lg 1000$ ifadəsinin qiymətini tapın.",
    options: { A: "1", B: "2", C: "3", D: "10", E: "100" } },
  { id: "l4", topic: "loqarifm", type: "Loqarifmik tənliklər", freq: 4, ref: "2025 toplu, I hissə, səh.112 №1–6",
    text: "$\\log_2 x = 5$ olarsa, $x$-i tapın.",
    options: { A: "10", B: "25", C: "16", D: "32", E: "64" } },
  { id: "l5", topic: "loqarifm", type: "Loqarifmin xassələri", freq: 3, ref: "2023 toplu, I hissə, səh.71 №4–10",
    text: "$\\log_6 4 + \\log_6 9$ ifadəsinin qiymətini tapın.",
    options: { A: "1", B: "2", C: "3", D: "13", E: "36" } },
  { id: "l6", topic: "loqarifm", type: "Loqarifmin xassələri", freq: 3, ref: "2023 toplu, I hissə, səh.71 №4–10",
    text: "$\\log_2 48 - \\log_2 3$ ifadəsinin qiymətini tapın.",
    options: { A: "4", B: "3", C: "16", D: "45", E: "5" } },
  { id: "l7", topic: "loqarifm", type: "Loqarifmin tərifi", freq: 3, ref: "2025 toplu, I hissə, səh.108 №1–5",
    text: "$\\log_5 \\frac{1}{25}$ ifadəsinin qiymətini tapın.",
    options: { A: "2", B: "$-2$", C: "$\\frac{1}{2}$", D: "$-\\frac{1}{2}$", E: "$-5$" } },
  { id: "l8", topic: "loqarifm", type: "Əsas loqarifmik eynilik", freq: 2, ref: "2025 toplu, I hissə, səh.109 №6–10",
    text: "$3^{\\log_3 7}$ ifadəsinin qiymətini tapın.",
    options: { A: "3", B: "7", C: "21", D: "$\\log_3 7$", E: "10" } },
  { id: "l9", topic: "loqarifm", type: "Loqarifmik tənliklər", freq: 4, ref: "2025 toplu, I hissə, səh.112 №1–6",
    text: "$\\log_3 (x - 2) = 2$ tənliyini həll edin.",
    options: { A: "8", B: "9", C: "11", D: "6", E: "4" } },
  { id: "l10", topic: "loqarifm", type: "Üstlü tənliklər", freq: 3, ref: "2023 toplu, I hissə, səh.75 №1–8",
    text: "$2^{x+1} = 16$ tənliyini həll edin.",
    options: { A: "2", B: "3", C: "4", D: "8", E: "15" } },
  // Fəza fiqurları
  { id: "s1", topic: "feza", type: "Kub", freq: 5, ref: "2025 toplu, II hissə, səh.201 №1–7",
    text: "Tili 3 sm olan kubun həcmi neçə sm³-dir?",
    options: { A: "9", B: "18", C: "27", D: "54", E: "81" } },
  { id: "s2", topic: "feza", type: "Kub", freq: 5, ref: "2025 toplu, II hissə, səh.201 №1–7",
    text: "Tili 2 sm olan kubun tam səthinin sahəsi neçə sm²-dir?",
    options: { A: "8", B: "12", C: "16", D: "24", E: "48" } },
  { id: "s3", topic: "feza", type: "Düzbucaqlı paralelepiped", freq: 4, ref: "2025 toplu, II hissə, səh.204 №3–9",
    text: "Ölçüləri 2 sm, 3 sm və 4 sm olan düzbucaqlı paralelepipedin həcmi neçə sm³-dir?",
    options: { A: "24", B: "9", C: "12", D: "20", E: "26" } },
  { id: "s4", topic: "feza", type: "Silindr", freq: 3, ref: "2023 toplu, II hissə, səh.176 №2–8",
    text: "Oturacağının radiusu 3 sm, hündürlüyü 5 sm olan silindrin həcmini tapın.",
    options: { A: "$15\\pi$", B: "$30\\pi$", C: "$45\\pi$", D: "$75\\pi$", E: "$9\\pi$" } },
  { id: "s5", topic: "feza", type: "Kürə", freq: 2, ref: "2023 toplu, II hissə, səh.182 №1–5",
    text: "Radiusu 3 sm olan kürənin həcmini tapın ($V = \\frac{4}{3}\\pi R^3$).",
    options: { A: "$12\\pi$", B: "$27\\pi$", C: "$36\\pi$", D: "$108\\pi$", E: "$9\\pi$" } },
  { id: "s6", topic: "feza", type: "Kub", freq: 5, ref: "2025 toplu, II hissə, səh.201 №1–7",
    text: "Kubun həcmi 64 sm³-dir. Onun tili neçə sm-dir?",
    options: { A: "4", B: "8", C: "16", D: "6", E: "32" } },
  { id: "s7", topic: "feza", type: "Konus", freq: 3, ref: "2023 toplu, II hissə, səh.179 №1–6",
    text: "Oturacağının radiusu 3 sm, hündürlüyü 4 sm olan konusun həcmini tapın.",
    options: { A: "$12\\pi$", B: "$36\\pi$", C: "$16\\pi$", D: "$9\\pi$", E: "$48\\pi$" } },
  { id: "s8", topic: "feza", type: "Silindr", freq: 3, ref: "2023 toplu, II hissə, səh.176 №2–8",
    text: "Oturacağının radiusu 2 sm, hündürlüyü 5 sm olan silindrin yan səthinin sahəsini tapın.",
    options: { A: "$10\\pi$", B: "$20\\pi$", C: "$28\\pi$", D: "$40\\pi$", E: "$14\\pi$" } },
  { id: "s9", topic: "feza", type: "Kürə", freq: 2, ref: "2023 toplu, II hissə, səh.182 №1–5",
    text: "Radiusu 5 sm olan kürənin səthinin sahəsini tapın ($S = 4\\pi R^2$).",
    options: { A: "$25\\pi$", B: "$50\\pi$", C: "$100\\pi$", D: "$\\frac{500}{3}\\pi$", E: "$20\\pi$" } },
  { id: "s10", topic: "feza", type: "Düzbucaqlı paralelepiped", freq: 4, ref: "2025 toplu, II hissə, səh.204 №3–9",
    text: "Ölçüləri 2 sm, 3 sm və 6 sm olan düzbucaqlı paralelepipedin diaqonalını tapın.",
    options: { A: "11", B: "7", C: "$\\sqrt{11}$", D: "6", E: "$\\sqrt{13}$" } },
  // Faiz və nisbət
  { id: "f1", topic: "faiz", type: "Sadə və mürəkkəb faiz", freq: 3, ref: "2025 toplu, I hissə, səh.140 №1–6",
    text: "80 ədədinin 15%-i neçədir?",
    options: { A: "10", B: "12", C: "14", D: "15", E: "16" } },
  { id: "f2", topic: "faiz", type: "Ardıcıl faiz artımı", freq: 2, ref: "2025 toplu, I hissə, səh.146 №11–15",
    text: "Malın qiyməti əvvəlcə 45% artırıldı, sonra 20% endirildi. Qiymət ilkin qiymətə nəzərən neçə faiz dəyişdi?",
    options: { A: "12%", B: "20%", C: "16%", D: "18%", E: "24%" } },
  { id: "f3", topic: "faiz", type: "Faizlə müqayisə", freq: 3, ref: "2025 toplu, I hissə, səh.143 №4–9",
    text: "Qiymət 250 manatdan 200 manata endi. Qiymət neçə faiz azaldı?",
    options: { A: "15%", B: "20%", C: "25%", D: "30%", E: "50%" } },
  { id: "f4", topic: "faiz", type: "Faizlə müqayisə", freq: 3, ref: "2025 toplu, I hissə, səh.143 №4–9",
    text: "A ədədi B-dən 25% böyükdür. B ədədi A-dan neçə faiz kiçikdir?",
    options: { A: "15%", B: "20%", C: "25%", D: "30%", E: "75%" } },
  { id: "f5", topic: "faiz", type: "Sadə və mürəkkəb faiz", freq: 3, ref: "2025 toplu, I hissə, səh.140 №1–6",
    text: "1000 manat illik 10% mürəkkəb faizlə banka qoyuldu. 2 ildən sonra məbləğ neçə manat olar?",
    options: { A: "1100", B: "1200", C: "1210", D: "1221", E: "1331" } },
  { id: "f6", topic: "faiz", type: "Faizlə müqayisə", freq: 3, ref: "2025 toplu, I hissə, səh.143 №4–9",
    text: "Hansı ədədin 30%-i 45-ə bərabərdir?",
    options: { A: "135", B: "150", C: "15", D: "75", E: "1350" } },
  { id: "f7", topic: "faiz", type: "Nisbət və tənasüb", freq: 4, ref: "2025 toplu, I hissə, səh.136 №1–8",
    text: "$\\frac{x}{12} = \\frac{5}{4}$ tənasübündən $x$-i tapın.",
    options: { A: "10", B: "12", C: "15", D: "16", E: "20" } },
  { id: "f8", topic: "faiz", type: "Nisbət və tənasüb", freq: 4, ref: "2025 toplu, I hissə, səh.136 №1–8",
    text: "60 manat iki nəfər arasında 2 : 3 nisbətində bölündü. Çox pay alan neçə manat aldı?",
    options: { A: "24", B: "30", C: "36", D: "40", E: "20" } },
  { id: "f9", topic: "faiz", type: "Ardıcıl faiz artımı", freq: 2, ref: "2025 toplu, I hissə, səh.146 №11–15",
    text: "Qiymət əvvəlcə 20% artırıldı, sonra 20% endirildi. Son qiymət ilkin qiymətə nəzərən necə dəyişdi?",
    options: { A: "Dəyişmədi", B: "4% artdı", C: "4% azaldı", D: "2% azaldı", E: "40% azaldı" } },
  { id: "f10", topic: "faiz", type: "Faizlə müqayisə", freq: 3, ref: "2025 toplu, I hissə, səh.143 №4–9",
    text: "Məhsulun qiyməti 40 manatdan 50 manata qalxdı. Qiymət neçə faiz artdı?",
    options: { A: "10%", B: "20%", C: "25%", D: "40%", E: "80%" } },
  // Funksiyalar
  { id: "fn1", topic: "funksiya", type: "Funksiyanın qiyməti", freq: 4, ref: "2025 toplu, I hissə, səh.60 №1–8",
    text: "$f(x) = 3x - 1$ olarsa, $f(2)$-ni tapın.",
    options: { A: "4", B: "5", C: "6", D: "7", E: "1" } },
  { id: "fn2", topic: "funksiya", type: "Funksiyanın qiyməti", freq: 4, ref: "2025 toplu, I hissə, səh.60 №1–8",
    text: "$f(x) = x^2 - 2x$ olarsa, $f(-1)$-i tapın.",
    options: { A: "$-1$", B: "1", C: "3", D: "$-3$", E: "0" } },
  { id: "fn3", topic: "funksiya", type: "Xətti funksiya", freq: 3, ref: "2023 toplu, I hissə, səh.52 №1–6",
    text: "$y = 2x - 4$ düz xəttinin $Oy$ oxu ilə kəsişmə nöqtəsinin ordinatını tapın.",
    options: { A: "2", B: "$-2$", C: "4", D: "$-4$", E: "0" } },
  { id: "fn4", topic: "funksiya", type: "Xətti funksiya", freq: 3, ref: "2023 toplu, I hissə, səh.52 №1–6",
    text: "$y = kx + 1$ düz xətti $A(2;\\, 7)$ nöqtəsindən keçir. $k$-nı tapın.",
    options: { A: "2", B: "3", C: "4", D: "6", E: "$\\frac{7}{2}$" } },
  { id: "fn5", topic: "funksiya", type: "Kvadrat funksiya", freq: 4, ref: "2025 toplu, I hissə, səh.66 №2–10",
    text: "$y = x^2 - 6x + 8$ parabolasının təpə nöqtəsinin absisini tapın.",
    options: { A: "$-3$", B: "2", C: "3", D: "4", E: "6" } },
  { id: "fn6", topic: "funksiya", type: "Kvadrat funksiya", freq: 4, ref: "2025 toplu, I hissə, səh.66 №2–10",
    text: "$y = x^2 - 5x + 6$ funksiyasının sıfırlarının cəmini tapın.",
    options: { A: "5", B: "$-5$", C: "6", D: "$-6$", E: "1" } },
  { id: "fn7", topic: "funksiya", type: "Təyin oblastı", freq: 2, ref: "2025 toplu, I hissə, səh.58 №1–7",
    text: "$y = \\sqrt{x - 3}$ funksiyasının təyin oblastını tapın.",
    options: { A: "$x > 3$", B: "$x \\ge 3$", C: "$x \\le 3$", D: "$x \\ge 0$", E: "$x \\ne 3$" } },
  { id: "fn8", topic: "funksiya", type: "Təyin oblastı", freq: 2, ref: "2025 toplu, I hissə, səh.58 №1–7",
    text: "$y = \\frac{5}{x + 2}$ funksiyası $x$-in hansı qiymətində təyin olunmayıb?",
    options: { A: "$-2$", B: "2", C: "0", D: "5", E: "$-5$" } },
  { id: "fn9", topic: "funksiya", type: "Funksiyanın qiyməti", freq: 4, ref: "2025 toplu, I hissə, səh.60 №1–8",
    text: "$f(x) = 2^x$ olarsa, $f(3) - f(1)$ ifadəsinin qiymətini tapın.",
    options: { A: "2", B: "4", C: "6", D: "8", E: "10" } },
  { id: "fn10", topic: "funksiya", type: "Kvadrat funksiya", freq: 4, ref: "2025 toplu, I hissə, səh.66 №2–10",
    text: "$y = -x^2 + 4x$ funksiyasının ən böyük qiymətini tapın.",
    options: { A: "2", B: "4", C: "8", D: "0", E: "16" } },
  // Üçbucaqlar
  { id: "u1", topic: "ucbucaq", type: "Bucaqların cəmi", freq: 4, ref: "2025 toplu, II hissə, səh.150 №1–5",
    text: "Üçbucağın iki bucağı 45° və 75°-dir. Üçüncü bucağı tapın.",
    options: { A: "50°", B: "60°", C: "70°", D: "80°", E: "120°" } },
  { id: "u2", topic: "ucbucaq", type: "Bərabəryanlı üçbucaq", freq: 3, ref: "2025 toplu, II hissə, səh.152 №1–6",
    text: "Bərabəryanlı üçbucağın təpə bucağı 40°-dir. Oturacaq bucağını tapın.",
    options: { A: "40°", B: "60°", C: "70°", D: "80°", E: "140°" } },
  { id: "u3", topic: "ucbucaq", type: "Pifaqor teoremi", freq: 5, ref: "2025 toplu, II hissə, səh.154 №2–9",
    text: "Katetləri 5 və 12 olan düzbucaqlı üçbucağın hipotenuzunu tapın.",
    options: { A: "13", B: "17", C: "15", D: "$\\sqrt{119}$", E: "11" } },
  { id: "u4", topic: "ucbucaq", type: "Pifaqor teoremi", freq: 5, ref: "2025 toplu, II hissə, səh.154 №2–9",
    text: "Düzbucaqlı üçbucağın hipotenuzu 10, katetlərindən biri 6-dır. Digər kateti tapın.",
    options: { A: "4", B: "6", C: "8", D: "$2\\sqrt{34}$", E: "16" } },
  { id: "u5", topic: "ucbucaq", type: "Üçbucağın sahəsi", freq: 4, ref: "2025 toplu, II hissə, səh.158 №1–6",
    text: "Katetləri 6 və 9 olan düzbucaqlı üçbucağın sahəsini tapın.",
    options: { A: "15", B: "27", C: "54", D: "30", E: "18" } },
  { id: "u6", topic: "ucbucaq", type: "Üçbucağın sahəsi", freq: 4, ref: "2025 toplu, II hissə, səh.158 №1–6",
    text: "Üçbucağın iki tərəfi 8 və 5, onlar arasındakı bucaq 30°-dir. Üçbucağın sahəsini tapın.",
    options: { A: "10", B: "20", C: "40", D: "$10\\sqrt{3}$", E: "13" } },
  { id: "u7", topic: "ucbucaq", type: "Bərabərtərəfli üçbucaq", freq: 3, ref: "2023 toplu, II hissə, səh.127 №1–5",
    text: "Tərəfi 4 olan bərabərtərəfli üçbucağın hündürlüyünü tapın.",
    options: { A: "2", B: "$2\\sqrt{2}$", C: "$2\\sqrt{3}$", D: "$4\\sqrt{3}$", E: "$\\sqrt{3}$" } },
  { id: "u8", topic: "ucbucaq", type: "Orta xətt", freq: 2, ref: "2023 toplu, II hissə, səh.129 №2–6",
    text: "Üçbucağın bir tərəfi 14-dür. Bu tərəfə paralel orta xəttin uzunluğunu tapın.",
    options: { A: "7", B: "14", C: "28", D: "3,5", E: "21" } },
  { id: "u9", topic: "ucbucaq", type: "Kosinuslar teoremi", freq: 3, ref: "2023 toplu, II hissə, səh.131 №1–7",
    text: "Üçbucağın iki tərəfi 3 və 5, onlar arasındakı bucaq 120°-dir. Üçüncü tərəfi tapın.",
    options: { A: "7", B: "8", C: "$\\sqrt{19}$", D: "$\\sqrt{34}$", E: "6" } },
  { id: "u10", topic: "ucbucaq", type: "Xarici bucaq", freq: 2, ref: "2025 toplu, II hissə, səh.150 №1–5",
    text: "Üçbucağın xarici bucağı 110°, ona qonşu olmayan daxili bucaqlardan biri 40°-dir. Digər daxili bucağı tapın.",
    options: { A: "40°", B: "60°", C: "70°", D: "110°", E: "30°" } },
  // Ardıcıllıqlar
  { id: "a1", topic: "ardicilliq", type: "Ədədi silsilə", freq: 4, ref: "2025 toplu, I hissə, səh.120 №1–8",
    text: "Ədədi silsilədə $a_1 = 5$, $d = 3$. $a_6$-nı tapın.",
    options: { A: "18", B: "20", C: "23", D: "15", E: "8" } },
  { id: "a2", topic: "ardicilliq", type: "Ədədi silsilə", freq: 4, ref: "2025 toplu, I hissə, səh.120 №1–8",
    text: "Ədədi silsilədə $a_3 = 10$, $a_7 = 22$. Silsilənin fərqini tapın.",
    options: { A: "2", B: "3", C: "4", D: "6", E: "12" } },
  { id: "a3", topic: "ardicilliq", type: "Ədədi silsilənin cəmi", freq: 3, ref: "2025 toplu, I hissə, səh.122 №1–6",
    text: "Ədədi silsilədə $a_1 = 2$, $a_{10} = 20$. İlk 10 həddin cəmini tapın.",
    options: { A: "100", B: "110", C: "120", D: "220", E: "22" } },
  { id: "a4", topic: "ardicilliq", type: "Ədədi silsilənin cəmi", freq: 3, ref: "2025 toplu, I hissə, səh.122 №1–6",
    text: "1-dən 50-yə qədər bütün natural ədədlərin cəmini tapın.",
    options: { A: "1250", B: "1275", C: "1300", D: "2550", E: "1225" } },
  { id: "a5", topic: "ardicilliq", type: "Həndəsi silsilə", freq: 3, ref: "2025 toplu, I hissə, səh.124 №1–7",
    text: "Həndəsi silsilədə $b_1 = 3$, $q = 2$. $b_5$-i tapın.",
    options: { A: "24", B: "30", C: "48", D: "96", E: "15" } },
  { id: "a6", topic: "ardicilliq", type: "Həndəsi silsilə", freq: 3, ref: "2025 toplu, I hissə, səh.124 №1–7",
    text: "Həndəsi silsilə: $81;\\ 27;\\ 9;\\ \\ldots$ Silsilənin vuruğunu tapın.",
    options: { A: "3", B: "$\\frac{1}{3}$", C: "$-3$", D: "$\\frac{1}{9}$", E: "$-\\frac{1}{3}$" } },
  { id: "a7", topic: "ardicilliq", type: "Həndəsi silsilənin cəmi", freq: 2, ref: "2023 toplu, I hissə, səh.96 №1–6",
    text: "Həndəsi silsilədə $b_1 = 1$, $q = 2$. İlk 5 həddin cəmini tapın.",
    options: { A: "16", B: "31", C: "32", D: "63", E: "15" } },
  { id: "a8", topic: "ardicilliq", type: "Sonsuz azalan həndəsi silsilə", freq: 2, ref: "2023 toplu, I hissə, səh.96 №1–6",
    text: "Sonsuz azalan həndəsi silsilədə $b_1 = 6$, $q = \\frac{1}{2}$. Silsilənin cəmini tapın.",
    options: { A: "3", B: "6", C: "9", D: "12", E: "24" } },
  { id: "a9", topic: "ardicilliq", type: "Ədədi silsilə", freq: 4, ref: "2025 toplu, I hissə, səh.120 №1–8",
    text: "Ədədi silsilədə $a_1 = 40$, $d = -3$. Silsilənin neçənci həddi 1-ə bərabərdir?",
    options: { A: "12", B: "13", C: "14", D: "15", E: "39" } },
  { id: "a10", topic: "ardicilliq", type: "Ardıcıllığın düsturu", freq: 2, ref: "2025 toplu, I hissə, səh.118 №1–5",
    text: "$a_n = n^2 - 1$ ardıcıllığının 5-ci həddini tapın.",
    options: { A: "9", B: "24", C: "25", D: "26", E: "16" } },
];

/** Panel: "Tiplər üzrə proqres" bu mövzu üçün göstərilir. */
export const PROGRESS_TOPIC: TopicSlug = "faiz";

/** Həftə günləri (bazar ertəsindən). */
export const WEEK_LABELS = ["B.e", "Ç.a", "Ç", "C.a", "C", "Ş", "B"];

/* ---------------- Sınaqlar ---------------- */

export type ExamFormat = "closed" | "coded" | "written";

export type ExamQuestion = {
  n: number;
  format: ExamFormat;
  topic: TopicSlug;
  type: string;
  text: string;
  options?: Record<Letter, string>;
  ref: string;
  image?: string;
};

export type ExamMeta = { id: string; title: string; group: string; durationMin: number };

/** Demo: müddət real dəyər gələnə qədər 90 dəqiqə. */
export const EXAMS: ExamMeta[] = [1, 2, 3, 4].map((n) => ({
  id: String(n),
  title: `Buraxılış sınağı №${n}`,
  group: "Buraxılış · 11-ci sinif",
  durationMin: 90,
}));

export const EXAM_FORMAT = { closed: 13, coded: 5, written: 7 };

/** Kodlaşdırılan cavabın xana sayı — sual ekranı və cavab vərəqi eyni sabitdən istifadə edir. */
export const CODE_LEN = 6;

const d = (id: string) => DAILY.find((q) => q.id === id)!;
const fromDaily = (n: number, id: string): ExamQuestion => {
  const q = d(id);
  return { n, format: "closed", topic: q.topic, type: q.type, text: q.text, options: q.options, ref: q.ref };
};

/** Bütün demo sınaqlar eyni 25 sualı istifadə edir (13 + 5 + 7). */
export const EXAM_QUESTIONS: ExamQuestion[] = [
  fromDaily(1, "f2"),
  fromDaily(2, "f5"),
  { n: 3, format: "closed", topic: "funksiya", type: "Funksiyanın qiyməti", ref: "2025 toplu, I hissə, səh.60 №1–8",
    text: "$f(x) = 2x + 3$ olarsa, $f(4)$-ü tapın.", options: { A: "8", B: "9", C: "10", D: "11", E: "14" } },
  { n: 4, format: "closed", topic: "funksiya", type: "Kvadrat funksiya", ref: "2025 toplu, I hissə, səh.66 №2–10",
    text: "$y = x^2 - 4x + 3$ parabolasının təpə nöqtəsinin absisini tapın.", options: { A: "$-2$", B: "1", C: "2", D: "3", E: "4" } },
  { n: 5, format: "closed", topic: "funksiya", type: "Xətti funksiya", ref: "2023 toplu, I hissə, səh.52 №1–6",
    text: "$f(x) = 3x - 6$ funksiyasının sıfrını tapın.", options: { A: "2", B: "$-2$", C: "0", D: "3", E: "6" } },
  fromDaily(6, "t3"),
  fromDaily(7, "t4"),
  { n: 8, format: "closed", topic: "ucbucaq", type: "Bucaqların cəmi", ref: "2025 toplu, II hissə, səh.150 №1–5",
    text: "Üçbucağın iki bucağı 50° və 60°-dir. Üçüncü bucaq neçə dərəcədir?", options: { A: "60°", B: "70°", C: "80°", D: "90°", E: "110°" } },
  { n: 9, format: "closed", topic: "ucbucaq", type: "Pifaqor teoremi", ref: "2025 toplu, II hissə, səh.154 №2–9",
    text: "Katetləri 6 və 8 olan düzbucaqlı üçbucağın hipotenuzunu tapın.", options: { A: "7", B: "9", C: "10", D: "12", E: "14" } },
  fromDaily(10, "l2"),
  fromDaily(11, "l5"),
  { n: 12, format: "closed", topic: "ardicilliq", type: "Ədədi silsilə", ref: "2025 toplu, I hissə, səh.120 №1–8",
    text: "Ədədi silsilədə $a_1 = 3$, $d = 4$. $a_{10}$-u tapın.", options: { A: "36", B: "39", C: "40", D: "43", E: "30" } },
  { n: 13, format: "closed", topic: "ardicilliq", type: "Həndəsi silsilə", ref: "2025 toplu, I hissə, səh.124 №1–7",
    text: "Həndəsi silsilədə $b_1 = 2$, $q = 3$. $b_4$-ü tapın.", options: { A: "18", B: "24", C: "54", D: "162", E: "8" } },
  { n: 14, format: "coded", topic: "faiz", type: "Sadə və mürəkkəb faiz", ref: "2025 toplu, I hissə, səh.140 №1–6",
    text: "120 ədədinin 35%-ini tapın." },
  { n: 15, format: "coded", topic: "funksiya", type: "Funksiyanın qiyməti", ref: "2025 toplu, I hissə, səh.60 №1–8",
    text: "$f(x) = x^2 - 5x$ olarsa, $f(7)$-ni tapın." },
  { n: 16, format: "coded", topic: "ucbucaq", type: "Üçbucağın sahəsi", ref: "2025 toplu, II hissə, səh.158 №1–6",
    text: "Oturacağı 10, hündürlüyü 6 olan üçbucağın sahəsini tapın." },
  { n: 17, format: "coded", topic: "ardicilliq", type: "Ədədi silsilə", ref: "2025 toplu, I hissə, səh.120 №1–8",
    text: "Ədədi silsilədə $a_1 = 1$, $d = 2$. İlk 10 həddin cəmini tapın." },
  { n: 18, format: "coded", topic: "triqonometriya", type: "Əsas eynilik", ref: "2025 toplu, I hissə, səh.94 №2–8",
    text: "$\\sin^2 37^\\circ + \\cos^2 37^\\circ + \\operatorname{tg} 45^\\circ$ ifadəsinin qiymətini tapın." },
  { n: 19, format: "written", topic: "faiz", type: "Ardıcıl faiz artımı", ref: "2025 toplu, I hissə, səh.146 №11–15",
    text: "Məhsulun qiyməti iki dəfə ardıcıl 10% artırıldı və 242 manat oldu. İlkin qiyməti tapın. Həllini yazın." },
  { n: 20, format: "written", topic: "funksiya", type: "Kvadrat funksiya", ref: "2025 toplu, I hissə, səh.66 №2–10",
    text: "$f(x) = x^2 - 6x + 5$ funksiyasının ən kiçik qiymətini tapın. Həllini yazın." },
  { n: 21, format: "written", topic: "triqonometriya", type: "İkiqat bucaq düsturları", ref: "2023 toplu, II hissə, səh.88 №3–9",
    text: "$\\cos\\alpha = 0{,}6$ və $\\alpha$ iti bucaqdır. $\\sin 2\\alpha$-nı tapın. Həllini yazın." },
  { n: 22, format: "written", topic: "ucbucaq", type: "Pifaqor teoremi", ref: "2025 toplu, II hissə, səh.154 №2–9",
    text: "Düzbucaqlı üçbucağın hipotenuzu 13, katetlərindən biri 5-dir. Üçbucağın sahəsini tapın. Həllini yazın." },
  { n: 23, format: "written", topic: "ucbucaq", type: "Kosinuslar teoremi", ref: "2023 toplu, II hissə, səh.131 №1–7",
    text: "Üçbucağın tərəfləri 7, 8 və 9-dur. Ən böyük tərəfin qarşısındakı bucağın kosinusunu tapın. Həllini yazın." },
  { n: 24, format: "written", topic: "loqarifm", type: "Loqarifmik tənliklər", ref: "2025 toplu, I hissə, səh.112 №1–6",
    text: "$\\log_2(x - 1) + \\log_2(x + 1) = 3$ tənliyini həll edin." },
  { n: 25, format: "written", topic: "ardicilliq", type: "Həndəsi silsilə", ref: "2025 toplu, I hissə, səh.124 №1–7",
    text: "Həndəsi silsilədə $b_2 = 6$, $b_5 = 162$. $b_1$ və $q$-nü tapın. Həllini yazın." },
];

/* ---------------- Abunə və ödəniş ---------------- */

export const CARD_LABEL = "Kart •••• 4821";
