-- Mövzu: Həqiqi ədədlər — 26 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- HQE-0001 | əsas: 2025 toplu, I hissə, səh.31 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Rasional ədədlər. Rasional ədədlər üzərində əməllər'), 'original', 'own', 'az', 'draft', 'closed',
  'Ədəd oxunda $n$ ədədindən $3n$ vahiddən kiçik məsafədə yerləşən ədədləri tapın $(n>0)$.',
  '[{"key": "A", "text": "$\\{-2n;\\,4n\\}$"}, {"key": "B", "text": "$(-4n;\\,2n)$"}, {"key": "C", "text": "$(0;\\,4n)$"}, {"key": "D", "text": "$(-\\infty;\\,-2n)\\cup(4n;\\,+\\infty)$"}, {"key": "E", "text": "$(-2n;\\,4n)$"}]'::jsonb, 'E', NULL, NULL,
  'Şərt: $|x-n|<3n\Leftrightarrow -3n<x-n<3n\Leftrightarrow -2n<x<4n$. Cavab: $(-2n;\,4n)$.',
  2025, 'I', 31, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0002 | əsas: 2025 toplu, I hissə, səh.31 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Rasional ədədlər. Rasional ədədlər üzərində əməllər'), 'original', 'own', 'az', 'draft', 'closed',
  'Ədəd oxunda $-2a$ ədədindən $4a$ vahiddən böyük məsafədə yerləşən ədədləri tapın $(a>0)$.',
  '[{"key": "A", "text": "$(-6a;\\,2a)$"}, {"key": "B", "text": "$(-\\infty;\\,-6a)\\cup(2a;\\,+\\infty)$"}, {"key": "C", "text": "$(-\\infty;\\,-2a)\\cup(6a;\\,+\\infty)$"}, {"key": "D", "text": "$(-2a;\\,6a)$"}, {"key": "E", "text": "$\\{-6a;\\,2a\\}$"}]'::jsonb, 'B', NULL, NULL,
  'Şərt: $|x-(-2a)|>4a\Leftrightarrow|x+2a|>4a$. Buradan $x+2a>4a$, yəni $x>2a$, və ya $x+2a<-4a$, yəni $x<-6a$. Cavab: $(-\infty;\,-6a)\cup(2a;\,+\infty)$.',
  2025, 'I', 31, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0003 | əsas: 2025 toplu, I hissə, səh.32 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədin modulu. Modul daxil olan ifadələrin çevrilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$x<0,\ |x|=4,\ |y|=2,\ z=-8$ olduqda $\dfrac{xy^2}{|z|}$ ifadəsinin qiymətini tapın.',
  '[{"key": "A", "text": "$1$"}, {"key": "B", "text": "$-1$"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$-2$"}, {"key": "E", "text": "$-8$"}]'::jsonb, 'D', NULL, NULL,
  '$x<0$ və $|x|=4$ olduğundan $x=-4$. $y^2=|y|^2=4$, $|z|=8$. $\dfrac{-4\cdot4}{8}=-2$.',
  2025, 'I', 32, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0004 | əsas: 2025 toplu, I hissə, səh.32 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədin modulu. Modul daxil olan ifadələrin çevrilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left|3a^4+a^2+5\right|-\left|-3a^4-a^2-12\right|$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$17$"}, {"key": "B", "text": "$6a^4+2a^2+17$"}, {"key": "C", "text": "$-6a^4-2a^2-17$"}, {"key": "D", "text": "$7$"}, {"key": "E", "text": "$-7$"}]'::jsonb, 'E', NULL, NULL,
  'Hər $a$ üçün $3a^4+a^2+5>0$, ona görə birinci modul $3a^4+a^2+5$-ə bərabərdir. $-3a^4-a^2-12=-(3a^4+a^2+12)<0$, ona görə $\left|-3a^4-a^2-12\right|=3a^4+a^2+12$. Fərq: $(3a^4+a^2+5)-(3a^4+a^2+12)=-7$.',
  2025, 'I', 32, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0005 | əsas: 2025 toplu, I hissə, səh.32 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədin modulu. Modul daxil olan ifadələrin çevrilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left|a^8+4a^2+10\right|-\left|-a^8-4a^2-3\right|$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$7$"}, {"key": "B", "text": "$2a^8+8a^2+13$"}, {"key": "C", "text": "$-7$"}, {"key": "D", "text": "$13$"}, {"key": "E", "text": "$-2a^8-8a^2-13$"}]'::jsonb, 'A', NULL, NULL,
  '$a^8+4a^2+10>0$ və $-a^8-4a^2-3<0$ olduğundan ifadə $(a^8+4a^2+10)-(a^8+4a^2+3)=7$-dir.',
  2025, 'I', 32, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0006 | əsas: 2025 toplu, I hissə, səh.32 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədin modulu. Modul daxil olan ifadələrin çevrilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$x<y<z$ olarsa, $|x-z|-|y-z|+|y-x|-|z-x|$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$2y-x-z$"}, {"key": "B", "text": "$z-x$"}, {"key": "C", "text": "$2y-2z$"}, {"key": "D", "text": "$x-z$"}, {"key": "E", "text": "$y-z$"}]'::jsonb, 'A', NULL, NULL,
  '$x<y<z$ olduğundan: $|x-z|=z-x$, $|y-z|=z-y$, $|y-x|=y-x$, $|z-x|=z-x$. İfadə: $(z-x)-(z-y)+(y-x)-(z-x)=2y-x-z$.',
  2025, 'I', 32, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0007 | əsas: 2025 toplu, I hissə, səh.32 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0007', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədin modulu. Modul daxil olan ifadələrin çevrilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$2<m<n$ olarsa, $|m-n|-|n+4|+|2-m|+3$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$1$"}, {"key": "B", "text": "$-1$"}, {"key": "C", "text": "$-3$"}, {"key": "D", "text": "$0$"}, {"key": "E", "text": "$3$"}]'::jsonb, 'C', NULL, NULL,
  '$m<n\Rightarrow|m-n|=n-m$; $n>0\Rightarrow|n+4|=n+4$; $m>2\Rightarrow|2-m|=m-2$. İfadə: $(n-m)-(n+4)+(m-2)+3=-3$.',
  2025, 'I', 32, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0008 | əsas: 2025 toplu, I hissə, səh.32 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədin modulu. Modul daxil olan ifadələrin çevrilməsi'), 'original', 'own', 'az', 'draft', 'written',
  '$x+y=7$ və $|x-a+5|+|y+b-4|=0$ olarsa, $a-b$ fərqini tapın.',
  NULL, NULL, NULL, '8',
  'Modulların cəmi sıfırdırsa, hər biri sıfırdır: $x-a+5=0\Rightarrow a=x+5$; $y+b-4=0\Rightarrow b=4-y$. $a-b=x+5-4+y=(x+y)+1=8$.',
  2025, 'I', 32, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0009 | əsas: 2025 toplu, I hissə, səh.32 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədin modulu. Modul daxil olan ifadələrin çevrilməsi'), 'original', 'own', 'az', 'draft', 'written',
  '$x-y=6$ və $|x-a-2|+|y+b-10|=0$ olarsa, $a+b$ cəmini tapın.',
  NULL, NULL, NULL, '14',
  '$x-a-2=0\Rightarrow a=x-2$; $y+b-10=0\Rightarrow b=10-y$. $a+b=x-y+8=6+8=14$.',
  2025, 'I', 32, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0010 | əsas: 2025 toplu, I hissə, səh.33 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədi orta. Həqiqi ədədlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$x$ və $y$ müsbət ədədlər olarsa, ifadələrdən hansı ən böyükdür?',
  '[{"key": "A", "text": "$-y$"}, {"key": "B", "text": "$x$"}, {"key": "C", "text": "$-(y-x)$"}, {"key": "D", "text": "$x+y$"}, {"key": "E", "text": "$-(x-y)$"}]'::jsonb, 'D', NULL, NULL,
  '$-(y-x)=x-y<x<x+y$; $-(x-y)=y-x<y<x+y$; $x<x+y$ (çünki $y>0$); $-y<0<x+y$. Deməli ən böyüyü $x+y$-dir.',
  2025, 'I', 33, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0011 | əsas: 2025 toplu, I hissə, səh.33 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0011', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədi orta. Həqiqi ədədlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$x$ və $y$ mənfi ədədlər olarsa, ifadələrdən hansının qiyməti ən kiçikdir?',
  '[{"key": "A", "text": "$x+y$"}, {"key": "B", "text": "$x$"}, {"key": "C", "text": "$-(x+y)$"}, {"key": "D", "text": "$x-y$"}, {"key": "E", "text": "$y$"}]'::jsonb, 'A', NULL, NULL,
  '$x<0,\ y<0$. $x+y<x$ (çünki $y<0$) və $x+y<y$ (çünki $x<0$). $x-y-(x+y)=-2y>0$, deməli $x+y<x-y$. $-(x+y)>0>x+y$. Ən kiçiyi $x+y$-dir.',
  2025, 'I', 33, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0012 | əsas: 2025 toplu, I hissə, səh.34 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0012', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədi orta. Həqiqi ədədlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$a$ və $b$ qarşılıqlı tərs ədədlər olarsa, $a^3b^4+a^4b^3$ ifadəsinin ala ***bilmədiyi*** tam qiymətlərin sayını tapın.',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "$1$"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$5$"}, {"key": "E", "text": "$4$"}]'::jsonb, 'C', NULL, NULL,
  '$ab=1$, ona görə $a^3b^4+a^4b^3=a^3b^3(a+b)=a+b=a+\dfrac{1}{a}$. $a>0$ olduqda $a+\dfrac{1}{a}\ge2$, $a<0$ olduqda $a+\dfrac{1}{a}\le-2$. Deməli ifadə $(-2;2)$ intervalındakı tam qiymətləri — $-1,0,1$ — ala bilmir: $3$ qiymət. ($|k|\ge2$ olan hər tam $k$ isə alınır.)',
  2025, 'I', 34, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0013 | əsas: 2025 toplu, I hissə, səh.34 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədi orta. Həqiqi ədədlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$a$ və $b$ qarşılıqlı tərs ədədlər olarsa, $a^{n+2}b^{n}+a^{n}b^{n+2}$ ifadəsinin ən kiçik müsbət tam qiymətini tapın $(n\in N)$.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$1$"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$2{,}5$"}]'::jsonb, 'C', NULL, NULL,
  '$ab=1$: $a^{n+2}b^n+a^nb^{n+2}=(ab)^n(a^2+b^2)=a^2+b^2=a^2+\dfrac{1}{a^2}\ge2$ (bərabərlik $a^2=1$ olduqda). Deməli ifadə $1$ qiymətini ala bilmir, ən kiçik müsbət tam qiyməti $2$-dir.',
  2025, 'I', 34, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0014 | əsas: 2025 toplu, I hissə, səh.34 №18
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədi orta. Həqiqi ədədlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'On nəfərlik turist qrupundakı şəxslərin yaşlarının ədədi ortası $a$-dır. Müəyyən qədər yol getdikdən sonra turist qrupu dörd nəfərlik və altı nəfərlik iki hissəyə ayrılır və dörd nəfərlik qrupdakı şəxslərin yaşlarının ədədi ortası $b$ olarsa, altı nəfərlik qrupdakı şəxslərin yaşlarının ədədi ortasını $a$ və $b$ ilə ifadə edin.',
  '[{"key": "A", "text": "$\\dfrac{10a-4b}{3}$"}, {"key": "B", "text": "$\\dfrac{2a-5b}{3}$"}, {"key": "C", "text": "$\\dfrac{5a+2b}{3}$"}, {"key": "D", "text": "$\\dfrac{5b-2a}{3}$"}, {"key": "E", "text": "$\\dfrac{5a-2b}{3}$"}]'::jsonb, 'E', NULL, NULL,
  'Bütün yaşların cəmi $10a$, dörd nəfərinki $4b$. Altı nəfərin yaşlarının cəmi $10a-4b$, ədədi ortası $\dfrac{10a-4b}{6}=\dfrac{5a-2b}{3}$.',
  2025, 'I', 34, 18)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0015 | əsas: 2025 toplu, I hissə, səh.34 №19
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0015', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədi orta. Həqiqi ədədlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$a=2\sqrt2+2\sqrt5,\ b=\sqrt{53},\ c=7{,}29$ ədədlərini müqayisə edin.',
  '[{"key": "A", "text": "$a=b>c$"}, {"key": "B", "text": "$a>c>b$"}, {"key": "C", "text": "$a>b>c$"}, {"key": "D", "text": "$b>a=c$"}, {"key": "E", "text": "$c>b>a$"}]'::jsonb, 'B', NULL, NULL,
  'Müsbət ədədləri kvadratları ilə müqayisə edək. $a^2=8+20+8\sqrt{10}=28+8\sqrt{10}$; $\sqrt{10}>3{,}16$ olduğundan $a^2>28+25{,}28=53{,}28$. $c^2=7{,}29^2=53{,}1441$. $b^2=53$. Həmçinin $\sqrt{10}<3{,}163$, ona görə $a^2<53{,}31$ — bu, $c^2$-dan böyükdür. Deməli $a^2>c^2>b^2$, yəni $a>c>b$.',
  2025, 'I', 34, 19)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0016 | əsas: 2025 toplu, I hissə, səh.34 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədi orta. Həqiqi ədədlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$n$ sayda ədədin ədədi ortası $0{,}4$-ə, $m$ sayda ədədin ədədi ortası $1{,}2$-yə, $(n+m)$ sayda ədədin ədədi ortası $0{,}7$-yə bərabər olarsa, $n+m$-in ən kiçik qiymətini tapın.',
  '[{"key": "A", "text": "$15$"}, {"key": "B", "text": "$5$"}, {"key": "C", "text": "$10$"}, {"key": "D", "text": "$8$"}, {"key": "E", "text": "$3$"}]'::jsonb, 'D', NULL, NULL,
  '$0{,}4n+1{,}2m=0{,}7(n+m)\Rightarrow0{,}5m=0{,}3n\Rightarrow5m=3n$. $\text{ƏBOB}(5,3)=1$ olduğundan $n=5k$, $m=3k$; $n+m=8k$, ən kiçik qiymət $8$.',
  2025, 'I', 34, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0017 | əsas: 2025 toplu, I hissə, səh.34 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədi orta. Həqiqi ədədlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$a,\ b$ və $c$ müsbət həqiqi ədədlərdir. $a$ və $b$ ədədlərinin həndəsi ortası $x$, $b$ və $c$ ədədlərinin həndəsi ortası $y$, $a$ və $c$ ədədlərinin həndəsi ortası $z$ olarsa, $a+b+c$ cəmini tapın.',
  '[{"key": "A", "text": "$\\dfrac{x^2y^2+x^2z^2+y^2z^2}{xyz}$"}, {"key": "B", "text": "$\\dfrac{xy+xz+yz}{xyz}$"}, {"key": "C", "text": "$\\dfrac{xy+yz+xz}{3}$"}, {"key": "D", "text": "$\\dfrac{x^2y^2+x^2z^2+y^2z^2}{3xyz}$"}, {"key": "E", "text": "$xyz$"}]'::jsonb, 'A', NULL, NULL,
  '$ab=x^2,\ bc=y^2,\ ac=z^2$. Hasil: $(abc)^2=x^2y^2z^2\Rightarrow abc=xyz$. Onda $a=\dfrac{abc}{bc}=\dfrac{xyz}{y^2}=\dfrac{xz}{y}$, $b=\dfrac{xy}{z}$, $c=\dfrac{yz}{x}$. $a+b+c=\dfrac{xz}{y}+\dfrac{xy}{z}+\dfrac{yz}{x}=\dfrac{x^2z^2+x^2y^2+y^2z^2}{xyz}$.',
  2025, 'I', 34, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0018 | əsas: 2025 toplu, I hissə, səh.34 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədi orta. Həqiqi ədədlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'open',
  '$12$ ədədin ədədi ortası $6{,}5$-ə bərabərdir. Bu ədədlərin cəminin $\dfrac{1}{3}$ hissəsini tapın.',
  NULL, NULL, NULL, '26',
  'Cəm: $12\cdot6{,}5=78$. $\dfrac{1}{3}$ hissəsi: $78:3=26$.',
  2025, 'I', 34, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0019 | əsas: 2025 toplu, I hissə, səh.34 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədi orta. Həqiqi ədədlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'open',
  '$25$ ədədin ədədi ortası $4{,}8$-ə bərabərdir. Bu ədədlərin cəminin $\dfrac{1}{5}$ hissəsini tapın.',
  NULL, NULL, NULL, '24',
  'Cəm: $25\cdot4{,}8=120$. $\dfrac{1}{5}$ hissəsi: $120:5=24$.',
  2025, 'I', 34, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0020 | əsas: 2025 toplu, I hissə, səh.34 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədi orta. Həqiqi ədədlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'open',
  'Beş ədədin ədədi ortası $12$-yə bərabərdir. Bu ədədlərə yeni bir ədəd əlavə etdikdən sonra ədədi orta $13$ oldu. Əlavə olunmuş ədədi tapın.',
  NULL, NULL, NULL, '18',
  'Əvvəlki cəm $5\cdot12=60$, yeni cəm $6\cdot13=78$. Əlavə olunan ədəd: $78-60=18$.',
  2025, 'I', 34, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0021 | əsas: 2025 toplu, I hissə, səh.34 №27
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədi orta. Həqiqi ədədlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'open',
  'Səkkiz ədədin ədədi ortası $15$-ə bərabərdir. Bu ədədlərdən birini çıxartdıqdan sonra ədədi orta $14$ oldu. Çıxarılmış ədədi tapın.',
  NULL, NULL, NULL, '22',
  'Əvvəlki cəm $8\cdot15=120$, qalan yeddi ədədin cəmi $7\cdot14=98$. Çıxarılan ədəd: $120-98=22$.',
  2025, 'I', 34, 27)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0022 | əsas: 2025 toplu, I hissə, səh.34 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədi orta. Həqiqi ədədlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'open',
  '$a,\ b$ müsbət həqiqi ədədlərinin ədədi ortası $7{,}5$ və həndəsi ortası $6$ olarsa, $a^2+b^2$ cəmini tapın.',
  NULL, NULL, NULL, '153',
  '$a+b=2\cdot7{,}5=15$, $ab=6^2=36$. $a^2+b^2=(a+b)^2-2ab=225-72=153$.',
  2025, 'I', 34, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0023 | əsas: 2025 toplu, I hissə, səh.35 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədin tam və kəsr hissəsi. Ədədin standart şəkli'), 'original', 'own', 'az', 'draft', 'closed',
  '$a=m\cdot10^{-12},\ b=3{,}5\cdot10^{18}$ — standart şəkildə verilmiş ədədlərdir. $m$-in neçə natural qiymətində $ab$ hasilinin tərtibi $7$-yə bərabərdir?',
  '[{"key": "A", "text": "$3$"}, {"key": "B", "text": "$7$"}, {"key": "C", "text": "$8$"}, {"key": "D", "text": "$9$"}, {"key": "E", "text": "$6$"}]'::jsonb, 'B', NULL, NULL,
  'Standart şəkildə $1\le m<10$, natural $m\in\{1,\dots,9\}$. $ab=3{,}5m\cdot10^{6}$. Tərtibin $7$ olması üçün $10\le3{,}5m<100$, yəni $m\ge\dfrac{10}{3{,}5}\approx2{,}86$. $m\in\{3;4;\dots;9\}$ — $7$ qiymət.',
  2025, 'I', 35, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0024 | əsas: 2025 toplu, I hissə, səh.35 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədin tam və kəsr hissəsi. Ədədin standart şəkli'), 'original', 'own', 'az', 'draft', 'written',
  'Standart şəkildə yazılmış $a=n\cdot10^{m-1}$ ədədinin qiymətli hissəsi, standart şəkildə yazılmış $b=m\cdot10^{n+2}$ ədədinin qiymətli hissəsindən $3$ dəfə kiçikdir. $a$ ədədinin tərtibi $b$ ədədinin tərtibindən $1{,}6$ dəfə böyük olarsa, $2m+3n$ ifadəsinin qiymətini tapın.',
  NULL, NULL, NULL, '27',
  'Qiymətli hissələr: $m=3n$. Tərtiblər: $m-1=1{,}6(n+2)$. Yerinə yazaq: $3n-1=1{,}6n+3{,}2\Rightarrow1{,}4n=4{,}2\Rightarrow n=3$, $m=9$. ($1\le3<10$ və $1\le9<10$ — standart şəkil şərti ödənir.) $2m+3n=18+9=27$.',
  2025, 'I', 35, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0025 | əsas: 2025 toplu, I hissə, səh.35 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0025', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədin tam və kəsr hissəsi. Ədədin standart şəkli'), 'original', 'own', 'az', 'draft', 'written',
  '$a,\ b$ və $c$ bir-birindən fərqli natural ədədlər olarsa, standart şəkildə yazılmış $a\cdot10^{b}$, $b\cdot10^{c}$ və $c\cdot10^{a}$ ədədlərinin hasilinin ən kiçik qiymətinin tərtibini tapın.',
  NULL, NULL, NULL, '6',
  'Standart şəkil şərtinə görə $a,b,c\in\{1;2;\dots;9\}$. Hasil: $abc\cdot10^{a+b+c}$. Tərtib $a+b+c$ ilə $abc$-nin tərtibinin cəminə bərabərdir. Fərqli natural ədədlər üçün $a+b+c\ge1+2+3=6$; bu halda $abc=6$, hasil $6\cdot10^6$, tərtib $6$. Cəm $6$-dan böyük olduqda tərtib ən azı $7$ olur. Cavab: $6$.',
  2025, 'I', 35, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HQE-0026 | əsas: 2025 toplu, I hissə, səh.35 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HQE-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Həqiqi ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həqiqi ədədlər' AND s.title='Ədədin tam və kəsr hissəsi. Ədədin standart şəkli'), 'original', 'own', 'az', 'draft', 'written',
  '$|2m-n|$ ifadəsinin ən kiçik qiymətində, standart şəkildə yazılmış $a=m\cdot10^m$ və $b=n\cdot10^n$ ($m,n\in N$) ədədlərinin hasilinin standart şəkildə yazılışında qiymətli hissəsinin ala biləcəyi ədədlərin cəmini tapın.',
  NULL, NULL, NULL, '15',
  '$|2m-n|$ ifadəsinin ən kiçik qiyməti $0$-dır, yəni $n=2m$. Standart şəkil şərti: $1\le m,n\le9$, deməli $(m;n)\in\{(1;2),(2;4),(3;6),(4;8)\}$. $ab=mn\cdot10^{m+n}$; $mn$ uyğun olaraq $2,\ 8,\ 18,\ 32$. Qiymətli hissələr: $2;\ 8;\ 1{,}8;\ 3{,}2$. Cəm: $2+8+1{,}8+3{,}2=15$.',
  2025, 'I', 35, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
