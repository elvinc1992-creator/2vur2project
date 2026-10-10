-- Mövzu: Çoxluqlar — 30 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- CXL-0001 | əsas: 2025 toplu, I hissə, səh.129 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqlar. Çoxluqların birləşməsi, kəsişməsi, fərqi'), 'original', 'own', 'az', 'draft', 'closed',
  '$M=\{2;4;6;8;10;12\}$ və $N=\{9;10;11;12;13\}$ çoxluqlarının kəsişməsini tapın.',
  '[{"key": "A", "text": "$\\{9;\\ 10;\\ 11;\\ 12;\\ 13\\}$"}, {"key": "B", "text": "$\\{10;\\ 12\\}$"}, {"key": "C", "text": "$\\{2;\\ 4;\\ 6;\\ 8\\}$"}, {"key": "D", "text": "$\\{9;\\ 11;\\ 13\\}$"}, {"key": "E", "text": "$\\{12\\}$"}]'::jsonb, 'B', NULL, NULL,
  'Kəsişmə hər iki çoxluqda olan elementlərdən ibarətdir: $10$ və $12$.',
  2025, 'I', 129, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0002 | əsas: 2025 toplu, I hissə, səh.129 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqlar. Çoxluqların birləşməsi, kəsişməsi, fərqi'), 'original', 'own', 'az', 'draft', 'closed',
  '$A$ çoxluğu $28$-in natural bölənləri çoxluğu, $B$ isə $12$-dən kiçik sadə ədədlər çoxluğudur. $A\cap B$-ni tapın.',
  '[{"key": "A", "text": "$\\varnothing$"}, {"key": "B", "text": "$\\{7\\}$"}, {"key": "C", "text": "$\\{1;\\ 2;\\ 7\\}$"}, {"key": "D", "text": "$\\{2;\\ 7\\}$"}, {"key": "E", "text": "$\\{2;\\ 3;\\ 5;\\ 7\\}$"}]'::jsonb, 'D', NULL, NULL,
  '$A=\{1;2;4;7;14;28\}$, $B=\{2;3;5;7;11\}$. Ortaq elementlər: $2$ və $7$. ($1$ sadə ədəd deyil.)',
  2025, 'I', 129, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0003 | əsas: 2025 toplu, I hissə, səh.129 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0003', '/images/tasks/CXL-0003.png', 'Üç çoxluğun (A, B, C) Eyler–Venn diaqramı, bir hissəsi ştrixlənib', (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqlar. Çoxluqların birləşməsi, kəsişməsi, fərqi'), 'original', 'own', 'az', 'draft', 'closed',
  'Ştrixlənmiş hissə ifadələrdən hansına uyğundur?',
  '[{"key": "A", "text": "$(A\\cup B)\\setminus C$"}, {"key": "B", "text": "$(A\\cap B)\\setminus C$"}, {"key": "C", "text": "$C\\setminus(A\\cup B)$"}, {"key": "D", "text": "$A\\cap B\\cap C$"}, {"key": "E", "text": "$A\\setminus(B\\cup C)$"}]'::jsonb, 'B', NULL, NULL,
  'Ştrixlənmiş hissə $A$ və $B$-nin ortaq hissəsidir, lakin $C$-yə daxil deyil: $(A\cap B)\setminus C$.',
  2025, 'I', 129, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0004 | əsas: 2025 toplu, I hissə, səh.129 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0004', '/images/tasks/CXL-0004.png', 'Üç çoxluğun (A, B, C) Eyler–Venn diaqramı, bir hissəsi ştrixlənib', (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqlar. Çoxluqların birləşməsi, kəsişməsi, fərqi'), 'original', 'own', 'az', 'draft', 'closed',
  'Ştrixlənmiş hissə ifadələrdən hansına uyğundur?',
  '[{"key": "A", "text": "$A\\cap B\\cap C$"}, {"key": "B", "text": "$B\\setminus(A\\cap C)$"}, {"key": "C", "text": "$(A\\cap C)\\setminus B$"}, {"key": "D", "text": "$(B\\cap C)\\setminus A$"}, {"key": "E", "text": "$(B\\cup C)\\setminus A$"}]'::jsonb, 'D', NULL, NULL,
  'Ştrixlənmiş hissə $B$ və $C$-nin ortaq hissəsidir və $A$-ya daxil deyil: $(B\cap C)\setminus A$.',
  2025, 'I', 129, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0005 | əsas: 2025 toplu, I hissə, səh.129 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0005', '/images/tasks/CXL-0005.png', 'Üç çoxluğun (A, B, C) Eyler–Venn diaqramı, bir hissəsi ştrixlənib', (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqlar. Çoxluqların birləşməsi, kəsişməsi, fərqi'), 'original', 'own', 'az', 'draft', 'closed',
  'Ştrixlənmiş hissə ifadələrdən hansına uyğundur?',
  '[{"key": "A", "text": "$C\\setminus(A\\cap B)$"}, {"key": "B", "text": "$A\\setminus(B\\cup C)$"}, {"key": "C", "text": "$(A\\cap B)\\cup C$"}, {"key": "D", "text": "$B\\setminus(A\\cup C)$"}, {"key": "E", "text": "$C\\setminus(A\\cup B)$"}]'::jsonb, 'E', NULL, NULL,
  'Ştrixlənmiş hissə yalnız $C$-yə aiddir — nə $A$-ya, nə də $B$-yə daxil deyil: $C\setminus(A\cup B)$.',
  2025, 'I', 129, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0006 | əsas: 2025 toplu, I hissə, səh.129 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0006', '/images/tasks/CXL-0006.png', 'Üç çoxluğun (A, B, C) Eyler–Venn diaqramı, bir hissəsi ştrixlənib', (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqlar. Çoxluqların birləşməsi, kəsişməsi, fərqi'), 'original', 'own', 'az', 'draft', 'closed',
  'Ştrixlənmiş hissə ifadələrdən hansına uyğundur?',
  '[{"key": "A", "text": "$(A\\cup C)\\setminus B$"}, {"key": "B", "text": "$B\\setminus(A\\cap C)$"}, {"key": "C", "text": "$(B\\cap C)\\setminus A$"}, {"key": "D", "text": "$A\\cap(B\\cup C)$"}, {"key": "E", "text": "$B\\setminus(A\\cup C)$"}]'::jsonb, 'B', NULL, NULL,
  'Ştrixlənmiş hissə $B$-nin bütün nöqtələridir, yalnız üç çoxluğun ortaq hissəsi ($A\cap C$ ilə kəsişən hissə) istisnadır: $B\setminus(A\cap C)$.',
  2025, 'I', 129, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0007 | əsas: 2025 toplu, I hissə, səh.129 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0007', '/images/tasks/CXL-0007.png', 'Üç çoxluğun (A, B, C) Eyler–Venn diaqramı, bir hissəsi ştrixlənib', (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqlar. Çoxluqların birləşməsi, kəsişməsi, fərqi'), 'original', 'own', 'az', 'draft', 'closed',
  'Ştrixlənmiş hissə ifadələrdən hansına uyğundur?',
  '[{"key": "A", "text": "$A\\cap(B\\cup C)$"}, {"key": "B", "text": "$A\\cap B\\cap C$"}, {"key": "C", "text": "$(A\\cap C)\\setminus B$"}, {"key": "D", "text": "$(A\\cap B)\\setminus C$"}, {"key": "E", "text": "$(A\\cup C)\\setminus B$"}]'::jsonb, 'C', NULL, NULL,
  'Ştrixlənmiş hissə $A$ və $C$-nin ortaq hissəsidir, $B$-yə daxil deyil: $(A\cap C)\setminus B$.',
  2025, 'I', 129, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0008 | əsas: 2025 toplu, I hissə, səh.130 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqlar. Çoxluqların birləşməsi, kəsişməsi, fərqi'), 'original', 'own', 'az', 'draft', 'closed',
  '$A$ ilə $(-5;\ 3]$ və $B$ ilə $[1;\ 7)$ aralığına daxil olan tam ədədlər çoxluğu işarə edilmişdir. $A\setminus B$ çoxluğuna daxil olan elementlərin cəmini tapın.',
  '[{"key": "A", "text": "$-6$"}, {"key": "B", "text": "$0$"}, {"key": "C", "text": "$-10$"}, {"key": "D", "text": "$-4$"}, {"key": "E", "text": "$-9$"}]'::jsonb, 'C', NULL, NULL,
  '$A=\{-4;-3;\dots;3\}$, $B=\{1;2;\dots;6\}$. $A\setminus B=\{-4;-3;-2;-1;0\}$, cəmi $-10$.',
  2025, 'I', 130, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0009 | əsas: 2025 toplu, I hissə, səh.130 №18
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqlar. Çoxluqların birləşməsi, kəsişməsi, fərqi'), 'original', 'own', 'az', 'draft', 'closed',
  '$A$ ilə $[2;\ 7)$ və $B$ ilə $(-3;\ 5]$ aralıqlarına daxil olan tam ədədlər çoxluğu işarə edilmişdir. $B\setminus A$ çoxluğuna daxil olan elementlərin cəmini tapın.',
  '[{"key": "A", "text": "$-2$"}, {"key": "B", "text": "$-3$"}, {"key": "C", "text": "$0$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$3$"}]'::jsonb, 'A', NULL, NULL,
  '$A=\{2;\dots;6\}$, $B=\{-2;\dots;5\}$. $B\setminus A=\{-2;-1;0;1\}$, cəmi $-2$.',
  2025, 'I', 130, 18)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0010 | əsas: 2025 toplu, I hissə, səh.130 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqlar. Çoxluqların birləşməsi, kəsişməsi, fərqi'), 'original', 'own', 'az', 'draft', 'closed',
  '$A\setminus B=\{2;4;9;15\}$ və $A\setminus C=\{4;6;9;12;18\}$ olarsa, $A\setminus(B\cap C)$ çoxluğunun elementlərinin sayını tapın.',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "$7$"}, {"key": "C", "text": "$5$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$9$"}]'::jsonb, 'B', NULL, NULL,
  'De Morqan qaydasına görə $A\setminus(B\cap C)=(A\setminus B)\cup(A\setminus C)=\{2;4;6;9;12;15;18\}$ — $7$ element.',
  2025, 'I', 130, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0011 | əsas: 2025 toplu, I hissə, səh.130 №29
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0011', '/images/tasks/CXL-0011.png', 'A, B, C çoxluqlarının elementləri göstərilmiş Eyler–Venn diaqramı', (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqlar. Çoxluqların birləşməsi, kəsişməsi, fərqi'), 'original', 'own', 'az', 'draft', 'matching',
  'Eyler–Venn diaqramına əsasən uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$A\\setminus B$"}, {"key": "2", "text": "$B\\cap C$"}, {"key": "3", "text": "$A\\cup C$"}], "right": [{"key": "a", "text": "$\\{2;7;9\\}$"}, {"key": "b", "text": "$\\{4;12\\}$"}, {"key": "c", "text": "$\\{2;4;6;7;9;12;13\\}$"}, {"key": "d", "text": "$(A\\cup B\\cup C)\\setminus\\{18;21\\}$"}, {"key": "e", "text": "$A\\setminus(A\\cap B)$"}]}'::jsonb, NULL, '{"1": ["a", "e"], "2": ["b"], "3": ["c", "d"]}'::jsonb, NULL,
  'Diaqramdan: $A=\{2;4;6;7;9\}$, $B=\{4;6;12;18;21\}$, $C=\{4;9;12;13\}$. 1) $A\setminus B=\{2;7;9\}$; həmçinin $A\setminus(A\cap B)=A\setminus B$. 2) $B\cap C=\{4;12\}$. 3) $A\cup C=\{2;4;6;7;9;12;13\}$ — bu, bütün elementlərdən yalnız $B$-yə aid olan $18$ və $21$-i çıxmaqla alınan çoxluqdur.',
  2025, 'I', 130, 29)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0012 | əsas: 2025 toplu, I hissə, səh.131 №32
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0012', '/images/tasks/CXL-0012.png', 'A və B çoxluqlarının Eyler–Venn diaqramı: yalnız A-da 4, 13, 21; ortaq hissədə 10, 16; yalnız B-də 7, 24, 17', (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqlar. Çoxluqların birləşməsi, kəsişməsi, fərqi'), 'original', 'own', 'az', 'draft', 'written',
  'Eyler–Venn diaqramına əsasən $A$ və $B$ çoxluqlarını yazın. $A$ və $B$ çoxluqlarının birləşməsinin elementlərinin ədədi ortasını tapın.',
  NULL, NULL, NULL, '14',
  '$A=\{4;10;13;16;21\}$, $B=\{7;10;16;17;24\}$. $A\cup B=\{4;7;10;13;16;17;21;24\}$ — $8$ element, cəmi $112$. Ədədi orta: $112:8=14$.',
  2025, 'I', 131, 32)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0013 | əsas: 2025 toplu, I hissə, səh.131 №33
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0013', '/images/tasks/CXL-0013.png', 'A və B çoxluqlarının Eyler–Venn diaqramı: yalnız A-da 5, 9, 20; ortaq hissədə 8; yalnız B-də 3, 15, 24', (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqlar. Çoxluqların birləşməsi, kəsişməsi, fərqi'), 'original', 'own', 'az', 'draft', 'written',
  'Eyler–Venn diaqramına əsasən $A$ və $B$ çoxluqlarını yazın. $A$ və $B$ çoxluqlarının birləşməsinin elementlərinin ədədi ortasını tapın.',
  NULL, NULL, NULL, '12',
  '$A=\{5;8;9;20\}$, $B=\{3;8;15;24\}$. $A\cup B=\{3;5;8;9;15;20;24\}$ — $7$ element, cəmi $84$. Ədədi orta: $84:7=12$.',
  2025, 'I', 131, 33)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0014 | əsas: 2025 toplu, I hissə, səh.131 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqların birləşməsi, kəsişməsi və fərqinin elementlərinin sayı'), 'original', 'own', 'az', 'draft', 'closed',
  '$A$ və $B$ çoxluqları üçün $n(A)=23$, $n(A\cap B)=9$ olarsa, $n(A\setminus B)$-ni tapın.',
  '[{"key": "A", "text": "$23$"}, {"key": "B", "text": "$15$"}, {"key": "C", "text": "$14$"}, {"key": "D", "text": "$32$"}, {"key": "E", "text": "$9$"}]'::jsonb, 'C', NULL, NULL,
  '$n(A\setminus B)=n(A)-n(A\cap B)=23-9=14$.',
  2025, 'I', 131, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0015 | əsas: 2025 toplu, I hissə, səh.131 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0015', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqların birləşməsi, kəsişməsi və fərqinin elementlərinin sayı'), 'original', 'own', 'az', 'draft', 'closed',
  '$M$ çoxluğu $100$ ədədinin natural bölənləri çoxluğudur. Bu çoxluğun elementləri sayını tapın.',
  '[{"key": "A", "text": "$9$"}, {"key": "B", "text": "$6$"}, {"key": "C", "text": "$10$"}, {"key": "D", "text": "$8$"}, {"key": "E", "text": "$12$"}]'::jsonb, 'A', NULL, NULL,
  '$100=2^2\cdot5^2$; bölənlərin sayı $(2+1)(2+1)=9$: $1,2,4,5,10,20,25,50,100$.',
  2025, 'I', 131, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0016 | əsas: 2025 toplu, I hissə, səh.131 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqların birləşməsi, kəsişməsi və fərqinin elementlərinin sayı'), 'original', 'own', 'az', 'draft', 'closed',
  '$A$ və $B$ çoxluqları üçün $n(A\cup B)=27$ və $A\cap B=\{2;4;6;8\}$ olarsa, $n(A\setminus B)+n(B\setminus A)$ cəmini tapın.',
  '[{"key": "A", "text": "$31$"}, {"key": "B", "text": "$27$"}, {"key": "C", "text": "$19$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$23$"}]'::jsonb, 'E', NULL, NULL,
  '$A\cup B$ üç kəsişməyən hissədən ibarətdir: $A\setminus B$, $B\setminus A$, $A\cap B$. Ona görə $n(A\setminus B)+n(B\setminus A)=27-4=23$.',
  2025, 'I', 131, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0017 | əsas: 2025 toplu, I hissə, səh.132 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqların birləşməsi, kəsişməsi və fərqinin elementlərinin sayı'), 'original', 'own', 'az', 'draft', 'closed',
  '$n(A\cap B)=7$ və $n(A\setminus B)=12$ olarsa, $n(A)$-nı tapın.',
  '[{"key": "A", "text": "$7$"}, {"key": "B", "text": "$26$"}, {"key": "C", "text": "$5$"}, {"key": "D", "text": "$12$"}, {"key": "E", "text": "$19$"}]'::jsonb, 'E', NULL, NULL,
  '$n(A)=n(A\setminus B)+n(A\cap B)=12+7=19$.',
  2025, 'I', 132, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0018 | əsas: 2025 toplu, I hissə, səh.132 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqların birləşməsi, kəsişməsi və fərqinin elementlərinin sayı'), 'original', 'own', 'az', 'draft', 'closed',
  '$n(A\cap B)=6$ və $n(B\setminus A)=9$ olarsa, $n(B)$-ni tapın.',
  '[{"key": "A", "text": "$3$"}, {"key": "B", "text": "$9$"}, {"key": "C", "text": "$6$"}, {"key": "D", "text": "$15$"}, {"key": "E", "text": "$21$"}]'::jsonb, 'D', NULL, NULL,
  '$n(B)=n(B\setminus A)+n(A\cap B)=9+6=15$.',
  2025, 'I', 132, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0019 | əsas: 2025 toplu, I hissə, səh.132 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqların birləşməsi, kəsişməsi və fərqinin elementlərinin sayı'), 'original', 'own', 'az', 'draft', 'closed',
  '$n(A\cup B)=30$, $n(A\setminus B)=11$, $n(A\cap B)=7$ olarsa, $n(B\setminus A)$-nı tapın.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$19$"}, {"key": "C", "text": "$12$"}, {"key": "D", "text": "$7$"}, {"key": "E", "text": "$18$"}]'::jsonb, 'C', NULL, NULL,
  '$n(B\setminus A)=n(A\cup B)-n(A\setminus B)-n(A\cap B)=30-11-7=12$.',
  2025, 'I', 132, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0020 | əsas: 2025 toplu, I hissə, səh.132 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqların birləşməsi, kəsişməsi və fərqinin elementlərinin sayı'), 'original', 'own', 'az', 'draft', 'closed',
  'Bir müəssisədəki bütün işçilərin $50\%$-i alman dilindən, $30\%$-i ingilis dilindən kursa gedir və $26\%$-i isə heç bir dildən kursa getmir. Hər iki dildən $12$ işçinin kursa getdiyi məlumdursa, yalnız ingilis dilindən neçə işçi kursa gedir?',
  '[{"key": "A", "text": "$48$"}, {"key": "B", "text": "$60$"}, {"key": "C", "text": "$36$"}, {"key": "D", "text": "$72$"}, {"key": "E", "text": "$54$"}]'::jsonb, 'A', NULL, NULL,
  'Ən azı bir dilə gedənlər $100\%-26\%=74\%$. $n(A\cup İ)=n(A)+n(İ)-n(A\cap İ)\Rightarrow74\%=50\%+30\%-x\Rightarrow x=6\%$. $6\%$ $12$ işçidirsə, cəmi $200$ işçi var. Yalnız ingilis: $30\%-6\%=24\%$, yəni $48$ işçi.',
  2025, 'I', 132, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0021 | əsas: 2025 toplu, I hissə, səh.132 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqların birləşməsi, kəsişməsi və fərqinin elementlərinin sayı'), 'original', 'own', 'az', 'draft', 'closed',
  '$A=\{n;\ n+1;\ n+2;\dots;\ n+14\}$ və $B=\{m;\ m+1;\ m+2;\dots;\ m+8\}$ çoxluqları üçün $n(A\cap B)=4$ olarsa, $n(A\cup B)$-ni tapın.',
  '[{"key": "A", "text": "$20$"}, {"key": "B", "text": "$21$"}, {"key": "C", "text": "$24$"}, {"key": "D", "text": "$16$"}, {"key": "E", "text": "$19$"}]'::jsonb, 'A', NULL, NULL,
  '$n(A)=15$, $n(B)=9$. $n(A\cup B)=15+9-4=20$.',
  2025, 'I', 132, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0022 | əsas: 2025 toplu, I hissə, səh.132 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqların birləşməsi, kəsişməsi və fərqinin elementlərinin sayı'), 'original', 'own', 'az', 'draft', 'written',
  'Bir sinfin müxtəlif dərnəklərdə iştirak edən şagirdlərinin sayı cədvəldə verilmişdir və bir şagird ən çoxu iki dərnəkdə iştirak edə bilər. Bu sinfin neçə şagirdi dərnəklərdə iştirak edir?

