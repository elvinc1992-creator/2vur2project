-- Mövzu: Rasional kəsrlər — 33 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- RSK-0001 | əsas: 2025 toplu, I hissə, səh.47 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='Kəsrlərin ixtisarı. DMQ çoxluğu'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{a}{4b^2}:\dfrac{a}{3b}\cdot\dfrac{a^2}{b}$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$\\dfrac{4a^2}{3b^2}$"}, {"key": "B", "text": "$\\dfrac{3}{4}$"}, {"key": "C", "text": "$\\dfrac{3a^2}{4b^2}$"}, {"key": "D", "text": "$\\dfrac{3}{4b}$"}, {"key": "E", "text": "$\\dfrac{3a}{4b}$"}]'::jsonb, 'C', NULL, NULL,
  '$\dfrac{a}{4b^2}\cdot\dfrac{3b}{a}\cdot\dfrac{a^2}{b}=\dfrac{3a^2b}{4b^3}=\dfrac{3a^2}{4b^2}$.',
  2025, 'I', 47, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0002 | əsas: 2025 toplu, I hissə, səh.47 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='Kəsrlərin ixtisarı. DMQ çoxluğu'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{x^2}{2y}\cdot\dfrac{y^2}{5x}:\dfrac{y}{3x}$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$\\dfrac{3x^2}{10}$"}, {"key": "B", "text": "$\\dfrac{3}{10}$"}, {"key": "C", "text": "$\\dfrac{3x^2}{10y}$"}, {"key": "D", "text": "$\\dfrac{3y}{10x^2}$"}, {"key": "E", "text": "$\\dfrac{10}{3x^2}$"}]'::jsonb, 'A', NULL, NULL,
  '$\dfrac{x^2}{2y}\cdot\dfrac{y^2}{5x}=\dfrac{xy}{10}$; $\dfrac{xy}{10}\cdot\dfrac{3x}{y}=\dfrac{3x^2}{10}$.',
  2025, 'I', 47, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0003 | əsas: 2025 toplu, I hissə, səh.47 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='Kəsrlərin ixtisarı. DMQ çoxluğu'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{9-y^2}{12+4y}$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$\\dfrac{y-3}{4}$"}, {"key": "B", "text": "$\\dfrac{3-y}{4}$"}, {"key": "C", "text": "$\\dfrac{y}{4}$"}, {"key": "D", "text": "$\\dfrac{3+y}{4}$"}, {"key": "E", "text": "$-\\dfrac{y}{4}$"}]'::jsonb, 'B', NULL, NULL,
  '$\dfrac{(3-y)(3+y)}{4(3+y)}=\dfrac{3-y}{4}$.',
  2025, 'I', 47, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0004 | əsas: 2025 toplu, I hissə, səh.47 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='Kəsrlərin ixtisarı. DMQ çoxluğu'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{k^2-36}{5k+30}$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$\\dfrac{k-5}{6}$"}, {"key": "B", "text": "$\\dfrac{k+6}{5}$"}, {"key": "C", "text": "$\\dfrac{6-k}{5}$"}, {"key": "D", "text": "$-\\dfrac{k+6}{5}$"}, {"key": "E", "text": "$\\dfrac{k-6}{5}$"}]'::jsonb, 'E', NULL, NULL,
  '$\dfrac{(k-6)(k+6)}{5(k+6)}=\dfrac{k-6}{5}$.',
  2025, 'I', 47, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0005 | əsas: 2025 toplu, I hissə, səh.48 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='Kəsrlərin ixtisarı. DMQ çoxluğu'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{(x+y)^2-3(x+y)}{x^2-6x+9-y^2}$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$\\dfrac{x+y}{x+y+3}$"}, {"key": "B", "text": "$\\dfrac{x+y}{x-y+3}$"}, {"key": "C", "text": "$\\dfrac{x+y}{x-y-3}$"}, {"key": "D", "text": "$\\dfrac{x-y}{x-y-3}$"}, {"key": "E", "text": "$\\dfrac{x-y}{x+y-3}$"}]'::jsonb, 'C', NULL, NULL,
  'Surət: $(x+y)(x+y-3)$. Məxrəc: $(x-3)^2-y^2=(x-3-y)(x-3+y)$. $(x+y-3)$ ilə ixtisar: $\dfrac{x+y}{x-y-3}$.',
  2025, 'I', 48, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0006 | əsas: 2025 toplu, I hissə, səh.48 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='Kəsrlərin ixtisarı. DMQ çoxluğu'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{(m-n)^2+7(m-n)}{m^2-2mn+n^2-49}$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$\\dfrac{m-n+7}{m-n-7}$"}, {"key": "B", "text": "$\\dfrac{m-n}{m-n-7}$"}, {"key": "C", "text": "$\\dfrac{1}{7}$"}, {"key": "D", "text": "$\\dfrac{m+n}{7}$"}, {"key": "E", "text": "$\\dfrac{m-n}{m-n+7}$"}]'::jsonb, 'B', NULL, NULL,
  'Surət: $(m-n)(m-n+7)$. Məxrəc: $(m-n)^2-49=(m-n-7)(m-n+7)$. Nəticə: $\dfrac{m-n}{m-n-7}$.',
  2025, 'I', 48, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0007 | əsas: 2025 toplu, I hissə, səh.49 №34
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0007', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='Kəsrlərin ixtisarı. DMQ çoxluğu'), 'original', 'own', 'az', 'draft', 'open',
  '$\dfrac{y^2-y-6}{y^2-b}$ rasional kəsrinin ixtisar olunması üçün $b$ parametrinin ala biləcəyi qiymətlərin cəmini tapın $(y\ne0)$.',
  NULL, NULL, NULL, '13',
  '$y^2-y-6=(y-3)(y+2)$. Kəsr ixtisar olunur, əgər $y^2-b$ ya $y=3$, ya da $y=-2$ olduqda sıfırdırsa: $b=9$ və ya $b=4$. ($b=0$ olduqda məxrəc $y^2$ olur və surətlə ortaq vuruğu yoxdur.) Cəm: $13$.',
  2025, 'I', 49, 34)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0008 | əsas: 2025 toplu, I hissə, səh.49 №35
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='Kəsrlərin ixtisarı. DMQ çoxluğu'), 'original', 'own', 'az', 'draft', 'open',
  '$\dfrac{y^2+2y-15}{y^2-b}$ rasional kəsrinin ixtisar olunması üçün $b$ parametrinin ala biləcəyi qiymətlərin cəmini tapın $(y\ne0)$.',
  NULL, NULL, NULL, '34',
  '$y^2+2y-15=(y-3)(y+5)$. $y^2-b$ ifadəsi $y=3$ və ya $y=-5$ olduqda sıfır olmalıdır: $b=9$ və ya $b=25$. Cəm: $34$.',
  2025, 'I', 49, 35)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0009 | əsas: 2025 toplu, I hissə, səh.49 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='İfadələrin sadələşdirilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$b\cdot\left(\dfrac{b}{b-3}+1\right):\left(b+\dfrac{b^2}{3-b}\right)$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$\\dfrac{2b-3}{3}$"}, {"key": "B", "text": "$b-3$"}, {"key": "C", "text": "$\\dfrac{2b+3}{3}$"}, {"key": "D", "text": "$3-b$"}, {"key": "E", "text": "$\\dfrac{3-2b}{3}$"}]'::jsonb, 'E', NULL, NULL,
  '$\dfrac{b}{b-3}+1=\dfrac{2b-3}{b-3}$; $b+\dfrac{b^2}{3-b}=\dfrac{3b-b^2+b^2}{3-b}=\dfrac{3b}{3-b}$. İfadə: $b\cdot\dfrac{2b-3}{b-3}\cdot\dfrac{3-b}{3b}=-\dfrac{2b-3}{3}=\dfrac{3-2b}{3}$.',
  2025, 'I', 49, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0010 | əsas: 2025 toplu, I hissə, səh.49 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='İfadələrin sadələşdirilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left(\dfrac{n}{n+2}-1\right):\left(n-\dfrac{n^2}{n+2}\right)$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$n$"}, {"key": "B", "text": "$-\\dfrac{2}{n}$"}, {"key": "C", "text": "$-\\dfrac{1}{n}$"}, {"key": "D", "text": "$\\dfrac{1}{n}$"}, {"key": "E", "text": "$-n$"}]'::jsonb, 'C', NULL, NULL,
  '$\dfrac{n}{n+2}-1=\dfrac{-2}{n+2}$; $n-\dfrac{n^2}{n+2}=\dfrac{n^2+2n-n^2}{n+2}=\dfrac{2n}{n+2}$. Nisbət: $\dfrac{-2}{n+2}\cdot\dfrac{n+2}{2n}=-\dfrac{1}{n}$.',
  2025, 'I', 49, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0011 | əsas: 2025 toplu, I hissə, səh.49 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0011', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='İfadələrin sadələşdirilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left(\dfrac{x+y}{x-y}+\dfrac{x-y}{x+y}\right):\dfrac{x^2+y^2}{x^2-y^2}$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$\\dfrac{1}{2}$"}, {"key": "C", "text": "$-2$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$xy$"}]'::jsonb, 'D', NULL, NULL,
  '$\dfrac{(x+y)^2+(x-y)^2}{x^2-y^2}=\dfrac{2(x^2+y^2)}{x^2-y^2}$. Bölsək: $\dfrac{2(x^2+y^2)}{x^2-y^2}\cdot\dfrac{x^2-y^2}{x^2+y^2}=2$.',
  2025, 'I', 49, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0012 | əsas: 2025 toplu, I hissə, səh.50 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0012', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='İfadələrin sadələşdirilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{1}{x-3}-\dfrac{2x+12}{x^3-27}-\dfrac{1}{x^2+3x+9}$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$\\dfrac{x^2}{x^3-27}$"}, {"key": "B", "text": "$\\dfrac{x}{x^3-27}$"}, {"key": "C", "text": "$\\dfrac{x^2-2}{x^3-27}$"}, {"key": "D", "text": "$\\dfrac{x^2+2}{x^3-27}$"}, {"key": "E", "text": "$\\dfrac{x^2}{x^3+27}$"}]'::jsonb, 'A', NULL, NULL,
  'Ortaq məxrəc $x^3-27=(x-3)(x^2+3x+9)$. Surət: $(x^2+3x+9)-(2x+12)-(x-3)=x^2$. Nəticə: $\dfrac{x^2}{x^3-27}$.',
  2025, 'I', 50, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0013 | əsas: 2025 toplu, I hissə, səh.50 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='İfadələrin sadələşdirilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{1}{b+1}+\dfrac{b-1}{b^2-b+1}-\dfrac{3}{b^3+1}$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$\\dfrac{2}{b+1}$"}, {"key": "B", "text": "$\\dfrac{b-3}{b^2-b+1}$"}, {"key": "C", "text": "$\\dfrac{2b-3}{b^2-b+1}$"}, {"key": "D", "text": "$\\dfrac{2b+3}{b^2-b+1}$"}, {"key": "E", "text": "$\\dfrac{2b-3}{b^3+1}$"}]'::jsonb, 'C', NULL, NULL,
  'Ortaq məxrəc $b^3+1=(b+1)(b^2-b+1)$. Surət: $(b^2-b+1)+(b-1)(b+1)-3=2b^2-b-3=(2b-3)(b+1)$. Nəticə: $\dfrac{(2b-3)(b+1)}{(b+1)(b^2-b+1)}=\dfrac{2b-3}{b^2-b+1}$.',
  2025, 'I', 50, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0014 | əsas: 2025 toplu, I hissə, səh.51 №30
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='İfadələrin sadələşdirilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{(0{,}a)^2-(0{,}b)^2}{a^2-b^2}$ ifadəsini sadələşdirin ($a,\ b$ — fərqli birrəqəmli natural ədədlərdir).',
  '[{"key": "A", "text": "$\\dfrac{1}{9}$"}, {"key": "B", "text": "$\\dfrac{1}{10}$"}, {"key": "C", "text": "$\\dfrac{1}{100}$"}, {"key": "D", "text": "$\\dfrac{1}{81}$"}, {"key": "E", "text": "$\\dfrac{1}{2}$"}]'::jsonb, 'C', NULL, NULL,
  '$0{,}a=\dfrac{a}{10}$, $0{,}b=\dfrac{b}{10}$. Surət: $\dfrac{a^2-b^2}{100}$. Nəticə: $\dfrac{1}{100}$.',
  2025, 'I', 51, 30)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0015 | əsas: 2025 toplu, I hissə, səh.51 №31
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0015', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='İfadələrin sadələşdirilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{0{,}(a)+0{,}(b)}{a+b}$ ifadəsini sadələşdirin ($a,\ b$ — birrəqəmli natural ədədlərdir).',
  '[{"key": "A", "text": "$\\dfrac{1}{3}$"}, {"key": "B", "text": "$\\dfrac{1}{81}$"}, {"key": "C", "text": "$\\dfrac{1}{99}$"}, {"key": "D", "text": "$\\dfrac{1}{9}$"}, {"key": "E", "text": "$\\dfrac{1}{10}$"}]'::jsonb, 'D', NULL, NULL,
  '$0{,}(a)=\dfrac{a}{9}$, $0{,}(b)=\dfrac{b}{9}$. Cəm: $\dfrac{a+b}{9}$; $a+b$-yə bölsək: $\dfrac{1}{9}$.',
  2025, 'I', 51, 31)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0016 | əsas: 2025 toplu, I hissə, səh.51 №38
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='İfadələrin sadələşdirilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$x^2+5=2ax$ olarsa, $\dfrac{x^2}{25}+\dfrac{1}{x^2}$ ifadəsinin qiymətini tapın.',
  '[{"key": "A", "text": "$\\dfrac{4a^2-10}{25}$"}, {"key": "B", "text": "$\\dfrac{4a^2-10}{5}$"}, {"key": "C", "text": "$\\dfrac{4a^2-5}{25}$"}, {"key": "D", "text": "$\\dfrac{4a^2+10}{25}$"}, {"key": "E", "text": "$\\dfrac{2a^2-10}{25}$"}]'::jsonb, 'A', NULL, NULL,
  'Bərabərliyi $5x$-ə bölək: $\dfrac{x}{5}+\dfrac{1}{x}=\dfrac{2a}{5}$. Kvadrata yüksəldək: $\dfrac{x^2}{25}+2\cdot\dfrac{1}{5}+\dfrac{1}{x^2}=\dfrac{4a^2}{25}$. Buradan $\dfrac{x^2}{25}+\dfrac{1}{x^2}=\dfrac{4a^2}{25}-\dfrac{2}{5}=\dfrac{4a^2-10}{25}$.',
  2025, 'I', 51, 38)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0017 | əsas: 2025 toplu, I hissə, səh.52 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='İfadələrin ədədi qiymətlərinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$a=-3{,}5$ olduqda $\dfrac{a^2+a-20}{16-a^2}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$1{,}5$"}, {"key": "B", "text": "$-1{,}5$"}, {"key": "C", "text": "$-2$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$-3$"}]'::jsonb, 'E', NULL, NULL,
  '$\dfrac{(a+5)(a-4)}{(4-a)(4+a)}=-\dfrac{a+5}{a+4}$. $a=-3{,}5$: $-\dfrac{1{,}5}{0{,}5}=-3$.',
  2025, 'I', 52, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0018 | əsas: 2025 toplu, I hissə, səh.52 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='İfadələrin ədədi qiymətlərinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$a=-3{,}8$ olduqda $\dfrac{a^2-a-12}{16-a^2}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$-0{,}2$"}, {"key": "B", "text": "$4$"}, {"key": "C", "text": "$-1$"}, {"key": "D", "text": "$-4$"}, {"key": "E", "text": "$1$"}]'::jsonb, 'B', NULL, NULL,
  '$\dfrac{(a-4)(a+3)}{(4-a)(4+a)}=-\dfrac{a+3}{a+4}$. $a=-3{,}8$: $a+3=-0{,}8$, $a+4=0{,}2$; $-\dfrac{-0{,}8}{0{,}2}=4$.',
  2025, 'I', 52, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0019 | əsas: 2025 toplu, I hissə, səh.52 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='İfadələrin ədədi qiymətlərinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$x=444$ və $y=111$ olduqda, $\dfrac{(x+y)^2-4xy}{(x-y)^2+4xy}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$\\dfrac{3}{5}$"}, {"key": "B", "text": "$\\dfrac{5}{3}$"}, {"key": "C", "text": "$\\dfrac{1}{25}$"}, {"key": "D", "text": "$\\dfrac{25}{9}$"}, {"key": "E", "text": "$\\dfrac{9}{25}$"}]'::jsonb, 'E', NULL, NULL,
  '$(x+y)^2-4xy=(x-y)^2$, $(x-y)^2+4xy=(x+y)^2$. İfadə: $\left(\dfrac{x-y}{x+y}\right)^2=\left(\dfrac{333}{555}\right)^2=\left(\dfrac{3}{5}\right)^2=\dfrac{9}{25}$.',
  2025, 'I', 52, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0020 | əsas: 2025 toplu, I hissə, səh.52 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='İfadələrin ədədi qiymətlərinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$x=555$ və $y=111$ olduqda, $\dfrac{(x-y)^2+4xy}{(x+y)^2-4xy}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$\\dfrac{3}{2}$"}, {"key": "B", "text": "$\\dfrac{4}{9}$"}, {"key": "C", "text": "$\\dfrac{2}{3}$"}, {"key": "D", "text": "$\\dfrac{9}{4}$"}, {"key": "E", "text": "$9$"}]'::jsonb, 'D', NULL, NULL,
  'İfadə $\dfrac{(x+y)^2}{(x-y)^2}=\left(\dfrac{666}{444}\right)^2=\left(\dfrac{3}{2}\right)^2=\dfrac{9}{4}$.',
  2025, 'I', 52, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0021 | əsas: 2025 toplu, I hissə, səh.52 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='İfadələrin ədədi qiymətlərinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$b^2+\dfrac{1}{b^2}-34=0$ olduqda $\left|b+\dfrac{1}{b}\right|$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$\\sqrt{32}$"}, {"key": "B", "text": "$\\sqrt{34}$"}, {"key": "C", "text": "$4\\sqrt{2}$"}, {"key": "D", "text": "$6$"}, {"key": "E", "text": "$36$"}]'::jsonb, 'D', NULL, NULL,
  '$\left(b+\dfrac{1}{b}\right)^2=b^2+\dfrac{1}{b^2}+2=36$, deməli $\left|b+\dfrac{1}{b}\right|=6$.',
  2025, 'I', 52, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0022 | əsas: 2025 toplu, I hissə, səh.52 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='İfadələrin ədədi qiymətlərinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$b^2+\dfrac{1}{b^2}=7$ olduqda, $\left|b+\dfrac{1}{b}\right|$-ni hesablayın.',
  '[{"key": "A", "text": "$\\sqrt{11}$"}, {"key": "B", "text": "$3$"}, {"key": "C", "text": "$\\sqrt{5}$"}, {"key": "D", "text": "$\\sqrt{7}$"}, {"key": "E", "text": "$9$"}]'::jsonb, 'B', NULL, NULL,
  '$\left(b+\dfrac{1}{b}\right)^2=7+2=9\Rightarrow\left|b+\dfrac{1}{b}\right|=3$.',
  2025, 'I', 52, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0023 | əsas: 2025 toplu, I hissə, səh.52 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='İfadələrin ədədi qiymətlərinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$x^2+\dfrac{1}{x^2}=3$ olarsa, $x^6+\dfrac{1}{x^6}$ ifadəsinin qiymətini tapın.',
  '[{"key": "A", "text": "$18$"}, {"key": "B", "text": "$24$"}, {"key": "C", "text": "$21$"}, {"key": "D", "text": "$27$"}, {"key": "E", "text": "$9$"}]'::jsonb, 'A', NULL, NULL,
  '$t=x^2+\dfrac{1}{x^2}=3$ olsun. $t^3=x^6+\dfrac{1}{x^6}+3\left(x^2+\dfrac{1}{x^2}\right)$, yəni $x^6+\dfrac{1}{x^6}=t^3-3t=27-9=18$.',
  2025, 'I', 52, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0024 | əsas: 2025 toplu, I hissə, səh.52 №19
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='İfadələrin ədədi qiymətlərinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left(b+\dfrac{1}{b}\right)^2=13$ olarsa, $\left(b-\dfrac{1}{b}\right)^2$ ifadəsinin qiymətini tapın.',
  '[{"key": "A", "text": "$9$"}, {"key": "B", "text": "$17$"}, {"key": "C", "text": "$\\sqrt{13}$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$11$"}]'::jsonb, 'A', NULL, NULL,
  '$\left(b-\dfrac{1}{b}\right)^2=\left(b+\dfrac{1}{b}\right)^2-4=13-4=9$.',
  2025, 'I', 52, 19)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0025 | əsas: 2025 toplu, I hissə, səh.53 №39
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0025', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='İfadələrin ədədi qiymətlərinin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$a+b-c=0,\ abc\ne0$ olarsa, $\dfrac{15abc}{a^3+b^3-c^3}$ ifadəsinin qiymətini tapın.',
  '[{"key": "A", "text": "$15$"}, {"key": "B", "text": "$-5$"}, {"key": "C", "text": "$-3$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$5$"}]'::jsonb, 'B', NULL, NULL,
  '$a+b+(-c)=0$ olduqda $a^3+b^3+(-c)^3=3ab(-c)=-3abc$. Onda $\dfrac{15abc}{-3abc}=-5$.',
  2025, 'I', 53, 39)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0026 | əsas: 2025 toplu, I hissə, səh.54 №44
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='İfadələrin ədədi qiymətlərinin tapılması'), 'original', 'own', 'az', 'draft', 'open',
  '$a+\dfrac{1}{a}=5$ olduğunu bilərək $a^2+\dfrac{1}{a^2}$ ifadəsinin qiymətini hesablayın.',
  NULL, NULL, NULL, '23',
  '$\left(a+\dfrac{1}{a}\right)^2=a^2+2+\dfrac{1}{a^2}=25\Rightarrow a^2+\dfrac{1}{a^2}=23$.',
  2025, 'I', 54, 44)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0027 | əsas: 2025 toplu, I hissə, səh.54 №57
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0027', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='İfadələrin ədədi qiymətlərinin tapılması'), 'original', 'own', 'az', 'draft', 'open',
  '$a$ və $b$ parametrləri üçün dəyişənin mümkün qiymətlər çoxluğunda $\dfrac{5x^2-5x}{x^3-4x^2-x+4}=\dfrac{a}{x-4}+\dfrac{b}{x+1}$ bərabərliyi həmişə ödənərsə, $a-b$ fərqini tapın.',
  NULL, NULL, NULL, '3',
  'Məxrəc: $x^3-4x^2-x+4=x^2(x-4)-(x-4)=(x-4)(x-1)(x+1)$. Surət: $5x(x-1)$. İxtisardan sonra: $\dfrac{5x}{(x-4)(x+1)}$. $5x=a(x+1)+b(x-4)$: $x=4$ olduqda $20=5a\Rightarrow a=4$; $x=-1$ olduqda $-5=-5b\Rightarrow b=1$. $a-b=3$.',
  2025, 'I', 54, 57)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0028 | əsas: 2025 toplu, I hissə, səh.54 №59
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0028', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='İfadələrin ədədi qiymətlərinin tapılması'), 'original', 'own', 'az', 'draft', 'open',
  '$x^2-5x+1=0$ olarsa, $x+x^2+\dfrac{1}{x}+\dfrac{1}{x^2}$ ifadəsinin qiymətini tapın.',
  NULL, NULL, NULL, '28',
  '$x\ne0$; bərabərliyi $x$-ə bölək: $x+\dfrac{1}{x}=5$. Onda $x^2+\dfrac{1}{x^2}=25-2=23$. Cəm: $5+23=28$.',
  2025, 'I', 54, 59)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0029 | əsas: 2025 toplu, I hissə, səh.54 №60
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0029', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='İfadələrin ədədi qiymətlərinin tapılması'), 'original', 'own', 'az', 'draft', 'open',
  '$x^2-6x+1=0$ olarsa, $x+x^2+\dfrac{1}{x}+\dfrac{1}{x^2}$ ifadəsinin qiymətini tapın.',
  NULL, NULL, NULL, '40',
  '$x+\dfrac{1}{x}=6$, $x^2+\dfrac{1}{x^2}=36-2=34$. Cəm: $6+34=40$.',
  2025, 'I', 54, 60)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0030 | əsas: 2025 toplu, I hissə, səh.55 №61
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0030', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='İfadələrin ədədi qiymətlərinin tapılması'), 'original', 'own', 'az', 'draft', 'open',
  '$b=12$ olarsa, $\dfrac{b^4+4}{b^2-2b+2}$ kəsrinin qiymətini hesablayın.',
  NULL, NULL, NULL, '170',
  '$b^4+4=b^4+4b^2+4-4b^2=(b^2+2)^2-(2b)^2=(b^2-2b+2)(b^2+2b+2)$. Kəsr: $b^2+2b+2=144+24+2=170$.',
  2025, 'I', 55, 61)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0031 | əsas: 2025 toplu, I hissə, səh.55 №65
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0031', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Rasional kəsrlər' AND s.title='İfadələrin ədədi qiymətlərinin tapılması'), 'original', 'own', 'az', 'draft', 'written',
  '$a$ parametrinin müəyyən qiymətləri üçün $\dfrac{ax^2-2ax+5x-4a}{(x-1)(x-2)}$ ifadəsi ixtisar olunan rasional kəsrdir. İxtisardan sonra $x=3$ olduqda, ifadənin ala biləcəyi qiymətlərin cəmini tapın.',
  NULL, NULL, NULL, '13,25',
  'Kəsr ixtisar olunur, əgər surət $x=1$ və ya $x=2$ olduqda sıfırdırsa. $x=1$: $a-2a+5-4a=5-5a=0\Rightarrow a=1$; onda surət $x^2+3x-4=(x-1)(x+4)$, kəsr $\dfrac{x+4}{x-2}$, $x=3$-də $7$. $x=2$: $4a-4a+10-4a=10-4a=0\Rightarrow a=2{,}5$; surət $2{,}5x^2-10=2{,}5(x-2)(x+2)$, kəsr $\dfrac{2{,}5(x+2)}{x-1}$, $x=3$-də $\dfrac{12{,}5}{2}=6{,}25$. Cəm: $7+6{,}25=13{,}25$.',
  2025, 'I', 55, 65)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0032 | əsas: 2025 toplu, I hissə, səh.16 №35
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0032', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), NULL, 'original', 'own', 'az', 'draft', 'written',
  '$n$ natural ədədinin hansı qiymətlərində $0<\dfrac{5n-17}{4n-3}<1$ olur? Bu qiymətlərin cəmini tapın.',
  NULL, NULL, NULL, '85',
  '$n\ge1$ olduğundan $4n-3>0$. Onda şərt $0<5n-17<4n-3$ deməkdir: $5n>17\Rightarrow n\ge4$; $5n-17<4n-3\Rightarrow n<14$. $n\in\{4;5;\dots;13\}$, cəm: $\dfrac{(4+13)\cdot10}{2}=85$.',
  2025, 'I', 16, 35)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- RSK-0033 | əsas: 2025 toplu, I hissə, səh.16 №36
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('RSK-0033', NULL, NULL, (SELECT id FROM topics WHERE name='Rasional kəsrlər'), NULL, 'original', 'own', 'az', 'draft', 'written',
  '$n$ natural ədədinin hansı qiymətlərində $0<\dfrac{3n-10}{2n-1}<1$ olur? Bu qiymətlərin cəmini tapın.',
  NULL, NULL, NULL, '30',
  '$2n-1>0$. Şərt: $0<3n-10<2n-1$: $3n>10\Rightarrow n\ge4$; $n<9$. $n\in\{4;5;6;7;8\}$, cəm $30$.',
  2025, 'I', 16, 36)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
