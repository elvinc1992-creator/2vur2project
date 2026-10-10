-- Mövzu: Faiz. Nisbət. Tənasüb — 57 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- FNT-0001 | əsas: 2025 toplu, I hissə, səh.20 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Nisbət. Tənasüb. Tənasübün xassələri. Düz və tərs mütənasiblik'), 'original', 'own', 'az', 'draft', 'closed',
  'Tənasübün orta hədləri $30$ və $12$-dir. Kənar hədlərdən biri $20$ olarsa, o biri kənar həddi tapın.',
  '[{"key": "A", "text": "$9$"}, {"key": "B", "text": "$16$"}, {"key": "C", "text": "$18$"}, {"key": "D", "text": "$15$"}, {"key": "E", "text": "$24$"}]'::jsonb, 'C', NULL, NULL,
  'Tənasübdə kənar hədlərin hasili orta hədlərin hasilinə bərabərdir: $20\cdot x=30\cdot12=360\Rightarrow x=18$.',
  2025, 'I', 20, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0002 | əsas: 2025 toplu, I hissə, səh.20 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Nisbət. Tənasüb. Tənasübün xassələri. Düz və tərs mütənasiblik'), 'original', 'own', 'az', 'draft', 'closed',
  'Tənasübün kənar hədləri $18$ və $40$, orta hədlərindən biri isə $24$-dür. O biri orta həddi tapın.',
  '[{"key": "A", "text": "$30$"}, {"key": "B", "text": "$36$"}, {"key": "C", "text": "$24$"}, {"key": "D", "text": "$20$"}, {"key": "E", "text": "$32$"}]'::jsonb, 'A', NULL, NULL,
  '$24\cdot x=18\cdot40=720\Rightarrow x=30$.',
  2025, 'I', 20, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0003 | əsas: 2025 toplu, I hissə, səh.20 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Nisbət. Tənasüb. Tənasübün xassələri. Düz və tərs mütənasiblik'), 'original', 'own', 'az', 'draft', 'closed',
  '$8$ saata $36$ detal hazırlayan usta eyni məhsuldarlıqla işləsə, $45$ detalı neçə saata hazırlayar?',
  '[{"key": "A", "text": "$9$"}, {"key": "B", "text": "$11$"}, {"key": "C", "text": "$8$"}, {"key": "D", "text": "$12$"}, {"key": "E", "text": "$10$"}]'::jsonb, 'E', NULL, NULL,
  'Detalların sayı ilə vaxt düz mütənasibdir: $\dfrac{8}{36}=\dfrac{x}{45}\Rightarrow x=\dfrac{8\cdot45}{36}=10$ saat.',
  2025, 'I', 20, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0004 | əsas: 2025 toplu, I hissə, səh.20 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Nisbət. Tənasüb. Tənasübün xassələri. Düz və tərs mütənasiblik'), 'original', 'own', 'az', 'draft', 'closed',
  'Gücü eyni olan $5$ nasos hovuzu $12$ saata doldurur. Həmin hovuzu $4$ saata doldurmaq üçün bu nasoslardan neçəsi lazımdır?',
  '[{"key": "A", "text": "$10$"}, {"key": "B", "text": "$12$"}, {"key": "C", "text": "$20$"}, {"key": "D", "text": "$18$"}, {"key": "E", "text": "$15$"}]'::jsonb, 'E', NULL, NULL,
  'Nasosların sayı ilə vaxt tərs mütənasibdir: $5\cdot12=x\cdot4\Rightarrow x=15$.',
  2025, 'I', 20, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0005 | əsas: 2025 toplu, I hissə, səh.20 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Nisbət. Tənasüb. Tənasübün xassələri. Düz və tərs mütənasiblik'), 'original', 'own', 'az', 'draft', 'closed',
  'Tarlanı $8$ günə şumlamaq üçün $9$ eyni gücə malik traktor lazımdır. Həmin tarlanı $6$ günə şumlamaq üçün neçə belə traktor lazımdır?',
  '[{"key": "A", "text": "$14$"}, {"key": "B", "text": "$12$"}, {"key": "C", "text": "$11$"}, {"key": "D", "text": "$13$"}, {"key": "E", "text": "$10$"}]'::jsonb, 'B', NULL, NULL,
  'Traktorların sayı ilə günlər tərs mütənasibdir: $9\cdot8=x\cdot6\Rightarrow x=12$.',
  2025, 'I', 20, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0006 | əsas: 2025 toplu, I hissə, səh.20 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Nisbət. Tənasüb. Tənasübün xassələri. Düz və tərs mütənasiblik'), 'original', 'own', 'az', 'draft', 'closed',
  '$3$ və $5$ ədədləri ilə düz mütənasib olan iki ədədin cəmi $24$-dür. Bu ədədlərin hasilini tapın.',
  '[{"key": "A", "text": "$150$"}, {"key": "B", "text": "$120$"}, {"key": "C", "text": "$144$"}, {"key": "D", "text": "$135$"}, {"key": "E", "text": "$90$"}]'::jsonb, 'D', NULL, NULL,
  'Ədədlər $3k$ və $5k$: $8k=24\Rightarrow k=3$. Ədədlər $9$ və $15$, hasil $135$.',
  2025, 'I', 20, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0007 | əsas: 2025 toplu, I hissə, səh.20 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0007', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Nisbət. Tənasüb. Tənasübün xassələri. Düz və tərs mütənasiblik'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{a}{3}=\dfrac{b}{4}=\dfrac{c}{6}$ və $a\cdot b\cdot c=576$ olarsa, $a+b+c$ cəmini tapın.',
  '[{"key": "A", "text": "$52$"}, {"key": "B", "text": "$26$"}, {"key": "C", "text": "$18$"}, {"key": "D", "text": "$13$"}, {"key": "E", "text": "$24$"}]'::jsonb, 'B', NULL, NULL,
  '$a=3k,\ b=4k,\ c=6k$. $abc=72k^3=576\Rightarrow k^3=8\Rightarrow k=2$. $a+b+c=13k=26$.',
  2025, 'I', 20, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0008 | əsas: 2025 toplu, I hissə, səh.20 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Nisbət. Tənasüb. Tənasübün xassələri. Düz və tərs mütənasiblik'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{a}{3}=\dfrac{b}{4}=\dfrac{c}{5}$ və $a+b+c=36$ olarsa, $a\cdot b\cdot c$ hasilini tapın.',
  '[{"key": "A", "text": "$540$"}, {"key": "B", "text": "$1200$"}, {"key": "C", "text": "$1620$"}, {"key": "D", "text": "$1440$"}, {"key": "E", "text": "$1800$"}]'::jsonb, 'C', NULL, NULL,
  '$a=3k,\ b=4k,\ c=5k$; $12k=36\Rightarrow k=3$. $a=9,\ b=12,\ c=15$; $abc=1620$.',
  2025, 'I', 20, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0009 | əsas: 2025 toplu, I hissə, səh.20 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Nisbət. Tənasüb. Tənasübün xassələri. Düz və tərs mütənasiblik'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{0{,}2y}{x-y}=\dfrac{0{,}4}{1{,}2}$ və $y=1\dfrac{1}{2}:2\dfrac{1}{4}+\dfrac{1}{3}$ olarsa, $x$-i tapın.',
  '[{"key": "A", "text": "$1{,}4$"}, {"key": "B", "text": "$2$"}, {"key": "C", "text": "$0{,}6$"}, {"key": "D", "text": "$1{,}2$"}, {"key": "E", "text": "$1{,}6$"}]'::jsonb, 'E', NULL, NULL,
  '$y=\dfrac{3}{2}:\dfrac{9}{4}+\dfrac{1}{3}=\dfrac{3}{2}\cdot\dfrac{4}{9}+\dfrac{1}{3}=\dfrac{2}{3}+\dfrac{1}{3}=1$. Onda $\dfrac{0{,}2}{x-1}=\dfrac{1}{3}\Rightarrow x-1=0{,}6\Rightarrow x=1{,}6$.',
  2025, 'I', 20, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0010 | əsas: 2025 toplu, I hissə, səh.20 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Nisbət. Tənasüb. Tənasübün xassələri. Düz və tərs mütənasiblik'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{0{,}3y}{x-y}=\dfrac{0{,}6}{1{,}8}$ və $y=3\dfrac{1}{3}:1\dfrac{2}{3}-1$ olarsa, $x$-i tapın.',
  '[{"key": "A", "text": "$2{,}1$"}, {"key": "B", "text": "$0{,}9$"}, {"key": "C", "text": "$1{,}3$"}, {"key": "D", "text": "$1{,}9$"}, {"key": "E", "text": "$2$"}]'::jsonb, 'D', NULL, NULL,
  '$y=\dfrac{10}{3}:\dfrac{5}{3}-1=2-1=1$. $\dfrac{0{,}3}{x-1}=\dfrac{1}{3}\Rightarrow x-1=0{,}9\Rightarrow x=1{,}9$.',
  2025, 'I', 20, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0011 | əsas: 2025 toplu, I hissə, səh.20 №18
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0011', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Nisbət. Tənasüb. Tənasübün xassələri. Düz və tərs mütənasiblik'), 'original', 'own', 'az', 'draft', 'closed',
  '$a:b=3:4$ və $b:c=2:3$ olarsa, $\dfrac{b^2-a^2}{c^2-b^2}$ nisbətini tapın.',
  '[{"key": "A", "text": "$\\dfrac{7}{20}$"}, {"key": "B", "text": "$\\dfrac{4}{9}$"}, {"key": "C", "text": "$\\dfrac{20}{7}$"}, {"key": "D", "text": "$\\dfrac{9}{16}$"}, {"key": "E", "text": "$\\dfrac{3}{5}$"}]'::jsonb, 'A', NULL, NULL,
  '$b:c=2:3=4:6$, ona görə $a:b:c=3:4:6$; $a=3k,\ b=4k,\ c=6k$. $\dfrac{16k^2-9k^2}{36k^2-16k^2}=\dfrac{7}{20}$.',
  2025, 'I', 20, 18)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0012 | əsas: 2025 toplu, I hissə, səh.21 №36
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0012', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Nisbət. Tənasüb. Tənasübün xassələri. Düz və tərs mütənasiblik'), 'original', 'own', 'az', 'draft', 'written',
  'Kitablar I, II və III rəflərə onların ümumi sayı uyğun olaraq $2$, $4$ və $5$ ədədləri ilə tərs mütənasib hissələrə bölünməklə yerləşdirildi. I və II rəfdə olan kitabların ümumi sayı III rəfdə olan kitablardan $33$ ədəd çox olarsa, rəflərdəki bütün kitabların sayını tapın.',
  NULL, NULL, NULL, '57',
  'Hissələr $\dfrac{1}{2}:\dfrac{1}{4}:\dfrac{1}{5}=10:5:4$ nisbətindədir (hər birini $20$-yə vurduq). Kitablar: $10k,\ 5k,\ 4k$. $10k+5k-4k=11k=33\Rightarrow k=3$. Cəmi: $19k=57$.',
  2025, 'I', 21, 36)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0013 | əsas: 2025 toplu, I hissə, səh.22 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faiz. Ədədin faizinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  'Plana görə tornaçı gündə $350$ detal hazırlamalı idi. O, planı $120\%$ yerinə yetirdi. Tornaçı neçə detal hazırladı?',
  '[{"key": "A", "text": "$385$"}, {"key": "B", "text": "$470$"}, {"key": "C", "text": "$420$"}, {"key": "D", "text": "$120$"}, {"key": "E", "text": "$70$"}]'::jsonb, 'C', NULL, NULL,
  '$350\cdot1{,}2=420$ detal.',
  2025, 'I', 22, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0014 | əsas: 2025 toplu, I hissə, səh.22 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faiz. Ədədin faizinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$a$ ədədi $60$-ın $35\%$-i, $b$ isə $35$-in $60\%$-idirsə, $a$ və $b$ ədədləri arasında münasibətlərdən hansı doğrudur?',
  '[{"key": "A", "text": "$a=b$"}, {"key": "B", "text": "$a=b+25$"}, {"key": "C", "text": "$a>b$"}, {"key": "D", "text": "$b=a+25$"}, {"key": "E", "text": "$b>a$"}]'::jsonb, 'A', NULL, NULL,
  '$a=60\cdot0{,}35=21$, $b=35\cdot0{,}6=21$. Ümumiyyətlə, $x$-in $y\%$-i $y$-in $x\%$-inə bərabərdir: $\dfrac{xy}{100}$. Deməli $a=b$.',
  2025, 'I', 22, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0015 | əsas: 2025 toplu, I hissə, səh.22 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0015', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faiz. Ədədin faizinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  'Tamaşa zalında $800$ yer var. Bütün yerlərin $37{,}5\%$-i parterdə, qalanları amfiteatrdadır. Amfiteatrda neçə yer var?',
  '[{"key": "A", "text": "$537{,}5$"}, {"key": "B", "text": "$500$"}, {"key": "C", "text": "$462$"}, {"key": "D", "text": "$300$"}, {"key": "E", "text": "$762{,}5$"}]'::jsonb, 'B', NULL, NULL,
  'Amfiteatra düşən: $100\%-37{,}5\%=62{,}5\%$. $800\cdot0{,}625=500$ yer.',
  2025, 'I', 22, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0016 | əsas: 2025 toplu, I hissə, səh.22 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faiz. Ədədin faizinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$a$ ədədinin $20\%$-i $b$ ədədinin $50\%$-nə bərabər olarsa, $\dfrac{b}{4a}$-nı tapın.',
  '[{"key": "A", "text": "$\\dfrac{1}{8}$"}, {"key": "B", "text": "$\\dfrac{1}{5}$"}, {"key": "C", "text": "$\\dfrac{1}{10}$"}, {"key": "D", "text": "$\\dfrac{5}{8}$"}, {"key": "E", "text": "$\\dfrac{2}{5}$"}]'::jsonb, 'C', NULL, NULL,
  '$0{,}2a=0{,}5b\Rightarrow\dfrac{b}{a}=\dfrac{2}{5}$. $\dfrac{b}{4a}=\dfrac{1}{4}\cdot\dfrac{2}{5}=\dfrac{1}{10}$.',
  2025, 'I', 22, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0017 | əsas: 2025 toplu, I hissə, səh.22 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faiz. Ədədin faizinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$a$ ədədinin $15\%$-i $b$ ədədinin $40\%$-nə bərabərdirsə, $\dfrac{b}{3a}$-nı tapın.',
  '[{"key": "A", "text": "$\\dfrac{8}{9}$"}, {"key": "B", "text": "$\\dfrac{1}{8}$"}, {"key": "C", "text": "$\\dfrac{1}{3}$"}, {"key": "D", "text": "$\\dfrac{3}{4}$"}, {"key": "E", "text": "$\\dfrac{3}{8}$"}]'::jsonb, 'B', NULL, NULL,
  '$0{,}15a=0{,}4b\Rightarrow\dfrac{b}{a}=\dfrac{15}{40}=\dfrac{3}{8}$. $\dfrac{b}{3a}=\dfrac{1}{3}\cdot\dfrac{3}{8}=\dfrac{1}{8}$.',
  2025, 'I', 22, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0018 | əsas: 2025 toplu, I hissə, səh.22 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faiz. Ədədin faizinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  'İki müsbət ədəddən birinin $25\%$-i digərinin $40\%$-inə bərabərdir. Bu ədədlərin cəmi $260$-a bərabər olarsa, onları tapın.',
  '[{"key": "A", "text": "$140;\\ 120$"}, {"key": "B", "text": "$150;\\ 110$"}, {"key": "C", "text": "$180;\\ 80$"}, {"key": "D", "text": "$170;\\ 90$"}, {"key": "E", "text": "$160;\\ 100$"}]'::jsonb, 'E', NULL, NULL,
  '$0{,}25a=0{,}4b\Rightarrow a=1{,}6b$. $1{,}6b+b=2{,}6b=260\Rightarrow b=100$, $a=160$.',
  2025, 'I', 22, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0019 | əsas: 2025 toplu, I hissə, səh.22 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faiz. Ədədin faizinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  'İki müsbət ədəddən birinin $35\%$-i digərinin $21\%$-inə bərabərdir. Bu ədədlərin fərqi $60$ olarsa, onları tapın.',
  '[{"key": "A", "text": "$160;\\ 100$"}, {"key": "B", "text": "$120;\\ 60$"}, {"key": "C", "text": "$180;\\ 120$"}, {"key": "D", "text": "$140;\\ 80$"}, {"key": "E", "text": "$150;\\ 90$"}]'::jsonb, 'E', NULL, NULL,
  '$0{,}35a=0{,}21b\Rightarrow a=0{,}6b$, yəni $b>a$. $b-a=0{,}4b=60\Rightarrow b=150$, $a=90$.',
  2025, 'I', 22, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0020 | əsas: 2025 toplu, I hissə, səh.22 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faiz. Ədədin faizinin tapılması'), 'original', 'own', 'az', 'draft', 'open',
  'İki müsbət ədəddən birinin $25\%$-i digərinin $40\%$-inə bərabərdir. Kiçik ədəd $25$ olarsa, onların fərqinin modulunu tapın.',
  NULL, NULL, NULL, '15',
  '$0{,}25a=0{,}4b\Rightarrow a=1{,}6b$, deməli $b$ kiçik ədəddir: $b=25$, $a=40$. $|a-b|=15$.',
  2025, 'I', 22, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0021 | əsas: 2025 toplu, I hissə, səh.22 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faiz. Ədədin faizinin tapılması'), 'original', 'own', 'az', 'draft', 'open',
  'İki müsbət ədəddən birinin $15\%$-i digərinin $24\%$-inə bərabərdir. Kiçik ədəd $50$ olarsa, onların cəmini tapın.',
  NULL, NULL, NULL, '130',
  '$0{,}15a=0{,}24b\Rightarrow a=1{,}6b$; kiçik ədəd $b=50$, $a=80$. Cəm: $130$.',
  2025, 'I', 22, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0022 | əsas: 2025 toplu, I hissə, səh.22 №18
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faiz. Ədədin faizinin tapılması'), 'original', 'own', 'az', 'draft', 'open',
  '$18\%$-i ilə $3\%$-inin fərqi $45$ olan ədədin $40\%$-ni tapın.',
  NULL, NULL, NULL, '120',
  '$18\%-3\%=15\%$; $0{,}15x=45\Rightarrow x=300$. $300\cdot0{,}4=120$.',
  2025, 'I', 22, 18)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0023 | əsas: 2025 toplu, I hissə, səh.22 №19
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faiz. Ədədin faizinin tapılması'), 'original', 'own', 'az', 'draft', 'open',
  '$15\%$-i ilə $25\%$-inin cəmi $120$ olan ədədin $35\%$-ni tapın.',
  NULL, NULL, NULL, '105',
  '$15\%+25\%=40\%$; $0{,}4x=120\Rightarrow x=300$. $300\cdot0{,}35=105$.',
  2025, 'I', 22, 19)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0024 | əsas: 2025 toplu, I hissə, səh.22 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizinə görə ədədin tapılması. İki ədədin faiz nisbəti'), 'original', 'own', 'az', 'draft', 'closed',
  'Şəhərin əhalisi bir il ərzində $64000$ nəfərdən $68800$ nəfərə qədər artdı. Əhalinin illik artım faizini tapın.',
  '[{"key": "A", "text": "$8\\%$"}, {"key": "B", "text": "$6\\%$"}, {"key": "C", "text": "$7{,}5\\%$"}, {"key": "D", "text": "$4{,}8\\%$"}, {"key": "E", "text": "$7\\%$"}]'::jsonb, 'C', NULL, NULL,
  'Artım: $68800-64000=4800$. $\dfrac{4800}{64000}\cdot100\%=7{,}5\%$.',
  2025, 'I', 22, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0025 | əsas: 2025 toplu, I hissə, səh.22 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0025', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizinə görə ədədin tapılması. İki ədədin faiz nisbəti'), 'original', 'own', 'az', 'draft', 'closed',
  'Birinci ədəd ikinci ədədin $40\%$-ini təşkil edir. İkinci ədəd birinci ədədin neçə faizini təşkil edir?',
  '[{"key": "A", "text": "$250\\%$"}, {"key": "B", "text": "$140\\%$"}, {"key": "C", "text": "$60\\%$"}, {"key": "D", "text": "$150\\%$"}, {"key": "E", "text": "$40\\%$"}]'::jsonb, 'A', NULL, NULL,
  '$a=0{,}4b\Rightarrow\dfrac{b}{a}=\dfrac{1}{0{,}4}=2{,}5=250\%$.',
  2025, 'I', 22, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0026 | əsas: 2025 toplu, I hissə, səh.22 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizinə görə ədədin tapılması. İki ədədin faiz nisbəti'), 'original', 'own', 'az', 'draft', 'closed',
  '$160$ t mis filizindən $36$ t mis alınır. Filizin tərkibində neçə faiz mis var?',
  '[{"key": "A", "text": "$22{,}5\\%$"}, {"key": "B", "text": "$36\\%$"}, {"key": "C", "text": "$20\\%$"}, {"key": "D", "text": "$25\\%$"}, {"key": "E", "text": "$18\\%$"}]'::jsonb, 'A', NULL, NULL,
  '$\dfrac{36}{160}\cdot100\%=22{,}5\%$.',
  2025, 'I', 22, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0027 | əsas: 2025 toplu, I hissə, səh.22 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0027', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizinə görə ədədin tapılması. İki ədədin faiz nisbəti'), 'original', 'own', 'az', 'draft', 'closed',
  'Mağazadakı almanın $52$ kq-ı satıldıqdan sonra mağazada əvvəlki miqdarın $35\%$-i qədər alma qaldı. Mağazada neçə kiloqram alma qalıb?',
  '[{"key": "A", "text": "$24$ kq"}, {"key": "B", "text": "$28$ kq"}, {"key": "C", "text": "$26$ kq"}, {"key": "D", "text": "$18{,}2$ kq"}, {"key": "E", "text": "$33{,}8$ kq"}]'::jsonb, 'B', NULL, NULL,
  'Satılan hissə $100\%-35\%=65\%$: $0{,}65x=52\Rightarrow x=80$ kq. Qalan: $80\cdot0{,}35=28$ kq.',
  2025, 'I', 22, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0028 | əsas: 2025 toplu, I hissə, səh.23 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0028', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizinə görə ədədin tapılması. İki ədədin faiz nisbəti'), 'original', 'own', 'az', 'draft', 'closed',
  'Meyvə qurudulduqda öz çəkisinin $75\%$-ini itirir. $45$ kq quru meyvə almaq üçün nə qədər təzə meyvə götürmək lazımdır?',
  '[{"key": "A", "text": "$180$ kq"}, {"key": "B", "text": "$200$ kq"}, {"key": "C", "text": "$60$ kq"}, {"key": "D", "text": "$170$ kq"}, {"key": "E", "text": "$225$ kq"}]'::jsonb, 'A', NULL, NULL,
  'Quru meyvə təzə meyvənin $25\%$-idir: $0{,}25x=45\Rightarrow x=180$ kq.',
  2025, 'I', 23, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0029 | əsas: 2025 toplu, I hissə, səh.23 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0029', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizinə görə ədədin tapılması. İki ədədin faiz nisbəti'), 'original', 'own', 'az', 'draft', 'closed',
  'İclasda $250$ nəfər iştirak edirdi. Təklif olunan qərarın lehinə $172$ nəfər səs verdi. İclasdakı adamların neçə faizi qərarın lehinə səs vermişdir?',
  '[{"key": "A", "text": "$70$"}, {"key": "B", "text": "$68{,}8$"}, {"key": "C", "text": "$72$"}, {"key": "D", "text": "$68$"}, {"key": "E", "text": "$69{,}2$"}]'::jsonb, 'B', NULL, NULL,
  '$\dfrac{172}{250}\cdot100\%=68{,}8\%$.',
  2025, 'I', 23, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0030 | əsas: 2025 toplu, I hissə, səh.23 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0030', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizinə görə ədədin tapılması. İki ədədin faiz nisbəti'), 'original', 'own', 'az', 'draft', 'closed',
  'Müəssisə il ərzində $9750$ məmulat buraxıb planı $30\%$ artıqlaması ilə yerinə yetirdi. Müəssisənin plan tapşırığı nə qədər idi?',
  '[{"key": "A", "text": "$7000$"}, {"key": "B", "text": "$8000$"}, {"key": "C", "text": "$6825$"}, {"key": "D", "text": "$7250$"}, {"key": "E", "text": "$7500$"}]'::jsonb, 'E', NULL, NULL,
  '$9750$ ədəd planın $130\%$-idir: $9750:1{,}3=7500$.',
  2025, 'I', 23, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0031 | əsas: 2025 toplu, I hissə, səh.24 №30
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0031', '/images/tasks/FNT-0031.png', 'Sütunlu diaqram: Fizika 60, Riyaziyyat 90, Kimya 40, Biologiya 10', (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizinə görə ədədin tapılması. İki ədədin faiz nisbəti'), 'original', 'own', 'az', 'draft', 'open',
  'Ay ərzində kitab mağazasında satılan fizika, riyaziyyat, kimya və biologiya dərsliklərinin sayının diaqramı verilmişdir. Satılan kitabların neçə faizi riyaziyyat dərsliyidir?',
  NULL, NULL, NULL, '45',
  'Cəmi: $60+90+40+10=200$. Riyaziyyat: $\dfrac{90}{200}\cdot100\%=45\%$.',
  2025, 'I', 24, 30)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0032 | əsas: 2025 toplu, I hissə, səh.24 №31
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0032', '/images/tasks/FNT-0032.png', 'Sütunlu diaqram: Fizika 75, Riyaziyyat 100, Kimya 50, Biologiya 25', (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizinə görə ədədin tapılması. İki ədədin faiz nisbəti'), 'original', 'own', 'az', 'draft', 'open',
  'Ay ərzində kitab mağazasında satılan fizika, riyaziyyat, kimya və biologiya dərsliklərinin sayının diaqramı verilmişdir. Satılan kitabların neçə faizi kimya dərsliyidir?',
  NULL, NULL, NULL, '20',
  'Cəmi: $75+100+50+25=250$. Kimya: $\dfrac{50}{250}\cdot100\%=20\%$.',
  2025, 'I', 24, 31)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0033 | əsas: 2025 toplu, I hissə, səh.24 №32
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0033', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizinə görə ədədin tapılması. İki ədədin faiz nisbəti'), 'original', 'own', 'az', 'draft', 'open',
  'Birinci ədəd ikinci ədədin $16\%$-ni təşkil edir. İkinci ədəd birinci ədədin neçə faizini təşkil edir?',
  NULL, NULL, NULL, '625',
  '$a=0{,}16b\Rightarrow\dfrac{b}{a}=\dfrac{1}{0{,}16}=6{,}25=625\%$.',
  2025, 'I', 24, 32)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0034 | əsas: 2025 toplu, I hissə, səh.24 №33
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0034', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizinə görə ədədin tapılması. İki ədədin faiz nisbəti'), 'original', 'own', 'az', 'draft', 'open',
  'Birinci ədəd ikinci ədədin $80\%$-ni təşkil edir. İkinci ədəd birinci ədədin neçə faizini təşkil edir?',
  NULL, NULL, NULL, '125',
  '$a=0{,}8b\Rightarrow\dfrac{b}{a}=\dfrac{1}{0{,}8}=1{,}25=125\%$.',
  2025, 'I', 24, 33)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0035 | əsas: 2025 toplu, I hissə, səh.24 №36
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0035', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizinə görə ədədin tapılması. İki ədədin faiz nisbəti'), 'original', 'own', 'az', 'draft', 'open',
  'Sinifdəki şagirdlərin $\dfrac{4}{7}$ hissəsi oğlandır, qızların isə $30\%$-i əlaçıdır. Əlaçı ***olmayan*** qızlar bütün şagirdlərin neçə faizini təşkil edir?',
  NULL, NULL, NULL, '30',
  'Qızlar sinfin $1-\dfrac{4}{7}=\dfrac{3}{7}$ hissəsidir. Əlaçı olmayan qızlar qızların $70\%$-i: $\dfrac{3}{7}\cdot0{,}7=0{,}3=30\%$.',
  2025, 'I', 24, 36)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0036 | əsas: 2023 toplu, I hissə, səh.32 №52
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0036', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizinə görə ədədin tapılması. İki ədədin faiz nisbəti'), 'original', 'own', 'az', 'draft', 'open',
  'Bir il ərzində alma ağacının boyu $15\%$ artaraq $2{,}07$ m oldu. İlin əvvəlində alma ağacının boyu neçə metr idi?',
  NULL, NULL, NULL, '1,8',
  '$2{,}07$ m əvvəlki boyun $115\%$-idir: $2{,}07:1{,}15=1{,}8$ m.',
  2023, 'I', 32, 52)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0037 | əsas: 2023 toplu, I hissə, səh.32 №53
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0037', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizinə görə ədədin tapılması. İki ədədin faiz nisbəti'), 'original', 'own', 'az', 'draft', 'open',
  'Bir il ərzində şam ağacının boyu $12\%$ artaraq $2{,}24$ m oldu. İlin əvvəlində şam ağacının boyu neçə metr idi?',
  NULL, NULL, NULL, '2',
  '$2{,}24:1{,}12=2$ m.',
  2023, 'I', 32, 53)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0038 | əsas: 2025 toplu, I hissə, səh.25 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0038', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizə aid məsələlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Qurudularkən göbələk öz kütləsinin $88\%$-ini itirir. Nə qədər təzə göbələk götürmək lazımdır ki, $18$ kq qurudulmuş göbələk alınsın?',
  '[{"key": "A", "text": "$120$ kq"}, {"key": "B", "text": "$180$ kq"}, {"key": "C", "text": "$160$ kq"}, {"key": "D", "text": "$150$ kq"}, {"key": "E", "text": "$135$ kq"}]'::jsonb, 'D', NULL, NULL,
  'Quru göbələk təzənin $12\%$-idir: $0{,}12x=18\Rightarrow x=150$ kq.',
  2025, 'I', 25, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0039 | əsas: 2025 toplu, I hissə, səh.25 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0039', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizə aid məsələlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Təzə meyvə qurudulduqda öz kütləsinin $84\%$-ini itirir. Nə qədər təzə meyvə götürmək lazımdır ki, $32$ kq meyvə qurusu alınsın?',
  '[{"key": "A", "text": "$200$ kq"}, {"key": "B", "text": "$180$ kq"}, {"key": "C", "text": "$240$ kq"}, {"key": "D", "text": "$160$ kq"}, {"key": "E", "text": "$220$ kq"}]'::jsonb, 'A', NULL, NULL,
  'Quru meyvə təzənin $16\%$-idir: $0{,}16x=32\Rightarrow x=200$ kq.',
  2025, 'I', 25, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0040 | əsas: 2025 toplu, I hissə, səh.25 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0040', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizə aid məsələlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Birinci gün mağazadakı ərzağın $20\%$-i, ikinci gün qalan ərzağın $45\%$-i satıldı. İki gündə mağazadakı ərzağın neçə faizi satıldı?',
  '[{"key": "A", "text": "$44$"}, {"key": "B", "text": "$56$"}, {"key": "C", "text": "$60$"}, {"key": "D", "text": "$65$"}, {"key": "E", "text": "$64$"}]'::jsonb, 'B', NULL, NULL,
  'I gündən sonra $80\%$ qalır. II gün bunun $45\%$-i satılır: $0{,}45\cdot80\%=36\%$. Cəmi: $20\%+36\%=56\%$.',
  2025, 'I', 25, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0041 | əsas: 2025 toplu, I hissə, səh.25 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0041', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizə aid məsələlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Əmtəənin qiyməti əvvəlcə $30\%$ artırıldı, sonra yeni qiymət $30\%$ azaldıldı. Əmtəənin ilkin qiyməti necə dəyişdi?',
  '[{"key": "A", "text": "$6\\%$ ucuzlaşdı"}, {"key": "B", "text": "$30\\%$ ucuzlaşdı"}, {"key": "C", "text": "$9\\%$ bahalaşdı"}, {"key": "D", "text": "$9\\%$ ucuzlaşdı"}, {"key": "E", "text": "dəyişmədi"}]'::jsonb, 'D', NULL, NULL,
  'İlkin qiymət $x$ olsun: $x\cdot1{,}3\cdot0{,}7=0{,}91x$. Qiymət $9\%$ ucuzlaşdı.',
  2025, 'I', 25, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0042 | əsas: 2025 toplu, I hissə, səh.25 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0042', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizə aid məsələlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Malın qiyməti əvvəlcə $20\%$ azaldıldı, sonra yeni qiymət $20\%$ artırıldı. Malın ilkin qiyməti necə dəyişdi?',
  '[{"key": "A", "text": "$20\\%$ ucuzlaşdı"}, {"key": "B", "text": "dəyişmədi"}, {"key": "C", "text": "$4\\%$ ucuzlaşdı"}, {"key": "D", "text": "$2\\%$ ucuzlaşdı"}, {"key": "E", "text": "$4\\%$ bahalaşdı"}]'::jsonb, 'C', NULL, NULL,
  '$x\cdot0{,}8\cdot1{,}2=0{,}96x$ — qiymət $4\%$ ucuzlaşdı.',
  2025, 'I', 25, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0043 | əsas: 2025 toplu, I hissə, səh.25 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0043', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizə aid məsələlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Əmtəənin qiyməti əvvəlcə $5\%$ artdı, sonra yeni qiymət $10\%$ azaldı. Əmtəənin əvvəlki qiyməti necə dəyişdi?',
  '[{"key": "A", "text": "$4{,}5\\%$ ucuzlaşdı"}, {"key": "B", "text": "$5\\%$ bahalaşdı"}, {"key": "C", "text": "$5{,}5\\%$ bahalaşdı"}, {"key": "D", "text": "$5{,}5\\%$ ucuzlaşdı"}, {"key": "E", "text": "$5\\%$ ucuzlaşdı"}]'::jsonb, 'D', NULL, NULL,
  '$x\cdot1{,}05\cdot0{,}9=0{,}945x$ — qiymət $5{,}5\%$ ucuzlaşdı.',
  2025, 'I', 25, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0044 | əsas: 2025 toplu, I hissə, səh.25 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0044', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizə aid məsələlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Televizorun qiyməti əvvəlcə $5\%$ ucuzlaşdı, sonra yeni qiymət $12\%$ bahalaşdı. Televizorun ilkin qiyməti necə dəyişdi?',
  '[{"key": "A", "text": "$6\\%$ bahalaşdı"}, {"key": "B", "text": "$7\\%$ bahalaşdı"}, {"key": "C", "text": "$7\\%$ ucuzlaşdı"}, {"key": "D", "text": "$6{,}4\\%$ bahalaşdı"}, {"key": "E", "text": "$6{,}4\\%$ ucuzlaşdı"}]'::jsonb, 'D', NULL, NULL,
  '$x\cdot0{,}95\cdot1{,}12=1{,}064x$ — qiymət $6{,}4\%$ bahalaşdı.',
  2025, 'I', 25, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0045 | əsas: 2025 toplu, I hissə, səh.26 №19
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0045', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizə aid məsələlər'), 'original', 'own', 'az', 'draft', 'written',
  'Birinci bağlamadakı kitabların $10\%$-i, ikincisindəkinin $40\%$-i ana dili dərslikləridir. İki bağlamadakı $120$ kitabın $25\%$-i ana dili dərsliyi olarsa, ikinci bağlamada neçə ana dili dərsliyi var?',
  NULL, NULL, NULL, '24',
  'Birinci bağlamada $x$, ikincidə $y$ kitab olsun: $x+y=120$, $0{,}1x+0{,}4y=0{,}25\cdot120=30$. Birinci tənliyi $0{,}1$-ə vurub çıxsaq: $0{,}3y=18\Rightarrow y=60$. İkinci bağlamada ana dili dərslikləri: $0{,}4\cdot60=24$.',
  2025, 'I', 26, 19)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0046 | əsas: 2025 toplu, I hissə, səh.26 №20
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0046', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizə aid məsələlər'), 'original', 'own', 'az', 'draft', 'written',
  'Birinci bağlamadakı kitabların $6\%$-i, ikincisindəkinin $30\%$-i riyaziyyat dərslikləridir. İki bağlamadakı $150$ kitabın $22\%$-i riyaziyyat dərsliyidirsə, birinci bağlamada neçə riyaziyyat dərsliyi var?',
  NULL, NULL, NULL, '3',
  '$x+y=150$, $0{,}06x+0{,}3y=0{,}22\cdot150=33$. $y=150-x$: $0{,}06x+45-0{,}3x=33\Rightarrow0{,}24x=12\Rightarrow x=50$. Birinci bağlamada: $0{,}06\cdot50=3$.',
  2025, 'I', 26, 20)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0047 | əsas: 2025 toplu, I hissə, səh.26 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0047', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizə aid məsələlər'), 'original', 'own', 'az', 'draft', 'open',
  'Malın qiymətini $30\%$ azaltdıqdan sonra yeni qiyməti $20\%$ azaltdılar. Malın ilkin qiymətini neçə faiz azaltdılar?',
  NULL, NULL, NULL, '44',
  '$x\cdot0{,}7\cdot0{,}8=0{,}56x$. Azalma: $100\%-56\%=44\%$.',
  2025, 'I', 26, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0048 | əsas: 2025 toplu, I hissə, səh.26 №30
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0048', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizə aid məsələlər'), 'original', 'own', 'az', 'draft', 'open',
  'Malın qiymətini əvvəlcə $20\%$, sonra yeni qiyməti $5$ dəfə azaltdılar. Malın ilkin qiyməti neçə faiz azaldı?',
  NULL, NULL, NULL, '84',
  '$x\cdot0{,}8:5=0{,}16x$. Azalma: $100\%-16\%=84\%$.',
  2025, 'I', 26, 30)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0049 | əsas: 2025 toplu, I hissə, səh.26 №31
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0049', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizə aid məsələlər'), 'original', 'own', 'az', 'draft', 'open',
  'Malın qiymətini əvvəlcə $15\%$, sonra yeni qiyməti $3$ dəfə artırdılar. Malın qiyməti neçə faiz artdı?',
  NULL, NULL, NULL, '245',
  '$x\cdot1{,}15\cdot3=3{,}45x$. Artım: $345\%-100\%=245\%$.',
  2025, 'I', 26, 31)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0050 | əsas: 2025 toplu, I hissə, səh.26 №33
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0050', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizə aid məsələlər'), 'original', 'own', 'az', 'draft', 'open',
  'Malın qiymətini $10\%$ azaltdıqdan sonra yeni qiyməti daha $30\%$ azaltdılar. Malın ilkin qiymətini neçə faiz azaltdılar?',
  NULL, NULL, NULL, '37',
  '$x\cdot0{,}9\cdot0{,}7=0{,}63x$. Azalma: $37\%$.',
  2025, 'I', 26, 33)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0051 | əsas: 2025 toplu, I hissə, səh.27 №39
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0051', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizə aid məsələlər'), 'original', 'own', 'az', 'draft', 'open',
  '$300$ q $18\%$-li şəkər məhlulundan neçə qram suyu buxarlandırmaq lazımdır ki, $24\%$-li məhlul alınsın?',
  NULL, NULL, NULL, '75',
  'Şəkər: $300\cdot0{,}18=54$ q (buxarlanmada dəyişmir). Yeni məhlul: $54:0{,}24=225$ q. Buxarlanan su: $300-225=75$ q.',
  2025, 'I', 27, 39)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0052 | əsas: 2025 toplu, I hissə, səh.27 №40
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0052', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizə aid məsələlər'), 'original', 'own', 'az', 'draft', 'open',
  '$400$ q $15\%$-li şəkər məhlulundan neçə qram suyu buxarlandırmaq lazımdır ki, $20\%$-li məhlul alınsın?',
  NULL, NULL, NULL, '100',
  'Şəkər: $400\cdot0{,}15=60$ q. Yeni məhlul: $60:0{,}2=300$ q. Buxarlanan su: $100$ q.',
  2025, 'I', 27, 40)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0053 | əsas: 2025 toplu, I hissə, səh.28 №62
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0053', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizə aid məsələlər'), 'original', 'own', 'az', 'draft', 'matching',
  '$200$ qram $25\%$-li duz məhlulu üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$50$ qram su əlavə edilərsə"}, {"key": "2", "text": "$50$ qram duz əlavə edilərsə"}, {"key": "3", "text": "$30$ qram su və $20$ qram duz əlavə edilərsə"}], "right": [{"key": "a", "text": "$20\\%$-li məhlul alınar"}, {"key": "b", "text": "$40\\%$-li məhlul alınar"}, {"key": "c", "text": "$28\\%$-li məhlul alınar"}, {"key": "d", "text": "məhlulda $100$ qram duz olar"}, {"key": "e", "text": "məhlulda $70$ qram duz olar"}]}'::jsonb, NULL, '{"1": ["a"], "2": ["b", "d"], "3": ["c", "e"]}'::jsonb, NULL,
  'Məhlulda $200\cdot0{,}25=50$ q duz var. 1) $\dfrac{50}{250}=20\%$. 2) Duz $50+50=100$ q, $\dfrac{100}{250}=40\%$. 3) Duz $50+20=70$ q, məhlul $250$ q: $\dfrac{70}{250}=28\%$.',
  2025, 'I', 28, 62)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0054 | əsas: 2025 toplu, I hissə, səh.28 №63
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0054', NULL, NULL, (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Faiz. Nisbət. Tənasüb' AND s.title='Faizə aid məsələlər'), 'original', 'own', 'az', 'draft', 'matching',
  '$500$ qram $20\%$-li duz məhlulu üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$125$ qram su əlavə etdikdə"}, {"key": "2", "text": "$125$ qram duz əlavə etdikdə"}, {"key": "3", "text": "$25$ qram su və $100$ qram duz əlavə etdikdə"}], "right": [{"key": "a", "text": "$36\\%$-li məhlul alınar"}, {"key": "b", "text": "$16\\%$-li məhlul alınar"}, {"key": "c", "text": "$32\\%$-li məhlul alınar"}, {"key": "d", "text": "məhlulda $225$ qram duz olar"}, {"key": "e", "text": "məhlulda $200$ qram duz olar"}]}'::jsonb, NULL, '{"1": ["b"], "2": ["a", "d"], "3": ["c", "e"]}'::jsonb, NULL,
  'Məhlulda $500\cdot0{,}2=100$ q duz var; hər halda yeni məhlul $625$ q olur. 1) $\dfrac{100}{625}=16\%$. 2) $\dfrac{225}{625}=36\%$, duz $225$ q. 3) $\dfrac{200}{625}=32\%$, duz $200$ q.',
  2025, 'I', 28, 63)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0055 | əsas: 2025 toplu, I hissə, səh.19 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0055', '/images/tasks/FNT-0055.png', 'Dairəvi diaqram: üzüm 1/6, alma 1/3, gavalı 1/4, armud (qiyməti göstərilməyib)', (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), NULL, 'original', 'own', 'az', 'draft', 'open',
  'Diaqramda gün ərzində mağazada satılmış meyvələr haqqında məlumat verilib. $45$ kq armud satıldığı məlumdursa, neçə kiloqram üzüm satılıb?',
  NULL, NULL, NULL, '30',
  'Armuda düşən hissə: $1-\left(\dfrac{1}{6}+\dfrac{1}{3}+\dfrac{1}{4}\right)=1-\dfrac{2+4+3}{12}=\dfrac{3}{12}=\dfrac{1}{4}$. Bütün meyvə: $45:\dfrac{1}{4}=180$ kq. Üzüm: $180\cdot\dfrac{1}{6}=30$ kq.',
  2025, 'I', 19, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0056 | əsas: 2025 toplu, I hissə, səh.19 №31
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0056', '/images/tasks/FNT-0056.png', 'Dairəvi diaqram: I gün 3/11, II gün 2/11, III gün 3/11, IV gün 1/11, V gün ?', (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), NULL, 'original', 'own', 'az', 'draft', 'open',
  'Dairəvi diaqramda kitab mağazasında beş gün ərzində satılmış kitabların sayı haqqında məlumat verilib. Birinci gün $18$ ədəd kitab satılıbsa, beşinci gün satılan kitabların sayını tapın.',
  NULL, NULL, NULL, '12',
  'V günə düşən hissə: $1-\dfrac{3+2+3+1}{11}=\dfrac{2}{11}$. Bütün kitablar: $18:\dfrac{3}{11}=66$. V gün: $66\cdot\dfrac{2}{11}=12$.',
  2025, 'I', 19, 31)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- FNT-0057 | əsas: 2025 toplu, I hissə, səh.19 №32
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('FNT-0057', '/images/tasks/FNT-0057.png', 'Dairəvi diaqram: I gün 1/9, II gün 2/9, III gün 1/9, IV gün ?, V gün 2/9', (SELECT id FROM topics WHERE name='Faiz. Nisbət. Tənasüb'), NULL, 'original', 'own', 'az', 'draft', 'open',
  'Beş gün ərzində satılan malın miqdarının gündəlik diaqramı verilib. Beşinci gün $14$ ədəd mal satılıbsa, dördüncü gün satılan malın miqdarı nə qədərdir?',
  NULL, NULL, NULL, '21',
  'IV günə düşən hissə: $1-\dfrac{1+2+1+2}{9}=\dfrac{3}{9}=\dfrac{1}{3}$. Bütün mal: $14:\dfrac{2}{9}=63$. IV gün: $63\cdot\dfrac{1}{3}=21$.',
  2025, 'I', 19, 32)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
