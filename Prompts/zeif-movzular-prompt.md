# Prompt: "Zəif mövzuların avtomatik aşkarlanması" bölməsi

## Kontekst
Layihə DİM imtahanlarına (9-cu sinif buraxılış, 11-ci sinif buraxılış, blok/qəbul) hazırlıq saytıdır. Saytda hazırda **yalnız riyaziyyat** var. Mövzular bölmələr üzrə qruplaşdırılıb: Ədədlər, Cəbr, Funksiyalar, Həndəsə, Statistika və ehtimal. İnterfeysin bütün mətnləri Azərbaycan dilində olmalıdır.

Layihənin mövcud texnologiyalarından, arxitekturasından və kod qaydalarından istifadə et. Yeni texnologiya əlavə etmə. Başlamazdan əvvəl layihəni öyrən: suallar, mövzular, istifadəçilər və sınaq nəticələri necə saxlanılır.

Dizayn nümunəsi `zeif-movzular.html` faylındadır. Bölmələrə, kart quruluşuna və rənglərə sadiq qal. Statik nümunə məlumatları real məlumatla əvəz et.

## Məqsəd
Şagird üçün bölmə yarat. Bölmə yalnız "mövzu üzrə faiz" göstərməklə kifayətlənmir, həm də bunları deyir:
1. hansı mövzular imtahanda ona **neçə bal itirdir**;
2. **hansı səhvi** təkrarlayır;
3. zəifliyin **kök səbəbi** hansı əsas mövzudadır;
4. **indi nə etməlidir**: hədəfli məşq və təkrar yoxlama.

## 1. Saxlanılmalı məlumatlar
Mövcud strukturu yoxla. Çatışmayanları əlavə et:
- **Mövzu**: bölmə, ad, `dim_frequency` (bir imtahanda bu mövzudan orta sual sayı; müəllim daxil edir), hansı imtahan tiplərinə aid olduğu (9 / 11 / blok).
- **Mövzu asılılığı**: mövzu → onun əsas (ilkin) mövzusu. Məsələn, "Kvadrat tənliklər" → "Vuruqlara ayırma".
- **Səhv tipi**: mövzu, ad, qısa izah. Məsələn, "Faizdə baza səhvi".
- **Sual**: mövzu, çətinlik (1–3), bal.
- **Variant → səhv tipi**: hər yanlış variant bir səhv tipinə bağlana bilər, bu bağlantı könüllüdür.
- **Cəhd**: şagird, sual, seçilmiş cavab, düz/səhv, sərf olunan vaxt (ms), cavabın neçə dəfə dəyişdirildiyi, işarələnib-işarələnmədiyi, sınaq, tarix.
- **Şagird–mövzu nəticəsi** (keşlənmiş): mənimsəmə, bal itkisi, cəhd sayı, status, əsas səhv tipi, növbəti təkrar yoxlama tarixi, yenilənmə tarixi.
- **Gündəlik bal itkisi tarixçəsi**: dinamika qrafiki üçün.

Şagird yalnız öz məlumatlarını görməlidir.

## 2. Hesablama qaydaları
Hər şagird və mövzu üçün son 90 günün cəhdlərindən istifadə et:

```
mənimsəmə = (Σ wᵢ·dᵢ + 3·0.5) / (Σ wᵢ + 3)
wᵢ = çətinlikᵢ × 0.9^(neçə gün əvvəl) × əminlikᵢ
dᵢ = 1 (düz) / 0 (səhv)
əminlikᵢ = 0.5, əgər düz cavab şübhəlidirsə:
   vaxt < sualın median vaxtının 25%-i, ya cavab ≥ 2 dəfə dəyişdirilib, ya da sual işarələnib;
   əks halda 1
```

- **Status**: 5-dən az cəhd → "Məlumat azdır"; mənimsəmə < 50% → "Zəif"; < 75% → "İnkişafda"; əks halda "Mənimsənib".
- **Bal itkisi** = (1 − mənimsəmə) × `dim_frequency` × orta sual balı. Şagirdin hazırlaşdığı imtahan tipinə görə hesablanır.
- **Əsas səhv tipi**: son 30 gündə yanlış cavablarda ən çox təkrarlanan səhv tipi.
- **Kök səbəb**: mövzu "Zəif" və ya "İnkişafda"-dırsa və onun əsas mövzusunun mənimsəməsi 60%-dən aşağıdırsa, xəbərdarlıq göstərilir: "Kök səbəb: X — əvvəlcə onu bərpa et".
- Yenidən hesablama hər sınaq bitəndə yalnız həmin sınaqda iştirak edən mövzular üçün aparılsın. Gündəlik ümumi bal itkisi tarixçəyə yazılsın.

