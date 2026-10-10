-- Mövzu: Tənliklər sistemi — 27 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- TSS-0001 | əsas: 2025 toplu, I hissə, səh.86 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Xətti tənliklər sistemi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}3x+2y=12,\\x-y=-1\end{cases}$ tənliklər sistemini həll edin.',
  '[{"key": "A", "text": "$(3;\\ 2)$"}, {"key": "B", "text": "$(-2;\\ 3)$"}, {"key": "C", "text": "$(4;\\ 0)$"}, {"key": "D", "text": "$(1;\\ -2)$"}, {"key": "E", "text": "$(2;\\ 3)$"}]'::jsonb, 'E', NULL, NULL,
  'İkinci tənlikdən $x=y-1$. Birinciyə yazaq: $3(y-1)+2y=12\Rightarrow5y=15\Rightarrow y=3$, $x=2$. Cavab: $(2;\ 3)$.',
  2025, 'I', 86, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0002 | əsas: 2025 toplu, I hissə, səh.86 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Xətti tənliklər sistemi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}3x+2y=7,\\x+4y=9\end{cases}$ tənliklər sistemindən $x^2+y^2$ cəmini tapın.',
  '[{"key": "A", "text": "$3$"}, {"key": "B", "text": "$5$"}, {"key": "C", "text": "$13$"}, {"key": "D", "text": "$9$"}, {"key": "E", "text": "$10$"}]'::jsonb, 'B', NULL, NULL,
  'Birinci tənliyi $2$-yə vurub ikincini çıxaq: $5x=5\Rightarrow x=1$, onda $4y=8\Rightarrow y=2$. $x^2+y^2=1+4=5$.',
  2025, 'I', 86, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0003 | əsas: 2025 toplu, I hissə, səh.86 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Xətti tənliklər sistemi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}2x+y=4,\\x-y=5\end{cases}$ tənliklər sistemindən $x^2-y^2$ fərqini tapın.',
  '[{"key": "A", "text": "$1$"}, {"key": "B", "text": "$-5$"}, {"key": "C", "text": "$5$"}, {"key": "D", "text": "$-13$"}, {"key": "E", "text": "$13$"}]'::jsonb, 'C', NULL, NULL,
  'Toplasaq: $3x=9\Rightarrow x=3$, $y=-2$. $x^2-y^2=9-4=5$.',
  2025, 'I', 86, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0004 | əsas: 2025 toplu, I hissə, səh.86 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Xətti tənliklər sistemi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}4x+3y=17,\\3x+4y=18\end{cases}$ tənliklər sistemindən $x\cdot y$ hasilini tapın.',
  '[{"key": "A", "text": "$6$"}, {"key": "B", "text": "$5$"}, {"key": "C", "text": "$8$"}, {"key": "D", "text": "$9$"}, {"key": "E", "text": "$4$"}]'::jsonb, 'A', NULL, NULL,
  'Toplasaq: $7(x+y)=35\Rightarrow x+y=5$. Çıxsaq: $x-y=-1$. Buradan $x=2$, $y=3$, $xy=6$.',
  2025, 'I', 86, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0005 | əsas: 2025 toplu, I hissə, səh.86 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Xətti tənliklər sistemi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}4x+5y=34,\\5x+4y=38\end{cases}$ tənliklər sistemindən $x\cdot y$ hasilini tapın.',
  '[{"key": "A", "text": "$24$"}, {"key": "B", "text": "$12$"}, {"key": "C", "text": "$16$"}, {"key": "D", "text": "$10$"}, {"key": "E", "text": "$8$"}]'::jsonb, 'B', NULL, NULL,
  'Toplasaq: $9(x+y)=72\Rightarrow x+y=8$. İkincidən birincini çıxsaq: $x-y=4$. $x=6$, $y=2$, $xy=12$.',
  2025, 'I', 86, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0006 | əsas: 2025 toplu, I hissə, səh.86 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Xətti tənliklər sistemi'), 'original', 'own', 'az', 'draft', 'closed',
  '$x^2+6x+y^2-8y+25=0$ olarsa, $xy$ hasilini tapın.',
  '[{"key": "A", "text": "$12$"}, {"key": "B", "text": "$-12$"}, {"key": "C", "text": "$1$"}, {"key": "D", "text": "$-7$"}, {"key": "E", "text": "$7$"}]'::jsonb, 'B', NULL, NULL,
  'Tam kvadratlara ayıraq: $(x+3)^2+(y-4)^2=0$. Kvadratların cəmi sıfırdırsa hər biri sıfırdır: $x=-3$, $y=4$. $xy=-12$.',
  2025, 'I', 86, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0007 | əsas: 2025 toplu, I hissə, səh.88 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0007', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Xətti tənliklər sisteminin həllinin araşdırılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$b$ parametrinin hansı qiymətində $\begin{cases}y=-4x+1,\\y=-\sqrt{b}\,x+3\end{cases}$ tənliklər sisteminin həlli ***yoxdur***?',
  '[{"key": "A", "text": "$9$"}, {"key": "B", "text": "$4$"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$16$"}, {"key": "E", "text": "$0$"}]'::jsonb, 'D', NULL, NULL,
  'Sistemin həlli yoxdursa, düz xətlər paraleldir: bucaq əmsalları bərabər, sərbəst hədlər fərqlidir. $-\sqrt b=-4\Rightarrow b=16$; $1\ne3$ — şərt ödənir.',
  2025, 'I', 88, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0008 | əsas: 2025 toplu, I hissə, səh.88 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Xətti tənliklər sisteminin həllinin araşdırılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$a$ parametrinin hansı qiymətində $\begin{cases}y=3x-2,\\y=\sqrt{a}\,x+1\end{cases}$ tənliklər sisteminin həlli ***yoxdur***?',
  '[{"key": "A", "text": "$3$"}, {"key": "B", "text": "$0$"}, {"key": "C", "text": "$9$"}, {"key": "D", "text": "$6$"}, {"key": "E", "text": "$1$"}]'::jsonb, 'C', NULL, NULL,
  'Paralellik şərti: $\sqrt a=3\Rightarrow a=9$; sərbəst hədlər $-2\ne1$.',
  2025, 'I', 88, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0009 | əsas: 2025 toplu, I hissə, səh.88 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Xətti tənliklər sisteminin həllinin araşdırılması'), 'original', 'own', 'az', 'draft', 'closed',
  '$a$ parametrinin hansı qiymətində $\begin{cases}2x+3y=4,\\6x+ay=5\end{cases}$ tənliklər sisteminin həlli ***yoxdur***?',
  '[{"key": "A", "text": "$6$"}, {"key": "B", "text": "$12$"}, {"key": "C", "text": "$-9$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$9$"}]'::jsonb, 'E', NULL, NULL,
  'Həll yoxdur, əgər $\dfrac{2}{6}=\dfrac{3}{a}\ne\dfrac{4}{5}$. $\dfrac13=\dfrac3a\Rightarrow a=9$; $\dfrac13\ne\dfrac45$ — şərt ödənir.',
  2025, 'I', 88, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0010 | əsas: 2025 toplu, I hissə, səh.90 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Biri birdərəcəli, digəri ikidərəcəli və daha yüksək dərəcəli olan tənliklər sistemi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}3x+y^2=9,\\x+y=3\end{cases}$ tənliklər sistemindən $y(y-3)$ hasilini tapın.',
  '[{"key": "A", "text": "$0$"}, {"key": "B", "text": "$3$"}, {"key": "C", "text": "$-9$"}, {"key": "D", "text": "$9$"}, {"key": "E", "text": "$-3$"}]'::jsonb, 'A', NULL, NULL,
  '$x=3-y$: $3(3-y)+y^2=9\Rightarrow y^2-3y=0$, yəni $y(y-3)=0$.',
  2025, 'I', 90, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0011 | əsas: 2025 toplu, I hissə, səh.90 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0011', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Biri birdərəcəli, digəri ikidərəcəli və daha yüksək dərəcəli olan tənliklər sistemi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}xy-x+y=5,\\x-y=2\end{cases}$ tənliklər sistemindən $xy$ hasilini tapın.',
  '[{"key": "A", "text": "$7$"}, {"key": "B", "text": "$-7$"}, {"key": "C", "text": "$-3$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$5$"}]'::jsonb, 'A', NULL, NULL,
  'Birinci tənlik: $xy-(x-y)=5\Rightarrow xy-2=5\Rightarrow xy=7$.',
  2025, 'I', 90, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0012 | əsas: 2025 toplu, I hissə, səh.90 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0012', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Biri birdərəcəli, digəri ikidərəcəli və daha yüksək dərəcəli olan tənliklər sistemi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}xy+y-x=1,\\x-y=3\end{cases}$ tənliklər sistemindən $xy$ hasilini tapın.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$-4$"}, {"key": "C", "text": "$1$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$-2$"}]'::jsonb, 'A', NULL, NULL,
  '$xy-(x-y)=1\Rightarrow xy-3=1\Rightarrow xy=4$.',
  2025, 'I', 90, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0013 | əsas: 2025 toplu, I hissə, səh.90 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Biri birdərəcəli, digəri ikidərəcəli və daha yüksək dərəcəli olan tənliklər sistemi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}x+y=4,\\x^2+2xy+3y^2=24\end{cases}$ tənliklər sistemindən $y^2$-ni tapın.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$8$"}, {"key": "C", "text": "$16$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$6$"}]'::jsonb, 'A', NULL, NULL,
  '$x^2+2xy+3y^2=(x+y)^2+2y^2=16+2y^2=24\Rightarrow y^2=4$.',
  2025, 'I', 90, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0014 | əsas: 2025 toplu, I hissə, səh.90 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Biri birdərəcəli, digəri ikidərəcəli və daha yüksək dərəcəli olan tənliklər sistemi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}x+y=5,\\x^2+y^2=13\end{cases}$ tənliklər sistemindən $x\cdot y$ hasilini tapın.',
  '[{"key": "A", "text": "$-6$"}, {"key": "B", "text": "$6$"}, {"key": "C", "text": "$8$"}, {"key": "D", "text": "$12$"}, {"key": "E", "text": "$4$"}]'::jsonb, 'B', NULL, NULL,
  '$(x+y)^2=x^2+y^2+2xy\Rightarrow25=13+2xy\Rightarrow xy=6$.',
  2025, 'I', 90, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0015 | əsas: 2025 toplu, I hissə, səh.91 №30
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0015', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Biri birdərəcəli, digəri ikidərəcəli və daha yüksək dərəcəli olan tənliklər sistemi'), 'original', 'own', 'az', 'draft', 'closed',
  '$x^2+4x+y^2-6y+13=0$ şərtini ödəyən $x$ və $y$ həqiqi ədədlərinin hasilini tapın.',
  '[{"key": "A", "text": "$1$"}, {"key": "B", "text": "$-1$"}, {"key": "C", "text": "$6$"}, {"key": "D", "text": "$-6$"}, {"key": "E", "text": "$5$"}]'::jsonb, 'D', NULL, NULL,
  '$(x+2)^2+(y-3)^2=0\Rightarrow x=-2$, $y=3$. Hasil: $-6$.',
  2025, 'I', 91, 30)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0016 | əsas: 2025 toplu, I hissə, səh.91 №33
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Biri birdərəcəli, digəri ikidərəcəli və daha yüksək dərəcəli olan tənliklər sistemi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}2x^2-5xy+2y^2=-7,\\2x-y=7\end{cases}$ tənliklər sistemindən $x\cdot y$ hasilini tapın.',
  '[{"key": "A", "text": "$21$"}, {"key": "B", "text": "$-15$"}, {"key": "C", "text": "$15$"}, {"key": "D", "text": "$8$"}, {"key": "E", "text": "$10$"}]'::jsonb, 'C', NULL, NULL,
  '$2x^2-5xy+2y^2=(2x-y)(x-2y)$. Onda $7(x-2y)=-7\Rightarrow x-2y=-1$. $2x-y=7$ ilə birlikdə: $x=5$, $y=3$. $xy=15$.',
  2025, 'I', 91, 33)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0017 | əsas: 2025 toplu, I hissə, səh.92 №34
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Biri birdərəcəli, digəri ikidərəcəli və daha yüksək dərəcəli olan tənliklər sistemi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}x^2+4xy+3y^2=24,\\x+3y=12\end{cases}$ tənliklər sistemindən $x\cdot y$ hasilini tapın.',
  '[{"key": "A", "text": "$-15$"}, {"key": "B", "text": "$15$"}, {"key": "C", "text": "$-8$"}, {"key": "D", "text": "$10$"}, {"key": "E", "text": "$-10$"}]'::jsonb, 'A', NULL, NULL,
  '$x^2+4xy+3y^2=(x+y)(x+3y)=12(x+y)=24\Rightarrow x+y=2$. $x+3y=12$ ilə: $2y=10\Rightarrow y=5$, $x=-3$. $xy=-15$.',
  2025, 'I', 92, 34)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0018 | əsas: 2025 toplu, I hissə, səh.92 №36
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Biri birdərəcəli, digəri ikidərəcəli və daha yüksək dərəcəli olan tənliklər sistemi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}x-y=6,\\x^2+y^2=4-2xy\end{cases}$ tənliklər sistemindən $xy$ hasilini tapın.',
  '[{"key": "A", "text": "$8$"}, {"key": "B", "text": "$10$"}, {"key": "C", "text": "$-10$"}, {"key": "D", "text": "$-8$"}, {"key": "E", "text": "$-4$"}]'::jsonb, 'D', NULL, NULL,
  'İkinci tənlik: $(x+y)^2=4$. $4xy=(x+y)^2-(x-y)^2=4-36=-32\Rightarrow xy=-8$.',
  2025, 'I', 92, 36)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0019 | əsas: 2025 toplu, I hissə, səh.92 №37
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Biri birdərəcəli, digəri ikidərəcəli və daha yüksək dərəcəli olan tənliklər sistemi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}x+y=6,\\x^2+y^2=20+2xy\end{cases}$ tənliklər sistemindən $xy$ hasilini tapın.',
  '[{"key": "A", "text": "$8$"}, {"key": "B", "text": "$-2$"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$-4$"}, {"key": "E", "text": "$4$"}]'::jsonb, 'E', NULL, NULL,
  'İkinci tənlik: $(x-y)^2=20$. $4xy=(x+y)^2-(x-y)^2=36-20=16\Rightarrow xy=4$.',
  2025, 'I', 92, 37)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0020 | əsas: 2025 toplu, I hissə, səh.92 №38
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Biri birdərəcəli, digəri ikidərəcəli və daha yüksək dərəcəli olan tənliklər sistemi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}x+y=4,\\x^2+3xy+y^2=19\end{cases}$ tənliklər sistemindən $xy$ hasilini tapın.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$7$"}, {"key": "C", "text": "$1$"}, {"key": "D", "text": "$-3$"}, {"key": "E", "text": "$3$"}]'::jsonb, 'E', NULL, NULL,
  '$x^2+3xy+y^2=(x+y)^2+xy=16+xy=19\Rightarrow xy=3$ (həll var: $x,y$ ədədləri $t^2-4t+3=0$ tənliyinin kökləri — $1$ və $3$).',
  2025, 'I', 92, 38)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0021 | əsas: 2025 toplu, I hissə, səh.92 №48
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Biri birdərəcəli, digəri ikidərəcəli və daha yüksək dərəcəli olan tənliklər sistemi'), 'original', 'own', 'az', 'draft', 'written',
  '$\begin{cases}x^2+9y^2=6xy+4x,\\x-3y=6\end{cases}$ tənliklər sistemindən $xy$ hasilini tapın.',
  NULL, NULL, NULL, '9',
  'Birinci tənlik: $x^2-6xy+9y^2=4x\Rightarrow(x-3y)^2=4x$. $36=4x\Rightarrow x=9$; $9-3y=6\Rightarrow y=1$. $xy=9$.',
  2025, 'I', 92, 48)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0022 | əsas: 2025 toplu, I hissə, səh.93 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Hər iki tənliyi ikidərəcəli və daha yüksək dərəcəli olan tənliklər sistemi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\begin{cases}x^3+y^3=9,\\xy(x+y)=6\end{cases}$ tənliklər sistemindən $x^2+y^2$ cəmini tapın.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$9$"}, {"key": "C", "text": "$5$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$13$"}]'::jsonb, 'C', NULL, NULL,
  '$(x+y)^3=x^3+y^3+3xy(x+y)=9+18=27\Rightarrow x+y=3$. Onda $xy=\dfrac{6}{3}=2$. $x^2+y^2=(x+y)^2-2xy=9-4=5$.',
  2025, 'I', 93, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0023 | əsas: 2025 toplu, I hissə, səh.95 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Tənliklər sistemi qurmaqla məsələlər həlli'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzbucaqlı şəklində olan əkin yerinin sahəsi $1800\ \text{m}^2$, hasarının uzunluğu $180$ m-dir. Bu əkin yerinin enini və uzunluğunu hesablayın.',
  '[{"key": "A", "text": "$45$ m; $45$ m"}, {"key": "B", "text": "$30$ m; $60$ m"}, {"key": "C", "text": "$40$ m; $50$ m"}, {"key": "D", "text": "$20$ m; $70$ m"}, {"key": "E", "text": "$36$ m; $54$ m"}]'::jsonb, 'B', NULL, NULL,
  'En $x$, uzunluq $y$: $x+y=90$, $xy=1800$. $x$ və $y$ ədədləri $t^2-90t+1800=0$ tənliyinin kökləridir: $t=\dfrac{90\pm30}{2}$, yəni $30$ və $60$.',
  2025, 'I', 95, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0024 | əsas: 2025 toplu, I hissə, səh.95 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Tənliklər sistemi qurmaqla məsələlər həlli'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzbucaqlı şəklində olan əkin yerinin sahəsi $3200$, hasarının uzunluğu $240$-dır. Bu əkin yerinin enini və uzunluğunu hesablayın.',
  '[{"key": "A", "text": "$30;\\ 90$"}, {"key": "B", "text": "$50;\\ 70$"}, {"key": "C", "text": "$20;\\ 100$"}, {"key": "D", "text": "$40;\\ 80$"}, {"key": "E", "text": "$60;\\ 60$"}]'::jsonb, 'D', NULL, NULL,
  '$x+y=120$, $xy=3200$: $t^2-120t+3200=0\Rightarrow t=\dfrac{120\pm40}{2}$, yəni $40$ və $80$.',
  2025, 'I', 95, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0025 | əsas: 2025 toplu, I hissə, səh.95 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0025', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Tənliklər sistemi qurmaqla məsələlər həlli'), 'original', 'own', 'az', 'draft', 'closed',
  'Həyətdə toyuqlar və dovşanlar var. Onların başlarının sayı $40$, ayaqlarının sayı isə $112$-dir. Həyətdə neçə dovşan var?',
  '[{"key": "A", "text": "$18$"}, {"key": "B", "text": "$14$"}, {"key": "C", "text": "$24$"}, {"key": "D", "text": "$12$"}, {"key": "E", "text": "$16$"}]'::jsonb, 'E', NULL, NULL,
  'Toyuqlar $x$, dovşanlar $y$: $x+y=40$, $2x+4y=112$. İkincidən birincinin iki mislini çıxaq: $2y=32\Rightarrow y=16$.',
  2025, 'I', 95, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0026 | əsas: 2025 toplu, I hissə, səh.95 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Tənliklər sistemi qurmaqla məsələlər həlli'), 'original', 'own', 'az', 'draft', 'closed',
  'Həyətdə qoyunlar və toyuqlar var. Onların başlarının sayı $45$, ayaqlarının sayı isə $130$-dur. Həyətdə neçə toyuq var?',
  '[{"key": "A", "text": "$30$"}, {"key": "B", "text": "$35$"}, {"key": "C", "text": "$25$"}, {"key": "D", "text": "$15$"}, {"key": "E", "text": "$20$"}]'::jsonb, 'C', NULL, NULL,
  'Qoyunlar $x$, toyuqlar $y$: $x+y=45$, $4x+2y=130$. $2x=130-90=40\Rightarrow x=20$, $y=25$.',
  2025, 'I', 95, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TSS-0027 | əsas: 2025 toplu, I hissə, səh.95 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TSS-0027', NULL, NULL, (SELECT id FROM topics WHERE name='Tənliklər sistemi'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tənliklər sistemi' AND s.title='Tənliklər sistemi qurmaqla məsələlər həlli'), 'original', 'own', 'az', 'draft', 'closed',
  'Qutu və içindəki bir cüt ayaqqabının birlikdə kütləsi $1500$ q, qutudan ayaqqabının bir tayını çıxardıqdan sonra qutunun kütləsi $950$ q olarsa, boş qutunun kütləsi neçə qramdır?',
  '[{"key": "A", "text": "$950$"}, {"key": "B", "text": "$550$"}, {"key": "C", "text": "$450$"}, {"key": "D", "text": "$400$"}, {"key": "E", "text": "$300$"}]'::jsonb, 'D', NULL, NULL,
  'Qutu $x$, bir tay $y$ qram: $x+2y=1500$, $x+y=950$. Çıxsaq: $y=550$, $x=400$.',
  2025, 'I', 95, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
