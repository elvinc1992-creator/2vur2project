-- Mövzu: Limit, törəmə, inteqral — 108 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- LTI-0001 | əsas: 2025 toplu, II hissə, səh.121 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Ədədi ardıcıllığın limiti. Funksiyanın limiti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lim\limits_{n\to\infty}\dfrac{\sqrt{12n^2+5}+4}{\sqrt{27n^2-1}+7}$ limitini hesablayın.',
  '[{"key": "A", "text": "$1$"}, {"key": "B", "text": "$\\dfrac{4}{9}$"}, {"key": "C", "text": "$\\dfrac{4}{7}$"}, {"key": "D", "text": "$\\dfrac{2}{3}$"}, {"key": "E", "text": "$0$"}]'::jsonb, 'D', NULL, NULL,
  'Surəti və məxrəci $n$-ə bölək: $\dfrac{\sqrt{12}}{\sqrt{27}}=\dfrac{2\sqrt3}{3\sqrt3}=\dfrac23$.',
  2025, 'II', 121, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0002 | əsas: 2025 toplu, II hissə, səh.121 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Ədədi ardıcıllığın limiti. Funksiyanın limiti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lim\limits_{n\to\infty}\dfrac{\sqrt{16n^2+3}-5}{3n}$ limitini hesablayın.',
  '[{"key": "A", "text": "$0$"}, {"key": "B", "text": "$4$"}, {"key": "C", "text": "$\\dfrac{16}{3}$"}, {"key": "D", "text": "$\\dfrac{4}{3}$"}, {"key": "E", "text": "$0{,}75$"}]'::jsonb, 'D', NULL, NULL,
  '$\dfrac{\sqrt{16n^2+3}}{3n}\to\dfrac43$, $\dfrac{5}{3n}\to0$. Cavab $\dfrac43$.',
  2025, 'II', 121, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0003 | əsas: 2025 toplu, II hissə, səh.121 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Ədədi ardıcıllığın limiti. Funksiyanın limiti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lim\limits_{n\to\infty}\dfrac{\sqrt{5n+2}}{\sqrt{5n}+3}$ limitini hesablayın.',
  '[{"key": "A", "text": "$\\dfrac{2}{3}$"}, {"key": "B", "text": "$5$"}, {"key": "C", "text": "$\\sqrt{5}$"}, {"key": "D", "text": "$0$"}, {"key": "E", "text": "$1$"}]'::jsonb, 'E', NULL, NULL,
  'Surəti və məxrəci $\sqrt{n}$-ə bölək: $\dfrac{\sqrt5}{\sqrt5}=1$.',
  2025, 'II', 121, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0004 | əsas: 2025 toplu, II hissə, səh.121 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Ədədi ardıcıllığın limiti. Funksiyanın limiti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lim\limits_{n\to\infty}\dfrac{5\sqrt{n^2+3}+2}{4n}$ limitini hesablayın.',
  '[{"key": "A", "text": "$0$"}, {"key": "B", "text": "$0{,}5$"}, {"key": "C", "text": "$1{,}25$"}, {"key": "D", "text": "$0{,}8$"}, {"key": "E", "text": "$5$"}]'::jsonb, 'C', NULL, NULL,
  '$\sqrt{n^2+3}\sim n$: $\dfrac{5n}{4n}=\dfrac54$.',
  2025, 'II', 121, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0005 | əsas: 2025 toplu, II hissə, səh.121 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Ədədi ardıcıllığın limiti. Funksiyanın limiti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lim\limits_{n\to\infty}\dfrac{7n-2}{3\sqrt{n^2+5}}$ limitini hesablayın.',
  '[{"key": "A", "text": "$\\dfrac{7}{3}$"}, {"key": "B", "text": "$7$"}, {"key": "C", "text": "$1$"}, {"key": "D", "text": "$0$"}, {"key": "E", "text": "$\\dfrac{3}{7}$"}]'::jsonb, 'A', NULL, NULL,
  '$\dfrac{7n}{3n}=\dfrac73$.',
  2025, 'II', 121, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0006 | əsas: 2025 toplu, II hissə, səh.122 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Ədədi ardıcıllığın limiti. Funksiyanın limiti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lim\limits_{n\to\infty}\left(\dfrac{n^2}{n+4}-n\right)$ limitini hesablayın.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$-4$"}, {"key": "C", "text": "$-1$"}, {"key": "D", "text": "$1$"}, {"key": "E", "text": "$0$"}]'::jsonb, 'B', NULL, NULL,
  '$\dfrac{n^2-n^2-4n}{n+4}=\dfrac{-4n}{n+4}\to-4$.',
  2025, 'II', 122, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0007 | əsas: 2025 toplu, II hissə, səh.122 №29
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0007', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Ədədi ardıcıllığın limiti. Funksiyanın limiti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lim\limits_{n\to\infty}\left(\dfrac{n^2}{n-6}-n\right)$ limitini hesablayın.',
  '[{"key": "A", "text": "$1$"}, {"key": "B", "text": "$36$"}, {"key": "C", "text": "$0$"}, {"key": "D", "text": "$-6$"}, {"key": "E", "text": "$6$"}]'::jsonb, 'E', NULL, NULL,
  '$\dfrac{n^2-n^2+6n}{n-6}=\dfrac{6n}{n-6}\to6$.',
  2025, 'II', 122, 29)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0008 | əsas: 2025 toplu, II hissə, səh.122 №30
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Ədədi ardıcıllığın limiti. Funksiyanın limiti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lim\limits_{n\to\infty}\left(\dfrac{8n+5}{4n^2+3}+2\right)$ limitini hesablayın.',
  '[{"key": "A", "text": "$0$"}, {"key": "B", "text": "$4$"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$\\dfrac{8}{3}$"}, {"key": "E", "text": "$6$"}]'::jsonb, 'C', NULL, NULL,
  '$\dfrac{8n+5}{4n^2+3}\to0$; cavab $2$.',
  2025, 'II', 122, 30)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0009 | əsas: 2025 toplu, II hissə, səh.122 №31
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Ədədi ardıcıllığın limiti. Funksiyanın limiti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lim\limits_{n\to\infty}\left(\dfrac{(-1)^n}{5n}-4\right)$ limitini hesablayın.',
  '[{"key": "A", "text": "$-3$"}, {"key": "B", "text": "$4$"}, {"key": "C", "text": "$-5$"}, {"key": "D", "text": "$0$"}, {"key": "E", "text": "$-4$"}]'::jsonb, 'E', NULL, NULL,
  '$\left|\dfrac{(-1)^n}{5n}\right|=\dfrac{1}{5n}\to0$; cavab $-4$.',
  2025, 'II', 122, 31)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0010 | əsas: 2025 toplu, II hissə, səh.124 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Ədədi ardıcıllığın limiti. Funksiyanın limiti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lim\limits_{x\to25}\dfrac{\sqrt x-5}{x-25}$ limitini hesablayın.',
  '[{"key": "A", "text": "$5$"}, {"key": "B", "text": "$0{,}1$"}, {"key": "C", "text": "$10$"}, {"key": "D", "text": "$0$"}, {"key": "E", "text": "$0{,}2$"}]'::jsonb, 'B', NULL, NULL,
  '$x-25=(\sqrt x-5)(\sqrt x+5)$; limit $\dfrac{1}{\sqrt{25}+5}=\dfrac{1}{10}$.',
  2025, 'II', 124, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0011 | əsas: 2025 toplu, II hissə, səh.124 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0011', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Ədədi ardıcıllığın limiti. Funksiyanın limiti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lim\limits_{x\to49}\dfrac{\sqrt x-7}{x-49}$ limitini hesablayın.',
  '[{"key": "A", "text": "$\\dfrac{1}{7}$"}, {"key": "B", "text": "$\\dfrac{1}{14}$"}, {"key": "C", "text": "$7$"}, {"key": "D", "text": "$14$"}, {"key": "E", "text": "$0$"}]'::jsonb, 'B', NULL, NULL,
  '$\dfrac{1}{\sqrt{49}+7}=\dfrac{1}{14}$.',
  2025, 'II', 124, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0012 | əsas: 2025 toplu, II hissə, səh.124 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0012', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Ədədi ardıcıllığın limiti. Funksiyanın limiti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lim\limits_{x\to-3}\dfrac{5x+15}{x^2-9}$ limitini hesablayın.',
  '[{"key": "A", "text": "$- \\dfrac{5}{6}$"}, {"key": "B", "text": "$5$"}, {"key": "C", "text": "$- \\dfrac{1}{6}$"}, {"key": "D", "text": "$-5$"}, {"key": "E", "text": "$\\dfrac{5}{6}$"}]'::jsonb, 'A', NULL, NULL,
  '$\dfrac{5(x+3)}{(x-3)(x+3)}=\dfrac{5}{x-3}\to-\dfrac56$.',
  2025, 'II', 124, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0013 | əsas: 2025 toplu, II hissə, səh.124 №29
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Ədədi ardıcıllığın limiti. Funksiyanın limiti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lim\limits_{x\to0}\dfrac{\sin\frac{x}{\sqrt2}}{x}$ limitini hesablayın.',
  '[{"key": "A", "text": "$\\sqrt2$"}, {"key": "B", "text": "$2$"}, {"key": "C", "text": "$\\dfrac{1}{\\sqrt2}$"}, {"key": "D", "text": "$1$"}, {"key": "E", "text": "$\\dfrac12$"}]'::jsonb, 'C', NULL, NULL,
  '$\lim\dfrac{\sin kx}{x}=k$; $k=\dfrac{1}{\sqrt2}$.',
  2025, 'II', 124, 29)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0014 | əsas: 2025 toplu, II hissə, səh.125 №30
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Ədədi ardıcıllığın limiti. Funksiyanın limiti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lim\limits_{x\to0}\dfrac{\sin\sqrt3x}{x}$ limitini hesablayın.',
  '[{"key": "A", "text": "$\\dfrac{1}{\\sqrt3}$"}, {"key": "B", "text": "$3$"}, {"key": "C", "text": "$0$"}, {"key": "D", "text": "$1$"}, {"key": "E", "text": "$\\sqrt3$"}]'::jsonb, 'E', NULL, NULL,
  '$\lim\dfrac{\sin kx}{x}=k=\sqrt3$.',
  2025, 'II', 125, 30)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0015 | əsas: 2025 toplu, II hissə, səh.125 №31
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0015', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Ədədi ardıcıllığın limiti. Funksiyanın limiti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lim\limits_{x\to0}\dfrac{\sin0{,}4x}{x}$ limitini hesablayın.',
  '[{"key": "A", "text": "$0$"}, {"key": "B", "text": "$0{,}4$"}, {"key": "C", "text": "$4$"}, {"key": "D", "text": "$2{,}5$"}, {"key": "E", "text": "$1$"}]'::jsonb, 'B', NULL, NULL,
  '$k=0{,}4$.',
  2025, 'II', 125, 31)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0016 | əsas: 2025 toplu, II hissə, səh.125 №32
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Ədədi ardıcıllığın limiti. Funksiyanın limiti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lim\limits_{x\to4}\dfrac{3x^2-48}{x-4}$ limitini tapın.',
  '[{"key": "A", "text": "$8$"}, {"key": "B", "text": "$24$"}, {"key": "C", "text": "$0$"}, {"key": "D", "text": "$12$"}, {"key": "E", "text": "$48$"}]'::jsonb, 'B', NULL, NULL,
  '$\dfrac{3(x-4)(x+4)}{x-4}=3(x+4)\to24$.',
  2025, 'II', 125, 32)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0017 | əsas: 2025 toplu, II hissə, səh.125 №35
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Ədədi ardıcıllığın limiti. Funksiyanın limiti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lim\limits_{x\to0}\dfrac{x^2+8x}{x^2+2x}$ limitini tapın.',
  '[{"key": "A", "text": "$1$"}, {"key": "B", "text": "$8$"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$0$"}, {"key": "E", "text": "$4$"}]'::jsonb, 'E', NULL, NULL,
  '$\dfrac{x(x+8)}{x(x+2)}\to\dfrac82=4$.',
  2025, 'II', 125, 35)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0018 | əsas: 2025 toplu, II hissə, səh.125 №36
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Ədədi ardıcıllığın limiti. Funksiyanın limiti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lim\limits_{x\to0}\dfrac{x^2-6x}{x^2-3x}$ limitini tapın.',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "$-2$"}, {"key": "C", "text": "$1$"}, {"key": "D", "text": "$-3$"}, {"key": "E", "text": "$3$"}]'::jsonb, 'A', NULL, NULL,
  '$\dfrac{x-6}{x-3}\to\dfrac{-6}{-3}=2$.',
  2025, 'II', 125, 36)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0019 | əsas: 2025 toplu, II hissə, səh.126 №61
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Ədədi ardıcıllığın limiti. Funksiyanın limiti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lim\limits_{x\to5}\dfrac{x^2-25}{2-\sqrt{x-1}}$ limitini tapın.',
  '[{"key": "A", "text": "$40$"}, {"key": "B", "text": "$0$"}, {"key": "C", "text": "$-40$"}, {"key": "D", "text": "$-10$"}, {"key": "E", "text": "$10$"}]'::jsonb, 'C', NULL, NULL,
  'Surəti və məxrəci $2+\sqrt{x-1}$-ə vuraq: məxrəc $4-(x-1)=5-x$. $\dfrac{(x-5)(x+5)(2+\sqrt{x-1})}{-(x-5)}\to-10\cdot4=-40$.',
  2025, 'II', 126, 61)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0020 | əsas: 2025 toplu, II hissə, səh.126 №62
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Ədədi ardıcıllığın limiti. Funksiyanın limiti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lim\limits_{x\to5}\dfrac{x^2-25}{\sqrt{x-1}-2}$ limitini hesablayın.',
  '[{"key": "A", "text": "$-40$"}, {"key": "B", "text": "$0$"}, {"key": "C", "text": "$10$"}, {"key": "D", "text": "$40$"}, {"key": "E", "text": "$0{,}025$"}]'::jsonb, 'D', NULL, NULL,
  '$\dfrac{(x-5)(x+5)(\sqrt{x-1}+2)}{x-5}\to10\cdot4=40$.',
  2025, 'II', 126, 62)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0021 | əsas: 2025 toplu, II hissə, səh.127 №81
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Ədədi ardıcıllığın limiti. Funksiyanın limiti'), 'original', 'own', 'az', 'draft', 'closed',
  '$\lim\limits_{x\to9}\dfrac{\sqrt x-3}{x^2-10x+9}$ limitini hesablayın.',
  '[{"key": "A", "text": "$0{,}125$"}, {"key": "B", "text": "$- \\dfrac{1}{48}$"}, {"key": "C", "text": "$\\dfrac{1}{48}$"}, {"key": "D", "text": "$0$"}, {"key": "E", "text": "$\\dfrac{1}{6}$"}]'::jsonb, 'C', NULL, NULL,
  '$x^2-10x+9=(x-9)(x-1)$, $x-9=(\sqrt x-3)(\sqrt x+3)$. Limit $\dfrac{1}{(\sqrt9+3)(9-1)}=\dfrac{1}{48}$.',
  2025, 'II', 127, 81)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0022 | əsas: 2025 toplu, II hissə, səh.128 №108
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Ədədi ardıcıllığın limiti. Funksiyanın limiti'), 'original', 'own', 'az', 'draft', 'written',
  '$\lim\limits_{x\to0}\dfrac{x}{\sqrt{x+25}-5}$ limitini hesablayın.',
  NULL, NULL, NULL, '10',
  'Surəti və məxrəci $\sqrt{x+25}+5$-ə vuraq: $\sqrt{x+25}+5\to10$.',
  2025, 'II', 128, 108)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0023 | əsas: 2025 toplu, II hissə, səh.131 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın törəməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=x^7-3x+4$ funksiyasının törəməsini tapın.',
  '[{"key": "A", "text": "$6x^6-3$"}, {"key": "B", "text": "$7x^6-3x$"}, {"key": "C", "text": "$x^6-3$"}, {"key": "D", "text": "$7x^6-3$"}, {"key": "E", "text": "$7x^6+4$"}]'::jsonb, 'D', NULL, NULL,
  '$(x^7)''=7x^6$, $(-3x)''=-3$, $(4)''=0$.',
  2025, 'II', 131, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0024 | əsas: 2025 toplu, II hissə, səh.131 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın törəməsi'), 'original', 'own', 'az', 'draft', 'open',
  '$f(x)=\dfrac13x^3+5x^2+3x-2$ funksiyası üçün $f''(0)$-ı tapın.',
  NULL, NULL, NULL, '3',
  '$f''(x)=x^2+10x+3$; $f''(0)=3$.',
  2025, 'II', 131, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0025 | əsas: 2025 toplu, II hissə, səh.131 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0025', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın törəməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=3x^2-\ln x$ funksiyasının törəməsini tapın.',
  '[{"key": "A", "text": "$6x-1$"}, {"key": "B", "text": "$6x-\\ln x$"}, {"key": "C", "text": "$6x-\\dfrac1x$"}, {"key": "D", "text": "$6x+\\dfrac1x$"}, {"key": "E", "text": "$3x-\\dfrac1x$"}]'::jsonb, 'C', NULL, NULL,
  '$(3x^2)''=6x$, $(\ln x)''=\dfrac1x$.',
  2025, 'II', 131, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0026 | əsas: 2025 toplu, II hissə, səh.132 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın törəməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=5x^4+\sin x-3$ funksiyasının törəməsini tapın.',
  '[{"key": "A", "text": "$20x^3+\\cos x$"}, {"key": "B", "text": "$20x^3+\\cos x-3$"}, {"key": "C", "text": "$5x^3+\\cos x$"}, {"key": "D", "text": "$20x^3-\\cos x$"}, {"key": "E", "text": "$20x^3-\\sin x$"}]'::jsonb, 'A', NULL, NULL,
  '$(5x^4)''=20x^3$, $(\sin x)''=\cos x$, sabitin törəməsi $0$.',
  2025, 'II', 132, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0027 | əsas: 2025 toplu, II hissə, səh.132 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0027', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın törəməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=2x^3-\cos x+7$ funksiyasının törəməsini tapın.',
  '[{"key": "A", "text": "$6x^2-\\sin x$"}, {"key": "B", "text": "$6x^2+\\sin x+7$"}, {"key": "C", "text": "$6x^2+\\sin x$"}, {"key": "D", "text": "$6x+\\sin x$"}, {"key": "E", "text": "$2x^2+\\sin x$"}]'::jsonb, 'C', NULL, NULL,
  '$(-\cos x)''=\sin x$.',
  2025, 'II', 132, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0028 | əsas: 2025 toplu, II hissə, səh.132 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0028', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın törəməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=b\sqrt{x-5}$ və $f''(9)=3$ olarsa, $b$-ni tapın.',
  '[{"key": "A", "text": "$-12$"}, {"key": "B", "text": "$12$"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$6$"}, {"key": "E", "text": "$0{,}75$"}]'::jsonb, 'B', NULL, NULL,
  '$f''(x)=\dfrac{b}{2\sqrt{x-5}}$; $f''(9)=\dfrac{b}{4}=3\Rightarrow b=12$.',
  2025, 'II', 132, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0029 | əsas: 2025 toplu, II hissə, səh.132 №27
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0029', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın törəməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=b\sqrt{x+7}$ və $f''(-3)=2$ olarsa, $b$-ni tapın.',
  '[{"key": "A", "text": "$-8$"}, {"key": "B", "text": "$1$"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$8$"}, {"key": "E", "text": "$4$"}]'::jsonb, 'D', NULL, NULL,
  '$f''(-3)=\dfrac{b}{2\sqrt4}=\dfrac b4=2\Rightarrow b=8$.',
  2025, 'II', 132, 27)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0030 | əsas: 2025 toplu, II hissə, səh.132 №34
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0030', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın törəməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=x^2\cos x$ funksiyasının törəməsini tapın.',
  '[{"key": "A", "text": "$x(2\\cos x+x\\sin x)$"}, {"key": "B", "text": "$x(\\cos x-x\\sin x)$"}, {"key": "C", "text": "$-2x\\sin x$"}, {"key": "D", "text": "$2x\\cos x-\\sin x$"}, {"key": "E", "text": "$x(2\\cos x-x\\sin x)$"}]'::jsonb, 'E', NULL, NULL,
  '$(uv)''=u''v+uv''$: $2x\cos x-x^2\sin x$.',
  2025, 'II', 132, 34)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0031 | əsas: 2025 toplu, II hissə, səh.132 №35
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0031', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın törəməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=x^4\sin x$ funksiyasının törəməsini tapın.',
  '[{"key": "A", "text": "$4x^3\\sin x+\\cos x$"}, {"key": "B", "text": "$x^3(4\\sin x-x\\cos x)$"}, {"key": "C", "text": "$x^3(4\\sin x+x\\cos x)$"}, {"key": "D", "text": "$4x^3\\cos x$"}, {"key": "E", "text": "$x^3(\\sin x+x\\cos x)$"}]'::jsonb, 'C', NULL, NULL,
  '$4x^3\sin x+x^4\cos x=x^3(4\sin x+x\cos x)$.',
  2025, 'II', 132, 35)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0032 | əsas: 2025 toplu, II hissə, səh.133 №56
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0032', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın törəməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=\dfrac{x^2+2x}{x^3}$ funksiyası üçün $f''(-1)$-i tapın.',
  '[{"key": "A", "text": "$5$"}, {"key": "B", "text": "$1$"}, {"key": "C", "text": "$-3$"}, {"key": "D", "text": "$-1$"}, {"key": "E", "text": "$3$"}]'::jsonb, 'E', NULL, NULL,
  '$f(x)=\dfrac1x+\dfrac{2}{x^2}$, $f''(x)=-\dfrac{1}{x^2}-\dfrac{4}{x^3}$. $f''(-1)=-1+4=3$.',
  2025, 'II', 133, 56)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0033 | əsas: 2025 toplu, II hissə, səh.133 №57
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0033', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın törəməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=\dfrac{3x+x^2}{x^3}$ funksiyası üçün $f''(1)$-i tapın.',
  '[{"key": "A", "text": "$7$"}, {"key": "B", "text": "$-1$"}, {"key": "C", "text": "$-7$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$-5$"}]'::jsonb, 'C', NULL, NULL,
  '$f(x)=\dfrac{3}{x^2}+\dfrac1x$, $f''(x)=-\dfrac{6}{x^3}-\dfrac{1}{x^2}$; $f''(1)=-7$.',
  2025, 'II', 133, 57)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0034 | əsas: 2025 toplu, II hissə, səh.134 №71
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0034', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın törəməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=2x^3-15x^2+36x-7$ funksiyası üçün $f''(x)=0$ tənliyinin köklərinin cəmini tapın.',
  '[{"key": "A", "text": "$5$"}, {"key": "B", "text": "$3$"}, {"key": "C", "text": "$-5$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$6$"}]'::jsonb, 'A', NULL, NULL,
  '$f''(x)=6x^2-30x+36=6(x^2-5x+6)$; köklər $2$ və $3$, cəm $5$.',
  2025, 'II', 134, 71)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0035 | əsas: 2025 toplu, II hissə, səh.134 №72
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0035', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın törəməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=x^3+3x^2-24x+5$ funksiyası üçün $f''(x)=0$ tənliyinin köklərinin hasilini tapın.',
  '[{"key": "A", "text": "$-24$"}, {"key": "B", "text": "$-8$"}, {"key": "C", "text": "$4$"}, {"key": "D", "text": "$-2$"}, {"key": "E", "text": "$8$"}]'::jsonb, 'B', NULL, NULL,
  '$f''(x)=3x^2+6x-24=3(x^2+2x-8)$; Viyet: hasil $-8$.',
  2025, 'II', 134, 72)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0036 | əsas: 2025 toplu, II hissə, səh.134 №74
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0036', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın törəməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=\sin^23x$ funksiyasının törəməsinin $x_0=\dfrac{\pi}{18}$ nöqtəsində qiymətini tapın.',
  '[{"key": "A", "text": "$-\\dfrac{3\\sqrt3}{2}$"}, {"key": "B", "text": "$\\dfrac{3\\sqrt3}{2}$"}, {"key": "C", "text": "$3\\sqrt3$"}, {"key": "D", "text": "$\\dfrac32$"}, {"key": "E", "text": "$\\dfrac{\\sqrt3}{2}$"}]'::jsonb, 'B', NULL, NULL,
  '$f''(x)=2\sin3x\cdot3\cos3x=3\sin6x$. $f''\left(\dfrac{\pi}{18}\right)=3\sin\dfrac{\pi}{3}=\dfrac{3\sqrt3}{2}$.',
  2025, 'II', 134, 74)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0037 | əsas: 2025 toplu, II hissə, səh.135 №96
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0037', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın törəməsi'), 'original', 'own', 'az', 'draft', 'written',
  '$f(x)=(\sin x+3)e^x$ funksiyasının törəməsinin $x_0=0$ nöqtəsində qiymətini hesablayın.',
  NULL, NULL, NULL, '4',
  '$f''(x)=\cos x\cdot e^x+(\sin x+3)e^x$; $f''(0)=1+3=4$.',
  2025, 'II', 135, 96)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0038 | əsas: 2025 toplu, II hissə, səh.135 №97
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0038', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın törəməsi'), 'original', 'own', 'az', 'draft', 'written',
  '$f(x)=(2\cos x+1)e^x$ funksiyasının törəməsinin $x_0=0$ nöqtəsində qiymətini hesablayın.',
  NULL, NULL, NULL, '3',
  '$f''(x)=-2\sin x\cdot e^x+(2\cos x+1)e^x$; $f''(0)=0+3=3$.',
  2025, 'II', 135, 97)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0039 | əsas: 2025 toplu, II hissə, səh.135 №108
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0039', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın törəməsi'), 'original', 'own', 'az', 'draft', 'written',
  '$f(x)=6\sqrt{2x+5}+3x$ funksiyası üçün $f''(2)$-ni tapın.',
  NULL, NULL, NULL, '5',
  '$f''(x)=\dfrac{6\cdot2}{2\sqrt{2x+5}}+3=\dfrac{6}{\sqrt{2x+5}}+3$; $f''(2)=\dfrac63+3=5$.',
  2025, 'II', 135, 108)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0040 | əsas: 2025 toplu, II hissə, səh.136 №118
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0040', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın törəməsi'), 'original', 'own', 'az', 'draft', 'matching',
  'Verilmiş funksiyaların törəmələri üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$f(x)=\\operatorname{tg}5x$"}, {"key": "2", "text": "$f(x)=\\sin5x$"}, {"key": "3", "text": "$f(x)=\\operatorname{ctg}5x$"}], "right": [{"key": "a", "text": "$f''(x)=5\\cos5x$"}, {"key": "b", "text": "$f''(x)=-\\dfrac{5}{\\cos^25x}$"}, {"key": "c", "text": "$f''(x)=\\dfrac{5}{\\cos^25x}$"}, {"key": "d", "text": "$f''(x)=\\dfrac{5}{\\sin^25x}$"}, {"key": "e", "text": "$f''(x)=-\\dfrac{5}{\\sin^25x}$"}]}'::jsonb, NULL, '{"1": ["c"], "2": ["a"], "3": ["e"]}'::jsonb, NULL,
  '$(\operatorname{tg}u)''=\dfrac{u''}{\cos^2u}$, $(\sin u)''=u''\cos u$, $(\operatorname{ctg}u)''=-\dfrac{u''}{\sin^2u}$; $u=5x$, $u''=5$.',
  2025, 'II', 136, 118)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0041 | əsas: 2025 toplu, II hissə, səh.137 №127
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0041', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın törəməsi'), 'original', 'own', 'az', 'draft', 'written',
  '$f(x)=\ln\big((a+1)x\big)-2x^2+4ax-3$ funksiyası üçün $f''\left(\dfrac12\right)=8$ olarsa, $a$ parametrinin qiymətini tapın.',
  NULL, NULL, NULL, '2',
  '$\ln\big((a+1)x\big)=\ln(a+1)+\ln x$, törəməsi $\dfrac1x$. $f''(x)=\dfrac1x-4x+4a$. $f''\left(\dfrac12\right)=2-2+4a=8\Rightarrow a=2$.',
  2025, 'II', 137, 127)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0042 | əsas: 2025 toplu, II hissə, səh.137 №128
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0042', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın törəməsi'), 'original', 'own', 'az', 'draft', 'written',
  '$f(x)=\ln\big((3a-1)x\big)+5x^2-2ax+1$ funksiyası üçün $f''\left(\dfrac15\right)=3$ olarsa, $a$ parametrinin qiymətini tapın.',
  NULL, NULL, NULL, '2',
  '$f''(x)=\dfrac1x+10x-2a$. $f''\left(\dfrac15\right)=5+2-2a=3\Rightarrow a=2$.',
  2025, 'II', 137, 128)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0043 | əsas: 2025 toplu, II hissə, səh.137 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0043', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Törəmənin həndəsi mənası. Toxunanın tənliyi'), 'original', 'own', 'az', 'draft', 'closed',
  'Absisi $x_0$ olan nöqtədə $y=5x^2-20x+3$ parabolasına çəkilən toxunan absis oxuna paraleldir. $x_0$-ı tapın.',
  '[{"key": "A", "text": "$0$"}, {"key": "B", "text": "$4$"}, {"key": "C", "text": "$5$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$-2$"}]'::jsonb, 'D', NULL, NULL,
  'Toxunan $Ox$-ə paraleldirsə, $y''(x_0)=0$: $10x_0-20=0\Rightarrow x_0=2$.',
  2025, 'II', 137, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0044 | əsas: 2025 toplu, II hissə, səh.137 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0044', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Törəmənin həndəsi mənası. Toxunanın tənliyi'), 'original', 'own', 'az', 'draft', 'closed',
  'Absisi $x_0$ olan nöqtədə $f(x)=3x^2-9x+1$ parabolasına çəkilən toxunan absis oxuna paraleldir. $x_0$-ı tapın.',
  '[{"key": "A", "text": "$-3$"}, {"key": "B", "text": "$\\dfrac{2}{3}$"}, {"key": "C", "text": "$1{,}5$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$0$"}]'::jsonb, 'C', NULL, NULL,
  '$6x_0-9=0\Rightarrow x_0=\dfrac32$.',
  2025, 'II', 137, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0045 | əsas: 2025 toplu, II hissə, səh.138 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0045', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Törəmənin həndəsi mənası. Toxunanın tənliyi'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=x^3-8$ funksiyasının qrafikinə absis oxu ilə kəsişmə nöqtəsində çəkilən toxunanın tənliyini yazın.',
  '[{"key": "A", "text": "$y=12x-8$"}, {"key": "B", "text": "$y=12x-24$"}, {"key": "C", "text": "$y=3x-6$"}, {"key": "D", "text": "$y=4x-8$"}, {"key": "E", "text": "$y=12x+24$"}]'::jsonb, 'B', NULL, NULL,
  '$x^3=8\Rightarrow x_0=2$, $f''(x)=3x^2$, $f''(2)=12$. $y=12(x-2)=12x-24$.',
  2025, 'II', 138, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0046 | əsas: 2025 toplu, II hissə, səh.138 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0046', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Törəmənin həndəsi mənası. Toxunanın tənliyi'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=\dfrac13x^3-\dfrac32x^2-4x+2$ funksiyasının qrafikinə çəkilmiş toxunanların $Ox$ oxuna paralel olduğu toxunma nöqtələrinin absisləri cəmini tapın.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$-4$"}, {"key": "C", "text": "$1$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$-3$"}]'::jsonb, 'D', NULL, NULL,
  '$f''(x)=x^2-3x-4=0$; Viyet: $x_1+x_2=3$ (kökləri $4$ və $-1$).',
  2025, 'II', 138, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0047 | əsas: 2025 toplu, II hissə, səh.138 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0047', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Törəmənin həndəsi mənası. Toxunanın tənliyi'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=x^4-4x$ funksiyasının qrafikinə çəkilmiş toxunan $Ox$ oxuna paralel olarsa, toxunma nöqtəsinin absisini tapın.',
  '[{"key": "A", "text": "$1$"}, {"key": "B", "text": "$0$"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$-1$"}]'::jsonb, 'A', NULL, NULL,
  '$4x^3-4=0\Rightarrow x=1$.',
  2025, 'II', 138, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0048 | əsas: 2025 toplu, II hissə, səh.138 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0048', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Törəmənin həndəsi mənası. Toxunanın tənliyi'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=-x+3+4\ln(x+1)$ funksiyasının qrafikinə toxunan düz xətt absis oxuna paraleldir. Toxunma nöqtəsinin absisini tapın.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$0$"}, {"key": "C", "text": "$-1$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$3$"}]'::jsonb, 'E', NULL, NULL,
  '$f''(x)=-1+\dfrac{4}{x+1}=0\Rightarrow x+1=4\Rightarrow x=3$.',
  2025, 'II', 138, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0049 | əsas: 2025 toplu, II hissə, səh.138 №18
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0049', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Törəmənin həndəsi mənası. Toxunanın tənliyi'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=x+2-3\ln(x+4)$ funksiyasının qrafikinə toxunan düz xətt absis oxuna paraleldir. Toxunma nöqtəsinin absisini tapın.',
  '[{"key": "A", "text": "$1$"}, {"key": "B", "text": "$3$"}, {"key": "C", "text": "$0$"}, {"key": "D", "text": "$-1$"}, {"key": "E", "text": "$-4$"}]'::jsonb, 'D', NULL, NULL,
  '$f''(x)=1-\dfrac{3}{x+4}=0\Rightarrow x+4=3\Rightarrow x=-1$.',
  2025, 'II', 138, 18)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0050 | əsas: 2025 toplu, II hissə, səh.138 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0050', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Törəmənin həndəsi mənası. Toxunanın tənliyi'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=x^2-\sqrt3x$ funksiyasının qrafikinə çəkilmiş toxunanın absis oxunun müsbət istiqaməti ilə əmələ gətirdiyi $\alpha$ bucağının kosinusu $\dfrac12$-yə bərabərdir. Toxunma nöqtəsinin absisini tapın $\left(0<\alpha<\dfrac{\pi}{2}\right)$.',
  '[{"key": "A", "text": "$1$"}, {"key": "B", "text": "$\\dfrac{\\sqrt3}{2}$"}, {"key": "C", "text": "$\\sqrt3$"}, {"key": "D", "text": "$0$"}, {"key": "E", "text": "$2\\sqrt3$"}]'::jsonb, 'C', NULL, NULL,
  '$\cos\alpha=\dfrac12\Rightarrow\alpha=60^\circ$, $\operatorname{tg}\alpha=\sqrt3$. $y''=2x-\sqrt3=\sqrt3\Rightarrow x=\sqrt3$.',
  2025, 'II', 138, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0051 | əsas: 2025 toplu, II hissə, səh.138 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0051', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Törəmənin həndəsi mənası. Toxunanın tənliyi'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=x^2+x$ funksiyasının qrafikinə çəkilmiş toxunanın absis oxunun müsbət istiqaməti ilə əmələ gətirdiyi $\alpha$ bucağının kosinusu $\dfrac{\sqrt2}{2}$-yə bərabərdir. Toxunma nöqtəsinin absisini tapın $\left(0<\alpha<\dfrac{\pi}{2}\right)$.',
  '[{"key": "A", "text": "$-1$"}, {"key": "B", "text": "$0$"}, {"key": "C", "text": "$1$"}, {"key": "D", "text": "$0{,}5$"}, {"key": "E", "text": "$-0{,}5$"}]'::jsonb, 'B', NULL, NULL,
  '$\alpha=45^\circ$, $\operatorname{tg}\alpha=1$. $2x+1=1\Rightarrow x=0$.',
  2025, 'II', 138, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0052 | əsas: 2025 toplu, II hissə, səh.140 №42
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0052', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Törəmənin həndəsi mənası. Toxunanın tənliyi'), 'original', 'own', 'az', 'draft', 'written',
  '$a$ parametrinin hansı qiymətində $y=x\ln5+3a$ düz xətti $y=5^x+8$ funksiyasının qrafikinə toxunur?',
  NULL, NULL, NULL, '3',
  'Toxunma nöqtəsində törəmələr bərabərdir: $5^x\ln5=\ln5\Rightarrow x=0$. Nöqtə $(0;\ 9)$ düz xətt üzərindədir: $3a=9\Rightarrow a=3$.',
  2025, 'II', 140, 42)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0053 | əsas: 2025 toplu, II hissə, səh.140 №43
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0053', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Törəmənin həndəsi mənası. Toxunanın tənliyi'), 'original', 'own', 'az', 'draft', 'written',
  '$a$-nın hansı qiymətində $y=x\ln2-4a$ düz xətti $y=2^x-9$ funksiyasının qrafikinə toxunur?',
  NULL, NULL, NULL, '2',
  '$2^x\ln2=\ln2\Rightarrow x=0$; nöqtə $(0;\ -8)$: $-4a=-8\Rightarrow a=2$.',
  2025, 'II', 140, 43)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0054 | əsas: 2025 toplu, II hissə, səh.141 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0054', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın böhran nöqtəsi. Artma və azalma aralıqları, ekstremum nöqtələri, ən böyük və ən kiçik qiymətlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=x^2+10x$ funksiyasının ən kiçik qiymətini tapın.',
  '[{"key": "A", "text": "$25$"}, {"key": "B", "text": "$-25$"}, {"key": "C", "text": "$5$"}, {"key": "D", "text": "$0$"}, {"key": "E", "text": "$-5$"}]'::jsonb, 'B', NULL, NULL,
  '$y''=2x+10=0\Rightarrow x=-5$; $y(-5)=25-50=-25$.',
  2025, 'II', 141, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0055 | əsas: 2025 toplu, II hissə, səh.141 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0055', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın böhran nöqtəsi. Artma və azalma aralıqları, ekstremum nöqtələri, ən böyük və ən kiçik qiymətlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=x^2-8x$ funksiyasının ən kiçik qiymətini tapın.',
  '[{"key": "A", "text": "$-4$"}, {"key": "B", "text": "$-16$"}, {"key": "C", "text": "$16$"}, {"key": "D", "text": "$0$"}, {"key": "E", "text": "$4$"}]'::jsonb, 'B', NULL, NULL,
  '$y''=2x-8=0\Rightarrow x=4$; $y(4)=-16$.',
  2025, 'II', 141, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0056 | əsas: 2025 toplu, II hissə, səh.141 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0056', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın böhran nöqtəsi. Artma və azalma aralıqları, ekstremum nöqtələri, ən böyük və ən kiçik qiymətlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=x^3-12x$ funksiyasının böhran nöqtələrini tapın.',
  '[{"key": "A", "text": "$\\pm4$"}, {"key": "B", "text": "$\\pm2\\sqrt3$"}, {"key": "C", "text": "$\\pm\\sqrt{12}$"}, {"key": "D", "text": "$\\pm2$"}, {"key": "E", "text": "$\\pm6$"}]'::jsonb, 'D', NULL, NULL,
  '$f''(x)=3x^2-12=0\Rightarrow x=\pm2$.',
  2025, 'II', 141, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0057 | əsas: 2025 toplu, II hissə, səh.141 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0057', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın böhran nöqtəsi. Artma və azalma aralıqları, ekstremum nöqtələri, ən böyük və ən kiçik qiymətlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=x^2-6x$ funksiyasının böhran nöqtəsini tapın.',
  '[{"key": "A", "text": "$3$"}, {"key": "B", "text": "$-6$"}, {"key": "C", "text": "$6$"}, {"key": "D", "text": "$-3$"}, {"key": "E", "text": "$0$"}]'::jsonb, 'A', NULL, NULL,
  '$f''(x)=2x-6=0\Rightarrow x=3$.',
  2025, 'II', 141, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0058 | əsas: 2025 toplu, II hissə, səh.142 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0058', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın böhran nöqtəsi. Artma və azalma aralıqları, ekstremum nöqtələri, ən böyük və ən kiçik qiymətlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=\dfrac18x^2-\dfrac12x+9$ funksiyasının böhran nöqtəsini tapın.',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "$0{,}5$"}, {"key": "C", "text": "$4$"}, {"key": "D", "text": "$8$"}, {"key": "E", "text": "$0{,}25$"}]'::jsonb, 'A', NULL, NULL,
  '$f''(x)=\dfrac14x-\dfrac12=0\Rightarrow x=2$.',
  2025, 'II', 142, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0059 | əsas: 2025 toplu, II hissə, səh.142 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0059', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın böhran nöqtəsi. Artma və azalma aralıqları, ekstremum nöqtələri, ən böyük və ən kiçik qiymətlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=\dfrac15x^2-\dfrac13x+7$ funksiyasının böhran nöqtəsini tapın.',
  '[{"key": "A", "text": "$5$"}, {"key": "B", "text": "$1{,}2$"}, {"key": "C", "text": "$\\dfrac{1}{3}$"}, {"key": "D", "text": "$\\dfrac{5}{3}$"}, {"key": "E", "text": "$\\dfrac{5}{6}$"}]'::jsonb, 'E', NULL, NULL,
  '$f''(x)=\dfrac25x-\dfrac13=0\Rightarrow x=\dfrac{5}{6}$.',
  2025, 'II', 142, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0060 | əsas: 2025 toplu, II hissə, səh.142 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0060', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın böhran nöqtəsi. Artma və azalma aralıqları, ekstremum nöqtələri, ən böyük və ən kiçik qiymətlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=e^{x(2x-7)}$ funksiyasının böhran nöqtəsini tapın.',
  '[{"key": "A", "text": "$0$"}, {"key": "B", "text": "$\\dfrac{4}{7}$"}, {"key": "C", "text": "$1{,}75$"}, {"key": "D", "text": "$3{,}5$"}, {"key": "E", "text": "$2$"}]'::jsonb, 'C', NULL, NULL,
  '$f''(x)=(4x-7)e^{x(2x-7)}=0\Rightarrow x=\dfrac74$ ($e^t>0$).',
  2025, 'II', 142, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0061 | əsas: 2025 toplu, II hissə, səh.142 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0061', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın böhran nöqtəsi. Artma və azalma aralıqları, ekstremum nöqtələri, ən böyük və ən kiçik qiymətlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=x^3\ln x$ funksiyasının böhran nöqtəsini tapın.',
  '[{"key": "A", "text": "$\\sqrt[3]e$"}, {"key": "B", "text": "$\\dfrac1e$"}, {"key": "C", "text": "$\\dfrac{1}{\\sqrt[3]e}$"}, {"key": "D", "text": "$e$"}, {"key": "E", "text": "$\\dfrac{1}{\\sqrt e}$"}]'::jsonb, 'C', NULL, NULL,
  'Təyin oblastı $x>0$. $f''(x)=3x^2\ln x+x^2=x^2(3\ln x+1)=0\Rightarrow\ln x=-\dfrac13\Rightarrow x=e^{-\frac13}$.',
  2025, 'II', 142, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0062 | əsas: 2025 toplu, II hissə, səh.144 №45
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0062', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın böhran nöqtəsi. Artma və azalma aralıqları, ekstremum nöqtələri, ən böyük və ən kiçik qiymətlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=\sqrt{x^2-6x+25}$ funksiyasının $[-1;\ 5]$ parçasında ən böyük qiymətini tapın.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$2\\sqrt5$"}, {"key": "C", "text": "$\\sqrt{20}+1$"}, {"key": "D", "text": "$4\\sqrt2$"}, {"key": "E", "text": "$5$"}]'::jsonb, 'D', NULL, NULL,
  '$x^2-6x+25=(x-3)^2+16$; parçada ən uzaq nöqtə $x=-1$: $\sqrt{16+16}=4\sqrt2$ ($x=5$-də $\sqrt{20}$, $x=3$-də $4$).',
  2025, 'II', 144, 45)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0063 | əsas: 2025 toplu, II hissə, səh.144 №46
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0063', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın böhran nöqtəsi. Artma və azalma aralıqları, ekstremum nöqtələri, ən böyük və ən kiçik qiymətlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=\sqrt{x^2-4x+13}$ funksiyasının $[-2;\ 3]$ parçasında ən böyük qiymətini tapın.',
  '[{"key": "A", "text": "$\\sqrt{29}$"}, {"key": "B", "text": "$\\sqrt{13}$"}, {"key": "C", "text": "$\\sqrt{10}$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$5$"}]'::jsonb, 'E', NULL, NULL,
  '$(x-2)^2+9$: $x=-2$-də $\sqrt{16+9}=5$, $x=3$-də $\sqrt{10}$, $x=2$-də $3$. Ən böyük $5$.',
  2025, 'II', 144, 46)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0064 | əsas: 2025 toplu, II hissə, səh.145 №60
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0064', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın böhran nöqtəsi. Artma və azalma aralıqları, ekstremum nöqtələri, ən böyük və ən kiçik qiymətlər'), 'original', 'own', 'az', 'draft', 'written',
  '$y=6x^2-x^3+5$ funksiyasının $[0;\ 6]$ parçasında ən böyük qiymətini tapın.',
  NULL, NULL, NULL, '37',
  '$y''=12x-3x^2=3x(4-x)$; böhran nöqtələri $0$ və $4$. $y(0)=5$, $y(4)=96-64+5=37$, $y(6)=216-216+5=5$. Ən böyük $37$.',
  2025, 'II', 145, 60)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0065 | əsas: 2025 toplu, II hissə, səh.145 №61
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0065', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın böhran nöqtəsi. Artma və azalma aralıqları, ekstremum nöqtələri, ən böyük və ən kiçik qiymətlər'), 'original', 'own', 'az', 'draft', 'written',
  '$y=6x^2-x^3+2$ funksiyasının $[-1;\ 1]$ parçasında ən kiçik qiymətini tapın.',
  NULL, NULL, NULL, '2',
  'Böhran nöqtəsi $x=0$ ($x=4$ parçadan kənardadır). $y(-1)=6+1+2=9$, $y(0)=2$, $y(1)=7$. Ən kiçik $2$.',
  2025, 'II', 145, 61)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0066 | əsas: 2025 toplu, II hissə, səh.145 №67
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0066', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın böhran nöqtəsi. Artma və azalma aralıqları, ekstremum nöqtələri, ən böyük və ən kiçik qiymətlər'), 'original', 'own', 'az', 'draft', 'written',
  '$y=\dfrac{20x}{x^2+25}$ funksiyasının ən böyük qiymətini tapın.',
  NULL, NULL, NULL, '2',
  '$y''=\dfrac{20(25-x^2)}{(x^2+25)^2}=0\Rightarrow x=\pm5$; $y(5)=\dfrac{100}{50}=2$ — ən böyük qiymət.',
  2025, 'II', 145, 67)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0067 | əsas: 2025 toplu, II hissə, səh.145 №68
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0067', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Funksiyanın böhran nöqtəsi. Artma və azalma aralıqları, ekstremum nöqtələri, ən böyük və ən kiçik qiymətlər'), 'original', 'own', 'az', 'draft', 'written',
  '$y=\dfrac{18x}{x^2+9}$ funksiyasının ən böyük qiymətini tapın.',
  NULL, NULL, NULL, '3',
  '$x=3$-də: $\dfrac{54}{18}=3$.',
  2025, 'II', 145, 68)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0068 | əsas: 2025 toplu, II hissə, səh.149 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0068', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='İbtidai funksiya. Qeyri-müəyyən inteqral'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=6x^5-4$ funksiyasının ibtidai funksiyalarının ümumi şəklini tapın.',
  '[{"key": "A", "text": "$x^6-4x+C$"}, {"key": "B", "text": "$6x^6-4x+C$"}, {"key": "C", "text": "$x^6+4x+C$"}, {"key": "D", "text": "$30x^4+C$"}, {"key": "E", "text": "$x^6-4+C$"}]'::jsonb, 'A', NULL, NULL,
  '$\int x^5dx=\dfrac{x^6}{6}$: $6\cdot\dfrac{x^6}{6}-4x=x^6-4x$.',
  2025, 'II', 149, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0069 | əsas: 2025 toplu, II hissə, səh.150 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0069', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='İbtidai funksiya. Qeyri-müəyyən inteqral'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=-\dfrac{2}{x^3}+4x-5$ funksiyasının ibtidai funksiyalarının ümumi şəklini tapın.',
  '[{"key": "A", "text": "$F(x)=\\dfrac{1}{x^2}+2x^2-5x+C$"}, {"key": "B", "text": "$F(x)=\\dfrac{2}{x^2}+2x^2-5x+C$"}, {"key": "C", "text": "$F(x)=-\\dfrac{1}{x^2}+2x^2-5x+C$"}, {"key": "D", "text": "$F(x)=\\dfrac{1}{x^2}+4x^2-5x+C$"}, {"key": "E", "text": "$F(x)=\\dfrac{6}{x^4}+2x^2-5x+C$"}]'::jsonb, 'A', NULL, NULL,
  '$\int-2x^{-3}dx=-2\cdot\dfrac{x^{-2}}{-2}=x^{-2}$; $\int4x\,dx=2x^2$.',
  2025, 'II', 150, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0070 | əsas: 2025 toplu, II hissə, səh.150 №35
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0070', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='İbtidai funksiya. Qeyri-müəyyən inteqral'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=\dfrac{5}{2x+3}$ funksiyasının ibtidai funksiyalarının ümumi şəklini tapın.',
  '[{"key": "A", "text": "$\\dfrac25\\ln|2x+3|+C$"}, {"key": "B", "text": "$\\dfrac52\\ln|2x+3|+C$"}, {"key": "C", "text": "$10\\ln|2x+3|+C$"}, {"key": "D", "text": "$\\dfrac12\\ln|2x+3|+C$"}, {"key": "E", "text": "$5\\ln|2x+3|+C$"}]'::jsonb, 'B', NULL, NULL,
  '$\int\dfrac{dx}{kx+b}=\dfrac1k\ln|kx+b|$: $\dfrac52\ln|2x+3|+C$.',
  2025, 'II', 150, 35)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0071 | əsas: 2025 toplu, II hissə, səh.150 №36
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0071', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='İbtidai funksiya. Qeyri-müəyyən inteqral'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=\dfrac{4}{3x-1}$ funksiyasının ibtidai funksiyalarının ümumi şəklini tapın.',
  '[{"key": "A", "text": "$\\dfrac34\\ln|3x-1|+C$"}, {"key": "B", "text": "$12\\ln|3x-1|+C$"}, {"key": "C", "text": "$\\dfrac13\\ln|3x-1|+C$"}, {"key": "D", "text": "$4\\ln|3x-1|+C$"}, {"key": "E", "text": "$\\dfrac43\\ln|3x-1|+C$"}]'::jsonb, 'E', NULL, NULL,
  '$\dfrac43\ln|3x-1|+C$.',
  2025, 'II', 150, 36)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0072 | əsas: 2025 toplu, II hissə, səh.151 №42
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0072', '/images/tasks/LTI-0072.png', 'Absis oxunu −2-də, ordinat oxunu 2-də kəsən düz xətt', (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='İbtidai funksiya. Qeyri-müəyyən inteqral'), 'original', 'own', 'az', 'draft', 'closed',
  'Şəkildə qrafiki təsvir olunmuş $y=f(x)$ funksiyasının $F(x)$ ibtidai funksiyasının ümumi şəkli hansıdır?',
  '[{"key": "A", "text": "$F(x)=-\\dfrac{x^2}{2}+2x+C$"}, {"key": "B", "text": "$F(x)=\\dfrac{x^2}{2}+2x+C$"}, {"key": "C", "text": "$F(x)=\\dfrac{x^2}{2}+x+C$"}, {"key": "D", "text": "$F(x)=x^2+2x+C$"}, {"key": "E", "text": "$F(x)=\\dfrac{x^2}{2}-2x+C$"}]'::jsonb, 'B', NULL, NULL,
  'Qrafik $(-2;\ 0)$ və $(0;\ 2)$ nöqtələrindən keçir: $f(x)=x+2$. $F(x)=\dfrac{x^2}{2}+2x+C$.',
  2025, 'II', 151, 42)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0073 | əsas: 2025 toplu, II hissə, səh.151 №43
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0073', '/images/tasks/LTI-0073.png', 'Ordinat oxunu 2-də, absis oxunu 2-də kəsən azalan düz xətt', (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='İbtidai funksiya. Qeyri-müəyyən inteqral'), 'original', 'own', 'az', 'draft', 'closed',
  'Qrafiki təsvir olunmuş $y=f(x)$ funksiyasının $F(x)$ ibtidai funksiyalarının ümumi şəkli hansıdır?',
  '[{"key": "A", "text": "$F(x)=\\dfrac{x^2}{2}+2x+C$"}, {"key": "B", "text": "$F(x)=\\dfrac{x^2}{2}-2x+C$"}, {"key": "C", "text": "$F(x)=-\\dfrac{x^2}{2}-2x+C$"}, {"key": "D", "text": "$F(x)=-\\dfrac{x^2}{2}+2x+C$"}, {"key": "E", "text": "$F(x)=-x^2+2x+C$"}]'::jsonb, 'D', NULL, NULL,
  'Qrafik $(0;\ 2)$ və $(2;\ 0)$ nöqtələrindən keçir: $f(x)=-x+2$. $F(x)=-\dfrac{x^2}{2}+2x+C$.',
  2025, 'II', 151, 43)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0074 | əsas: 2025 toplu, II hissə, səh.152 №50
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0074', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='İbtidai funksiya. Qeyri-müəyyən inteqral'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=4x^3-3e^x$ funksiyasının $F(0)=0$ şərtini ödəyən ibtidai funksiyasını tapın.',
  '[{"key": "A", "text": "$F(x)=x^4-3e^x-3$"}, {"key": "B", "text": "$F(x)=x^4-3e^x+3$"}, {"key": "C", "text": "$F(x)=12x^2-3e^x+3$"}, {"key": "D", "text": "$F(x)=x^4-3e^x$"}, {"key": "E", "text": "$F(x)=x^4-3e^x+1$"}]'::jsonb, 'B', NULL, NULL,
  '$F(x)=x^4-3e^x+C$; $F(0)=-3+C=0\Rightarrow C=3$.',
  2025, 'II', 152, 50)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0075 | əsas: 2025 toplu, II hissə, səh.152 №51
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0075', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='İbtidai funksiya. Qeyri-müəyyən inteqral'), 'original', 'own', 'az', 'draft', 'closed',
  '$f(x)=2e^x-3x^2$ funksiyasının $F(0)=5$ şərtini ödəyən ibtidai funksiyasını tapın.',
  '[{"key": "A", "text": "$F(x)=2e^x-x^3-3$"}, {"key": "B", "text": "$F(x)=2e^x-x^3+7$"}, {"key": "C", "text": "$F(x)=2e^x-x^3+5$"}, {"key": "D", "text": "$F(x)=2e^x-x^3+3$"}, {"key": "E", "text": "$F(x)=e^x-x^3+4$"}]'::jsonb, 'D', NULL, NULL,
  '$F(x)=2e^x-x^3+C$; $F(0)=2+C=5\Rightarrow C=3$.',
  2025, 'II', 152, 51)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0076 | əsas: 2025 toplu, II hissə, səh.152 №54
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0076', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='İbtidai funksiya. Qeyri-müəyyən inteqral'), 'original', 'own', 'az', 'draft', 'closed',
  '$\displaystyle\int\dfrac{x^2-16}{2x-8}\,dx$-i tapın.',
  '[{"key": "A", "text": "$\\dfrac12x^2+4x+C$"}, {"key": "B", "text": "$\\dfrac12x^2+2x+C$"}, {"key": "C", "text": "$\\dfrac14x^2+2x+C$"}, {"key": "D", "text": "$\\dfrac14x^2-2x+C$"}, {"key": "E", "text": "$\\dfrac14x^2+x+C$"}]'::jsonb, 'C', NULL, NULL,
  '$\dfrac{(x-4)(x+4)}{2(x-4)}=\dfrac{x+4}{2}$; $\int\dfrac{x+4}{2}dx=\dfrac{x^2}{4}+2x+C$.',
  2025, 'II', 152, 54)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0077 | əsas: 2025 toplu, II hissə, səh.152 №55
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0077', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='İbtidai funksiya. Qeyri-müəyyən inteqral'), 'original', 'own', 'az', 'draft', 'closed',
  '$\displaystyle\int\dfrac{x^2-25}{3x+15}\,dx$-i tapın.',
  '[{"key": "A", "text": "$\\dfrac16x^2+\\dfrac53x+C$"}, {"key": "B", "text": "$\\dfrac13x^2-5x+C$"}, {"key": "C", "text": "$\\dfrac16x^2-5x+C$"}, {"key": "D", "text": "$\\dfrac13x^2-\\dfrac53x+C$"}, {"key": "E", "text": "$\\dfrac16x^2-\\dfrac53x+C$"}]'::jsonb, 'E', NULL, NULL,
  '$\dfrac{(x-5)(x+5)}{3(x+5)}=\dfrac{x-5}{3}$; ibtidai $\dfrac{x^2}{6}-\dfrac53x+C$.',
  2025, 'II', 152, 55)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0078 | əsas: 2025 toplu, II hissə, səh.153 №60
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0078', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='İbtidai funksiya. Qeyri-müəyyən inteqral'), 'original', 'own', 'az', 'draft', 'closed',
  '$\displaystyle\int\dfrac{6}{1-\cos x}\,dx$-in inteqralını tapın.',
  '[{"key": "A", "text": "$6\\operatorname{ctg}\\dfrac x2+C$"}, {"key": "B", "text": "$-6\\operatorname{ctg}\\dfrac x2+C$"}, {"key": "C", "text": "$-12\\operatorname{ctg}\\dfrac x2+C$"}, {"key": "D", "text": "$6\\operatorname{tg}\\dfrac x2+C$"}, {"key": "E", "text": "$-3\\operatorname{ctg}\\dfrac x2+C$"}]'::jsonb, 'B', NULL, NULL,
  '$1-\cos x=2\sin^2\dfrac x2$: $\int\dfrac{3}{\sin^2\frac x2}dx=-6\operatorname{ctg}\dfrac x2+C$.',
  2025, 'II', 153, 60)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0079 | əsas: 2025 toplu, II hissə, səh.153 №62
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0079', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='İbtidai funksiya. Qeyri-müəyyən inteqral'), 'original', 'own', 'az', 'draft', 'written',
  '$f(x)=4x^3+2x$ funksiyasının, qrafiki $A(1;\ 15)$ nöqtəsindən keçən $F(x)$ ibtidai funksiyası üçün $F(-2)$-ni tapın.',
  NULL, NULL, NULL, '33',
  '$F(x)=x^4+x^2+C$; $F(1)=2+C=15\Rightarrow C=13$. $F(-2)=16+4+13=33$.',
  2025, 'II', 153, 62)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0080 | əsas: 2025 toplu, II hissə, səh.153 №63
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0080', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='İbtidai funksiya. Qeyri-müəyyən inteqral'), 'original', 'own', 'az', 'draft', 'written',
  '$f(x)=3x^2+4x$ funksiyasının, qrafiki $A(1;\ 50)$ nöqtəsindən keçən $F(x)$ ibtidai funksiyası üçün $F(-1)$-i tapın.',
  NULL, NULL, NULL, '48',
  '$F(x)=x^3+2x^2+C$; $F(1)=3+C=50\Rightarrow C=47$. $F(-1)=-1+2+47=48$.',
  2025, 'II', 153, 63)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0081 | əsas: 2025 toplu, II hissə, səh.153 №64
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0081', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='İbtidai funksiya. Qeyri-müəyyən inteqral'), 'original', 'own', 'az', 'draft', 'written',
  '$f(x)=6x^2+2x$ funksiyasının, qrafiki $A(1;\ 40)$ nöqtəsindən keçən $F(x)$ ibtidai funksiyası üçün $F(-1)$-i tapın.',
  NULL, NULL, NULL, '36',
  '$F(x)=2x^3+x^2+C$; $F(1)=3+C=40\Rightarrow C=37$. $F(-1)=-2+1+37=36$.',
  2025, 'II', 153, 64)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0082 | əsas: 2025 toplu, II hissə, səh.153 №65
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0082', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='İbtidai funksiya. Qeyri-müəyyən inteqral'), 'original', 'own', 'az', 'draft', 'written',
  '$f(x)=4x^3+4x$ funksiyasının, qrafiki $A(1;\ 20)$ nöqtəsindən keçən $F(x)$ ibtidai funksiyası üçün $F(-2)$-ni hesablayın.',
  NULL, NULL, NULL, '41',
  '$F(x)=x^4+2x^2+C$; $F(1)=3+C=20\Rightarrow C=17$. $F(-2)=16+8+17=41$.',
  2025, 'II', 153, 65)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0083 | əsas: 2025 toplu, II hissə, səh.153 №66
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0083', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='İbtidai funksiya. Qeyri-müəyyən inteqral'), 'original', 'own', 'az', 'draft', 'matching',
  'Qeyri-müəyyən inteqrallar üçün uyğunluğu müəyyən edin (burada $F(x)$ — ibtidai funksiya, $C$ isə sabitdir).',
  '{"left": [{"key": "1", "text": "$\\displaystyle\\int\\sin x\\,dx=F(x)+C$"}, {"key": "2", "text": "$\\displaystyle\\int\\dfrac{1}{\\cos^2x}dx=F(x)+C$"}, {"key": "3", "text": "$\\displaystyle\\int2^xdx=F(x)+C$"}], "right": [{"key": "a", "text": "$F(x)=-\\cos x$"}, {"key": "b", "text": "$F(x)=\\operatorname{tg}x$"}, {"key": "c", "text": "$F(x)=\\dfrac{2^x}{\\ln2}$"}, {"key": "d", "text": "$F(x)=-\\operatorname{ctg}x$"}, {"key": "e", "text": "$F(x)=2^x$"}]}'::jsonb, NULL, '{"1": ["a"], "2": ["b"], "3": ["c"]}'::jsonb, NULL,
  '$(-\cos x)''=\sin x$; $(\operatorname{tg}x)''=\dfrac{1}{\cos^2x}$; $\left(\dfrac{2^x}{\ln2}\right)''=2^x$.',
  2025, 'II', 153, 66)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0084 | əsas: 2025 toplu, II hissə, səh.153 №67
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0084', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='İbtidai funksiya. Qeyri-müəyyən inteqral'), 'original', 'own', 'az', 'draft', 'matching',
  'Qeyri-müəyyən inteqrallar üçün uyğunluğu müəyyən edin (burada $F(x)$ — ibtidai funksiya, $C$ isə sabitdir).',
  '{"left": [{"key": "1", "text": "$\\displaystyle\\int\\dfrac{1}{x\\ln3}dx=F(x)+C$"}, {"key": "2", "text": "$\\displaystyle\\int\\cos x\\,dx=F(x)+C$"}, {"key": "3", "text": "$\\displaystyle\\int\\dfrac{1}{\\sin^2x}dx=F(x)+C$"}], "right": [{"key": "a", "text": "$F(x)=\\operatorname{tg}x$"}, {"key": "b", "text": "$F(x)=3^x$"}, {"key": "c", "text": "$F(x)=\\sin x$"}, {"key": "d", "text": "$F(x)=-\\operatorname{ctg}x$"}, {"key": "e", "text": "$F(x)=\\log_3|x|$"}]}'::jsonb, NULL, '{"1": ["e"], "2": ["c"], "3": ["d"]}'::jsonb, NULL,
  '$(\log_3|x|)''=\dfrac{1}{x\ln3}$; $(\sin x)''=\cos x$; $(-\operatorname{ctg}x)''=\dfrac{1}{\sin^2x}$.',
  2025, 'II', 153, 67)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0085 | əsas: 2025 toplu, II hissə, səh.154 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0085', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Müəyyən inteqral. Nyuton-Leybnis düsturu'), 'original', 'own', 'az', 'draft', 'closed',
  '$\displaystyle\int\limits_{-1}^{1}(3x-1)^3dx$ inteqralını hesablayın.',
  '[{"key": "A", "text": "$10$"}, {"key": "B", "text": "$-10$"}, {"key": "C", "text": "$20$"}, {"key": "D", "text": "$0$"}, {"key": "E", "text": "$-20$"}]'::jsonb, 'E', NULL, NULL,
  '$\dfrac{(3x-1)^4}{12}\Big|_{-1}^{1}=\dfrac{16-256}{12}=-20$.',
  2025, 'II', 154, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0086 | əsas: 2025 toplu, II hissə, səh.154 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0086', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Müəyyən inteqral. Nyuton-Leybnis düsturu'), 'original', 'own', 'az', 'draft', 'closed',
  '$\displaystyle\int\limits_{0}^{1}(2x-1)^2dx$ inteqralını hesablayın.',
  '[{"key": "A", "text": "$\\dfrac{2}{3}$"}, {"key": "B", "text": "$0$"}, {"key": "C", "text": "$1$"}, {"key": "D", "text": "$\\dfrac{1}{6}$"}, {"key": "E", "text": "$\\dfrac{1}{3}$"}]'::jsonb, 'E', NULL, NULL,
  '$\dfrac{(2x-1)^3}{6}\Big|_0^1=\dfrac{1-(-1)}{6}=\dfrac13$.',
  2025, 'II', 154, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0087 | əsas: 2025 toplu, II hissə, səh.156 №30
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0087', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Müəyyən inteqral. Nyuton-Leybnis düsturu'), 'original', 'own', 'az', 'draft', 'closed',
  '$\displaystyle\int\limits_{-\frac14}^{\frac14}e^{8x}dx$ inteqralını hesablayın.',
  '[{"key": "A", "text": "$e^2-e^{-2}$"}, {"key": "B", "text": "$\\dfrac18\\left(e^2+e^{-2}\\right)$"}, {"key": "C", "text": "$\\dfrac18\\left(e^8-e^{-8}\\right)$"}, {"key": "D", "text": "$\\dfrac18\\left(e^2-e^{-2}\\right)$"}, {"key": "E", "text": "$\\dfrac14\\left(e^2-e^{-2}\\right)$"}]'::jsonb, 'D', NULL, NULL,
  '$\dfrac{e^{8x}}{8}\Big|_{-1/4}^{1/4}=\dfrac18\left(e^2-e^{-2}\right)$.',
  2025, 'II', 156, 30)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0088 | əsas: 2025 toplu, II hissə, səh.156 №31
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0088', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Müəyyən inteqral. Nyuton-Leybnis düsturu'), 'original', 'own', 'az', 'draft', 'closed',
  '$\displaystyle\int\limits_{-\frac12}^{\frac12}e^{2x}dx$ inteqralını hesablayın.',
  '[{"key": "A", "text": "$\\dfrac14\\left(e-e^{-1}\\right)$"}, {"key": "B", "text": "$e-e^{-1}$"}, {"key": "C", "text": "$\\dfrac12\\left(e+e^{-1}\\right)$"}, {"key": "D", "text": "$2\\left(e-e^{-1}\\right)$"}, {"key": "E", "text": "$\\dfrac12\\left(e-e^{-1}\\right)$"}]'::jsonb, 'E', NULL, NULL,
  '$\dfrac{e^{2x}}{2}\Big|_{-1/2}^{1/2}=\dfrac12\left(e-e^{-1}\right)$.',
  2025, 'II', 156, 31)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0089 | əsas: 2025 toplu, II hissə, səh.156 №43
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0089', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Müəyyən inteqral. Nyuton-Leybnis düsturu'), 'original', 'own', 'az', 'draft', 'closed',
  '$\displaystyle\int\limits_0^{\pi}\sin4x\cdot\cos3x\,dx+\int\limits_0^{\pi}\cos4x\cdot\sin3x\,dx$ inteqralını hesablayın.',
  '[{"key": "A", "text": "$\\dfrac{2}{7}$"}, {"key": "B", "text": "$\\dfrac{1}{7}$"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$\\dfrac{4}{7}$"}, {"key": "E", "text": "$0$"}]'::jsonb, 'A', NULL, NULL,
  'İnteqrallar cəmi $\displaystyle\int_0^\pi\sin7x\,dx=-\dfrac{\cos7x}{7}\Big|_0^\pi=\dfrac{1+1}{7}=\dfrac27$.',
  2025, 'II', 156, 43)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0090 | əsas: 2025 toplu, II hissə, səh.156 №44
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0090', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Müəyyən inteqral. Nyuton-Leybnis düsturu'), 'original', 'own', 'az', 'draft', 'closed',
  '$\displaystyle\int\limits_0^{\frac{\pi}{2}}\cos60x\cdot\cos20x\,dx+\int\limits_0^{\frac{\pi}{2}}\sin60x\cdot\sin20x\,dx$ inteqralını hesablayın.',
  '[{"key": "A", "text": "$\\dfrac{\\pi}{2}$"}, {"key": "B", "text": "$20\\pi$"}, {"key": "C", "text": "$\\dfrac{1}{80}$"}, {"key": "D", "text": "$0$"}, {"key": "E", "text": "$\\dfrac{1}{40}$"}]'::jsonb, 'D', NULL, NULL,
  'Cəm $\displaystyle\int_0^{\pi/2}\cos40x\,dx=\dfrac{\sin40x}{40}\Big|_0^{\pi/2}=\dfrac{\sin20\pi}{40}=0$.',
  2025, 'II', 156, 44)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0091 | əsas: 2025 toplu, II hissə, səh.157 №55
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0091', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Müəyyən inteqral. Nyuton-Leybnis düsturu'), 'original', 'own', 'az', 'draft', 'closed',
  '$\displaystyle\int\limits_1^3\dfrac{x-1}{x}dx$ inteqralını hesablayın.',
  '[{"key": "A", "text": "$\\ln3-2$"}, {"key": "B", "text": "$\\ln3$"}, {"key": "C", "text": "$2+\\ln3$"}, {"key": "D", "text": "$2-\\ln3$"}, {"key": "E", "text": "$1-\\ln3$"}]'::jsonb, 'D', NULL, NULL,
  '$\displaystyle\int\left(1-\dfrac1x\right)dx=x-\ln x\Big|_1^3=2-\ln3$.',
  2025, 'II', 157, 55)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0092 | əsas: 2025 toplu, II hissə, səh.157 №56
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0092', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Müəyyən inteqral. Nyuton-Leybnis düsturu'), 'original', 'own', 'az', 'draft', 'closed',
  '$\displaystyle\int\limits_1^2\dfrac{x+1}{x}dx$ inteqralını hesablayın.',
  '[{"key": "A", "text": "$1-\\ln2$"}, {"key": "B", "text": "$\\ln2$"}, {"key": "C", "text": "$1+\\ln2$"}, {"key": "D", "text": "$2+\\ln2$"}, {"key": "E", "text": "$\\ln2-1$"}]'::jsonb, 'C', NULL, NULL,
  '$x+\ln x\Big|_1^2=1+\ln2$.',
  2025, 'II', 157, 56)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0093 | əsas: 2025 toplu, II hissə, səh.158 №66
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0093', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Müəyyən inteqral. Nyuton-Leybnis düsturu'), 'original', 'own', 'az', 'draft', 'closed',
  '$\displaystyle\int\limits_1^3\dfrac{x^3+x^2+4x+4}{x+1}dx$ inteqralını hesablayın.',
  '[{"key": "A", "text": "$\\dfrac{44}{3}$"}, {"key": "B", "text": "$18$"}, {"key": "C", "text": "$\\dfrac{50}{3}$"}, {"key": "D", "text": "$\\dfrac{26}{3}$"}, {"key": "E", "text": "$\\dfrac{38}{3}$"}]'::jsonb, 'C', NULL, NULL,
  '$x^2(x+1)+4(x+1)=(x+1)(x^2+4)$; inteqral $\displaystyle\int_1^3(x^2+4)dx=\dfrac{27-1}{3}+8=\dfrac{50}{3}$.',
  2025, 'II', 158, 66)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0094 | əsas: 2025 toplu, II hissə, səh.158 №67
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0094', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Müəyyən inteqral. Nyuton-Leybnis düsturu'), 'original', 'own', 'az', 'draft', 'closed',
  '$\displaystyle\int\limits_2^3\dfrac{x^3-x^2+4x-4}{x-1}dx$ inteqralını hesablayın.',
  '[{"key": "A", "text": "$10$"}, {"key": "B", "text": "$\\dfrac{31}{3}$"}, {"key": "C", "text": "$\\dfrac{25}{3}$"}, {"key": "D", "text": "$7$"}, {"key": "E", "text": "$\\dfrac{19}{3}$"}]'::jsonb, 'B', NULL, NULL,
  '$(x-1)(x^2+4)$; $\displaystyle\int_2^3(x^2+4)dx=\dfrac{27-8}{3}+4=\dfrac{31}{3}$.',
  2025, 'II', 158, 67)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0095 | əsas: 2025 toplu, II hissə, səh.158 №71
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0095', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Müəyyən inteqral. Nyuton-Leybnis düsturu'), 'original', 'own', 'az', 'draft', 'closed',
  '$\displaystyle\int\limits_{-\frac{\pi}{2}}^{0}\sqrt{8(1-\cos2x)}\,dx$ inteqralını hesablayın.',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "$1$"}, {"key": "C", "text": "$0$"}, {"key": "D", "text": "$8$"}, {"key": "E", "text": "$4$"}]'::jsonb, 'E', NULL, NULL,
  '$8(1-\cos2x)=16\sin^2x$, $\sqrt{\phantom{x}}=4|\sin x|=-4\sin x$ ($x\in[-\frac{\pi}{2};0]$). $\displaystyle\int-4\sin x\,dx=4\cos x\Big|_{-\pi/2}^0=4$.',
  2025, 'II', 158, 71)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0096 | əsas: 2025 toplu, II hissə, səh.158 №72
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0096', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Müəyyən inteqral. Nyuton-Leybnis düsturu'), 'original', 'own', 'az', 'draft', 'closed',
  '$\displaystyle\int\limits_{-\frac{\pi}{2}}^{\frac{\pi}{2}}\sqrt{2(1+\cos2x)}\,dx$ inteqralını hesablayın.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$0$"}, {"key": "C", "text": "$8$"}, {"key": "D", "text": "$1$"}, {"key": "E", "text": "$2$"}]'::jsonb, 'A', NULL, NULL,
  '$2(1+\cos2x)=4\cos^2x$, $\sqrt{\phantom{x}}=2|\cos x|=2\cos x$. $2\sin x\Big|_{-\pi/2}^{\pi/2}=4$.',
  2025, 'II', 158, 72)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0097 | əsas: 2025 toplu, II hissə, səh.158 №80
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0097', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Müəyyən inteqral. Nyuton-Leybnis düsturu'), 'original', 'own', 'az', 'draft', 'written',
  '$\displaystyle\int\limits_1^4 5\left(\cos^2x+\sin^2x\right)dx$ inteqralını hesablayın.',
  NULL, NULL, NULL, '15',
  '$\cos^2x+\sin^2x=1$; $\displaystyle\int_1^45\,dx=15$.',
  2025, 'II', 158, 80)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0098 | əsas: 2025 toplu, II hissə, səh.159 №88
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0098', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Müəyyən inteqral. Nyuton-Leybnis düsturu'), 'original', 'own', 'az', 'draft', 'written',
  '$\displaystyle\int\limits_{-\pi}^{0}\sqrt{1-\cos^2x}\,dx$ inteqralını hesablayın.',
  NULL, NULL, NULL, '2',
  '$\sqrt{\sin^2x}=|\sin x|=-\sin x$ ($x\in[-\pi;0]$). $\cos x\Big|_{-\pi}^0=1-(-1)=2$.',
  2025, 'II', 159, 88)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0099 | əsas: 2025 toplu, II hissə, səh.159 №89
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0099', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Müəyyən inteqral. Nyuton-Leybnis düsturu'), 'original', 'own', 'az', 'draft', 'written',
  '$\displaystyle\int\limits_{\frac{\pi}{2}}^{\frac{3\pi}{2}}\sqrt{1-\sin^2x}\,dx$ inteqralını hesablayın.',
  NULL, NULL, NULL, '2',
  '$\sqrt{\cos^2x}=|\cos x|=-\cos x$ ($x\in[\frac{\pi}{2};\frac{3\pi}{2}]$). $-\sin x\Big|_{\pi/2}^{3\pi/2}=1+1=2$.',
  2025, 'II', 159, 89)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0100 | əsas: 2025 toplu, II hissə, səh.161 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0100', '/images/tasks/LTI-0100.png', 'y=6x² parabolası, x=0 ilə x=1 arasında qrafikin altındakı sahə ştrixlənib', (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Əyrilərlə hüdudlanmış fiqurun sahəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Ştrixlənmiş hissənin sahəsini tapın.',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "$6$"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$1$"}, {"key": "E", "text": "$0{,}5$"}]'::jsonb, 'A', NULL, NULL,
  '$S=\displaystyle\int_0^16x^2dx=2x^3\Big|_0^1=2$.',
  2025, 'II', 161, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0101 | əsas: 2025 toplu, II hissə, səh.161 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0101', '/images/tasks/LTI-0101.png', 'y=x⁶ əyrisi, x=0 ilə x=1 arasında qrafikin altındakı sahə ştrixlənib', (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Əyrilərlə hüdudlanmış fiqurun sahəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Ştrixlənmiş hissənin sahəsini tapın.',
  '[{"key": "A", "text": "$\\dfrac{1}{6}$"}, {"key": "B", "text": "$1$"}, {"key": "C", "text": "$0{,}2$"}, {"key": "D", "text": "$\\dfrac{1}{7}$"}, {"key": "E", "text": "$\\dfrac{6}{7}$"}]'::jsonb, 'D', NULL, NULL,
  '$S=\displaystyle\int_0^1x^6dx=\dfrac{x^7}{7}\Big|_0^1=\dfrac17$.',
  2025, 'II', 161, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0102 | əsas: 2025 toplu, II hissə, səh.162 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0102', '/images/tasks/LTI-0102.png', 'y=3x²+x−2 parabolası və y=x+1 düz xətti; x=0 ilə x=1 arasındakı hissə ştrixlənib', (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Əyrilərlə hüdudlanmış fiqurun sahəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Ştrixlənmiş hissənin sahəsini tapın.',
  '[{"key": "A", "text": "$2{,}5$"}, {"key": "B", "text": "$1$"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$1{,}5$"}]'::jsonb, 'C', NULL, NULL,
  'Qrafiklərin kəsişməsi: $3x^2+x-2=x+1\Rightarrow x=\pm1$. Ştrixlənmiş hissə $x=0$ ilə $x=1$ arasındadır: $S=\displaystyle\int_0^1\big(3-3x^2\big)dx=3-1=2$.',
  2025, 'II', 162, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0103 | əsas: 2025 toplu, II hissə, səh.162 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0103', '/images/tasks/LTI-0103.png', 'Parabola və düz xətt; x=0 ilə x=3 arasında onların arasındakı hissə ştrixlənib', (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Əyrilərlə hüdudlanmış fiqurun sahəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Ştrixlənmiş hissənin sahəsini tapın.',
  '[{"key": "A", "text": "$18$"}, {"key": "B", "text": "$9$"}, {"key": "C", "text": "$12$"}, {"key": "D", "text": "$36$"}, {"key": "E", "text": "$27$"}]'::jsonb, 'A', NULL, NULL,
  'Kəsişmə: $x^2+\dfrac13x-5=\dfrac13x+4\Rightarrow x^2=9\Rightarrow x=\pm3$. $S=\displaystyle\int_0^3\left(9-x^2\right)dx=27-9=18$.',
  2025, 'II', 162, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0104 | əsas: 2025 toplu, II hissə, səh.162 №20
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0104', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Əyrilərlə hüdudlanmış fiqurun sahəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=\sqrt x$ və $y=x^4$ funksiyalarının qrafikləri ilə hüdudlanmış fiqurun sahəsini tapın.',
  '[{"key": "A", "text": "$\\dfrac{1}{3}$"}, {"key": "B", "text": "$\\dfrac{2}{3}$"}, {"key": "C", "text": "$0{,}2$"}, {"key": "D", "text": "$\\dfrac{7}{15}$"}, {"key": "E", "text": "$\\dfrac{13}{15}$"}]'::jsonb, 'D', NULL, NULL,
  'Kəsişmə $x=0$ və $x=1$; $\sqrt x\ge x^4$. $S=\dfrac23-\dfrac15=\dfrac{7}{15}$.',
  2025, 'II', 162, 20)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0105 | əsas: 2025 toplu, II hissə, səh.162 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0105', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Əyrilərlə hüdudlanmış fiqurun sahəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=\sqrt[3]x$ və $y=x^2$ funksiyalarının qrafikləri ilə hüdudlanmış fiqurun sahəsini tapın.',
  '[{"key": "A", "text": "$\\dfrac{5}{12}$"}, {"key": "B", "text": "$0{,}75$"}, {"key": "C", "text": "$\\dfrac{1}{12}$"}, {"key": "D", "text": "$\\dfrac{1}{3}$"}, {"key": "E", "text": "$\\dfrac{13}{12}$"}]'::jsonb, 'A', NULL, NULL,
  'Kəsişmə $x=0$ və $x=1$. $S=\displaystyle\int_0^1\left(x^{\frac13}-x^2\right)dx=\dfrac34-\dfrac13=\dfrac{5}{12}$.',
  2025, 'II', 162, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0106 | əsas: 2025 toplu, II hissə, səh.163 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0106', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Əyrilərlə hüdudlanmış fiqurun sahəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=x^2-6x+9$ funksiyasının qrafiki və koordinat oxları ilə hüdudlanmış fiqurun sahəsini tapın.',
  '[{"key": "A", "text": "$9$"}, {"key": "B", "text": "$3$"}, {"key": "C", "text": "$27$"}, {"key": "D", "text": "$18$"}, {"key": "E", "text": "$4{,}5$"}]'::jsonb, 'A', NULL, NULL,
  '$y=(x-3)^2$ absis oxuna $x=3$-də toxunur. $S=\displaystyle\int_0^3(x-3)^2dx=\dfrac{(x-3)^3}{3}\Big|_0^3=9$.',
  2025, 'II', 163, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0107 | əsas: 2025 toplu, II hissə, səh.163 №27
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0107', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Əyrilərlə hüdudlanmış fiqurun sahəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$y=x^2-4x+4$ funksiyasının qrafiki və koordinat oxları ilə hüdudlanmış fiqurun sahəsini tapın.',
  '[{"key": "A", "text": "$2\\dfrac23$"}, {"key": "B", "text": "$4$"}, {"key": "C", "text": "$1\\dfrac13$"}, {"key": "D", "text": "$8$"}, {"key": "E", "text": "$5\\dfrac13$"}]'::jsonb, 'A', NULL, NULL,
  '$S=\displaystyle\int_0^2(x-2)^2dx=\dfrac83=2\dfrac23$.',
  2025, 'II', 163, 27)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- LTI-0108 | əsas: 2025 toplu, II hissə, səh.164 №54
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('LTI-0108', NULL, NULL, (SELECT id FROM topics WHERE name='Limit, törəmə, inteqral'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Limit, törəmə, inteqral' AND s.title='Əyrilərlə hüdudlanmış fiqurun sahəsi'), 'original', 'own', 'az', 'draft', 'written',
  '$y=2^x$, $y=4^x$, $x=a$ xətləri ilə hüdudlanmış fiqurun sahəsi $9\log_4e$ olarsa, $a$-nı tapın $(a>0)$.',
  NULL, NULL, NULL, '2',
  '$S=\displaystyle\int_0^a\left(4^x-2^x\right)dx=\dfrac{4^a-1}{\ln4}-\dfrac{2^a-1}{\ln2}=\dfrac{4^a-1-2\left(2^a-1\right)}{\ln4}$. $\log_4e=\dfrac{1}{\ln4}$, ona görə $4^a-2\cdot2^a+1=9$. $t=2^a$: $t^2-2t-8=0\Rightarrow t=4$, $a=2$.',
  2025, 'II', 164, 54)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
