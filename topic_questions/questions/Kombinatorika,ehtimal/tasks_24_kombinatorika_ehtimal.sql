-- Mövzu: Kombinatorika və ehtimal — 45 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- KEH-0001 | əsas: 2025 toplu, II hissə, səh.170 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '${}_7P_7-{}_5P_5$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$4920$"}, {"key": "B", "text": "$5160$"}, {"key": "C", "text": "$2!$"}, {"key": "D", "text": "$4800$"}, {"key": "E", "text": "$5040$"}]'::jsonb, 'A', NULL, NULL,
  '${}_7P_7=7!=5040$, ${}_5P_5=5!=120$. $5040-120=4920$.',
  2025, 'II', 170, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0002 | əsas: 2025 toplu, II hissə, səh.170 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '${}_6P_6-{}_6C_4$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$600$"}, {"key": "B", "text": "$690$"}, {"key": "C", "text": "$705$"}, {"key": "D", "text": "$715$"}, {"key": "E", "text": "$360$"}]'::jsonb, 'C', NULL, NULL,
  '${}_6P_6=720$, ${}_6C_4=\dfrac{6\cdot5}{2}=15$. $720-15=705$.',
  2025, 'II', 170, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0003 | əsas: 2025 toplu, II hissə, səh.170 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$6!-3!$ fərqini hesablayın.',
  '[{"key": "A", "text": "$3$"}, {"key": "B", "text": "$714$"}, {"key": "C", "text": "$720$"}, {"key": "D", "text": "$6$"}, {"key": "E", "text": "$117$"}]'::jsonb, 'B', NULL, NULL,
  '$6!=720$, $3!=6$. $720-6=714$.',
  2025, 'II', 170, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0004 | əsas: 2025 toplu, II hissə, səh.170 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$5!+4!$ ifadəsinin qiymətini tapın.',
  '[{"key": "A", "text": "$120$"}, {"key": "B", "text": "$72$"}, {"key": "C", "text": "$9$"}, {"key": "D", "text": "$144$"}, {"key": "E", "text": "$240$"}]'::jsonb, 'D', NULL, NULL,
  '$5!=120$, $4!=24$. $120+24=144$.',
  2025, 'II', 170, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0005 | əsas: 2025 toplu, II hissə, səh.170 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{7!}{{}_6P_3}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$7$"}, {"key": "B", "text": "$6$"}, {"key": "C", "text": "$35$"}, {"key": "D", "text": "$42$"}, {"key": "E", "text": "$21$"}]'::jsonb, 'D', NULL, NULL,
  '${}_6P_3=6\cdot5\cdot4=120$. $\dfrac{5040}{120}=42$.',
  2025, 'II', 170, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0006 | əsas: 2025 toplu, II hissə, səh.170 №27
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{8!}{{}_7P_4}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$96$"}, {"key": "B", "text": "$48$"}, {"key": "C", "text": "$24$"}, {"key": "D", "text": "$56$"}, {"key": "E", "text": "$8$"}]'::jsonb, 'B', NULL, NULL,
  '${}_7P_4=7\cdot6\cdot5\cdot4=840$. $\dfrac{40320}{840}=48$.',
  2025, 'II', 170, 27)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0007 | əsas: 2025 toplu, II hissə, səh.171 №34
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0007', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{{}_7P_7+{}_5P_5}{{}_6P_6}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$6\\dfrac16$"}, {"key": "B", "text": "$7$"}, {"key": "C", "text": "$7\\dfrac16$"}, {"key": "D", "text": "$8$"}, {"key": "E", "text": "$7\\dfrac14$"}]'::jsonb, 'C', NULL, NULL,
  'Surəti və məxrəci $5!$-ə bölək: $\dfrac{42+1}{6}=\dfrac{43}{6}=7\dfrac16$.',
  2025, 'II', 171, 34)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0008 | əsas: 2025 toplu, II hissə, səh.171 №35
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{{}_6P_6+{}_7P_7}{{}_8P_8}$ ifadəsini hesablayın.',
  '[{"key": "A", "text": "$\\dfrac{1}{7}$"}, {"key": "B", "text": "$\\dfrac{1}{6}$"}, {"key": "C", "text": "$\\dfrac{6}{7}$"}, {"key": "D", "text": "$\\dfrac{1}{8}$"}, {"key": "E", "text": "$\\dfrac{7}{8}$"}]'::jsonb, 'A', NULL, NULL,
  '$6!$-ə bölək: $\dfrac{1+7}{7\cdot8}=\dfrac{8}{56}=\dfrac17$.',
  2025, 'II', 171, 35)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0009 | əsas: 2025 toplu, II hissə, səh.171 №36
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{{}_8P_8-{}_6P_6}{{}_7P_7}$ ifadəsini hesablayın.',
  '[{"key": "A", "text": "$7\\dfrac67$"}, {"key": "B", "text": "$8\\dfrac17$"}, {"key": "C", "text": "$7\\dfrac12$"}, {"key": "D", "text": "$8$"}, {"key": "E", "text": "$-8$"}]'::jsonb, 'A', NULL, NULL,
  '$6!$-ə bölək: $\dfrac{56-1}{7}=\dfrac{55}{7}=7\dfrac67$.',
  2025, 'II', 171, 36)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0010 | əsas: 2025 toplu, II hissə, səh.171 №43
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$(a+5)^{10}$ binomunun ayrılışında orta həddin binomial əmsalını tapın.',
  '[{"key": "A", "text": "${}_{10}C_6+1$"}, {"key": "B", "text": "${}_{10}C_{10}$"}, {"key": "C", "text": "${}_{10}C_4$"}, {"key": "D", "text": "${}_{10}C_5$"}, {"key": "E", "text": "${}_{10}C_3$"}]'::jsonb, 'D', NULL, NULL,
  '$n=10$ olduqda ayrılışda $11$ hədd var, orta hədd $6$-cı həddir: $T_6={}_{10}C_5\,a^5\cdot5^5$. Binomial əmsal ${}_{10}C_5$-dir.',
  2025, 'II', 171, 43)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0011 | əsas: 2025 toplu, II hissə, səh.171 №44
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0011', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$(x+1)^n$ binomunun açılışında binomial əmsalların cəmi $256$ olarsa, binomun $5$-ci həddini tapın.',
  '[{"key": "A", "text": "$28x^6$"}, {"key": "B", "text": "$56x^3$"}, {"key": "C", "text": "$70x^4$"}, {"key": "D", "text": "$35x^4$"}, {"key": "E", "text": "$56x^5$"}]'::jsonb, 'C', NULL, NULL,
  '$2^n=256\Rightarrow n=8$. $T_5={}_8C_4\,x^{4}\cdot1^4=70x^4$.',
  2025, 'II', 171, 44)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0012 | əsas: 2025 toplu, II hissə, səh.171 №45
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0012', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$(x+1)^n$ binomunun açılışında tək yerdə duran binomial əmsalların cəmi ilə cüt yerdə duran binomial əmsalların cəmi $256$ olarsa, binomun $4$-cü həddini tapın.',
  '[{"key": "A", "text": "$20x^5$"}, {"key": "B", "text": "$56x^5$"}, {"key": "C", "text": "$70x^4$"}, {"key": "D", "text": "$56x^3$"}, {"key": "E", "text": "$28x^6$"}]'::jsonb, 'B', NULL, NULL,
  'Bütün binomial əmsalların cəmi $2^n=256\Rightarrow n=8$. $T_4={}_8C_3\,x^{5}=56x^5$.',
  2025, 'II', 171, 45)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0013 | əsas: 2025 toplu, II hissə, səh.171 №49
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '“Statistika” sözünün hərflərinin yerini dəyişməklə neçə fərqli “söz” yazmaq olar?',
  '[{"key": "A", "text": "$10!$"}, {"key": "B", "text": "$75600$"}, {"key": "C", "text": "$151200$"}, {"key": "D", "text": "$720$"}, {"key": "E", "text": "$302400$"}]'::jsonb, 'B', NULL, NULL,
  '$10$ hərf var: s – $2$, t – $3$, a – $2$, i – $2$, k – $1$ dəfə. $\dfrac{10!}{2!\cdot3!\cdot2!\cdot2!}=\dfrac{3628800}{48}=75600$.',
  2025, 'II', 171, 49)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0014 | əsas: 2025 toplu, II hissə, səh.171 №50
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '“Həndəsə” sözünün hərflərinin yerini dəyişməklə neçə fərqli “söz” yazmaq olar?',
  '[{"key": "A", "text": "$6!$"}, {"key": "B", "text": "$120$"}, {"key": "C", "text": "$7!$"}, {"key": "D", "text": "$420$"}, {"key": "E", "text": "$840$"}]'::jsonb, 'E', NULL, NULL,
  '$7$ hərf var, “ə” hərfi $3$ dəfə təkrarlanır: $\dfrac{7!}{3!}=840$.',
  2025, 'II', 171, 50)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0015 | əsas: 2025 toplu, II hissə, səh.171 №51
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0015', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Avtomobil sərgisində yeddi müxtəlif markalı avtomobilin hər birindən bir ədəd nümayiş olunur. Onlar səhnədə yan-yana neçə fərqli şəkildə düzülə bilər?',
  '[{"key": "A", "text": "$720$"}, {"key": "B", "text": "$42$"}, {"key": "C", "text": "$49$"}, {"key": "D", "text": "$7$"}, {"key": "E", "text": "$5040$"}]'::jsonb, 'E', NULL, NULL,
  '$7$ müxtəlif obyektin yerdəyişmələrinin sayı: $7!=5040$.',
  2025, 'II', 171, 51)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0016 | əsas: 2025 toplu, II hissə, səh.171 №52
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Avtomobil sərgisində dörd müxtəlif markalı avtomobilin hər birindən bir ədəd nümayiş olunur. Onlar səhnədə yan-yana neçə fərqli şəkildə düzülə bilər?',
  '[{"key": "A", "text": "$1$"}, {"key": "B", "text": "$16$"}, {"key": "C", "text": "$24$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$12$"}]'::jsonb, 'C', NULL, NULL,
  '$4!=24$.',
  2025, 'II', 171, 52)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0017 | əsas: 2025 toplu, II hissə, səh.172 №61
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Anar, Babək, Cavid, Elçin, Fuad, Kamil, Murad və Nicat bir sırada durub şəkil çəkdirməlidirlər. Babək, Fuad və Nicat yan-yana olmaqla neçə mümkün şəkil çəkilə bilər?',
  '[{"key": "A", "text": "$3\\cdot6!$"}, {"key": "B", "text": "$1440$"}, {"key": "C", "text": "$720$"}, {"key": "D", "text": "$4320$"}, {"key": "E", "text": "$8!$"}]'::jsonb, 'D', NULL, NULL,
  'Yan-yana duranları bir “blok” kimi götürək: $6$ obyekt $6!$ üsulla düzülür, blokun daxilində $3!$ üsul. $6!\cdot3!=720\cdot6=4320$.',
  2025, 'II', 172, 61)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0018 | əsas: 2025 toplu, II hissə, səh.172 №62
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Aydın, Elşən, İlkin, Orxan, Rauf, Səbuhi, Tural və Vüsal bir sırada durub şəkil çəkdirməlidirlər. Elşən, Orxan, Səbuhi və Vüsal yan-yana olmaqla neçə mümkün şəkil çəkilə bilər?',
  '[{"key": "A", "text": "$2880$"}, {"key": "B", "text": "$1440$"}, {"key": "C", "text": "$4\\cdot5!$"}, {"key": "D", "text": "$8!$"}, {"key": "E", "text": "$576$"}]'::jsonb, 'A', NULL, NULL,
  'Blok + qalan $4$ nəfər $=5$ obyekt: $5!$, blok daxilində $4!$. $120\cdot24=2880$.',
  2025, 'II', 172, 62)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0019 | əsas: 2025 toplu, II hissə, səh.173 №86
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'written',
  '$\dfrac{{}_{n+4}P_{n+4}}{{}_{n+3}P_{n+3}}=3n-6$ tənliyini həll edin.',
  NULL, NULL, NULL, '5',
  '$\dfrac{(n+4)!}{(n+3)!}=n+4$. $n+4=3n-6\Rightarrow n=5$.',
  2025, 'II', 173, 86)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0020 | əsas: 2025 toplu, II hissə, səh.173 №87
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'written',
  '$\dfrac{{}_{n+5}P_{n+5}}{{}_{n+4}P_{n+4}}=4n-7$ tənliyini həll edin.',
  NULL, NULL, NULL, '4',
  '$\dfrac{(n+5)!}{(n+4)!}=n+5$. $n+5=4n-7\Rightarrow n=4$.',
  2025, 'II', 173, 87)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0021 | əsas: 2025 toplu, II hissə, səh.173 №97
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'written',
  '$5\cdot{}_nP_2+72={}_{3n}P_2$ bərabərliyini ödəyən $n$ natural ədədini tapın.',
  NULL, NULL, NULL, '4',
  '$5n(n-1)+72=3n(3n-1)\Rightarrow 5n^2-5n+72=9n^2-3n\Rightarrow 2n^2+n-36=0$. $n=4$ (ikinci kök mənfidir).',
  2025, 'II', 173, 97)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0022 | əsas: 2025 toplu, II hissə, səh.173 №98
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'written',
  '$2\cdot{}_nP_2+50={}_{2n}P_2$ bərabərliyini ödəyən $n$ natural ədədini tapın.',
  NULL, NULL, NULL, '5',
  '$2n(n-1)+50=2n(2n-1)\Rightarrow 2n^2-2n+50=4n^2-2n\Rightarrow n^2=25$, $n=5$.',
  2025, 'II', 173, 98)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0023 | əsas: 2025 toplu, II hissə, səh.175 №165
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'written',
  '$(x-2)^n$ binomunun açılışında binomial əmsalların cəmi $256$ olarsa, $3$-cü həddin əmsalını tapın.',
  NULL, NULL, NULL, '112',
  '$2^n=256\Rightarrow n=8$. $T_3={}_8C_2\,x^6(-2)^2=28\cdot4\,x^6=112x^6$. Əmsal $112$.',
  2025, 'II', 175, 165)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0024 | əsas: 2025 toplu, II hissə, səh.175 №166
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'written',
  '$(x+3)^n$ binomunun açılışında binomial əmsalların cəmi $64$ olarsa, $4$-cü həddin əmsalını tapın.',
  NULL, NULL, NULL, '540',
  '$2^n=64\Rightarrow n=6$. $T_4={}_6C_3\,x^3\cdot3^3=20\cdot27\,x^3=540x^3$. Əmsal $540$.',
  2025, 'II', 175, 166)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0025 | əsas: 2025 toplu, II hissə, səh.177 №193
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0025', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'written',
  'Bilik yarışmasında bir komandanın $11$ üzvündən $6$-sı iştirak etməlidir. Seçilən altı nəfərdən də ikisi kapitan və onun köməkçisi olmalıdır. Seçim neçə fərqli üsulla yerinə yetirilə bilər?',
  NULL, NULL, NULL, '13860',
  'Kapitan $11$, köməkçi $10$ üsulla, qalan $4$ nəfər $9$ nəfərdən ${}_9C_4=126$ üsulla seçilir: $11\cdot10\cdot126=13860$.',
  2025, 'II', 177, 193)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0026 | əsas: 2025 toplu, II hissə, səh.177 №194
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'written',
  'Bilik yarışmasında bir komandanın $8$ üzvündən $5$-i iştirak etməlidir. Seçilən beş nəfərdən də ikisi kapitan və onun köməkçisi olmalıdır. Seçim neçə fərqli üsulla yerinə yetirilə bilər?',
  NULL, NULL, NULL, '1120',
  '$8\cdot7\cdot{}_6C_3=56\cdot20=1120$.',
  2025, 'II', 177, 194)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0027 | əsas: 2025 toplu, II hissə, səh.177 №199
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0027', '/images/tasks/KEH-0027.png', 'Sütun diaqramı: I torba – 5 ağ, 3 qara; II torba – 7 ağ, 6 qara; III torba – 4 ağ, 9 qara', (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'written',
  'Diaqramda $3$ torbada verilmiş ağ və qara kürələrin sayı verilmişdir. Bu torbaların hər birindən eyni zamanda bir kürə çıxarılır. Onların üçünün də eyni rəngli olmasının mümkün hallarının sayını tapın.',
  NULL, NULL, NULL, '302',
  'Hamısı ağ: $5\cdot7\cdot4=140$; hamısı qara: $3\cdot6\cdot9=162$. Cəmi $140+162=302$.',
  2025, 'II', 177, 199)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0028 | əsas: 2025 toplu, II hissə, səh.178 №200
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0028', '/images/tasks/KEH-0028.png', 'Sütun diaqramı: I torba – 8 ağ, 2 qara; II torba – 4 ağ, 9 qara; III torba – 6 ağ, 5 qara', (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Birləşmələr nəzəriyyəsi'), 'original', 'own', 'az', 'draft', 'written',
  'Diaqramda $3$ torbada verilmiş ağ və qara kürələrin sayı verilmişdir. Bu torbaların hər birindən eyni zamanda bir kürə çıxarılır. Onların üçünün də eyni rəngli olmasının mümkün hallarının sayını tapın.',
  NULL, NULL, NULL, '282',
  'Hamısı ağ: $8\cdot4\cdot6=192$; hamısı qara: $2\cdot9\cdot5=90$. Cəmi $192+90=282$.',
  2025, 'II', 178, 200)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0029 | əsas: 2025 toplu, II hissə, səh.178 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0029', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Ehtimal nəzəriyyəsi və statistika'), 'original', 'own', 'az', 'draft', 'closed',
  'İki zəri birgə atdıqda düşən xalların fərqinin $2$ olması hadisəsinin ehtimalını tapın.',
  '[{"key": "A", "text": "$\\dfrac{1}{6}$"}, {"key": "B", "text": "$\\dfrac{2}{9}$"}, {"key": "C", "text": "$\\dfrac{5}{18}$"}, {"key": "D", "text": "$\\dfrac{1}{9}$"}, {"key": "E", "text": "$\\dfrac{1}{3}$"}]'::jsonb, 'B', NULL, NULL,
  'Əlverişli hallar: $(1;3),(2;4),(3;5),(4;6)$ və əksinə – $8$ hal. $P=\dfrac{8}{36}=\dfrac29$.',
  2025, 'II', 178, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0030 | əsas: 2025 toplu, II hissə, səh.178 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0030', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Ehtimal nəzəriyyəsi və statistika'), 'original', 'own', 'az', 'draft', 'closed',
  'İki zəri birgə atdıqda düşən xalların fərqinin $4$ olması hadisəsinin ehtimalını tapın.',
  '[{"key": "A", "text": "$\\dfrac{1}{6}$"}, {"key": "B", "text": "$\\dfrac{2}{9}$"}, {"key": "C", "text": "$\\dfrac{1}{9}$"}, {"key": "D", "text": "$\\dfrac{1}{18}$"}, {"key": "E", "text": "$\\dfrac{1}{36}$"}]'::jsonb, 'C', NULL, NULL,
  'Əlverişli hallar: $(1;5),(2;6),(5;1),(6;2)$ – $4$ hal. $P=\dfrac{4}{36}=\dfrac19$.',
  2025, 'II', 178, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0031 | əsas: 2025 toplu, II hissə, səh.178 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0031', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Ehtimal nəzəriyyəsi və statistika'), 'original', 'own', 'az', 'draft', 'closed',
  '$[1;25]$ parçasına daxil olan natural ədədlər arasından təsadüfən götürülmüş ədədin sadə ədəd olması hadisəsinin ehtimalını tapın.',
  '[{"key": "A", "text": "$0{,}44$"}, {"key": "B", "text": "$0{,}32$"}, {"key": "C", "text": "$0{,}36$"}, {"key": "D", "text": "$\\dfrac13$"}, {"key": "E", "text": "$0{,}4$"}]'::jsonb, 'C', NULL, NULL,
  'Sadə ədədlər: $2,3,5,7,11,13,17,19,23$ – $9$ ədəd. $P=\dfrac{9}{25}=0{,}36$.',
  2025, 'II', 178, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0032 | əsas: 2025 toplu, II hissə, səh.178 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0032', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Ehtimal nəzəriyyəsi və statistika'), 'original', 'own', 'az', 'draft', 'closed',
  '$[1;16]$ parçasından təsadüfən götürülmüş natural ədədin mürəkkəb ədəd olması hadisəsinin ehtimalını tapın.',
  '[{"key": "A", "text": "$\\dfrac{7}{16}$"}, {"key": "B", "text": "$\\dfrac{5}{8}$"}, {"key": "C", "text": "$\\dfrac{1}{2}$"}, {"key": "D", "text": "$\\dfrac{9}{16}$"}, {"key": "E", "text": "$\\dfrac{3}{8}$"}]'::jsonb, 'D', NULL, NULL,
  'Mürəkkəb ədədlər: $4,6,8,9,10,12,14,15,16$ – $9$ ədəd ($1$ nə sadə, nə mürəkkəbdir). $P=\dfrac{9}{16}$.',
  2025, 'II', 178, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0033 | əsas: 2025 toplu, II hissə, səh.179 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0033', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Ehtimal nəzəriyyəsi və statistika'), 'original', 'own', 'az', 'draft', 'closed',
  'Bütün ikirəqəmli natural ədədlər ayrı-ayrı vərəqlərə yazılaraq torbaya atılıb. Torbadan təsadüfi seçilən bir vərəqin üzərindəki ədədin $8$-ə tam bölünən ədəd olması hadisəsinin ehtimalını tapın.',
  '[{"key": "A", "text": "$\\dfrac{11}{90}$"}, {"key": "B", "text": "$\\dfrac{1}{8}$"}, {"key": "C", "text": "$\\dfrac{13}{90}$"}, {"key": "D", "text": "$\\dfrac{1}{9}$"}, {"key": "E", "text": "$\\dfrac{2}{15}$"}]'::jsonb, 'A', NULL, NULL,
  '$16,24,\dots,96$ – $\dfrac{96-16}{8}+1=11$ ədəd; ikirəqəmli ədədlər $90$-dır. $P=\dfrac{11}{90}$.',
  2025, 'II', 179, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0034 | əsas: 2025 toplu, II hissə, səh.182 №48
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0034', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Ehtimal nəzəriyyəsi və statistika'), 'original', 'own', 'az', 'draft', 'closed',
  'Bütün ikirəqəmli natural ədədlər ayrı-ayrı vərəqlərə yazılaraq torbaya atılıb. Torbadan təsadüfi seçilən bir vərəqin üzərindəki ədədin $9$-a tam bölünən ədəd olması hadisəsinin ehtimalını tapın.',
  '[{"key": "A", "text": "$\\dfrac{1}{9}$"}, {"key": "B", "text": "$\\dfrac{2}{15}$"}, {"key": "C", "text": "$\\dfrac{4}{45}$"}, {"key": "D", "text": "$\\dfrac{11}{90}$"}, {"key": "E", "text": "$\\dfrac{1}{10}$"}]'::jsonb, 'A', NULL, NULL,
  '$18,27,\dots,99$ – $10$ ədəd. $P=\dfrac{10}{90}=\dfrac19$.',
  2025, 'II', 182, 48)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0035 | əsas: 2025 toplu, II hissə, səh.182 №52
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0035', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Ehtimal nəzəriyyəsi və statistika'), 'original', 'own', 'az', 'draft', 'closed',
  '$1,2,3,4,5,6$ rəqəmlərindən, rəqəmlər təkrar **_olunmamaqla_** düzəldilməsi mümkün olan bütün altırəqəmli ədədlərdən təsadüfən götürülmüş birinin $21$ ilə qurtarması hadisəsinin ehtimalını tapın.',
  '[{"key": "A", "text": "$\\dfrac{1}{6}$"}, {"key": "B", "text": "$\\dfrac{1}{20}$"}, {"key": "C", "text": "$\\dfrac{1}{15}$"}, {"key": "D", "text": "$\\dfrac{1}{36}$"}, {"key": "E", "text": "$\\dfrac{1}{30}$"}]'::jsonb, 'E', NULL, NULL,
  'Bütün hallar $6!=720$. Sonu $21$ olanlarda qalan $4$ rəqəm $4!=24$ üsulla düzülür. $P=\dfrac{24}{720}=\dfrac{1}{30}$.',
  2025, 'II', 182, 52)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0036 | əsas: 2025 toplu, II hissə, səh.182 №53
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0036', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Ehtimal nəzəriyyəsi və statistika'), 'original', 'own', 'az', 'draft', 'closed',
  '$1,2,3,4,5,6,7$ rəqəmlərindən, rəqəmlər təkrar **_olunmamaqla_** düzəldilməsi mümkün olan bütün yeddirəqəmli ədədlərdən təsadüfən götürülmüş birinin cüt ədəd olması hadisəsinin ehtimalını tapın.',
  '[{"key": "A", "text": "$\\dfrac{3}{7}$"}, {"key": "B", "text": "$\\dfrac{1}{7}$"}, {"key": "C", "text": "$\\dfrac{4}{7}$"}, {"key": "D", "text": "$\\dfrac{1}{2}$"}, {"key": "E", "text": "$\\dfrac{3}{4}$"}]'::jsonb, 'A', NULL, NULL,
  'Ədəd cüt olması üçün son rəqəm $2,4$ və ya $6$ olmalıdır. Son rəqəmin $7$ mümkün qiymətindən $3$-ü əlverişlidir: $P=\dfrac37$.',
  2025, 'II', 182, 53)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0037 | əsas: 2025 toplu, II hissə, səh.182 №54
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0037', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Ehtimal nəzəriyyəsi və statistika'), 'original', 'own', 'az', 'draft', 'closed',
  '$A$ çoxluğunun elementlərinin sayı $25$, $B$ çoxluğunun elementlərinin sayı $14$, onların ortaq elementlərinin sayı $6$-dır. Bu çoxluqların birləşməsindən təsadüfən götürülən bir elementin ortaq element olması hadisəsinin ehtimalını tapın.',
  '[{"key": "A", "text": "$\\dfrac{2}{13}$"}, {"key": "B", "text": "$\\dfrac{1}{11}$"}, {"key": "C", "text": "$\\dfrac37$"}, {"key": "D", "text": "$\\dfrac{6}{25}$"}, {"key": "E", "text": "$\\dfrac{2}{11}$"}]'::jsonb, 'E', NULL, NULL,
  '$n(A\cup B)=25+14-6=33$. $P=\dfrac{6}{33}=\dfrac{2}{11}$.',
  2025, 'II', 182, 54)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0038 | əsas: 2025 toplu, II hissə, səh.183 №63
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0038', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Ehtimal nəzəriyyəsi və statistika'), 'original', 'own', 'az', 'draft', 'closed',
  'Məktəbin müxtəlif dilləri bilən şagirdlərinin sayı cədvəldə verilmişdir. Beynəlxalq tədbirdə iştirak etmək üçün təsadüfən seçilən iki nəfərdən birinin fransız dilini bilən oğlan, digərinin ingilis dilini bilən qız olması hadisəsinin ehtimalını tapın.

