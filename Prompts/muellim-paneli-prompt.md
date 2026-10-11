# Prompt: Müəllim paneli

## Kontekst
Layihə DİM imtahanlarına hazırlıq saytıdır (2vur2.az). Saytda hazırda yalnız riyaziyyat var. İnterfeysin bütün mətnləri Azərbaycan dilində olmalıdır.

Layihənin mövcud texnologiyalarından, arxitekturasından və kod qaydalarından istifadə et. Yeni texnologiya əlavə etmə. Başlamazdan əvvəl layihəni öyrən: istifadəçilər və rollar, sual bankı (LaTeX, şəkillər, həllər), sınaqlar, cavab kartı, zəif mövzu sistemi, ödəniş necə işləyir.

Dizayn nümunəsi `muellim-paneli.html` faylındadır. Bölmələrə, mətnlərə və rənglərə sadiq qal. Statik nümunə məlumatları real məlumatla əvəz et.

## Ümumi qaydalar
- Panel yalnız **müəllim rolu** olan istifadəçilər üçündür. Müəllim rolunu admin təsdiq edir. Təsdiqlənməyən hesab paneli görmür.
- **Müəllim öz sualını əlavə etmir** (bu funksiya hələlik yoxdur).
- **Müəllim sual bankını, mövzu siyahısını və tək-tək sualları görmür.** Suallar yalnız yaradılmış sınağın çap faylında və cavab açarında görünür.
- **Kağız sınaq (çap) pulsuzdur.**
- **Onlayn sınaq ödənişlidir: hər şagird üçün 1 AZN.**

## 1. Qruplar
- Müəllim qrup yaradır: ad, imtahan növü (9-cu sinif buraxılış / 11-ci sinif buraxılış / blok).
- Hər qrupun unikal **qrup kodu** və qoşulma linki olur. Şagird saytda hesabı ilə daxil olub kodu yazaraq qrupa qoşulur. Müəllim şagird məlumatlarını əl ilə daxil etmir.
- Müəllim şagirdi qrupdan çıxara, qrup kodunu yeniləyə bilir.
- Şagird bir neçə qrupda ola bilər. Qrupdan çıxanda müəllim onun yeni nəticələrini görmür.
- Qrup səhifəsində şagirdlərin siyahısı: son nəticə, proqres, əsas zəif mövzu.

## 2. Sınaq yaratmaq
Müəllim yalnız bunları seçir:
1. **İmtahan növü.** Sualların sayı, tipləri (qapalı / kodlaşdırılan / yazılı) və mövzu bölgüsü DİM formatına və statistikaya görə **avtomatik** təyin olunur. Bu struktur admin tərəfindən hər imtahan növü üçün ayrıca saxlanılır və redaktə olunur. Müəllim onu dəyişə bilmir.
2. **Format:** kağız (pulsuz) və ya onlayn (1 AZN / şagird).
3. **Qrup, tarix, müddət.**
4. Seçimlər:
   - "Hər şagirdə fərqli variant ver" (standart: açıq) — eyni suallar, amma sualların və cavab variantlarının sırası hər şagird üçün qarışdırılır;
   - "Bu qrupda əvvəl düşmüş sualları təkrarlama" (standart: açıq).

Sualların seçilmə qaydası:
- Suallar bazadan **təsadüfi** seçilir, imtahan növünün strukturuna (say, tip, mövzu bölgüsü) uyğun olaraq.
- **Təkrarlanma olmamalıdır**: həmin müəllimin həmin qrupa əvvəl verdiyi sınaqlardakı suallar seçilmir. Bazada uyğun yeni sual qalmayıbsa, ən köhnə istifadə olunmuş suallar götürülür və müəllimə xəbərdarlıq göstərilir.
- Cavab variantları qarışdırılanda düzgün cavablar A–E arasında paylanmalıdır, eyni hərfdə toplanmamalıdır.
- Hər sınağın suallarının siyahısı saxlanılır ki, nəticələr və analitika ona bağlansın.

