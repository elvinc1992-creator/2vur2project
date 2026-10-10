-- Mövzu: Loqarifm, üstlü tənlik/bərabərsizlik — 87 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- LOQ-0001 | əsas: 2025 toplu, II hissə, səh.83 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü funksiya və onun xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=7^{\sqrt{3-x}}$ funksiyasının təyin oblastını tapın.',
  '[{"key": "A", "text": "$(-\\infty;\\ +\\infty)$"}, {"key": "B", "text": "$[3;\\ +\\infty)$"}, {"key": "C", "text": "$(-\\infty;\\ 3]$"}, {"key": "D", "text": "$[-3;\\ 3]$"}, {"key": "E", "text": "$(0;\\ +\\infty)$"}]'::jsonb, 'C', NULL, NULL,
  'Üstlü funksiya hər yerdə təyin olunub, şərt yalnız kökaltı ifadəyədir: $3-x\ge0\Rightarrow x\le3$.',
  2025, 'II', 83, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0002 | əsas: 2025 toplu, II hissə, səh.83 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü funksiya və onun xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=3^{\sqrt{7-x^2}}$ funksiyasının təyin oblastını tapın.',
  '[{"key": "A", "text": "$\\left[-\\sqrt7;\\ \\sqrt7\\right]$"}, {"key": "B", "text": "$[-7;\\ 7]$"}, {"key": "C", "text": "$\\left[\\sqrt7;\\ +\\infty\\right)$"}, {"key": "D", "text": "$\\left(-\\infty;\\ \\sqrt7\\right]$"}, {"key": "E", "text": "$(-\\infty;\\ 7]$"}]'::jsonb, 'A', NULL, NULL,
  '$7-x^2\ge0\Rightarrow x^2\le7\Rightarrow-\sqrt7\le x\le\sqrt7$.',
  2025, 'II', 83, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0003 | əsas: 2025 toplu, II hissə, səh.87 №29
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'open',
  '$2\log_3\left(3\sqrt3\right)$ ifadəsinin qiymətini hesablayın.',
  NULL, NULL, NULL, '3',
  '$3\sqrt3=3^{1{,}5}$; $2\cdot1{,}5=3$.',
  2025, 'II', 87, 29)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0004 | əsas: 2025 toplu, II hissə, səh.87 №30
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'open',
  '$6\log_2\left(4\sqrt2\right)$ ifadəsinin qiymətini hesablayın.',
  NULL, NULL, NULL, '15',
  '$4\sqrt2=2^{2{,}5}$; $6\cdot2{,}5=15$.',
  2025, 'II', 87, 30)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0005 | əsas: 2025 toplu, II hissə, səh.88 №45
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$6\lg2+2\lg125$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$3$"}, {"key": "B", "text": "$5$"}, {"key": "C", "text": "$6$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$8$"}]'::jsonb, 'C', NULL, NULL,
  '$6\lg2+2\lg125=\lg2^6+\lg125^2=\lg(64\cdot15625)=\lg10^6=6$.',
  2025, 'II', 88, 45)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0006 | əsas: 2025 toplu, II hissə, səh.88 №49
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_2\left(\log_3\left(\log_2512\right)\right)$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$1$"}, {"key": "B", "text": "$0$"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$0{,}5$"}]'::jsonb, 'A', NULL, NULL,
  '$\log_2512=9$, $\log_39=2$, $\log_22=1$.',
  2025, 'II', 88, 49)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0007 | əsas: 2025 toplu, II hissə, səh.88 №50
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0007', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_4\left(\log_3\left(\log_2512\right)\right)$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$0$"}, {"key": "B", "text": "$1$"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$0{,}25$"}, {"key": "E", "text": "$0{,}5$"}]'::jsonb, 'E', NULL, NULL,
  '$\log_2512=9$, $\log_39=2$, $\log_42=\dfrac12$.',
  2025, 'II', 88, 50)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0008 | əsas: 2025 toplu, II hissə, səh.88 №51
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_{27}45-\log_{27}5$ ifadəsinin qiymətini tapın.',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "$\\dfrac{2}{3}$"}, {"key": "C", "text": "$\\dfrac{3}{2}$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$\\dfrac{1}{3}$"}]'::jsonb, 'B', NULL, NULL,
  '$\log_{27}\dfrac{45}{5}=\log_{27}9=\dfrac{\log_39}{\log_327}=\dfrac23$.',
  2025, 'II', 88, 51)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0009 | əsas: 2025 toplu, II hissə, səh.88 №52
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_{16}40-\log_{16}5$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$\\dfrac{3}{4}$"}, {"key": "B", "text": "$2$"}, {"key": "C", "text": "$\\dfrac{4}{3}$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$\\dfrac{1}{2}$"}]'::jsonb, 'A', NULL, NULL,
  '$\log_{16}8=\dfrac{\log_28}{\log_216}=\dfrac34$.',
  2025, 'II', 88, 52)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0010 | əsas: 2025 toplu, II hissə, səh.88 №53
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_4\left(8\log_24\right)$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$1$"}, {"key": "B", "text": "$2$"}, {"key": "C", "text": "$4$"}, {"key": "D", "text": "$0{,}5$"}, {"key": "E", "text": "$3$"}]'::jsonb, 'B', NULL, NULL,
  '$\log_24=2$; $\log_416=2$.',
  2025, 'II', 88, 53)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0011 | əsas: 2025 toplu, II hissə, səh.88 №54
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0011', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_8\left(4\log_39\right)$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$0{,}5$"}, {"key": "B", "text": "$3$"}, {"key": "C", "text": "$1$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$\\dfrac{1}{3}$"}]'::jsonb, 'C', NULL, NULL,
  '$\log_39=2$; $\log_88=1$.',
  2025, 'II', 88, 54)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0012 | əsas: 2025 toplu, II hissə, səh.89 №65
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0012', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$4^{0{,}5-\frac12\log_49}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$6$"}, {"key": "B", "text": "$\\dfrac{3}{2}$"}, {"key": "C", "text": "$\\dfrac{4}{9}$"}, {"key": "D", "text": "$\\dfrac{2}{3}$"}, {"key": "E", "text": "$\\dfrac{9}{4}$"}]'::jsonb, 'D', NULL, NULL,
  '$4^{0{,}5}=2$, $4^{-\frac12\log_49}=9^{-\frac12}=\dfrac13$. Hasil $\dfrac23$.',
  2025, 'II', 89, 65)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0013 | əsas: 2025 toplu, II hissə, səh.89 №66
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$4^{1{,}5-\frac13\log_48}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$1$"}, {"key": "B", "text": "$2$"}, {"key": "C", "text": "$8$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$16$"}]'::jsonb, 'D', NULL, NULL,
  '$4^{1{,}5}=8$, $4^{-\frac13\log_48}=8^{-\frac13}=\dfrac12$. Hasil $4$.',
  2025, 'II', 89, 66)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0014 | əsas: 2025 toplu, II hissə, səh.89 №74
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_{32}5=m$ və $\log_58=n$ olarsa, $m\cdot n$ hasilini tapın.',
  '[{"key": "A", "text": "$\\dfrac{3}{5}$"}, {"key": "B", "text": "$\\dfrac{1}{5}$"}, {"key": "C", "text": "$\\dfrac{2}{5}$"}, {"key": "D", "text": "$\\dfrac{5}{3}$"}, {"key": "E", "text": "$1$"}]'::jsonb, 'A', NULL, NULL,
  '$mn=\log_{32}5\cdot\log_58=\log_{32}8=\dfrac{\log_28}{\log_232}=\dfrac35$.',
  2025, 'II', 89, 74)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0015 | əsas: 2025 toplu, II hissə, səh.89 №75
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0015', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_95=a$ və $\log_527=b$ olarsa, $a\cdot b$ hasilini tapın.',
  '[{"key": "A", "text": "$1$"}, {"key": "B", "text": "$\\dfrac{3}{2}$"}, {"key": "C", "text": "$\\dfrac{1}{2}$"}, {"key": "D", "text": "$\\dfrac{2}{3}$"}, {"key": "E", "text": "$3$"}]'::jsonb, 'B', NULL, NULL,
  '$ab=\log_927=\dfrac{\log_327}{\log_39}=\dfrac32$.',
  2025, 'II', 89, 75)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0016 | əsas: 2025 toplu, II hissə, səh.89 №77
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{3\lg b}{\lg a}+\dfrac{1}{\log_ba}-\log_ab^2$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$0$"}, {"key": "B", "text": "$-\\log_ab$"}, {"key": "C", "text": "$\\log_ab$"}, {"key": "D", "text": "$2\\log_ab$"}, {"key": "E", "text": "$6\\log_ab$"}]'::jsonb, 'D', NULL, NULL,
  '$\dfrac{\lg b}{\lg a}=\log_ab$, $\dfrac{1}{\log_ba}=\log_ab$, $\log_ab^2=2\log_ab$. İfadə: $3\log_ab+\log_ab-2\log_ab=2\log_ab$.',
  2025, 'II', 89, 77)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0017 | əsas: 2025 toplu, II hissə, səh.89 №78
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{4}{\log_ab}-\log_ba^3+\dfrac{\log_5a}{\log_5b}$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$8\\log_ba$"}, {"key": "B", "text": "$0$"}, {"key": "C", "text": "$-\\log_ba$"}, {"key": "D", "text": "$2\\log_ba$"}, {"key": "E", "text": "$\\log_ba$"}]'::jsonb, 'D', NULL, NULL,
  '$\dfrac{1}{\log_ab}=\log_ba$, $\log_ba^3=3\log_ba$, $\dfrac{\log_5a}{\log_5b}=\log_ba$. İfadə: $4\log_ba-3\log_ba+\log_ba=2\log_ba$.',
  2025, 'II', 89, 78)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0018 | əsas: 2025 toplu, II hissə, səh.90 №84
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'open',
  '$\dfrac{1}{\log_86}+\dfrac{1}{\log_{27}6}$ ifadəsinin qiymətini hesablayın.',
  NULL, NULL, NULL, '3',
  '$\dfrac{1}{\log_86}=\log_68$; cəm $\log_68+\log_627=\log_6216=3$.',
  2025, 'II', 90, 84)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0019 | əsas: 2025 toplu, II hissə, səh.90 №85
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'open',
  '$\dfrac{1}{\log_510}+\dfrac{1}{\log_{20}10}$ ifadəsinin qiymətini hesablayın.',
  NULL, NULL, NULL, '2',
  '$\log_{10}5+\log_{10}20=\lg100=2$.',
  2025, 'II', 90, 85)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0020 | əsas: 2025 toplu, II hissə, səh.90 №91
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$x=\sqrt{5\sqrt[3]{5}}$ və $y=\sqrt[4]{25\sqrt5}$ olarsa, $\log_xy$-i tapın.',
  '[{"key": "A", "text": "$\\dfrac{5}{8}$"}, {"key": "B", "text": "$\\dfrac{16}{15}$"}, {"key": "C", "text": "$\\dfrac{3}{4}$"}, {"key": "D", "text": "$\\dfrac{2}{3}$"}, {"key": "E", "text": "$\\dfrac{15}{16}$"}]'::jsonb, 'E', NULL, NULL,
  '$x=5^{\frac12\cdot\frac43}=5^{\frac23}$, $y=5^{\frac14\cdot\frac52}=5^{\frac58}$. $\log_xy=\dfrac{5/8}{2/3}=\dfrac{15}{16}$.',
  2025, 'II', 90, 91)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0021 | əsas: 2025 toplu, II hissə, səh.90 №92
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$x=\sqrt[3]{2\sqrt2}$ və $y=\sqrt{8\sqrt[3]{2}}$ olarsa, $\log_xy$-i tapın.',
  '[{"key": "A", "text": "$\\dfrac{1}{2}$"}, {"key": "B", "text": "$\\dfrac{5}{3}$"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$\\dfrac{3}{10}$"}, {"key": "E", "text": "$\\dfrac{10}{3}$"}]'::jsonb, 'E', NULL, NULL,
  '$x=2^{\frac13\cdot\frac32}=2^{\frac12}$, $y=2^{\frac12\cdot\frac{10}{3}}=2^{\frac53}$. $\log_xy=\dfrac{5/3}{1/2}=\dfrac{10}{3}$.',
  2025, 'II', 90, 92)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0022 | əsas: 2025 toplu, II hissə, səh.90 №96
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$a=\log_{0{,}2}0{,}04$ və $b=\log_{\frac12}\dfrac15$ ədədləri arasındakı münasibətlərdən hansı doğrudur?',
  '[{"key": "A", "text": "$a=\\dfrac12b$"}, {"key": "B", "text": "$a>b$"}, {"key": "C", "text": "$a=b$"}, {"key": "D", "text": "$a=2b$"}, {"key": "E", "text": "$a<b$"}]'::jsonb, 'E', NULL, NULL,
  '$a=\log_{0{,}2}0{,}2^2=2$. $b=\log_25$, $4<5<8\Rightarrow2<b<3$. Deməli $a<b$.',
  2025, 'II', 90, 96)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0023 | əsas: 2025 toplu, II hissə, səh.90 №97
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$a=\log_{0{,}5}0{,}125$ və $b=\log_{\frac12}\dfrac17$ ədədləri arasındakı münasibətlərdən hansı doğrudur?',
  '[{"key": "A", "text": "$a>b$"}, {"key": "B", "text": "$a=\\dfrac12b$"}, {"key": "C", "text": "$a<b$"}, {"key": "D", "text": "$a=b$"}, {"key": "E", "text": "$a=3b$"}]'::jsonb, 'A', NULL, NULL,
  '$a=\log_{0{,}5}0{,}5^3=3$. $b=\log_27<\log_28=3$. Deməli $a>b$.',
  2025, 'II', 90, 97)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0024 | əsas: 2025 toplu, II hissə, səh.92 №125
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_2\log_2\left(2\sqrt[4]{2\sqrt[4]{2}}\right)$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$\\log_221$"}, {"key": "B", "text": "$\\log_221-4$"}, {"key": "C", "text": "$4$"}, {"key": "D", "text": "$\\log_221+4$"}, {"key": "E", "text": "$\\log_25-2$"}]'::jsonb, 'B', NULL, NULL,
  '$2\sqrt[4]{2\cdot2^{\frac14}}=2^{1+\frac14\cdot\frac54}=2^{\frac{21}{16}}$. $\log_2\dfrac{21}{16}=\log_221-4$.',
  2025, 'II', 92, 125)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0025 | əsas: 2025 toplu, II hissə, səh.92 №126
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0025', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_3\log_3\left(3\sqrt[9]{3\sqrt[3]{3}}\right)$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$3$"}, {"key": "B", "text": "$\\log_331$"}, {"key": "C", "text": "$\\log_313-3$"}, {"key": "D", "text": "$\\log_331-2$"}, {"key": "E", "text": "$\\log_331-3$"}]'::jsonb, 'E', NULL, NULL,
  '$3\cdot\left(3^{\frac43}\right)^{\frac19}=3^{1+\frac{4}{27}}=3^{\frac{31}{27}}$. $\log_3\dfrac{31}{27}=\log_331-3$.',
  2025, 'II', 92, 126)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0026 | əsas: 2025 toplu, II hissə, səh.92 №135
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'open',
  '$\log_69-\dfrac{1}{\log_46}+\log_616$ ifadəsinin qiymətini tapın.',
  NULL, NULL, NULL, '2',
  '$\dfrac{1}{\log_46}=\log_64$. İfadə: $\log_6\dfrac{9\cdot16}{4}=\log_636=2$.',
  2025, 'II', 92, 135)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0027 | əsas: 2025 toplu, II hissə, səh.95 №209
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0027', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'written',
  '$\left(2^{\frac{\log_{100}2}{\lg2}}\cdot7^{\frac{\log_{100}7}{\lg7}}\right)^{2\log_{14}9}$ ifadəsinin qiymətini hesablayın.',
  NULL, NULL, NULL, '9',
  '$\log_{100}a=\dfrac{\lg a}{2}$, ona görə hər üst $\dfrac12$-dir: $\left(\sqrt2\cdot\sqrt7\right)^{2\log_{14}9}=14^{\log_{14}9}=9$.',
  2025, 'II', 95, 209)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0028 | əsas: 2025 toplu, II hissə, səh.95 №210
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0028', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'written',
  '$\left(3^{\frac{\log_{100}3}{\lg3}}\cdot4^{\frac{\log_{100}4}{\lg4}}\right)^{4\log_{12}2}$ ifadəsinin qiymətini hesablayın.',
  NULL, NULL, NULL, '4',
  'Mötərizədə $\sqrt3\cdot\sqrt4=\sqrt{12}$. $\left(12^{\frac12}\right)^{4\log_{12}2}=12^{2\log_{12}2}=4$.',
  2025, 'II', 95, 210)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0029 | əsas: 2025 toplu, II hissə, səh.95 №213
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0029', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'written',
  '$\dfrac{\log_540\cdot\log_840}{\log_58+\log_85+2}$ ifadəsinin qiymətini tapın.',
  NULL, NULL, NULL, '1',
  '$t=\log_58$. $\log_540=1+t$, $\log_840=1+\dfrac1t$. Surət $\dfrac{(1+t)^2}{t}$, məxrəc $t+\dfrac1t+2=\dfrac{(1+t)^2}{t}$. Nəticə $1$.',
  2025, 'II', 95, 213)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0030 | əsas: 2025 toplu, II hissə, səh.95 №214
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0030', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'written',
  '$\dfrac{2\log_218\cdot\log_918}{\log_29+\log_92+2}$ ifadəsinin qiymətini tapın.',
  NULL, NULL, NULL, '2',
  '$t=\log_29$: $\log_218=1+t$, $\log_918=1+\dfrac1t$. $\log_218\cdot\log_918=\dfrac{(1+t)^2}{t}=\log_29+\log_92+2$. Nəticə $2$.',
  2025, 'II', 95, 214)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0031 | əsas: 2025 toplu, II hissə, səh.96 №233
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0031', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Ədədin loqarifmi. Loqarifmin xassələri'), 'original', 'own', 'az', 'draft', 'written',
  '$a^2=5b^2$, $\log_2b=5$ olarsa, $\log_2(a-b)+\log_2(a+b)$ ifadəsinin qiymətini tapın $(a>0)$.',
  NULL, NULL, NULL, '12',
  '$\log_2(a-b)+\log_2(a+b)=\log_2(a^2-b^2)=\log_2(4b^2)=2+2\log_2b=2+10=12$.',
  2025, 'II', 96, 233)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0032 | əsas: 2025 toplu, II hissə, səh.96 №227
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0032', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Loqarifmik funksiya və onun xassələri'), 'original', 'own', 'az', 'draft', 'matching',
  '$a$ və $b$ ədədləri üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$a=\\log_{\\frac12}5,\\ b=\\log_{\\frac12}7$"}, {"key": "2", "text": "$a=\\log_{0{,}4}3,\\ b=\\log_52$"}, {"key": "3", "text": "$a=\\log_{\\sqrt2}\\sqrt8,\\ b=\\log_{\\sqrt2}2\\sqrt2$"}], "right": [{"key": "a", "text": "$a<b$"}, {"key": "b", "text": "$a>b$"}, {"key": "c", "text": "$a=b$"}, {"key": "d", "text": "$a>0,\\ b<0$"}, {"key": "e", "text": "$a<0,\\ b>0$"}]}'::jsonb, NULL, '{"1": ["b"], "2": ["a", "e"], "3": ["c"]}'::jsonb, NULL,
  '1) Əsas $\dfrac12<1$ — funksiya azalandır: $5<7\Rightarrow a>b$ (hər ikisi mənfidir). 2) $a=\log_{0{,}4}3<0$ ($3>1$, əsas $<1$), $b=\log_52>0$: $a<b$. 3) $\sqrt8=\left(\sqrt2\right)^3$, $2\sqrt2=\left(\sqrt2\right)^3$: $a=b=3$.',
  2025, 'II', 96, 227)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0033 | əsas: 2025 toplu, II hissə, səh.96 №228
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0033', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Loqarifmik funksiya və onun xassələri'), 'original', 'own', 'az', 'draft', 'matching',
  '$a$ və $b$ ədədləri üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$a=\\log_{\\frac13}2,\\ b=\\log_{\\frac13}7$"}, {"key": "2", "text": "$a=\\log_25,\\ b=\\log_{0{,}2}3$"}, {"key": "3", "text": "$a=\\log_{\\sqrt3}\\sqrt{27},\\ b=\\log_{\\sqrt3}3\\sqrt3$"}], "right": [{"key": "a", "text": "$a>b$"}, {"key": "b", "text": "$a<b$"}, {"key": "c", "text": "$a=b$"}, {"key": "d", "text": "$a<0,\\ b>0$"}, {"key": "e", "text": "$a>0,\\ b<0$"}]}'::jsonb, NULL, '{"1": ["a"], "2": ["a", "e"], "3": ["c"]}'::jsonb, NULL,
  '1) Əsas $\dfrac13<1$, $2<7\Rightarrow a>b$. 2) $a=\log_25>0$, $b=\log_{0{,}2}3<0$: $a>b$. 3) $\sqrt{27}=\left(\sqrt3\right)^3$, $3\sqrt3=\left(\sqrt3\right)^3$: $a=b$.',
  2025, 'II', 96, 228)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0034 | əsas: 2025 toplu, II hissə, səh.98 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0034', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Loqarifmik funksiya və onun xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$3^a+\dfrac{1}{3^a}=\sqrt6$ olarsa, $f(x)=\sqrt{x-\log_{64}\left(9^a+\dfrac{1}{9^a}\right)}$ funksiyasının təyin oblastını tapın.',
  '[{"key": "A", "text": "$[4;\\ +\\infty)$"}, {"key": "B", "text": "$[0;\\ +\\infty)$"}, {"key": "C", "text": "$\\left[\\dfrac13;\\ +\\infty\\right)$"}, {"key": "D", "text": "$\\left[\\dfrac12;\\ +\\infty\\right)$"}, {"key": "E", "text": "$\\left(\\dfrac13;\\ +\\infty\\right)$"}]'::jsonb, 'C', NULL, NULL,
  '$9^a+9^{-a}=\left(3^a+3^{-a}\right)^2-2=6-2=4$. $\log_{64}4=\dfrac13$. Şərt: $x-\dfrac13\ge0\Rightarrow x\ge\dfrac13$.',
  2025, 'II', 98, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0035 | əsas: 2025 toplu, II hissə, səh.114 №75
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0035', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Loqarifmik funksiya və onun xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=\sqrt{\log_2(7-x)}$ funksiyasının təyin oblastını tapın.',
  '[{"key": "A", "text": "$[6;\\ 7)$"}, {"key": "B", "text": "$(-\\infty;\\ 6]$"}, {"key": "C", "text": "$(-\\infty;\\ 6)$"}, {"key": "D", "text": "$(6;\\ 7)$"}, {"key": "E", "text": "$(-\\infty;\\ 7)$"}]'::jsonb, 'B', NULL, NULL,
  '$\log_2(7-x)\ge0\Rightarrow7-x\ge1\Rightarrow x\le6$ (bu halda $7-x>0$ da ödənir).',
  2025, 'II', 114, 75)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0036 | əsas: 2025 toplu, II hissə, səh.114 №76
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0036', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Loqarifmik funksiya və onun xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=\sqrt{\log_{\frac13}(4-x)}$ funksiyasının təyin oblastını tapın.',
  '[{"key": "A", "text": "$(-\\infty;\\ 4)$"}, {"key": "B", "text": "$(3;\\ 4)$"}, {"key": "C", "text": "$[3;\\ 4]$"}, {"key": "D", "text": "$(-\\infty;\\ 3]$"}, {"key": "E", "text": "$[3;\\ 4)$"}]'::jsonb, 'E', NULL, NULL,
  'Əsas $\dfrac13<1$: $\log_{\frac13}(4-x)\ge0\Leftrightarrow0<4-x\le1\Leftrightarrow3\le x<4$.',
  2025, 'II', 114, 76)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0037 | əsas: 2025 toplu, II hissə, səh.102 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0037', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_2(3x-1)=3$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\dfrac{8}{3}$"}, {"key": "B", "text": "$9$"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$\\dfrac{7}{3}$"}]'::jsonb, 'D', NULL, NULL,
  '$3x-1=2^3=8\Rightarrow x=3$.',
  2025, 'II', 102, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0038 | əsas: 2025 toplu, II hissə, səh.102 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0038', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_5(2x+1)=2$ tənliyini həll edin.',
  '[{"key": "A", "text": "$12$"}, {"key": "B", "text": "$24$"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$13$"}, {"key": "E", "text": "$4{,}5$"}]'::jsonb, 'A', NULL, NULL,
  '$2x+1=25\Rightarrow x=12$.',
  2025, 'II', 102, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0039 | əsas: 2025 toplu, II hissə, səh.102 №18
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0039', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_3x=\log_34+\log_35$ tənliyinin kökü intervallardan hansına daxildir?',
  '[{"key": "A", "text": "$(1;\\ 8)$"}, {"key": "B", "text": "$(8;\\ 10)$"}, {"key": "C", "text": "$(23;\\ 27)$"}, {"key": "D", "text": "$(19;\\ 23)$"}, {"key": "E", "text": "$(10;\\ 15)$"}]'::jsonb, 'D', NULL, NULL,
  '$\log_3x=\log_3(4\cdot5)\Rightarrow x=20\in(19;\ 23)$.',
  2025, 'II', 102, 18)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0040 | əsas: 2025 toplu, II hissə, səh.102 №19
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0040', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_2x+\log_25=\log_245$ tənliyinin kökü intervallardan hansına daxildir?',
  '[{"key": "A", "text": "$(11;\\ 14)$"}, {"key": "B", "text": "$(5;\\ 8)$"}, {"key": "C", "text": "$(0;\\ 5)$"}, {"key": "D", "text": "$(8;\\ 11)$"}, {"key": "E", "text": "$(40;\\ 50)$"}]'::jsonb, 'D', NULL, NULL,
  '$\log_2(5x)=\log_245\Rightarrow5x=45\Rightarrow x=9$.',
  2025, 'II', 102, 19)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0041 | əsas: 2025 toplu, II hissə, səh.102 №20
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0041', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left(\dfrac25\right)^x=\dfrac{125}{8}$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\dfrac{1}{3}$"}, {"key": "B", "text": "$-2$"}, {"key": "C", "text": "$-3$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$- \\dfrac{1}{3}$"}]'::jsonb, 'C', NULL, NULL,
  '$\dfrac{125}{8}=\left(\dfrac52\right)^3=\left(\dfrac25\right)^{-3}\Rightarrow x=-3$.',
  2025, 'II', 102, 20)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0042 | əsas: 2025 toplu, II hissə, səh.102 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0042', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left(\dfrac72\right)^x=\dfrac{4}{49}$ tənliyini həll edin.',
  '[{"key": "A", "text": "$-0{,}5$"}, {"key": "B", "text": "$2$"}, {"key": "C", "text": "$-1$"}, {"key": "D", "text": "$0{,}5$"}, {"key": "E", "text": "$-2$"}]'::jsonb, 'E', NULL, NULL,
  '$\dfrac{4}{49}=\left(\dfrac27\right)^2=\left(\dfrac72\right)^{-2}\Rightarrow x=-2$.',
  2025, 'II', 102, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0043 | əsas: 2025 toplu, II hissə, səh.102 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0043', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$3^{1-2x}=243$ tənliyini həll edin.',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "$-3$"}, {"key": "C", "text": "$-0{,}5$"}, {"key": "D", "text": "$-2$"}, {"key": "E", "text": "$3$"}]'::jsonb, 'D', NULL, NULL,
  '$243=3^5$: $1-2x=5\Rightarrow x=-2$.',
  2025, 'II', 102, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0044 | əsas: 2025 toplu, II hissə, səh.102 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0044', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$7^{2x+9}=343$ tənliyini həll edin.',
  '[{"key": "A", "text": "$6$"}, {"key": "B", "text": "$-3$"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$-2$"}, {"key": "E", "text": "$-6$"}]'::jsonb, 'B', NULL, NULL,
  '$343=7^3$: $2x+9=3\Rightarrow x=-3$.',
  2025, 'II', 102, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0045 | əsas: 2025 toplu, II hissə, səh.103 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0045', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$2^x+2^{x+2}=40$ tənliyini həll edin.',
  '[{"key": "A", "text": "$3$"}, {"key": "B", "text": "$5$"}, {"key": "C", "text": "$2{,}5$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$2$"}]'::jsonb, 'A', NULL, NULL,
  '$2^x(1+4)=40\Rightarrow2^x=8\Rightarrow x=3$.',
  2025, 'II', 103, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0046 | əsas: 2025 toplu, II hissə, səh.103 №29
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0046', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$2^{x+5}=\left(\dfrac12\right)^{x-2}$ tənliyini həll edin.',
  '[{"key": "A", "text": "$1{,}5$"}, {"key": "B", "text": "$-3$"}, {"key": "C", "text": "$-1{,}5$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$-3{,}5$"}]'::jsonb, 'C', NULL, NULL,
  '$\left(\dfrac12\right)^{x-2}=2^{2-x}$: $x+5=2-x\Rightarrow x=-1{,}5$.',
  2025, 'II', 103, 29)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0047 | əsas: 2025 toplu, II hissə, səh.103 №30
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0047', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$5^{x-2}=\dfrac{1}{125}$ tənliyini həll edin.',
  '[{"key": "A", "text": "$5$"}, {"key": "B", "text": "$-5$"}, {"key": "C", "text": "$1$"}, {"key": "D", "text": "$-3$"}, {"key": "E", "text": "$-1$"}]'::jsonb, 'E', NULL, NULL,
  '$5^{x-2}=5^{-3}\Rightarrow x=-1$.',
  2025, 'II', 103, 30)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0048 | əsas: 2025 toplu, II hissə, səh.103 №43
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0048', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lg\left(7x^2-8\right)-\lg(7x-8)=0$ tənliyini həll edin.',
  '[{"key": "A", "text": "$0$"}, {"key": "B", "text": "$\\varnothing$"}, {"key": "C", "text": "$-1$"}, {"key": "D", "text": "$1$"}, {"key": "E", "text": "$0$ və $1$"}]'::jsonb, 'B', NULL, NULL,
  '$7x^2-8=7x-8\Rightarrow x(x-1)=0$. $x=0$ olduqda $7x-8=-8<0$; $x=1$ olduqda $7x-8=-1<0$ — hər ikisi kənar köklərdir. Həlli yoxdur.',
  2025, 'II', 103, 43)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0049 | əsas: 2025 toplu, II hissə, səh.103 №44
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0049', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lg\left(x^2-4\right)-\lg(3x)=0$ tənliyini həll edin.',
  '[{"key": "A", "text": "$4$ və $-1$"}, {"key": "B", "text": "$-1$"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$\\varnothing$"}]'::jsonb, 'D', NULL, NULL,
  '$x^2-4=3x\Rightarrow x^2-3x-4=0\Rightarrow x=4$ və ya $x=-1$. $x=-1$ olduqda $3x<0$ — kənar kök. Cavab: $4$.',
  2025, 'II', 103, 44)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0050 | əsas: 2025 toplu, II hissə, səh.103 №45
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0050', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_3\left(4-\log_2(x+5)\right)=1$ tənliyini həll edin.',
  '[{"key": "A", "text": "$1$"}, {"key": "B", "text": "$-3$"}, {"key": "C", "text": "$-1$"}, {"key": "D", "text": "$-5$"}, {"key": "E", "text": "$3$"}]'::jsonb, 'B', NULL, NULL,
  '$4-\log_2(x+5)=3\Rightarrow\log_2(x+5)=1\Rightarrow x=-3$.',
  2025, 'II', 103, 45)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0051 | əsas: 2025 toplu, II hissə, səh.103 №46
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0051', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_2\left(5-\log_3(2x-1)\right)=2$ tənliyini həll edin.',
  '[{"key": "A", "text": "$1$"}, {"key": "B", "text": "$5$"}, {"key": "C", "text": "$14$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$0{,}5$"}]'::jsonb, 'D', NULL, NULL,
  '$5-\log_3(2x-1)=4\Rightarrow\log_3(2x-1)=1\Rightarrow2x-1=3\Rightarrow x=2$.',
  2025, 'II', 103, 46)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0052 | əsas: 2025 toplu, II hissə, səh.103 №47
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0052', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$2^{2x+1}-17\cdot2^x+8=0$ tənliyinin köklərinin cəmini tapın.',
  '[{"key": "A", "text": "$-1$"}, {"key": "B", "text": "$2$"}, {"key": "C", "text": "$4$"}, {"key": "D", "text": "$8{,}5$"}, {"key": "E", "text": "$3$"}]'::jsonb, 'B', NULL, NULL,
  '$t=2^x>0$: $2t^2-17t+8=0\Rightarrow t=8$ və ya $t=\dfrac12$. $x=3$ və $x=-1$, cəm $2$.',
  2025, 'II', 103, 47)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0053 | əsas: 2025 toplu, II hissə, səh.103 №48
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0053', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$3^{2x+1}-28\cdot3^x+9=0$ tənliyinin köklərinin cəmini tapın.',
  '[{"key": "A", "text": "$1$"}, {"key": "B", "text": "$3$"}, {"key": "C", "text": "$-1$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$0$"}]'::jsonb, 'A', NULL, NULL,
  '$t=3^x$: $3t^2-28t+9=0\Rightarrow t=9$ və ya $t=\dfrac13$. $x=2$ və $x=-1$, cəm $1$.',
  2025, 'II', 103, 48)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0054 | əsas: 2025 toplu, II hissə, səh.103 №51
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0054', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$2^{x+2}+2^{x+1}+2^x=\dfrac78$ tənliyini həll edin.',
  '[{"key": "A", "text": "$3$"}, {"key": "B", "text": "$-2$"}, {"key": "C", "text": "$-3$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$-1$"}]'::jsonb, 'C', NULL, NULL,
  '$2^x(4+2+1)=\dfrac78\Rightarrow2^x=\dfrac18\Rightarrow x=-3$.',
  2025, 'II', 103, 51)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0055 | əsas: 2025 toplu, II hissə, səh.103 №52
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0055', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$2^{x+2}-2^{x+1}+2^x=24$ tənliyini həll edin.',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "$4$"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$1$"}, {"key": "E", "text": "$-3$"}]'::jsonb, 'C', NULL, NULL,
  '$2^x(4-2+1)=24\Rightarrow2^x=8\Rightarrow x=3$.',
  2025, 'II', 103, 52)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0056 | əsas: 2025 toplu, II hissə, səh.104 №70
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0056', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left(\dfrac23\right)^{5x-4}=\left(\dfrac32\right)^{x+2}$ tənliyini həll edin.',
  '[{"key": "A", "text": "$1{,}5$"}, {"key": "B", "text": "$0{,}5$"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$- \\dfrac{1}{3}$"}, {"key": "E", "text": "$\\dfrac{1}{3}$"}]'::jsonb, 'E', NULL, NULL,
  '$\left(\dfrac32\right)^{x+2}=\left(\dfrac23\right)^{-x-2}$: $5x-4=-x-2\Rightarrow x=\dfrac13$.',
  2025, 'II', 104, 70)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0057 | əsas: 2025 toplu, II hissə, səh.104 №71
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0057', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left(\dfrac45\right)^{2x+3}=\left(\dfrac54\right)^{4x-6}$ tənliyini həll edin.',
  '[{"key": "A", "text": "$0{,}5$"}, {"key": "B", "text": "$2$"}, {"key": "C", "text": "$1{,}5$"}, {"key": "D", "text": "$-0{,}5$"}, {"key": "E", "text": "$4{,}5$"}]'::jsonb, 'A', NULL, NULL,
  '$\left(\dfrac54\right)^{4x-6}=\left(\dfrac45\right)^{6-4x}$: $2x+3=6-4x\Rightarrow x=\dfrac12$.',
  2025, 'II', 104, 71)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0058 | əsas: 2025 toplu, II hissə, səh.104 №75
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0058', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_{x^2}49=1$ tənliyini həll edin.',
  '[{"key": "A", "text": "$7;\\ 49$"}, {"key": "B", "text": "$1;\\ 7$"}, {"key": "C", "text": "$-7;\\ 7$"}, {"key": "D", "text": "$7$"}, {"key": "E", "text": "$-7;\\ 49$"}]'::jsonb, 'C', NULL, NULL,
  'Şərt: $x^2>0$, $x^2\ne1$. $x^2=49\Rightarrow x=\pm7$ — hər ikisi şərti ödəyir.',
  2025, 'II', 104, 75)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0059 | əsas: 2025 toplu, II hissə, səh.104 №76
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0059', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_{x^2}25=1$ tənliyini həll edin.',
  '[{"key": "A", "text": "$1;\\ 5$"}, {"key": "B", "text": "$-5;\\ 5$"}, {"key": "C", "text": "$-5;\\ 25$"}, {"key": "D", "text": "$5;\\ 25$"}, {"key": "E", "text": "$5$"}]'::jsonb, 'B', NULL, NULL,
  '$x^2=25\Rightarrow x=\pm5$ ($x^2\ne1$ şərti ödənir).',
  2025, 'II', 104, 76)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0060 | əsas: 2025 toplu, II hissə, səh.104 №77
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0060', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$5^{(x+3)(x-7)}=1$ tənliyinin köklərinin cəmini tapın.',
  '[{"key": "A", "text": "$-4$"}, {"key": "B", "text": "$21$"}, {"key": "C", "text": "$10$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$-21$"}]'::jsonb, 'D', NULL, NULL,
  '$(x+3)(x-7)=0\Rightarrow x=-3$ və ya $x=7$; cəm $4$.',
  2025, 'II', 104, 77)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0061 | əsas: 2025 toplu, II hissə, səh.104 №78
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0061', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$3^{(x+4)(x-1)}=1$ tənliyinin köklərinin cəmini tapın.',
  '[{"key": "A", "text": "$3$"}, {"key": "B", "text": "$5$"}, {"key": "C", "text": "$-5$"}, {"key": "D", "text": "$-4$"}, {"key": "E", "text": "$-3$"}]'::jsonb, 'E', NULL, NULL,
  '$x=-4$ və ya $x=1$; cəm $-3$.',
  2025, 'II', 104, 78)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0062 | əsas: 2025 toplu, II hissə, səh.106 №111
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0062', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$2\cdot4^x-6^x-3\cdot9^x=0$ tənliyini həll edin.',
  '[{"key": "A", "text": "$0$"}, {"key": "B", "text": "$1{,}5$"}, {"key": "C", "text": "$1$"}, {"key": "D", "text": "$-1$"}, {"key": "E", "text": "$2$"}]'::jsonb, 'D', NULL, NULL,
  '$4^x$-ə bölək, $t=\left(\dfrac32\right)^x>0$: $2-t-3t^2=0\Rightarrow3t^2+t-2=0\Rightarrow t=\dfrac23$ ($t=-1$ uyğun deyil). $\left(\dfrac32\right)^x=\dfrac23\Rightarrow x=-1$.',
  2025, 'II', 106, 111)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0063 | əsas: 2025 toplu, II hissə, səh.106 №112
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0063', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$4\cdot9^x-3\cdot12^x-16^x=0$ tənliyini həll edin.',
  '[{"key": "A", "text": "$0$"}, {"key": "B", "text": "$1$"}, {"key": "C", "text": "$-1$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$0{,}5$"}]'::jsonb, 'A', NULL, NULL,
  '$16^x$-ə bölək, $t=\left(\dfrac34\right)^x$: $4t^2-3t-1=0\Rightarrow t=1$ ($t=-\dfrac14$ uyğun deyil). $x=0$.',
  2025, 'II', 106, 112)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0064 | əsas: 2025 toplu, II hissə, səh.107 №138
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0064', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left(\sqrt{7-4\sqrt3}\right)^x+\left(\sqrt{7+4\sqrt3}\right)^x=4$ tənliyinin böyük kökünü tapın.',
  '[{"key": "A", "text": "$-1$"}, {"key": "B", "text": "$1$"}, {"key": "C", "text": "$4$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$0$"}]'::jsonb, 'B', NULL, NULL,
  '$\sqrt{7+4\sqrt3}=2+\sqrt3$, $\sqrt{7-4\sqrt3}=2-\sqrt3=\dfrac{1}{2+\sqrt3}$. $t=(2+\sqrt3)^x$: $t+\dfrac1t=4\Rightarrow t=2\pm\sqrt3=(2+\sqrt3)^{\pm1}$. $x=\pm1$; böyük kök $1$.',
  2025, 'II', 107, 138)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0065 | əsas: 2025 toplu, II hissə, səh.107 №139
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0065', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left(\sqrt{3+2\sqrt2}\right)^x+\left(\sqrt{3-2\sqrt2}\right)^x=34$ tənliyinin kiçik kökünü tapın.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$-3$"}, {"key": "C", "text": "$-4$"}, {"key": "D", "text": "$-2$"}, {"key": "E", "text": "$2$"}]'::jsonb, 'C', NULL, NULL,
  '$\sqrt{3+2\sqrt2}=1+\sqrt2$. $t=(1+\sqrt2)^x$: $t+\dfrac1t=34\Rightarrow t=17\pm12\sqrt2=(1+\sqrt2)^{\pm4}$. $x=\pm4$; kiçik kök $-4$.',
  2025, 'II', 107, 139)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0066 | əsas: 2025 toplu, II hissə, səh.107 №143
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0066', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$4^{x^2-1}-10\cdot2^{x^2-1}+16=0$ tənliyinin müsbət köklərinin cəmini tapın.',
  '[{"key": "A", "text": "$\\sqrt2$"}, {"key": "B", "text": "$4$"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$2\\sqrt2$"}, {"key": "E", "text": "$2+\\sqrt2$"}]'::jsonb, 'E', NULL, NULL,
  '$t=2^{x^2-1}$: $t^2-10t+16=0\Rightarrow t=8$ və ya $t=2$. $x^2-1=3\Rightarrow x=\pm2$; $x^2-1=1\Rightarrow x=\pm\sqrt2$. Müsbət köklərin cəmi $2+\sqrt2$.',
  2025, 'II', 107, 143)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0067 | əsas: 2025 toplu, II hissə, səh.107 №144
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0067', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$9^{x^2-1}-10\cdot3^{x^2-1}+9=0$ tənliyinin müsbət köklərinin cəmini tapın.',
  '[{"key": "A", "text": "$1+\\sqrt3$"}, {"key": "B", "text": "$2\\sqrt3$"}, {"key": "C", "text": "$\\sqrt3$"}, {"key": "D", "text": "$\\sqrt3-1$"}, {"key": "E", "text": "$3$"}]'::jsonb, 'A', NULL, NULL,
  '$t=3^{x^2-1}$: $t^2-10t+9=0\Rightarrow t=9$ və ya $t=1$. $x^2=3$ və ya $x^2=1$. Müsbət köklər $\sqrt3$ və $1$, cəm $1+\sqrt3$.',
  2025, 'II', 107, 144)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0068 | əsas: 2025 toplu, II hissə, səh.108 №158
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0068', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_4(x+2)=2-\log_4(x-4)$ tənliyini həll edin.',
  '[{"key": "A", "text": "$6$"}, {"key": "B", "text": "$\\varnothing$"}, {"key": "C", "text": "$6$ və $-4$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$-4$"}]'::jsonb, 'A', NULL, NULL,
  'Şərt: $x>4$. $\log_4\big((x+2)(x-4)\big)=2\Rightarrow x^2-2x-8=16\Rightarrow x^2-2x-24=0\Rightarrow x=6$ və ya $x=-4$. Şərtə görə $x=6$.',
  2025, 'II', 108, 158)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0069 | əsas: 2025 toplu, II hissə, səh.109 №224
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0069', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'written',
  '$|x-3|^{2x-5}=1$ tənliyinin köklərinin hasilini tapın.',
  NULL, NULL, NULL, '20',
  '$|x-3|^{2x-5}=1$ iki halda: əsas $1$-dir — $|x-3|=1\Rightarrow x=2$ və ya $x=4$; üst sıfırdır və əsas sıfırdan fərqlidir — $2x-5=0\Rightarrow x=2{,}5$ ($|2{,}5-3|=0{,}5\ne0$). Hasil $2\cdot4\cdot2{,}5=20$.',
  2025, 'II', 109, 224)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0070 | əsas: 2025 toplu, II hissə, səh.109 №225
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0070', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'written',
  '$|x-5|^{4x-2}=1$ tənliyinin köklərinin hasilini tapın.',
  NULL, NULL, NULL, '12',
  '$|x-5|=1\Rightarrow x=4$ və ya $x=6$; $4x-2=0\Rightarrow x=0{,}5$ (əsas $4{,}5\ne0$). Hasil $4\cdot6\cdot0{,}5=12$.',
  2025, 'II', 109, 225)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0071 | əsas: 2025 toplu, II hissə, səh.109 №228
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0071', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'written',
  '$\left(\dfrac12\right)^{\lg^2x-3\lg x}=2^{-\lg x-5}$ tənliyinin köklərinin hasilini tapın.',
  NULL, NULL, NULL, '10000',
  '$\left(\dfrac12\right)^{A}=2^{-A}$: $-\left(\lg^2x-3\lg x\right)=-\lg x-5\Rightarrow\lg^2x-4\lg x-5=0\Rightarrow\lg x=5$ və ya $\lg x=-1$. $x=10^5$ və $x=0{,}1$, hasil $10^4=10000$.',
  2025, 'II', 109, 228)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0072 | əsas: 2025 toplu, II hissə, səh.110 №229
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0072', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'written',
  '$\left(\dfrac17\right)^{\lg^2x+\lg x}=7^{-\lg x-4}$ tənliyinin köklərinin hasilini tapın.',
  NULL, NULL, NULL, '1',
  '$\lg^2x+\lg x=\lg x+4\Rightarrow\lg^2x=4\Rightarrow\lg x=\pm2$. $x=100$ və $x=0{,}01$, hasil $1$.',
  2025, 'II', 110, 229)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0073 | əsas: 2025 toplu, II hissə, səh.111 №255
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0073', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'written',
  '$\log_3^2x^2=16\log_3(9x)-44$ tənliyinin köklərinin hasilini tapın.',
  NULL, NULL, NULL, '81',
  'Şərt $x>0$; $t=\log_3x$. $\log_3^2x^2=(2t)^2=4t^2$, $\log_3(9x)=2+t$. $4t^2=32+16t-44\Rightarrow t^2-4t+3=0\Rightarrow t=1$ və ya $t=3$. $x=3$ və $x=27$, hasil $81$.',
  2025, 'II', 111, 255)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0074 | əsas: 2025 toplu, II hissə, səh.111 №256
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0074', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik tənliklər'), 'original', 'own', 'az', 'draft', 'written',
  '$\log_2^2x^2=24\log_2(2x)-56$ tənliyinin köklərinin cəmini tapın.',
  NULL, NULL, NULL, '20',
  '$t=\log_2x$ $(x>0)$: $4t^2=24(1+t)-56\Rightarrow t^2-6t+8=0\Rightarrow t=2$ və ya $t=4$. $x=4$ və $x=16$, cəm $20$.',
  2025, 'II', 111, 256)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0075 | əsas: 2025 toplu, II hissə, səh.111 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0075', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_4(5-2x)<1$ bərabərsizliyini ödəyən tam ədədlərin cəmini tapın.',
  '[{"key": "A", "text": "$6$"}, {"key": "B", "text": "$3$"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$1$"}, {"key": "E", "text": "$0$"}]'::jsonb, 'B', NULL, NULL,
  '$0<5-2x<4\Rightarrow\dfrac12<x<\dfrac52$. Tam həllər $1$ və $2$, cəm $3$.',
  2025, 'II', 111, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0076 | əsas: 2025 toplu, II hissə, səh.111 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0076', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_3(2-x)<2$ bərabərsizliyini ödəyən tam ədədlərin cəmini tapın.',
  '[{"key": "A", "text": "$-20$"}, {"key": "B", "text": "$-15$"}, {"key": "C", "text": "$-27$"}, {"key": "D", "text": "$1$"}, {"key": "E", "text": "$-21$"}]'::jsonb, 'A', NULL, NULL,
  '$0<2-x<9\Rightarrow-7<x<2$. Tam həllər $-6,-5,\dots,1$; cəm $-20$.',
  2025, 'II', 111, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0077 | əsas: 2025 toplu, II hissə, səh.111 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0077', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$9^{2-x}<\left(\dfrac13\right)^{3x+1}$ bərabərsizliyinin ən böyük tam həllini tapın.',
  '[{"key": "A", "text": "$5$"}, {"key": "B", "text": "$6$"}, {"key": "C", "text": "$-6$"}, {"key": "D", "text": "$0$"}, {"key": "E", "text": "$-5$"}]'::jsonb, 'C', NULL, NULL,
  '$3^{4-2x}<3^{-3x-1}\Rightarrow4-2x<-3x-1\Rightarrow x<-5$. Ən böyük tam həll $-6$.',
  2025, 'II', 111, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0078 | əsas: 2025 toplu, II hissə, səh.111 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0078', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left(\dfrac12\right)^x>8^{x-2}$ bərabərsizliyinin ən böyük tam həllini tapın.',
  '[{"key": "A", "text": "$0$"}, {"key": "B", "text": "$-1$"}, {"key": "C", "text": "$1{,}5$"}, {"key": "D", "text": "$1$"}, {"key": "E", "text": "$2$"}]'::jsonb, 'D', NULL, NULL,
  '$2^{-x}>2^{3x-6}\Rightarrow-x>3x-6\Rightarrow x<1{,}5$. Ən böyük tam həll $1$.',
  2025, 'II', 111, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0079 | əsas: 2025 toplu, II hissə, səh.112 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0079', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$0{,}8^x<\left(\dfrac34\right)^x$ bərabərsizliyini həll edin.',
  '[{"key": "A", "text": "$\\varnothing$"}, {"key": "B", "text": "$(-1;\\ 1)$"}, {"key": "C", "text": "$(-\\infty;\\ 0)$"}, {"key": "D", "text": "$(-\\infty;\\ +\\infty)$"}, {"key": "E", "text": "$(0;\\ +\\infty)$"}]'::jsonb, 'C', NULL, NULL,
  'Hər iki tərəfi $\left(\dfrac34\right)^x>0$-a bölək: $\left(\dfrac{16}{15}\right)^x<1$. Əsas $>1$, ona görə $x<0$.',
  2025, 'II', 112, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0080 | əsas: 2025 toplu, II hissə, səh.112 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0080', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left(\dfrac25\right)^x>\left(\dfrac13\right)^x$ bərabərsizliyini həll edin.',
  '[{"key": "A", "text": "$(-1;\\ +\\infty)$"}, {"key": "B", "text": "$(-\\infty;\\ +\\infty)$"}, {"key": "C", "text": "$(0;\\ +\\infty)$"}, {"key": "D", "text": "$\\varnothing$"}, {"key": "E", "text": "$(-\\infty;\\ 0)$"}]'::jsonb, 'C', NULL, NULL,
  '$\left(\dfrac13\right)^x$-ə bölək: $\left(\dfrac65\right)^x>1\Rightarrow x>0$.',
  2025, 'II', 112, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0081 | əsas: 2025 toplu, II hissə, səh.113 №41
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0081', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_{\frac12}(x-2)\ge\log_{\frac14}x$ bərabərsizliyini həll edin.',
  '[{"key": "A", "text": "$(0;\\ 4]$"}, {"key": "B", "text": "$[2;\\ 4]$"}, {"key": "C", "text": "$(2;\\ 4)$"}, {"key": "D", "text": "$(2;\\ +\\infty)$"}, {"key": "E", "text": "$(2;\\ 4]$"}]'::jsonb, 'E', NULL, NULL,
  'Şərt $x>2$. $\log_{\frac14}x=\log_{\frac12}\sqrt x$. Əsas $\dfrac12<1$: $x-2\le\sqrt x$. $t=\sqrt x$: $t^2-t-2\le0\Rightarrow t\le2\Rightarrow x\le4$. Cavab $(2;\ 4]$.',
  2025, 'II', 113, 41)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0082 | əsas: 2025 toplu, II hissə, səh.113 №42
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0082', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_{\frac15}x\ge\log_{\frac{1}{25}}x$ bərabərsizliyini həll edin.',
  '[{"key": "A", "text": "$[1;\\ +\\infty)$"}, {"key": "B", "text": "$(1;\\ +\\infty)$"}, {"key": "C", "text": "$(0;\\ 1)$"}, {"key": "D", "text": "$(0;\\ +\\infty)$"}, {"key": "E", "text": "$(0;\\ 1]$"}]'::jsonb, 'E', NULL, NULL,
  '$\log_{\frac1{25}}x=\dfrac12\log_{\frac15}x$. $\log_{\frac15}x\ge\dfrac12\log_{\frac15}x\Rightarrow\log_{\frac15}x\ge0\Rightarrow0<x\le1$.',
  2025, 'II', 113, 42)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0083 | əsas: 2025 toplu, II hissə, səh.113 №43
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0083', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_{0{,}1}x>\log_{0{,}4}x$ bərabərsizliyini həll edin.',
  '[{"key": "A", "text": "$(0;\\ 1)$"}, {"key": "B", "text": "$(1;\\ +\\infty)$"}, {"key": "C", "text": "$\\varnothing$"}, {"key": "D", "text": "$(0;\\ +\\infty)$"}, {"key": "E", "text": "$(-1;\\ 0)$"}]'::jsonb, 'B', NULL, NULL,
  '$\log_{0{,}1}x=\dfrac{\ln x}{\ln0{,}1}$, $\log_{0{,}4}x=\dfrac{\ln x}{\ln0{,}4}$; $\ln0{,}1<\ln0{,}4<0$. $x>1$ olduqda ($\ln x>0$) $\dfrac{\ln x}{\ln0{,}1}>\dfrac{\ln x}{\ln0{,}4}$ doğrudur; $0<x<1$ olduqda isə tərsinə. $x=1$-də bərabərlik. Cavab $(1;\ +\infty)$.',
  2025, 'II', 113, 43)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0084 | əsas: 2025 toplu, II hissə, səh.113 №44
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0084', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_{0{,}8}x>\log_{0{,}3}x$ bərabərsizliyini həll edin.',
  '[{"key": "A", "text": "$(1;\\ +\\infty)$"}, {"key": "B", "text": "$(-1;\\ 1)$"}, {"key": "C", "text": "$(0;\\ +\\infty)$"}, {"key": "D", "text": "$(0;\\ 1)$"}, {"key": "E", "text": "$\\varnothing$"}]'::jsonb, 'D', NULL, NULL,
  '$\ln0{,}3<\ln0{,}8<0$. $0<x<1$ olduqda $\ln x<0$ və $\dfrac{\ln x}{\ln0{,}8}>\dfrac{\ln x}{\ln0{,}3}>0$ — doğrudur; $x>1$ olduqda tərsinədir. Cavab $(0;\ 1)$.',
  2025, 'II', 113, 44)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0085 | əsas: 2025 toplu, II hissə, səh.113 №45
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0085', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\log_4x<\log_9x$ bərabərsizliyini həll edin.',
  '[{"key": "A", "text": "$(1;\\ +\\infty)$"}, {"key": "B", "text": "$(0;\\ 1)$"}, {"key": "C", "text": "$(0;\\ +\\infty)$"}, {"key": "D", "text": "$(-1;\\ 1)$"}, {"key": "E", "text": "$(4;\\ 9)$"}]'::jsonb, 'B', NULL, NULL,
  '$0<\ln4<\ln9$. $x>1$: $\dfrac{\ln x}{\ln4}>\dfrac{\ln x}{\ln9}$ — ödənmir; $0<x<1$: $\ln x<0$ və $\dfrac{\ln x}{\ln4}<\dfrac{\ln x}{\ln9}$ — ödənir. Cavab $(0;\ 1)$.',
  2025, 'II', 113, 45)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0086 | əsas: 2025 toplu, II hissə, səh.113 №54
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0086', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lg\left(x^2-10x+34\right)<1$ bərabərsizliyinin tam həllini tapın.',
  '[{"key": "A", "text": "$6$"}, {"key": "B", "text": "$3$"}, {"key": "C", "text": "$5$"}, {"key": "D", "text": "$0$"}, {"key": "E", "text": "$4$"}]'::jsonb, 'C', NULL, NULL,
  '$x^2-10x+34>0$ həmişə doğrudur. $x^2-10x+34<10\Rightarrow x^2-10x+24<0\Rightarrow4<x<6$; tam həll $5$.',
  2025, 'II', 113, 54)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LOQ-0087 | əsas: 2025 toplu, II hissə, səh.113 №55
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LOQ-0087', NULL, NULL, (SELECT id FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND s.title='Üstlü və loqarifmik bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lg\left(x^2+4x+13\right)<1$ bərabərsizliyinin tam həllini tapın.',
  '[{"key": "A", "text": "$-2$"}, {"key": "B", "text": "$0$"}, {"key": "C", "text": "$-1$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$-3$"}]'::jsonb, 'A', NULL, NULL,
  '$x^2+4x+13<10\Rightarrow x^2+4x+3<0\Rightarrow-3<x<-1$; tam həll $-2$.',
  2025, 'II', 113, 55)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
