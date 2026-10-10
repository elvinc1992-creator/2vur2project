-- Zəif mövzular: mövzuların ilkin məlumatı (müəllim admin səhifəsində dəyişə bilər).
-- DİM tezliyi: imtahan təhlilindəki (exam_questions_stats) sual sayı / təhlil edilən imtahan sayı.
UPDATE topics SET dim_frequency = round(
  (SELECT count(*) FROM exam_questions_stats s WHERE s.topic_id = topics.id) * 1.0
  / max(1, (SELECT count(DISTINCT exam_key) FROM exam_questions_stats)), 2);
--> statement-breakpoint
-- İmtahan tipləri: I hissə (əsas kurs) — hər üç imtahan; II hissə — yalnız 11-ci sinif və blok.
UPDATE topics SET exam_types = CASE WHEN part = 'II hissə' THEN '11,blok' ELSE '9,11,blok' END;
--> statement-breakpoint
UPDATE topics SET section = CASE slug
  WHEN 'natural-ededler' THEN 'Ədədlər'
  WHEN 'adi-ve-onluq-kesrler' THEN 'Ədədlər'
  WHEN 'faiz-nisbet-tenasub' THEN 'Ədədlər'
  WHEN 'heqiqi-ededler' THEN 'Ədədlər'
  WHEN 'kvadrat-kokler-heqiqi-ustlu-quvvet' THEN 'Ədədlər'
  WHEN 'kompleks-ededler' THEN 'Ədədlər'
  WHEN 'coxluqlar' THEN 'Ədədlər'
  WHEN 'tam-cebri-ifadeler' THEN 'Cəbr'
  WHEN 'coxhedlinin-vuruqlara-ayrilmasi' THEN 'Cəbr'
  WHEN 'rasional-kesrler' THEN 'Cəbr'
  WHEN 'birmechullu-tenlikler-ve-meseleler' THEN 'Cəbr'
  WHEN 'tenlikler-sistemi' THEN 'Cəbr'
  WHEN 'berabersizlikler-ve-sistemleri' THEN 'Cəbr'
  WHEN 'ededi-ardicilliqlar-silsileler' THEN 'Cəbr'
  WHEN 'loqarifm-ustlu-tenlik-berabersizlik' THEN 'Cəbr'
  WHEN 'triqonometriya' THEN 'Cəbr'
  WHEN 'situasiya' THEN 'Cəbr'
  WHEN 'funksiya-ve-qrafikler' THEN 'Funksiyalar'
  WHEN 'limit-toreme-inteqral' THEN 'Funksiyalar'
  WHEN 'hendesenin-esas-anlayislari' THEN 'Həndəsə'
  WHEN 'ucbucaqlar' THEN 'Həndəsə'
  WHEN 'coxbucaqlilar-dordbucaqlilar' THEN 'Həndəsə'
  WHEN 'cevre-ve-daire' THEN 'Həndəsə'
  WHEN 'stereometriya' THEN 'Həndəsə'
  WHEN 'koordinat-ve-vektorlar' THEN 'Həndəsə'
  WHEN 'isbat-meseleleri' THEN 'Həndəsə'
  WHEN 'kombinatorika-ve-ehtimal' THEN 'Statistika və ehtimal'
  ELSE 'Cəbr' END;
--> statement-breakpoint
-- Əsas (ilkin) mövzular: mövzu → onun dayandığı mövzu.
UPDATE topics SET prerequisite_id = (SELECT p.id FROM topics p WHERE p.slug = CASE topics.slug
  WHEN 'adi-ve-onluq-kesrler' THEN 'natural-ededler'
  WHEN 'faiz-nisbet-tenasub' THEN 'adi-ve-onluq-kesrler'
  WHEN 'heqiqi-ededler' THEN 'adi-ve-onluq-kesrler'
  WHEN 'kvadrat-kokler-heqiqi-ustlu-quvvet' THEN 'heqiqi-ededler'
  WHEN 'coxhedlinin-vuruqlara-ayrilmasi' THEN 'tam-cebri-ifadeler'
  WHEN 'rasional-kesrler' THEN 'coxhedlinin-vuruqlara-ayrilmasi'
  WHEN 'birmechullu-tenlikler-ve-meseleler' THEN 'tam-cebri-ifadeler'
  WHEN 'tenlikler-sistemi' THEN 'birmechullu-tenlikler-ve-meseleler'
  WHEN 'berabersizlikler-ve-sistemleri' THEN 'birmechullu-tenlikler-ve-meseleler'
  WHEN 'ededi-ardicilliqlar-silsileler' THEN 'birmechullu-tenlikler-ve-meseleler'
  WHEN 'loqarifm-ustlu-tenlik-berabersizlik' THEN 'kvadrat-kokler-heqiqi-ustlu-quvvet'
  WHEN 'triqonometriya' THEN 'funksiya-ve-qrafikler'
  WHEN 'funksiya-ve-qrafikler' THEN 'birmechullu-tenlikler-ve-meseleler'
  WHEN 'limit-toreme-inteqral' THEN 'funksiya-ve-qrafikler'
  WHEN 'ucbucaqlar' THEN 'hendesenin-esas-anlayislari'
  WHEN 'coxbucaqlilar-dordbucaqlilar' THEN 'ucbucaqlar'
  WHEN 'cevre-ve-daire' THEN 'ucbucaqlar'
  WHEN 'stereometriya' THEN 'coxbucaqlilar-dordbucaqlilar'
  WHEN 'koordinat-ve-vektorlar' THEN 'funksiya-ve-qrafikler'
  WHEN 'kombinatorika-ve-ehtimal' THEN 'natural-ededler'
  WHEN 'kompleks-ededler' THEN 'kvadrat-kokler-heqiqi-ustlu-quvvet'
  WHEN 'situasiya' THEN 'faiz-nisbet-tenasub'
  WHEN 'isbat-meseleleri' THEN 'ucbucaqlar'
  ELSE NULL END);
--> statement-breakpoint
-- Orta sual balı = maksimal bal / sual sayı (riyaziyyat: 100 bal).
UPDATE exam_blueprints SET avg_points = round(100.0 / total_questions, 2);
--> statement-breakpoint
-- Sualın çətinliyi verilməyibsə — orta (2).
UPDATE bank_tasks SET difficulty = 2 WHERE difficulty IS NULL OR difficulty NOT BETWEEN 1 AND 3;
