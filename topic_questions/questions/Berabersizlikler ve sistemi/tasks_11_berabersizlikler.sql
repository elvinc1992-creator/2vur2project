-- Mövzu: Bərabərsizliklər və sistemləri — 46 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- BRS-0001 | əsas: 2025 toplu, I hissə, səh.97 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Ədədi bərabərsizliklər və onların əsas xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$a+b=6$ və $-2<a<5$ olduqda $b$-ni qiymətləndirin.',
  '[{"key": "A", "text": "$1<b<8$"}, {"key": "B", "text": "$-8<b<-1$"}, {"key": "C", "text": "$-4<b<11$"}, {"key": "D", "text": "$-1<b<8$"}, {"key": "E", "text": "$1<b<11$"}]'::jsonb, 'A', NULL, NULL,
  '$b=6-a$. $-2<a<5$ bərabərsizliyini $-1$-ə vuraq: $-5<-a<2$. $6$ əlavə edək: $1<6-a<8$, yəni $1<b<8$.',
  2025, 'I', 97, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0002 | əsas: 2025 toplu, I hissə, səh.97 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Ədədi bərabərsizliklər və onların əsas xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$-3<x<1$ və $2<y<6$ olarsa, $x+y$ cəmini qiymətləndirin.',
  '[{"key": "A", "text": "$2<x+y<7$"}, {"key": "B", "text": "$-1<x+y<5$"}, {"key": "C", "text": "$-5<x+y<5$"}, {"key": "D", "text": "$-1<x+y<7$"}, {"key": "E", "text": "$-3<x+y<6$"}]'::jsonb, 'D', NULL, NULL,
  'Eyni istiqamətli bərabərsizlikləri tərəf-tərəfə toplayaq: $-3+2<x+y<1+6$, yəni $-1<x+y<7$.',
  2025, 'I', 97, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0003 | əsas: 2025 toplu, I hissə, səh.97 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Ədədi bərabərsizliklər və onların əsas xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$4<2x<10$ və $1<y<3$ olarsa, $x+y$ cəmini qiymətləndirin.',
  '[{"key": "A", "text": "$3<x+y<5$"}, {"key": "B", "text": "$2<x+y<8$"}, {"key": "C", "text": "$3<x+y<8$"}, {"key": "D", "text": "$5<x+y<13$"}, {"key": "E", "text": "$4<x+y<10$"}]'::jsonb, 'C', NULL, NULL,
  '$4<2x<10\Rightarrow2<x<5$. Toplayaq: $2+1<x+y<5+3$, yəni $3<x+y<8$.',
  2025, 'I', 97, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0004 | əsas: 2025 toplu, I hissə, səh.99 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Birdəyişənli xətti bərabərsizliklər. Birdəyişənli xətti bərabərsizliklər sistemi. Bərabərsizliklər heyəti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{x+2{,}5}{\pi-\sqrt{11}}\ge0$ bərabərsizliyinin ən böyük mənfi tam həllini tapın.',
  '[{"key": "A", "text": "$-5$"}, {"key": "B", "text": "$-1$"}, {"key": "C", "text": "$-4$"}, {"key": "D", "text": "$-2$"}, {"key": "E", "text": "$-3$"}]'::jsonb, 'E', NULL, NULL,
  '$\pi^2\approx9{,}87<11$, ona görə $\pi<\sqrt{11}$ və məxrəc mənfidir. Onda $x+2{,}5\le0$, yəni $x\le-2{,}5$. Ən böyük mənfi tam həll: $-3$.',
  2025, 'I', 99, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0005 | əsas: 2025 toplu, I hissə, səh.99 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Birdəyişənli xətti bərabərsizliklər. Birdəyişənli xətti bərabərsizliklər sistemi. Bərabərsizliklər heyəti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{x+0{,}5}{\sqrt7-\pi}\ge0$ bərabərsizliyinin ən böyük mənfi tam həllini tapın.',
  '[{"key": "A", "text": "$0$"}, {"key": "B", "text": "$-3$"}, {"key": "C", "text": "$-2$"}, {"key": "D", "text": "$1$"}, {"key": "E", "text": "$-1$"}]'::jsonb, 'E', NULL, NULL,
  '$7<\pi^2$, ona görə $\sqrt7<\pi$ və məxrəc mənfidir. $x+0{,}5\le0\Rightarrow x\le-0{,}5$. Ən böyük mənfi tam həll: $-1$.',
  2025, 'I', 99, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0006 | əsas: 2025 toplu, I hissə, səh.99 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Birdəyişənli xətti bərabərsizliklər. Birdəyişənli xətti bərabərsizliklər sistemi. Bərabərsizliklər heyəti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}x-\dfrac{x+1}{2}>1,\\3x-4<5x+6\end{cases}$ bərabərsizliklər sisteminin ən kiçik tam həllini tapın.',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "$5$"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$-4$"}]'::jsonb, 'D', NULL, NULL,
  'Birinci: $\dfrac{x-1}{2}>1\Rightarrow x>3$. İkinci: $-2x<10\Rightarrow x>-5$. Sistem: $x>3$. Ən kiçik tam həll: $4$.',
  2025, 'I', 99, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0007 | əsas: 2025 toplu, I hissə, səh.99 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0007', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Birdəyişənli xətti bərabərsizliklər. Birdəyişənli xətti bərabərsizliklər sistemi. Bərabərsizliklər heyəti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}4-\dfrac{x}{3}>x,\\x-\dfrac{x-2}{4}>\dfrac{1}{2}\end{cases}$ bərabərsizliklər sisteminin ən böyük tam həllini tapın.',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "$1$"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$-1$"}, {"key": "E", "text": "$0$"}]'::jsonb, 'A', NULL, NULL,
  'Birinci: $4>\dfrac{4x}{3}\Rightarrow x<3$. İkinci: $\dfrac{3x+2}{4}>\dfrac12\Rightarrow3x+2>2\Rightarrow x>0$. Sistem: $(0;3)$, ən böyük tam həll $2$.',
  2025, 'I', 99, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0008 | əsas: 2025 toplu, I hissə, səh.98 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Birdəyişənli xətti bərabərsizliklər. Birdəyişənli xətti bərabərsizliklər sistemi. Bərabərsizliklər heyəti'), 'original', 'own', 'az', 'draft', 'closed',
  '$-1\le\dfrac{x}{2}-3\le1$ bərabərsizliyini həll edin.',
  '[{"key": "A", "text": "$[2;\\ 4]$"}, {"key": "B", "text": "$[4;\\ 8]$"}, {"key": "C", "text": "$[4;\\ 8)$"}, {"key": "D", "text": "$(4;\\ 8)$"}, {"key": "E", "text": "$[-8;\\ -4]$"}]'::jsonb, 'B', NULL, NULL,
  'Hər tərəfə $3$ əlavə edək: $2\le\dfrac{x}{2}\le4$. $2$-yə vuraq: $4\le x\le8$.',
  2025, 'I', 98, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0009 | əsas: 2025 toplu, I hissə, səh.98 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Birdəyişənli xətti bərabərsizliklər. Birdəyişənli xətti bərabərsizliklər sistemi. Bərabərsizliklər heyəti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}15-x>2x-3,\\x-\dfrac{x-2}{3}>2\end{cases}$ bərabərsizliklər sisteminin ən böyük tam həllini tapın.',
  '[{"key": "A", "text": "$3$"}, {"key": "B", "text": "$5$"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$6$"}, {"key": "E", "text": "$4$"}]'::jsonb, 'B', NULL, NULL,
  'Birinci: $18>3x\Rightarrow x<6$. İkinci: $\dfrac{2x+2}{3}>2\Rightarrow x>2$. Sistem $(2;6)$, ən böyük tam həll $5$.',
  2025, 'I', 98, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0010 | əsas: 2025 toplu, I hissə, səh.98 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Birdəyişənli xətti bərabərsizliklər. Birdəyişənli xətti bərabərsizliklər sistemi. Bərabərsizliklər heyəti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}4x-\dfrac{5x-1}{2}>3,\\3x+1>6x-20\end{cases}$ bərabərsizliklər sisteminin ən böyük tam həllini tapın.',
  '[{"key": "A", "text": "$6$"}, {"key": "B", "text": "$7$"}, {"key": "C", "text": "$-2$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$5$"}]'::jsonb, 'A', NULL, NULL,
  'Birinci: $\dfrac{3x+1}{2}>3\Rightarrow x>\dfrac53$. İkinci: $21>3x\Rightarrow x<7$. Sistem $\left(\dfrac53;7\right)$, ən böyük tam həll $6$.',
  2025, 'I', 98, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0011 | əsas: 2025 toplu, I hissə, səh.101 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0011', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='İkidərəcəli və yüksək dərəcəli bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$x^4\ge81$ bərabərsizliyini həll edin.',
  '[{"key": "A", "text": "$(-\\infty;\\ -3]\\cup[3;\\ +\\infty)$"}, {"key": "B", "text": "$(-\\infty;\\ -9]\\cup[9;\\ +\\infty)$"}, {"key": "C", "text": "$[3;\\ +\\infty)$"}, {"key": "D", "text": "$[-3;\\ 3]$"}, {"key": "E", "text": "$(-\\infty;\\ +\\infty)$"}]'::jsonb, 'A', NULL, NULL,
  '$x^4-81=(x^2-9)(x^2+9)\ge0$. $x^2+9>0$, ona görə $x^2\ge9$, yəni $|x|\ge3$.',
  2025, 'I', 101, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0012 | əsas: 2025 toplu, I hissə, səh.101 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0012', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='İkidərəcəli və yüksək dərəcəli bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$2x<\dfrac{x^2}{2}+x-4$ bərabərsizliyini həll edin.',
  '[{"key": "A", "text": "$(-2;\\ 4)$"}, {"key": "B", "text": "$(4;\\ +\\infty)$"}, {"key": "C", "text": "$(-\\infty;\\ -2)\\cup(4;\\ +\\infty)$"}, {"key": "D", "text": "$(-4;\\ 2)$"}, {"key": "E", "text": "$(-\\infty;\\ 2)\\cup(4;\\ +\\infty)$"}]'::jsonb, 'C', NULL, NULL,
  '$2$-yə vuraq: $4x<x^2+2x-8\Rightarrow x^2-2x-8>0\Rightarrow(x-4)(x+2)>0$. Həll: $x<-2$ və ya $x>4$.',
  2025, 'I', 101, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0013 | əsas: 2025 toplu, I hissə, səh.101 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='İkidərəcəli və yüksək dərəcəli bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$x^2-2x-15\le0$ bərabərsizliyini həll edin.',
  '[{"key": "A", "text": "$(-\\infty;\\ -3]\\cup[5;\\ +\\infty)$"}, {"key": "B", "text": "$[-5;\\ 3]$"}, {"key": "C", "text": "$[-3;\\ 5]$"}, {"key": "D", "text": "$[3;\\ 5]$"}, {"key": "E", "text": "$(-3;\\ 5)$"}]'::jsonb, 'C', NULL, NULL,
  '$(x-5)(x+3)\le0\Rightarrow-3\le x\le5$.',
  2025, 'I', 101, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0014 | əsas: 2025 toplu, I hissə, səh.101 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='İkidərəcəli və yüksək dərəcəli bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$x^2+3x-10\ge0$ bərabərsizliyini həll edin.',
  '[{"key": "A", "text": "$[-5;\\ 2]$"}, {"key": "B", "text": "$[2;\\ +\\infty)$"}, {"key": "C", "text": "$[-2;\\ 5]$"}, {"key": "D", "text": "$(-\\infty;\\ -5]\\cup[2;\\ +\\infty)$"}, {"key": "E", "text": "$(-\\infty;\\ -2]\\cup[5;\\ +\\infty)$"}]'::jsonb, 'D', NULL, NULL,
  '$(x+5)(x-2)\ge0\Rightarrow x\le-5$ və ya $x\ge2$.',
  2025, 'I', 101, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0015 | əsas: 2025 toplu, I hissə, səh.101 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0015', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='İkidərəcəli və yüksək dərəcəli bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$(x-2)(x+6)<0$ bərabərsizliyini həll edin.',
  '[{"key": "A", "text": "$(-6;\\ +\\infty)$"}, {"key": "B", "text": "$[-6;\\ 2]$"}, {"key": "C", "text": "$(-6;\\ 2)$"}, {"key": "D", "text": "$(-2;\\ 6)$"}, {"key": "E", "text": "$(-\\infty;\\ -6)\\cup(2;\\ +\\infty)$"}]'::jsonb, 'C', NULL, NULL,
  'Köklər $-6$ və $2$; hasil mənfidir köklər arasında: $(-6;\ 2)$.',
  2025, 'I', 101, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0016 | əsas: 2025 toplu, I hissə, səh.101 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='İkidərəcəli və yüksək dərəcəli bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$a$ parametrinin hansı qiymətlərində $x^2+4ax+9>0$ bərabərsizliyi $x$-in bütün həqiqi qiymətlərində doğrudur?',
  '[{"key": "A", "text": "$\\left(\\dfrac{9}{16};\\ +\\infty\\right)$"}, {"key": "B", "text": "$\\left(0;\\ \\dfrac32\\right)$"}, {"key": "C", "text": "$\\left(-\\infty;\\ -\\dfrac32\\right)$"}, {"key": "D", "text": "$\\left(-\\dfrac32;\\ \\dfrac32\\right)$"}, {"key": "E", "text": "$\\left(\\dfrac32;\\ +\\infty\\right)$"}]'::jsonb, 'D', NULL, NULL,
  'Baş əmsal müsbətdir, bərabərsizlik hər $x$ üçün doğrudursa $D<0$: $16a^2-36<0\Rightarrow a^2<\dfrac94\Rightarrow-\dfrac32<a<\dfrac32$.',
  2025, 'I', 101, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0017 | əsas: 2025 toplu, I hissə, səh.101 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='İkidərəcəli və yüksək dərəcəli bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$a$ parametrinin hansı qiymətlərində $x^2-2ax+9>0$ bərabərsizliyi $x$-in bütün həqiqi qiymətlərində doğrudur?',
  '[{"key": "A", "text": "$(0;\\ 3)$"}, {"key": "B", "text": "$(-9;\\ 9)$"}, {"key": "C", "text": "$(3;\\ +\\infty)$"}, {"key": "D", "text": "$(-\\infty;\\ -3)$"}, {"key": "E", "text": "$(-3;\\ 3)$"}]'::jsonb, 'E', NULL, NULL,
  '$D=4a^2-36<0\Rightarrow a^2<9\Rightarrow-3<a<3$.',
  2025, 'I', 101, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0018 | əsas: 2025 toplu, I hissə, səh.101 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='İkidərəcəli və yüksək dərəcəli bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left(\sqrt5-3\right)(x+4)(x-6)\ge0$ bərabərsizliyinin tam həllərinin cəmini tapın.',
  '[{"key": "A", "text": "$6$"}, {"key": "B", "text": "$11$"}, {"key": "C", "text": "$-11$"}, {"key": "D", "text": "$1$"}, {"key": "E", "text": "$10$"}]'::jsonb, 'B', NULL, NULL,
  '$\sqrt5-3<0$, ona görə bərabərsizlik $(x+4)(x-6)\le0$ şəklinə düşür: $-4\le x\le6$. Tam həllər $-4,-3,\dots,6$; cəm: $5+6=11$ (çünki $-4$-dən $4$-ə qədər olanlar bir-birini ləğv edir).',
  2025, 'I', 101, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0019 | əsas: 2025 toplu, I hissə, səh.102 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='İkidərəcəli və yüksək dərəcəli bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left(2-\sqrt7\right)(x+5)(x-3)\ge0$ bərabərsizliyinin tam həllərinin cəmini tapın.',
  '[{"key": "A", "text": "$-9$"}, {"key": "B", "text": "$-5$"}, {"key": "C", "text": "$-7$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$9$"}]'::jsonb, 'A', NULL, NULL,
  '$2-\sqrt7<0$: $(x+5)(x-3)\le0\Rightarrow-5\le x\le3$. Cəm: $-5-4=-9$ (qalan $-3,\dots,3$ ləğv olur).',
  2025, 'I', 102, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0020 | əsas: 2025 toplu, I hissə, səh.103 №40
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='İkidərəcəli və yüksək dərəcəli bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left|x^2-2x-8\right|=x^2-2x-8$ tənliyini həll edin.',
  '[{"key": "A", "text": "$[4;\\ +\\infty)$"}, {"key": "B", "text": "$[-2;\\ 4]$"}, {"key": "C", "text": "$(-2;\\ 4)$"}, {"key": "D", "text": "$(-\\infty;\\ +\\infty)$"}, {"key": "E", "text": "$(-\\infty;\\ -2]\\cup[4;\\ +\\infty)$"}]'::jsonb, 'E', NULL, NULL,
  '$|A|=A\Leftrightarrow A\ge0$: $(x-4)(x+2)\ge0\Rightarrow x\le-2$ və ya $x\ge4$.',
  2025, 'I', 103, 40)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0021 | əsas: 2025 toplu, I hissə, səh.103 №41
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='İkidərəcəli və yüksək dərəcəli bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left|x^2-x-12\right|=-x^2+x+12$ tənliyini həll edin.',
  '[{"key": "A", "text": "$(-3;\\ 4)$"}, {"key": "B", "text": "$(-\\infty;\\ +\\infty)$"}, {"key": "C", "text": "$[-3;\\ 4]$"}, {"key": "D", "text": "$[-4;\\ 3]$"}, {"key": "E", "text": "$(-\\infty;\\ -3]\\cup[4;\\ +\\infty)$"}]'::jsonb, 'C', NULL, NULL,
  '$|A|=-A\Leftrightarrow A\le0$: $(x-4)(x+3)\le0\Rightarrow-3\le x\le4$.',
  2025, 'I', 103, 41)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0022 | əsas: 2025 toplu, I hissə, səh.103 №42
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='İkidərəcəli və yüksək dərəcəli bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$a$ parametrinin hansı qiymətlərində $ax^2+4ax+8$ üçhədlisi ixtiyari $x$ üçün müsbət qiymətlər alır?',
  '[{"key": "A", "text": "$(0;\\ 2)$"}, {"key": "B", "text": "$(0;\\ +\\infty)$"}, {"key": "C", "text": "$(-\\infty;\\ 0)$"}, {"key": "D", "text": "$(-2;\\ 0)$"}, {"key": "E", "text": "$(-\\infty;\\ +\\infty)$"}]'::jsonb, 'A', NULL, NULL,
  'Üçhədli olduğundan $a\ne0$. Hər $x$ üçün müsbət olması üçün $a>0$ və $D=16a^2-32a<0\Rightarrow0<a<2$.',
  2025, 'I', 103, 42)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0023 | əsas: 2025 toplu, I hissə, səh.103 №43
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='İkidərəcəli və yüksək dərəcəli bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$k$ parametrinin hansı qiymətlərində $x^2-2kx+k^2-9=0$ tənliyinin hər iki kökü $(-1;\ 7)$ aralığında yerləşər?',
  '[{"key": "A", "text": "$(2;\\ 7)$"}, {"key": "B", "text": "$(-4;\\ 2)$"}, {"key": "C", "text": "$(0;\\ 4)$"}, {"key": "D", "text": "$(2;\\ 4)$"}, {"key": "E", "text": "$(-2;\\ 4)$"}]'::jsonb, 'D', NULL, NULL,
  '$(x-k)^2=9\Rightarrow x=k\pm3$. Şərt: $k-3>-1$ və $k+3<7$, yəni $2<k<4$.',
  2025, 'I', 103, 43)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0024 | əsas: 2025 toplu, I hissə, səh.103 №44
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='İkidərəcəli və yüksək dərəcəli bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$k$ parametrinin hansı qiymətlərində $x^2-2kx+k^2-4=0$ tənliyinin hər iki kökü $(-3;\ 5)$ aralığında yerləşər?',
  '[{"key": "A", "text": "$(-5;\\ 1)$"}, {"key": "B", "text": "$(-3;\\ 5)$"}, {"key": "C", "text": "$(1;\\ 3)$"}, {"key": "D", "text": "$(-1;\\ 5)$"}, {"key": "E", "text": "$(-1;\\ 3)$"}]'::jsonb, 'E', NULL, NULL,
  'Köklər $k\pm2$. Şərt: $k-2>-3$ və $k+2<5$, yəni $-1<k<3$.',
  2025, 'I', 103, 44)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0025 | əsas: 2025 toplu, I hissə, səh.103 №47
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0025', '/images/tasks/BRS-0025.png', 'Qolları yuxarı yönəlmiş parabola, x oxunu 1 və 4 nöqtələrində kəsir', (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='İkidərəcəli və yüksək dərəcəli bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$(-\infty;\ +\infty)$ aralığında təyin olunmuş $y=f(x)$ kvadrat funksiyasının qrafikinə əsasən $x(x-2)\cdot f(x)\le0$ bərabərsizliyini həll edin.',
  '[{"key": "A", "text": "$(-\\infty;\\ 1]\\cup[2;\\ 4]$"}, {"key": "B", "text": "$[0;\\ 1]\\cup[2;\\ 4]$"}, {"key": "C", "text": "$[0;\\ 4]$"}, {"key": "D", "text": "$(-\\infty;\\ 0]\\cup[4;\\ +\\infty)$"}, {"key": "E", "text": "$[1;\\ 2]\\cup[4;\\ +\\infty)$"}]'::jsonb, 'B', NULL, NULL,
  'Qrafikdən: parabolanın qolları yuxarıdır və o, $x$ oxunu $1$ və $4$ nöqtələrində kəsir, deməli $f(x)=c(x-1)(x-4)$, $c>0$. Bərabərsizlik: $x(x-1)(x-2)(x-4)\le0$. İntervallar üsulu: $x>4$ olduqda ifadə müsbətdir, hər sadə kökdə işarə dəyişir. Həll: $[0;\ 1]\cup[2;\ 4]$.',
  2025, 'I', 103, 47)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0026 | əsas: 2025 toplu, I hissə, səh.104 №52
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='İkidərəcəli və yüksək dərəcəli bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'open',
  '$a^2<a$ şərtini ödəyən $a$-lar üçün $9-4a$ ifadəsinin tam qiymətlərinin cəmini tapın.',
  NULL, NULL, NULL, '21',
  '$a^2<a\Leftrightarrow a(a-1)<0\Leftrightarrow0<a<1$. Onda $5<9-4a<9$; tam qiymətlər $6,7,8$, cəmi $21$.',
  2025, 'I', 104, 52)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0027 | əsas: 2025 toplu, I hissə, səh.104 №53
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0027', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='İkidərəcəli və yüksək dərəcəli bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'open',
  '$a^2<a$ şərtini ödəyən $a$-lar üçün $2+6a$ ifadəsinin tam qiymətlərinin cəmini tapın.',
  NULL, NULL, NULL, '25',
  '$0<a<1\Rightarrow2<2+6a<8$; tam qiymətlər $3,4,5,6,7$, cəmi $25$.',
  2025, 'I', 104, 53)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0028 | əsas: 2025 toplu, I hissə, səh.104 №54
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0028', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='İkidərəcəli və yüksək dərəcəli bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'open',
  '$(x-6)\left(x^2-11x+30\right)>0$ bərabərsizliyinin ən kiçik natural həllini tapın.',
  NULL, NULL, NULL, '7',
  '$x^2-11x+30=(x-5)(x-6)$, ifadə $(x-6)^2(x-5)>0$. Bu, $x>5$ və $x\ne6$ deməkdir. Ən kiçik natural həll: $7$.',
  2025, 'I', 104, 54)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0029 | əsas: 2025 toplu, I hissə, səh.104 №55
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0029', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='İkidərəcəli və yüksək dərəcəli bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'open',
  '$(x-2)\left(x^2-5x+6\right)>0$ bərabərsizliyinin ən kiçik natural həllini tapın.',
  NULL, NULL, NULL, '4',
  '$(x-2)^2(x-3)>0\Leftrightarrow x>3$ (və $x\ne2$, bu avtomatik ödənir). Ən kiçik natural həll: $4$.',
  2025, 'I', 104, 55)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0030 | əsas: 2025 toplu, I hissə, səh.106 №20
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0030', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Rasional bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{x^3(x-2)}{(x+1)(x-4)}<0$ bərabərsizliyini həll edin.',
  '[{"key": "A", "text": "$[-1;\\ 0)\\cup(2;\\ 4]$"}, {"key": "B", "text": "$(-\\infty;\\ -1)\\cup(0;\\ 2)$"}, {"key": "C", "text": "$(-1;\\ 0)\\cup(2;\\ 4)$"}, {"key": "D", "text": "$(-1;\\ 4)$"}, {"key": "E", "text": "$(0;\\ 2)$"}]'::jsonb, 'C', NULL, NULL,
  '$x^3$ ilə $x$ eyni işarəlidir. Kritik nöqtələr: $-1;\ 0;\ 2;\ 4$ (hamısı tək dərəcəli). $x>4$ olduqda ifadə müsbətdir, hər nöqtədə işarə dəyişir: $(2;4)$ — mənfi, $(0;2)$ — müsbət, $(-1;0)$ — mənfi. Cavab: $(-1;\ 0)\cup(2;\ 4)$.',
  2025, 'I', 106, 20)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0031 | əsas: 2025 toplu, I hissə, səh.106 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0031', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Rasional bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{x^2\left(x^2-25\right)}{x+2}<0$ bərabərsizliyinin ən böyük tam həllini tapın.',
  '[{"key": "A", "text": "$5$"}, {"key": "B", "text": "$3$"}, {"key": "C", "text": "$0$"}, {"key": "D", "text": "$-3$"}, {"key": "E", "text": "$4$"}]'::jsonb, 'E', NULL, NULL,
  '$x^2>0$ ($x=0$ həll deyil). $\dfrac{(x-5)(x+5)}{x+2}<0$: həll $(-\infty;-5)\cup(-2;5)$, $x\ne0$. Ən böyük tam həll: $4$.',
  2025, 'I', 106, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0032 | əsas: 2025 toplu, I hissə, səh.107 №42
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0032', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Rasional bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'open',
  '$\dfrac{(6-x)^2}{x-9}<0$ bərabərsizliyinin $[3;\ 9)$ aralığına daxil olan tam həllərinin cəmini tapın.',
  NULL, NULL, NULL, '27',
  'Surət $\ge0$, sıfır olduqda ($x=6$) bərabərsizlik ödənmir. Deməli $x-9<0$ və $x\ne6$. $[3;9)$-da tam həllər: $3,4,5,7,8$; cəm $27$.',
  2025, 'I', 107, 42)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0033 | əsas: 2025 toplu, I hissə, səh.107 №43
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0033', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Rasional bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'open',
  '$\dfrac{(8-x)^2}{x-4}>0$ bərabərsizliyinin $(4;\ 11)$ aralığına daxil olan tam həllərinin cəmini tapın.',
  NULL, NULL, NULL, '37',
  '$x>4$ və $x\ne8$. $(4;11)$-də tam həllər: $5,6,7,9,10$; cəm $37$.',
  2025, 'I', 107, 43)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0034 | əsas: 2025 toplu, I hissə, səh.107 №45
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0034', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Rasional bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'open',
  '$\dfrac14<\dfrac{3}{2x-1}<\dfrac12$ bərabərsizliyini ödəyən tam ədədlərin sayını tapın.',
  NULL, NULL, NULL, '3',
  'Kəsr müsbət olduğundan $2x-1>0$. Tərs qiymətlərə keçək: $2<\dfrac{2x-1}{3}<4\Rightarrow6<2x-1<12\Rightarrow3{,}5<x<6{,}5$. Tam həllər: $4,5,6$ — $3$ ədəd.',
  2025, 'I', 107, 45)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0035 | əsas: 2025 toplu, I hissə, səh.107 №46
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0035', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Rasional bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'open',
  '$\dfrac15<\dfrac{2}{x+3}<\dfrac12$ bərabərsizliyini ödəyən tam ədədlərin sayını tapın.',
  NULL, NULL, NULL, '5',
  '$x+3>0$; $2<\dfrac{x+3}{2}<5\Rightarrow4<x+3<10\Rightarrow1<x<7$. Tam həllər: $2,\dots,6$ — $5$ ədəd.',
  2025, 'I', 107, 46)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0036 | əsas: 2025 toplu, I hissə, səh.108 №55
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0036', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Rasional bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'open',
  '$m$ parametrinin hansı ən kiçik tam qiymətində $\dfrac{x^2+mx+2}{x^2-x+1}<3$ bərabərsizliyi $x$-in istənilən həqiqi qiymətində doğrudur?',
  NULL, NULL, NULL, '-5',
  '$x^2-x+1>0$ (diskriminant mənfi), ona görə vurmaq olar: $x^2+mx+2<3x^2-3x+3\Rightarrow2x^2-(m+3)x+1>0$. Hər $x$ üçün: $(m+3)^2-8<0\Rightarrow-3-2\sqrt2<m<-3+2\sqrt2$. $2\sqrt2\approx2{,}83$, ona görə $m\in(-5{,}83;\ -0{,}17)$; ən kiçik tam qiymət $-5$.',
  2025, 'I', 108, 55)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0037 | əsas: 2025 toplu, I hissə, səh.108 №56
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0037', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Rasional bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'open',
  '$m$ parametrinin hansı ən kiçik tam qiymətində $\dfrac{x^2-mx+1}{x^2+x+1}>-2$ bərabərsizliyi $x$-in istənilən həqiqi qiymətində doğrudur?',
  NULL, NULL, NULL, '-3',
  '$x^2+x+1>0$: $x^2-mx+1>-2x^2-2x-2\Rightarrow3x^2+(2-m)x+3>0$. Şərt: $(2-m)^2-36<0\Rightarrow-4<m<8$. Ən kiçik tam qiymət: $-3$.',
  2025, 'I', 108, 56)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0038 | əsas: 2025 toplu, I hissə, səh.108 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0038', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Modul işarəsi daxilində dəyişəni olan bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$3{,}5<|x|<8$ bərabərsizliyinin ən böyük tam həlli ilə ən kiçik müsbət tam həllinin cəmini tapın.',
  '[{"key": "A", "text": "$11$"}, {"key": "B", "text": "$7$"}, {"key": "C", "text": "$12$"}, {"key": "D", "text": "$15$"}, {"key": "E", "text": "$0$"}]'::jsonb, 'A', NULL, NULL,
  'Tam həllər: $\pm4,\pm5,\pm6,\pm7$. Ən böyüyü $7$, ən kiçik müsbəti $4$. Cəm: $11$.',
  2025, 'I', 108, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0039 | əsas: 2025 toplu, I hissə, səh.108 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0039', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Modul işarəsi daxilində dəyişəni olan bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$1{,}5<|x|<6{,}4$ bərabərsizliyinin ən kiçik tam həlli ilə ən kiçik müsbət tam həllinin hasilini tapın.',
  '[{"key": "A", "text": "$-4$"}, {"key": "B", "text": "$-12$"}, {"key": "C", "text": "$0$"}, {"key": "D", "text": "$12$"}, {"key": "E", "text": "$-6$"}]'::jsonb, 'B', NULL, NULL,
  'Tam həllər: $\pm2,\dots,\pm6$. Ən kiçiyi $-6$, ən kiçik müsbəti $2$. Hasil: $-12$.',
  2025, 'I', 108, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0040 | əsas: 2025 toplu, I hissə, səh.109 №20
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0040', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Modul işarəsi daxilində dəyişəni olan bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{x+1}{|5-x|}>0$ bərabərsizliyinin ən kiçik tam həllini tapın.',
  '[{"key": "A", "text": "$5$"}, {"key": "B", "text": "$0$"}, {"key": "C", "text": "$-1$"}, {"key": "D", "text": "$1$"}, {"key": "E", "text": "$6$"}]'::jsonb, 'B', NULL, NULL,
  'Məxrəc $x\ne5$ olduqda müsbətdir. Onda $x+1>0$, $x\ne5$: $x\in(-1;5)\cup(5;+\infty)$. Ən kiçik tam həll: $0$.',
  2025, 'I', 109, 20)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0041 | əsas: 2025 toplu, I hissə, səh.109 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0041', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Modul işarəsi daxilində dəyişəni olan bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{x-7}{|6-x|}<0$ bərabərsizliyinin ən böyük tam həllini tapın.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$7$"}, {"key": "C", "text": "$6$"}, {"key": "D", "text": "$5$"}, {"key": "E", "text": "$-6$"}]'::jsonb, 'D', NULL, NULL,
  '$x\ne6$ olduqda məxrəc müsbətdir: $x<7$, $x\ne6$. Ən böyük tam həll: $5$.',
  2025, 'I', 109, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0042 | əsas: 2025 toplu, I hissə, səh.109 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0042', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Modul işarəsi daxilində dəyişəni olan bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'matching',
  'Uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$\\dfrac{x+4}{x-2}\\le0$"}, {"key": "2", "text": "$|x-3|<2$"}, {"key": "3", "text": "$x^2+2x+5>0$"}], "right": [{"key": "a", "text": "tam həllərinin cəmi $(-9)$-a bərabərdir"}, {"key": "b", "text": "tam həllərinin sayı $3$-ə bərabərdir"}, {"key": "c", "text": "tam həllərinin sayı $6$-ya bərabərdir"}, {"key": "d", "text": "həlli yoxdur"}, {"key": "e", "text": "həlli bütün həqiqi ədədlər çoxluğudur"}]}'::jsonb, NULL, '{"1": ["a", "c"], "2": ["b"], "3": ["e"]}'::jsonb, NULL,
  '1) $[-4;\ 2)$: tam həllər $-4,-3,-2,-1,0,1$ — sayı $6$, cəmi $-9$. 2) $1<x<5$: tam həllər $2,3,4$ — sayı $3$. 3) $D=4-20<0$ və baş əmsal müsbət — bərabərsizlik hər $x$ üçün doğrudur.',
  2025, 'I', 109, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0043 | əsas: 2025 toplu, I hissə, səh.109 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0043', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Modul işarəsi daxilində dəyişəni olan bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'matching',
  'Uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$|x-1|<5$"}, {"key": "2", "text": "$2{,}5<|x|<6$"}, {"key": "3", "text": "$\\dfrac13<\\dfrac1x<1$"}], "right": [{"key": "a", "text": "ən kiçik tam həlli $(-3)$-dür"}, {"key": "b", "text": "üç natural həlli var"}, {"key": "c", "text": "ən böyük tam həlli $5$-dir"}, {"key": "d", "text": "yalnız bir tam həlli var"}, {"key": "e", "text": "ən kiçik tam həlli $(-5)$-dir"}]}'::jsonb, NULL, '{"1": ["a", "c"], "2": ["b", "c", "e"], "3": ["d"]}'::jsonb, NULL,
  '1) $-4<x<6$: tam həllər $-3,\dots,5$ — ən kiçiyi $-3$, ən böyüyü $5$ (natural həllər $1,\dots,5$ — beş). 2) Tam həllər $\pm3,\pm4,\pm5$: ən kiçiyi $-5$, ən böyüyü $5$, natural həllər $3,4,5$ — üç. 3) $x>0$ və $1<x<3$: yeganə tam həll $2$.',
  2025, 'I', 109, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0044 | əsas: 2025 toplu, I hissə, səh.109 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0044', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Modul işarəsi daxilində dəyişəni olan bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'matching',
  'Bərabərsizliklər üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$|x+2|<4$"}, {"key": "2", "text": "$3{,}2<|x|<5{,}5$"}, {"key": "3", "text": "$\\dfrac14<\\dfrac2x<1$"}], "right": [{"key": "a", "text": "ən böyük tam həlli $5$-dir"}, {"key": "b", "text": "iki natural həlli var"}, {"key": "c", "text": "ən kiçik tam həlli $(-5)$-dir"}, {"key": "d", "text": "beş natural həlli var"}, {"key": "e", "text": "ən böyük tam həlli $1$-dir"}]}'::jsonb, NULL, '{"1": ["c", "e"], "2": ["a", "b", "c"], "3": ["d"]}'::jsonb, NULL,
  '1) $-6<x<2$: tam həllər $-5,\dots,1$ — ən kiçiyi $-5$, ən böyüyü $1$. 2) Tam həllər $\pm4,\pm5$: ən böyüyü $5$, ən kiçiyi $-5$, natural həllər $4,5$ — iki. 3) $x>0$: $\dfrac14<\dfrac2x<1\Rightarrow2<x<8$, natural həllər $3,4,5,6,7$ — beş.',
  2025, 'I', 109, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0045 | əsas: 2025 toplu, I hissə, səh.111 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0045', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Kvadrat bərabərsizliklər sistemi. İrrasional bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}x^2-2x-8\ge0,\\x^2-7x<0\end{cases}$ bərabərsizliklər sisteminin tam həllərinin cəmini tapın.',
  '[{"key": "A", "text": "$6$"}, {"key": "B", "text": "$9$"}, {"key": "C", "text": "$15$"}, {"key": "D", "text": "$10$"}, {"key": "E", "text": "$22$"}]'::jsonb, 'C', NULL, NULL,
  'Birinci: $(x-4)(x+2)\ge0\Rightarrow x\le-2$ və ya $x\ge4$. İkinci: $x(x-7)<0\Rightarrow0<x<7$. Kəsişmə: $[4;\ 7)$. Tam həllər $4,5,6$, cəmi $15$.',
  2025, 'I', 111, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- BRS-0046 | əsas: 2025 toplu, I hissə, səh.111 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('BRS-0046', NULL, NULL, (SELECT id FROM topics WHERE name='Bərabərsizliklər və sistemləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Bərabərsizliklər və sistemləri' AND s.title='Kvadrat bərabərsizliklər sistemi. İrrasional bərabərsizliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}x^2-4\ge0,\\x^2+2x-15\le0\end{cases}$ bərabərsizliklər sisteminin ən böyük və ən kiçik tam həllərinin cəmini tapın.',
  '[{"key": "A", "text": "$8$"}, {"key": "B", "text": "$-2$"}, {"key": "C", "text": "$-8$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$-5$"}]'::jsonb, 'B', NULL, NULL,
  'Birinci: $|x|\ge2$. İkinci: $(x+5)(x-3)\le0\Rightarrow-5\le x\le3$. Kəsişmə: $[-5;\ -2]\cup[2;\ 3]$. Ən böyük tam həll $3$, ən kiçiyi $-5$; cəm $-2$.',
  2025, 'I', 111, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