$$\begin{array}{|l|c|c|c|}\hline \text{Şagirdlər}\backslash\text{Dil} & \text{Alman dili} & \text{Fransız dili} & \text{İngilis dili}\\ \hline \text{Oğlanlar} & 10 & 14 & 16\\ \hline \text{Qızlar} & 15 & 20 & 25\\ \hline\end{array}$$',
  '[{"key": "A", "text": "$\\dfrac{14}{99}$"}, {"key": "B", "text": "$\\dfrac{7}{50}$"}, {"key": "C", "text": "$\\dfrac{7}{198}$"}, {"key": "D", "text": "$\\dfrac{7}{99}$"}, {"key": "E", "text": "$\\dfrac{1}{9}$"}]'::jsonb, 'D', NULL, NULL,
  'Cəmi şagird: $40+60=100$. Bütün hallar ${}_{100}C_2=4950$. Əlverişli: $14\cdot25=350$. $P=\dfrac{350}{4950}=\dfrac{7}{99}$.',
  2025, 'II', 183, 63)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0039 | əsas: 2025 toplu, II hissə, səh.183 №65
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0039', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Ehtimal nəzəriyyəsi və statistika'), 'original', 'own', 'az', 'draft', 'closed',
  'Şahmat turnirində $26$ şahmatçı iştirak edir. İlk görüşəcək $2$ şahmatçının təyin edildiyini bilərək, növbəti görüşün Orxan və Kamran arasında olması hadisəsinin ehtimalını tapın.',
  '[{"key": "A", "text": "$\\dfrac{1}{300}$"}, {"key": "B", "text": "$\\dfrac{1}{276}$"}, {"key": "C", "text": "$\\dfrac{1}{325}$"}, {"key": "D", "text": "$\\dfrac{1}{24}$"}, {"key": "E", "text": "$\\dfrac{1}{552}$"}]'::jsonb, 'B', NULL, NULL,
  'İlk cüt artıq məlumdur, qalan $24$ şahmatçıdan bir cüt ${}_{24}C_2=276$ üsulla seçilir. $P=\dfrac{1}{276}$.',
  2025, 'II', 183, 65)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0040 | əsas: 2025 toplu, II hissə, səh.186 №97
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0040', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Ehtimal nəzəriyyəsi və statistika'), 'original', 'own', 'az', 'draft', 'written',
  'Sinifdəki şagirdlərin $9$-u oğlandır. Təsadüfi seçilən bir şagirdin qız olması hadisəsinin ehtimalı $\dfrac58$-ə bərabərdirsə, sinifdə neçə şagird var?',
  NULL, NULL, NULL, '24',
  'Oğlan olma ehtimalı $1-\dfrac58=\dfrac38$. $\dfrac{9}{N}=\dfrac38\Rightarrow N=24$.',
  2025, 'II', 186, 97)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0041 | əsas: 2025 toplu, II hissə, səh.190 №137
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0041', '/images/tasks/KEH-0041.png', 'Sütun diaqramı (faizlə): qırmızı 30%, sarı 20%, yaşıl 50%', (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Ehtimal nəzəriyyəsi və statistika'), 'original', 'own', 'az', 'draft', 'closed',
  'Torbada ümumi sayı $20$ olan eyni ölçülü qırmızı, sarı və yaşıl kürələr var. Kürələrin sayı diaqramda faizlə göstərilmişdir. Torbadan təsadüfi olaraq çıxarılan $4$ kürədən ikisinin yaşıl, birinin qırmızı, birinin isə sarı olması hadisəsinin ehtimalını tapın.',
  '[{"key": "A", "text": "$\\dfrac{4}{19}$"}, {"key": "B", "text": "$\\dfrac{72}{323}$"}, {"key": "C", "text": "$\\dfrac{36}{323}$"}, {"key": "D", "text": "$\\dfrac{18}{95}$"}, {"key": "E", "text": "$\\dfrac{24}{323}$"}]'::jsonb, 'B', NULL, NULL,
  'Qırmızı: $20\cdot0{,}3=6$, sarı: $20\cdot0{,}2=4$, yaşıl: $20\cdot0{,}5=10$. Bütün hallar ${}_{20}C_4=4845$. Əlverişli: ${}_{10}C_2\cdot6\cdot4=45\cdot24=1080$. $P=\dfrac{1080}{4845}=\dfrac{72}{323}$.',
  2025, 'II', 190, 137)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0042 | əsas: 2025 toplu, II hissə, səh.190 №138
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0042', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Ehtimal nəzəriyyəsi və statistika'), 'original', 'own', 'az', 'draft', 'closed',
  'Cədvəldə riyaziyyat və fizika fənləri üzrə olimpiadalarda iştirak edən şagirdlərin sayları göstərilmişdir. Təsadüfi seçilmiş $2$ şagirddən birinin riyaziyyat üzrə olimpiadada iştirak edən qız, digərinin fizika üzrə olimpiadada iştirak edən oğlan şagird olması hadisəsinin ehtimalını tapın.