## 3. Kağız sınaq və çap (pulsuz)
Sınaq yaradılandan sonra müəllim üç faylı PDF kimi yükləyib çap edə bilir:
1. **Sual kitabçaları.** Qrupdakı **hər şagird üçün ayrıca** kitabça. Başlıqda şagirdin **adı və soyadı avtomatik yazılır**, həmçinin qrup, tarix, sınaq nömrəsi və variant hərfi göstərilir. Variant açıqdırsa, hər şagirdin kitabçasında sıra fərqli olur.
2. **Cavab kartları.** Sınağın strukturuna uyğun DİM üslubunda kart: qapalı suallar üçün A–E dairələri, kodlaşdırılan suallar üçün 6 xana və `-`, `,`, `0–9` dairələri, yazılı suallar üçün sahələr. Kartda da şagirdin adı, soyadı və variant hərfi avtomatik yazılır.
3. **Cavab açarı.** Yalnız müəllim üçün. Bütün variantların cavabları cədvəl şəklində verilir.

Çap tələbləri:
- A4 formatı, düzgün səhifə bölgüsü. Sual, şəkil və variantlar səhifələr arasında bölünməməlidir.
- LaTeX düsturları və həndəsə şəkilləri düzgün çap olunmalıdır.
- Kitabçalar və kartlar şagird adlarına görə eyni sırada düzülür ki, paylamaq asan olsun.
- Hər səhifənin altında "2vur2.az · Bu material Cəfərli Elvin müəllimə məxsusdur" yazısı və səhifə nömrəsi olur.

## 4. Kağız sınağının nəticələrinin daxil edilməsi
- Müəllim cavab kartlarından cavabları cədvələ daxil edir: hər sətir bir şagird, hər sütun bir sual. Qapalı suallar üçün A–E, kodlaşdırılan suallar üçün rəqəm, yazılı suallar üçün bal (0 / 0.5 / 1) yazılır.
- Hərf yazılanda kursor avtomatik növbəti xanaya keçir. Düz və səhv cavablar rənglə göstərilir. Hər şagirdin balı dərhal hesablanır.
- Yoxlama şagirdin öz variantına görə aparılır, çünki sıra qarışdırılıb.
- Yadda saxlanandan sonra nəticələr həm qrup analitikasına, həm də şagirdin şəxsi zəif mövzu təhlilinə əlavə olunur.
- Kağız nəticələri yazılmamış sınaqlar ümumi baxışda "Nəticə yaz" kimi göstərilir.

## 5. Onlayn sınaq (1 AZN / şagird)
- Müəllimin **balansı** olur. Panelin yan menyusunda balans və "Balansı artır" düyməsi göstərilir. Ödəniş saytın mövcud ödəniş sistemi ilə aparılır.
- Sınaq yaradılanda yekun məbləğ göstərilir (şagird sayı × 1 AZN). Balans kifayət etmirsə, sınaq yaradılmır və balansı artırmaq təklif olunur.
- Məbləğ sınaq yaradılanda tutulur. Sınağa başlamayan şagirdlərin məbləği sınaq bitəndən sonra balansa qaytarılır.
- Şagirdlər saytda bildiriş və e-poçt alır. Sınağı saytın mövcud cavab kartı interfeysində həll edirlər.
- Onlayn sınağın qaydaları yarış qaydaları ilə eynidir:
  - hər şagirdə fərqli variant;
  - vaxt sayğacı serverdə işləyir və dayanmır;
  - cavablar dərhal saxlanılır;
  - tab dəyişmə jurnala yazılır və müəllimə göstərilir.
- Nəticələr avtomatik hesablanır.
- Bütün ödənişlər və geri qaytarmalar balans tarixçəsində görünür.

