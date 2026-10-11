# Prompt: "2vur2 Riyaziyyat Yarışı" bölməsi

## Kontekst
Layihə DİM imtahanlarına hazırlıq saytıdır (2vur2.az). Saytda hazırda yalnız riyaziyyat var. İnterfeysin bütün mətnləri Azərbaycan dilində olmalıdır.

Layihənin mövcud texnologiyalarından, arxitekturasından və kod qaydalarından istifadə et. Yeni texnologiya əlavə etmə. Başlamazdan əvvəl layihəni öyrən: istifadəçilər, suallar və sınaqlar necə saxlanılır, giriş necə işləyir, e-poçt göndərmək üçün nə var.

Dizayn nümunəsi `yaris.html` faylındadır. Bölmələrə, mətnlərə və rənglərə sadiq qal. Statik nümunə məlumatları real məlumatla əvəz et.

## Ümumi qaydalar
- Yarışda iştirak **pulsuzdur** və **bütün istifadəçilər üçün eynidir**. Pulsuz, Pro və Premium hesablar arasında yarışda heç bir fərq olmamalıdır.
- **Kateqoriya yoxdur.** Bütün iştirakçılar bir ümumi reytinqdə yarışır.
- İki mərhələ var:
  1. **Onlayn tur**: hamı üçün eyni anda başlayır.
  2. **Final**: yalnız **əyani** keçirilir. İlk 25 nəfər finala keçir. Vaxt və məkan finalçılara ayrıca bildirilir. Final nəticələri admin tərəfindən daxil edilir.
- Mükafatlar yalnız final nəticəsinə görə verilir. Pul mükafatı valideynin hesabına köçürülür və ya nağd şəkildə təqdim olunur.
- **SMS istifadə olunmur.** Bütün bildirişlər e-poçt ilə göndərilir.

## 1. Saxlanılmalı məlumatlar
Mövcud strukturu yoxla. Çatışmayanları əlavə et:
- **Yarış**: ad, təsvir, qeydiyyatın başlama və bitmə vaxtı, onlayn turun başlama vaxtı, giriş üçün son vaxt (məsələn, başlanğıcdan 10 dəqiqə sonra), turun müddəti, sual sayı, finala keçənlərin sayı (25), mükafat fondu, fondun artma həddi (məsələn, 500 iştirakçı) və artırılmış 1-ci yer mükafatı, status (qaralama / qeydiyyat / davam edir / bitib / final / nəticələr elan olunub).
- **Mükafatlar**: yer aralığı (1, 2, 3, 4–10) və mükafatın təsviri.
- **Qeydiyyat**: istifadəçi, yarış, ad, soyad, sinif, rayon/şəhər, məktəb, e-poçt, dəvət kodu, kim tərəfindən dəvət olunduğu, qaydalarla razılıq, valideyn razılığı, e-poçtla nəticə göndərilməsinə razılıq, qeydiyyat tarixi.
- **Yarış sualları**: sual şablonu, rəqəmlərin dəyişmə qaydası, hər suala ayrılan vaxt.
- **İştirakçının variantı**: hər iştirakçı üçün yaradılmış konkret suallar, rəqəmlər və düzgün cavablar.
- **Cavablar**: iştirakçı, sual, cavab, düz/səhv, cavab vaxtı, suala sərf olunan vaxt.
- **Hadisə jurnalı**: tab dəyişmə, pəncərədən çıxma, bağlantının kəsilməsi və bərpası, vaxtla birlikdə.
- **Nəticə**: onlayn tur balı, ümumi sərf olunan vaxt, yer, finala keçib-keçmədiyi, final balı, final yeri, diskvalifikasiya və səbəbi.

İştirakçı yalnız öz məlumatlarını görməlidir. Düzgün cavablar heç vaxt brauzerə göndərilməməlidir.

