-- Mövzu: Ədədi ardıcıllıqlar. Silsilələr — 44 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- ARS-0001 | əsas: 2025 toplu, I hissə, səh.113 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi ardıcıllıqlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$a_n=5n-3$ düsturu ilə verilmiş ardıcıllığın üçüncü həddini tapın.',
  '[{"key": "A", "text": "$7$"}, {"key": "B", "text": "$15$"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$17$"}, {"key": "E", "text": "$12$"}]'::jsonb, 'E', NULL, NULL,
  '$a_3=5\cdot3-3=12$.',
  2025, 'I', 113, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0002 | əsas: 2025 toplu, I hissə, səh.113 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi ardıcıllıqlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$x_n=\dfrac{2\cdot(-1)^{n+1}}{n}$ ardıcıllığının altıncı həddini tapın.',
  '[{"key": "A", "text": "$\\dfrac{1}{6}$"}, {"key": "B", "text": "$\\dfrac{1}{3}$"}, {"key": "C", "text": "$-3$"}, {"key": "D", "text": "$-\\dfrac{1}{3}$"}, {"key": "E", "text": "$-\\dfrac{1}{6}$"}]'::jsonb, 'D', NULL, NULL,
  '$x_6=\dfrac{2\cdot(-1)^7}{6}=-\dfrac{2}{6}=-\dfrac13$.',
  2025, 'I', 113, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0003 | əsas: 2025 toplu, I hissə, səh.113 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi ardıcıllıqlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$a_n=n^2-\sqrt n$ düsturu ilə verilən ardıcıllığın $16$-cı həddini tapın.',
  '[{"key": "A", "text": "$260$"}, {"key": "B", "text": "$256$"}, {"key": "C", "text": "$252$"}, {"key": "D", "text": "$248$"}, {"key": "E", "text": "$240$"}]'::jsonb, 'C', NULL, NULL,
  '$a_{16}=16^2-\sqrt{16}=256-4=252$.',
  2025, 'I', 113, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0004 | əsas: 2025 toplu, I hissə, səh.113 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi ardıcıllıqlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$2;\ 5;\ 11;\ 23;\ 47;\ \dots$ ardıcıllığının ümumi həddini tapın.',
  '[{"key": "A", "text": "$3\\cdot2^{n-1}+1$"}, {"key": "B", "text": "$3\\cdot2^{n}-1$"}, {"key": "C", "text": "$2^{n}+1$"}, {"key": "D", "text": "$2^{n+1}-1$"}, {"key": "E", "text": "$3\\cdot2^{n-1}-1$"}]'::jsonb, 'E', NULL, NULL,
  'Hər hədd əvvəlkinin iki mislindən $1$ çoxdur: $a_{n+1}=2a_n+1$, yəni $a_{n+1}+1=2(a_n+1)$. $a_n+1$ ardıcıllığı $3;6;12;24;\dots$ — vuruğu $2$ olan həndəsi silsilədir: $a_n+1=3\cdot2^{n-1}$. Cavab: $a_n=3\cdot2^{n-1}-1$.',
  2025, 'I', 113, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0005 | əsas: 2025 toplu, I hissə, səh.113 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi ardıcıllıqlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$1;\ 4;\ 10;\ 22;\ 46;\ \dots$ ardıcıllığının $n$-ci həddinin düsturunu tapın.',
  '[{"key": "A", "text": "$3\\cdot2^{n-1}+1$"}, {"key": "B", "text": "$3\\cdot2^{n-1}-2$"}, {"key": "C", "text": "$2^{n+1}-3$"}, {"key": "D", "text": "$3\\cdot2^{n}-2$"}, {"key": "E", "text": "$2^{n}-1$"}]'::jsonb, 'B', NULL, NULL,
  '$a_{n+1}=2a_n+2$, yəni $a_{n+1}+2=2(a_n+2)$. $a_n+2$: $3;6;12;24;48$ — $a_n+2=3\cdot2^{n-1}$. Cavab: $a_n=3\cdot2^{n-1}-2$.',
  2025, 'I', 113, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0006 | əsas: 2025 toplu, I hissə, səh.115 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'closed',
  'Ədədi silsilədə $a_1=3$ və $a_2=7$ olarsa, $a_5$-i tapın.',
  '[{"key": "A", "text": "$19$"}, {"key": "B", "text": "$15$"}, {"key": "C", "text": "$23$"}, {"key": "D", "text": "$11$"}, {"key": "E", "text": "$17$"}]'::jsonb, 'A', NULL, NULL,
  '$d=7-3=4$, $a_5=a_1+4d=3+16=19$.',
  2025, 'I', 115, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0007 | əsas: 2025 toplu, I hissə, səh.115 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0007', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'closed',
  'Ədədi silsilədə $a_1=10$ və $a_2=7$ olarsa, $a_6$-nı tapın.',
  '[{"key": "A", "text": "$-2$"}, {"key": "B", "text": "$-5$"}, {"key": "C", "text": "$-8$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$1$"}]'::jsonb, 'B', NULL, NULL,
  '$d=-3$, $a_6=10+5\cdot(-3)=-5$.',
  2025, 'I', 115, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0008 | əsas: 2025 toplu, I hissə, səh.115 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'closed',
  '$(a_n)$ ədədi silsiləsində $a_1=-4,\ d=5$ olarsa, $a_9$-u tapın.',
  '[{"key": "A", "text": "$41$"}, {"key": "B", "text": "$36$"}, {"key": "C", "text": "$40$"}, {"key": "D", "text": "$45$"}, {"key": "E", "text": "$31$"}]'::jsonb, 'B', NULL, NULL,
  '$a_9=a_1+8d=-4+40=36$.',
  2025, 'I', 115, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0009 | əsas: 2025 toplu, I hissə, səh.115 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'closed',
  '$(a_n)$ ədədi silsiləsində $a_8=-3$, $a_{10}=11$ olarsa, $a_9$-u tapın.',
  '[{"key": "A", "text": "$3$"}, {"key": "B", "text": "$7$"}, {"key": "C", "text": "$8$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$-4$"}]'::jsonb, 'D', NULL, NULL,
  'Ədədi silsilədə hər hədd qonşu hədlərin ədədi ortasıdır: $a_9=\dfrac{a_8+a_{10}}{2}=\dfrac{-3+11}{2}=4$.',
  2025, 'I', 115, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0010 | əsas: 2025 toplu, I hissə, səh.115 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'closed',
  '$(a_n)$ ədədi silsiləsində $a_{20}=9$, $a_{22}=25$ olarsa, $a_{21}$-i tapın.',
  '[{"key": "A", "text": "$34$"}, {"key": "B", "text": "$16$"}, {"key": "C", "text": "$18$"}, {"key": "D", "text": "$8$"}, {"key": "E", "text": "$17$"}]'::jsonb, 'E', NULL, NULL,
  '$a_{21}=\dfrac{a_{20}+a_{22}}{2}=\dfrac{9+25}{2}=17$.',
  2025, 'I', 115, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0011 | əsas: 2025 toplu, I hissə, səh.115 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0011', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'closed',
  '$a_4=10$ və $a_{19}=55$ olan $(a_n)$ ədədi silsiləsinin birinci həddini tapın.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$7$"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$-2$"}, {"key": "E", "text": "$1$"}]'::jsonb, 'E', NULL, NULL,
  '$a_{19}-a_4=15d=45\Rightarrow d=3$. $a_1=a_4-3d=10-9=1$.',
  2025, 'I', 115, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0012 | əsas: 2025 toplu, I hissə, səh.115 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0012', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'closed',
  'Ədədi silsilənin $4$-cü və $20$-ci hədlərinin cəmi $18$-ə bərabərdir. Silsilənin ilk $23$ həddinin cəmini tapın.',
  '[{"key": "A", "text": "$189$"}, {"key": "B", "text": "$414$"}, {"key": "C", "text": "$216$"}, {"key": "D", "text": "$207$"}, {"key": "E", "text": "$198$"}]'::jsonb, 'D', NULL, NULL,
  '$a_4+a_{20}=a_1+a_{23}$ (indekslərin cəmi $24$). $S_{23}=\dfrac{a_1+a_{23}}{2}\cdot23=\dfrac{18}{2}\cdot23=207$.',
  2025, 'I', 115, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0013 | əsas: 2025 toplu, I hissə, səh.115 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'closed',
  '$(a_n)$ ədədi silsiləsinin $5$-ci və $24$-cü hədlərinin cəmi $16$-ya bərabərdir. Silsilənin ilk $28$ həddinin cəmini tapın.',
  '[{"key": "A", "text": "$224$"}, {"key": "B", "text": "$112$"}, {"key": "C", "text": "$448$"}, {"key": "D", "text": "$232$"}, {"key": "E", "text": "$216$"}]'::jsonb, 'A', NULL, NULL,
  '$a_5+a_{24}=a_1+a_{28}=16$. $S_{28}=\dfrac{16}{2}\cdot28=224$.',
  2025, 'I', 115, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0014 | əsas: 2025 toplu, I hissə, səh.116 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'closed',
  '$(a_n)$ ədədi silsiləsində $a_1=-7$ və $d=3$ olarsa, $a_{10}$-u tapın.',
  '[{"key": "A", "text": "$17$"}, {"key": "B", "text": "$23$"}, {"key": "C", "text": "$26$"}, {"key": "D", "text": "$20$"}, {"key": "E", "text": "$-34$"}]'::jsonb, 'D', NULL, NULL,
  '$a_{10}=-7+9\cdot3=20$.',
  2025, 'I', 116, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0015 | əsas: 2025 toplu, I hissə, səh.116 №34
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0015', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'closed',
  '$(a_n)$ ədədi silsiləsində $a_1=-5$, $d=1{,}5$ olarsa, ilk $13$ həddinin cəmini tapın.',
  '[{"key": "A", "text": "$104$"}, {"key": "B", "text": "$39$"}, {"key": "C", "text": "$52$"}, {"key": "D", "text": "$26$"}, {"key": "E", "text": "$65$"}]'::jsonb, 'C', NULL, NULL,
  '$S_{13}=\dfrac{2a_1+12d}{2}\cdot13=\dfrac{-10+18}{2}\cdot13=52$.',
  2025, 'I', 116, 34)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0016 | əsas: 2025 toplu, I hissə, səh.116 №35
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'closed',
  '$(a_n)$ ədədi silsiləsində $a_1=3$, $d=\dfrac14$ olarsa, ilk $9$ həddinin cəmini tapın.',
  '[{"key": "A", "text": "$27$"}, {"key": "B", "text": "$31{,}5$"}, {"key": "C", "text": "$40{,}5$"}, {"key": "D", "text": "$45$"}, {"key": "E", "text": "$36$"}]'::jsonb, 'E', NULL, NULL,
  '$S_9=\dfrac{2\cdot3+8\cdot\frac14}{2}\cdot9=\dfrac{8}{2}\cdot9=36$.',
  2025, 'I', 116, 35)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0017 | əsas: 2025 toplu, I hissə, səh.117 №52
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'closed',
  '$(a_n)$ ədədi silsiləsində $a_3+a_6+a_{15}+a_{18}=60$ olarsa, onun ilk $20$ həddinin cəmini tapın.',
  '[{"key": "A", "text": "$300$"}, {"key": "B", "text": "$150$"}, {"key": "C", "text": "$600$"}, {"key": "D", "text": "$350$"}, {"key": "E", "text": "$250$"}]'::jsonb, 'A', NULL, NULL,
  '$a_3+a_{18}=a_6+a_{15}=a_1+a_{20}$ (indekslərin cəmi $21$). Deməli $2(a_1+a_{20})=60\Rightarrow a_1+a_{20}=30$. $S_{20}=\dfrac{30}{2}\cdot20=300$.',
  2025, 'I', 117, 52)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0018 | əsas: 2025 toplu, I hissə, səh.117 №64
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'closed',
  'Ədədi silsilədə $a_2+a_8+a_{20}=63$ olarsa, $S_{19}$-u tapın.',
  '[{"key": "A", "text": "$399$"}, {"key": "B", "text": "$420$"}, {"key": "C", "text": "$441$"}, {"key": "D", "text": "$357$"}, {"key": "E", "text": "$378$"}]'::jsonb, 'A', NULL, NULL,
  '$a_2+a_8+a_{20}=3a_1+27d=3(a_1+9d)=3a_{10}=63\Rightarrow a_{10}=21$. $S_{19}=19\cdot a_{10}=399$ (ortadakı hədd $a_{10}$-dur).',
  2025, 'I', 117, 64)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0019 | əsas: 2025 toplu, I hissə, səh.117 №70
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'closed',
  'Ədədi silsilədə $a_3+a_7+a_{13}+a_{17}=180$ olarsa, $S_{19}$-u tapın.',
  '[{"key": "A", "text": "$810$"}, {"key": "B", "text": "$945$"}, {"key": "C", "text": "$855$"}, {"key": "D", "text": "$900$"}, {"key": "E", "text": "$765$"}]'::jsonb, 'C', NULL, NULL,
  '$a_3+a_{17}=a_7+a_{13}=2a_{10}$. Onda $4a_{10}=180\Rightarrow a_{10}=45$. $S_{19}=19\cdot45=855$.',
  2025, 'I', 117, 70)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0020 | əsas: 2025 toplu, I hissə, səh.117 №74
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'closed',
  '$(a_n)$ ədədi silsiləsində $a_6+a_{10}=50$, $a_5=13$ olarsa, silsilə fərqini tapın.',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "$12$"}, {"key": "C", "text": "$6$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$3$"}]'::jsonb, 'D', NULL, NULL,
  '$a_6+a_{10}=2a_8=50\Rightarrow a_8=25$. $a_8-a_5=3d=12\Rightarrow d=4$.',
  2025, 'I', 117, 74)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0021 | əsas: 2025 toplu, I hissə, səh.117 №75
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'closed',
  '$(a_n)$ ədədi silsiləsində $a_5+a_7=62$, $a_2=13$ olarsa, silsilə fərqini tapın.',
  '[{"key": "A", "text": "$18$"}, {"key": "B", "text": "$4{,}5$"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$9$"}, {"key": "E", "text": "$4$"}]'::jsonb, 'B', NULL, NULL,
  '$a_5+a_7=2a_6=62\Rightarrow a_6=31$. $a_6-a_2=4d=18\Rightarrow d=4{,}5$.',
  2025, 'I', 117, 75)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0022 | əsas: 2025 toplu, I hissə, səh.118 №86
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}a_4+a_6+a_8=36,\\a_6\cdot a_7=168\end{cases}$ şərtini ödəyən ədədi silsilənin birinci həddini və silsilə fərqini tapın.',
  '[{"key": "A", "text": "$a_1=12;\\ d=2$"}, {"key": "B", "text": "$a_1=2;\\ d=2$"}, {"key": "C", "text": "$a_1=4;\\ d=2$"}, {"key": "D", "text": "$a_1=-2;\\ d=2$"}, {"key": "E", "text": "$a_1=2;\\ d=3$"}]'::jsonb, 'B', NULL, NULL,
  '$a_4+a_6+a_8=3a_6=36\Rightarrow a_6=12$. $a_7=\dfrac{168}{12}=14$, $d=2$. $a_1=a_6-5d=2$.',
  2025, 'I', 118, 86)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0023 | əsas: 2025 toplu, I hissə, səh.118 №87
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}a_2+a_4+a_6=27,\\a_4\cdot a_5=117\end{cases}$ şərtini ödəyən ədədi silsilənin birinci həddini və silsilə fərqini tapın.',
  '[{"key": "A", "text": "$a_1=3;\\ d=4$"}, {"key": "B", "text": "$a_1=-12;\\ d=4$"}, {"key": "C", "text": "$a_1=-3;\\ d=4$"}, {"key": "D", "text": "$a_1=9;\\ d=4$"}, {"key": "E", "text": "$a_1=-3;\\ d=-4$"}]'::jsonb, 'C', NULL, NULL,
  '$3a_4=27\Rightarrow a_4=9$; $a_5=\dfrac{117}{9}=13$, $d=4$; $a_1=a_4-3d=-3$.',
  2025, 'I', 118, 87)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0024 | əsas: 2025 toplu, I hissə, səh.118 №100
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'written',
  'Ədədi silsilədə $a_1+a_2+a_3=15$ və $a_4+a_5+a_6=51$ olarsa, onun üçüncü həddini tapın.',
  NULL, NULL, NULL, '9',
  'Fərq: $(a_4-a_1)+(a_5-a_2)+(a_6-a_3)=9d=36\Rightarrow d=4$. $3a_2=15\Rightarrow a_2=5$, $a_3=9$.',
  2025, 'I', 118, 100)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0025 | əsas: 2025 toplu, I hissə, səh.118 №101
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0025', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'written',
  'Ədədi silsilədə $a_1+a_2+a_3=24$ və $a_4+a_5+a_6=42$ olarsa, onun üçüncü həddini tapın.',
  NULL, NULL, NULL, '10',
  '$9d=18\Rightarrow d=2$; $a_2=8$, $a_3=10$.',
  2025, 'I', 118, 101)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0026 | əsas: 2025 toplu, I hissə, səh.118 №102
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'written',
  '$(a_n)$ ədədi silsiləsində $a_1+a_2+a_3+a_4=30$ və $a_2+a_3+a_4+a_5=50$ olarsa, silsilə fərqini tapın.',
  NULL, NULL, NULL, '5',
  'İkinci cəmdən birincini çıxaq: $a_5-a_1=4d=20\Rightarrow d=5$.',
  2025, 'I', 118, 102)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0027 | əsas: 2025 toplu, I hissə, səh.118 №103
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0027', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'written',
  '$(a_n)$ ədədi silsiləsində $a_1+a_2+a_3+a_4=20$ və $a_2+a_3+a_4+a_5=56$ olarsa, silsilə fərqini tapın.',
  NULL, NULL, NULL, '9',
  '$a_5-a_1=4d=36\Rightarrow d=9$.',
  2025, 'I', 118, 103)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0028 | əsas: 2025 toplu, I hissə, səh.119 №117
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0028', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'written',
  'Ədədi silsilənin birinci, üçüncü və dördüncü hədlərinin cəmi $10$-a, ikinci, dördüncü və beşinci hədlərinin cəmi isə $31$-ə bərabərdir. Bu silsilənin fərqini tapın.',
  NULL, NULL, NULL, '7',
  'Hər bir hədd bir indeks artdıqda $d$ qədər artır, ona görə ikinci cəm birincidən $3d$ böyükdür: $3d=21\Rightarrow d=7$.',
  2025, 'I', 119, 117)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0029 | əsas: 2025 toplu, I hissə, səh.119 №124
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0029', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'written',
  '$(a_n)$ ədədi silsiləsində $a_{11}=15$ olarsa, bu silsilənin ilk $21$ həddinin cəmini tapın.',
  NULL, NULL, NULL, '315',
  '$S_{21}=\dfrac{a_1+a_{21}}{2}\cdot21=a_{11}\cdot21=315$.',
  2025, 'I', 119, 124)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0030 | əsas: 2025 toplu, I hissə, səh.119 №125
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0030', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi silsilələr'), 'original', 'own', 'az', 'draft', 'written',
  '$(a_n)$ ədədi silsiləsində $a_{13}=-4$ olarsa, bu silsilənin ilk $25$ həddinin cəmini tapın.',
  NULL, NULL, NULL, '-100',
  '$S_{25}=25\cdot a_{13}=-100$.',
  2025, 'I', 119, 125)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0031 | əsas: 2025 toplu, I hissə, səh.121 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0031', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Həndəsi silsilələr. Sonsuz həndəsi silsilənin cəmi (|q|<1)'), 'original', 'own', 'az', 'draft', 'closed',
  '$b_1=6$ və $q=-\dfrac12$ olarsa, sonsuz azalan həndəsi silsilənin cəmini tapın.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$2$"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$6$"}, {"key": "E", "text": "$12$"}]'::jsonb, 'A', NULL, NULL,
  '$S=\dfrac{b_1}{1-q}=\dfrac{6}{1+\frac12}=\dfrac{6}{\frac32}=4$.',
  2025, 'I', 121, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0032 | əsas: 2025 toplu, I hissə, səh.121 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0032', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Həndəsi silsilələr. Sonsuz həndəsi silsilənin cəmi (|q|<1)'), 'original', 'own', 'az', 'draft', 'closed',
  '$b_1=\dfrac34,\ q=\dfrac12$ olarsa, sonsuz azalan həndəsi silsilənin cəmini tapın.',
  '[{"key": "A", "text": "$\\dfrac{3}{2}$"}, {"key": "B", "text": "$1$"}, {"key": "C", "text": "$\\dfrac{3}{4}$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$2$"}]'::jsonb, 'A', NULL, NULL,
  '$S=\dfrac{3/4}{1-1/2}=\dfrac{3}{2}$.',
  2025, 'I', 121, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0033 | əsas: 2025 toplu, I hissə, səh.121 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0033', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Həndəsi silsilələr. Sonsuz həndəsi silsilənin cəmi (|q|<1)'), 'original', 'own', 'az', 'draft', 'closed',
  'Birinci həddi $3$, üçüncü həddi $27$ olan həndəsi silsilənin ikinci həddini tapın.',
  '[{"key": "A", "text": "$27$"}, {"key": "B", "text": "$\\pm3$"}, {"key": "C", "text": "$\\pm9$"}, {"key": "D", "text": "$9$"}, {"key": "E", "text": "$-9$"}]'::jsonb, 'C', NULL, NULL,
  '$b_2^2=b_1b_3=81\Rightarrow b_2=\pm9$ ($q=\pm3$).',
  2025, 'I', 121, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0034 | əsas: 2025 toplu, I hissə, səh.121 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0034', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Həndəsi silsilələr. Sonsuz həndəsi silsilənin cəmi (|q|<1)'), 'original', 'own', 'az', 'draft', 'closed',
  'İkinci həddi $2$, dördüncü həddi $50$ olan həndəsi silsilənin üçüncü həddini tapın.',
  '[{"key": "A", "text": "$10$"}, {"key": "B", "text": "$\\pm10$"}, {"key": "C", "text": "$-10$"}, {"key": "D", "text": "$\\pm5$"}, {"key": "E", "text": "$\\pm25$"}]'::jsonb, 'B', NULL, NULL,
  '$b_3^2=b_2b_4=100\Rightarrow b_3=\pm10$.',
  2025, 'I', 121, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0035 | əsas: 2025 toplu, I hissə, səh.123 №48
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0035', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Həndəsi silsilələr. Sonsuz həndəsi silsilənin cəmi (|q|<1)'), 'original', 'own', 'az', 'draft', 'closed',
  'Hədləri müsbət olan həndəsi silsilədə $b_3=4,\ b_5=36$ olarsa, silsilənin ilk beş həddinin cəmini tapın.',
  '[{"key": "A", "text": "$40\\dfrac{1}{3}$"}, {"key": "B", "text": "$53\\dfrac{7}{9}$"}, {"key": "C", "text": "$121$"}, {"key": "D", "text": "$53\\dfrac{4}{9}$"}, {"key": "E", "text": "$48\\dfrac{4}{9}$"}]'::jsonb, 'B', NULL, NULL,
  '$q^2=\dfrac{36}{4}=9$, hədlər müsbət olduğundan $q=3$. $b_1=\dfrac{4}{9}$. $S_5=\dfrac{4}{9}\cdot\dfrac{3^5-1}{3-1}=\dfrac49\cdot121=\dfrac{484}{9}=53\dfrac79$.',
  2025, 'I', 123, 48)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0036 | əsas: 2025 toplu, I hissə, səh.123 №49
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0036', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Həndəsi silsilələr. Sonsuz həndəsi silsilənin cəmi (|q|<1)'), 'original', 'own', 'az', 'draft', 'closed',
  'Hədləri müsbət olan həndəsi silsilədə $b_3=18,\ b_5=162$ olarsa, silsilənin ilk beş həddinin cəmini tapın.',
  '[{"key": "A", "text": "$240$"}, {"key": "B", "text": "$162$"}, {"key": "C", "text": "$244$"}, {"key": "D", "text": "$242$"}, {"key": "E", "text": "$182$"}]'::jsonb, 'D', NULL, NULL,
  '$q^2=9$, $q=3$; $b_1=\dfrac{18}{9}=2$. $S_5=2\cdot\dfrac{243-1}{2}=242$.',
  2025, 'I', 123, 49)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0037 | əsas: 2025 toplu, I hissə, səh.123 №60
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0037', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Həndəsi silsilələr. Sonsuz həndəsi silsilənin cəmi (|q|<1)'), 'original', 'own', 'az', 'draft', 'closed',
  'Həndəsi silsilənin hədləri $\begin{cases}b_3+b_4=36,\\b_4=3b_3\end{cases}$ şərtini ödəyir. Bu silsilənin ilk $4$ həddinin cəmini tapın.',
  '[{"key": "A", "text": "$13$"}, {"key": "B", "text": "$39$"}, {"key": "C", "text": "$40$"}, {"key": "D", "text": "$120$"}, {"key": "E", "text": "$36$"}]'::jsonb, 'C', NULL, NULL,
  '$q=\dfrac{b_4}{b_3}=3$. $b_3(1+3)=36\Rightarrow b_3=9$, $b_1=\dfrac{9}{9}=1$. $S_4=1+3+9+27=40$.',
  2025, 'I', 123, 60)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0038 | əsas: 2025 toplu, I hissə, səh.123 №61
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0038', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Həndəsi silsilələr. Sonsuz həndəsi silsilənin cəmi (|q|<1)'), 'original', 'own', 'az', 'draft', 'closed',
  'Hədləri $\begin{cases}b_2+b_3=30,\\b_5=2b_4\end{cases}$ şərtlərini ödəyən həndəsi silsilənin ilk dörd həddinin cəmini tapın.',
  '[{"key": "A", "text": "$75$"}, {"key": "B", "text": "$45$"}, {"key": "C", "text": "$70$"}, {"key": "D", "text": "$150$"}, {"key": "E", "text": "$80$"}]'::jsonb, 'A', NULL, NULL,
  '$q=2$; $b_2(1+2)=30\Rightarrow b_2=10$, $b_1=5$. $S_4=5+10+20+40=75$.',
  2025, 'I', 123, 61)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0039 | əsas: 2025 toplu, I hissə, səh.124 №76
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0039', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Həndəsi silsilələr. Sonsuz həndəsi silsilənin cəmi (|q|<1)'), 'original', 'own', 'az', 'draft', 'written',
  '$x-4;\ x-6;\ x$ ədədləri həndəsi silsilənin ardıcıl hədləri olarsa, $x$-i tapın.',
  NULL, NULL, NULL, '4,5',
  '$(x-6)^2=x(x-4)\Rightarrow x^2-12x+36=x^2-4x\Rightarrow8x=36\Rightarrow x=4{,}5$. Hədlər: $0{,}5;\ -1{,}5;\ 4{,}5$ ($q=-3$).',
  2025, 'I', 124, 76)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0040 | əsas: 2025 toplu, I hissə, səh.124 №77
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0040', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Həndəsi silsilələr. Sonsuz həndəsi silsilənin cəmi (|q|<1)'), 'original', 'own', 'az', 'draft', 'written',
  '$x-5;\ x-3;\ x$ ədədləri həndəsi silsilənin ardıcıl hədləri olarsa, $x$-i tapın.',
  NULL, NULL, NULL, '9',
  '$(x-3)^2=x(x-5)\Rightarrow-6x+9=-5x\Rightarrow x=9$. Hədlər: $4;\ 6;\ 9$ ($q=1{,}5$).',
  2025, 'I', 124, 77)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0041 | əsas: 2025 toplu, I hissə, səh.126 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0041', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi və həndəsi silsilələrə aid məsələlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Ədədi silsilənin ardıcıl hədləri olan üç müsbət ədədin cəmi $15$-ə bərabərdir. Bu ədədlərə uyğun olaraq $2$, $5$ və $13$ əlavə etsək, alınan ədədlər yazıldığı sırada həndəsi silsilə təşkil edər. Əvvəlki üç ədədin hasilini tapın.',
  '[{"key": "A", "text": "$75$"}, {"key": "B", "text": "$120$"}, {"key": "C", "text": "$105$"}, {"key": "D", "text": "$80$"}, {"key": "E", "text": "$135$"}]'::jsonb, 'C', NULL, NULL,
  'Ədədlər $5-d,\ 5,\ 5+d$. Yeni ədədlər $7-d,\ 10,\ 18+d$: $100=(7-d)(18+d)\Rightarrow d^2+11d-26=0\Rightarrow d=2$ ($d=-13$ olduqda ədədlər müsbət olmur). Ədədlər $3,5,7$; hasil $105$.',
  2025, 'I', 126, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0042 | əsas: 2025 toplu, I hissə, səh.126 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0042', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi və həndəsi silsilələrə aid məsələlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Ədədi silsilənin ardıcıl hədləri olan üç müsbət ədədin cəmi $21$-ə bərabərdir. Birinci ədədi dəyişməsək, ikincisinə $3$, üçüncüsünə $11$ əlavə etsək, alınan ədədlər yazıldığı sırada həndəsi silsilə təşkil edər. Əvvəlki üç ədədin hasilini tapın.',
  '[{"key": "A", "text": "$343$"}, {"key": "B", "text": "$231$"}, {"key": "C", "text": "$280$"}, {"key": "D", "text": "$105$"}, {"key": "E", "text": "$315$"}]'::jsonb, 'E', NULL, NULL,
  'Ədədlər $7-d,\ 7,\ 7+d$. Yeni ədədlər $7-d,\ 10,\ 18+d$: $(7-d)(18+d)=100\Rightarrow d^2+11d-26=0\Rightarrow d=2$. Ədədlər $5,7,9$; hasil $315$.',
  2025, 'I', 126, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0043 | əsas: 2025 toplu, I hissə, səh.126 №29
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0043', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi və həndəsi silsilələrə aid məsələlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$x,\ y,\ z$ müsbət ədədləri həndəsi silsilə, $x,\ 3y,\ 5z$ ədədləri isə ədədi silsilə təşkil edir. Həndəsi silsilənin vahiddən fərqli vuruğunu tapın.',
  '[{"key": "A", "text": "$5$"}, {"key": "B", "text": "$3$"}, {"key": "C", "text": "$\\dfrac{1}{2}$"}, {"key": "D", "text": "$\\dfrac{1}{5}$"}, {"key": "E", "text": "$\\dfrac{1}{3}$"}]'::jsonb, 'D', NULL, NULL,
  '$y=xq,\ z=xq^2$. Ədədi silsilə şərti: $2\cdot3y=x+5z\Rightarrow6xq=x+5xq^2\Rightarrow5q^2-6q+1=0\Rightarrow q\in\left\{1;\ \dfrac15\right\}$. Vahiddən fərqli vuruq: $\dfrac15$.',
  2025, 'I', 126, 29)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ARS-0044 | əsas: 2025 toplu, I hissə, səh.126 №30
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ARS-0044', NULL, NULL, (SELECT id FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Ədədi ardıcıllıqlar. Silsilələr' AND s.title='Ədədi və həndəsi silsilələrə aid məsələlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$x,\ y,\ z$ müsbət ədədləri həndəsi silsilə, $4x,\ 3y,\ 2z$ ədədləri isə ədədi silsilə təşkil edir. Həndəsi silsilənin vahiddən fərqli vuruğunu tapın.',
  '[{"key": "A", "text": "$3$"}, {"key": "B", "text": "$\\dfrac{1}{2}$"}, {"key": "C", "text": "$\\dfrac{1}{3}$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$2$"}]'::jsonb, 'E', NULL, NULL,
  '$2\cdot3y=4x+2z\Rightarrow6q=4+2q^2\Rightarrow q^2-3q+2=0\Rightarrow q\in\{1;2\}$. Cavab: $2$.',
  2025, 'I', 126, 30)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