## 6. Analitika
- **Qrup üzrə zəif mövzular**: qrupun orta mənimsəməsi, zəifdən güclüyə sıralanmış. Saytın mövcud zəif mövzu sistemindən istifadə et. Müəllim yalnız mövzu adlarını və faizləri görür, suallar göstərilmir.
- **Sınaq üzrə suallar**: hər sual üçün düz cavab faizi və ən çox seçilən səhv variant. Rəng kodu: <50% qırmızı, 50–70% sarı, >70% yaşıl. Sualın mətni yalnız həmin sınağın çap faylında olduğu üçün burada sualın nömrəsi və mövzusu göstərilir.
- **Qrup reytinqi**: şagirdlərin orta balı və dinamikası.
- Nəticələrin Excel/CSV ixracı.

## 7. Valideyn hesabatı
- Müəllim şagird seçir və aylıq hesabat hazırlayır: orta nəticə, sınaq və tapşırıq sayı, qrupdakı yeri, güclü və zəif mövzular, müəllimin qeydi.
- Hesabat iki formatda paylaşılır:
  - **link**: giriş tələb etmir, amma təxmin edilə bilməyən unikal ünvanla açılır və 30 gündən sonra etibarsız olur;
  - **PDF**.
- Hesabatda yalnız həmin şagirdin məlumatları göstərilir.

## 8. Ümumi baxış (dashboard)
- Qrup, şagird və keçirilmiş sınaq sayı, ən zəif mövzu.
- Son sınaqlar: qrup, növ (kağız / onlayn), orta nəticə və ya "Nəticə yaz" düyməsi.
- Qruplar üzrə ən zəif 4 mövzu.

## 9. Admin tərəfi
- Müəllim müraciətlərini təsdiqləmək və ya rədd etmək.
- Hər imtahan növü üçün sınaq strukturu: sual sayı, tiplərin sayı, mövzu bölgüsü, müddət.
- Müəllimlərin siyahısı: qrup və şagird sayı, keçirilən sınaqlar, balans və ödənişlər.
- Müəllim balansına əl ilə əməliyyat (bonus, geri qaytarma).

## 10. Təhlükəsizlik
- Müəllim yalnız öz qruplarını, öz sınaqlarını və öz qrupundakı şagirdlərin nəticələrini görür.
- Sual bankını kütləvi şəkildə çıxarmağın qarşısını al: müəllim gündə məhdud sayda sınaq yarada bilər (məsələn, 10). Limit admin tərəfindən dəyişdirilə bilər.
- Çap faylları yalnız müəllimin özü üçün əlçatandır, birbaşa link ilə başqası aça bilməz.
- Cavab açarı heç vaxt şagirdə göstərilmir.

## 11. Yoxlama
- Testlər yaz:
  - sınaq strukturu: seçilən sualların sayı, tipi və mövzu bölgüsü imtahan növünə uyğundur;
  - təkrarlanma: eyni qrupa ikinci sınaqda əvvəlki suallar düşmür; baza bitəndə xəbərdarlıq göstərilir;
  - variantlar: sıra qarışdırılır, düzgün cavablar A–E arasında paylanır, cavab açarı hər variant üçün düzgündür;
  - kağız nəticələri: şagirdin variantına görə düzgün yoxlanılır;
  - onlayn ödəniş: balans kifayət etmədikdə sınaq yaradılmır, başlamayanlar üçün geri qaytarma işləyir;
  - giriş hüquqları: müəllim başqa müəllimin qrupunu, sınağını və suallarını görə bilmir.
- PDF-ləri yarat və vizual yoxla: adlar, LaTeX, şəkillər, səhifə bölgüsü.
- Nümunə məlumat yarat: 1 müəllim, 3 qrup, ~60 şagird, 5 sınaq (kağız və onlayn). Panel dizayn nümunəsinə bənzər görünməlidir.

## Çıxış
Dəyişdirilən və yaradılan faylların siyahısını, verilənlər bazası dəyişikliklərini və qısa izahı ver. Hər mərhələdən sonra layihə işlək vəziyyətdə qalmalıdır.
