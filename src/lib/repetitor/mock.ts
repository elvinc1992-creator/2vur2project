import "server-only";
import type { RepetitorKey, RepetitorQuestion, RepetitorTopic } from "./types";

// MOCK MƏLUMAT — admin paneli hazır olanda bu fayl DB cədvəli ilə əvəz olunacaq (bax: ./source.ts).
// Sualların mətni orijinaldır (test toplularından deyil). Mövzular — statistikada ən çox çıxan 5 mövzu.

export const MOCK_TOPICS: RepetitorTopic[] = [
  { slug: "stereometriya", name: "Stereometriya" },
  { slug: "limit-toreme-inteqral", name: "Limit, törəmə, inteqral" },
  { slug: "loqarifm-ustlu-tenlik-berabersizlik", name: "Loqarifm, üstlü tənlik/bərabərsizlik" },
  { slug: "triqonometriya", name: "Triqonometriya" },
  { slug: "ucbucaqlar", name: "Üçbucaqlar" },
];

export const MOCK_QUESTIONS: RepetitorQuestion[] = [
  // Stereometriya
  { id: "st1", topic: "stereometriya", type: "Prizma", freq: 6, ref: "2025 toplu, II hissə, səh.210 №4–9",
    text: "Düzgün dördbucaqlı prizmanın oturacağının tərəfi 3, hündürlüyü 5-dir. Prizmanın tam səthinin sahəsini tapın.",
    options: { A: "60", B: "69", C: "78", D: "84", E: "45" } },
  { id: "st2", topic: "stereometriya", type: "Piramida", freq: 5, ref: "2025 toplu, II hissə, səh.214 №1–6",
    text: "Düzgün dördbucaqlı piramidanın oturacağının tərəfi 6, hündürlüyü 4-dür. Piramidanın həcmini tapın.",
    options: { A: "144", B: "48", C: "72", D: "24", E: "96" } },
  { id: "st3", topic: "stereometriya", type: "Silindr", freq: 5, ref: "2023 toplu, II hissə, səh.176 №2–8",
    text: "Silindrin ox kəsiyi tərəfi 4 olan kvadratdır. Silindrin həcmini tapın.",
    options: { A: "$8\\pi$", B: "$16\\pi$", C: "$32\\pi$", D: "$64\\pi$", E: "$4\\pi$" } },
  { id: "st4", topic: "stereometriya", type: "Kürə", freq: 4, ref: "2023 toplu, II hissə, səh.182 №1–5",
    text: "Kürənin həcmi $36\\pi$-dir. Kürənin radiusunu tapın.",
    options: { A: "2", B: "3", C: "4", D: "6", E: "9" } },
  // Limit, törəmə, inteqral
  { id: "lt1", topic: "limit-toreme-inteqral", type: "Törəmə", freq: 6, ref: "2025 toplu, I hissə, səh.180 №1–8",
    text: "$f(x) = x^3 - 4x$ olarsa, $f'(2)$-ni tapın.",
    options: { A: "4", B: "8", C: "12", D: "0", E: "16" } },
  { id: "lt2", topic: "limit-toreme-inteqral", type: "Toxunanın bucaq əmsalı", freq: 4, ref: "2025 toplu, I hissə, səh.184 №2–7",
    text: "$y = x^2 + 3x$ funksiyasının qrafikinə absisi $x_0 = 1$ olan nöqtədə çəkilmiş toxunanın bucaq əmsalını tapın.",
    options: { A: "4", B: "5", C: "3", D: "2", E: "6" } },
  { id: "lt3", topic: "limit-toreme-inteqral", type: "Müəyyən inteqral", freq: 5, ref: "2025 toplu, I hissə, səh.192 №1–6",
    text: "$\\int_0^2 3x^2\\,dx$ inteqralını hesablayın.",
    options: { A: "6", B: "8", C: "12", D: "4", E: "24" } },
  { id: "lt4", topic: "limit-toreme-inteqral", type: "Limit", freq: 3, ref: "2023 toplu, I hissə, səh.150 №1–5",
    text: "$\\lim\\limits_{x \\to 3} \\frac{x^2 - 9}{x - 3}$ limitini tapın.",
    options: { A: "0", B: "3", C: "6", D: "9", E: "Limit yoxdur" } },
  // Loqarifm, üstlü tənlik/bərabərsizlik
  { id: "lg1", topic: "loqarifm-ustlu-tenlik-berabersizlik", type: "Üstlü tənliklər", freq: 6, ref: "2025 toplu, I hissə, səh.114 №2–9",
    text: "$3^{2x - 1} = 27$ tənliyini həll edin.",
    options: { A: "1", B: "2", C: "3", D: "$\\frac{1}{2}$", E: "4" } },
  { id: "lg2", topic: "loqarifm-ustlu-tenlik-berabersizlik", type: "Loqarifmik tənliklər", freq: 5, ref: "2025 toplu, I hissə, səh.112 №1–6",
    text: "$\\lg x + \\lg 4 = 2$ tənliyini həll edin.",
    options: { A: "25", B: "50", C: "96", D: "20", E: "4" } },
  { id: "lg3", topic: "loqarifm-ustlu-tenlik-berabersizlik", type: "Üstlü bərabərsizliklər", freq: 4, ref: "2023 toplu, I hissə, səh.78 №1–7",
    text: "$2^x > 8$ bərabərsizliyini həll edin.",
    options: { A: "$x > 3$", B: "$x < 3$", C: "$x > 4$", D: "$x \\ge 3$", E: "$x > 8$" } },
  { id: "lg4", topic: "loqarifm-ustlu-tenlik-berabersizlik", type: "Loqarifmik bərabərsizliklər", freq: 3, ref: "2023 toplu, I hissə, səh.80 №2–8",
    text: "$\\log_{\\frac{1}{2}} x > -2$ bərabərsizliyini həll edin.",
    options: { A: "$x > 4$", B: "$0 < x < 4$", C: "$x < 4$", D: "$x > 0$", E: "$0 < x < \\frac{1}{4}$" } },
  // Triqonometriya
  { id: "tr1", topic: "triqonometriya", type: "Gətirmə düsturları", freq: 5, ref: "2025 toplu, I hissə, səh.97 №1–8",
    text: "$\\sin 210^\\circ$ ifadəsinin qiymətini tapın.",
    options: { A: "$\\frac{1}{2}$", B: "$-\\frac{1}{2}$", C: "$\\frac{\\sqrt{3}}{2}$", D: "$-\\frac{\\sqrt{3}}{2}$", E: "$-1$" } },
  { id: "tr2", topic: "triqonometriya", type: "Əsas eynilik", freq: 6, ref: "2025 toplu, I hissə, səh.94 №2–8",
    text: "$\\cos\\alpha = -\\frac{3}{5}$ və $90^\\circ < \\alpha < 180^\\circ$. $\\operatorname{tg}\\alpha$-nı tapın.",
    options: { A: "$\\frac{4}{3}$", B: "$-\\frac{4}{3}$", C: "$-\\frac{3}{4}$", D: "$\\frac{3}{4}$", E: "$-\\frac{4}{5}$" } },
  { id: "tr3", topic: "triqonometriya", type: "Triqonometrik tənliklər", freq: 4, ref: "2023 toplu, II hissə, səh.91 №1–6",
    text: "$2\\cos x = 1$ tənliyinin $(0^\\circ; 90^\\circ)$ aralığındakı həllini tapın.",
    options: { A: "$30^\\circ$", B: "$45^\\circ$", C: "$60^\\circ$", D: "$90^\\circ$", E: "$15^\\circ$" } },
  { id: "tr4", topic: "triqonometriya", type: "İkiqat bucaq düsturları", freq: 4, ref: "2023 toplu, II hissə, səh.88 №3–9",
    text: "$\\cos^2 15^\\circ - \\sin^2 15^\\circ$ ifadəsinin qiymətini tapın.",
    options: { A: "$\\frac{1}{2}$", B: "$\\frac{\\sqrt{3}}{2}$", C: "1", D: "$\\frac{\\sqrt{2}}{2}$", E: "0" } },
  // Üçbucaqlar
  { id: "uc1", topic: "ucbucaqlar", type: "Oxşar üçbucaqlar", freq: 5, ref: "2025 toplu, II hissə, səh.160 №1–7",
    text: "İki oxşar üçbucağın oxşarlıq əmsalı 3-dür. Kiçik üçbucağın sahəsi 5-dirsə, böyük üçbucağın sahəsini tapın.",
    options: { A: "15", B: "45", C: "25", D: "75", E: "9" } },
  { id: "uc2", topic: "ucbucaqlar", type: "Sinuslar teoremi", freq: 4, ref: "2023 toplu, II hissə, səh.133 №1–6",
    text: "Üçbucaqda $a = 10$, ona qarşı bucaq $30^\\circ$-dir. Üçbucağa xaricdən çəkilmiş çevrənin radiusunu tapın.",
    options: { A: "5", B: "10", C: "20", D: "$5\\sqrt{3}$", E: "$10\\sqrt{3}$" } },
  { id: "uc3", topic: "ucbucaqlar", type: "Pifaqor teoremi", freq: 6, ref: "2025 toplu, II hissə, səh.154 №2–9",
    text: "Bərabəryanlı üçbucağın yan tərəfi 13, oturacağı 10-dur. Oturacağa endirilmiş hündürlüyü tapın.",
    options: { A: "12", B: "8", C: "$\\sqrt{69}$", D: "11", E: "13" } },
  { id: "uc4", topic: "ucbucaqlar", type: "Üçbucağın sahəsi", freq: 5, ref: "2025 toplu, II hissə, səh.158 №1–6",
    text: "Tərəfləri 5, 5 və 6 olan üçbucağın sahəsini tapın.",
    options: { A: "12", B: "15", C: "24", D: "30", E: "10" } },
];