$$\begin{array}{|l|c|c|}\hline & \text{Riyaziyyat} & \text{Fizika}\\ \hline \text{Oğlan} & y & 2y\\ \hline \text{Qız} & 2x & x\\ \hline \text{Cəmi} & 14 & 13\\ \hline\end{array}$$',
  '[{"key": "A", "text": "$\\dfrac{10}{27}$"}, {"key": "B", "text": "$\\dfrac{40}{351}$"}, {"key": "C", "text": "$\\dfrac{80}{729}$"}, {"key": "D", "text": "$\\dfrac{20}{351}$"}, {"key": "E", "text": "$\\dfrac{80}{351}$"}]'::jsonb, 'E', NULL, NULL,
  '$\begin{cases}y+2x=14\\2y+x=13\end{cases}\Rightarrow x=5,\ y=4$. Riyaziyyatda qız $10$, fizikada oğlan $8$; cəmi $27$ şagird. $P=\dfrac{10\cdot8}{{}_{27}C_2}=\dfrac{80}{351}$.',
  2025, 'II', 190, 138)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0043 | əsas: 2025 toplu, II hissə, səh.190 №139
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0043', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Ehtimal nəzəriyyəsi və statistika'), 'original', 'own', 'az', 'draft', 'closed',
  'Cədvəldə idmançıların boy kateqoriyalarına görə sayları göstərilmişdir. İdman yarışlarında iştirak etmək üçün təsadüfən ardıcıl seçilmiş iki idmançıdan birincisinin boyu $170$ sm-dən kiçik qız, ikincisinin isə boyu $170$ sm-dən böyük oğlan olması hadisəsinin ehtimalını tapın.