## 2. Yarış səhifəsi (`yaris.html`-ə uyğun)
- **Hero bloku**: turun başlamasına qalan vaxtın geri sayımı, mükafat fondu, real qeydiyyatçı sayı.
- **Format**: qeydiyyat → onlayn tur → əyani final → mükafatlandırma. Tarixlər yarış məlumatından götürülür. Final tarixi təyin olunmayıbsa, "Tarix elan olunacaq" yazılır.
- **Mükafatlar**: podium (1–3), 4–10-cu yerlər, bütün iştirakçılar üçün sertifikat. Fondun artma göstəricisi real qeydiyyatçı sayı ilə işləsin.
- **Qaydalar**: dizayndakı mətnlər.
- **Reytinq**: "Şagirdlər", "Məktəblər", "Rayonlar" tabları. Tur bitənə qədər "Nəticələr tur bitdikdən sonra yayımlanacaq" yazılır. Şagirdlərin adı qısaldılmış formada göstərilir (məsələn, "Aysel M."). Məktəb və rayon reytinqi iştirakçıların orta balına görə hesablanır. Ən az 3 iştirakçısı olan məktəb və rayonlar göstərilir.
- **Tez-tez verilən suallar**: dizayndakı mətnlər.
- Səhifə mobil ekranda (360px eni) düzgün görünməlidir.
- Səhifənin sonunda "Bu material Cəfərli Elvin müəllimə məxsusdur" yazısı olsun.

## 3. Qeydiyyat
- İstifadəçi hesabına daxil olubsa, ad, soyad və e-poçt hesabdan avtomatik doldurulur. Üstdə "Məlumatlar hesabından götürüldü. Lazım olsa, dəyişə bilərsən." qeydi göstərilir. Bütün xanalar redaktə edilə bilir.
- Daxil olmayıbsa, əvvəlcə giriş və ya qeydiyyat təklif olunur. Qayıdandan sonra forma avtomatik doldurulmuş şəkildə açılır.
- Vacib xanalar: ad, soyad, sinif (IX / X / XI), rayon/şəhər, e-poçt, qaydalarla razılıq, valideyn razılığı. Məktəb və dəvət kodu könüllüdür.
- "Nəticələrin e-poçtuma göndərilməsinə razıyam" qutusu standart olaraq işarəli olur.
- Bir istifadəçi bir yarışa yalnız bir dəfə qeydiyyatdan keçə bilər. Təkrar cəhddə "Artıq qeydiyyatdasan" mesajı və tur vaxtı göstərilir.
- Qeydiyyatdan sonra:
  - iştirakçıya unikal dəvət kodu verilir (məsələn, `2V2-K7F3Q`) və səhifədə göstərilir;
  - təsdiq e-poçtu göndərilir: turun tarixi, vaxtı, keçid, qaydaların qısa xülasəsi.
- Qeydiyyat bitmə vaxtından sonra forma bağlanır.
- Dəvət kodu yalnız statistika və fondun artması üçün istifadə olunur. Dəvət edənə bal verilmir.

## 4. Onlayn tur
- Tur yalnız təyin olunmuş vaxtda açılır. Ondan əvvəl gözləmə ekranında geri sayım göstərilir. Giriş üçün son vaxtdan sonra yeni giriş bağlanır.
- Turdan 1 saat əvvəl qeydiyyatçılara xatırlatma e-poçtu göndərilir.
- Hər iştirakçı üçün öz variantı yaradılır: suallar eyni şablondan götürülür, rəqəmlər fərqli olur. Variantların cavabları yoxlanılmalıdır. Düzgün cavablar A–E arasında paylanmalıdır, eyni hərfdə toplanmamalıdır.
- Suallar **bir-bir** göstərilir. Hər sualın öz vaxt limiti var. Növbəti suala keçəndən sonra geri qayıtmaq olmur. Sualın vaxtı bitəndə avtomatik növbəti suala keçilir.
- **Vaxt sayğacı server tərəfində işləyir və heç vaxt dayanmır.** Səhifə yenilənsə, bağlantı kəsilsə və ya iştirakçı çıxıb qayıtsa, vaxt işləməyə davam edir. İtən vaxt geri qaytarılmır.
- Verilmiş cavablar dərhal serverdə saxlanılır. Qayıdanda iştirakçı qaldığı sualdan, qalan vaxtla davam edir. Vaxtı bitmiş suallar cavabsız sayılır.
- Səhifədə mətn seçmək, kopyalamaq və sağ klik bağlanır.
- Tab dəyişmə və pəncərədən çıxma jurnala yazılır. Hər dəfə iştirakçıya xəbərdarlıq göstərilir. Bu, avtomatik diskvalifikasiya üçün səbəb deyil, admin yoxlaması üçün siqnaldır.
- Bal hesablanması: əsas meyar düzgün cavabların sayıdır. Bərabər balda daha az ümumi vaxt sərf edən irəlidə olur. Vaxt da eynidirsə, yer bölüşdürülür.
- Tur bitəndən sonra iştirakçı öz balını və yerini görür. Sualların həlli və izahı tur hamı üçün bitdikdən sonra açılır.

