-- Mövzu: Birməchullu tənliklər və məsələlər — 53 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- BTM-0001 | əsas: 2025 toplu, I hissə, səh.70 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Kvadrat tənliklər və onların araşdırılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$ax^2+6x+4=0$ tənliyinin həqiqi kökləri hasilinin tam ədəd olması üçün $a$ parametrinin ala biləcəyi tam qiymətlərin cəmini tapın.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$3$"}, {"key": "C", "text": "$-8$"}, {"key": "D", "text": "$0$"}, {"key": "E", "text": "$-4$"}]'::jsonb, 'E', NULL, NULL,
  'Kvadrat tənlik üçün $a\ne0$; həqiqi köklər üçün $D=36-16a\ge0$, yəni $a\le2{,}25$. Hasil $x_1x_2=\dfrac{4}{a}$ tam olmalıdır: $a\in\{\pm1;\pm2;\pm4\}$. $a\le2{,}25$ şərti ilə: $1;\ 2;\ -1;\ -2;\ -4$. Cəm: $-4$.',
  2025, 'I', 70, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0002 | əsas: 2025 toplu, I hissə, səh.70 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Kvadrat tənliklər və onların araşdırılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$c$ parametrinin hansı qiymətində $3x^2-12x+c=0$ tənliyinin həqiqi köklərinin hasili ən böyük qiymət alır?',
  '[{"key": "A", "text": "$6$"}, {"key": "B", "text": "$36$"}, {"key": "C", "text": "$12$"}, {"key": "D", "text": "$9$"}, {"key": "E", "text": "$4$"}]'::jsonb, 'C', NULL, NULL,
  'Həqiqi köklər üçün $D=144-12c\ge0\Rightarrow c\le12$. Köklərin hasili $\dfrac{c}{3}$ — $c$ artdıqca artır, ən böyük qiyməti $c=12$ olduqda alınır.',
  2025, 'I', 70, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0003 | əsas: 2025 toplu, I hissə, səh.70 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Kvadrat tənliklər və onların araşdırılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$a$ parametrinin hansı qiymətində $x^2+ax+3=0$ və $x^2+3x+a=0$ tənliklərinin ortaq həqiqi kökü var?',
  '[{"key": "A", "text": "$-4$"}, {"key": "B", "text": "$3$"}, {"key": "C", "text": "$-3$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$1$"}]'::jsonb, 'A', NULL, NULL,
  'Tənlikləri çıxaq: $(a-3)x+(3-a)=0\Rightarrow(a-3)(x-1)=0$. $a=3$ olduqda hər iki tənlik $x^2+3x+3=0$ olur və həqiqi kökü yoxdur. Deməli $x=1$ ortaq kökdür: $1+a+3=0\Rightarrow a=-4$.',
  2025, 'I', 70, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0004 | əsas: 2025 toplu, I hissə, səh.70 №34
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Kvadrat tənliklər və onların araşdırılması'), 'original', 'own', 'az', 'draft', 'open',
  '$x^2-6px+p^2+8p+3=0$ tənliyinin iki bərabər kökünün olması üçün $p$ parametrinin ala biləcəyi qiymətlərin cəmini tapın.',
  NULL, NULL, NULL, '1',
  'Bərabər köklər üçün $\dfrac{D}{4}=9p^2-(p^2+8p+3)=8p^2-8p-3=0$. Bu tənliyin diskriminantı müsbətdir ($64+96>0$), Viyet teoreminə görə köklərinin cəmi $\dfrac{8}{8}=1$.',
  2025, 'I', 70, 34)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0005 | əsas: 2025 toplu, I hissə, səh.70 №35
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Kvadrat tənliklər və onların araşdırılması'), 'original', 'own', 'az', 'draft', 'open',
  '$x^2+4px+2p^2+6p-1=0$ tənliyinin iki bərabər kökünün olması üçün $p$ parametrinin ala biləcəyi qiymətlərin cəmini tapın.',
  NULL, NULL, NULL, '3',
  '$\dfrac{D}{4}=4p^2-(2p^2+6p-1)=2p^2-6p+1=0$. Diskriminant $36-8>0$; köklərin cəmi $\dfrac{6}{2}=3$.',
  2025, 'I', 70, 35)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0006 | əsas: 2025 toplu, I hissə, səh.72 №19
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Viyet teoremi və onun tərsi olan teorem'), 'original', 'own', 'az', 'draft', 'closed',
  '$x^2+5x+k^2-9k+20=0$ tənliyinin kökləri hasilini sıfıra çevirən $k$ parametrinin qiymətləri cəmini tapın.',
  '[{"key": "A", "text": "$-9$"}, {"key": "B", "text": "$5$"}, {"key": "C", "text": "$20$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$9$"}]'::jsonb, 'E', NULL, NULL,
  'Viyet teoreminə görə $x_1x_2=k^2-9k+20=0\Rightarrow k\in\{4;5\}$. Hər iki halda tənlik $x^2+5x=0$ olur və həqiqi kökləri var. Cəm: $9$.',
  2025, 'I', 72, 19)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0007 | əsas: 2025 toplu, I hissə, səh.72 №20
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0007', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Viyet teoremi və onun tərsi olan teorem'), 'original', 'own', 'az', 'draft', 'closed',
  '$x^2-4x+k^2+3k-10=0$ tənliyinin kökləri hasilini sıfıra çevirən $k$ parametrinin qiymətləri cəmini tapın.',
  '[{"key": "A", "text": "$-3$"}, {"key": "B", "text": "$3$"}, {"key": "C", "text": "$-10$"}, {"key": "D", "text": "$-7$"}, {"key": "E", "text": "$7$"}]'::jsonb, 'A', NULL, NULL,
  '$k^2+3k-10=0\Rightarrow k\in\{2;-5\}$ (tənlik $x^2-4x=0$, kökləri var). Cəm: $-3$.',
  2025, 'I', 72, 20)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0008 | əsas: 2025 toplu, I hissə, səh.72 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Viyet teoremi və onun tərsi olan teorem'), 'original', 'own', 'az', 'draft', 'closed',
  '$x^2-5x+3=0$ tənliyin köklərinin kubları cəmini tapın.',
  '[{"key": "A", "text": "$80$"}, {"key": "B", "text": "$95$"}, {"key": "C", "text": "$35$"}, {"key": "D", "text": "$-80$"}, {"key": "E", "text": "$125$"}]'::jsonb, 'A', NULL, NULL,
  '$x_1+x_2=5$, $x_1x_2=3$. $x_1^3+x_2^3=(x_1+x_2)^3-3x_1x_2(x_1+x_2)=125-45=80$.',
  2025, 'I', 72, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0009 | əsas: 2025 toplu, I hissə, səh.72 №29
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Viyet teoremi və onun tərsi olan teorem'), 'original', 'own', 'az', 'draft', 'closed',
  '$x^2-3x-2=0$ tənliyin köklərinin kubları cəmini tapın.',
  '[{"key": "A", "text": "$33$"}, {"key": "B", "text": "$-45$"}, {"key": "C", "text": "$45$"}, {"key": "D", "text": "$27$"}, {"key": "E", "text": "$9$"}]'::jsonb, 'C', NULL, NULL,
  '$x_1+x_2=3$, $x_1x_2=-2$. $27-3\cdot(-2)\cdot3=27+18=45$.',
  2025, 'I', 72, 29)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0010 | əsas: 2025 toplu, I hissə, səh.72 №30
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Viyet teoremi və onun tərsi olan teorem'), 'original', 'own', 'az', 'draft', 'closed',
  'Kökləri $x^2+4x-2=0$ tənliyinin köklərinin kvadratları olan çevrilmiş kvadrat tənliyi tərtib edin.',
  '[{"key": "A", "text": "$x^2-16x+4=0$"}, {"key": "B", "text": "$x^2-12x+4=0$"}, {"key": "C", "text": "$x^2+20x+4=0$"}, {"key": "D", "text": "$x^2-20x+4=0$"}, {"key": "E", "text": "$x^2-20x-4=0$"}]'::jsonb, 'D', NULL, NULL,
  '$x_1+x_2=-4$, $x_1x_2=-2$. Yeni köklər üçün: $x_1^2+x_2^2=16+4=20$, $x_1^2x_2^2=4$. Tənlik: $x^2-20x+4=0$.',
  2025, 'I', 72, 30)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0011 | əsas: 2025 toplu, I hissə, səh.72 №31
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0011', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Viyet teoremi və onun tərsi olan teorem'), 'original', 'own', 'az', 'draft', 'closed',
  'Kökləri $x^2-3x+1=0$ tənliyinin köklərinin kvadratları olan çevrilmiş kvadrat tənliyi tərtib edin.',
  '[{"key": "A", "text": "$x^2-11x+1=0$"}, {"key": "B", "text": "$x^2-7x+1=0$"}, {"key": "C", "text": "$x^2-7x-1=0$"}, {"key": "D", "text": "$x^2+7x+1=0$"}, {"key": "E", "text": "$x^2-9x+1=0$"}]'::jsonb, 'B', NULL, NULL,
  '$x_1+x_2=3$, $x_1x_2=1$: $x_1^2+x_2^2=9-2=7$, $x_1^2x_2^2=1$. Tənlik: $x^2-7x+1=0$.',
  2025, 'I', 72, 31)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0012 | əsas: 2025 toplu, I hissə, səh.73 №45
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0012', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Viyet teoremi və onun tərsi olan teorem'), 'original', 'own', 'az', 'draft', 'closed',
  '$m$ parametrinin hansı qiymətlərində $x^2+6x+m^2-8=0$ tənliyinin kökləri qarşılıqlı tərs ədədlərdir?',
  '[{"key": "A", "text": "$3$"}, {"key": "B", "text": "$0$"}, {"key": "C", "text": "$\\pm1$"}, {"key": "D", "text": "$\\pm3$"}, {"key": "E", "text": "$\\pm2\\sqrt2$"}]'::jsonb, 'D', NULL, NULL,
  'Qarşılıqlı tərs köklər üçün $x_1x_2=1$: $m^2-8=1\Rightarrow m=\pm3$. Bu halda tənlik $x^2+6x+1=0$, $D=36-4>0$ — iki həqiqi kök var.',
  2025, 'I', 73, 45)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0013 | əsas: 2025 toplu, I hissə, səh.73 №46
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Viyet teoremi və onun tərsi olan teorem'), 'original', 'own', 'az', 'draft', 'closed',
  '$m$ parametrinin hansı qiymətlərində $x^2+9x+m^2-15=0$ tənliyinin kökləri qarşılıqlı tərs ədədlərdir?',
  '[{"key": "A", "text": "$-4$"}, {"key": "B", "text": "$\\pm16$"}, {"key": "C", "text": "$\\pm\\sqrt{15}$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$\\pm4$"}]'::jsonb, 'E', NULL, NULL,
  '$m^2-15=1\Rightarrow m=\pm4$; tənlik $x^2+9x+1=0$, $D=81-4>0$.',
  2025, 'I', 73, 46)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0014 | əsas: 2025 toplu, I hissə, səh.73 №51
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Viyet teoremi və onun tərsi olan teorem'), 'original', 'own', 'az', 'draft', 'closed',
  '$x^2+3x-5=0$ tənliyinin kökləri $x_1$ və $x_2$ $(x_1>x_2)$ olarsa, $\dfrac{|x_1|}{x_2}-\dfrac{|x_2|}{x_1}$ ifadəsinin qiymətini tapın.',
  '[{"key": "A", "text": "$\\dfrac{1}{5}$"}, {"key": "B", "text": "$-\\dfrac{19}{5}$"}, {"key": "C", "text": "$\\dfrac{19}{5}$"}, {"key": "D", "text": "$-\\dfrac{1}{5}$"}, {"key": "E", "text": "$-\\dfrac{9}{5}$"}]'::jsonb, 'B', NULL, NULL,
  '$x_1x_2=-5<0$, köklər müxtəlif işarəlidir: $x_1>0>x_2$. $|x_1|=x_1$, $|x_2|=-x_2$. İfadə: $\dfrac{x_1}{x_2}+\dfrac{x_2}{x_1}=\dfrac{x_1^2+x_2^2}{x_1x_2}=\dfrac{9+10}{-5}=-\dfrac{19}{5}$.',
  2025, 'I', 73, 51)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0015 | əsas: 2025 toplu, I hissə, səh.73 №52
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0015', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Viyet teoremi və onun tərsi olan teorem'), 'original', 'own', 'az', 'draft', 'closed',
  '$x^2+4x-2=0$ tənliyinin kökləri $x_1$ və $x_2$ $(x_1<x_2)$ olarsa, $\dfrac{|x_1|}{x_2}-\dfrac{|x_2|}{x_1}$ ifadəsinin qiymətini tapın.',
  '[{"key": "A", "text": "$9$"}, {"key": "B", "text": "$8$"}, {"key": "C", "text": "$-10$"}, {"key": "D", "text": "$10$"}, {"key": "E", "text": "$-9$"}]'::jsonb, 'D', NULL, NULL,
  '$x_1<0<x_2$. $|x_1|=-x_1$, $|x_2|=x_2$: $-\dfrac{x_1}{x_2}-\dfrac{x_2}{x_1}=-\dfrac{x_1^2+x_2^2}{x_1x_2}=-\dfrac{16+4}{-2}=10$.',
  2025, 'I', 73, 52)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0016 | əsas: 2025 toplu, I hissə, səh.73 №57
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Viyet teoremi və onun tərsi olan teorem'), 'original', 'own', 'az', 'draft', 'open',
  '$x^2+bx+6-4b=0$ tənliyinin kökləri hasili kökləri cəminin üç mislinə bərabərdir. $b$-ni tapın.',
  NULL, NULL, NULL, '6',
  'Viyet: $x_1+x_2=-b$, $x_1x_2=6-4b$. Şərt: $6-4b=-3b\Rightarrow b=6$. Yoxlama: $x^2+6x-18=0$, $D>0$.',
  2025, 'I', 73, 57)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0017 | əsas: 2025 toplu, I hissə, səh.73 №58
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Viyet teoremi və onun tərsi olan teorem'), 'original', 'own', 'az', 'draft', 'open',
  '$x^2+bx+4b-9=0$ tənliyinin köklərinin hasili köklərinin cəminin iki mislinə bərabərdir. $b$-ni tapın.',
  NULL, NULL, NULL, '1,5',
  '$4b-9=-2b\Rightarrow b=1{,}5$. Yoxlama: $x^2+1{,}5x-3=0$, $D=2{,}25+12>0$.',
  2025, 'I', 73, 58)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0018 | əsas: 2025 toplu, I hissə, səh.73 №60
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Viyet teoremi və onun tərsi olan teorem'), 'original', 'own', 'az', 'draft', 'open',
  '$x^2+8x+q=0$ tənliyinin köklərinin kvadratları cəmi $34$ olarsa, $q$-nü tapın.',
  NULL, NULL, NULL, '15',
  '$x_1^2+x_2^2=(x_1+x_2)^2-2x_1x_2=64-2q=34\Rightarrow q=15$. Yoxlama: $D=64-60>0$.',
  2025, 'I', 73, 60)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0019 | əsas: 2025 toplu, I hissə, səh.73 №61
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Viyet teoremi və onun tərsi olan teorem'), 'original', 'own', 'az', 'draft', 'open',
  '$x^2-10x+q=0$ tənliyinin köklərinin kvadratları cəmi $58$ olarsa, $q$-nü tapın.',
  NULL, NULL, NULL, '21',
  '$100-2q=58\Rightarrow q=21$. Yoxlama: $D=100-84>0$.',
  2025, 'I', 73, 61)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0020 | əsas: 2025 toplu, I hissə, səh.74 №74
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Viyet teoremi və onun tərsi olan teorem'), 'original', 'own', 'az', 'draft', 'written',
  'Cədvəldən $m+n$ cəmini tapın.