$$\begin{array}{|l|c|c|}\hline \text{İdmançılar} & 170\text{ sm-dən kiçik} & 170\text{ sm-dən böyük}\\ \hline \text{Oğlan} & y & 2y\\ \hline \text{Qız} & 3x & x\\ \hline \text{Cəmi} & 13 & 11\\ \hline\end{array}$$',
  '[{"key": "A", "text": "$\\dfrac{9}{64}$"}, {"key": "B", "text": "$\\dfrac{6}{23}$"}, {"key": "C", "text": "$\\dfrac{1}{8}$"}, {"key": "D", "text": "$\\dfrac{2}{23}$"}, {"key": "E", "text": "$\\dfrac{3}{23}$"}]'::jsonb, 'E', NULL, NULL,
  '$\begin{cases}y+3x=13\\2y+x=11\end{cases}\Rightarrow x=3,\ y=4$. Kiçik boylu qız $9$, böyük boylu oğlan $8$; cəmi $24$. $P=\dfrac{9}{24}\cdot\dfrac{8}{23}=\dfrac{3}{23}$.',
  2025, 'II', 190, 139)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0044 | əsas: 2025 toplu, II hissə, səh.191 №147
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0044', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Ehtimal nəzəriyyəsi və statistika'), 'original', 'own', 'az', 'draft', 'written',
  'Qutuda eyni formalı $10$ ağ, $8$ qara və $x$ sayda qırmızı kürə var. Qutudan təsadüfi bir kürə çıxarılır. Təsadüfən çıxarılmış bir kürənin qırmızı olması ehtimalı $\dfrac25$ olarsa, əvvəlcə qutuda neçə qırmızı kürə olduğunu tapın.',
  NULL, NULL, NULL, '12',
  '$\dfrac{x}{18+x}=\dfrac25\Rightarrow5x=36+2x\Rightarrow x=12$.',
  2025, 'II', 191, 147)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KEH-0045 | əsas: 2025 toplu, II hissə, səh.191 №148
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KEH-0045', NULL, NULL, (SELECT id FROM topics WHERE name='Kombinatorika və ehtimal'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Kombinatorika və ehtimal' AND s.title='Ehtimal nəzəriyyəsi və statistika'), 'original', 'own', 'az', 'draft', 'written',
  'Eyni ölçülü ağ və qara kürəciklər olan torbada qara kürəciklərin sayı ağ kürəciklərin sayından $12$ ədəd çoxdur. Təsadüfən çıxarılan bir kürəciyin ağ olması ehtimalı $\dfrac37$ olarsa, torbada ümumi neçə kürəcik var idi?',
  NULL, NULL, NULL, '84',
  'Ağ $w$, qara $w+12$. $\dfrac{w}{2w+12}=\dfrac37\Rightarrow7w=6w+36\Rightarrow w=36$. Cəmi $36+48=84$.',
  2025, 'II', 191, 148)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