export const MOCK_KEYS: Record<string, RepetitorKey> = {
  st1: {
    answer: "C",
    hint: "Tam səth = iki oturacaq + yan səth. Yan səth = oturacağın perimetri × hündürlük.",
    steps: ["Oturacaqlar: $2 \\cdot 3^2 = 18$.", "Yan səth: $P \\cdot h = 4 \\cdot 3 \\cdot 5 = 60$.", "Tam səth: $18 + 60 =$ **78**."],
  },
  st2: {
    answer: "B",
    hint: "Piramidanın həcmi oturacağın sahəsi ilə hündürlüyün hasilinin üçdə biridir.",
    steps: ["Oturacağın sahəsi: $S = 6^2 = 36$.", "$V = \\frac{1}{3} S h = \\frac{1}{3} \\cdot 36 \\cdot 4 =$ **48**."],
  },
  st3: {
    answer: "B",
    hint: "Ox kəsiyi kvadratdırsa, diametr hündürlüyə bərabərdir: $2R = h$.",
    steps: ["$2R = 4$, deməli $R = 2$, $h = 4$.", "$V = \\pi R^2 h = \\pi \\cdot 4 \\cdot 4 =$ **$16\\pi$**."],
  },
  st4: {
    answer: "B",
    hint: "$V = \\frac{4}{3}\\pi R^3$ düsturundan $R^3$-u tap.",
    steps: ["$\\frac{4}{3}\\pi R^3 = 36\\pi \\Rightarrow R^3 = 27$.", "$R =$ **3**."],
  },
  lt1: {
    answer: "B",
    hint: "Qüvvətin törəməsi: $(x^n)' = n x^{n-1}$.",
    steps: ["$f'(x) = 3x^2 - 4$.", "$f'(2) = 3 \\cdot 4 - 4 =$ **8**."],
  },
  lt2: {
    answer: "B",
    hint: "Toxunanın bucaq əmsalı toxunma nöqtəsindəki törəməyə bərabərdir.",
    steps: ["$y' = 2x + 3$.", "$k = y'(1) = 2 + 3 =$ **5**."],
  },
  lt3: {
    answer: "B",
    hint: "$3x^2$ funksiyasının ibtidai funksiyası $x^3$-dur.",
    steps: ["İbtidai funksiya: $F(x) = x^3$.", "$F(2) - F(0) = 8 - 0 =$ **8**."],
  },
  lt4: {
    answer: "C",
    hint: "Surəti vuruqlara ayır: $x^2 - 9 = (x - 3)(x + 3)$.",
    steps: ["$\\frac{(x - 3)(x + 3)}{x - 3} = x + 3$, $x \\ne 3$.", "$\\lim\\limits_{x \\to 3} (x + 3) =$ **6**."],
  },
  lg1: {
    answer: "B",
    hint: "27-ni 3-ün qüvvəti kimi yaz.",
    steps: ["$27 = 3^3$, deməli $2x - 1 = 3$.", "$x =$ **2**."],
  },
  lg2: {
    answer: "A",
    hint: "Loqarifmlərin cəmi hasilin loqarifmidir; $\\lg$ — 10 əsaslı loqarifmdir.",
    steps: ["$\\lg (4x) = 2 \\Rightarrow 4x = 10^2 = 100$.", "$x =$ **25** (yoxlama: $x > 0$)."],
  },
  lg3: {
    answer: "A",
    hint: "Əsas 1-dən böyükdürsə, bərabərsizliyin işarəsi dəyişmir.",
    steps: ["$8 = 2^3$: $2^x > 2^3$.", "Əsas $2 > 1$, ona görə **$x > 3$**."],
  },
  lg4: {
    answer: "B",
    hint: "Əsas 1-dən kiçikdir — işarə dəyişir. Təyin oblastını unutma: $x > 0$.",
    steps: ["$-2 = \\log_{\\frac{1}{2}} 4$.", "Əsas $\\frac{1}{2} < 1$, ona görə $x < 4$.", "Təyin oblastı ilə: **$0 < x < 4$**."],
  },
  tr1: {
    answer: "B",
    hint: "$210^\\circ = 180^\\circ + 30^\\circ$; III rübdə sinus mənfidir.",
    steps: ["$\\sin(180^\\circ + \\alpha) = -\\sin\\alpha$.", "$\\sin 210^\\circ = -\\sin 30^\\circ =$ **$-\\frac{1}{2}$**."],
  },
  tr2: {
    answer: "B",
    hint: "Əvvəl $\\sin\\alpha$-nı tap; II rübdə sinus müsbətdir.",
    steps: [
      "$\\sin\\alpha = \\sqrt{1 - \\frac{9}{25}} = \\frac{4}{5}$ (II rüb).",
      "$\\operatorname{tg}\\alpha = \\frac{\\sin\\alpha}{\\cos\\alpha} = \\frac{4}{5} : \\left(-\\frac{3}{5}\\right) =$ **$-\\frac{4}{3}$**.",
    ],
  },
  tr3: {
    answer: "C",
    hint: "Əvvəl $\\cos x$-i tap, sonra əsas bucaqlar cədvəlinə bax.",
    steps: ["$\\cos x = \\frac{1}{2}$.", "$(0^\\circ; 90^\\circ)$ aralığında $x =$ **$60^\\circ$**."],
  },
  tr4: {
    answer: "B",
    hint: "$\\cos^2\\alpha - \\sin^2\\alpha$ — ikiqat bucağın kosinusudur.",
    steps: ["$\\cos^2\\alpha - \\sin^2\\alpha = \\cos 2\\alpha$.", "$\\cos 30^\\circ =$ **$\\frac{\\sqrt{3}}{2}$**."],
  },
  uc1: {
    answer: "B",
    hint: "Oxşar fiqurların sahələrinin nisbəti oxşarlıq əmsalının kvadratına bərabərdir.",
    steps: ["$\\frac{S_2}{S_1} = k^2 = 9$.", "$S_2 = 5 \\cdot 9 =$ **45**."],
  },
  uc2: {
    answer: "B",
    hint: "Sinuslar teoremi: $\\frac{a}{\\sin A} = 2R$.",
    steps: ["$\\frac{10}{\\sin 30^\\circ} = 2R$.", "$2R = 20$, $R =$ **10**."],
  },
  uc3: {
    answer: "A",
    hint: "Hündürlük oturacağı yarıya bölür — düzbucaqlı üçbucaq alınır.",
    steps: ["Oturacağın yarısı: $10 : 2 = 5$.", "$h = \\sqrt{13^2 - 5^2} = \\sqrt{144} =$ **12**."],
  },
  uc4: {
    answer: "A",
    hint: "Üçbucaq bərabəryanlıdır: 6 olan tərəfə hündürlük endir.",
    steps: ["Hündürlük: $h = \\sqrt{5^2 - 3^2} = 4$.", "$S = \\frac{1}{2} \\cdot 6 \\cdot 4 =$ **12**."],
  },
};