$$\begin{array}{|l|c|}\hline \text{Dərnəyin növü} & \text{say}\\\hline \text{musiqi} & 15\\\hline \text{idman} & 10\\\hline \text{şahmat} & 8\\\hline \text{həm musiqi, həm də idman} & 5\\\hline \text{həm idman, həm də şahmat} & 3\\\hline \text{həm musiqi, həm də şahmat} & 2\\\hline\end{array}$$',
  NULL, NULL, NULL, '23',
  'Hər şagird ən çoxu iki dərnəkdədirsə, üç dərnəyin kəsişməsi boşdur. $n=15+10+8-5-3-2=23$.',
  2025, 'I', 132, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0023 | əsas: 2025 toplu, I hissə, səh.132 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0023', '/images/tasks/CXL-0023.png', 'Sütunlu diaqram: A∩B — 3, A∪B — 12, B — 8 element', (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqların birləşməsi, kəsişməsi və fərqinin elementlərinin sayı'), 'original', 'own', 'az', 'draft', 'open',
  'Diaqrama əsasən $A$ çoxluğunun elementlərinin sayını tapın.',
  NULL, NULL, NULL, '7',
  'Diaqramdan: $n(A\cap B)=3$, $n(A\cup B)=12$, $n(B)=8$. $n(A\cup B)=n(A)+n(B)-n(A\cap B)\Rightarrow12=n(A)+8-3\Rightarrow n(A)=7$.',
  2025, 'I', 132, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0024 | əsas: 2025 toplu, I hissə, səh.132 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqların birləşməsi, kəsişməsi və fərqinin elementlərinin sayı'), 'original', 'own', 'az', 'draft', 'written',
  '$A,\ B,\ C$ bir-birindən fərqli çoxluqlardır və $A\subset B\subset C$, $n(A)+n(B)+n(C)=40$. $A$-nın ən çoxu neçə elementi ola bilər?',
  NULL, NULL, NULL, '12',
  'Çoxluqlar fərqli və $A\subset B\subset C$ olduğundan $n(B)\ge n(A)+1$, $n(C)\ge n(A)+2$. Onda $3n(A)+3\le40\Rightarrow n(A)\le12$. Məsələn, $12+13+15=40$ — mümkündür.',
  2025, 'I', 132, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0025 | əsas: 2025 toplu, I hissə, səh.132 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0025', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqların birləşməsi, kəsişməsi və fərqinin elementlərinin sayı'), 'original', 'own', 'az', 'draft', 'written',
  '$A,\ B,\ C$ çoxluqları üçün $n(A)=15$, $n(B)=150$, $n(C)=1500$ və $A\subset B\subset C$ olarsa, $n(B)+n(A\cap B)+n(A\cup C)$-ni tapın.',
  NULL, NULL, NULL, '1665',
  '$A\subset B$ olduğundan $A\cap B=A$, $n(A\cap B)=15$. $A\subset C$ olduğundan $A\cup C=C$, $n(A\cup C)=1500$. Cəm: $150+15+1500=1665$.',
  2025, 'I', 132, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0026 | əsas: 2025 toplu, I hissə, səh.132 №19
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqların birləşməsi, kəsişməsi və fərqinin elementlərinin sayı'), 'original', 'own', 'az', 'draft', 'written',
  '$A$ və $B$ çoxluqları üçün $n(A\setminus B)=9$, $n(B\setminus A)=6$, $n(A\cup B)=25$ olarsa, $n(A)+n(B)+n(A\cap B)$-ni tapın.',
  NULL, NULL, NULL, '45',
  '$n(A\cap B)=25-9-6=10$. $n(A)=19$, $n(B)=16$. Cəm: $19+16+10=45$.',
  2025, 'I', 132, 19)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0027 | əsas: 2025 toplu, I hissə, səh.132 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0027', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqların birləşməsi, kəsişməsi və fərqinin elementlərinin sayı'), 'original', 'own', 'az', 'draft', 'written',
  'Kəsişməsi boş ***olmayan*** $A$ və $B$ çoxluqları üçün $n(B)=23$ olarsa, $B\setminus A$ çoxluğunun ən çoxu neçə elementi olar?',
  NULL, NULL, NULL, '22',
  '$A\cap B\ne\varnothing$, yəni $n(A\cap B)\ge1$. $n(B\setminus A)=n(B)-n(A\cap B)\le23-1=22$.',
  2025, 'I', 132, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0028 | əsas: 2025 toplu, I hissə, səh.132 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0028', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqların birləşməsi, kəsişməsi və fərqinin elementlərinin sayı'), 'original', 'own', 'az', 'draft', 'written',
  'Kəsişməsi boş ***olmayan*** $A$ və $B$ çoxluqları üçün $n(A)=13$ olarsa, $A\setminus B$ çoxluğunun ən çoxu neçə elementi olar?',
  NULL, NULL, NULL, '12',
  '$n(A\setminus B)=n(A)-n(A\cap B)\le13-1=12$.',
  2025, 'I', 132, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0029 | əsas: 2025 toplu, I hissə, səh.132 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0029', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqların birləşməsi, kəsişməsi və fərqinin elementlərinin sayı'), 'original', 'own', 'az', 'draft', 'written',
  '$A$ və $B$ çoxluqları üçün $A\cap B=\{3;6;9;12\}$, $n(A\cup B)=14$, $n(A)-n(B)=4$ olarsa, $n(A)$-nı tapın.',
  NULL, NULL, NULL, '11',
  '$n(A)+n(B)=n(A\cup B)+n(A\cap B)=14+4=18$. $n(A)-n(B)=4$ ilə birlikdə: $n(A)=11$.',
  2025, 'I', 132, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXL-0030 | əsas: 2025 toplu, I hissə, səh.132 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXL-0030', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxluqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxluqlar' AND s.title='Çoxluqların birləşməsi, kəsişməsi və fərqinin elementlərinin sayı'), 'original', 'own', 'az', 'draft', 'written',
  '$A$ və $B$ çoxluqları üçün $A\cap B=\{2;5\}$, $n(A\cup B)=11$, $n(A)-n(B)=3$ olarsa, $n(A)$-nı tapın.',
  NULL, NULL, NULL, '8',
  '$n(A)+n(B)=11+2=13$, $n(A)-n(B)=3\Rightarrow n(A)=8$.',
  2025, 'I', 132, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
