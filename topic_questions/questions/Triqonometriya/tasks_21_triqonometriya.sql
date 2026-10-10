-- Mövzu: Triqonometriya — 78 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- TRQ-0001 | əsas: 2025 toplu, II hissə, səh.29 №18
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Əsas triqonometrik eyniliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\operatorname{ctg}\alpha=-3$ olarsa, $\dfrac{\sin\alpha+3\cos\alpha}{\sin\alpha-3\cos\alpha}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$\\dfrac54$"}, {"key": "B", "text": "$-\\dfrac12$"}, {"key": "C", "text": "$-\\dfrac45$"}, {"key": "D", "text": "$\\dfrac45$"}, {"key": "E", "text": "$-\\dfrac54$"}]'::jsonb, 'C', NULL, NULL,
  'Surəti və məxrəci $\sin\alpha\ne0$-a bölək: $\dfrac{1+3\operatorname{ctg}\alpha}{1-3\operatorname{ctg}\alpha}=\dfrac{1-9}{1+9}=-\dfrac45$.',
  2025, 'II', 29, 18)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0002 | əsas: 2025 toplu, II hissə, səh.29 №19
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Əsas triqonometrik eyniliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\operatorname{tg}\alpha=-4$ olarsa, $\dfrac{2\sin\alpha+5\cos\alpha}{\cos\alpha-3\sin\alpha}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$\\dfrac{13}{11}$"}, {"key": "B", "text": "$-\\dfrac{3}{13}$"}, {"key": "C", "text": "$\\dfrac{3}{13}$"}, {"key": "D", "text": "$-\\dfrac{13}{3}$"}, {"key": "E", "text": "$-\\dfrac{3}{11}$"}]'::jsonb, 'B', NULL, NULL,
  '$\cos\alpha$-ya bölək: $\dfrac{2\operatorname{tg}\alpha+5}{1-3\operatorname{tg}\alpha}=\dfrac{-8+5}{1+12}=-\dfrac{3}{13}$.',
  2025, 'II', 29, 19)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0003 | əsas: 2025 toplu, II hissə, səh.30 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Əsas triqonometrik eyniliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{1-\sin^2\alpha}{\sin\alpha\cos\alpha}$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$\\operatorname{ctg}\\alpha$"}, {"key": "B", "text": "$\\operatorname{tg}\\alpha$"}, {"key": "C", "text": "$\\operatorname{tg}^2\\alpha$"}, {"key": "D", "text": "$-1$"}, {"key": "E", "text": "$1$"}]'::jsonb, 'A', NULL, NULL,
  '$1-\sin^2\alpha=\cos^2\alpha$; $\dfrac{\cos^2\alpha}{\sin\alpha\cos\alpha}=\dfrac{\cos\alpha}{\sin\alpha}=\operatorname{ctg}\alpha$.',
  2025, 'II', 30, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0004 | əsas: 2025 toplu, II hissə, səh.30 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Əsas triqonometrik eyniliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{1-\cos^2\alpha}{1-\sin^2\alpha}$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$\\operatorname{tg}\\alpha$"}, {"key": "B", "text": "$-1$"}, {"key": "C", "text": "$\\operatorname{ctg}^2\\alpha$"}, {"key": "D", "text": "$\\operatorname{tg}^2\\alpha$"}, {"key": "E", "text": "$1$"}]'::jsonb, 'D', NULL, NULL,
  '$\dfrac{\sin^2\alpha}{\cos^2\alpha}=\operatorname{tg}^2\alpha$.',
  2025, 'II', 30, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0005 | əsas: 2025 toplu, II hissə, səh.32 №77
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Əsas triqonometrik eyniliklər'), 'original', 'own', 'az', 'draft', 'written',
  '$p$ parametrinin hansı müsbət qiymətində müəyyən $\alpha$ bucağı üçün $\sin\alpha$ və $\cos\alpha$ $32x^2-px-7=0$ tənliyinin kökləri olar?',
  NULL, NULL, NULL, '24',
  'Viyet: $\sin\alpha+\cos\alpha=\dfrac{p}{32}$, $\sin\alpha\cos\alpha=-\dfrac{7}{32}$. $(\sin\alpha+\cos\alpha)^2=1+2\sin\alpha\cos\alpha=1-\dfrac{7}{16}=\dfrac{9}{16}$. $p>0$: $\dfrac{p}{32}=\dfrac34$, $p=24$. Yoxlama: kökləri kvadratları cəmi $1$-dir.',
  2025, 'II', 32, 77)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0006 | əsas: 2025 toplu, II hissə, səh.32 №78
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Əsas triqonometrik eyniliklər'), 'original', 'own', 'az', 'draft', 'written',
  '$p$ parametrinin hansı müsbət qiymətində müəyyən $\alpha$ bucağı üçün $\sin\alpha$ və $\cos\alpha$ $25x^2-px-12=0$ tənliyinin kökləri olar?',
  NULL, NULL, NULL, '5',
  '$\sin\alpha\cos\alpha=-\dfrac{12}{25}$, $(\sin\alpha+\cos\alpha)^2=1-\dfrac{24}{25}=\dfrac{1}{25}$, $\dfrac{p}{25}=\dfrac15$, $p=5$. Kökləri $\dfrac45$ və $-\dfrac35$.',
  2025, 'II', 32, 78)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0007 | əsas: 2025 toplu, II hissə, səh.32 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0007', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='y=sinx və y=cosx funksiyaları və onların xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=5-3\sin x$ funksiyasının qiymətlər çoxluğunu tapın.',
  '[{"key": "A", "text": "$[-2;\\ 8]$"}, {"key": "B", "text": "$[5;\\ 8]$"}, {"key": "C", "text": "$[2;\\ 8]$"}, {"key": "D", "text": "$[-3;\\ 5]$"}, {"key": "E", "text": "$[2;\\ 5]$"}]'::jsonb, 'C', NULL, NULL,
  '$-1\le\sin x\le1\Rightarrow-3\le-3\sin x\le3\Rightarrow2\le y\le8$.',
  2025, 'II', 32, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0008 | əsas: 2025 toplu, II hissə, səh.40 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Çevirmə düsturları'), 'original', 'own', 'az', 'draft', 'closed',
  '$\operatorname{tg}28^\circ=a$ olarsa, $\operatorname{ctg}118^\circ$-ni $a$ ilə ifadə edin.',
  '[{"key": "A", "text": "$\\dfrac1a$"}, {"key": "B", "text": "$-\\dfrac1a$"}, {"key": "C", "text": "$a$"}, {"key": "D", "text": "$a^2-1$"}, {"key": "E", "text": "$-a$"}]'::jsonb, 'E', NULL, NULL,
  '$\operatorname{ctg}118^\circ=\operatorname{ctg}(90^\circ+28^\circ)=-\operatorname{tg}28^\circ=-a$.',
  2025, 'II', 40, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0009 | əsas: 2025 toplu, II hissə, səh.43 №57
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Çevirmə düsturları'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{2\sin390^\circ+\sqrt3\operatorname{tg}420^\circ}{\operatorname{ctg}405^\circ}$ ifadəsinin qiymətini tapın.',
  '[{"key": "A", "text": "$3$"}, {"key": "B", "text": "$2$"}, {"key": "C", "text": "$1+\\sqrt3$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$\\sqrt3$"}]'::jsonb, 'D', NULL, NULL,
  '$\sin390^\circ=\sin30^\circ=\dfrac12$, $\operatorname{tg}420^\circ=\operatorname{tg}60^\circ=\sqrt3$, $\operatorname{ctg}405^\circ=\operatorname{ctg}45^\circ=1$. İfadə: $\dfrac{1+3}{1}=4$.',
  2025, 'II', 43, 57)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0010 | əsas: 2025 toplu, II hissə, səh.43 №58
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Çevirmə düsturları'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{4\sqrt2\sin225^\circ+\cos120^\circ}{\operatorname{tg}225^\circ-\cos60^\circ}$ ifadəsinin qiymətini tapın.',
  '[{"key": "A", "text": "$-4{,}5$"}, {"key": "B", "text": "$-7$"}, {"key": "C", "text": "$9$"}, {"key": "D", "text": "$7$"}, {"key": "E", "text": "$-9$"}]'::jsonb, 'E', NULL, NULL,
  '$\sin225^\circ=-\dfrac{\sqrt2}{2}$, $\cos120^\circ=-\dfrac12$, $\operatorname{tg}225^\circ=1$. Surət: $-4-\dfrac12=-4{,}5$; məxrəc: $1-\dfrac12=\dfrac12$. Nəticə $-9$.',
  2025, 'II', 43, 58)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0011 | əsas: 2025 toplu, II hissə, səh.43 №59
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0011', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Çevirmə düsturları'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{\cos(200^\circ+\alpha)-\sin(70^\circ-\alpha)}{\cos(20^\circ+\alpha)}$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$1$"}, {"key": "B", "text": "$-2$"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$-1$"}, {"key": "E", "text": "$0$"}]'::jsonb, 'B', NULL, NULL,
  '$\cos(200^\circ+\alpha)=\cos\big(180^\circ+(20^\circ+\alpha)\big)=-\cos(20^\circ+\alpha)$; $\sin(70^\circ-\alpha)=\sin\big(90^\circ-(20^\circ+\alpha)\big)=\cos(20^\circ+\alpha)$. Surət $-2\cos(20^\circ+\alpha)$, nəticə $-2$.',
  2025, 'II', 43, 59)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0012 | əsas: 2025 toplu, II hissə, səh.43 №60
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0012', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Çevirmə düsturları'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{\sin(160^\circ-\alpha)+\cos(110^\circ+\alpha)}{\sin(20^\circ+\alpha)}$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$0$"}, {"key": "B", "text": "$1$"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$-1$"}, {"key": "E", "text": "$-2$"}]'::jsonb, 'A', NULL, NULL,
  '$\sin(160^\circ-\alpha)=\sin\big(180^\circ-(20^\circ+\alpha)\big)=\sin(20^\circ+\alpha)$; $\cos(110^\circ+\alpha)=\cos\big(90^\circ+(20^\circ+\alpha)\big)=-\sin(20^\circ+\alpha)$. Surət $0$.',
  2025, 'II', 43, 60)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0013 | əsas: 2025 toplu, II hissə, səh.43 №69
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Çevirmə düsturları'), 'original', 'own', 'az', 'draft', 'closed',
  '$\operatorname{tg}\left(-\dfrac{17\pi}{3}\right)$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$\\dfrac{\\sqrt3}{3}$"}, {"key": "B", "text": "$-\\dfrac{\\sqrt3}{3}$"}, {"key": "C", "text": "$-\\sqrt3$"}, {"key": "D", "text": "$-1$"}, {"key": "E", "text": "$\\sqrt3$"}]'::jsonb, 'E', NULL, NULL,
  'Tangensin dövrü $\pi$-dir: $-\dfrac{17\pi}{3}+6\pi=\dfrac{\pi}{3}$. $\operatorname{tg}\dfrac{\pi}{3}=\sqrt3$.',
  2025, 'II', 43, 69)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0014 | əsas: 2025 toplu, II hissə, səh.43 №70
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Çevirmə düsturları'), 'original', 'own', 'az', 'draft', 'closed',
  '$\operatorname{ctg}\left(-\dfrac{11\pi}{4}\right)$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$-1$"}, {"key": "B", "text": "$1$"}, {"key": "C", "text": "$-\\sqrt3$"}, {"key": "D", "text": "$\\dfrac{\\sqrt3}{3}$"}, {"key": "E", "text": "$\\sqrt3$"}]'::jsonb, 'B', NULL, NULL,
  '$-\dfrac{11\pi}{4}+3\pi=\dfrac{\pi}{4}$; $\operatorname{ctg}\dfrac{\pi}{4}=1$.',
  2025, 'II', 43, 70)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0015 | əsas: 2025 toplu, II hissə, səh.45 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0015', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik funksiyaların ən böyük və ən kiçik qiymətləri'), 'original', 'own', 'az', 'draft', 'written',
  '$y=5-4\sin^22x$ funksiyasının ən böyük və ən kiçik qiymətlərinin cəmini tapın.',
  NULL, NULL, NULL, '6',
  '$0\le\sin^22x\le1\Rightarrow1\le y\le5$. Cəm $6$.',
  2025, 'II', 45, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0016 | əsas: 2025 toplu, II hissə, səh.45 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik funksiyaların ən böyük və ən kiçik qiymətləri'), 'original', 'own', 'az', 'draft', 'written',
  '$4\cos^2x-\cos2x+2$ ifadəsinin ən kiçik qiymətini tapın.',
  NULL, NULL, NULL, '3',
  '$\cos2x=2\cos^2x-1$: ifadə $4\cos^2x-2\cos^2x+1+2=2\cos^2x+3\ge3$ ($\cos x=0$ olduqda).',
  2025, 'II', 45, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0017 | əsas: 2025 toplu, II hissə, səh.45 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik funksiyaların ən böyük və ən kiçik qiymətləri'), 'original', 'own', 'az', 'draft', 'written',
  '$6\cos^2x-2\cos2x+1$ ifadəsinin ən böyük qiymətini tapın.',
  NULL, NULL, NULL, '5',
  'İfadə $6\cos^2x-4\cos^2x+2+1=2\cos^2x+3\le5$ ($\cos^2x=1$ olduqda).',
  2025, 'II', 45, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0018 | əsas: 2025 toplu, II hissə, səh.45 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik funksiyaların ən böyük və ən kiçik qiymətləri'), 'original', 'own', 'az', 'draft', 'written',
  '$y=\dfrac{26}{5\sin x+12\cos x+15}$ funksiyasının ən böyük qiymətini tapın.',
  NULL, NULL, NULL, '13',
  '$5\sin x+12\cos x$ ifadəsi $[-13;\ 13]$ aralığında qiymətlər alır ($\sqrt{25+144}=13$). Məxrəcin ən kiçik qiyməti $15-13=2$, ən böyük qiymət $\dfrac{26}{2}=13$.',
  2025, 'II', 45, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0019 | əsas: 2025 toplu, II hissə, səh.45 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik funksiyaların ən böyük və ən kiçik qiymətləri'), 'original', 'own', 'az', 'draft', 'written',
  '$y=\dfrac{20}{8\cos x+15\sin x+21}$ funksiyasının ən böyük qiymətini tapın.',
  NULL, NULL, NULL, '5',
  '$\sqrt{64+225}=17$; məxrəcin ən kiçik qiyməti $21-17=4$; $y_{\max}=5$.',
  2025, 'II', 45, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0020 | əsas: 2025 toplu, II hissə, səh.47 №20
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Tərs triqonometrik funksiyalar'), 'original', 'own', 'az', 'draft', 'closed',
  '$\arcsin a+\arccos a-\operatorname{arctg}a$ ifadəsinin ən böyük qiymətini tapın.',
  '[{"key": "A", "text": "$\\pi$"}, {"key": "B", "text": "$\\dfrac{3\\pi}{4}$"}, {"key": "C", "text": "$\\dfrac{\\pi}{4}$"}, {"key": "D", "text": "$\\dfrac{\\pi}{2}$"}, {"key": "E", "text": "$\\dfrac{5\\pi}{4}$"}]'::jsonb, 'B', NULL, NULL,
  '$\arcsin a+\arccos a=\dfrac{\pi}{2}$ ($-1\le a\le1$). İfadə $\dfrac{\pi}{2}-\operatorname{arctg}a$ — $a=-1$ olduqda ən böyükdür: $\dfrac{\pi}{2}+\dfrac{\pi}{4}=\dfrac{3\pi}{4}$.',
  2025, 'II', 47, 20)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0021 | əsas: 2025 toplu, II hissə, səh.48 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Tərs triqonometrik funksiyalar'), 'original', 'own', 'az', 'draft', 'closed',
  '$\operatorname{arctg}x=\arcsin\dfrac{5}{13}$ bərabərliyindən $x$-i tapın.',
  '[{"key": "A", "text": "$\\dfrac{5}{12}$"}, {"key": "B", "text": "$\\dfrac{12}{5}$"}, {"key": "C", "text": "$\\dfrac{13}{12}$"}, {"key": "D", "text": "$\\dfrac{12}{13}$"}, {"key": "E", "text": "$\\dfrac{5}{13}$"}]'::jsonb, 'A', NULL, NULL,
  '$\varphi=\arcsin\dfrac{5}{13}$, $\varphi\in\left(0;\dfrac{\pi}{2}\right)$: $\cos\varphi=\dfrac{12}{13}$, $x=\operatorname{tg}\varphi=\dfrac{5}{12}$.',
  2025, 'II', 48, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0022 | əsas: 2025 toplu, II hissə, səh.48 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Tərs triqonometrik funksiyalar'), 'original', 'own', 'az', 'draft', 'written',
  '$6\cos\left(\arcsin\dfrac12\right)\cdot\operatorname{tg}\left(\arccos\dfrac{\sqrt3}{2}\right)+\cos\left(2\operatorname{arctg}\sqrt3\right)$ ifadəsinin qiymətini tapın.',
  NULL, NULL, NULL, '2,5',
  '$\arcsin\dfrac12=\dfrac{\pi}{6}$, $\cos\dfrac{\pi}{6}=\dfrac{\sqrt3}{2}$; $\arccos\dfrac{\sqrt3}{2}=\dfrac{\pi}{6}$, $\operatorname{tg}\dfrac{\pi}{6}=\dfrac{1}{\sqrt3}$; $\operatorname{arctg}\sqrt3=\dfrac{\pi}{3}$, $\cos\dfrac{2\pi}{3}=-\dfrac12$. İfadə: $6\cdot\dfrac{\sqrt3}{2}\cdot\dfrac{1}{\sqrt3}-\dfrac12=2{,}5$.',
  2025, 'II', 48, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0023 | əsas: 2025 toplu, II hissə, səh.48 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Tərs triqonometrik funksiyalar'), 'original', 'own', 'az', 'draft', 'written',
  '$\dfrac{12}{\pi}\left(\arccos\left(-\dfrac{\sqrt2}{2}\right)+\arcsin\dfrac12-\operatorname{arctg}1\right)$ ifadəsinin qiymətini hesablayın.',
  NULL, NULL, NULL, '8',
  '$\arccos\left(-\dfrac{\sqrt2}{2}\right)=\dfrac{3\pi}{4}$, $\arcsin\dfrac12=\dfrac{\pi}{6}$, $\operatorname{arctg}1=\dfrac{\pi}{4}$. Cəm $\dfrac{3\pi}{4}+\dfrac{\pi}{6}-\dfrac{\pi}{4}=\dfrac{2\pi}{3}$; $\dfrac{12}{\pi}\cdot\dfrac{2\pi}{3}=8$.',
  2025, 'II', 48, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0024 | əsas: 2025 toplu, II hissə, səh.48 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Tərs triqonometrik funksiyalar'), 'original', 'own', 'az', 'draft', 'written',
  '$\dfrac{6}{\pi}\left(\arccos\left(-\dfrac{\sqrt3}{2}\right)+\arcsin\left(-\dfrac12\right)+\operatorname{arcctg}\left(-\sqrt3\right)\right)$ ifadəsinin qiymətini hesablayın.',
  NULL, NULL, NULL, '9',
  '$\arccos\left(-\dfrac{\sqrt3}{2}\right)=\dfrac{5\pi}{6}$, $\arcsin\left(-\dfrac12\right)=-\dfrac{\pi}{6}$, $\operatorname{arcctg}(-\sqrt3)=\pi-\dfrac{\pi}{6}=\dfrac{5\pi}{6}$ ($\operatorname{arcctg}$-in qiymətlər çoxluğu $(0;\pi)$). Cəm $\dfrac{9\pi}{6}$, ifadə $9$.',
  2025, 'II', 48, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0025 | əsas: 2025 toplu, II hissə, səh.48 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0025', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Tərs triqonometrik funksiyalar'), 'original', 'own', 'az', 'draft', 'written',
  '$\operatorname{tg}(\operatorname{arctg}17)+\cos(\arccos0{,}3)+\operatorname{ctg}(\operatorname{arcctg}12)$ ifadəsinin qiymətini tapın.',
  NULL, NULL, NULL, '29,3',
  '$\operatorname{tg}(\operatorname{arctg}a)=a$, $\cos(\arccos a)=a$ ($|a|\le1$), $\operatorname{ctg}(\operatorname{arcctg}a)=a$. Cəm $17+0{,}3+12=29{,}3$.',
  2025, 'II', 48, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0026 | əsas: 2025 toplu, II hissə, səh.48 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Tərs triqonometrik funksiyalar'), 'original', 'own', 'az', 'draft', 'written',
  '$\sin(\arcsin0{,}6)+\operatorname{tg}(\operatorname{arctg}23)+\operatorname{ctg}(\operatorname{arcctg}15)$ ifadəsinin qiymətini tapın.',
  NULL, NULL, NULL, '38,6',
  'Cəm $0{,}6+23+15=38{,}6$.',
  2025, 'II', 48, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0027 | əsas: 2025 toplu, II hissə, səh.49 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0027', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='İki bucağın cəminin və fərqinin triqonometrik funksiyaları'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sin17^\circ\sin77^\circ+\sin73^\circ\sin13^\circ$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$\\dfrac12$"}, {"key": "B", "text": "$-\\dfrac12$"}, {"key": "C", "text": "$\\dfrac{\\sqrt3}{2}$"}, {"key": "D", "text": "$-\\dfrac{\\sqrt3}{2}$"}, {"key": "E", "text": "$\\dfrac{\\sqrt2}{2}$"}]'::jsonb, 'A', NULL, NULL,
  '$\sin77^\circ=\cos13^\circ$, $\sin73^\circ=\cos17^\circ$. İfadə $\sin17^\circ\cos13^\circ+\cos17^\circ\sin13^\circ=\sin30^\circ=\dfrac12$.',
  2025, 'II', 49, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0028 | əsas: 2025 toplu, II hissə, səh.52 №62
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0028', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='İki bucağın cəminin və fərqinin triqonometrik funksiyaları'), 'original', 'own', 'az', 'draft', 'written',
  '$\sin(\alpha-\beta)=0{,}2$ və $\sin(\alpha+\beta)=0{,}6$ olarsa, $\operatorname{tg}\alpha\cdot\operatorname{ctg}\beta$-nı tapın.',
  NULL, NULL, NULL, '2',
  '$\sin\alpha\cos\beta-\cos\alpha\sin\beta=0{,}2$ və $\sin\alpha\cos\beta+\cos\alpha\sin\beta=0{,}6$. Buradan $\sin\alpha\cos\beta=0{,}4$, $\cos\alpha\sin\beta=0{,}2$. $\operatorname{tg}\alpha\operatorname{ctg}\beta=\dfrac{\sin\alpha\cos\beta}{\cos\alpha\sin\beta}=2$.',
  2025, 'II', 52, 62)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0029 | əsas: 2025 toplu, II hissə, səh.56 №62
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0029', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='İkiqat və yarım arqumentin triqonometrik funksiyaları'), 'original', 'own', 'az', 'draft', 'closed',
  '$2\left(\cos^2\left(\dfrac{3\pi}{4}-\alpha\right)+\dfrac12\sin2\alpha\right)$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$0{,}5$"}, {"key": "B", "text": "$-1$"}, {"key": "C", "text": "$\\sqrt{2}$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$1$"}]'::jsonb, 'E', NULL, NULL,
  '$\cos^2\left(\dfrac{3\pi}{4}-\alpha\right)=\dfrac{1+\cos\left(\frac{3\pi}{2}-2\alpha\right)}{2}=\dfrac{1-\sin2\alpha}{2}$. Mötərizədə $\dfrac12$, ifadə $1$.',
  2025, 'II', 56, 62)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0030 | əsas: 2025 toplu, II hissə, səh.56 №63
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0030', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='İkiqat və yarım arqumentin triqonometrik funksiyaları'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt2\left(\sin^2\left(\dfrac{\pi}{4}+\alpha\right)-\dfrac12\sin2\alpha\right)$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$1$"}, {"key": "B", "text": "$\\dfrac{\\sqrt2}{2}$"}, {"key": "C", "text": "$-\\dfrac12$"}, {"key": "D", "text": "$-\\dfrac{\\sqrt2}{2}$"}, {"key": "E", "text": "$\\dfrac12$"}]'::jsonb, 'B', NULL, NULL,
  '$\sin^2\left(\dfrac{\pi}{4}+\alpha\right)=\dfrac{1-\cos\left(\frac{\pi}{2}+2\alpha\right)}{2}=\dfrac{1+\sin2\alpha}{2}$. Mötərizədə $\dfrac12$, ifadə $\dfrac{\sqrt2}{2}$.',
  2025, 'II', 56, 63)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0031 | əsas: 2025 toplu, II hissə, səh.56 №64
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0031', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='İkiqat və yarım arqumentin triqonometrik funksiyaları'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sin^4\alpha+\cos^4\alpha-\dfrac12\left(1+\cos^22\alpha\right)$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$\\cos4\\alpha$"}, {"key": "B", "text": "$-1$"}, {"key": "C", "text": "$0$"}, {"key": "D", "text": "$\\dfrac12$"}, {"key": "E", "text": "$1$"}]'::jsonb, 'C', NULL, NULL,
  '$\sin^4\alpha+\cos^4\alpha=1-\dfrac12\sin^22\alpha$. İfadə: $1-\dfrac12\sin^22\alpha-\dfrac12-\dfrac12\cos^22\alpha=\dfrac12-\dfrac12=0$.',
  2025, 'II', 56, 64)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0032 | əsas: 2025 toplu, II hissə, səh.56 №65
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0032', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='İkiqat və yarım arqumentin triqonometrik funksiyaları'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{\cos20^\circ}{4\operatorname{ctg}35^\circ\cdot\sin^235^\circ}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "$\\dfrac14$"}, {"key": "C", "text": "$\\sin20^\\circ$"}, {"key": "D", "text": "$1$"}, {"key": "E", "text": "$\\dfrac12$"}]'::jsonb, 'E', NULL, NULL,
  '$\operatorname{ctg}35^\circ\sin^235^\circ=\cos35^\circ\sin35^\circ=\dfrac12\sin70^\circ=\dfrac12\cos20^\circ$. Məxrəc $2\cos20^\circ$, ifadə $\dfrac12$.',
  2025, 'II', 56, 65)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0033 | əsas: 2025 toplu, II hissə, səh.56 №66
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0033', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='İkiqat və yarım arqumentin triqonometrik funksiyaları'), 'original', 'own', 'az', 'draft', 'closed',
  '$\operatorname{tg}\dfrac{\alpha}{2}=2-\sqrt3$ və $\alpha\in\left(0;\dfrac{\pi}{2}\right)$ olarsa, $\alpha$ bucağını tapın.',
  '[{"key": "A", "text": "$\\dfrac{\\pi}{6}$"}, {"key": "B", "text": "$\\dfrac{\\pi}{3}$"}, {"key": "C", "text": "$\\dfrac{\\pi}{8}$"}, {"key": "D", "text": "$\\dfrac{\\pi}{4}$"}, {"key": "E", "text": "$\\dfrac{\\pi}{12}$"}]'::jsonb, 'A', NULL, NULL,
  '$\operatorname{tg}\alpha=\dfrac{2\operatorname{tg}\frac{\alpha}{2}}{1-\operatorname{tg}^2\frac{\alpha}{2}}=\dfrac{2(2-\sqrt3)}{1-(7-4\sqrt3)}=\dfrac{2(2-\sqrt3)}{4\sqrt3-6}=\dfrac{1}{\sqrt3}$. $\alpha\in\left(0;\dfrac{\pi}{2}\right)\Rightarrow\alpha=\dfrac{\pi}{6}$.',
  2025, 'II', 56, 66)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0034 | əsas: 2025 toplu, II hissə, səh.56 №67
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0034', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='İkiqat və yarım arqumentin triqonometrik funksiyaları'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{2\sin10^\circ\operatorname{tg}30^\circ}{\cos80^\circ\left(1-\operatorname{tg}^230^\circ\right)}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$\\dfrac{\\sqrt3}{2}$"}, {"key": "B", "text": "$\\dfrac12$"}, {"key": "C", "text": "$1$"}, {"key": "D", "text": "$2\\sqrt3$"}, {"key": "E", "text": "$\\sqrt3$"}]'::jsonb, 'E', NULL, NULL,
  '$\sin10^\circ=\cos80^\circ$. $\dfrac{2\operatorname{tg}30^\circ}{1-\operatorname{tg}^230^\circ}=\operatorname{tg}60^\circ=\sqrt3$.',
  2025, 'II', 56, 67)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0035 | əsas: 2025 toplu, II hissə, səh.56 №68
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0035', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='İkiqat və yarım arqumentin triqonometrik funksiyaları'), 'original', 'own', 'az', 'draft', 'closed',
  '$2\cos^2\left(\dfrac12\arccos\left(-\dfrac35\right)\right)-1$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$\\dfrac15$"}, {"key": "B", "text": "$-\\dfrac45$"}, {"key": "C", "text": "$\\dfrac35$"}, {"key": "D", "text": "$-\\dfrac35$"}, {"key": "E", "text": "$\\dfrac45$"}]'::jsonb, 'D', NULL, NULL,
  '$2\cos^2\dfrac{\varphi}{2}-1=\cos\varphi$; $\cos\left(\arccos\left(-\dfrac35\right)\right)=-\dfrac35$.',
  2025, 'II', 56, 68)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0036 | əsas: 2025 toplu, II hissə, səh.56 №69
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0036', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='İkiqat və yarım arqumentin triqonometrik funksiyaları'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{\cos50^\circ}{\sin20^\circ\cdot\sin70^\circ}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$\\sin20^\\circ$"}, {"key": "B", "text": "$2$"}, {"key": "C", "text": "$4$"}, {"key": "D", "text": "$0{,}5$"}, {"key": "E", "text": "$1$"}]'::jsonb, 'B', NULL, NULL,
  '$\sin70^\circ=\cos20^\circ$: məxrəc $\sin20^\circ\cos20^\circ=\dfrac12\sin40^\circ=\dfrac12\cos50^\circ$. Nəticə $2$.',
  2025, 'II', 56, 69)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0037 | əsas: 2025 toplu, II hissə, səh.56 №70
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0037', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='İkiqat və yarım arqumentin triqonometrik funksiyaları'), 'original', 'own', 'az', 'draft', 'closed',
  '$\operatorname{tg}^222{,}5^\circ+2\sqrt2$ ifadəsinin qiymətini tapın.',
  '[{"key": "A", "text": "$2\\sqrt2$"}, {"key": "B", "text": "$1$"}, {"key": "C", "text": "$5$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$3+4\\sqrt2$"}]'::jsonb, 'D', NULL, NULL,
  '$\operatorname{tg}22{,}5^\circ=\dfrac{1-\cos45^\circ}{\sin45^\circ}=\sqrt2-1$; kvadratı $3-2\sqrt2$. Cəm $3$.',
  2025, 'II', 56, 70)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0038 | əsas: 2025 toplu, II hissə, səh.57 №84
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0038', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='İkiqat və yarım arqumentin triqonometrik funksiyaları'), 'original', 'own', 'az', 'draft', 'closed',
  '$\operatorname{tg}\alpha=\dfrac13$ olarsa, $\sin2\alpha\cdot\cos2\alpha\cdot\operatorname{tg}2\alpha$ ifadəsinin qiymətini tapın.',
  '[{"key": "A", "text": "$\\dfrac{9}{25}$"}, {"key": "B", "text": "$\\dfrac13$"}, {"key": "C", "text": "$\\dfrac{9}{16}$"}, {"key": "D", "text": "$\\dfrac{16}{25}$"}, {"key": "E", "text": "$\\dfrac35$"}]'::jsonb, 'A', NULL, NULL,
  '$\cos2\alpha\cdot\operatorname{tg}2\alpha=\sin2\alpha$, ifadə $\sin^22\alpha$. $\sin2\alpha=\dfrac{2\operatorname{tg}\alpha}{1+\operatorname{tg}^2\alpha}=\dfrac{2/3}{10/9}=\dfrac35$; $\sin^22\alpha=\dfrac{9}{25}$.',
  2025, 'II', 57, 84)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0039 | əsas: 2025 toplu, II hissə, səh.59 №144
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0039', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='İkiqat və yarım arqumentin triqonometrik funksiyaları'), 'original', 'own', 'az', 'draft', 'written',
  '$\dfrac{2}{\sin10^\circ}-\dfrac{2\sqrt3}{\cos10^\circ}$ ifadəsinin qiymətini tapın.',
  NULL, NULL, NULL, '8',
  '$\dfrac{2(\cos10^\circ-\sqrt3\sin10^\circ)}{\sin10^\circ\cos10^\circ}=\dfrac{4\left(\frac12\cos10^\circ-\frac{\sqrt3}{2}\sin10^\circ\right)}{\frac12\sin20^\circ}=\dfrac{8\sin(30^\circ-10^\circ)}{\sin20^\circ}=8$.',
  2025, 'II', 59, 144)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0040 | əsas: 2025 toplu, II hissə, səh.59 №145
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0040', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='İkiqat və yarım arqumentin triqonometrik funksiyaları'), 'original', 'own', 'az', 'draft', 'written',
  '$\sin(2\operatorname{arctg}3)$ ifadəsinin qiymətini tapın.',
  NULL, NULL, NULL, '0,6',
  '$\varphi=\operatorname{arctg}3$: $\sin2\varphi=\dfrac{2\operatorname{tg}\varphi}{1+\operatorname{tg}^2\varphi}=\dfrac{6}{10}=0{,}6$.',
  2025, 'II', 59, 145)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0041 | əsas: 2025 toplu, II hissə, səh.64 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0041', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Sadə triqonometrik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\operatorname{ctg}x=-1$ tənliyinin $\left(0;\ \dfrac{\pi}{2}\right]$ aralığındakı köklərinin sayını tapın.',
  '[{"key": "A", "text": "$3$"}, {"key": "B", "text": "yoxdur"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$1$"}, {"key": "E", "text": "sonsuz sayda"}]'::jsonb, 'B', NULL, NULL,
  '$\left(0;\ \dfrac{\pi}{2}\right]$ aralığında $\operatorname{ctg}x\ge0$, ona görə $\operatorname{ctg}x=-1$ tənliyinin bu aralıqda kökü yoxdur.',
  2025, 'II', 64, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0042 | əsas: 2025 toplu, II hissə, səh.64 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0042', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Sadə triqonometrik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\operatorname{tg}x=-\sqrt3$ tənliyinin $\left[\dfrac{\pi}{2};\ \pi\right]$ aralığındakı köklərinin sayını tapın.',
  '[{"key": "A", "text": "yoxdur"}, {"key": "B", "text": "$2$"}, {"key": "C", "text": "sonsuz sayda"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$1$"}]'::jsonb, 'E', NULL, NULL,
  '$x=-\dfrac{\pi}{3}+\pi k$; aralığa yalnız $x=\dfrac{2\pi}{3}$ daxildir ($x=\dfrac{\pi}{2}$-də tangens təyin olunmayıb). Bir kök.',
  2025, 'II', 64, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0043 | əsas: 2025 toplu, II hissə, səh.66 №34
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0043', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Sadə triqonometrik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sin5x\cdot\sin10x=0$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\dfrac{\\pi n}{10};\\ n\\in Z$"}, {"key": "B", "text": "$\\dfrac{\\pi}{10}+\\dfrac{\\pi n}{5};\\ n\\in Z$"}, {"key": "C", "text": "$\\dfrac{\\pi n}{5};\\ n\\in Z$"}, {"key": "D", "text": "$\\dfrac{\\pi n}{20};\\ n\\in Z$"}, {"key": "E", "text": "$\\dfrac{\\pi n}{15};\\ n\\in Z$"}]'::jsonb, 'A', NULL, NULL,
  '$\sin5x=0$ olduqda $\sin10x=2\sin5x\cos5x=0$ olur, ona görə həllər çoxluğu $\sin10x=0$ tənliyinin həlləridir: $10x=\pi n$, $x=\dfrac{\pi n}{10}$.',
  2025, 'II', 66, 34)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0044 | əsas: 2025 toplu, II hissə, səh.66 №35
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0044', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Sadə triqonometrik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sin3x\cdot\sin6x=0$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\dfrac{\\pi n}{3};\\ n\\in Z$"}, {"key": "B", "text": "$\\dfrac{\\pi}{6}+\\dfrac{\\pi n}{3};\\ n\\in Z$"}, {"key": "C", "text": "$\\dfrac{\\pi n}{2};\\ n\\in Z$"}, {"key": "D", "text": "$\\dfrac{\\pi n}{6};\\ n\\in Z$"}, {"key": "E", "text": "$\\dfrac{\\pi n}{12};\\ n\\in Z$"}]'::jsonb, 'D', NULL, NULL,
  '$\sin3x=0$ köklərinin hamısı $\sin6x=0$ tənliyinin də kökləridir: $6x=\pi n$, $x=\dfrac{\pi n}{6}$.',
  2025, 'II', 66, 35)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0045 | əsas: 2025 toplu, II hissə, səh.66 №36
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0045', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Sadə triqonometrik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sin^2x=1$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\pi k,\\ k\\in Z$"}, {"key": "B", "text": "$2\\pi k,\\ k\\in Z$"}, {"key": "C", "text": "$\\dfrac{\\pi}{2}+2\\pi k,\\ k\\in Z$"}, {"key": "D", "text": "$\\dfrac{\\pi}{2}+\\pi k,\\ k\\in Z$"}, {"key": "E", "text": "$\\dfrac{\\pi}{4}+\\dfrac{\\pi k}{2},\\ k\\in Z$"}]'::jsonb, 'D', NULL, NULL,
  '$\sin x=\pm1\Rightarrow x=\dfrac{\pi}{2}+\pi k$ (və ya $\cos^2x=0$).',
  2025, 'II', 66, 36)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0046 | əsas: 2025 toplu, II hissə, səh.67 №41
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0046', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Sadə triqonometrik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\cos4x=0$ tənliyinin ən böyük mənfi kökünü tapın.',
  '[{"key": "A", "text": "$-\\dfrac{\\pi}{16}$"}, {"key": "B", "text": "$-\\dfrac{\\pi}{8}$"}, {"key": "C", "text": "$-\\dfrac{3\\pi}{8}$"}, {"key": "D", "text": "$-\\dfrac{\\pi}{2}$"}, {"key": "E", "text": "$-\\dfrac{\\pi}{4}$"}]'::jsonb, 'B', NULL, NULL,
  '$4x=\dfrac{\pi}{2}+\pi k\Rightarrow x=\dfrac{\pi}{8}+\dfrac{\pi k}{4}$. $k=-1$: $x=-\dfrac{\pi}{8}$ — ən böyük mənfi kök.',
  2025, 'II', 67, 41)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0047 | əsas: 2025 toplu, II hissə, səh.67 №42
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0047', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Sadə triqonometrik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sin3x=-1$ tənliyinin ən böyük mənfi kökünü tapın.',
  '[{"key": "A", "text": "$-\\dfrac{2\\pi}{3}$"}, {"key": "B", "text": "$-\\dfrac{\\pi}{6}$"}, {"key": "C", "text": "$-\\dfrac{\\pi}{2}$"}, {"key": "D", "text": "$-\\dfrac{\\pi}{3}$"}, {"key": "E", "text": "$-\\dfrac{5\\pi}{6}$"}]'::jsonb, 'B', NULL, NULL,
  '$3x=-\dfrac{\pi}{2}+2\pi k\Rightarrow x=-\dfrac{\pi}{6}+\dfrac{2\pi k}{3}$. $k=0$: $x=-\dfrac{\pi}{6}$.',
  2025, 'II', 67, 42)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0048 | əsas: 2025 toplu, II hissə, səh.67 №44
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0048', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Sadə triqonometrik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\operatorname{tg}\left(2x+\dfrac{\pi}{6}\right)=\sqrt3$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\dfrac{\\pi}{6}+\\dfrac{\\pi k}{2},\\ k\\in Z$"}, {"key": "B", "text": "$\\dfrac{\\pi}{6}+\\pi k,\\ k\\in Z$"}, {"key": "C", "text": "$\\dfrac{\\pi}{12}+\\pi k,\\ k\\in Z$"}, {"key": "D", "text": "$\\dfrac{\\pi}{12}+\\dfrac{\\pi k}{2},\\ k\\in Z$"}, {"key": "E", "text": "$\\dfrac{\\pi}{4}+\\dfrac{\\pi k}{2},\\ k\\in Z$"}]'::jsonb, 'D', NULL, NULL,
  '$2x+\dfrac{\pi}{6}=\dfrac{\pi}{3}+\pi k\Rightarrow2x=\dfrac{\pi}{6}+\pi k\Rightarrow x=\dfrac{\pi}{12}+\dfrac{\pi k}{2}$.',
  2025, 'II', 67, 44)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0049 | əsas: 2025 toplu, II hissə, səh.67 №48
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0049', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Sadə triqonometrik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\cos x=\cos\dfrac{\pi}{5}$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\dfrac{\\pi}{5}+\\pi n,\\ n\\in Z$"}, {"key": "B", "text": "$(-1)^n\\dfrac{\\pi}{5}+\\pi n,\\ n\\in Z$"}, {"key": "C", "text": "$\\pm\\dfrac{\\pi}{5}+2\\pi n,\\ n\\in Z$"}, {"key": "D", "text": "$\\pm\\dfrac{\\pi}{5}+\\pi n,\\ n\\in Z$"}, {"key": "E", "text": "$\\dfrac{\\pi}{5}$"}]'::jsonb, 'C', NULL, NULL,
  '$\cos x=\cos a\Leftrightarrow x=\pm a+2\pi n$: $x=\pm\dfrac{\pi}{5}+2\pi n$.',
  2025, 'II', 67, 48)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0050 | əsas: 2025 toplu, II hissə, səh.67 №49
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0050', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Sadə triqonometrik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sin x=\sin\dfrac{\pi}{7}$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\dfrac{\\pi}{7}$"}, {"key": "B", "text": "$(-1)^n\\dfrac{\\pi}{7}+2\\pi n,\\ n\\in Z$"}, {"key": "C", "text": "$\\pm\\dfrac{\\pi}{7}+2\\pi n,\\ n\\in Z$"}, {"key": "D", "text": "$\\dfrac{\\pi}{7}+\\pi n,\\ n\\in Z$"}, {"key": "E", "text": "$(-1)^n\\dfrac{\\pi}{7}+\\pi n,\\ n\\in Z$"}]'::jsonb, 'E', NULL, NULL,
  '$\sin x=\sin a\Leftrightarrow x=(-1)^na+\pi n$.',
  2025, 'II', 67, 49)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0051 | əsas: 2025 toplu, II hissə, səh.69 №66
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0051', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Sadə triqonometrik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\cos(\pi+x)=\sin\dfrac{\pi}{6}$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\pm\\dfrac{2\\pi}{3}+2\\pi k,\\ k\\in Z$"}, {"key": "B", "text": "$(-1)^{k+1}\\dfrac{\\pi}{6}+\\pi k,\\ k\\in Z$"}, {"key": "C", "text": "$\\pm\\dfrac{\\pi}{3}+2\\pi k,\\ k\\in Z$"}, {"key": "D", "text": "$\\pm\\dfrac{\\pi}{6}+2\\pi k,\\ k\\in Z$"}, {"key": "E", "text": "$(-1)^k\\dfrac{\\pi}{6}+\\pi k,\\ k\\in Z$"}]'::jsonb, 'A', NULL, NULL,
  '$\cos(\pi+x)=-\cos x$, $\sin\dfrac{\pi}{6}=\dfrac12$. $-\cos x=\dfrac12\Rightarrow\cos x=-\dfrac12\Rightarrow x=\pm\dfrac{2\pi}{3}+2\pi k$.',
  2025, 'II', 69, 66)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0052 | əsas: 2025 toplu, II hissə, səh.69 №67
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0052', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Sadə triqonometrik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sin(\pi+x)=\cos0$ tənliyini həll edin.',
  '[{"key": "A", "text": "$2\\pi k,\\ k\\in Z$"}, {"key": "B", "text": "$\\dfrac{\\pi}{2}+\\pi k,\\ k\\in Z$"}, {"key": "C", "text": "$-\\dfrac{\\pi}{2}+2\\pi k,\\ k\\in Z$"}, {"key": "D", "text": "$\\pi+2\\pi k,\\ k\\in Z$"}, {"key": "E", "text": "$\\dfrac{\\pi}{2}+2\\pi k,\\ k\\in Z$"}]'::jsonb, 'C', NULL, NULL,
  '$\sin(\pi+x)=-\sin x=1\Rightarrow\sin x=-1\Rightarrow x=-\dfrac{\pi}{2}+2\pi k$.',
  2025, 'II', 69, 67)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0053 | əsas: 2025 toplu, II hissə, səh.71 №94
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0053', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Sadə triqonometrik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$x$-in hansı qiymətlərində $3\operatorname{tg}^2x-6\sqrt3\operatorname{tg}x+1$ ifadəsi ən kiçik qiymət alar?',
  '[{"key": "A", "text": "$\\dfrac{\\pi}{6}+\\dfrac{\\pi m}{2},\\ m\\in Z$"}, {"key": "B", "text": "$-\\dfrac{\\pi}{3}+\\pi m,\\ m\\in Z$"}, {"key": "C", "text": "$\\dfrac{\\pi}{3}+\\pi m,\\ m\\in Z$"}, {"key": "D", "text": "$\\dfrac{\\pi}{3}+2\\pi m,\\ m\\in Z$"}, {"key": "E", "text": "$\\dfrac{\\pi}{6}+\\pi m,\\ m\\in Z$"}]'::jsonb, 'C', NULL, NULL,
  '$t=\operatorname{tg}x$: $3t^2-6\sqrt3t+1$ kvadrat üçhədlisi $t=\sqrt3$ olduqda ən kiçik qiymət alır. $\operatorname{tg}x=\sqrt3\Rightarrow x=\dfrac{\pi}{3}+\pi m$.',
  2025, 'II', 71, 94)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0054 | əsas: 2025 toplu, II hissə, səh.71 №95
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0054', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Sadə triqonometrik tənliklər'), 'original', 'own', 'az', 'draft', 'closed',
  '$x$-in hansı qiymətlərində $\operatorname{tg}^2x+2\sqrt3\operatorname{tg}x+4$ ifadəsi ən kiçik qiymət alar?',
  '[{"key": "A", "text": "$-\\dfrac{\\pi}{3}+\\pi m,\\ m\\in Z$"}, {"key": "B", "text": "$-\\dfrac{\\pi}{3}+2\\pi m,\\ m\\in Z$"}, {"key": "C", "text": "$\\dfrac{\\pi}{6}+\\pi m,\\ m\\in Z$"}, {"key": "D", "text": "$\\dfrac{\\pi}{3}+\\pi m,\\ m\\in Z$"}, {"key": "E", "text": "$-\\dfrac{\\pi}{6}+\\pi m,\\ m\\in Z$"}]'::jsonb, 'A', NULL, NULL,
  '$t^2+2\sqrt3t+4=(t+\sqrt3)^2+1$ — $t=-\sqrt3$ olduqda ən kiçikdir. $\operatorname{tg}x=-\sqrt3\Rightarrow x=-\dfrac{\pi}{3}+\pi m$.',
  2025, 'II', 71, 95)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0055 | əsas: 2025 toplu, II hissə, səh.71 №98
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0055', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Sadə triqonometrik tənliklər'), 'original', 'own', 'az', 'draft', 'written',
  '$2\cos3x=1$ tənliyinin $[0;\ \pi]$ aralığında neçə kökü var?',
  NULL, NULL, NULL, '3',
  '$3x=\pm\dfrac{\pi}{3}+2\pi k\Rightarrow x=\pm\dfrac{\pi}{9}+\dfrac{2\pi k}{3}$. $[0;\pi]$-də: $\dfrac{\pi}{9}$, $\dfrac{5\pi}{9}$, $\dfrac{7\pi}{9}$ — $3$ kök.',
  2025, 'II', 71, 98)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0056 | əsas: 2025 toplu, II hissə, səh.71 №99
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0056', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Sadə triqonometrik tənliklər'), 'original', 'own', 'az', 'draft', 'written',
  '$2\sin3x=\sqrt3$ tənliyinin $[0;\ \pi]$ aralığında neçə kökü var?',
  NULL, NULL, NULL, '4',
  '$3x=\dfrac{\pi}{3}+2\pi k$ və ya $3x=\dfrac{2\pi}{3}+2\pi k$. $3x\in[0;3\pi]$: $\dfrac{\pi}{3},\dfrac{2\pi}{3},\dfrac{7\pi}{3},\dfrac{8\pi}{3}$; $x=\dfrac{\pi}{9},\dfrac{2\pi}{9},\dfrac{7\pi}{9},\dfrac{8\pi}{9}$ — $4$ kök.',
  2025, 'II', 71, 99)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0057 | əsas: 2025 toplu, II hissə, səh.73 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0057', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik tənliklərin müxtəlif üsullarla həlli'), 'original', 'own', 'az', 'draft', 'closed',
  '$3\sin^2x-\cos^2x=0$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\dfrac{\\pi}{6}+\\pi k,\\ k\\in Z$"}, {"key": "B", "text": "$\\dfrac{\\pi}{6}+\\dfrac{\\pi k}{2},\\ k\\in Z$"}, {"key": "C", "text": "$\\pm\\dfrac{\\pi}{3}+\\pi k,\\ k\\in Z$"}, {"key": "D", "text": "$\\pm\\dfrac{\\pi}{6}+\\pi k,\\ k\\in Z$"}, {"key": "E", "text": "$\\pm\\dfrac{\\pi}{6}+2\\pi k,\\ k\\in Z$"}]'::jsonb, 'D', NULL, NULL,
  '$\cos x\ne0$ ($\cos x=0$ olduqda $\sin^2x=1$, bərabərlik ödənmir). $\cos^2x$-ə bölək: $\operatorname{tg}^2x=\dfrac13\Rightarrow\operatorname{tg}x=\pm\dfrac{1}{\sqrt3}\Rightarrow x=\pm\dfrac{\pi}{6}+\pi k$.',
  2025, 'II', 73, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0058 | əsas: 2025 toplu, II hissə, səh.73 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0058', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik tənliklərin müxtəlif üsullarla həlli'), 'original', 'own', 'az', 'draft', 'closed',
  '$2\cos^2x+\sin^2x-\dfrac54=0$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\pm\\dfrac{\\pi}{3}+2\\pi k,\\ k\\in Z$"}, {"key": "B", "text": "$\\pm\\dfrac{\\pi}{3}+\\pi k,\\ k\\in Z$"}, {"key": "C", "text": "$\\dfrac{\\pi}{6}+\\dfrac{\\pi k}{2},\\ k\\in Z$"}, {"key": "D", "text": "$\\pm\\dfrac{\\pi}{6}+\\pi k,\\ k\\in Z$"}, {"key": "E", "text": "$\\dfrac{\\pi}{3}+\\pi k,\\ k\\in Z$"}]'::jsonb, 'B', NULL, NULL,
  '$\sin^2x=1-\cos^2x$: $\cos^2x+1-\dfrac54=0\Rightarrow\cos^2x=\dfrac14\Rightarrow\cos x=\pm\dfrac12\Rightarrow x=\pm\dfrac{\pi}{3}+\pi k$.',
  2025, 'II', 73, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0059 | əsas: 2025 toplu, II hissə, səh.74 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0059', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik tənliklərin müxtəlif üsullarla həlli'), 'original', 'own', 'az', 'draft', 'closed',
  '$2\sin^2x+3\cos x=0$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\pm\\dfrac{2\\pi}{3}+\\pi k;\\ k\\in Z$"}, {"key": "B", "text": "$\\pm\\dfrac{\\pi}{3}+2\\pi k;\\ k\\in Z$"}, {"key": "C", "text": "$\\pi+2\\pi k;\\ k\\in Z$"}, {"key": "D", "text": "$\\pm\\dfrac{\\pi}{6}+2\\pi k;\\ k\\in Z$"}, {"key": "E", "text": "$\\pm\\dfrac{2\\pi}{3}+2\\pi k;\\ k\\in Z$"}]'::jsonb, 'E', NULL, NULL,
  '$2(1-\cos^2x)+3\cos x=0\Rightarrow2\cos^2x-3\cos x-2=0\Rightarrow\cos x=2$ (kənar kök) və ya $\cos x=-\dfrac12$. $x=\pm\dfrac{2\pi}{3}+2\pi k$.',
  2025, 'II', 74, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0060 | əsas: 2025 toplu, II hissə, səh.74 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0060', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik tənliklərin müxtəlif üsullarla həlli'), 'original', 'own', 'az', 'draft', 'closed',
  '$2\cos^2x+3\sin x=0$ tənliyini həll edin.',
  '[{"key": "A", "text": "$-\\dfrac{\\pi}{6}+2\\pi k;\\ k\\in Z$"}, {"key": "B", "text": "$\\pm\\dfrac{\\pi}{6}+2\\pi k;\\ k\\in Z$"}, {"key": "C", "text": "$(-1)^{k+1}\\dfrac{\\pi}{6}+\\pi k;\\ k\\in Z$"}, {"key": "D", "text": "$(-1)^k\\dfrac{\\pi}{6}+\\pi k;\\ k\\in Z$"}, {"key": "E", "text": "$(-1)^{k+1}\\dfrac{\\pi}{3}+\\pi k;\\ k\\in Z$"}]'::jsonb, 'C', NULL, NULL,
  '$2(1-\sin^2x)+3\sin x=0\Rightarrow2\sin^2x-3\sin x-2=0\Rightarrow\sin x=-\dfrac12$ ($\sin x=2$ mümkün deyil). $x=(-1)^{k+1}\dfrac{\pi}{6}+\pi k$.',
  2025, 'II', 74, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0061 | əsas: 2025 toplu, II hissə, səh.74 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0061', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik tənliklərin müxtəlif üsullarla həlli'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{4}{\cos^2x}=5+\operatorname{tg}^2x$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\pm\\dfrac{\\pi}{6}+\\pi n,\\ n\\in Z$"}, {"key": "B", "text": "$\\pm\\dfrac{\\pi}{3}+\\pi n,\\ n\\in Z$"}, {"key": "C", "text": "$\\dfrac{\\pi}{6}+2\\pi n,\\ n\\in Z$"}, {"key": "D", "text": "$\\dfrac{\\pi}{6}+\\pi n,\\ n\\in Z$"}, {"key": "E", "text": "$\\pm\\dfrac{\\pi}{6}+2\\pi n,\\ n\\in Z$"}]'::jsonb, 'A', NULL, NULL,
  '$\dfrac{1}{\cos^2x}=1+\operatorname{tg}^2x$: $4+4\operatorname{tg}^2x=5+\operatorname{tg}^2x\Rightarrow\operatorname{tg}^2x=\dfrac13\Rightarrow x=\pm\dfrac{\pi}{6}+\pi n$.',
  2025, 'II', 74, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0062 | əsas: 2025 toplu, II hissə, səh.74 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0062', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik tənliklərin müxtəlif üsullarla həlli'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{2}{\sin^2x}=3+\operatorname{ctg}^2x$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\dfrac{\\pi}{4}+\\pi k,\\ k\\in Z$"}, {"key": "B", "text": "$-\\dfrac{\\pi}{4}+\\pi k,\\ k\\in Z$"}, {"key": "C", "text": "$\\dfrac{\\pi}{4}+\\dfrac{\\pi k}{2},\\ k\\in Z$"}, {"key": "D", "text": "$\\dfrac{\\pi}{2}+\\pi k,\\ k\\in Z$"}, {"key": "E", "text": "$\\dfrac{\\pi k}{2},\\ k\\in Z$"}]'::jsonb, 'C', NULL, NULL,
  '$\dfrac{1}{\sin^2x}=1+\operatorname{ctg}^2x$: $2+2\operatorname{ctg}^2x=3+\operatorname{ctg}^2x\Rightarrow\operatorname{ctg}x=\pm1\Rightarrow x=\dfrac{\pi}{4}+\dfrac{\pi k}{2}$.',
  2025, 'II', 74, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0063 | əsas: 2025 toplu, II hissə, səh.74 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0063', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik tənliklərin müxtəlif üsullarla həlli'), 'original', 'own', 'az', 'draft', 'closed',
  '$5\sin x=2\sin^2x$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\pi+2\\pi k;\\ k\\in Z$"}, {"key": "B", "text": "$2\\pi k;\\ k\\in Z$"}, {"key": "C", "text": "$\\dfrac{\\pi k}{2};\\ k\\in Z$"}, {"key": "D", "text": "$\\dfrac{\\pi}{2}+\\pi k;\\ k\\in Z$"}, {"key": "E", "text": "$\\pi k;\\ k\\in Z$"}]'::jsonb, 'E', NULL, NULL,
  '$\sin x(5-2\sin x)=0$; $\sin x=2{,}5$ mümkün deyil, ona görə $\sin x=0\Rightarrow x=\pi k$.',
  2025, 'II', 74, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0064 | əsas: 2025 toplu, II hissə, səh.76 №41
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0064', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik tənliklərin müxtəlif üsullarla həlli'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{1+\cos2x}{\sin2x}=0$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\pi k;\\ k\\in Z$"}, {"key": "B", "text": "$\\varnothing$"}, {"key": "C", "text": "$\\dfrac{\\pi k}{2},\\ k\\in Z$"}, {"key": "D", "text": "$\\dfrac{\\pi}{2}+\\pi k;\\ k\\in Z$"}, {"key": "E", "text": "$2\\pi k;\\ k\\in Z$"}]'::jsonb, 'B', NULL, NULL,
  '$1+\cos2x=0\Rightarrow\cos2x=-1$; bu halda $\sin2x=0$ — məxrəc sıfırdır. Tənliyin həlli yoxdur.',
  2025, 'II', 76, 41)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0065 | əsas: 2025 toplu, II hissə, səh.76 №42
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0065', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik tənliklərin müxtəlif üsullarla həlli'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{\sin2x}{1+\cos2x}=0$ tənliyini həll edin.',
  '[{"key": "A", "text": "$2\\pi k,\\ k\\in Z$"}, {"key": "B", "text": "$\\dfrac{\\pi k}{2},\\ k\\in Z$"}, {"key": "C", "text": "$\\dfrac{\\pi}{2}+\\pi k;\\ k\\in Z$"}, {"key": "D", "text": "$\\pi k,\\ k\\in Z$"}, {"key": "E", "text": "$\\varnothing$"}]'::jsonb, 'D', NULL, NULL,
  '$\sin2x=0\Rightarrow2x=\pi k$. Məxrəc: $\cos2x\ne-1$, yəni $2x\ne\pi+2\pi n$. Qalır $2x=2\pi k$, $x=\pi k$.',
  2025, 'II', 76, 42)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0066 | əsas: 2025 toplu, II hissə, səh.77 №47
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0066', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik tənliklərin müxtəlif üsullarla həlli'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sin^2x-5\sin x\cos x+4\cos^2x=0$ tənliyini həll edin.',
  '[{"key": "A", "text": "$-\\dfrac{\\pi}{4}+\\pi k;\\ \\operatorname{arctg}(-4)+\\pi n;\\ k,n\\in Z$"}, {"key": "B", "text": "$-\\dfrac{\\pi}{4}+\\pi k;\\ \\operatorname{arctg}4+\\pi n;\\ k,n\\in Z$"}, {"key": "C", "text": "$\\dfrac{\\pi}{4}+\\pi k;\\ k\\in Z$"}, {"key": "D", "text": "$\\dfrac{\\pi}{4}+\\pi k;\\ \\operatorname{arctg}4+\\pi n;\\ k,n\\in Z$"}, {"key": "E", "text": "$\\operatorname{arctg}4+\\pi k;\\ k\\in Z$"}]'::jsonb, 'D', NULL, NULL,
  '$\cos x=0$ kök deyil. $\cos^2x$-ə bölək: $\operatorname{tg}^2x-5\operatorname{tg}x+4=0\Rightarrow\operatorname{tg}x=1$ və ya $\operatorname{tg}x=4$.',
  2025, 'II', 77, 47)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0067 | əsas: 2025 toplu, II hissə, səh.77 №48
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0067', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik tənliklərin müxtəlif üsullarla həlli'), 'original', 'own', 'az', 'draft', 'closed',
  '$3\sin^2x+\sin x\cos x-2=0$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\dfrac{\\pi}{4}+\\pi k;\\ k\\in Z$"}, {"key": "B", "text": "$-\\dfrac{\\pi}{4}+\\pi k;\\ \\operatorname{arctg}2+\\pi n;\\ k,n\\in Z$"}, {"key": "C", "text": "$\\dfrac{\\pi}{4}+\\pi k;\\ \\operatorname{arctg}2+\\pi n;\\ k,n\\in Z$"}, {"key": "D", "text": "$-\\operatorname{arctg}2+\\pi k;\\ k\\in Z$"}, {"key": "E", "text": "$\\dfrac{\\pi}{4}+\\pi k;\\ -\\operatorname{arctg}2+\\pi n;\\ k,n\\in Z$"}]'::jsonb, 'E', NULL, NULL,
  '$2=2\sin^2x+2\cos^2x$: $\sin^2x+\sin x\cos x-2\cos^2x=0$. $\cos^2x$-ə bölək: $\operatorname{tg}^2x+\operatorname{tg}x-2=0\Rightarrow\operatorname{tg}x=1$ və ya $\operatorname{tg}x=-2$.',
  2025, 'II', 77, 48)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0068 | əsas: 2025 toplu, II hissə, səh.77 №49
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0068', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik tənliklərin müxtəlif üsullarla həlli'), 'original', 'own', 'az', 'draft', 'closed',
  '$2\sin^2x+\sin x\cos x=3\cos^2x$ tənliyini həll edin.',
  '[{"key": "A", "text": "$-\\operatorname{arctg}\\dfrac32+\\pi k;\\ k\\in Z$"}, {"key": "B", "text": "$\\dfrac{\\pi}{4}+\\pi k;\\ \\operatorname{arctg}\\dfrac23+\\pi n;\\ k,n\\in Z$"}, {"key": "C", "text": "$\\dfrac{\\pi}{4}+\\pi k;\\ k\\in Z$"}, {"key": "D", "text": "$\\dfrac{\\pi}{4}+\\pi k;\\ -\\operatorname{arctg}\\dfrac32+\\pi n;\\ k,n\\in Z$"}, {"key": "E", "text": "$-\\dfrac{\\pi}{4}+\\pi k;\\ \\operatorname{arctg}\\dfrac32+\\pi n;\\ k,n\\in Z$"}]'::jsonb, 'D', NULL, NULL,
  '$\cos^2x$-ə bölək: $2\operatorname{tg}^2x+\operatorname{tg}x-3=0\Rightarrow\operatorname{tg}x=1$ və ya $\operatorname{tg}x=-\dfrac32$.',
  2025, 'II', 77, 49)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0069 | əsas: 2025 toplu, II hissə, səh.77 №50
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0069', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik tənliklərin müxtəlif üsullarla həlli'), 'original', 'own', 'az', 'draft', 'closed',
  '$\cos^4x-\sin^4x+\sin^2x=0$ tənliyini həll edin.',
  '[{"key": "A", "text": "$-\\dfrac{\\pi}{2}+2\\pi n,\\ n\\in Z$"}, {"key": "B", "text": "$\\pi n,\\ n\\in Z$"}, {"key": "C", "text": "$\\pi+2\\pi n,\\ n\\in Z$"}, {"key": "D", "text": "$\\dfrac{\\pi}{2}+\\pi n,\\ n\\in Z$"}, {"key": "E", "text": "$\\dfrac{\\pi}{2}+2\\pi n,\\ n\\in Z$"}]'::jsonb, 'D', NULL, NULL,
  '$\cos^4x-\sin^4x=\cos^2x-\sin^2x$. Tənlik: $\cos^2x-\sin^2x+\sin^2x=\cos^2x=0\Rightarrow x=\dfrac{\pi}{2}+\pi n$.',
  2025, 'II', 77, 50)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0070 | əsas: 2025 toplu, II hissə, səh.77 №51
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0070', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik tənliklərin müxtəlif üsullarla həlli'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sin^4x-\cos^4x+\cos^2x=0$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\pi+2\\pi n,\\ n\\in Z$"}, {"key": "B", "text": "$\\dfrac{\\pi n}{2},\\ n\\in Z$"}, {"key": "C", "text": "$\\pi n,\\ n\\in Z$"}, {"key": "D", "text": "$2\\pi n,\\ n\\in Z$"}, {"key": "E", "text": "$\\dfrac{\\pi}{2}+\\pi n,\\ n\\in Z$"}]'::jsonb, 'C', NULL, NULL,
  '$\sin^4x-\cos^4x=\sin^2x-\cos^2x$. Tənlik: $\sin^2x=0\Rightarrow x=\pi n$.',
  2025, 'II', 77, 51)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0071 | əsas: 2025 toplu, II hissə, səh.78 №63
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0071', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik tənliklərin müxtəlif üsullarla həlli'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sin x+\cos x=-1$ tənliyinin ən kiçik müsbət kökünü tapın.',
  '[{"key": "A", "text": "$2\\pi$"}, {"key": "B", "text": "$\\dfrac{\\pi}{2}$"}, {"key": "C", "text": "$\\pi$"}, {"key": "D", "text": "$\\dfrac{3\\pi}{4}$"}, {"key": "E", "text": "$\\dfrac{3\\pi}{2}$"}]'::jsonb, 'C', NULL, NULL,
  '$\sqrt2\sin\left(x+\dfrac{\pi}{4}\right)=-1\Rightarrow x+\dfrac{\pi}{4}=-\dfrac{\pi}{4}+2\pi k$ və ya $x+\dfrac{\pi}{4}=\dfrac{5\pi}{4}+2\pi k$. $x=-\dfrac{\pi}{2}+2\pi k$ və ya $x=\pi+2\pi k$. Ən kiçik müsbət kök $\pi$.',
  2025, 'II', 78, 63)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0072 | əsas: 2025 toplu, II hissə, səh.80 №85
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0072', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik tənliklərin müxtəlif üsullarla həlli'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sin3x-\cos3x=\sqrt2$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\dfrac{\\pi}{12}+\\dfrac{2\\pi}{3}k,\\ k\\in Z$"}, {"key": "B", "text": "$\\dfrac{\\pi}{4}+\\dfrac{2\\pi}{3}k,\\ k\\in Z$"}, {"key": "C", "text": "$\\dfrac{\\pi}{4}+\\dfrac{\\pi}{3}k,\\ k\\in Z$"}, {"key": "D", "text": "$\\dfrac{\\pi}{2}+\\dfrac{2\\pi}{3}k,\\ k\\in Z$"}, {"key": "E", "text": "$\\dfrac{3\\pi}{4}+2\\pi k,\\ k\\in Z$"}]'::jsonb, 'B', NULL, NULL,
  '$\sqrt2\sin\left(3x-\dfrac{\pi}{4}\right)=\sqrt2\Rightarrow3x-\dfrac{\pi}{4}=\dfrac{\pi}{2}+2\pi k\Rightarrow3x=\dfrac{3\pi}{4}+2\pi k\Rightarrow x=\dfrac{\pi}{4}+\dfrac{2\pi k}{3}$.',
  2025, 'II', 80, 85)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0073 | əsas: 2025 toplu, II hissə, səh.80 №86
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0073', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik tənliklərin müxtəlif üsullarla həlli'), 'original', 'own', 'az', 'draft', 'closed',
  '$\cos5x=\cos x$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\dfrac{\\pi k}{4};\\ \\dfrac{\\pi n}{3},\\ k,n\\in Z$"}, {"key": "B", "text": "$\\dfrac{\\pi k}{2};\\ \\dfrac{\\pi}{6}+\\dfrac{\\pi n}{3},\\ k,n\\in Z$"}, {"key": "C", "text": "$\\dfrac{\\pi k}{4};\\ \\dfrac{\\pi n}{6},\\ k,n\\in Z$"}, {"key": "D", "text": "$\\dfrac{\\pi k}{3},\\ k\\in Z$"}, {"key": "E", "text": "$\\dfrac{\\pi k}{2};\\ \\dfrac{\\pi n}{3},\\ k,n\\in Z$"}]'::jsonb, 'E', NULL, NULL,
  '$\cos5x=\cos x\Leftrightarrow5x=\pm x+2\pi k$. $4x=2\pi k\Rightarrow x=\dfrac{\pi k}{2}$; $6x=2\pi n\Rightarrow x=\dfrac{\pi n}{3}$.',
  2025, 'II', 80, 86)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0074 | əsas: 2025 toplu, II hissə, səh.80 №87
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0074', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik tənliklərin müxtəlif üsullarla həlli'), 'original', 'own', 'az', 'draft', 'closed',
  '$4\sin^3x=\sin x$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\pi k;\\ \\pm\\dfrac{\\pi}{3}+\\pi n,\\ k,n\\in Z$"}, {"key": "B", "text": "$\\dfrac{\\pi k}{2},\\ k\\in Z$"}, {"key": "C", "text": "$\\pi k;\\ \\pm\\dfrac{\\pi}{6}+\\pi n,\\ k,n\\in Z$"}, {"key": "D", "text": "$\\pm\\dfrac{\\pi}{6}+\\pi k,\\ k\\in Z$"}, {"key": "E", "text": "$\\pi k;\\ \\dfrac{\\pi}{6}+2\\pi n,\\ k,n\\in Z$"}]'::jsonb, 'C', NULL, NULL,
  '$\sin x(4\sin^2x-1)=0$: $\sin x=0\Rightarrow x=\pi k$; $\sin x=\pm\dfrac12\Rightarrow x=\pm\dfrac{\pi}{6}+\pi n$.',
  2025, 'II', 80, 87)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0075 | əsas: 2025 toplu, II hissə, səh.80 №90
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0075', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik tənliklərin müxtəlif üsullarla həlli'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sin3x+\sqrt3\cos3x=2$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\dfrac{\\pi}{6}+\\dfrac{2\\pi}{3}k,\\ k\\in Z$"}, {"key": "B", "text": "$\\dfrac{\\pi}{18}+\\dfrac{\\pi}{3}k,\\ k\\in Z$"}, {"key": "C", "text": "$\\dfrac{\\pi}{18}+\\dfrac{2\\pi}{3}k,\\ k\\in Z$"}, {"key": "D", "text": "$-\\dfrac{\\pi}{18}+\\dfrac{2\\pi}{3}k,\\ k\\in Z$"}, {"key": "E", "text": "$\\dfrac{\\pi}{9}+\\dfrac{2\\pi}{3}k,\\ k\\in Z$"}]'::jsonb, 'C', NULL, NULL,
  '$2\sin\left(3x+\dfrac{\pi}{3}\right)=2\Rightarrow3x+\dfrac{\pi}{3}=\dfrac{\pi}{2}+2\pi k\Rightarrow x=\dfrac{\pi}{18}+\dfrac{2\pi k}{3}$.',
  2025, 'II', 80, 90)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0076 | əsas: 2025 toplu, II hissə, səh.81 №95
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0076', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik tənliklərin müxtəlif üsullarla həlli'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sqrt3\sin4x-\cos4x=0$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\dfrac{\\pi}{24}+\\dfrac{\\pi}{4}k,\\ k\\in Z$"}, {"key": "B", "text": "$\\dfrac{\\pi}{6}+\\dfrac{\\pi}{4}k,\\ k\\in Z$"}, {"key": "C", "text": "$-\\dfrac{\\pi}{24}+\\dfrac{\\pi}{4}k,\\ k\\in Z$"}, {"key": "D", "text": "$\\dfrac{\\pi}{12}+\\dfrac{\\pi}{4}k,\\ k\\in Z$"}, {"key": "E", "text": "$\\dfrac{\\pi}{24}+\\dfrac{\\pi}{2}k,\\ k\\in Z$"}]'::jsonb, 'A', NULL, NULL,
  '$\cos4x\ne0$ (əks halda $\sin4x=0$ da olmalı idi). $\operatorname{tg}4x=\dfrac{1}{\sqrt3}\Rightarrow4x=\dfrac{\pi}{6}+\pi k\Rightarrow x=\dfrac{\pi}{24}+\dfrac{\pi k}{4}$.',
  2025, 'II', 81, 95)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0077 | əsas: 2025 toplu, II hissə, səh.81 №98
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0077', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik tənliklərin müxtəlif üsullarla həlli'), 'original', 'own', 'az', 'draft', 'closed',
  '$\sin4x-5\cos2x=0$ tənliyini həll edin.',
  '[{"key": "A", "text": "$\\dfrac{\\pi}{4}+\\dfrac{\\pi}{2}k,\\ k\\in Z$"}, {"key": "B", "text": "$\\dfrac{\\pi}{2}+\\dfrac{\\pi}{2}k,\\ k\\in Z$"}, {"key": "C", "text": "$\\dfrac{\\pi}{4}+\\pi k,\\ k\\in Z$"}, {"key": "D", "text": "$\\varnothing$"}, {"key": "E", "text": "$\\dfrac{\\pi}{8}+\\dfrac{\\pi}{4}k,\\ k\\in Z$"}]'::jsonb, 'A', NULL, NULL,
  '$\sin4x=2\sin2x\cos2x$: $\cos2x(2\sin2x-5)=0$. $\sin2x=2{,}5$ mümkün deyil, $\cos2x=0\Rightarrow2x=\dfrac{\pi}{2}+\pi k\Rightarrow x=\dfrac{\pi}{4}+\dfrac{\pi k}{2}$.',
  2025, 'II', 81, 98)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TRQ-0078 | əsas: 2025 toplu, II hissə, səh.82 №118
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TRQ-0078', NULL, NULL, (SELECT id FROM topics WHERE name='Triqonometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Triqonometriya' AND s.title='Triqonometrik tənliklərin müxtəlif üsullarla həlli'), 'original', 'own', 'az', 'draft', 'written',
  '$4\sin x\cdot\cos x\cdot\cos2x=\dfrac12$ tənliyinin $[0;\ \pi]$ parçasında neçə kökü var?',
  NULL, NULL, NULL, '4',
  '$4\sin x\cos x\cos2x=2\sin2x\cos2x=\sin4x$. $\sin4x=\dfrac12$: $4x=\dfrac{\pi}{6}+2\pi k$ və ya $4x=\dfrac{5\pi}{6}+2\pi k$. $4x\in[0;4\pi]$: $\dfrac{\pi}{6},\dfrac{5\pi}{6},\dfrac{13\pi}{6},\dfrac{17\pi}{6}$ — $4$ kök.',
  2025, 'II', 82, 118)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
