// Hüquqi səhifələrin mətni: istifadə şərtləri və məxfilik siyasəti.
import { brand } from "@/config/brand";
import { PLANS, EXAM_PRICE } from "@/lib/demo/plans";

export type LegalDoc = {
  updated: string;
  intro: string;
  sections: { title: string; body: string[] }[];
};

const contact = `Sual və müraciətlər üçün: ${brand.email}.`;

export const terms: LegalDoc = {
  updated: "Son yenilənmə: 15 oktyabr 2026",
  intro: `Bu şərtlər ${brand.domain} saytından və onun xidmətlərindən (bundan sonra — “platforma”) istifadə qaydalarını müəyyən edir. Qeydiyyatdan keçməklə və ya platformadan istifadə etməklə bu şərtlərlə razılaşmış olursan.`,
  sections: [
    {
      title: "1. Platforma haqqında",
      body: [
        `${brand.name} buraxılış və qəbul imtahanlarına riyaziyyatdan hazırlıq platformasıdır: günün sualları, onlayn repetitor, sınaqlar, səhvlər üzərində iş, statistika və digər alətlər.`,
        "Platforma müstəqildir və Dövlət İmtahan Mərkəzinə (DİM) məxsus deyil, onunla əlaqəli deyil. Sınaqlar və nümunələr hazırlıq məqsədi daşıyır və rəsmi imtahan materialı sayılmır.",
      ],
    },
    {
      title: "2. Hesab",
      body: [
        "Qeydiyyatda doğru məlumat yazmalısan. Hər şəxsin bir hesabı olur; hesabı başqası ilə paylaşmaq olmaz.",
        "Şifrənin və hesabının təhlükəsizliyinə sən cavabdehsən. Hesabından icazəsiz istifadə olunduğunu düşünürsənsə, şifrəni dəyiş və bizə yaz.",
        "Yetkinlik yaşına çatmamış istifadəçi platformadan valideyninin və ya qanuni nümayəndəsinin xəbəri və razılığı ilə istifadə edir.",
      ],
    },
    {
      title: "3. Planlar və xidmətlər",
      body: [
        `${PLANS.free.name} plan ödənişsizdir və hər istifadəçiyə açıqdır. ${PLANS.pro.name} və ${PLANS.premium.name} planları əlavə imkanlar verir; hər planın tərkibi və qiyməti “Abunəliklər” və ödəniş səhifəsində göstərilir.`,
        `Sınağı ayrıca da almaq olar (${EXAM_PRICE}). Alınmış sınaq hesabında qalır.`,
        "Platformanın imkanlarını yeniləyə, əlavə edə və ya dəyişə bilərik. Ödənilmiş dövr ərzində planın əsas imkanlarını azaltmırıq.",
      ],
    },
    {
      title: "4. Ödəniş və abunə",
      body: [
        "Ödəniş bank kartı ilə lisenziyalı ödəniş provayderi vasitəsilə qəbul olunur. Kart məlumatları bizdə saxlanmır.",
        "Abunə seçdiyin dövr (ay və ya il) üçün öncədən ödənilir və ləğv edilməyənə qədər hər dövrün sonunda eyni məbləğlə avtomatik yenilənir. Qiymət dəyişsə, yeni qiymət yalnız növbəti dövrdən tətbiq olunur və bu barədə əvvəlcədən xəbər veririk.",
        "Abunəni istənilən vaxt “Profil” bölməsindən ləğv edə bilərsən. Ləğvdən sonra növbəti ödəniş tutulmur, imkanlar isə ödənilmiş dövrün sonuna qədər açıq qalır.",
        "Ödənilmiş dövr və alınmış sınaq üçün məbləğ geri qaytarılmır, qanunvericilikdə nəzərdə tutulan hallar istisna olmaqla. Texniki xəta ucbatından məbləğ iki dəfə tutulubsa və ya ödəniş keçib, xidmət açılmayıbsa, bizə yaz — yoxlayıb düzəldəcəyik və ya məbləği qaytaracağıq.",
      ],
    },
    {
      title: "5. Məzmun",
      body: [
        "Platformadakı suallar, izahlar, nəzəriyyə, statistika, dizayn və proqram təminatı müəllif hüququ ilə qorunur. Onlardan yalnız şəxsi hazırlıq üçün istifadə etmək olar.",
        "Məzmunu kütləvi şəkildə köçürmək, yaymaq, satmaq, avtomatlaşdırılmış vasitələrlə toplamaq və ya başqa platformada yerləşdirmək qadağandır.",
      ],
    },
    {
      title: "6. İstifadə qaydaları",
      body: [
        "Platformanın işinə mane olmaq, təhlükəsizlik tədbirlərini keçməyə çalışmaq, başqasının hesabına daxil olmaq və saxta hesablar yaratmaq qadağandır.",
        "Yarış və müəllim sınaqlarında başqasının köməyindən istifadə etmək və nəticələri saxtalaşdırmaq qadağandır.",
        "Bu qaydalar pozularsa, hesabı xəbərdarlıqla və ya xəbərdarlıqsız məhdudlaşdıra və ya bağlaya bilərik.",
      ],
    },
    {
      title: "7. Məsuliyyət",
      body: [
        "Platforma hazırlığa kömək edir, amma imtahanda müəyyən bal və ya qəbul zəmanəti vermir. Bal simulyatoru, proqnozlar və statistika təxminidir.",
        "Platformanın fasiləsiz və xətasız işləməsi üçün səy göstəririk, lakin texniki işlər, şəbəkə problemləri və bizdən asılı olmayan hallarda qısa fasilələr ola bilər.",
      ],
    },
    {
      title: "8. Hesabın bağlanması",
      body: [
        "Hesabını istənilən vaxt bağlaya bilərsən — bunun üçün bizə yaz. Hesab bağlananda məlumatların məxfilik siyasətinə uyğun silinir.",
      ],
    },
    {
      title: "9. Şərtlərin dəyişməsi",
      body: [
        "Bu şərtləri yeniləyə bilərik. Əhəmiyyətli dəyişiklik barədə platformada və ya e-poçtla xəbər veririk. Dəyişiklikdən sonra platformadan istifadə etməyə davam etmək yeni şərtlərlə razılıq deməkdir.",
        "Bu şərtlərə Azərbaycan Respublikasının qanunvericiliyi tətbiq olunur.",
      ],
    },
    { title: "10. Əlaqə", body: [contact] },
  ],
};