## 5. Nəticələr və e-poçt
- Tur bitəndən sonra reytinq avtomatik hesablanır və yayımlanır.
- Nəticə e-poçtları yalnız razılıq verənlərə göndərilir. Hər iştirakçı bunları alır:
  - balı, yeri və iştirakçıların ümumi sayı;
  - finala keçib-keçmədiyi;
  - zəif mövzuları üzrə qısa xülasə;
  - sertifikat linki.
- Finala keçənlərə ayrıca e-poçt göndərilir. Admin finalın vaxtını və məkanını daxil edəndən sonra göndərilir.
- Final nəticələri elan olunanda qaliblərə və bütün iştirakçılara yekun e-poçt göndərilir.
- Hər e-poçtda imtina linki olur.

## 6. Sertifikat
- Hər iştirakçı üçün PDF və ya şəkil formatında sertifikat yaradılır: ad, soyad, yarışın adı, tarix, bal və yer (ilk 10 üçün).
- Sertifikat şəxsi səhifədə və nəticə e-poçtundakı linkdə əlçatan olur.

## 7. Admin paneli
- Yarış yaratmaq və redaktə etmək: tarixlər, müddət, sual sayı, mükafatlar, fond və onun artma həddi.
- Sual şablonlarını əlavə etmək, rəqəmlərin dəyişmə qaydasını təyin etmək, variantlara əvvəlcədən baxmaq.
- Qeydiyyatçıların siyahısı: axtarış, filtr, Excel/CSV ixracı.
- Turun gedişini canlı izləmək: aktiv iştirakçılar, bitirənlər, hadisə jurnalında çox qeydi olanlar.
- Şübhəli nəticələrin siyahısı: çox tab dəyişmə, qeyri-real qısa vaxt, eyni cavab ardıcıllığı. Admin iştirakçını diskvalifikasiya edə bilir və səbəbi yazır.
- Final: finalçıların siyahısı, vaxt və məkanın daxil edilməsi, iştirakın qeydə alınması, final ballarının daxil edilməsi.
- Mükafatlar: qaliblər, ödəniş üsulu (valideynin hesabı / nağd), ödəniş statusu.
- Bütün e-poçtları əl ilə yenidən göndərmək imkanı.

## 8. Yoxlama
- Testlər yaz:
  - qeydiyyat: təkrar qeydiyyat, bağlı qeydiyyat, avtomatik doldurma;
  - tur: vaxtdan əvvəl giriş, gec giriş, geri qayıtma cəhdi, səhifə yenilənəndə vaxtın davam etməsi;
  - variantlar: rəqəmlərin fərqli olması, düzgün cavabların A–E arasında paylanması;
  - bal və sıralama: bərabər bal və vaxt halları;
  - e-poçt: yalnız razılıq verənlərə göndərilməsi.
- Nümunə məlumat yarat: 1 yarış, 20 sual şablonu, ~300 qeydiyyatçı, ~200 nəticə. Səhifə dizayn nümunəsinə bənzər görünməlidir.

## Çıxış
Dəyişdirilən və yaradılan faylların siyahısını, verilənlər bazası dəyişikliklərini və qısa izahı ver. Hər mərhələdən sonra layihə işlək vəziyyətdə qalmalıdır.