$$\begin{array}{|c|c|c|}\hline & \text{Tənlik} & \text{Kökləri}\\\hline \text{I tənlik} & x^2-(2m+n)x+(m-n)=0 & x_1;\ x_2\\\hline \text{II tənlik} & x^2-(m+2n)x+7=0 & x_1+1;\ x_2+1\\\hline\end{array}$$',
  NULL, NULL, NULL, '6',
  'I tənlik üçün Viyet: $x_1+x_2=2m+n$, $x_1x_2=m-n$. II tənlik üçün: $(x_1+1)+(x_2+1)=m+2n$ və $(x_1+1)(x_2+1)=7$. Birincidən: $2m+n+2=m+2n\Rightarrow n=m+2$. İkincidən: $x_1x_2+(x_1+x_2)+1=7\Rightarrow(m-n)+(2m+n)=6\Rightarrow3m=6\Rightarrow m=2$, $n=4$. Yoxlama: I tənlik $x^2-8x-2=0$ ($D>0$), II tənlik $x^2-10x+7=0$. Cavab: $m+n=6$.',
  2025, 'I', 74, 74)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0021 | əsas: 2025 toplu, I hissə, səh.77 №19
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Modul işarəsi daxilində dəyişəni olan tənliklər. İrrasional tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$x-3=\sqrt{x-1}$ tənliyinin həqiqi köklərinin sayını tapın.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$2$"}, {"key": "C", "text": "yoxdur"}, {"key": "D", "text": "$1$"}, {"key": "E", "text": "$3$"}]'::jsonb, 'D', NULL, NULL,
  'Şərt: $x-3\ge0$, yəni $x\ge3$. Kvadrata yüksəldək: $x^2-6x+9=x-1\Rightarrow x^2-7x+10=0\Rightarrow x\in\{2;5\}$. $x=2$ şərti ödəmir. Yeganə kök $x=5$: $1$ kök.',
  2025, 'I', 77, 19)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0022 | əsas: 2025 toplu, I hissə, səh.77 №20
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Modul işarəsi daxilində dəyişəni olan tənliklər. İrrasional tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$x+2=\sqrt{5x+10}$ tənliyinin həqiqi köklərinin sayını tapın.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$1$"}, {"key": "C", "text": "yoxdur"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$2$"}]'::jsonb, 'E', NULL, NULL,
  'Şərt: $x\ge-2$. $(x+2)^2=5(x+2)\Rightarrow(x+2)(x+2-5)=0\Rightarrow x\in\{-2;3\}$. Hər ikisi şərti ödəyir (yoxlama: $0=0$ və $5=\sqrt{25}$). Cavab: $2$.',
  2025, 'I', 77, 20)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0023 | əsas: 2025 toplu, I hissə, səh.78 №47
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Modul işarəsi daxilində dəyişəni olan tənliklər. İrrasional tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt{2x+16}-\sqrt{x}=4$ tənliyinin köklərinin cəmini tapın.',
  '[{"key": "A", "text": "$0$"}, {"key": "B", "text": "$8$"}, {"key": "C", "text": "$64$"}, {"key": "D", "text": "$16$"}, {"key": "E", "text": "$72$"}]'::jsonb, 'C', NULL, NULL,
  '$\sqrt{2x+16}=4+\sqrt x$. Kvadrata yüksəldək: $2x+16=16+8\sqrt x+x\Rightarrow x=8\sqrt x\Rightarrow\sqrt x(\sqrt x-8)=0$. $x=0$ və $x=64$ — hər ikisi yoxlamadan keçir. Cəm: $64$.',
  2025, 'I', 78, 47)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0024 | əsas: 2025 toplu, I hissə, səh.78 №48
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Modul işarəsi daxilində dəyişəni olan tənliklər. İrrasional tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt{5x+9}-\sqrt{x}=3$ tənliyinin köklərinin cəmini tapın.',
  '[{"key": "A", "text": "$0$"}, {"key": "B", "text": "$9$"}, {"key": "C", "text": "$2{,}25$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$1{,}5$"}]'::jsonb, 'C', NULL, NULL,
  '$5x+9=9+6\sqrt x+x\Rightarrow4x=6\sqrt x\Rightarrow\sqrt x\,(2\sqrt x-3)=0$. $x=0$ və $x=2{,}25$. Cəm: $2{,}25$.',
  2025, 'I', 78, 48)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0025 | əsas: 2025 toplu, I hissə, səh.78 №49
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0025', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Modul işarəsi daxilində dəyişəni olan tənliklər. İrrasional tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{x(x-1)\left(x^2-9\right)}{\sqrt x-\sqrt3}=0$ tənliyinin neçə həqiqi kökü var?',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "yoxdur"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$1$"}]'::jsonb, 'A', NULL, NULL,
  'MQO: $x\ge0$ və $\sqrt x\ne\sqrt3$, yəni $x\ne3$. Surətin kökləri: $0;\ 1;\ 3;\ -3$. $x=3$ məxrəci sıfır edir, $x=-3$ MQO-ya daxil deyil. Köklər: $0$ və $1$ — $2$ kök.',
  2025, 'I', 78, 49)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0026 | əsas: 2025 toplu, I hissə, səh.78 №50
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Modul işarəsi daxilində dəyişəni olan tənliklər. İrrasional tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{x(x-4)\left(x^2-16\right)}{\sqrt x-2}=0$ tənliyinin neçə həqiqi kökü var?',
  '[{"key": "A", "text": "$3$"}, {"key": "B", "text": "yoxdur"}, {"key": "C", "text": "$4$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$1$"}]'::jsonb, 'E', NULL, NULL,
  'MQO: $x\ge0$, $x\ne4$. Surətin kökləri: $0;\ 4;\ -4$. Uyğun gələn yalnız $x=0$-dır: $1$ kök.',
  2025, 'I', 78, 50)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0027 | əsas: 2025 toplu, I hissə, səh.78 №53
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0027', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Modul işarəsi daxilində dəyişəni olan tənliklər. İrrasional tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt x+\sqrt{x+5}=5$ tənliyini həll edin.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$5$"}, {"key": "C", "text": "$9$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$1$"}]'::jsonb, 'A', NULL, NULL,
  '$\sqrt{x+5}=5-\sqrt x$. Kvadrata yüksəldək: $x+5=25-10\sqrt x+x\Rightarrow\sqrt x=2\Rightarrow x=4$. Yoxlama: $2+3=5$.',
  2025, 'I', 78, 53)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0028 | əsas: 2025 toplu, I hissə, səh.78 №54
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0028', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Modul işarəsi daxilində dəyişəni olan tənliklər. İrrasional tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt{x+12}-\sqrt{x+3}=1$ tənliyini həll edin.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$16$"}, {"key": "C", "text": "$13$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$9$"}]'::jsonb, 'C', NULL, NULL,
  '$\sqrt{x+12}=1+\sqrt{x+3}\Rightarrow x+12=1+2\sqrt{x+3}+x+3\Rightarrow\sqrt{x+3}=4\Rightarrow x=13$. Yoxlama: $5-4=1$.',
  2025, 'I', 78, 54)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0029 | əsas: 2025 toplu, I hissə, səh.79 №76
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0029', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Modul işarəsi daxilində dəyişəni olan tənliklər. İrrasional tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt{4x+\sqrt{1-x}}=1+2\sqrt x$ tənliyini həll edin.',
  '[{"key": "A", "text": "$0$"}, {"key": "B", "text": "$\\dfrac{1}{16}$"}, {"key": "C", "text": "$\\dfrac14$"}, {"key": "D", "text": "$\\varnothing$"}, {"key": "E", "text": "$1$"}]'::jsonb, 'A', NULL, NULL,
  'MQO: $0\le x\le1$. Kvadrata yüksəldək: $4x+\sqrt{1-x}=1+4\sqrt x+4x\Rightarrow\sqrt{1-x}=1+4\sqrt x$. Sol tərəf $\le1$, sağ tərəf $\ge1$; bərabərlik yalnız $\sqrt{1-x}=1$ və $\sqrt x=0$ olduqda, yəni $x=0$. Yoxlama: $\sqrt{0+1}=1$.',
  2025, 'I', 79, 76)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0030 | əsas: 2025 toplu, I hissə, səh.79 №77
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0030', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Modul işarəsi daxilində dəyişəni olan tənliklər. İrrasional tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt{4x-\sqrt{1-x}}=1-2\sqrt x$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\dfrac{8}{17}$"}, {"key": "B", "text": "$0$"}, {"key": "C", "text": "$\\dfrac{16}{289}$"}, {"key": "D", "text": "$\\dfrac14$"}, {"key": "E", "text": "$\\dfrac{64}{289}$"}]'::jsonb, 'E', NULL, NULL,
  'Şərt: $1-2\sqrt x\ge0\Rightarrow x\le\dfrac14$. Kvadrata yüksəldək: $4x-\sqrt{1-x}=1-4\sqrt x+4x\Rightarrow\sqrt{1-x}=4\sqrt x-1$ (burada $4\sqrt x-1\ge0$). $\sqrt x=t$: $1-t^2=16t^2-8t+1\Rightarrow17t^2=8t\Rightarrow t=\dfrac{8}{17}$ ($t=0$ uyğun deyil, çünki $4t-1<0$). $x=\dfrac{64}{289}$; yoxlama: $\sqrt{\dfrac{256}{289}-\dfrac{15}{17}}=\sqrt{\dfrac{1}{289}}=\dfrac{1}{17}$ və $1-\dfrac{16}{17}=\dfrac{1}{17}$.',
  2025, 'I', 79, 77)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0031 | əsas: 2025 toplu, I hissə, səh.80 №100
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0031', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Modul işarəsi daxilində dəyişəni olan tənliklər. İrrasional tənliklər'), 'original', 'own', 'az', 'draft', 'written',
  '$\left(1-\sqrt{1+\sqrt x}\right)\cdot\sqrt{1+\sqrt x}=3-\sqrt x$ tənliyini həll edin.',
  NULL, NULL, NULL, '225',
  '$t=\sqrt{1+\sqrt x}\ \ (t\ge1)$, onda $\sqrt x=t^2-1$. Tənlik: $(1-t)t=3-(t^2-1)\Rightarrow t-t^2=4-t^2\Rightarrow t=4$. $\sqrt x=15$, $x=225$. Yoxlama: $(1-4)\cdot4=-12$ və $3-15=-12$.',
  2025, 'I', 80, 100)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0032 | əsas: 2025 toplu, I hissə, səh.80 №101
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0032', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Modul işarəsi daxilində dəyişəni olan tənliklər. İrrasional tənliklər'), 'original', 'own', 'az', 'draft', 'written',
  '$\left(1+\sqrt{4-\sqrt x}\right)\cdot\sqrt{4-\sqrt x}=4-\sqrt x$ tənliyini həll edin.',
  NULL, NULL, NULL, '16',
  '$t=\sqrt{4-\sqrt x}\ \ (t\ge0)$, onda $4-\sqrt x=t^2$. Tənlik: $(1+t)t=t^2\Rightarrow t=0$. Deməli $\sqrt x=4$, $x=16$. Yoxlama: $(1+0)\cdot0=0=4-4$.',
  2025, 'I', 80, 101)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0033 | əsas: 2025 toplu, I hissə, səh.80 №104
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0033', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Modul işarəsi daxilində dəyişəni olan tənliklər. İrrasional tənliklər'), 'original', 'own', 'az', 'draft', 'open',
  '$(x-3)^2=3|x-3|+4$ tənliyinin böyük kökünü tapın.',
  NULL, NULL, NULL, '7',
  '$|x-3|=u\ge0$: $u^2-3u-4=0\Rightarrow u=4$ ($u=-1$ uyğun deyil). $|x-3|=4\Rightarrow x\in\{-1;7\}$. Böyük kök: $7$.',
  2025, 'I', 80, 104)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0034 | əsas: 2025 toplu, I hissə, səh.80 №105
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0034', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Modul işarəsi daxilində dəyişəni olan tənliklər. İrrasional tənliklər'), 'original', 'own', 'az', 'draft', 'open',
  '$p$ parametrinin hansı qiymətində $x^2-6|x|+5-p=0$ tənliyinin üç kökü var?',
  NULL, NULL, NULL, '5',
  'Tənlik $x\to-x$ əvəzlənməsinə görə dəyişmir, ona görə kökləri cüt-cüt əks işarəlidir. Köklərin sayı tək olması üçün $x=0$ kök olmalıdır: $5-p=0\Rightarrow p=5$. Onda $x^2-6|x|=0\Rightarrow x\in\{0;\pm6\}$ — üç kök.',
  2025, 'I', 80, 105)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0035 | əsas: 2025 toplu, I hissə, səh.80 №106
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0035', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Modul işarəsi daxilində dəyişəni olan tənliklər. İrrasional tənliklər'), 'original', 'own', 'az', 'draft', 'open',
  '$m$ parametrinin hansı qiymətində $x^2-2|x|+m+4=0$ tənliyinin üç kökü var?',
  NULL, NULL, NULL, '-4',
  'Üç kök üçün $x=0$ kök olmalıdır: $m+4=0\Rightarrow m=-4$. Onda $x^2-2|x|=0\Rightarrow x\in\{0;\pm2\}$.',
  2025, 'I', 80, 106)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0036 | əsas: 2025 toplu, I hissə, səh.80 №107
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0036', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Modul işarəsi daxilində dəyişəni olan tənliklər. İrrasional tənliklər'), 'original', 'own', 'az', 'draft', 'open',
  '$m$ parametrinin hansı qiymətlərində $x^2+\left(m^2-6m+5\right)|x|+m^2-5m+6=0$ tənliyinin üç kökü var? Bu qiymətlərin cəmini tapın.',
  NULL, NULL, NULL, '5',
  'Üç kök üçün $x=0$ kök olmalıdır: $m^2-5m+6=0\Rightarrow m\in\{2;3\}$. Onda tənlik $|x|\left(|x|+m^2-6m+5\right)=0$; ikinci vuruğun müsbət kökü olmalıdır: $m^2-6m+5<0$. $m=2$: $4-12+5=-3<0$ — köklər $0;\ \pm3$. $m=3$: $9-18+5=-4<0$ — köklər $0;\ \pm4$. Hər iki qiymət uyğundur, cəm: $5$.',
  2025, 'I', 80, 107)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0037 | əsas: 2025 toplu, I hissə, səh.80 №108
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0037', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Modul işarəsi daxilində dəyişəni olan tənliklər. İrrasional tənliklər'), 'original', 'own', 'az', 'draft', 'open',
  '$m$ parametrinin hansı qiymətində $x^2+\left(2m^2-7m-9\right)|x|+m^2-9m+20=0$ tənliyinin üç kökü var?',
  NULL, NULL, NULL, '4',
  '$x=0$ kök olmalıdır: $m^2-9m+20=0\Rightarrow m\in\{4;5\}$. Tənlik $|x|\left(|x|+2m^2-7m-9\right)=0$. $m=4$: $32-28-9=-5<0$ — köklər $0;\ \pm5$, üç kök. $m=5$: $50-35-9=6>0$ — yalnız $x=0$, bir kök. Cavab: $m=4$.',
  2025, 'I', 80, 108)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0038 | əsas: 2025 toplu, I hissə, səh.81 №114
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0038', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Modul işarəsi daxilində dəyişəni olan tənliklər. İrrasional tənliklər'), 'original', 'own', 'az', 'draft', 'matching',
  'Uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$|3x-2y|+\\sqrt{x-4}=0$ olarsa,"}, {"key": "2", "text": "$(x+3y)^2+|2x-6|=0$ olarsa,"}, {"key": "3", "text": "$(5x-10)^2+\\sqrt{2y+10}=0$ olarsa,"}], "right": [{"key": "a", "text": "$xy=24$"}, {"key": "b", "text": "$\\dfrac{x}{y}=-3$"}, {"key": "c", "text": "$x+y=-3$"}, {"key": "d", "text": "$x-y=4$"}, {"key": "e", "text": "$x+y=10$"}]}'::jsonb, NULL, '{"1": ["a", "e"], "2": ["b", "d"], "3": ["c"]}'::jsonb, NULL,
  'Qeyri-mənfi ifadələrin cəmi sıfırdırsa, hər biri sıfırdır. 1) $x=4$, $3\cdot4=2y\Rightarrow y=6$: $xy=24$, $x+y=10$. 2) $x=3$, $3+3y=0\Rightarrow y=-1$: $\dfrac{x}{y}=-3$, $x-y=4$. 3) $x=2$, $y=-5$: $x+y=-3$.',
  2025, 'I', 81, 114)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0039 | əsas: 2025 toplu, I hissə, səh.81 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0039', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Tənlik qurmaqla məsələlər həlli'), 'original', 'own', 'az', 'draft', 'closed',
  'Mağaza üçün $50$ ədəd müxtəlif həcmli iki növ çaydan alındı. Kiçik çaydan böyük çaydandan $2$ manat ucuzdur. Çaydanların hamısını satdıqdan sonra böyük çaydanların satışından $120$ manat, kiçik çaydanlardan isə $40$ manat əldə olunmuşdur. Kiçik çaydanın biri neçə manatdır?',
  '[{"key": "A", "text": "$1{,}5$ man"}, {"key": "B", "text": "$2{,}5$ man"}, {"key": "C", "text": "$3$ man"}, {"key": "D", "text": "$2$ man"}, {"key": "E", "text": "$4$ man"}]'::jsonb, 'D', NULL, NULL,
  'Kiçik çaydanın qiyməti $x$, böyüyünkü $x+2$ manat. Sayları: $\dfrac{40}{x}+\dfrac{120}{x+2}=50$. Məxrəcdən qurtaraq: $40(x+2)+120x=50x(x+2)\Rightarrow50x^2-60x-80=0\Rightarrow5x^2-6x-8=0$. $x=\dfrac{6\pm14}{10}$; müsbət kök $x=2$.',
  2025, 'I', 81, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0040 | əsas: 2025 toplu, I hissə, səh.81 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0040', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Tənlik qurmaqla məsələlər həlli'), 'original', 'own', 'az', 'draft', 'closed',
  'Oğlan iki növ dəftərdən $60$ ədəd aldı. Birinci növ dəftərlərə $30$ manat, ikinci növə isə $45$ manat verildi. Birinci növ dəftərin birinin qiyməti ikincidən $0{,}5$ manat ucuzdur. Birinci növ dəftərin biri neçə manatdır?',
  '[{"key": "A", "text": "$0{,}5$"}, {"key": "B", "text": "$1$"}, {"key": "C", "text": "$1{,}5$"}, {"key": "D", "text": "$1{,}25$"}, {"key": "E", "text": "$2$"}]'::jsonb, 'B', NULL, NULL,
  'Birinci növün qiyməti $x$, ikincinin $x+0{,}5$. $\dfrac{30}{x}+\dfrac{45}{x+0{,}5}=60\Rightarrow30x+15+45x=60x^2+30x\Rightarrow60x^2-45x-15=0\Rightarrow4x^2-3x-1=0$. $x=1$ (digər kök $-\dfrac14$ uyğun deyil).',
  2025, 'I', 81, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0041 | əsas: 2025 toplu, I hissə, səh.82 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0041', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Tənlik qurmaqla məsələlər həlli'), 'original', 'own', 'az', 'draft', 'closed',
  'Ata oğlundan $30$ yaş böyükdür və $6$ ildən sonra o, oğlundan $4$ dəfə böyük olacaq. Atanın neçə yaşı var?',
  '[{"key": "A", "text": "$28$"}, {"key": "B", "text": "$40$"}, {"key": "C", "text": "$36$"}, {"key": "D", "text": "$34$"}, {"key": "E", "text": "$30$"}]'::jsonb, 'D', NULL, NULL,
  'Oğulun yaşı $x$, atanınkı $x+30$. $x+36=4(x+6)\Rightarrow3x=12\Rightarrow x=4$. Atanın yaşı: $34$.',
  2025, 'I', 82, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0042 | əsas: 2025 toplu, I hissə, səh.82 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0042', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Tənlik qurmaqla məsələlər həlli'), 'original', 'own', 'az', 'draft', 'closed',
  'Üç ardıcıl natural ədəddən ilk ikisinin hasili üçüncünün $4$ mislindən $2$ vahid çoxdur. Bu ədədlərin ən böyüyünü tapın.',
  '[{"key": "A", "text": "$5$"}, {"key": "B", "text": "$7$"}, {"key": "C", "text": "$9$"}, {"key": "D", "text": "$6$"}, {"key": "E", "text": "$8$"}]'::jsonb, 'B', NULL, NULL,
  'Ədədlər $n,\ n+1,\ n+2$: $n(n+1)=4(n+2)+2\Rightarrow n^2-3n-10=0\Rightarrow n=5$ ($n=-2$ natural deyil). Ədədlər $5,6,7$; ən böyüyü $7$.',
  2025, 'I', 82, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0043 | əsas: 2025 toplu, I hissə, səh.82 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0043', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Tənlik qurmaqla məsələlər həlli'), 'original', 'own', 'az', 'draft', 'closed',
  'Üç ardıcıl cüt natural ədəddən ilk ikisinin kvadratları cəmi üçüncünün kvadratından $20$ vahid çoxdur. Bu ədədlərin ən böyüyünü tapın.',
  '[{"key": "A", "text": "$14$"}, {"key": "B", "text": "$12$"}, {"key": "C", "text": "$16$"}, {"key": "D", "text": "$8$"}, {"key": "E", "text": "$10$"}]'::jsonb, 'B', NULL, NULL,
  'Ədədlər $n,\ n+2,\ n+4$: $n^2+(n+2)^2=(n+4)^2+20\Rightarrow n^2-4n-32=0\Rightarrow n=8$. Ədədlər $8,10,12$; ən böyüyü $12$.',
  2025, 'I', 82, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0044 | əsas: 2025 toplu, I hissə, səh.82 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0044', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Tənlik qurmaqla məsələlər həlli'), 'original', 'own', 'az', 'draft', 'closed',
  'İki briqada bir evi birlikdə $4$ günə tikir. Birinci briqada bu evi təklikdə ikincidən $6$ gün tez tikə bilərsə, birinci briqada evi neçə günə tikə bilər?',
  '[{"key": "A", "text": "$12$"}, {"key": "B", "text": "$6$"}, {"key": "C", "text": "$10$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$8$"}]'::jsonb, 'B', NULL, NULL,
  'Birinci briqada $x$, ikinci $x+6$ günə: $\dfrac1x+\dfrac{1}{x+6}=\dfrac14\Rightarrow4(2x+6)=x(x+6)\Rightarrow x^2-2x-24=0\Rightarrow x=6$.',
  2025, 'I', 82, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0045 | əsas: 2025 toplu, I hissə, səh.82 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0045', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Tənlik qurmaqla məsələlər həlli'), 'original', 'own', 'az', 'draft', 'closed',
  'İki briqada bir evi birlikdə $8$ günə tikir. Birinci briqada bu evi təklikdə ikincidən $12$ gün tez tikə bilərsə, birinci briqada evi neçə günə tikə bilər?',
  '[{"key": "A", "text": "$12$"}, {"key": "B", "text": "$20$"}, {"key": "C", "text": "$16$"}, {"key": "D", "text": "$8$"}, {"key": "E", "text": "$24$"}]'::jsonb, 'A', NULL, NULL,
  '$\dfrac1x+\dfrac{1}{x+12}=\dfrac18\Rightarrow8(2x+12)=x^2+12x\Rightarrow x^2-4x-96=0\Rightarrow x=12$.',
  2025, 'I', 82, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0046 | əsas: 2025 toplu, I hissə, səh.82 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0046', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Tənlik qurmaqla məsələlər həlli'), 'original', 'own', 'az', 'draft', 'closed',
  'Müəyyən bir işi iki fəhlədən biri təklikdə digərindən $4$ dəfə tez yerinə yetirir. Birlikdə işləsələr həmin işi $4$ günə yerinə yetirərlər. Hər fəhlə ayrılıqda həmin işi neçə günə yerinə yetirər?',
  '[{"key": "A", "text": "$8;\\ 32$"}, {"key": "B", "text": "$4;\\ 16$"}, {"key": "C", "text": "$5;\\ 20$"}, {"key": "D", "text": "$6;\\ 24$"}, {"key": "E", "text": "$3;\\ 12$"}]'::jsonb, 'C', NULL, NULL,
  'Tez işləyən $x$, digəri $4x$ günə: $\dfrac1x+\dfrac{1}{4x}=\dfrac14\Rightarrow\dfrac{5}{4x}=\dfrac14\Rightarrow x=5$. Cavab: $5$ və $20$ gün.',
  2025, 'I', 82, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0047 | əsas: 2025 toplu, I hissə, səh.82 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0047', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Tənlik qurmaqla məsələlər həlli'), 'original', 'own', 'az', 'draft', 'closed',
  'Müəyyən bir işi iki fəhlədən biri təklikdə digərindən $3$ dəfə tez yerinə yetirir. Birlikdə işləsələr həmin işi $6$ günə yerinə yetirərlər. Hər fəhlə ayrılıqda həmin işi neçə günə yerinə yetirər?',
  '[{"key": "A", "text": "$12;\\ 36$"}, {"key": "B", "text": "$8;\\ 24$"}, {"key": "C", "text": "$9;\\ 27$"}, {"key": "D", "text": "$4;\\ 12$"}, {"key": "E", "text": "$6;\\ 18$"}]'::jsonb, 'B', NULL, NULL,
  '$\dfrac1x+\dfrac{1}{3x}=\dfrac16\Rightarrow\dfrac{4}{3x}=\dfrac16\Rightarrow x=8$. Cavab: $8$ və $24$ gün.',
  2025, 'I', 82, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0048 | əsas: 2025 toplu, I hissə, səh.83 №33
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0048', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Tənlik qurmaqla məsələlər həlli'), 'original', 'own', 'az', 'draft', 'written',
  'Biri o birindən $3$ vahid böyük olan iki natural ədədin kvadratları cəmi $369$-a bərabərdir. Bu ədədlərin cəmini hesablayın.',
  NULL, NULL, NULL, '27',
  '$x^2+(x+3)^2=369\Rightarrow x^2+3x-180=0\Rightarrow x=12$. Ədədlər $12$ və $15$, cəm $27$.',
  2025, 'I', 83, 33)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0049 | əsas: 2025 toplu, I hissə, səh.83 №34
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0049', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Tənlik qurmaqla məsələlər həlli'), 'original', 'own', 'az', 'draft', 'written',
  'Biri o birindən $5$ vahid böyük olan iki natural ədədin kvadratları cəmi $625$-ə bərabərdir. Bu ədədlərin cəmini hesablayın.',
  NULL, NULL, NULL, '35',
  '$x^2+(x+5)^2=625\Rightarrow x^2+5x-300=0\Rightarrow x=15$. Ədədlər $15$ və $20$, cəm $35$.',
  2025, 'I', 83, 34)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0050 | əsas: 2025 toplu, I hissə, səh.83 №35
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0050', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Tənlik qurmaqla məsələlər həlli'), 'original', 'own', 'az', 'draft', 'written',
  'Ata oğlundan beş dəfə böyükdür. $4$ ildən sonra o, oğlundan üç dəfə böyük olacaq. Oğulun indi neçə yaşı var?',
  NULL, NULL, NULL, '4',
  'Oğul $x$, ata $5x$ yaşında. $5x+4=3(x+4)\Rightarrow2x=8\Rightarrow x=4$.',
  2025, 'I', 83, 35)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0051 | əsas: 2025 toplu, I hissə, səh.83 №36
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0051', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Tənlik qurmaqla məsələlər həlli'), 'original', 'own', 'az', 'draft', 'written',
  'Ananın yaşı $38$, uşaqlarının yaşı isə $4$ və $6$-dır. Neçə ildən sonra ananın yaşı uşaqların yaşlarının cəmindən iki dəfə çox olacaq?',
  NULL, NULL, NULL, '6',
  '$x$ ildən sonra: $38+x=2(4+x+6+x)\Rightarrow38+x=20+4x\Rightarrow x=6$.',
  2025, 'I', 83, 36)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0052 | əsas: 2025 toplu, I hissə, səh.83 №37
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0052', NULL, NULL, (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Tənlik qurmaqla məsələlər həlli'), 'original', 'own', 'az', 'draft', 'written',
  'Atanın yaşı $52$, uşaqlarının yaşı isə $6$ və $8$-dir. Neçə ildən sonra atanın yaşı uşaqlarının yaşlarının cəmindən iki dəfə çox olacaq?',
  NULL, NULL, NULL, '8',
  '$52+x=2(14+2x)\Rightarrow52+x=28+4x\Rightarrow x=8$.',
  2025, 'I', 83, 37)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BTM-0053 | əsas: 2025 toplu, I hissə, səh.85 №65
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BTM-0053', '/images/tasks/BTM-0053.png', 'Qutunun üzərində 3 qırmızı və 2 sarı qovluq; ümumi hündürlük 80 sm', (SELECT id FROM topics WHERE name='Birməchullu tənliklər və məsələlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Birməchullu tənliklər və məsələlər' AND s.title='Tənlik qurmaqla məsələlər həlli'), 'original', 'own', 'az', 'draft', 'written',
  'Bir qutunun üzərinə $3$ qırmızı, $2$ sarı qovluq qoyulmuşdur. Qutu ilə bu qovluqların birlikdə hündürlüyü $80$ sm-dir. Qırmızı qovluğun qalınlığı sarı qovluğun qalınlığının $2$ mislindən $1$ sm böyük, qutunun hündürlüyü bütün qovluqların qalınlıqları cəmindən $10$ sm çox olarsa, qutunun hündürlüyü bir qırmızı qovluğun qalınlığından neçə sm çoxdur (eyni rəngli qovluqların qalınlıqları bərabərdir)?',
  NULL, NULL, NULL, '36',
  'Sarı qovluğun qalınlığı $s$, qırmızınınkı $2s+1$. Qovluqların cəmi $Q=3(2s+1)+2s=8s+3$, qutu $Q+10$. Ümumi hündürlük: $2Q+10=80\Rightarrow Q=35\Rightarrow8s+3=35\Rightarrow s=4$. Qırmızı: $9$ sm, qutu: $45$ sm. Fərq: $45-9=36$ sm.',
  2025, 'I', 85, 65)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