export const privacy: LegalDoc = {
  updated: "Son yenilənmə: 15 oktyabr 2026",
  intro: `Bu siyasət ${brand.domain} platformasının hansı şəxsi məlumatları topladığını, onlardan necə istifadə etdiyini və onları necə qoruduğunu izah edir.`,
  sections: [
    {
      title: "1. Topladığımız məlumatlar",
      body: [
        "Hesab məlumatları: ad, soyad, ata adı, istifadəçi adı, sinif, hədəf imtahan; istəyə bağlı olaraq e-poçt, telefon nömrəsi, valideynin adı və e-poçtu. Şifrə yalnız geri çevrilməyən şifrələnmiş (hash) formada saxlanılır.",
        "Google ilə daxil olsan: Google hesabının adı və e-poçtu.",
        "Hazırlıq məlumatları: cavabların, cavaba sərf olunan vaxt, sınaq nəticələri, zəif mövzular və irəliləyiş.",
        "Ödəniş məlumatları: alınan plan və ya sınaq, məbləğ, tarix və ödənişin statusu. Kart məlumatlarını ödəniş provayderi emal edir — onlar bizə gəlmir və bizdə saxlanmır.",
        "Texniki məlumatlar: IP ünvanı və brauzer məlumatı — hesabı qorumaq və sui-istifadənin (məs. şifrə təxmin etmə cəhdlərinin) qarşısını almaq üçün.",
      ],
    },
    {
      title: "2. Məlumatlardan necə istifadə edirik",
      body: [
        "Hesabını yaratmaq və girişi təmin etmək; sənə uyğun sualları, sınaqları və statistikanı göstərmək; zəif mövzularını müəyyən etmək.",
        "Ödənişləri emal etmək və abunəni idarə etmək.",
        "Təsdiq kodu, şifrə bərpası və hesabla bağlı vacib bildirişləri göndərmək.",
        "Platformanı təhlükəsiz saxlamaq və təkmilləşdirmək.",
        "Məlumatlarını satmırıq və reklam məqsədilə başqalarına vermirik.",
      ],
    },
    {
      title: "3. Kimlər görə bilər",
      body: [
        "Müəllimin qrupuna qoşulsan, müəllim həmin qrupda verdiyi sınaqlarda nəticələrini görür.",
        "Xidməti göstərmək üçün etibarlı tərəfdaşlardan istifadə edirik: ödəniş provayderi (ödənişlər), Google (Google ilə giriş), hostinq, verilənlər bazası və e-poçt göndərmə xidmətləri. Onlar məlumatı yalnız bu xidmət üçün emal edir.",
        "Qanunla tələb olunduqda məlumat səlahiyyətli dövlət orqanlarına verilə bilər.",
      ],
    },
    {
      title: "4. Kukilər (cookies)",
      body: [
        "Yalnız zəruri kukilərdən istifadə edirik: girişdən sonra hesabında qalmağın üçün sessiya kukisi. Reklam və izləmə kukiləri istifadə etmirik.",
      ],
    },
    {
      title: "5. Saxlama və təhlükəsizlik",
      body: [
        "Məlumatlar hesabın açıq olduğu müddətdə saxlanılır. Hesab bağlananda şəxsi məlumatlar silinir; ödəniş qeydləri qanunvericiliyin tələb etdiyi müddət ərzində saxlanıla bilər.",
        "Məlumatlar şifrələnmiş bağlantı (HTTPS) ilə ötürülür, şifrələr hash formada saxlanılır, bazaya giriş məhduddur.",
      ],
    },
    {
      title: "6. Hüquqların",
      body: [
        "Məlumatlarının çoxunu “Profil” bölməsində özün görə və dəyişə bilərsən.",
        `Məlumatlarının surətini almaq, düzəltmək, silmək və ya hesabı bağlamaq üçün ${brand.email} ünvanına yaz.`,
      ],
    },
    {
      title: "7. Yetkinlik yaşına çatmayanlar",
      body: [
        "Platformadan əsasən məktəblilər istifadə edir. Yetkinlik yaşına çatmamış istifadəçi qeydiyyatdan valideyninin və ya qanuni nümayəndəsinin razılığı ilə keçir. Valideyn uşağının məlumatları ilə bağlı bizə müraciət edə bilər.",
      ],
    },
    {
      title: "8. Dəyişikliklər",
      body: ["Bu siyasəti yeniləyə bilərik. Əhəmiyyətli dəyişiklik barədə platformada və ya e-poçtla xəbər veririk."],
    },
    { title: "9. Əlaqə", body: [contact] },
  ],
};