## 3. Hədəfli məşq və təkrar yoxlama
- **"N sualla düzəlt"** düyməsi dəst yaradır. Dəstin yarısı şagirdin əsas səhv tipinə bağlı variantı olan suallardır, yarısı həmin mövzu üzrə DİM imtahan analoqlarıdır. Son 14 gündə həll edilmiş suallar dəstə daxil edilməsin.
- Dəstdə doğru cavablar eyni hərfdə toplanmamalıdır, A–E arasında paylanmalıdır.
- Dəst ≥ 75% nəticə ilə bitəndə 3 gün sonraya təkrar yoxlama (5 sual) təyin olunur. Təkrar yoxlama uğurlu olsa, mövzu "Mənimsənib" statusuna keçir. Uğursuz olsa, "Zəif" statusunda qalır.
- Vaxtı çatmış təkrar yoxlama olanda səhifədə "Təkrar yoxlama vaxtıdır" banneri görünür.

## 4. Səhifə (dizayn nümunəsinə uyğun)
- **Xülasə bloku**: ümumi bal itkisi; ilk 3 mövzu düzələrsə qazanılacaq bal; zəif və inkişafda olan mövzuların sayı; təhlil edilən cavabların sayı; bu həftəki dəyişiklik.
- **Filtr tabları**: Hamısı / Zəif / İnkişafda / Mənimsənib.
- **Mövzu kartları** faizə görə yox, **bal itkisinə görə** azalan sırada düzülür. Hər kartda bunlar olur:
  - sıra nömrəsi, mövzu adı, bölmə və DİM tezliyi;
  - bal itkisi;
  - mənimsəmə zolağı və status;
  - səhv tipinin diaqnozu (1–2 cümlə);
  - kök səbəb xəbərdarlığı (varsa);
  - cəhd sayı və etiketlər (məsələn, "4 təxmini cavab");
  - "N sualla düzəlt" və izah düymələri.
- "Məlumat azdır" statusunda olan kartda yalnız bu mesaj görünür: "5 sual həll et — təhlil üçün məlumat azdır".
- **Bal itkisinin dinamikası**: son 30 günün xətt qrafiki.
- **Ən çox etdiyin səhvlər**: ilk 5 səhv tipi, sayları ilə.
- Səhifə mobil ekranda (360px eni) düzgün görünməlidir.
- Səhifənin sonunda "Bu material Cəfərli Elvin müəllimə məxsusdur" yazısı olsun.

## 5. Müəllim tərəfi (admin)
- Mövzulara `dim_frequency`, imtahan tipləri və əsas mövzu təyin etmək imkanı.
- Səhv tiplərini yaratmaq və suallarda yanlış variantları səhv tipinə bağlamaq imkanı.

## 6. Cavab kartı ilə inteqrasiya
Sınaq zamanı hər cavab üçün bu məlumatlar saxlanılmalıdır: sərf olunan vaxt, cavabın dəyişdirilmə sayı və işarələnmə. Hazırda saxlanılmırsa, əlavə et.

## 7. Yoxlama
- Hesablama qaydaları üçün testlər yaz. Bu halları yoxla: az cəhd, köhnə cəhdlərin zəifləməsi, şübhəli düz cavablar, kök səbəb xəbərdarlığı, bal itkisinə görə sıralama.
- Nümunə məlumat yarat: 1 şagird, 6 riyaziyyat mövzusu, ~200 cəhd. Bu məlumatla səhifə dizayn nümunəsinə bənzər görünməlidir.

## Çıxış
Dəyişdirilən və yaradılan faylların siyahısını, verilənlər bazası dəyişikliklərini və qısa izahı ver. Hər mərhələdən sonra layihə işlək vəziyyətdə qalmalıdır.
