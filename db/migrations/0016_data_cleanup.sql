-- 1) user_answers: vəziyyət yazılarkən köhnə cavablar təkrar yazılırdı (state.ts xətası) — hər sual üçün ilk sətir qalır.
DELETE FROM user_answers
WHERE question_ref NOT LIKE 'w:%'
  AND id NOT IN (SELECT min(id) FROM user_answers GROUP BY user_id, source, question_ref);
--> statement-breakpoint
-- 2) Köhnə statik sınaqlar silinir — onların cavabları (sual artıq yoxdur) təhlildən çıxarılır.
DELETE FROM user_answers WHERE source = 'exam';
--> statement-breakpoint
-- 3) Zəif mövzular: keş və tarixçə təmiz məlumatla yenidən hesablanacaq.
DELETE FROM user_topic_stats;
--> statement-breakpoint
DELETE FROM user_loss_history;
--> statement-breakpoint
-- 4) Tədris sırası: tasks_NN faylının nömrəsi.
UPDATE topics SET curriculum_order = CASE slug
  WHEN 'natural-ededler' THEN 1
  WHEN 'adi-ve-onluq-kesrler' THEN 2
  WHEN 'faiz-nisbet-tenasub' THEN 3
  WHEN 'heqiqi-ededler' THEN 4
  WHEN 'tam-cebri-ifadeler' THEN 5
  WHEN 'coxhedlinin-vuruqlara-ayrilmasi' THEN 6
  WHEN 'rasional-kesrler' THEN 7
  WHEN 'kvadrat-kokler-heqiqi-ustlu-quvvet' THEN 8
  WHEN 'birmechullu-tenlikler-ve-meseleler' THEN 9
  WHEN 'tenlikler-sistemi' THEN 10
  WHEN 'berabersizlikler-ve-sistemleri' THEN 11
  WHEN 'ededi-ardicilliqlar-silsileler' THEN 12
  WHEN 'coxluqlar' THEN 13
  WHEN 'hendesenin-esas-anlayislari' THEN 14
  WHEN 'ucbucaqlar' THEN 15
  WHEN 'coxbucaqlilar-dordbucaqlilar' THEN 16
  WHEN 'cevre-ve-daire' THEN 17
  WHEN 'isbat-meseleleri' THEN 18
  WHEN 'situasiya' THEN 19
  WHEN 'funksiya-ve-qrafikler' THEN 20
  WHEN 'triqonometriya' THEN 21
  WHEN 'loqarifm-ustlu-tenlik-berabersizlik' THEN 22
  WHEN 'limit-toreme-inteqral' THEN 23
  WHEN 'kombinatorika-ve-ehtimal' THEN 24
  WHEN 'kompleks-ededler' THEN 25
  WHEN 'koordinat-ve-vektorlar' THEN 26
  WHEN 'stereometriya' THEN 27
  ELSE 100 END;
--> statement-breakpoint
-- 5) İmtahan tipləri — topic_questions/dim-movzular.md ([9] IX buraxılış · [11] XI buraxılış · [B] blok).
UPDATE topics SET exam_types = CASE slug
  WHEN 'triqonometriya' THEN '11,blok'
  WHEN 'loqarifm-ustlu-tenlik-berabersizlik' THEN '11,blok'
  WHEN 'limit-toreme-inteqral' THEN '11,blok'
  WHEN 'stereometriya' THEN '11,blok'
  WHEN 'kompleks-ededler' THEN 'blok'
  ELSE '9,11,blok' END;
--> statement-breakpoint
-- 6) Ödənişlər: vəziyyətdəki (JSON) qəbzlər payments cədvəlinə köçürülür.
INSERT OR IGNORE INTO payments (id, user_id, kind, title, amount, tier, period, exam_id, created_at)
SELECT
  s.user_id || ':' || json_extract(p.value, '$.id'),
  s.user_id,
  CASE WHEN json_extract(p.value, '$.examId') IS NOT NULL THEN 'exam' ELSE 'subscription' END,
  json_extract(p.value, '$.title'),
  coalesce(cast(replace(json_extract(p.value, '$.amount'), ' AZN', '') AS real), 0),
  CASE
    WHEN json_extract(p.value, '$.title') LIKE 'Pro %' THEN 'pro'
    WHEN json_extract(p.value, '$.title') LIKE 'Premium%' THEN 'premium'
    ELSE NULL END,
  json_extract(p.value, '$.period'),
  json_extract(p.value, '$.examId'),
  coalesce(cast(strftime('%s', json_extract(p.value, '$.date')) AS integer) * 1000, 0)
FROM user_state s, json_each(s.data, '$.payments') p
WHERE EXISTS (SELECT 1 FROM users u WHERE u.id = s.user_id);
--> statement-breakpoint
-- 7) Test üçün admin.
UPDATE users SET role = 'admin' WHERE email = 'elvinc1992@gmail.com';
