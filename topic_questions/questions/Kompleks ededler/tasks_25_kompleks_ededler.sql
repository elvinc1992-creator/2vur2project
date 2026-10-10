-- Mövzu: Kompleks ədədlər — 24 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- KMP-0001 | əsas: 2025 toplu, II hissə, səh.165 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$4-7i$ ədədinə qoşma olan ədədi tapın.',
  '[{"key": "A", "text": "$-4+7i$"}, {"key": "B", "text": "$7-4i$"}, {"key": "C", "text": "$7+4i$"}, {"key": "D", "text": "$4+7i$"}, {"key": "E", "text": "$-4-7i$"}]'::jsonb, 'D', NULL, NULL,
  '$a+bi$ ədədinin qoşması $a-bi$-dir: $\overline{4-7i}=4+7i$.',
  2025, 'II', 165, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KMP-0002 | əsas: 2025 toplu, II hissə, səh.165 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$-5+2i$ ədədinə qoşma olan ədədi tapın.',
  '[{"key": "A", "text": "$2-5i$"}, {"key": "B", "text": "$-5-2i$"}, {"key": "C", "text": "$-2+5i$"}, {"key": "D", "text": "$5+2i$"}, {"key": "E", "text": "$5-2i$"}]'::jsonb, 'B', NULL, NULL,
  '$\overline{-5+2i}=-5-2i$.',
  2025, 'II', 165, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KMP-0003 | əsas: 2025 toplu, II hissə, səh.165 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$(4+7i)(4-7i)$ hasilini tapın.',
  '[{"key": "A", "text": "$11$"}, {"key": "B", "text": "$-33$"}, {"key": "C", "text": "$33$"}, {"key": "D", "text": "$16$"}, {"key": "E", "text": "$65$"}]'::jsonb, 'E', NULL, NULL,
  '$(a+bi)(a-bi)=a^2+b^2=16+49=65$.',
  2025, 'II', 165, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KMP-0004 | əsas: 2025 toplu, II hissə, səh.165 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$(6+5i)(6-5i)$ hasilini tapın.',
  '[{"key": "A", "text": "$12$"}, {"key": "B", "text": "$-11$"}, {"key": "C", "text": "$61$"}, {"key": "D", "text": "$11$"}, {"key": "E", "text": "$36$"}]'::jsonb, 'C', NULL, NULL,
  '$36+25=61$.',
  2025, 'II', 165, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KMP-0005 | əsas: 2025 toplu, II hissə, səh.165 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$5-2i+(2+i)(2-i)$ ifadəsini cəbri şəkildə göstərin.',
  '[{"key": "A", "text": "$8-2i$"}, {"key": "B", "text": "$10+2i$"}, {"key": "C", "text": "$10-2i$"}, {"key": "D", "text": "$9-2i$"}, {"key": "E", "text": "$5+3i$"}]'::jsonb, 'C', NULL, NULL,
  '$(2+i)(2-i)=4+1=5$. $5-2i+5=10-2i$.',
  2025, 'II', 165, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KMP-0006 | əsas: 2025 toplu, II hissə, səh.165 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$(3-i)(3+i)+4i$ ifadəsini cəbri şəkildə göstərin.',
  '[{"key": "A", "text": "$10+4i$"}, {"key": "B", "text": "$10-4i$"}, {"key": "C", "text": "$8+4i$"}, {"key": "D", "text": "$4i$"}, {"key": "E", "text": "$9+4i$"}]'::jsonb, 'A', NULL, NULL,
  '$(3-i)(3+i)=9+1=10$. Cavab: $10+4i$.',
  2025, 'II', 165, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KMP-0007 | əsas: 2025 toplu, II hissə, səh.165 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0007', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$z_1=2-5i$ və $z_2=3+i$ kompleks ədədlərinin hasilini tapın ($i$ – xəyali vahiddir).',
  '[{"key": "A", "text": "$-13+11i$"}, {"key": "B", "text": "$11-13i$"}, {"key": "C", "text": "$1-13i$"}, {"key": "D", "text": "$6-5i$"}, {"key": "E", "text": "$11+13i$"}]'::jsonb, 'B', NULL, NULL,
  '$(2-5i)(3+i)=6+2i-15i-5i^2=6-13i+5=11-13i$.',
  2025, 'II', 165, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KMP-0008 | əsas: 2025 toplu, II hissə, səh.165 №18
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$z_1=2+i$ və $z_2=1+4i$ kompleks ədədlərinin hasilini tapın.',
  '[{"key": "A", "text": "$-2+7i$"}, {"key": "B", "text": "$-2+9i$"}, {"key": "C", "text": "$6-2i$"}, {"key": "D", "text": "$2+4i$"}, {"key": "E", "text": "$2+9i$"}]'::jsonb, 'B', NULL, NULL,
  '$(2+i)(1+4i)=2+8i+i+4i^2=-2+9i$.',
  2025, 'II', 165, 18)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KMP-0009 | əsas: 2025 toplu, II hissə, səh.165 №19
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$z_1=4+\dfrac13i$ və $z_2=3-\dfrac12i$ kompleks ədədlərinin hasilini tapın.',
  '[{"key": "A", "text": "$\\dfrac{73}{6}-i$"}, {"key": "B", "text": "$\\dfrac{71}{6}-i$"}, {"key": "C", "text": "$12- \\dfrac{1}{6}i$"}, {"key": "D", "text": "$\\dfrac{73}{6}+i$"}, {"key": "E", "text": "$12-i$"}]'::jsonb, 'A', NULL, NULL,
  '$12-2i+i-\dfrac16i^2=12+\dfrac16-i=\dfrac{73}{6}-i$.',
  2025, 'II', 165, 19)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KMP-0010 | əsas: 2025 toplu, II hissə, səh.165 №20
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$z_1=2+i$, $z_2=-3+6i$ kompleks ədədləri üçün $z_1\cdot z_2$ hasilini tapın.',
  '[{"key": "A", "text": "$9i$"}, {"key": "B", "text": "$-12+15i$"}, {"key": "C", "text": "$-12+9i$"}, {"key": "D", "text": "$-15i$"}, {"key": "E", "text": "$-6+6i$"}]'::jsonb, 'C', NULL, NULL,
  '$-6+12i-3i+6i^2=-12+9i$.',
  2025, 'II', 165, 20)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KMP-0011 | əsas: 2025 toplu, II hissə, səh.165 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0011', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$z=6+3i$ olarsa, $\bar z\cdot z$ hasilini tapın ($\bar z$ – $z$ kompleks ədədinin qoşmasıdır).',
  '[{"key": "A", "text": "$27$"}, {"key": "B", "text": "$36$"}, {"key": "C", "text": "$6+3i$"}, {"key": "D", "text": "$81$"}, {"key": "E", "text": "$45$"}]'::jsonb, 'E', NULL, NULL,
  '$z\bar z=a^2+b^2=36+9=45$.',
  2025, 'II', 165, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KMP-0012 | əsas: 2025 toplu, II hissə, səh.165 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0012', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$z=5-2i$ olarsa, $z\cdot\bar z$ hasilini tapın ($\bar z$ – $z$ kompleks ədədinin qoşmasıdır).',
  '[{"key": "A", "text": "$23$"}, {"key": "B", "text": "$21$"}, {"key": "C", "text": "$25$"}, {"key": "D", "text": "$29$"}, {"key": "E", "text": "$5+2i$"}]'::jsonb, 'D', NULL, NULL,
  '$25+4=29$.',
  2025, 'II', 165, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KMP-0013 | əsas: 2025 toplu, II hissə, səh.166 №35
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{4-3i}{1+2i}$ ifadəsini cəbri şəkildə göstərin ($i$ – xəyali vahiddir).',
  '[{"key": "A", "text": "$\\dfrac{10}{3}- \\dfrac{11}{3}i$"}, {"key": "B", "text": "$\\dfrac{2}{5}+\\dfrac{11}{5}i$"}, {"key": "C", "text": "$4- \\dfrac{3}{2}i$"}, {"key": "D", "text": "$- \\dfrac{2}{5}- \\dfrac{11}{5}i$"}, {"key": "E", "text": "$-2-11i$"}]'::jsonb, 'D', NULL, NULL,
  'Surət və məxrəci $1-2i$-yə vuraq: $\dfrac{(4-3i)(1-2i)}{1+4}=\dfrac{4-8i-3i-6}{5}=-\dfrac25-\dfrac{11}{5}i$.',
  2025, 'II', 166, 35)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KMP-0014 | əsas: 2025 toplu, II hissə, səh.166 №36
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{7+i}{1+i}$ ifadəsini cəbri şəkildə göstərin ($i$ – xəyali vahiddir).',
  '[{"key": "A", "text": "$7$"}, {"key": "B", "text": "$4+3i$"}, {"key": "C", "text": "$3+4i$"}, {"key": "D", "text": "$4-3i$"}, {"key": "E", "text": "$3-4i$"}]'::jsonb, 'D', NULL, NULL,
  '$\dfrac{(7+i)(1-i)}{2}=\dfrac{7-7i+i+1}{2}=4-3i$.',
  2025, 'II', 166, 36)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KMP-0015 | əsas: 2025 toplu, II hissə, səh.166 №37
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0015', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$(1-2i)^3+(3+i)^2$ ifadəsini cəbri şəkildə göstərin.',
  '[{"key": "A", "text": "$19+8i$"}, {"key": "B", "text": "$8+6i$"}, {"key": "C", "text": "$-3-4i$"}, {"key": "D", "text": "$-11+2i$"}, {"key": "E", "text": "$-3+8i$"}]'::jsonb, 'E', NULL, NULL,
  '$(1-2i)^3=1-6i+12i^2-8i^3=1-6i-12+8i=-11+2i$; $(3+i)^2=8+6i$. Cəmi $-3+8i$.',
  2025, 'II', 166, 37)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KMP-0016 | əsas: 2025 toplu, II hissə, səh.166 №38
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$(3-i)^3+(i+2)^2$ ifadəsini cəbri şəkildə göstərin.',
  '[{"key": "A", "text": "$21+22i$"}, {"key": "B", "text": "$15-22i$"}, {"key": "C", "text": "$21-26i$"}, {"key": "D", "text": "$24-30i$"}, {"key": "E", "text": "$21-22i$"}]'::jsonb, 'E', NULL, NULL,
  '$(3-i)^3=27-27i+9i^2-i^3=18-26i$; $(i+2)^2=3+4i$. Cəmi $21-22i$.',
  2025, 'II', 166, 38)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KMP-0017 | əsas: 2025 toplu, II hissə, səh.166 №39
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Hansı şərt ödəndikdə $a_1+b_1i$ və $a_2+b_2i$ kompleks ədədlərinin fərqi həqiqi ədəddir?',
  '[{"key": "A", "text": "$a_1=a_2$"}, {"key": "B", "text": "$a_1=a_2;\\ b_1\\ne b_2$"}, {"key": "C", "text": "$b_1=b_2$"}, {"key": "D", "text": "$a_1=-a_2$"}, {"key": "E", "text": "$b_1=-b_2$"}]'::jsonb, 'C', NULL, NULL,
  '$(a_1-a_2)+(b_1-b_2)i$ fərqinin həqiqi olması üçün xəyali hissə sıfır olmalıdır: $b_1=b_2$.',
  2025, 'II', 166, 39)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KMP-0018 | əsas: 2025 toplu, II hissə, səh.166 №40
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Hansı şərt ödəndikdə $a_1+b_1i$ və $a_2+b_2i$ kompleks ədədlərinin cəmi sırf xəyali ədəddir?',
  '[{"key": "A", "text": "$a_1=-a_2;\\ b_1\\ne-b_2$"}, {"key": "B", "text": "$a_1=-a_2;\\ b_1=-b_2$"}, {"key": "C", "text": "$b_1=-b_2$"}, {"key": "D", "text": "$a_1\\ne a_2;\\ b_1=b_2$"}, {"key": "E", "text": "$a_1=a_2;\\ b_1\\ne b_2$"}]'::jsonb, 'A', NULL, NULL,
  'Cəm $(a_1+a_2)+(b_1+b_2)i$. Sırf xəyali olması üçün $a_1+a_2=0$, $b_1+b_2\ne0$.',
  2025, 'II', 166, 40)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KMP-0019 | əsas: 2025 toplu, II hissə, səh.166 №48
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{7+3i}{1-i}$ kompleks ədədini cəbri şəkildə göstərin.',
  '[{"key": "A", "text": "$2+5i$"}, {"key": "B", "text": "$5+2i$"}, {"key": "C", "text": "$2-5i$"}, {"key": "D", "text": "$5-2i$"}, {"key": "E", "text": "$3{,}5+1{,}5i$"}]'::jsonb, 'A', NULL, NULL,
  '$\dfrac{(7+3i)(1+i)}{2}=\dfrac{7+7i+3i-3}{2}=2+5i$.',
  2025, 'II', 166, 48)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KMP-0020 | əsas: 2025 toplu, II hissə, səh.166 №49
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{3+i}{1+i}$ kompleks ədədini cəbri şəkildə göstərin.',
  '[{"key": "A", "text": "$2-i$"}, {"key": "B", "text": "$3-i$"}, {"key": "C", "text": "$2+i$"}, {"key": "D", "text": "$-1+2i$"}, {"key": "E", "text": "$1-2i$"}]'::jsonb, 'A', NULL, NULL,
  '$\dfrac{(3+i)(1-i)}{2}=\dfrac{3-3i+i+1}{2}=2-i$.',
  2025, 'II', 166, 49)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KMP-0021 | əsas: 2025 toplu, II hissə, səh.167 №66
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$x$ və $y$ həqiqi ədədlərinin hansı qiymətlərində $z_1=x+1-2yi^5$ və $z_2=5-x+y+(x+3)i^7$ ədədləri qoşma kompleks ədədlər olar?',
  '[{"key": "A", "text": "$x=-2,\\ y=-1$"}, {"key": "B", "text": "$x=1,\\ y=-2$"}, {"key": "C", "text": "$x=1,\\ y=2$"}, {"key": "D", "text": "$x=2,\\ y=-1$"}, {"key": "E", "text": "$x=-1,\\ y=2$"}]'::jsonb, 'B', NULL, NULL,
  '$i^5=i$, $i^7=-i$: $z_1=(x+1)-2yi$, $z_2=(5-x+y)-(x+3)i$. Qoşma olması üçün həqiqi hissələr bərabər, xəyali hissələr əks olmalıdır: $\begin{cases}x+1=5-x+y\\-2y=x+3\end{cases}\Rightarrow\begin{cases}y=2x-4\\-4x+8=x+3\end{cases}\Rightarrow x=1,\ y=-2$.',
  2025, 'II', 167, 66)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KMP-0022 | əsas: 2025 toplu, II hissə, səh.167 №70
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'written',
  '$(1+i)^9\cdot(1-i)^9$ hasilini hesablayın.',
  NULL, NULL, NULL, '512',
  '$(1+i)(1-i)=2$, ona görə hasil $2^9=512$.',
  2025, 'II', 167, 70)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KMP-0023 | əsas: 2025 toplu, II hissə, səh.167 №71
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'written',
  '$(1+i)^6(1-i)^6$ hasilini hesablayın.',
  NULL, NULL, NULL, '64',
  '$\big((1+i)(1-i)\big)^6=2^6=64$.',
  2025, 'II', 167, 71)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KMP-0024 | əsas: 2025 toplu, II hissə, səh.169 №111
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KMP-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Kompleks ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kompleks ədədlər' AND s.title='Kompleks ədədlər'), 'original', 'own', 'az', 'draft', 'written',
  '$x$ və $y$ həqiqi ədədlərinin hansı qiymətlərində $z_1=(4+y-x)-(x+1)i$ və $z_2=(2x-6)+4yi^3$ ədədləri qoşma kompleks ədədlər olar? (Cavabı $x;y$ şəklində yazın.)',
  NULL, NULL, NULL, '3;-1',
  '$i^3=-i$: $z_2=(2x-6)-4yi$. Qoşmalıq şərti: $\begin{cases}4+y-x=2x-6\\-(x+1)=4y\end{cases}\Rightarrow y=3x-10,\ -x-1=12x-40\Rightarrow x=3,\ y=-1$.',
  2025, 'II', 169, 111)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
