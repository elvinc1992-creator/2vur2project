-- Mövzu: Kvadrat köklər. Həqiqi üstlü qüvvət — 41 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- KKQ-0001 | əsas: 2025 toplu, I hissə, səh.55 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Hesabi kvadrat kök və onun xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt{17^2}+\sqrt{(-11)^2}-\left(\sqrt{6}\right)^2-\sqrt{(-9)^2}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$13$"}, {"key": "B", "text": "$-13$"}, {"key": "C", "text": "$1$"}, {"key": "D", "text": "$7$"}, {"key": "E", "text": "$31$"}]'::jsonb, 'A', NULL, NULL,
  '$\sqrt{a^2}=|a|$: $17+11-6-9=13$.',
  2025, 'I', 55, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0002 | əsas: 2025 toplu, I hissə, səh.55 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Hesabi kvadrat kök və onun xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt{21^2}+\sqrt{(-5)^2}-\left(\sqrt{10}\right)^2-\sqrt{(-14)^2}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "$40$"}, {"key": "C", "text": "$-2$"}, {"key": "D", "text": "$12$"}, {"key": "E", "text": "$-12$"}]'::jsonb, 'A', NULL, NULL,
  '$21+5-10-14=2$.',
  2025, 'I', 55, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0003 | əsas: 2025 toplu, I hissə, səh.55 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Hesabi kvadrat kök və onun xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt{8{,}4\cdot2{,}6}\cdot\left(\sqrt{\dfrac{8{,}4}{2{,}6}}-\sqrt{\dfrac{2{,}6}{8{,}4}}\right)$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$5{,}8$"}, {"key": "B", "text": "$2{,}9$"}, {"key": "C", "text": "$11$"}, {"key": "D", "text": "$4{,}8$"}, {"key": "E", "text": "$6{,}8$"}]'::jsonb, 'A', NULL, NULL,
  'Mötərizəni açaq: $\sqrt{8{,}4\cdot2{,}6}\cdot\sqrt{\dfrac{8{,}4}{2{,}6}}=8{,}4$ və $\sqrt{8{,}4\cdot2{,}6}\cdot\sqrt{\dfrac{2{,}6}{8{,}4}}=2{,}6$. Fərq: $5{,}8$.',
  2025, 'I', 55, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0004 | əsas: 2025 toplu, I hissə, səh.55 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Hesabi kvadrat kök və onun xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt{6{,}3\cdot1{,}8}\cdot\left(\sqrt{\dfrac{6{,}3}{1{,}8}}-\sqrt{\dfrac{1{,}8}{6{,}3}}\right)$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$5{,}4$"}, {"key": "B", "text": "$4{,}5$"}, {"key": "C", "text": "$3{,}5$"}, {"key": "D", "text": "$8{,}1$"}, {"key": "E", "text": "$2{,}7$"}]'::jsonb, 'B', NULL, NULL,
  'Eyni qayda ilə: $6{,}3-1{,}8=4{,}5$.',
  2025, 'I', 55, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0005 | əsas: 2025 toplu, I hissə, səh.57 №31
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Hesabi kvadrat kök və onun xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt{98}+\sqrt{18}-\sqrt{50}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$3\\sqrt2$"}, {"key": "B", "text": "$10\\sqrt2$"}, {"key": "C", "text": "$5\\sqrt2$"}, {"key": "D", "text": "$\\sqrt2$"}, {"key": "E", "text": "$15\\sqrt2$"}]'::jsonb, 'C', NULL, NULL,
  '$7\sqrt2+3\sqrt2-5\sqrt2=5\sqrt2$.',
  2025, 'I', 57, 31)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0006 | əsas: 2025 toplu, I hissə, səh.57 №32
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Hesabi kvadrat kök və onun xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt{12}+2\sqrt{50}-5\sqrt{8}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$2\\sqrt3$"}, {"key": "B", "text": "$-2\\sqrt3$"}, {"key": "C", "text": "$\\sqrt3$"}, {"key": "D", "text": "$\\sqrt2$"}, {"key": "E", "text": "$4\\sqrt2$"}]'::jsonb, 'A', NULL, NULL,
  '$2\sqrt3+10\sqrt2-10\sqrt2=2\sqrt3$.',
  2025, 'I', 57, 32)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0007 | əsas: 2025 toplu, I hissə, səh.57 №41
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0007', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Hesabi kvadrat kök və onun xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{7-\sqrt3}{7+\sqrt3}+\dfrac{7+\sqrt3}{7-\sqrt3}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$0$"}, {"key": "B", "text": "$\\dfrac{49}{23}$"}, {"key": "C", "text": "$\\dfrac{52}{23}$"}, {"key": "D", "text": "$\\dfrac{26}{23}$"}, {"key": "E", "text": "$104$"}]'::jsonb, 'C', NULL, NULL,
  'Ortaq məxrəc $49-3=46$. Surət: $(7-\sqrt3)^2+(7+\sqrt3)^2=2(49+3)=104$. Nəticə: $\dfrac{104}{46}=\dfrac{52}{23}$.',
  2025, 'I', 57, 41)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0008 | əsas: 2025 toplu, I hissə, səh.57 №42
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Hesabi kvadrat kök və onun xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$a=\dfrac{\sqrt{18}+2\sqrt2}{3\sqrt2}$ ədədi intervallardan hansına daxildir?',
  '[{"key": "A", "text": "$(4;5)$"}, {"key": "B", "text": "$(2;3)$"}, {"key": "C", "text": "$(1;2)$"}, {"key": "D", "text": "$(3;4)$"}, {"key": "E", "text": "$(0;1)$"}]'::jsonb, 'C', NULL, NULL,
  '$\sqrt{18}=3\sqrt2$, ona görə $a=\dfrac{5\sqrt2}{3\sqrt2}=\dfrac{5}{3}\approx1{,}67\in(1;2)$.',
  2025, 'I', 57, 42)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0009 | əsas: 2025 toplu, I hissə, səh.57 №43
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Hesabi kvadrat kök və onun xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$a=\dfrac{\sqrt{45}+2\sqrt5}{2\sqrt5}$ ədədi aşağıdakı intervallardan hansına daxildir?',
  '[{"key": "A", "text": "$(3;4)$"}, {"key": "B", "text": "$(1;2)$"}, {"key": "C", "text": "$(0;1)$"}, {"key": "D", "text": "$(4;5)$"}, {"key": "E", "text": "$(2;3)$"}]'::jsonb, 'E', NULL, NULL,
  '$\sqrt{45}=3\sqrt5$: $a=\dfrac{5\sqrt5}{2\sqrt5}=2{,}5\in(2;3)$.',
  2025, 'I', 57, 43)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0010 | əsas: 2025 toplu, I hissə, səh.57 №44
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Hesabi kvadrat kök və onun xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt{\left(\sqrt7-8\right)^2}$ ədədi hansı iki qonşu tam ədəd arasında yerləşir?',
  '[{"key": "A", "text": "$6$ və $7$"}, {"key": "B", "text": "$-3$ və $-2$"}, {"key": "C", "text": "$-5$ və $-4$"}, {"key": "D", "text": "$-6$ və $-5$"}, {"key": "E", "text": "$5$ və $6$"}]'::jsonb, 'E', NULL, NULL,
  '$\sqrt7<8$, ona görə $\sqrt{(\sqrt7-8)^2}=|\sqrt7-8|=8-\sqrt7$. $2<\sqrt7<3$ olduğundan $5<8-\sqrt7<6$.',
  2025, 'I', 57, 44)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0011 | əsas: 2025 toplu, I hissə, səh.57 №45
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0011', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Hesabi kvadrat kök və onun xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt{\left(\sqrt2-6\right)^2}$ ədədi hansı iki qonşu tam ədəd arasında yerləşir?',
  '[{"key": "A", "text": "$5$ və $6$"}, {"key": "B", "text": "$3$ və $4$"}, {"key": "C", "text": "$-4$ və $-3$"}, {"key": "D", "text": "$-5$ və $-4$"}, {"key": "E", "text": "$4$ və $5$"}]'::jsonb, 'E', NULL, NULL,
  '$\sqrt{(\sqrt2-6)^2}=6-\sqrt2$. $1<\sqrt2<2$ olduğundan $4<6-\sqrt2<5$.',
  2025, 'I', 57, 45)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0012 | əsas: 2025 toplu, I hissə, səh.58 №57
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0012', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Hesabi kvadrat kök və onun xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt{\dfrac{2^{9}+2^{5}-4}{27}}$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$5\\sqrt2$"}, {"key": "B", "text": "$2\\sqrt5$"}, {"key": "C", "text": "$4\\sqrt5$"}, {"key": "D", "text": "$\\sqrt5$"}, {"key": "E", "text": "$\\sqrt{10}$"}]'::jsonb, 'B', NULL, NULL,
  '$2^9+2^5-4=512+32-4=540$. $\dfrac{540}{27}=20$, $\sqrt{20}=2\sqrt5$.',
  2025, 'I', 58, 57)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0013 | əsas: 2025 toplu, I hissə, səh.58 №59
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Hesabi kvadrat kök və onun xassələri'), 'original', 'own', 'az', 'draft', 'open',
  '$3\sqrt7$ ədədinin tam hissəsini tapın.',
  NULL, NULL, NULL, '7',
  '$3\sqrt7=\sqrt{63}$. $49<63<64$ olduğundan $7<\sqrt{63}<8$. Tam hissə: $7$.',
  2025, 'I', 58, 59)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0014 | əsas: 2025 toplu, I hissə, səh.58 №60
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Hesabi kvadrat kök və onun xassələri'), 'original', 'own', 'az', 'draft', 'open',
  '$6\sqrt3$ ədədinin tam hissəsini tapın.',
  NULL, NULL, NULL, '10',
  '$6\sqrt3=\sqrt{108}$. $100<108<121$, ona görə tam hissə $10$-dur.',
  2025, 'I', 58, 60)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0015 | əsas: 2025 toplu, I hissə, səh.59 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0015', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='n-ci dərəcədən kök. Həqiqi üstlü qüvvət və onun xassələri. Ədədlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt{\dfrac{4\cdot\sqrt2}{\sqrt{0{,}5}}}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$\\sqrt2$"}, {"key": "C", "text": "$8$"}, {"key": "D", "text": "$2\\sqrt2$"}, {"key": "E", "text": "$2$"}]'::jsonb, 'D', NULL, NULL,
  '$\sqrt{0{,}5}=\dfrac{1}{\sqrt2}$, ona görə $\dfrac{4\sqrt2}{\sqrt{0{,}5}}=4\sqrt2\cdot\sqrt2=8$. $\sqrt8=2\sqrt2$.',
  2025, 'I', 59, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0016 | əsas: 2025 toplu, I hissə, səh.59 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='n-ci dərəcədən kök. Həqiqi üstlü qüvvət və onun xassələri. Ədədlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt{\dfrac{10\cdot\sqrt{10}}{\sqrt{0{,}1}}}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$100$"}, {"key": "B", "text": "$10\\sqrt{10}$"}, {"key": "C", "text": "$\\sqrt{10}$"}, {"key": "D", "text": "$1$"}, {"key": "E", "text": "$10$"}]'::jsonb, 'E', NULL, NULL,
  '$\sqrt{0{,}1}=\dfrac{1}{\sqrt{10}}$: $10\sqrt{10}\cdot\sqrt{10}=100$, $\sqrt{100}=10$.',
  2025, 'I', 59, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0017 | əsas: 2025 toplu, I hissə, səh.60 №29
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='n-ci dərəcədən kök. Həqiqi üstlü qüvvət və onun xassələri. Ədədlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt[6]{9}+\sqrt[9]{27}-\sqrt[12]{81}$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$\\sqrt3$"}, {"key": "B", "text": "$\\sqrt[3]{3}$"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$2\\sqrt[3]{3}$"}, {"key": "E", "text": "$\\sqrt[4]{3}$"}]'::jsonb, 'B', NULL, NULL,
  '$\sqrt[6]{3^2}=\sqrt[3]{3}$, $\sqrt[9]{3^3}=\sqrt[3]{3}$, $\sqrt[12]{3^4}=\sqrt[3]{3}$. Nəticə: $\sqrt[3]{3}+\sqrt[3]{3}-\sqrt[3]{3}=\sqrt[3]{3}$.',
  2025, 'I', 60, 29)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0018 | əsas: 2025 toplu, I hissə, səh.60 №30
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='n-ci dərəcədən kök. Həqiqi üstlü qüvvət və onun xassələri. Ədədlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt[6]{25}-\sqrt[9]{125}+\sqrt[12]{625}$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$5$"}, {"key": "B", "text": "$2\\sqrt[3]{5}$"}, {"key": "C", "text": "$\\sqrt5$"}, {"key": "D", "text": "$\\sqrt[3]{5}$"}, {"key": "E", "text": "$\\sqrt[4]{5}$"}]'::jsonb, 'D', NULL, NULL,
  'Hər üç kök $\sqrt[3]{5}$-ə bərabərdir: $\sqrt[3]{5}-\sqrt[3]{5}+\sqrt[3]{5}=\sqrt[3]{5}$.',
  2025, 'I', 60, 30)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0019 | əsas: 2025 toplu, I hissə, səh.60 №34
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='n-ci dərəcədən kök. Həqiqi üstlü qüvvət və onun xassələri. Ədədlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left(13^3\right)^0-3^{-2}\cdot27^{\frac{4}{3}}-16^{-1\frac{1}{4}}\cdot64+(0{,}008)^{-\frac{1}{3}}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$-4$"}, {"key": "B", "text": "$5$"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$-5$"}, {"key": "E", "text": "$-6$"}]'::jsonb, 'D', NULL, NULL,
  '$\left(13^3\right)^0=1$; $27^{\frac43}=3^4=81$, $3^{-2}\cdot81=9$; $16^{-\frac54}=2^{-5}=\dfrac{1}{32}$, $\dfrac{64}{32}=2$; $(0{,}008)^{-\frac13}=\left(0{,}2^3\right)^{-\frac13}=5$. Cəm: $1-9-2+5=-5$.',
  2025, 'I', 60, 34)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0020 | əsas: 2025 toplu, I hissə, səh.60 №35
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='n-ci dərəcədən kök. Həqiqi üstlü qüvvət və onun xassələri. Ədədlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$16^{\frac{3}{4}}\cdot2^{-3}-8^{-1\frac{1}{3}}\cdot16-\left(25^3\right)^0+(0{,}001)^{-\frac{1}{3}}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$8$"}, {"key": "B", "text": "$9$"}, {"key": "C", "text": "$10$"}, {"key": "D", "text": "$-9$"}, {"key": "E", "text": "$11$"}]'::jsonb, 'B', NULL, NULL,
  '$16^{\frac34}=8$, $8\cdot2^{-3}=1$; $8^{-\frac43}=2^{-4}$, $2^{-4}\cdot16=1$; $\left(25^3\right)^0=1$; $(0{,}001)^{-\frac13}=10$. Nəticə: $1-1-1+10=9$.',
  2025, 'I', 60, 35)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0021 | əsas: 2025 toplu, I hissə, səh.61 №50
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='n-ci dərəcədən kök. Həqiqi üstlü qüvvət və onun xassələri. Ədədlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$x,\ y,\ z$ həqiqi ədədləri üçün $\sqrt[4]{2z-8}+\sqrt[6]{3x-z+1}+\sqrt{y-3x-z}=0$ olarsa, $x+y+z$ ifadəsinin qiymətini tapın.',
  '[{"key": "A", "text": "$10$"}, {"key": "B", "text": "$11$"}, {"key": "C", "text": "$8$"}, {"key": "D", "text": "$7$"}, {"key": "E", "text": "$12$"}]'::jsonb, 'E', NULL, NULL,
  'Cüt dərəcəli köklər qeyri-mənfidir, cəmi sıfırdırsa hər biri sıfırdır: $2z-8=0\Rightarrow z=4$; $3x-4+1=0\Rightarrow x=1$; $y-3-4=0\Rightarrow y=7$. $x+y+z=12$.',
  2025, 'I', 61, 50)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0022 | əsas: 2025 toplu, I hissə, səh.61 №59
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='n-ci dərəcədən kök. Həqiqi üstlü qüvvət və onun xassələri. Ədədlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'open',
  '$\dfrac{\sqrt[6]{5-\sqrt{24}}}{\sqrt{5-\sqrt{24}}\cdot\sqrt[3]{5+\sqrt{24}}}$ ifadəsinin qiymətini hesablayın.',
  NULL, NULL, NULL, '1',
  '$(5-\sqrt{24})(5+\sqrt{24})=25-24=1$, yəni $5+\sqrt{24}=\dfrac{1}{t}$, $t=5-\sqrt{24}$. İfadə: $\dfrac{t^{\frac16}}{t^{\frac12}\cdot t^{-\frac13}}=t^{\frac16-\frac12+\frac13}=t^0=1$.',
  2025, 'I', 61, 59)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0023 | əsas: 2025 toplu, I hissə, səh.62 №66
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='n-ci dərəcədən kök. Həqiqi üstlü qüvvət və onun xassələri. Ədədlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'matching',
  'Verilmiş $a$ ədədi üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$a=\\sqrt[6]{\\left(3-\\sqrt{10}\\right)^6}$"}, {"key": "2", "text": "$a=\\sqrt[5]{\\left(3-\\sqrt{10}\\right)^5}$"}, {"key": "3", "text": "$a=\\dfrac{\\sqrt2+\\sqrt{14}}{\\sqrt8}$"}], "right": [{"key": "a", "text": "$1<a<2$"}, {"key": "b", "text": "$-1<a<0$"}, {"key": "c", "text": "$0<a<1$"}, {"key": "d", "text": "$a$-nın tam hissəsi $1$-dir"}, {"key": "e", "text": "$a$-nın tam hissəsi $(-1)$-dir"}]}'::jsonb, NULL, '{"1": ["c"], "2": ["b", "e"], "3": ["a", "d"]}'::jsonb, NULL,
  '1) Cüt dərəcəli kök: $\sqrt[6]{(3-\sqrt{10})^6}=|3-\sqrt{10}|=\sqrt{10}-3\approx0{,}16$ — $0<a<1$. 2) Tək dərəcəli kök: $3-\sqrt{10}\approx-0{,}16$ — $-1<a<0$, tam hissəsi $-1$. 3) $\dfrac{\sqrt2(1+\sqrt7)}{2\sqrt2}=\dfrac{1+\sqrt7}{2}\approx1{,}82$ — $1<a<2$, tam hissəsi $1$.',
  2025, 'I', 62, 66)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0024 | əsas: 2025 toplu, I hissə, səh.62 №67
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='n-ci dərəcədən kök. Həqiqi üstlü qüvvət və onun xassələri. Ədədlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'matching',
  'Verilmiş $a$ ədədi üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$a=\\sqrt[7]{\\left(\\sqrt5-3\\right)^7}$"}, {"key": "2", "text": "$a=\\sqrt[4]{\\left(\\sqrt5-3\\right)^4}$"}, {"key": "3", "text": "$a=\\dfrac{\\sqrt6+\\sqrt{10}}{\\sqrt{12}}$"}], "right": [{"key": "a", "text": "$a$-nın tam hissəsi $(-1)$-dir"}, {"key": "b", "text": "$-1<a<0$"}, {"key": "c", "text": "$0<a<1$"}, {"key": "d", "text": "$a$-nın tam hissəsi $1$-dir"}, {"key": "e", "text": "$1<a<2$"}]}'::jsonb, NULL, '{"1": ["a", "b"], "2": ["c"], "3": ["d", "e"]}'::jsonb, NULL,
  '1) Tək dərəcəli kök: $a=\sqrt5-3\approx-0{,}76$ — $-1<a<0$, tam hissəsi $-1$. 2) $|\sqrt5-3|=3-\sqrt5\approx0{,}76$ — $0<a<1$. 3) $\dfrac{\sqrt6}{\sqrt{12}}+\dfrac{\sqrt{10}}{\sqrt{12}}=\dfrac{1}{\sqrt2}+\sqrt{\dfrac{5}{6}}\approx0{,}71+0{,}91=1{,}62$ — $1<a<2$, tam hissəsi $1$.',
  2025, 'I', 62, 67)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0025 | əsas: 2025 toplu, I hissə, səh.62 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0025', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Kəsrlərin ixtisarı. İfadələrin sadələşdirilməsi və ədədi qiymətinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$x>0,\ y>0$ və $z>0$ olarsa, $\left(\sqrt{xy}+\sqrt{xz}-\sqrt{\dfrac{x}{y}}\right)\sqrt{\dfrac{y}{x}}$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$y+1$"}, {"key": "B", "text": "$\\sqrt{yz}-1$"}, {"key": "C", "text": "$y+\\sqrt{yz}-1$"}, {"key": "D", "text": "$y-\\sqrt{yz}+1$"}, {"key": "E", "text": "$y+\\sqrt{yz}$"}]'::jsonb, 'C', NULL, NULL,
  'Hər həddi $\sqrt{\dfrac{y}{x}}$-ə vuraq: $\sqrt{xy}\cdot\sqrt{\dfrac{y}{x}}=y$; $\sqrt{xz}\cdot\sqrt{\dfrac{y}{x}}=\sqrt{yz}$; $\sqrt{\dfrac{x}{y}}\cdot\sqrt{\dfrac{y}{x}}=1$. Nəticə: $y+\sqrt{yz}-1$.',
  2025, 'I', 62, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0026 | əsas: 2025 toplu, I hissə, səh.63 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Kəsrlərin ixtisarı. İfadələrin sadələşdirilməsi və ədədi qiymətinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$x>0$ və $y>0$ olarsa, $\left(x\sqrt{\dfrac{x}{y}}-2\sqrt{xy}+y\sqrt{\dfrac{y}{x}}\right)\sqrt{xy}$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$x+y$"}, {"key": "B", "text": "$y-x$"}, {"key": "C", "text": "$(x-y)^2$"}, {"key": "D", "text": "$x-y$"}, {"key": "E", "text": "$(x+y)^2$"}]'::jsonb, 'C', NULL, NULL,
  '$x\sqrt{\dfrac{x}{y}}\cdot\sqrt{xy}=x\cdot x=x^2$; $2\sqrt{xy}\cdot\sqrt{xy}=2xy$; $y\sqrt{\dfrac{y}{x}}\cdot\sqrt{xy}=y^2$. Nəticə: $x^2-2xy+y^2=(x-y)^2$.',
  2025, 'I', 63, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0027 | əsas: 2025 toplu, I hissə, səh.63 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0027', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Kəsrlərin ixtisarı. İfadələrin sadələşdirilməsi və ədədi qiymətinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$(2+\sqrt3)\sqrt{6-\sqrt{27}}\cdot\sqrt{2-\sqrt3}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$3$"}, {"key": "B", "text": "$\\sqrt3\\left(2+\\sqrt3\\right)$"}, {"key": "C", "text": "$\\sqrt3\\left(2-\\sqrt3\\right)$"}, {"key": "D", "text": "$2\\sqrt3$"}, {"key": "E", "text": "$\\sqrt3$"}]'::jsonb, 'E', NULL, NULL,
  '$6-\sqrt{27}=6-3\sqrt3=3(2-\sqrt3)$, ona görə $\sqrt{6-\sqrt{27}}=\sqrt3\cdot\sqrt{2-\sqrt3}$. İfadə: $(2+\sqrt3)\cdot\sqrt3\cdot(2-\sqrt3)=\sqrt3(4-3)=\sqrt3$.',
  2025, 'I', 63, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0028 | əsas: 2025 toplu, I hissə, səh.64 №31
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0028', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Kəsrlərin ixtisarı. İfadələrin sadələşdirilməsi və ədədi qiymətinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt{19+8\sqrt3}+\sqrt{19-8\sqrt3}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$2\\sqrt3$"}, {"key": "B", "text": "$8$"}, {"key": "C", "text": "$-8$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$6$"}]'::jsonb, 'B', NULL, NULL,
  '$19\pm8\sqrt3=(4\pm\sqrt3)^2$ (çünki $16+3=19$, $2\cdot4\cdot\sqrt3=8\sqrt3$). Cəm: $(4+\sqrt3)+(4-\sqrt3)=8$.',
  2025, 'I', 64, 31)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0029 | əsas: 2025 toplu, I hissə, səh.64 №32
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0029', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Kəsrlərin ixtisarı. İfadələrin sadələşdirilməsi və ədədi qiymətinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt{7+4\sqrt3}-\sqrt{7-4\sqrt3}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$2\\sqrt3$"}, {"key": "B", "text": "$2$"}, {"key": "C", "text": "$4$"}, {"key": "D", "text": "$\\sqrt3$"}, {"key": "E", "text": "$7$"}]'::jsonb, 'A', NULL, NULL,
  '$7\pm4\sqrt3=(2\pm\sqrt3)^2$. Fərq: $(2+\sqrt3)-(2-\sqrt3)=2\sqrt3$.',
  2025, 'I', 64, 32)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0030 | əsas: 2025 toplu, I hissə, səh.64 №41
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0030', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Kəsrlərin ixtisarı. İfadələrin sadələşdirilməsi və ədədi qiymətinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{1-\frac{\sqrt3}{2}}{1+\frac{\sqrt3}{2}}+\left(\sqrt{\dfrac{3}{2}}-\sqrt{\dfrac{1}{2}}\right)^2$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$9-5\\sqrt3$"}, {"key": "B", "text": "$9+5\\sqrt3$"}, {"key": "C", "text": "$2-\\sqrt3$"}, {"key": "D", "text": "$5-3\\sqrt3$"}, {"key": "E", "text": "$7-4\\sqrt3$"}]'::jsonb, 'A', NULL, NULL,
  '$\dfrac{2-\sqrt3}{2+\sqrt3}=\dfrac{(2-\sqrt3)^2}{4-3}=7-4\sqrt3$. $\left(\dfrac{\sqrt3-1}{\sqrt2}\right)^2=\dfrac{4-2\sqrt3}{2}=2-\sqrt3$. Cəm: $9-5\sqrt3$.',
  2025, 'I', 64, 41)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0031 | əsas: 2025 toplu, I hissə, səh.64 №42
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0031', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Kəsrlərin ixtisarı. İfadələrin sadələşdirilməsi və ədədi qiymətinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{1+\frac{\sqrt2}{2}}{1-\frac{\sqrt2}{2}}+\left(\sqrt2-\sqrt{\dfrac{1}{2}}\right)^2$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$3+2\\sqrt2$"}, {"key": "B", "text": "$3{,}5+2\\sqrt2$"}, {"key": "C", "text": "$2{,}5+2\\sqrt2$"}, {"key": "D", "text": "$7+4\\sqrt2$"}, {"key": "E", "text": "$3{,}5-2\\sqrt2$"}]'::jsonb, 'B', NULL, NULL,
  '$\dfrac{2+\sqrt2}{2-\sqrt2}=\dfrac{(2+\sqrt2)^2}{4-2}=\dfrac{6+4\sqrt2}{2}=3+2\sqrt2$. $\sqrt2-\dfrac{1}{\sqrt2}=\dfrac{1}{\sqrt2}$, kvadratı $\dfrac12$. Cəm: $3{,}5+2\sqrt2$.',
  2025, 'I', 64, 42)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0032 | əsas: 2025 toplu, I hissə, səh.64 №43
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0032', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Kəsrlərin ixtisarı. İfadələrin sadələşdirilməsi və ədədi qiymətinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt[3]{\sqrt5-2}\cdot\sqrt[6]{9+4\sqrt5}$ ifadəsinin qiymətini tapın.',
  '[{"key": "A", "text": "$\\sqrt[3]{9}$"}, {"key": "B", "text": "$2$"}, {"key": "C", "text": "$1$"}, {"key": "D", "text": "$\\sqrt5$"}, {"key": "E", "text": "$\\sqrt[3]{5}$"}]'::jsonb, 'C', NULL, NULL,
  '$9+4\sqrt5=(\sqrt5+2)^2$, ona görə $\sqrt[6]{9+4\sqrt5}=\sqrt[3]{\sqrt5+2}$. Hasil: $\sqrt[3]{(\sqrt5-2)(\sqrt5+2)}=\sqrt[3]{1}=1$.',
  2025, 'I', 64, 43)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0033 | əsas: 2025 toplu, I hissə, səh.64 №44
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0033', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Kəsrlərin ixtisarı. İfadələrin sadələşdirilməsi və ədədi qiymətinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt[6]{11+6\sqrt2}\cdot\sqrt[3]{3-\sqrt2}$ ifadəsinin qiymətini tapın.',
  '[{"key": "A", "text": "$\\sqrt[6]{7}$"}, {"key": "B", "text": "$\\sqrt[3]{3}$"}, {"key": "C", "text": "$\\sqrt7$"}, {"key": "D", "text": "$7$"}, {"key": "E", "text": "$\\sqrt[3]{7}$"}]'::jsonb, 'E', NULL, NULL,
  '$11+6\sqrt2=(3+\sqrt2)^2$: $\sqrt[6]{11+6\sqrt2}=\sqrt[3]{3+\sqrt2}$. Hasil: $\sqrt[3]{9-2}=\sqrt[3]{7}$.',
  2025, 'I', 64, 44)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0034 | əsas: 2025 toplu, I hissə, səh.65 №47
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0034', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Kəsrlərin ixtisarı. İfadələrin sadələşdirilməsi və ədədi qiymətinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{8-5\sqrt2}{\left(\sqrt[4]{2}-\sqrt[4]{32}\right)^2}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$8\\sqrt2-5$"}, {"key": "B", "text": "$1$"}, {"key": "C", "text": "$5-4\\sqrt2$"}, {"key": "D", "text": "$4\\sqrt2-5$"}, {"key": "E", "text": "$-1$"}]'::jsonb, 'D', NULL, NULL,
  '$\sqrt[4]{32}=2\sqrt[4]{2}$, ona görə məxrəc $\left(-\sqrt[4]{2}\right)^2=\sqrt2$. $\dfrac{8-5\sqrt2}{\sqrt2}=\dfrac{8}{\sqrt2}-5=4\sqrt2-5$.',
  2025, 'I', 65, 47)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0035 | əsas: 2025 toplu, I hissə, səh.65 №48
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0035', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Kəsrlərin ixtisarı. İfadələrin sadələşdirilməsi və ədədi qiymətinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{5-3\sqrt5}{\left(\sqrt[4]{5}-\sqrt[4]{125}\right)^2}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$-2$"}, {"key": "B", "text": "$\\dfrac{1}{2}$"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$-\\dfrac{1}{2}$"}, {"key": "E", "text": "$-1$"}]'::jsonb, 'D', NULL, NULL,
  'Məxrəc: $\sqrt5-2\sqrt[4]{625}+\sqrt{125}=\sqrt5-10+5\sqrt5=6\sqrt5-10=2(3\sqrt5-5)$. Surət $5-3\sqrt5=-(3\sqrt5-5)$. Nisbət: $-\dfrac12$.',
  2025, 'I', 65, 48)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0036 | əsas: 2025 toplu, I hissə, səh.65 №52
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0036', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Kəsrlərin ixtisarı. İfadələrin sadələşdirilməsi və ədədi qiymətinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$a+\sqrt a=6$ olarsa, $a^2-13a$ ifadəsinin qiymətini tapın.',
  '[{"key": "A", "text": "$-36$"}, {"key": "B", "text": "$36$"}, {"key": "C", "text": "$6$"}, {"key": "D", "text": "$13$"}, {"key": "E", "text": "$-13$"}]'::jsonb, 'A', NULL, NULL,
  '$\sqrt a=6-a$. Kvadrata yüksəldək: $a=36-12a+a^2\Rightarrow a^2-13a=-36$. (Yoxlama: $\sqrt a=t$, $t^2+t-6=0$, $t=2$, $a=4$; $16-52=-36$.)',
  2025, 'I', 65, 52)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0037 | əsas: 2025 toplu, I hissə, səh.65 №53
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0037', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Kəsrlərin ixtisarı. İfadələrin sadələşdirilməsi və ədədi qiymətinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$a-\sqrt a=5$ olarsa, $a^2-11a$ ifadəsinin qiymətini tapın.',
  '[{"key": "A", "text": "$-25$"}, {"key": "B", "text": "$-11$"}, {"key": "C", "text": "$25$"}, {"key": "D", "text": "$11$"}, {"key": "E", "text": "$5$"}]'::jsonb, 'A', NULL, NULL,
  '$a-5=\sqrt a$. Kvadrata yüksəldək: $a^2-10a+25=a\Rightarrow a^2-11a=-25$.',
  2025, 'I', 65, 53)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0038 | əsas: 2025 toplu, I hissə, səh.65 №62
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0038', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Kəsrlərin ixtisarı. İfadələrin sadələşdirilməsi və ədədi qiymətinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$7-\sqrt7+\dfrac{5\sqrt{14}}{7\sqrt2-2\sqrt7}-\sqrt2$ ifadəsinin qiymətini tapın.',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "$14$"}, {"key": "C", "text": "$5$"}, {"key": "D", "text": "$7$"}, {"key": "E", "text": "$9$"}]'::jsonb, 'D', NULL, NULL,
  '$7\sqrt2-2\sqrt7=\sqrt{14}\left(\sqrt7-\sqrt2\right)$. Onda $\dfrac{5\sqrt{14}}{\sqrt{14}(\sqrt7-\sqrt2)}=\dfrac{5}{\sqrt7-\sqrt2}=\dfrac{5(\sqrt7+\sqrt2)}{7-2}=\sqrt7+\sqrt2$. İfadə: $7-\sqrt7+\sqrt7+\sqrt2-\sqrt2=7$.',
  2025, 'I', 65, 62)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0039 | əsas: 2025 toplu, I hissə, səh.65 №63
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0039', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Kəsrlərin ixtisarı. İfadələrin sadələşdirilməsi və ədədi qiymətinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$13-\sqrt{13}+\dfrac{10\sqrt{39}}{13\sqrt3-3\sqrt{13}}-\sqrt3$ ifadəsinin qiymətini tapın.',
  '[{"key": "A", "text": "$\\sqrt{39}$"}, {"key": "B", "text": "$3$"}, {"key": "C", "text": "$16$"}, {"key": "D", "text": "$13$"}, {"key": "E", "text": "$10$"}]'::jsonb, 'D', NULL, NULL,
  '$13\sqrt3-3\sqrt{13}=\sqrt{39}\left(\sqrt{13}-\sqrt3\right)$. $\dfrac{10}{\sqrt{13}-\sqrt3}=\dfrac{10(\sqrt{13}+\sqrt3)}{10}=\sqrt{13}+\sqrt3$. İfadə: $13$.',
  2025, 'I', 65, 63)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0040 | əsas: 2025 toplu, I hissə, səh.66 №66
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0040', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Kəsrlərin ixtisarı. İfadələrin sadələşdirilməsi və ədədi qiymətinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left(5+2\sqrt6\right)\left(\sqrt6-2\right)\sqrt{5-2\sqrt6}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$2\\sqrt2$"}, {"key": "B", "text": "$\\sqrt2$"}, {"key": "C", "text": "$1$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$\\sqrt3$"}]'::jsonb, 'B', NULL, NULL,
  '$5\pm2\sqrt6=\left(\sqrt3\pm\sqrt2\right)^2$, $\sqrt6-2=\sqrt2\left(\sqrt3-\sqrt2\right)$. İfadə: $\left(\sqrt3+\sqrt2\right)^2\cdot\sqrt2\left(\sqrt3-\sqrt2\right)\cdot\left(\sqrt3-\sqrt2\right)=\sqrt2\left(3-2\right)^2=\sqrt2$.',
  2025, 'I', 66, 66)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KKQ-0041 | əsas: 2025 toplu, I hissə, səh.66 №67
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KKQ-0041', NULL, NULL, (SELECT id FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND s.title='Kəsrlərin ixtisarı. İfadələrin sadələşdirilməsi və ədədi qiymətinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left(7+2\sqrt{10}\right)\left(\sqrt{10}-2\right)\sqrt{7-2\sqrt{10}}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$3\\sqrt2$"}, {"key": "B", "text": "$\\sqrt2$"}, {"key": "C", "text": "$9\\sqrt2$"}, {"key": "D", "text": "$18$"}, {"key": "E", "text": "$9$"}]'::jsonb, 'C', NULL, NULL,
  '$7\pm2\sqrt{10}=\left(\sqrt5\pm\sqrt2\right)^2$, $\sqrt{10}-2=\sqrt2\left(\sqrt5-\sqrt2\right)$. İfadə: $\sqrt2\left(\left(\sqrt5+\sqrt2\right)\left(\sqrt5-\sqrt2\right)\right)^2=\sqrt2\cdot3^2=9\sqrt2$.',
  2025, 'I', 66, 67)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
