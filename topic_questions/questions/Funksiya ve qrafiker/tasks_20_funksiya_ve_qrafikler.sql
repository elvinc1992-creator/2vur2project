-- Mövzu: Funksiya və qrafiklər — 71 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- FNQ-0001 | əsas: 2025 toplu, II hissə, səh.4 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=kx+b, y=k/x funksiyaları, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=\dfrac14x-12$ funksiyasının sıfırlarını tapın.',
  '[{"key": "A", "text": "$0$"}, {"key": "B", "text": "yoxdur"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$-48$"}, {"key": "E", "text": "$48$"}]'::jsonb, 'E', NULL, NULL,
  '$\dfrac14x-12=0\Rightarrow x=48$.',
  2025, 'II', 4, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0002 | əsas: 2025 toplu, II hissə, səh.4 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=kx+b, y=k/x funksiyaları, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=-7$ funksiyasının sıfırlarını tapın.',
  '[{"key": "A", "text": "yoxdur"}, {"key": "B", "text": "$0$"}, {"key": "C", "text": "$-7$"}, {"key": "D", "text": "$\\pm7$"}, {"key": "E", "text": "$7$"}]'::jsonb, 'A', NULL, NULL,
  'Sabit funksiyanın qiyməti həmişə $-7\ne0$-dır, sıfırları yoxdur.',
  2025, 'II', 4, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0003 | əsas: 2025 toplu, II hissə, səh.4 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=kx+b, y=k/x funksiyaları, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$k$-nın hansı qiymətində $y=\dfrac{k+3}{x}$ funksiyasının qrafiki $A(-4;\ 5)$ nöqtəsindən keçir?',
  '[{"key": "A", "text": "$17$"}, {"key": "B", "text": "$23$"}, {"key": "C", "text": "$-17$"}, {"key": "D", "text": "$-23$"}, {"key": "E", "text": "$-20$"}]'::jsonb, 'D', NULL, NULL,
  '$5=\dfrac{k+3}{-4}\Rightarrow k+3=-20\Rightarrow k=-23$.',
  2025, 'II', 4, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0004 | əsas: 2025 toplu, II hissə, səh.4 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=kx+b, y=k/x funksiyaları, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'closed',
  'Bucaq əmsalı $-0{,}6$ olan xətti funksiyanın qrafiki $A(-1{,}5;\ 3{,}4)$ nöqtəsindən keçirsə, onun tənliyini yazın.',
  '[{"key": "A", "text": "$y=0{,}6x+2{,}5$"}, {"key": "B", "text": "$y=-0{,}6x-2{,}5$"}, {"key": "C", "text": "$y=-0{,}6x+4{,}3$"}, {"key": "D", "text": "$y=-1{,}5x+3{,}4$"}, {"key": "E", "text": "$y=-0{,}6x+2{,}5$"}]'::jsonb, 'E', NULL, NULL,
  '$y=-0{,}6x+b$; $3{,}4=-0{,}6\cdot(-1{,}5)+b=0{,}9+b\Rightarrow b=2{,}5$.',
  2025, 'II', 4, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0005 | əsas: 2025 toplu, II hissə, səh.4 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0005', '/images/tasks/FNQ-0005.png', 'Koordinat başlanğıcından keçən düz xətt, absis oxunun müsbət istiqaməti ilə 150° bucaq əmələ gətirir', (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=kx+b, y=k/x funksiyaları, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'closed',
  'Qrafikə görə xətti asılılığı müəyyən edin.',
  '[{"key": "A", "text": "$y=\\sqrt3x$"}, {"key": "B", "text": "$y=-\\sqrt3x$"}, {"key": "C", "text": "$y=-x$"}, {"key": "D", "text": "$y=\\dfrac{\\sqrt3}{3}x$"}, {"key": "E", "text": "$y=-\\dfrac{\\sqrt3}{3}x$"}]'::jsonb, 'E', NULL, NULL,
  'Düz xətt koordinat başlanğıcından keçir: $y=kx$, $k=\operatorname{tg}150^\circ=-\operatorname{tg}30^\circ=-\dfrac{\sqrt3}{3}$.',
  2025, 'II', 4, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0006 | əsas: 2025 toplu, II hissə, səh.4 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0006', '/images/tasks/FNQ-0006.png', 'Koordinat müstəvisində y=kx+b düz xətti', (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=kx+b, y=k/x funksiyaları, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=kx+b$ xətti funksiyasının verilmiş qrafikinə görə $k$ və $b$-nin işarəsini müəyyən edin.',
  '[{"key": "A", "text": "$k>0,\\ b=0$"}, {"key": "B", "text": "$k<0,\\ b>0$"}, {"key": "C", "text": "$k>0,\\ b>0$"}, {"key": "D", "text": "$k>0,\\ b<0$"}, {"key": "E", "text": "$k<0,\\ b<0$"}]'::jsonb, 'D', NULL, NULL,
  'Düz xətt soldan sağa yuxarı qalxır, ona görə $k>0$. Ordinat oxunu koordinat başlanğıcından aşağıda kəsir: $b<0$.',
  2025, 'II', 4, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0007 | əsas: 2025 toplu, II hissə, səh.4 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0007', '/images/tasks/FNQ-0007.png', 'Koordinat müstəvisində y=kx+b düz xətti', (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=kx+b, y=k/x funksiyaları, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=kx+b$ xətti funksiyasının verilmiş qrafikinə görə $k$ və $b$-nin işarəsini müəyyən edin.',
  '[{"key": "A", "text": "$k>0,\\ b>0$"}, {"key": "B", "text": "$k>0,\\ b<0$"}, {"key": "C", "text": "$k<0,\\ b<0$"}, {"key": "D", "text": "$k<0,\\ b>0$"}, {"key": "E", "text": "$k>0,\\ b=0$"}]'::jsonb, 'C', NULL, NULL,
  'Düz xətt soldan sağa aşağı enir, ona görə $k<0$. Ordinat oxunu koordinat başlanğıcından aşağıda kəsir: $b<0$.',
  2025, 'II', 4, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0008 | əsas: 2025 toplu, II hissə, səh.4 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0008', '/images/tasks/FNQ-0008.png', 'Ordinat oxunu 6-da, absis oxunu −3-də kəsən düz xətt', (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=kx+b, y=k/x funksiyaları, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=kx+b$ funksiyasının qrafikinə əsasən $k+b$ cəmini tapın.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$-4$"}, {"key": "C", "text": "$8$"}, {"key": "D", "text": "$-8$"}, {"key": "E", "text": "$6$"}]'::jsonb, 'C', NULL, NULL,
  'Qrafik $(0;\ 6)$ və $(-3;\ 0)$ nöqtələrindən keçir: $b=6$, $0=-3k+6\Rightarrow k=2$. $k+b=8$.',
  2025, 'II', 4, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0009 | əsas: 2025 toplu, II hissə, səh.4 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=kx+b, y=k/x funksiyaları, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=\dfrac25x+6$ düz xətti üzərində absisi ordinatına bərabər olan nöqtənin koordinatları cəmini tapın.',
  '[{"key": "A", "text": "$20$"}, {"key": "B", "text": "$10$"}, {"key": "C", "text": "$15$"}, {"key": "D", "text": "$12$"}, {"key": "E", "text": "$30$"}]'::jsonb, 'A', NULL, NULL,
  '$x=\dfrac25x+6\Rightarrow\dfrac35x=6\Rightarrow x=10$. Nöqtə $(10;\ 10)$, cəm $20$.',
  2025, 'II', 4, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0010 | əsas: 2025 toplu, II hissə, səh.4 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=kx+b, y=k/x funksiyaları, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=\dfrac34x-3$ düz xətti üzərində absisi ordinatına bərabər olan nöqtənin koordinatları cəmini tapın.',
  '[{"key": "A", "text": "$-12$"}, {"key": "B", "text": "$24$"}, {"key": "C", "text": "$-6$"}, {"key": "D", "text": "$12$"}, {"key": "E", "text": "$-24$"}]'::jsonb, 'E', NULL, NULL,
  '$x=\dfrac34x-3\Rightarrow\dfrac14x=-3\Rightarrow x=-12$. Cəm $-24$.',
  2025, 'II', 4, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0011 | əsas: 2025 toplu, II hissə, səh.5 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0011', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=kx+b, y=k/x funksiyaları, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'open',
  '$a$ parametrinin neçə tam qiymətində $y=3ax+2a^2-10a$ funksiyasının qrafiki ordinat oxunu mənfi hissəsində kəsir?',
  NULL, NULL, NULL, '4',
  '$x=0$ olduqda $y=2a^2-10a<0\Rightarrow0<a<5$. Tam qiymətlər $1,2,3,4$ — $4$ ədəd.',
  2025, 'II', 5, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0012 | əsas: 2025 toplu, II hissə, səh.5 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0012', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=kx+b, y=k/x funksiyaları, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'open',
  '$m$ parametrinin hansı müsbət qiymətində $f(x)=\dfrac{mx+8}{2x+m}$ sabit funksiya olar?',
  NULL, NULL, NULL, '4',
  'Kəsr sabitdirsə, surət və məxrəc mütənasibdir: $\dfrac m2=\dfrac8m\Rightarrow m^2=16$, $m=4$. Yoxlama: $\dfrac{4x+8}{2x+4}=2$.',
  2025, 'II', 5, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0013 | əsas: 2025 toplu, II hissə, səh.6 №27
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=kx+b, y=k/x funksiyaları, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'matching',
  'Düz xətlər üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$3x+2y=1$"}, {"key": "2", "text": "$3x+3y=-1$"}, {"key": "3", "text": "$3x+2y=0$"}], "right": [{"key": "a", "text": "qrafiki koordinat başlanğıcından keçir"}, {"key": "b", "text": "bucaq əmsalı $-1{,}5$-ə bərabərdir"}, {"key": "c", "text": "qrafiki $(1;\\ -1)$ nöqtəsindən keçir"}, {"key": "d", "text": "absis oxunun müsbət istiqaməti ilə $135^\\circ$-li bucaq əmələ gətirir"}, {"key": "e", "text": "qrafiki $\\left(-1;\\ \\dfrac23\\right)$ nöqtəsindən keçir"}]}'::jsonb, NULL, '{"1": ["b", "c"], "2": ["d", "e"], "3": ["a", "b"]}'::jsonb, NULL,
  '1) $y=-1{,}5x+0{,}5$: bucaq əmsalı $-1{,}5$; $x=1$ olduqda $y=-1$. 2) $y=-x-\dfrac13$: $k=-1=\operatorname{tg}135^\circ$; $x=-1$ olduqda $y=\dfrac23$. 3) $y=-1{,}5x$: başlanğıcdan keçir, $k=-1{,}5$.',
  2025, 'II', 6, 27)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0014 | əsas: 2025 toplu, II hissə, səh.6 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=kx+b, y=k/x funksiyaları, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'matching',
  '$y=kx+b$ funksiyasının qrafiki üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$k>0,\\ b<0$"}, {"key": "2", "text": "$k<0,\\ b>0$"}, {"key": "3", "text": "$k=-1,\\ b=0$"}], "right": [{"key": "a", "text": "I və III rüblərin tənbölənidir"}, {"key": "b", "text": "I, III və IV rüblərdən keçir"}, {"key": "c", "text": "II və IV rüblərin tənbölənidir"}, {"key": "d", "text": "I, II və IV rüblərdən keçir"}, {"key": "e", "text": "absis oxunun müsbət istiqaməti ilə kor bucaq əmələ gətirir"}]}'::jsonb, NULL, '{"1": ["b"], "2": ["d", "e"], "3": ["c", "e"]}'::jsonb, NULL,
  '1) Artan düz xətt ordinat oxunu aşağıda kəsir: I, III, IV rüblər. 2) Azalan, ordinatı yuxarıda kəsir: I, II, IV rüblər; $k<0$ olduğundan bucaq kordur. 3) $y=-x$ — II və IV rüblərin tənböləni, bucaq $135^\circ$.',
  2025, 'II', 6, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0015 | əsas: 2025 toplu, II hissə, səh.6 №29
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0015', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=kx+b, y=k/x funksiyaları, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'matching',
  '$y=kx+b$ funksiyasının qrafiki üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$k>0,\\ b>0$"}, {"key": "2", "text": "$k<0,\\ b<0$"}, {"key": "3", "text": "$k=1,\\ b=0$"}], "right": [{"key": "a", "text": "I, II və III rüblərdən keçir"}, {"key": "b", "text": "II, III və IV rüblərdən keçir"}, {"key": "c", "text": "I və III rüblərin tənbölənidir"}, {"key": "d", "text": "II və IV rüblərin tənbölənidir"}, {"key": "e", "text": "absis oxunun müsbət istiqaməti ilə iti bucaq əmələ gətirir"}]}'::jsonb, NULL, '{"1": ["a", "e"], "2": ["b"], "3": ["c", "e"]}'::jsonb, NULL,
  '1) Artan, ordinatı yuxarıda kəsir: I, II, III rüblər; $k>0$ — iti bucaq. 2) Azalan, ordinatı aşağıda kəsir: II, III, IV rüblər. 3) $y=x$ — I və III rüblərin tənböləni, bucaq $45^\circ$.',
  2025, 'II', 6, 29)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0016 | əsas: 2025 toplu, II hissə, səh.6 №34
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=kx+b, y=k/x funksiyaları, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'open',
  '$f(x)$ xətti funksiyası üçün $f(2x-3)+f(3x+1)=10x+3$ olarsa, $f(4)$-ü hesablayın.',
  NULL, NULL, NULL, '11,5',
  '$f(x)=ax+b$: $a(2x-3)+b+a(3x+1)+b=5ax-2a+2b=10x+3$. $a=2$, $-4+2b=3\Rightarrow b=3{,}5$. $f(4)=8+3{,}5=11{,}5$.',
  2025, 'II', 6, 34)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0017 | əsas: 2025 toplu, II hissə, səh.8 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0017', '/images/tasks/FNQ-0017.png', 'Qolları yuxarı yönəlmiş parabola, absis oxunu 2 və 5 nöqtələrində kəsir, ordinat oxunu müsbət hissədə kəsir', (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=x², y=xⁿ (n>2) funksiyaları, kvadratik funksiya, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=ax^2+bx+c$ funksiyasının qrafiki verilmişdir. Münasibətlərdən hansı doğrudur?',
  '[{"key": "A", "text": "$bc>0$"}, {"key": "B", "text": "$\\dfrac{b}{a}<0$"}, {"key": "C", "text": "$\\dfrac{c}{a}<0$"}, {"key": "D", "text": "$b^2-4ac<0$"}, {"key": "E", "text": "$a+b+c<0$"}]'::jsonb, 'B', NULL, NULL,
  'Qolları yuxarıdır: $a>0$. Ordinat oxunu müsbət hissədə kəsir: $c>0$. Təpənin absisi müsbətdir: $-\dfrac{b}{2a}>0\Rightarrow\dfrac ba<0$ — doğrudur. İki kök var: $b^2-4ac>0$. $a+b+c=f(1)$ və $x=1$ köklərdən ($2$ və $5$) solda olduğundan $f(1)>0$. $c>0$, $b<0$ olduğundan $bc<0$.',
  2025, 'II', 8, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0018 | əsas: 2025 toplu, II hissə, səh.8 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0018', '/images/tasks/FNQ-0018.png', 'Qolları aşağı yönəlmiş parabola, absis oxunu −4 və −1 nöqtələrində kəsir, ordinat oxunu mənfi hissədə kəsir', (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=x², y=xⁿ (n>2) funksiyaları, kvadratik funksiya, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=ax^2+bx+c$ funksiyasının qrafiki verilmişdir. Münasibətlərdən hansı doğrudur?',
  '[{"key": "A", "text": "$ab<0$"}, {"key": "B", "text": "$\\dfrac{c}{a}>0$"}, {"key": "C", "text": "$b^2-4ac<0$"}, {"key": "D", "text": "$a-b+c>0$"}, {"key": "E", "text": "$\\dfrac{b}{a}<0$"}]'::jsonb, 'B', NULL, NULL,
  'Qolları aşağıdır: $a<0$. Ordinatı mənfi hissədə kəsir: $c<0$, deməli $\dfrac ca>0$ — doğrudur. Təpənin absisi mənfidir: $-\dfrac{b}{2a}<0\Rightarrow\dfrac ba>0$, $ab>0$. İki kök var: $b^2-4ac>0$. $a-b+c=f(-1)=0$ ($x=-1$ kökdür).',
  2025, 'II', 8, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0019 | əsas: 2025 toplu, II hissə, səh.8 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=x², y=xⁿ (n>2) funksiyaları, kvadratik funksiya, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=ax^2+bx+1$ funksiyası üçün $f(1)>6$ və $f(-1)>-2$ şərtləri ödənərsə, $a$ üçün hansı münasibət doğrudur?',
  '[{"key": "A", "text": "$a>3$"}, {"key": "B", "text": "$a<-1$"}, {"key": "C", "text": "$a<1$"}, {"key": "D", "text": "$a>1$"}, {"key": "E", "text": "$0<a<1$"}]'::jsonb, 'D', NULL, NULL,
  '$a+b+1>6\Rightarrow a+b>5$; $a-b+1>-2\Rightarrow a-b>-3$. Toplasaq: $2a>2\Rightarrow a>1$. Hər $a>1$ üçün uyğun $b$ var ($5-a<b<a+3$).',
  2025, 'II', 8, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0020 | əsas: 2025 toplu, II hissə, səh.8 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=x², y=xⁿ (n>2) funksiyaları, kvadratik funksiya, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=ax^2+bx+1$ funksiyası üçün $f(1)>4$ və $f(-1)>-6$ şərtləri ödənərsə, $a$ üçün hansı münasibət doğrudur?',
  '[{"key": "A", "text": "$a<2$"}, {"key": "B", "text": "$a<-2$"}, {"key": "C", "text": "$-2<a<0$"}, {"key": "D", "text": "$a>0$"}, {"key": "E", "text": "$a>-2$"}]'::jsonb, 'E', NULL, NULL,
  '$a+b>3$ və $a-b>-7$. Toplasaq: $2a>-4\Rightarrow a>-2$.',
  2025, 'II', 8, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0021 | əsas: 2025 toplu, II hissə, səh.8 №27
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0021', '/images/tasks/FNQ-0021.png', 'Absis oxunu 2 və 4-də, ordinat oxunu 4-də kəsən, qolları yuxarı yönəlmiş parabola', (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=x², y=xⁿ (n>2) funksiyaları, kvadratik funksiya, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'closed',
  'Təsvir olunmuş parabola hansı funksiyanın qrafikidir?',
  '[{"key": "A", "text": "$y=2(x-2)(x-4)$"}, {"key": "B", "text": "$y=-\\dfrac12(x-2)(x-4)$"}, {"key": "C", "text": "$y=\\dfrac12(x-2)(x-4)$"}, {"key": "D", "text": "$y=\\dfrac12(x+2)(x+4)$"}, {"key": "E", "text": "$y=(x-2)(x-4)$"}]'::jsonb, 'C', NULL, NULL,
  'Köklər $2$ və $4$: $y=a(x-2)(x-4)$. $x=0$ olduqda $y=8a=4\Rightarrow a=\dfrac12$.',
  2025, 'II', 8, 27)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0022 | əsas: 2025 toplu, II hissə, səh.8 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0022', '/images/tasks/FNQ-0022.png', 'Absis oxunu −2 və 3-də, ordinat oxunu 4-də kəsən, qolları aşağı yönəlmiş parabola', (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=x², y=xⁿ (n>2) funksiyaları, kvadratik funksiya, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'closed',
  'Parabola hansı funksiyanın qrafikidir?',
  '[{"key": "A", "text": "$y=\\dfrac23(x+2)(x-3)$"}, {"key": "B", "text": "$y=-\\dfrac32(x+2)(x-3)$"}, {"key": "C", "text": "$y=-(x+2)(x-3)$"}, {"key": "D", "text": "$y=-\\dfrac23(x+2)(x-3)$"}, {"key": "E", "text": "$y=-\\dfrac23(x-2)(x+3)$"}]'::jsonb, 'D', NULL, NULL,
  'Köklər $-2$ və $3$: $y=a(x+2)(x-3)$; $x=0$ olduqda $-6a=4\Rightarrow a=-\dfrac23$.',
  2025, 'II', 8, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0023 | əsas: 2025 toplu, II hissə, səh.8 №29
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=x², y=xⁿ (n>2) funksiyaları, kvadratik funksiya, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$p$ və $q$ parametrlərinin hansı qiymətlərində $M(1{,}5;\ -6)$ nöqtəsi $y=x^2+px+q$ parabolasının təpə nöqtəsi olar?',
  '[{"key": "A", "text": "$p=-1{,}5;\\ q=-6$"}, {"key": "B", "text": "$p=-3;\\ q=-3{,}75$"}, {"key": "C", "text": "$p=3;\\ q=-3{,}75$"}, {"key": "D", "text": "$p=-3;\\ q=-6$"}, {"key": "E", "text": "$p=3;\\ q=8{,}25$"}]'::jsonb, 'B', NULL, NULL,
  'Təpənin absisi $-\dfrac p2=1{,}5\Rightarrow p=-3$. $y(1{,}5)=2{,}25-4{,}5+q=-6\Rightarrow q=-3{,}75$.',
  2025, 'II', 8, 29)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0024 | əsas: 2025 toplu, II hissə, səh.8 №30
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=x², y=xⁿ (n>2) funksiyaları, kvadratik funksiya, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=x^2+px+25$ parabolasının təpəsi $Ox$ oxu üzərindədir. $p$ parametrinin hansı qiymətində parabolanın təpə nöqtəsinin absisi müsbət olar?',
  '[{"key": "A", "text": "$-5$"}, {"key": "B", "text": "$0$"}, {"key": "C", "text": "$-10$"}, {"key": "D", "text": "$10$"}, {"key": "E", "text": "$5$"}]'::jsonb, 'C', NULL, NULL,
  'Təpə $Ox$ üzərindədirsə $D=p^2-100=0\Rightarrow p=\pm10$. Absis $-\dfrac p2>0\Rightarrow p=-10$.',
  2025, 'II', 8, 30)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0025 | əsas: 2025 toplu, II hissə, səh.8 №31
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0025', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=x², y=xⁿ (n>2) funksiyaları, kvadratik funksiya, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=x^2-px+4$ parabolasının təpə nöqtəsi $Ox$ oxu üzərində yerləşir. $p$ parametrinin hansı qiymətində parabolanın təpə nöqtəsinin absisi mənfi olar?',
  '[{"key": "A", "text": "$-2$"}, {"key": "B", "text": "$-8$"}, {"key": "C", "text": "$-4$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$4$"}]'::jsonb, 'C', NULL, NULL,
  '$D=p^2-16=0\Rightarrow p=\pm4$. Absis $\dfrac p2<0\Rightarrow p=-4$.',
  2025, 'II', 8, 31)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0026 | əsas: 2025 toplu, II hissə, səh.8 №32
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=x², y=xⁿ (n>2) funksiyaları, kvadratik funksiya, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=ax^2+bx+c$ funksiyası $x=-1$ olduqda $4$-ə bərabər olan ən kiçik qiymətini alır. $x=0$ olduqda isə funksiyanın qiyməti $7$-yə bərabərdir. $a,\ b,\ c$ əmsallarını tapın.',
  '[{"key": "A", "text": "$a=3;\\ b=6;\\ c=7$"}, {"key": "B", "text": "$a=2;\\ b=4;\\ c=6$"}, {"key": "C", "text": "$a=1;\\ b=2;\\ c=7$"}, {"key": "D", "text": "$a=3;\\ b=6;\\ c=4$"}, {"key": "E", "text": "$a=3;\\ b=-6;\\ c=7$"}]'::jsonb, 'A', NULL, NULL,
  '$y=a(x+1)^2+4$; $y(0)=a+4=7\Rightarrow a=3$. $y=3x^2+6x+7$.',
  2025, 'II', 8, 32)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0027 | əsas: 2025 toplu, II hissə, səh.8 №33
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0027', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=x², y=xⁿ (n>2) funksiyaları, kvadratik funksiya, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=ax^2+bx+c$ funksiyası $x=2$ olduqda $-3$-ə bərabər olan ən kiçik qiymətini alır. $x=0$ olduqda funksiyanın qiyməti $5$-ə bərabərdir. $a,\ b,\ c$ əmsallarını tapın.',
  '[{"key": "A", "text": "$a=2;\\ b=-8;\\ c=5$"}, {"key": "B", "text": "$a=4;\\ b=-16;\\ c=5$"}, {"key": "C", "text": "$a=2;\\ b=8;\\ c=5$"}, {"key": "D", "text": "$a=1;\\ b=-4;\\ c=5$"}, {"key": "E", "text": "$a=2;\\ b=-8;\\ c=-3$"}]'::jsonb, 'A', NULL, NULL,
  '$y=a(x-2)^2-3$; $y(0)=4a-3=5\Rightarrow a=2$. $y=2x^2-8x+5$.',
  2025, 'II', 8, 33)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0028 | əsas: 2025 toplu, II hissə, səh.9 №38
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0028', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=x², y=xⁿ (n>2) funksiyaları, kvadratik funksiya, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$m$ parametrinin hansı qiymətlərində $y=(m+1)x^2+(m+1)x+m-1$ funksiyası $x$-in istənilən həqiqi qiymətlərində müsbət qiymətlər alır?',
  '[{"key": "A", "text": "$m>1\\dfrac23$"}, {"key": "B", "text": "$m>-1$"}, {"key": "C", "text": "$m<-1$"}, {"key": "D", "text": "$-1<m<1\\dfrac23$"}, {"key": "E", "text": "$0<m<2$"}]'::jsonb, 'A', NULL, NULL,
  '$m=-1$ olduqda $y=-2<0$. $m\ne-1$ üçün $m+1>0$ və $D=(m+1)^2-4(m+1)(m-1)=(m+1)(5-3m)<0$ olmalıdır. $m>-1$ olduğundan $5-3m<0\Rightarrow m>\dfrac53=1\dfrac23$.',
  2025, 'II', 9, 38)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0029 | əsas: 2025 toplu, II hissə, səh.9 №39
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0029', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=x², y=xⁿ (n>2) funksiyaları, kvadratik funksiya, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$n$ parametrinin hansı qiymətlərində $y=nx^2+(n-4)x+n$ funksiyası $x$-in istənilən həqiqi qiymətlərində mənfi qiymətlər alır?',
  '[{"key": "A", "text": "$-4<n<0$"}, {"key": "B", "text": "$n>\\dfrac43$"}, {"key": "C", "text": "$n<0$"}, {"key": "D", "text": "$-4<n<\\dfrac43$"}, {"key": "E", "text": "$n<-4$"}]'::jsonb, 'E', NULL, NULL,
  '$n=0$ olduqda $y=-4x$ — həmişə mənfi deyil. $n<0$ və $D=(n-4)^2-4n^2=-(n+4)(3n-4)<0\Rightarrow(n+4)(3n-4)>0\Rightarrow n<-4$ və ya $n>\dfrac43$. $n<0$ ilə: $n<-4$.',
  2025, 'II', 9, 39)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0030 | əsas: 2025 toplu, II hissə, səh.10 №59
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0030', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=x², y=xⁿ (n>2) funksiyaları, kvadratik funksiya, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'written',
  '$p$-in hansı ən kiçik tam qiymətində $y=x^2+(p-5)x+9$ parabolasının təpə nöqtəsi III rübdə yerləşər?',
  NULL, NULL, NULL, '12',
  'Təpə: $x_0=-\dfrac{p-5}{2}<0\Rightarrow p>5$; $y_0=9-\dfrac{(p-5)^2}{4}<0\Rightarrow(p-5)^2>36\Rightarrow p-5>6$. $p>11$, ən kiçik tam qiymət $12$.',
  2025, 'II', 10, 59)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0031 | əsas: 2025 toplu, II hissə, səh.10 №60
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0031', '/images/tasks/FNQ-0031.png', 'Qolları aşağı yönəlmiş parabola, absis oxunu B(−2; 0) və A nöqtələrində, ordinat oxunu 6-da kəsir', (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=x², y=xⁿ (n>2) funksiyaları, kvadratik funksiya, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'written',
  '$f(x)=ax^2+bx+c$ funksiyasının qrafiki verilib. $AB=5$ və $B(-2;\ 0)$ olarsa, $(a-b-c)$-ni tapın.',
  NULL, NULL, NULL, '-8',
  '$A(3;\ 0)$. $f(x)=a(x+2)(x-3)$; qrafikdən $f(0)=6$: $-6a=6\Rightarrow a=-1$. $f(x)=-x^2+x+6$: $a=-1$, $b=1$, $c=6$. $a-b-c=-8$.',
  2025, 'II', 10, 60)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0032 | əsas: 2025 toplu, II hissə, səh.10 №61
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0032', '/images/tasks/FNQ-0032.png', 'Qolları aşağı yönəlmiş parabola, absis oxunu B(−4; 0) və A nöqtələrində, ordinat oxunu 4-də kəsir', (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=x², y=xⁿ (n>2) funksiyaları, kvadratik funksiya, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'written',
  '$f(x)=ax^2+bx+c$ funksiyasının qrafiki verilib. $AB=6$ və $B(-4;\ 0)$ olarsa, $(a+b-c)$-ni tapın.',
  NULL, NULL, NULL, '-5,5',
  '$A(2;\ 0)$. $f(x)=a(x+4)(x-2)$; $f(0)=-8a=4\Rightarrow a=-\dfrac12$. $f(x)=-\dfrac12x^2-x+4$. $a+b-c=-\dfrac12-1-4=-5{,}5$.',
  2025, 'II', 10, 61)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0033 | əsas: 2025 toplu, II hissə, səh.10 №62
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0033', '/images/tasks/FNQ-0033.png', 'Qolları aşağı yönəlmiş parabola absis oxunu müsbət hissədə A və B nöqtələrində kəsir', (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=x², y=xⁿ (n>2) funksiyaları, kvadratik funksiya, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'written',
  '$k$ parametrinin hansı qiymətində qrafiki verilmiş $f(x)=-x^2+10x+k-4$ funksiyası üçün $3AO=AB$ bərabərliyi doğru olar?',
  NULL, NULL, NULL, '-12',
  '$A(x_1;\ 0)$, $B(x_2;\ 0)$, $0<x_1<x_2$. $3x_1=x_2-x_1\Rightarrow x_2=4x_1$. Viyet: $x_1+x_2=5x_1=10\Rightarrow x_1=2$, $x_2=8$; $x_1x_2=-(k-4)=16\Rightarrow k=-12$.',
  2025, 'II', 10, 62)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0034 | əsas: 2025 toplu, II hissə, səh.10 №63
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0034', '/images/tasks/FNQ-0034.png', 'Parabola, ordinat oxu üzərində A, absis oxu üzərində C(4; 0), parabola üzərində B; ABCO trapesiyası ştrixlənib', (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='y=x², y=xⁿ (n>2) funksiyaları, kvadratik funksiya, onların qrafikləri və qrafiklərinin çevrilmələri'), 'original', 'own', 'az', 'draft', 'written',
  '$f(x)=-x^2+6x+5$ funksiyasının qrafiki üçün $C(4;\ 0)$ və $BC\perp OC$ olarsa, $ABCO$ trapesiyasının sahəsini tapın ($A$ — qrafikin ordinat oxu ilə kəsişmə nöqtəsi, $B$ — qrafik üzərindədir).',
  NULL, NULL, NULL, '36',
  '$A(0;\ 5)$, $B(4;\ f(4))=(4;\ 13)$. Trapesiyanın oturacaqları $OA=5$, $CB=13$, hündürlüyü $OC=4$: $S=\dfrac{5+13}{2}\cdot4=36$.',
  2025, 'II', 10, 63)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0035 | əsas: 2025 toplu, II hissə, səh.14 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0035', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Tək və cüt funksiyalar. Artan və azalan funksiyalar. Dövri funksiya'), 'original', 'own', 'az', 'draft', 'open',
  '$f(x)$ funksiyası $[-4;\ 4]$ parçasında təyin olunmuş tək funksiyadır və $f(2)=4$ olarsa, $\big(5f(0)+3\big)\big(3f(2)-2f(-2)\big)$-ni tapın.',
  NULL, NULL, NULL, '60',
  'Tək funksiya üçün $f(0)=0$ və $f(-2)=-f(2)=-4$. İfadə: $3\cdot(12+8)=60$.',
  2025, 'II', 14, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0036 | əsas: 2025 toplu, II hissə, səh.14 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0036', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Tək və cüt funksiyalar. Artan və azalan funksiyalar. Dövri funksiya'), 'original', 'own', 'az', 'draft', 'open',
  '$f(x)$ funksiyası $[-5;\ 5]$ parçasında təyin olunmuş tək funksiyadır. $f(4)=3$ olarsa, $\big(2f(0)+7\big)\big(4f(4)-f(-4)\big)$-ü tapın.',
  NULL, NULL, NULL, '105',
  '$f(0)=0$, $f(-4)=-3$. İfadə: $7\cdot(12+3)=105$.',
  2025, 'II', 14, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0037 | əsas: 2025 toplu, II hissə, səh.14 №33
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0037', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Tək və cüt funksiyalar. Artan və azalan funksiyalar. Dövri funksiya'), 'original', 'own', 'az', 'draft', 'open',
  '$f(x)$ cüt funksiya, $g(x)$ tək funksiya və $f(a)+f(-b)+g(a)=10$, $f(-a)-f(b)+g(-a)=4$ olarsa, $f(a)$-nı tapın.',
  NULL, NULL, NULL, '7',
  '$f(-b)=f(b)$, $f(-a)=f(a)$, $g(-a)=-g(a)$. Bərabərliklər: $f(a)+f(b)+g(a)=10$ və $f(a)-f(b)-g(a)=4$. Toplasaq: $2f(a)=14$, $f(a)=7$.',
  2025, 'II', 14, 33)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0038 | əsas: 2025 toplu, II hissə, səh.14 №34
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0038', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Tək və cüt funksiyalar. Artan və azalan funksiyalar. Dövri funksiya'), 'original', 'own', 'az', 'draft', 'open',
  '$f(x)$ cüt funksiya, $g(x)$ tək funksiya və $f(a)+f(-b)-g(a)=7$, $f(-a)-f(b)-g(-a)=11$ olarsa, $f(a)$-nı tapın.',
  NULL, NULL, NULL, '9',
  'Bərabərliklər: $f(a)+f(b)-g(a)=7$ və $f(a)-f(b)+g(a)=11$. Toplasaq: $2f(a)=18$, $f(a)=9$.',
  2025, 'II', 14, 34)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0039 | əsas: 2025 toplu, II hissə, səh.15 №42
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0039', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Tək və cüt funksiyalar. Artan və azalan funksiyalar. Dövri funksiya'), 'original', 'own', 'az', 'draft', 'matching',
  '$f(x)=\left(a^2-4\right)x^2+\left(a^2-a-6\right)x+a-2$ funksiyası üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$a=2$ olduqda"}, {"key": "2", "text": "$a=-2$ olduqda"}, {"key": "3", "text": "$a=3$ olduqda"}], "right": [{"key": "a", "text": "cüt funksiyadır"}, {"key": "b", "text": "artan funksiyadır"}, {"key": "c", "text": "tək funksiyadır"}, {"key": "d", "text": "azalan funksiyadır"}, {"key": "e", "text": "$x=0$ düz xətti qrafikinin simmetriya oxudur"}]}'::jsonb, NULL, '{"1": ["c", "d"], "2": ["a", "e"], "3": ["a", "e"]}'::jsonb, NULL,
  '1) $a=2$: $f(x)=-4x$ — tək və azalan. 2) $a=-2$: $f(x)=-4$ — sabit funksiya cütdür, qrafiki $Oy$-ə nəzərən simmetrikdir. 3) $a=3$: $f(x)=5x^2+1$ — cüt, simmetriya oxu $x=0$.',
  2025, 'II', 15, 42)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0040 | əsas: 2025 toplu, II hissə, səh.15 №43
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0040', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Tək və cüt funksiyalar. Artan və azalan funksiyalar. Dövri funksiya'), 'original', 'own', 'az', 'draft', 'matching',
  'Uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$y=(x+2)^2-3$"}, {"key": "2", "text": "$y=(x-2)^2-3$"}, {"key": "3", "text": "$y=-(x-2)^2-3$"}], "right": [{"key": "a", "text": "təpə nöqtəsi $(-2;\\ -3)$-dür"}, {"key": "b", "text": "$[2;\\ +\\infty)$-da artır"}, {"key": "c", "text": "$[2;\\ +\\infty)$-da azalır"}, {"key": "d", "text": "təpə nöqtəsi $(2;\\ -3)$-dür"}, {"key": "e", "text": "$Oy$ oxunu $(0;\\ -7)$ nöqtəsində kəsir"}]}'::jsonb, NULL, '{"1": ["a", "b"], "2": ["b", "d"], "3": ["c", "d", "e"]}'::jsonb, NULL,
  '1) Təpə $(-2;\ -3)$, qollar yuxarı: $[-2;+\infty)$-da, deməli $[2;+\infty)$-da da artır. 2) Təpə $(2;\ -3)$, $[2;+\infty)$-da artır. 3) Təpə $(2;\ -3)$, qollar aşağı: $[2;+\infty)$-da azalır; $y(0)=-4-3=-7$.',
  2025, 'II', 15, 43)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0041 | əsas: 2025 toplu, II hissə, səh.15 №44
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0041', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Tək və cüt funksiyalar. Artan və azalan funksiyalar. Dövri funksiya'), 'original', 'own', 'az', 'draft', 'matching',
  '$f(x)=\left(a^2-9\right)x^2-(a-2)x+\left(a^2-a-6\right)$ funksiyası üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$a=-3$ olduqda"}, {"key": "2", "text": "$a=2$ olduqda"}, {"key": "3", "text": "$a=3$ olduqda"}], "right": [{"key": "a", "text": "cüt funksiyadır"}, {"key": "b", "text": "artan funksiyadır"}, {"key": "c", "text": "tək funksiyadır"}, {"key": "d", "text": "$x=1$ düz xətti qrafikinin simmetriya oxudur"}, {"key": "e", "text": "nə cüt, nə tək funksiyadır"}]}'::jsonb, NULL, '{"1": ["b", "e"], "2": ["a"], "3": ["c"]}'::jsonb, NULL,
  '1) $a=-3$: $f(x)=5x+6$ — artan, nə cüt, nə tək. 2) $a=2$: $f(x)=-5x^2-4$ — cüt. 3) $a=3$: $f(x)=-x$ — tək.',
  2025, 'II', 15, 44)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0042 | əsas: 2025 toplu, II hissə, səh.15 №45
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0042', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Tək və cüt funksiyalar. Artan və azalan funksiyalar. Dövri funksiya'), 'original', 'own', 'az', 'draft', 'matching',
  'Uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$f(x)=2x^2-12x+1$"}, {"key": "2", "text": "$f(x)=-x^2+3x$"}, {"key": "3", "text": "$f(x)=x^2+5$"}], "right": [{"key": "a", "text": "$[3;\\ +\\infty)$ aralığında artır"}, {"key": "b", "text": "$[0;\\ +\\infty)$ aralığında artır"}, {"key": "c", "text": "$(-\\infty;\\ 3]$ aralığında azalır"}, {"key": "d", "text": "qrafiki $Ox$ oxunu kəsmir"}, {"key": "e", "text": "$(-\\infty;\\ 1{,}5]$ aralığında artır"}]}'::jsonb, NULL, '{"1": ["a", "c"], "2": ["e"], "3": ["a", "b", "d"]}'::jsonb, NULL,
  '1) Təpənin absisi $3$, qollar yuxarı: $(-\infty;3]$-də azalır, $[3;+\infty)$-da artır. 2) Təpənin absisi $1{,}5$, qollar aşağı: $(-\infty;1{,}5]$-də artır. 3) Təpə $(0;\ 5)$: $[0;+\infty)$-da (deməli $[3;+\infty)$-da da) artır, $y\ge5$ olduğundan $Ox$-i kəsmir.',
  2025, 'II', 15, 45)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0043 | əsas: 2025 toplu, II hissə, səh.15 №46
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0043', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Tək və cüt funksiyalar. Artan və azalan funksiyalar. Dövri funksiya'), 'original', 'own', 'az', 'draft', 'matching',
  'Uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$f(x)=x^2-4x$"}, {"key": "2", "text": "$f(x)=-x^2+4x-1$"}, {"key": "3", "text": "$f(x)=x^2-2x+5$"}], "right": [{"key": "a", "text": "$[2;\\ +\\infty)$ aralığında artır"}, {"key": "b", "text": "$(-\\infty;\\ +\\infty)$ aralığında azalır"}, {"key": "c", "text": "$(-\\infty;\\ 1]$ aralığında azalır"}, {"key": "d", "text": "$(-\\infty;\\ 2]$ aralığında azalır"}, {"key": "e", "text": "$[2;\\ +\\infty)$ aralığında azalır"}]}'::jsonb, NULL, '{"1": ["a", "c", "d"], "2": ["e"], "3": ["a", "c"]}'::jsonb, NULL,
  '1) Təpənin absisi $2$, qollar yuxarı: $(-\infty;2]$-də (deməli $(-\infty;1]$-də də) azalır, $[2;+\infty)$-da artır. 2) Təpənin absisi $2$, qollar aşağı: $[2;+\infty)$-da azalır. 3) Təpənin absisi $1$: $(-\infty;1]$-də azalır, $[1;+\infty)$-da (deməli $[2;+\infty)$-da da) artır.',
  2025, 'II', 15, 46)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0044 | əsas: 2025 toplu, II hissə, səh.83 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0044', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Tək və cüt funksiyalar. Artan və azalan funksiyalar. Dövri funksiya'), 'original', 'own', 'az', 'draft', 'closed',
  'Funksiyalardan hansı azalandır?',
  '[{"key": "A", "text": "$y=\\left(\\dfrac{1}{3-\\sqrt5}\\right)^x$"}, {"key": "B", "text": "$y=\\left(3+\\sqrt5\\right)^x$"}, {"key": "C", "text": "$y=\\left(\\dfrac{1}{3+\\sqrt5}\\right)^x$"}, {"key": "D", "text": "$y=\\left(\\sqrt3\\right)^x$"}, {"key": "E", "text": "$y=\\left(\\sqrt5-1\\right)^x$"}]'::jsonb, 'C', NULL, NULL,
  '$y=a^x$ funksiyası $0<a<1$ olduqda azalandır. $3-\sqrt5\approx0{,}76<1$, ona görə $\dfrac{1}{3-\sqrt5}>1$; $\sqrt5-1\approx1{,}24>1$. Yalnız $\dfrac{1}{3+\sqrt5}\approx0{,}19$ vahiddən kiçikdir.',
  2025, 'II', 83, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0045 | əsas: 2025 toplu, II hissə, səh.83 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0045', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Tək və cüt funksiyalar. Artan və azalan funksiyalar. Dövri funksiya'), 'original', 'own', 'az', 'draft', 'closed',
  'Funksiyalardan hansı artandır?',
  '[{"key": "A", "text": "$y=\\left(\\dfrac{1}{\\sqrt3}\\right)^x$"}, {"key": "B", "text": "$y=\\left(\\dfrac23\\right)^x$"}, {"key": "C", "text": "$y=\\left(\\sqrt5-1\\right)^x$"}, {"key": "D", "text": "$y=\\left(\\sqrt3-1\\right)^x$"}, {"key": "E", "text": "$y=\\left(\\dfrac15\\right)^x$"}]'::jsonb, 'C', NULL, NULL,
  '$y=a^x$ funksiyası $a>1$ olduqda artandır. $\sqrt5-1\approx1{,}24>1$; qalan əsaslar $\sqrt3-1\approx0{,}73$, $\dfrac15$, $\dfrac{1}{\sqrt3}$, $\dfrac23$ vahiddən kiçikdir.',
  2025, 'II', 83, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0046 | əsas: 2025 toplu, II hissə, səh.101 №51
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0046', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Tək və cüt funksiyalar. Artan və azalan funksiyalar. Dövri funksiya'), 'original', 'own', 'az', 'draft', 'matching',
  'Funksiyalar üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$y=\\log_3(x+2)$"}, {"key": "2", "text": "$y=\\log_{\\frac13}(x-2)$"}, {"key": "3", "text": "$y=\\log_3\\left(x^2+9\\right)$"}], "right": [{"key": "a", "text": "təyin oblastında azalandır"}, {"key": "b", "text": "təyin oblastında artandır"}, {"key": "c", "text": "cüt funksiyadır"}, {"key": "d", "text": "qrafiki ordinat oxunu kəsmir"}, {"key": "e", "text": "yalnız müsbət qiymətlər alır"}]}'::jsonb, NULL, '{"1": ["b"], "2": ["a", "d"], "3": ["c", "e"]}'::jsonb, NULL,
  '1) Əsas $3>1$ — artandır; təyin oblastı $x>-2$, $x=0$ daxildir. 2) Əsas $\dfrac13<1$ — azalandır; təyin oblastı $x>2$, $x=0$ daxil deyil, ordinat oxunu kəsmir. 3) $f(-x)=f(x)$ — cüt; $x^2+9\ge9\Rightarrow y\ge2>0$.',
  2025, 'II', 101, 51)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0047 | əsas: 2025 toplu, II hissə, səh.101 №52
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0047', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Tək və cüt funksiyalar. Artan və azalan funksiyalar. Dövri funksiya'), 'original', 'own', 'az', 'draft', 'matching',
  'Funksiyalar üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$y=\\log_2(x-1)$"}, {"key": "2", "text": "$y=\\log_{\\frac12}(x+5)$"}, {"key": "3", "text": "$y=\\log_2\\left(x^2+4\\right)$"}], "right": [{"key": "a", "text": "qrafiki ordinat oxunu kəsmir"}, {"key": "b", "text": "yalnız müsbət qiymətlər alır"}, {"key": "c", "text": "cüt funksiyadır"}, {"key": "d", "text": "təyin oblastında artandır"}, {"key": "e", "text": "təyin oblastında azalandır"}]}'::jsonb, NULL, '{"1": ["a", "d"], "2": ["e"], "3": ["b", "c"]}'::jsonb, NULL,
  '1) Təyin oblastı $x>1$ — ordinat oxunu kəsmir; əsas $2>1$ — artandır. 2) Əsas $\dfrac12$ — azalandır. 3) Cüt funksiyadır; $x^2+4\ge4\Rightarrow y\ge2>0$.',
  2025, 'II', 101, 52)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0048 | əsas: 2025 toplu, II hissə, səh.142 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0048', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Tək və cüt funksiyalar. Artan və azalan funksiyalar. Dövri funksiya'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=3x^2-24x$ funksiyasının artma aralığını tapın.',
  '[{"key": "A", "text": "$(-\\infty;\\ 4]$"}, {"key": "B", "text": "$[8;\\ +\\infty)$"}, {"key": "C", "text": "$(-\\infty;\\ 0]$"}, {"key": "D", "text": "$[4;\\ +\\infty)$"}, {"key": "E", "text": "$[0;\\ 4]$"}]'::jsonb, 'D', NULL, NULL,
  '$y''=6x-24\ge0\Rightarrow x\ge4$. Artma aralığı $[4;\ +\infty)$.',
  2025, 'II', 142, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0049 | əsas: 2025 toplu, II hissə, səh.16 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0049', '/images/tasks/FNQ-0049.png', 'Uc nöqtələri (−3; −2) və (4; 3) olan artan əyri', (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=f(x)$ funksiyasının qrafikinə əsasən təyin oblastını tapın.',
  '[{"key": "A", "text": "$[-2;\\ 3]$"}, {"key": "B", "text": "$[-3;\\ 3]$"}, {"key": "C", "text": "$[-2;\\ 4]$"}, {"key": "D", "text": "$[-3;\\ 4]$"}, {"key": "E", "text": "$[0;\\ 4]$"}]'::jsonb, 'D', NULL, NULL,
  'Təyin oblastı qrafikin absis oxu üzərindəki proyeksiyasıdır: $x$ dəyişəni $-3$-dən $4$-ə qədər qiymətlər alır, uc nöqtələr qrafikə daxildir. $D(f)=[-3;\ 4]$.',
  2025, 'II', 16, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0050 | əsas: 2025 toplu, II hissə, səh.16 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0050', '/images/tasks/FNQ-0050.png', 'Uc nöqtələri (−3; 3) və (4; −1) olan azalan əyri', (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=f(x)$ funksiyasının qiymətlər çoxluğunu tapın.',
  '[{"key": "A", "text": "$[-1;\\ 4]$"}, {"key": "B", "text": "$[-3;\\ 3]$"}, {"key": "C", "text": "$[-3;\\ 4]$"}, {"key": "D", "text": "$[-1;\\ 3]$"}, {"key": "E", "text": "$[0;\\ 3]$"}]'::jsonb, 'D', NULL, NULL,
  'Qiymətlər çoxluğu qrafikin ordinat oxu üzərindəki proyeksiyasıdır: funksiya azalandır, ən böyük qiyməti $f(-3)=3$, ən kiçik qiyməti $f(4)=-1$. $E(f)=[-1;\ 3]$.',
  2025, 'II', 16, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0051 | əsas: 2025 toplu, II hissə, səh.17 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0051', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=\sqrt{9-x^2}$ funksiyasının təyin oblastını tapın.',
  '[{"key": "A", "text": "$(-\\infty;\\ -3]\\cup[3;\\ +\\infty)$"}, {"key": "B", "text": "$(-3;\\ 3)$"}, {"key": "C", "text": "$[0;\\ 3]$"}, {"key": "D", "text": "$[-3;\\ 3]$"}, {"key": "E", "text": "$(-\\infty;\\ 3]$"}]'::jsonb, 'D', NULL, NULL,
  '$9-x^2\ge0\Rightarrow x^2\le9\Rightarrow-3\le x\le3$.',
  2025, 'II', 17, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0052 | əsas: 2025 toplu, II hissə, səh.18 №36
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0052', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=\sqrt{-x+5}+\dfrac{1}{\sqrt{x+3}}$ funksiyasının təyin oblastına daxil olan tam ədədlərin cəmini tapın.',
  '[{"key": "A", "text": "$9$"}, {"key": "B", "text": "$12$"}, {"key": "C", "text": "$14$"}, {"key": "D", "text": "$15$"}, {"key": "E", "text": "$10$"}]'::jsonb, 'B', NULL, NULL,
  '$-x+5\ge0$ və $x+3>0$: $-3<x\le5$. Tam ədədlər $-2,-1,\dots,5$; cəm $12$.',
  2025, 'II', 18, 36)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0053 | əsas: 2025 toplu, II hissə, səh.19 №43
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0053', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=\sqrt{2x}+\sqrt{4-x}$ funksiyasının təyin oblastını tapın.',
  '[{"key": "A", "text": "$(0;\\ 4)$"}, {"key": "B", "text": "$(-\\infty;\\ 4]$"}, {"key": "C", "text": "$[-4;\\ 0]$"}, {"key": "D", "text": "$[0;\\ +\\infty)$"}, {"key": "E", "text": "$[0;\\ 4]$"}]'::jsonb, 'E', NULL, NULL,
  '$2x\ge0$ və $4-x\ge0$: $0\le x\le4$.',
  2025, 'II', 19, 43)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0054 | əsas: 2025 toplu, II hissə, səh.19 №44
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0054', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=\sqrt{5-x}+\sqrt{3x}$ funksiyasının təyin oblastını tapın.',
  '[{"key": "A", "text": "$[0;\\ 5]$"}, {"key": "B", "text": "$(-\\infty;\\ 5]$"}, {"key": "C", "text": "$(0;\\ 5)$"}, {"key": "D", "text": "$[0;\\ +\\infty)$"}, {"key": "E", "text": "$[-5;\\ 0]$"}]'::jsonb, 'A', NULL, NULL,
  '$5-x\ge0$ və $3x\ge0$: $0\le x\le5$.',
  2025, 'II', 19, 44)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0055 | əsas: 2025 toplu, II hissə, səh.19 №45
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0055', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=\sqrt{16-x^2}$ funksiyasının təyin oblastını tapın.',
  '[{"key": "A", "text": "$(-4;\\ 4)$"}, {"key": "B", "text": "$[-4;\\ 4]$"}, {"key": "C", "text": "$[0;\\ 4]$"}, {"key": "D", "text": "$(-\\infty;\\ -4]\\cup[4;\\ +\\infty)$"}, {"key": "E", "text": "$(-\\infty;\\ +\\infty)$"}]'::jsonb, 'B', NULL, NULL,
  '$16-x^2\ge0\Rightarrow-4\le x\le4$.',
  2025, 'II', 19, 45)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0056 | əsas: 2025 toplu, II hissə, səh.19 №48
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0056', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=\sqrt{x^2+6x+13}$ funksiyasının qiymətlər çoxluğunu tapın.',
  '[{"key": "A", "text": "$[2;\\ +\\infty)$"}, {"key": "B", "text": "$(-\\infty;\\ +\\infty)$"}, {"key": "C", "text": "$[0;\\ +\\infty)$"}, {"key": "D", "text": "$[4;\\ +\\infty)$"}, {"key": "E", "text": "$\\left[\\sqrt{13};\\ +\\infty\\right)$"}]'::jsonb, 'A', NULL, NULL,
  '$x^2+6x+13=(x+3)^2+4\ge4$, ona görə $y\ge\sqrt4=2$; $E(y)=[2;\ +\infty)$.',
  2025, 'II', 19, 48)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0057 | əsas: 2025 toplu, II hissə, səh.19 №49
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0057', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=\sqrt{x^2-8x+25}$ funksiyasının qiymətlər çoxluğunu tapın.',
  '[{"key": "A", "text": "$[9;\\ +\\infty)$"}, {"key": "B", "text": "$[3;\\ +\\infty)$"}, {"key": "C", "text": "$[0;\\ +\\infty)$"}, {"key": "D", "text": "$[5;\\ +\\infty)$"}, {"key": "E", "text": "$(-\\infty;\\ +\\infty)$"}]'::jsonb, 'B', NULL, NULL,
  '$x^2-8x+25=(x-4)^2+9\ge9$, $y\ge3$.',
  2025, 'II', 19, 49)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0058 | əsas: 2025 toplu, II hissə, səh.21 №69
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0058', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu'), 'original', 'own', 'az', 'draft', 'closed',
  'Qrafiki $M(-2;\ 5)$ nöqtəsindən keçən $y=\sqrt{x^2+mx+13}$ funksiyasının qiymətlər çoxluğunu tapın.',
  '[{"key": "A", "text": "$[2;\\ +\\infty)$"}, {"key": "B", "text": "$[9;\\ +\\infty)$"}, {"key": "C", "text": "$[3;\\ +\\infty)$"}, {"key": "D", "text": "$[0;\\ +\\infty)$"}, {"key": "E", "text": "$[5;\\ +\\infty)$"}]'::jsonb, 'C', NULL, NULL,
  '$\sqrt{4-2m+13}=5\Rightarrow17-2m=25\Rightarrow m=-4$. $x^2-4x+13=(x-2)^2+9\ge9$, $E(y)=[3;\ +\infty)$.',
  2025, 'II', 21, 69)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0059 | əsas: 2025 toplu, II hissə, səh.21 №70
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0059', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu'), 'original', 'own', 'az', 'draft', 'closed',
  'Qrafiki $M(-1;\ 3)$ nöqtəsindən keçən $y=\sqrt{x^2+mx+8}$ funksiyasının qiymətlər çoxluğunu tapın.',
  '[{"key": "A", "text": "$[8;\\ +\\infty)$"}, {"key": "B", "text": "$\\left[2\\sqrt2;\\ +\\infty\\right)$"}, {"key": "C", "text": "$[0;\\ +\\infty)$"}, {"key": "D", "text": "$[3;\\ +\\infty)$"}, {"key": "E", "text": "$[1;\\ +\\infty)$"}]'::jsonb, 'B', NULL, NULL,
  '$\sqrt{1-m+8}=3\Rightarrow m=0$. $x^2+8\ge8$, $y\ge2\sqrt2$.',
  2025, 'II', 21, 70)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0060 | əsas: 2025 toplu, II hissə, səh.22 №80
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0060', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu'), 'original', 'own', 'az', 'draft', 'written',
  '$f(x)=\dfrac{7{,}5}{x^2-x+1{,}5}$ funksiyasının ən böyük qiymətini tapın.',
  NULL, NULL, NULL, '6',
  'Məxrəcin ən kiçik qiyməti: $x^2-x+1{,}5=(x-0{,}5)^2+1{,}25\ge1{,}25$. Ən böyük qiymət $\dfrac{7{,}5}{1{,}25}=6$.',
  2025, 'II', 22, 80)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0061 | əsas: 2025 toplu, II hissə, səh.22 №81
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0061', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu'), 'original', 'own', 'az', 'draft', 'written',
  '$f(x)=\dfrac{6{,}6}{x^2-3x+3}$ funksiyasının ən böyük qiymətini tapın.',
  NULL, NULL, NULL, '8,8',
  '$x^2-3x+3=(x-1{,}5)^2+0{,}75\ge0{,}75$. Ən böyük qiymət $\dfrac{6{,}6}{0{,}75}=8{,}8$.',
  2025, 'II', 22, 81)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0062 | əsas: 2025 toplu, II hissə, səh.22 №82
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0062', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu'), 'original', 'own', 'az', 'draft', 'written',
  '$y=\dfrac{24}{|x-2|+6}$ funksiyasının ən böyük qiymətini tapın.',
  NULL, NULL, NULL, '4',
  '$|x-2|\ge0$, məxrəc ən kiçik $6$-dır ($x=2$). Ən böyük qiymət $\dfrac{24}{6}=4$.',
  2025, 'II', 22, 82)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0063 | əsas: 2025 toplu, II hissə, səh.22 №83
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0063', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu'), 'original', 'own', 'az', 'draft', 'written',
  '$y=\dfrac{15}{|x+3|+5}$ funksiyasının ən böyük qiymətini tapın.',
  NULL, NULL, NULL, '3',
  'Məxrəc ən kiçik $5$-dir ($x=-3$): $\dfrac{15}{5}=3$.',
  2025, 'II', 22, 83)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0064 | əsas: 2025 toplu, II hissə, səh.22 №84
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0064', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu'), 'original', 'own', 'az', 'draft', 'written',
  '$b$-nin hansı müsbət qiymətində $f(x)=3x+b$ və $g(x)=bx+10$ funksiyaları üçün $f\big(g(x)\big)=g\big(f(x)\big)$ olar?',
  NULL, NULL, NULL, '5',
  '$f(g(x))=3bx+30+b$, $g(f(x))=3bx+b^2+10$. $30+b=b^2+10\Rightarrow b^2-b-20=0\Rightarrow b=5$ ($b=-4$ müsbət deyil).',
  2025, 'II', 22, 84)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0065 | əsas: 2025 toplu, II hissə, səh.22 №85
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0065', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu'), 'original', 'own', 'az', 'draft', 'written',
  '$m$ parametrinin hansı müsbət qiymətində $f(x)=5x+m$ və $g(x)=mx+3$ funksiyaları üçün $f\big(g(x)\big)=g\big(f(x)\big)$ olar?',
  NULL, NULL, NULL, '4',
  '$f(g(x))=5mx+15+m$, $g(f(x))=5mx+m^2+3$. $m^2-m-12=0\Rightarrow m=4$.',
  2025, 'II', 22, 85)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0066 | əsas: 2025 toplu, II hissə, səh.22 №86
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0066', '/images/tasks/FNQ-0066.png', 'Ordinat oxunu 6-da, absis oxunu 4-də kəsən azalan əyri', (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu'), 'original', 'own', 'az', 'draft', 'written',
  'Qrafiki verilmiş $f(x)$ funksiyasının tərs funksiyası olan $g(x)$ funksiyası üçün $g(k+1)=0$ olarsa, $k$-nı tapın.',
  NULL, NULL, NULL, '5',
  '$g$ tərs funksiyadır: $g(t)=0\Leftrightarrow t=f(0)$. Qrafikdən $f(0)=6$, ona görə $k+1=6$, $k=5$.',
  2025, 'II', 22, 86)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0067 | əsas: 2025 toplu, II hissə, səh.22 №87
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0067', '/images/tasks/FNQ-0067.png', 'Ordinat oxunu 4-də, absis oxunu 3-də kəsən azalan əyri', (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu'), 'original', 'own', 'az', 'draft', 'written',
  'Qrafiki verilmiş $y=f(x)$ funksiyasının tərs funksiyası $y=g(x)$ funksiyasıdır. $g(k-5)=0$ olarsa, $k$-nı tapın.',
  NULL, NULL, NULL, '9',
  '$g(k-5)=0\Leftrightarrow k-5=f(0)=4$, $k=9$.',
  2025, 'II', 22, 87)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0068 | əsas: 2025 toplu, II hissə, səh.34 №46
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0068', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=\dfrac{6}{1+|\sin x|}$ funksiyasının qiymətlər çoxluğunu tapın.',
  '[{"key": "A", "text": "$[0;\\ 6]$"}, {"key": "B", "text": "$[3;\\ 6]$"}, {"key": "C", "text": "$[6;\\ 12]$"}, {"key": "D", "text": "$(3;\\ 6)$"}, {"key": "E", "text": "$(3;\\ 6]$"}]'::jsonb, 'B', NULL, NULL,
  '$|\sin x|$ $[0;\ 1]$ parçasındakı bütün qiymətləri alır, məxrəc $[1;\ 2]$-dir. $y\in[3;\ 6]$.',
  2025, 'II', 34, 46)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0069 | əsas: 2025 toplu, II hissə, səh.34 №47
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0069', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=\dfrac{42}{7-|\cos x|}$ funksiyasının qiymətlər çoxluğunu tapın.',
  '[{"key": "A", "text": "$[6;\\ 7]$"}, {"key": "B", "text": "$[7;\\ 42]$"}, {"key": "C", "text": "$[6;\\ 7)$"}, {"key": "D", "text": "$[0;\\ 7]$"}, {"key": "E", "text": "$(6;\\ 7)$"}]'::jsonb, 'A', NULL, NULL,
  '$|\cos x|\in[0;\ 1]$, məxrəc $[6;\ 7]$. $y\in\left[\dfrac{42}{7};\ \dfrac{42}{6}\right]=[6;\ 7]$.',
  2025, 'II', 34, 47)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0070 | əsas: 2025 toplu, II hissə, səh.100 №43
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0070', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu'), 'original', 'own', 'az', 'draft', 'matching',
  'Funksiyalar üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$y=\\left(\\dfrac12\\right)^{-x^2+4x-7}$"}, {"key": "2", "text": "$y=\\log_3x$"}, {"key": "3", "text": "$y=\\sin3x-\\sqrt3\\cos3x$"}], "right": [{"key": "a", "text": "Ən böyük qiyməti $2$-dir"}, {"key": "b", "text": "Təyin oblastı $(0;\\ +\\infty)$-dur"}, {"key": "c", "text": "Ən kiçik qiyməti $8$-dir"}, {"key": "d", "text": "$x=20$ olduqda funksiyanın qiymətinin tam hissəsi $2$-yə bərabərdir"}, {"key": "e", "text": "Cüt funksiyadır"}]}'::jsonb, NULL, '{"1": ["c"], "2": ["b", "d"], "3": ["a"]}'::jsonb, NULL,
  '1) Üst $-x^2+4x-7=-(x-2)^2-3\le-3$, əsas $\dfrac12<1$: $y\ge\left(\dfrac12\right)^{-3}=8$ — ən kiçik qiymət $8$ ($x=2$); təpə $x=2$-də olduğu üçün cüt deyil. 2) $D=(0;+\infty)$; $\log_320$: $3^2=9<20<27=3^3$, tam hissə $2$. 3) $\sin3x-\sqrt3\cos3x=2\sin\left(3x-\dfrac{\pi}{3}\right)$ — ən böyük qiymət $2$.',
  2025, 'II', 100, 43)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNQ-0071 | əsas: 2025 toplu, II hissə, səh.100 №44
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNQ-0071', NULL, NULL, (SELECT id FROM topics WHERE name='Funksiya və qrafiklər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Funksiya və qrafiklər' AND s.title='Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu'), 'original', 'own', 'az', 'draft', 'matching',
  'Funksiyalara uyğun təklifləri müəyyən edin.',
  '{"left": [{"key": "1", "text": "$y=3^{-x^2+2x+1}$"}, {"key": "2", "text": "$y=\\log_{\\frac12}x$"}, {"key": "3", "text": "$y=\\sqrt3\\sin4x+\\cos4x$"}], "right": [{"key": "a", "text": "Ən böyük qiyməti $9$-dur"}, {"key": "b", "text": "Ən kiçik qiyməti $-2$-dir"}, {"key": "c", "text": "Təyin oblastı $(0;\\ +\\infty)$-dur"}, {"key": "d", "text": "$x=12$ olduqda funksiyanın qiymətinin tam hissəsi $-4$-ə bərabərdir"}, {"key": "e", "text": "Tək funksiyadır"}]}'::jsonb, NULL, '{"1": ["a"], "2": ["c", "d"], "3": ["b"]}'::jsonb, NULL,
  '1) Üst $-x^2+2x+1=-(x-1)^2+2\le2$: $y\le3^2=9$. 2) $D=(0;+\infty)$; $\log_{\frac12}12=-\log_212$, $8<12<16\Rightarrow-4<\log_{\frac12}12<-3$, tam hissə $-4$. 3) $\sqrt3\sin4x+\cos4x=2\sin\left(4x+\dfrac{\pi}{6}\right)$ — ən kiçik qiymət $-2$; $x=0$ olduqda $y=1\ne0$, tək deyil.',
  2025, 'II', 100, 44)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
