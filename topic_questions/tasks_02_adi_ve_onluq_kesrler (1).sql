-- Mövzu: Adi və onluq kəsrlər — 46 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- KSR-0001 | əsas: 2025 toplu, I hissə, səh.13 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Adi və onluq kəsrlər. Toplanması, çıxılması, vurulması və bölünməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$18{,}2:0{,}65-10{,}44:(1{,}46+0{,}34)$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$23{,}8$"}, {"key": "B", "text": "$-22{,}2$"}, {"key": "C", "text": "$-23{,}8$"}, {"key": "D", "text": "$22{,}2$"}, {"key": "E", "text": "$22{,}8$"}]'::jsonb, 'D', NULL, NULL,
  '$18{,}2:0{,}65=1820:65=28$. $1{,}46+0{,}34=1{,}8$; $10{,}44:1{,}8=104{,}4:18=5{,}8$. Nəticə: $28-5{,}8=22{,}2$.',
  2025, 'I', 13, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0002 | əsas: 2025 toplu, I hissə, səh.14 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Adi və onluq kəsrlər. Toplanması, çıxılması, vurulması və bölünməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$2{,}4\cdot1{,}(3)-\dfrac{1}{5}$ ifadəsinin qiymətini tapın.',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "$\\dfrac{14}{5}$"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$\\dfrac{16}{5}$"}]'::jsonb, 'C', NULL, NULL,
  '$1{,}(3)=1+\dfrac{3}{9}=\dfrac{4}{3}$. $2{,}4\cdot\dfrac{4}{3}=\dfrac{12}{5}\cdot\dfrac{4}{3}=\dfrac{16}{5}=3{,}2$. $3{,}2-0{,}2=3$.',
  2025, 'I', 14, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0003 | əsas: 2025 toplu, I hissə, səh.14 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Adi və onluq kəsrlər. Toplanması, çıxılması, vurulması və bölünməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$(0{,}65\cdot7-1{,}3\cdot1{,}5):2{,}6-0{,}5$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "$1$"}, {"key": "C", "text": "$0{,}5$"}, {"key": "D", "text": "$0{,}25$"}, {"key": "E", "text": "$1{,}5$"}]'::jsonb, 'C', NULL, NULL,
  '$1{,}3\cdot1{,}5=0{,}65\cdot2\cdot1{,}5=0{,}65\cdot3$. Mötərizə: $0{,}65\cdot7-0{,}65\cdot3=0{,}65\cdot4=2{,}6$. $2{,}6:2{,}6-0{,}5=1-0{,}5=0{,}5$.',
  2025, 'I', 14, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0004 | əsas: 2025 toplu, I hissə, səh.14 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Adi və onluq kəsrlər. Toplanması, çıxılması, vurulması və bölünməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left(0{,}75^3-0{,}75\cdot0{,}25^2\right)\cdot1\dfrac{1}{3}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$0{,}5$"}, {"key": "B", "text": "$0{,}25$"}, {"key": "C", "text": "$1$"}, {"key": "D", "text": "$0{,}375$"}, {"key": "E", "text": "$0{,}75$"}]'::jsonb, 'A', NULL, NULL,
  '$0{,}75^3-0{,}75\cdot0{,}25^2=0{,}75\left(0{,}75^2-0{,}25^2\right)=0{,}75\cdot(0{,}75-0{,}25)(0{,}75+0{,}25)=0{,}75\cdot0{,}5\cdot1=0{,}375$. $0{,}375\cdot\dfrac{4}{3}=0{,}5$.',
  2025, 'I', 14, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0005 | əsas: 2025 toplu, I hissə, səh.14 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Adi və onluq kəsrlər. Toplanması, çıxılması, vurulması və bölünməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left(\left(18\dfrac{1}{3}-45{,}36:2{,}7\right)\cdot3-4\dfrac{1}{2}\right)\cdot10$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "$5$"}, {"key": "C", "text": "$1$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$0$"}]'::jsonb, 'C', NULL, NULL,
  '$45{,}36:2{,}7=453{,}6:27=16{,}8=\dfrac{84}{5}$. $18\dfrac{1}{3}-\dfrac{84}{5}=\dfrac{55}{3}-\dfrac{84}{5}=\dfrac{275-252}{15}=\dfrac{23}{15}$. $\dfrac{23}{15}\cdot3=\dfrac{23}{5}=4{,}6$. $4{,}6-4{,}5=0{,}1$. $0{,}1\cdot10=1$.',
  2025, 'I', 14, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0006 | əsas: 2025 toplu, I hissə, səh.14 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Adi və onluq kəsrlər. Toplanması, çıxılması, vurulması və bölünməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{1}{2\cdot5}+\dfrac{1}{5\cdot8}+\dfrac{1}{8\cdot11}+\dfrac{1}{11\cdot14}+\dfrac{1}{14\cdot17}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$\\dfrac{1}{6}$"}, {"key": "B", "text": "$\\dfrac{5}{34}$"}, {"key": "C", "text": "$\\dfrac{15}{34}$"}, {"key": "D", "text": "$\\dfrac{5}{17}$"}, {"key": "E", "text": "$\\dfrac{3}{34}$"}]'::jsonb, 'B', NULL, NULL,
  'Hər toplanan üçün $\dfrac{1}{k(k+3)}=\dfrac{1}{3}\left(\dfrac{1}{k}-\dfrac{1}{k+3}\right)$. Cəm: $\dfrac{1}{3}\left(\dfrac{1}{2}-\dfrac{1}{5}+\dfrac{1}{5}-\dfrac{1}{8}+\dots+\dfrac{1}{14}-\dfrac{1}{17}\right)=\dfrac{1}{3}\left(\dfrac{1}{2}-\dfrac{1}{17}\right)=\dfrac{1}{3}\cdot\dfrac{15}{34}=\dfrac{5}{34}$.',
  2025, 'I', 14, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0007 | əsas: 2025 toplu, I hissə, səh.14 №27
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0007', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Adi və onluq kəsrlər. Toplanması, çıxılması, vurulması və bölünməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{1}{1\cdot6}+\dfrac{1}{6\cdot11}+\dfrac{1}{11\cdot16}+\dfrac{1}{16\cdot21}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$\\dfrac{5}{21}$"}, {"key": "B", "text": "$\\dfrac{4}{21}$"}, {"key": "C", "text": "$\\dfrac{20}{21}$"}, {"key": "D", "text": "$\\dfrac{4}{105}$"}, {"key": "E", "text": "$\\dfrac{1}{21}$"}]'::jsonb, 'B', NULL, NULL,
  '$\dfrac{1}{k(k+5)}=\dfrac{1}{5}\left(\dfrac{1}{k}-\dfrac{1}{k+5}\right)$. Cəm: $\dfrac{1}{5}\left(1-\dfrac{1}{21}\right)=\dfrac{1}{5}\cdot\dfrac{20}{21}=\dfrac{4}{21}$.',
  2025, 'I', 14, 27)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0008 | əsas: 2025 toplu, I hissə, səh.14 №31
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Adi və onluq kəsrlər. Toplanması, çıxılması, vurulması və bölünməsi'), 'original', 'own', 'az', 'draft', 'open',
  '$n$-in neçə tam qiymətində $\dfrac{(n+3)(n-3)+21}{n}$ ifadəsi tam qiymətlər alar?',
  NULL, NULL, NULL, '12',
  '$\dfrac{(n+3)(n-3)+21}{n}=\dfrac{n^2-9+21}{n}=\dfrac{n^2+12}{n}=n+\dfrac{12}{n}$ ($n\ne0$). İfadə tam olması üçün $n$ ədədi $12$-nin tam böləni olmalıdır: $\pm1,\pm2,\pm3,\pm4,\pm6,\pm12$ — cəmi $12$ qiymət.',
  2025, 'I', 14, 31)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0009 | əsas: 2025 toplu, I hissə, səh.14 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Düzgün və düzgün olmayan kəsrlər. Sonsuz dövri onluq kəsrlər. Adi kəsrin onluq kəsrə, onluq kəsrin adi kəsrə çevrilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$m$-in hansı natural qiymətlərində $\dfrac{7}{m}$ kəsri düzgün ***olmayan*** kəsr olar?',
  '[{"key": "A", "text": "$1;\\ 2;\\ 3;\\ 4;\\ 5;\\ 6;\\ 7$"}, {"key": "B", "text": "$1;\\ 2;\\ 3;\\ 4;\\ 5;\\ 6$"}, {"key": "C", "text": "$2;\\ 3;\\ 4;\\ 5;\\ 6;\\ 7$"}, {"key": "D", "text": "$8;\\ 9;\\ 10$"}, {"key": "E", "text": "$7;\\ 8;\\ 9$"}]'::jsonb, 'A', NULL, NULL,
  'Kəsr düzgün olmayan kəsrdir, əgər surəti məxrəcindən kiçik deyilsə: $7\ge m$. Natural $m$ üçün: $m\in\{1;2;3;4;5;6;7\}$.',
  2025, 'I', 14, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0010 | əsas: 2025 toplu, I hissə, səh.14 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Düzgün və düzgün olmayan kəsrlər. Sonsuz dövri onluq kəsrlər. Adi kəsrin onluq kəsrə, onluq kəsrin adi kəsrə çevrilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$m$-in hansı natural qiymətlərində $\dfrac{3}{m}$ kəsri düzgün ***olmayan*** kəsr olar?',
  '[{"key": "A", "text": "$1;\\ 2$"}, {"key": "B", "text": "$3;\\ 4;\\ 5$"}, {"key": "C", "text": "$4;\\ 5;\\ 6$"}, {"key": "D", "text": "$2;\\ 3$"}, {"key": "E", "text": "$1;\\ 2;\\ 3$"}]'::jsonb, 'E', NULL, NULL,
  'Düzgün olmayan kəsr üçün $3\ge m$, yəni $m\in\{1;2;3\}$.',
  2025, 'I', 14, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0011 | əsas: 2025 toplu, I hissə, səh.14 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0011', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Düzgün və düzgün olmayan kəsrlər. Sonsuz dövri onluq kəsrlər. Adi kəsrin onluq kəsrə, onluq kəsrin adi kəsrə çevrilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$a$-nın hansı natural qiymətində $\dfrac{8a+3}{15}$ kəsri düzgün kəsr olar?',
  '[{"key": "A", "text": "$5$"}, {"key": "B", "text": "$2$"}, {"key": "C", "text": "$1$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$4$"}]'::jsonb, 'C', NULL, NULL,
  'Düzgün kəsr üçün $8a+3<15$, yəni $8a<12$, $a<1{,}5$. Yeganə natural qiymət $a=1$-dir.',
  2025, 'I', 14, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0012 | əsas: 2025 toplu, I hissə, səh.15 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0012', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Düzgün və düzgün olmayan kəsrlər. Sonsuz dövri onluq kəsrlər. Adi kəsrin onluq kəsrə, onluq kəsrin adi kəsrə çevrilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$0{,}34(271)+0{,}65(728)$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "$1$"}, {"key": "C", "text": "$0{,}999$"}, {"key": "D", "text": "$0{,}9$"}, {"key": "E", "text": "$0{,}99$"}]'::jsonb, 'B', NULL, NULL,
  '$0{,}34(271)=\dfrac{34271-34}{99900}=\dfrac{34237}{99900}$, $0{,}65(728)=\dfrac{65728-65}{99900}=\dfrac{65663}{99900}$. Cəm: $\dfrac{34237+65663}{99900}=\dfrac{99900}{99900}=1$. (Qısa yol: $0{,}34(271)+0{,}65(728)=0{,}99(999)=1$.)',
  2025, 'I', 15, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0013 | əsas: 2025 toplu, I hissə, səh.15 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Düzgün və düzgün olmayan kəsrlər. Sonsuz dövri onluq kəsrlər. Adi kəsrin onluq kəsrə, onluq kəsrin adi kəsrə çevrilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$0{,}78(924)-0{,}12(258)$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$\\dfrac{1}{3}$"}, {"key": "B", "text": "$0{,}666$"}, {"key": "C", "text": "$0{,}6$"}, {"key": "D", "text": "$\\dfrac{2}{3}$"}, {"key": "E", "text": "$0{,}66$"}]'::jsonb, 'D', NULL, NULL,
  'Dövrlər eyni uzunluqdadır və eyni yerdən başlayır, ona görə çıxmanı rəqəm-rəqəm aparmaq olar: $0{,}78(924)-0{,}12(258)=0{,}66(666)=0{,}(6)=\dfrac{6}{9}=\dfrac{2}{3}$.',
  2025, 'I', 15, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0014 | əsas: 2025 toplu, I hissə, səh.15 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Düzgün və düzgün olmayan kəsrlər. Sonsuz dövri onluq kəsrlər. Adi kəsrin onluq kəsrə, onluq kəsrin adi kəsrə çevrilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$n$-in hansı natural qiymətlərində $\dfrac{4n}{3n+5}$ kəsri düzgün kəsrdir?',
  '[{"key": "A", "text": "$1;\\ 2;\\ 3$"}, {"key": "B", "text": "$2;\\ 3;\\ 4$"}, {"key": "C", "text": "$4;\\ 5$"}, {"key": "D", "text": "$1;\\ 2;\\ 3;\\ 4;\\ 5$"}, {"key": "E", "text": "$1;\\ 2;\\ 3;\\ 4$"}]'::jsonb, 'E', NULL, NULL,
  'Düzgün kəsr üçün $4n<3n+5$, yəni $n<5$: $n\in\{1;2;3;4\}$.',
  2025, 'I', 15, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0015 | əsas: 2025 toplu, I hissə, səh.15 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0015', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Düzgün və düzgün olmayan kəsrlər. Sonsuz dövri onluq kəsrlər. Adi kəsrin onluq kəsrə, onluq kəsrin adi kəsrə çevrilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$b$-nin hansı natural qiymətlərində $\dfrac{b+8}{3b}$ kəsri düzgün ***olmayan*** kəsrdir?',
  '[{"key": "A", "text": "$4;\\ 5;\\ 6$"}, {"key": "B", "text": "$2;\\ 3;\\ 4$"}, {"key": "C", "text": "$1;\\ 2;\\ 3$"}, {"key": "D", "text": "$1;\\ 4$"}, {"key": "E", "text": "$1;\\ 2;\\ 3;\\ 4$"}]'::jsonb, 'E', NULL, NULL,
  'Düzgün olmayan kəsr üçün $b+8\ge3b$, yəni $2b\le8$, $b\le4$: $b\in\{1;2;3;4\}$.',
  2025, 'I', 15, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0016 | əsas: 2025 toplu, I hissə, səh.15 №18
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Düzgün və düzgün olmayan kəsrlər. Sonsuz dövri onluq kəsrlər. Adi kəsrin onluq kəsrə, onluq kəsrin adi kəsrə çevrilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$m$-in neçə natural qiymətində $\dfrac{m^2+4m+12}{m}$ kəsri natural ədəddir?',
  '[{"key": "A", "text": "$5$"}, {"key": "B", "text": "$6$"}, {"key": "C", "text": "$4$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$12$"}]'::jsonb, 'B', NULL, NULL,
  '$\dfrac{m^2+4m+12}{m}=m+4+\dfrac{12}{m}$. Natural olması üçün $m$ ədədi $12$-nin natural böləni olmalıdır: $1,2,3,4,6,12$ — $6$ qiymət.',
  2025, 'I', 15, 18)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0017 | əsas: 2025 toplu, I hissə, səh.15 №19
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Düzgün və düzgün olmayan kəsrlər. Sonsuz dövri onluq kəsrlər. Adi kəsrin onluq kəsrə, onluq kəsrin adi kəsrə çevrilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$k$-nın neçə natural qiymətində $\dfrac{k^2+k+9}{k}$ kəsri natural ədəddir?',
  '[{"key": "A", "text": "$6$"}, {"key": "B", "text": "$1$"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$4$"}]'::jsonb, 'C', NULL, NULL,
  '$\dfrac{k^2+k+9}{k}=k+1+\dfrac{9}{k}$. $k$ ədədi $9$-un natural böləni olmalıdır: $1,3,9$ — $3$ qiymət.',
  2025, 'I', 15, 19)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0018 | əsas: 2025 toplu, I hissə, səh.15 №20
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Düzgün və düzgün olmayan kəsrlər. Sonsuz dövri onluq kəsrlər. Adi kəsrin onluq kəsrə, onluq kəsrin adi kəsrə çevrilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Məxrəci $24$ olan düzgün kəsrlərdən neçəsini sonlu onluq kəsr şəklində göstərmək olar?',
  '[{"key": "A", "text": "$8$"}, {"key": "B", "text": "$6$"}, {"key": "C", "text": "$23$"}, {"key": "D", "text": "$7$"}, {"key": "E", "text": "$12$"}]'::jsonb, 'D', NULL, NULL,
  '$24=2^3\cdot3$. $\dfrac{k}{24}$ ($1\le k\le23$) kəsri sonlu onluq kəsrdir yalnız o zaman ki, ixtisardan sonra məxrəcdə $3$ qalmasın, yəni $k$ ədədi $3$-ə bölünsün: $k=3,6,9,12,15,18,21$ — $7$ kəsr.',
  2025, 'I', 15, 20)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0019 | əsas: 2025 toplu, I hissə, səh.15 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Düzgün və düzgün olmayan kəsrlər. Sonsuz dövri onluq kəsrlər. Adi kəsrin onluq kəsrə, onluq kəsrin adi kəsrə çevrilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Məxrəci $64$ olan düzgün kəsrlərdən neçəsini sonlu onluq kəsr şəklində göstərmək olar?',
  '[{"key": "A", "text": "$64$"}, {"key": "B", "text": "$63$"}, {"key": "C", "text": "$62$"}, {"key": "D", "text": "$32$"}, {"key": "E", "text": "$31$"}]'::jsonb, 'B', NULL, NULL,
  '$64=2^6$, məxrəcdə $2$ və $5$-dən başqa sadə vuruq yoxdur. Ona görə $\dfrac{k}{64}$ şəklində olan bütün düzgün kəsrlər ($k=1,2,\dots,63$) sonlu onluq kəsrdir: $63$ kəsr.',
  2025, 'I', 15, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0020 | əsas: 2025 toplu, I hissə, səh.15 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Düzgün və düzgün olmayan kəsrlər. Sonsuz dövri onluq kəsrlər. Adi kəsrin onluq kəsrə, onluq kəsrin adi kəsrə çevrilməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$n$-in neçə natural qiymətində $\dfrac{4n-10}{n+2}$ kəsrinin qiyməti natural ədəddir?',
  '[{"key": "A", "text": "sonsuz sayda"}, {"key": "B", "text": "$1$"}, {"key": "C", "text": "$4$"}, {"key": "D", "text": "$3$"}, {"key": "E", "text": "$2$"}]'::jsonb, 'D', NULL, NULL,
  '$\dfrac{4n-10}{n+2}=\dfrac{4(n+2)-18}{n+2}=4-\dfrac{18}{n+2}$. Natural olması üçün $n+2$ ədədi $18$-in böləni olmalı və $\dfrac{18}{n+2}\le3$ olmalıdır. $n\ge1$ olduğundan $n+2\ge3$; uyğun bölənlər $6,9,18$-dir ($n+2=3$ olduqda ifadə $-2$ olur). $n=4,7,16$ — $3$ qiymət.',
  2025, 'I', 15, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0021 | əsas: 2025 toplu, I hissə, səh.15 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Düzgün və düzgün olmayan kəsrlər. Sonsuz dövri onluq kəsrlər. Adi kəsrin onluq kəsrə, onluq kəsrin adi kəsrə çevrilməsi'), 'original', 'own', 'az', 'draft', 'open',
  'Məxrəci $1260$ olan düzgün kəsrlərdən neçəsini sonlu onluq kəsr şəklində göstərmək olar?',
  NULL, NULL, NULL, '19',
  '$1260=2^2\cdot3^2\cdot5\cdot7$. $\dfrac{k}{1260}$ sonlu onluq kəsrdir yalnız o zaman ki, ixtisardan sonra məxrəcdə $3$ və $7$ qalmasın, yəni $k$ ədədi $3^2\cdot7=63$-ə bölünsün. $1\le k\le1259$ aralığında $63$-ə bölünənlərin sayı: $\left[\dfrac{1259}{63}\right]=19$.',
  2025, 'I', 15, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0022 | əsas: 2025 toplu, I hissə, səh.16 №29
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Düzgün və düzgün olmayan kəsrlər. Sonsuz dövri onluq kəsrlər. Adi kəsrin onluq kəsrə, onluq kəsrin adi kəsrə çevrilməsi'), 'original', 'own', 'az', 'draft', 'open',
  'Məxrəci $3080$ olan düzgün kəsrlərdən neçəsi sonlu onluq kəsr şəklində göstərilə bilər?',
  NULL, NULL, NULL, '39',
  '$3080=2^3\cdot5\cdot7\cdot11$. Kəsrin sonlu onluq kəsr olması üçün $k$ ədədi $7\cdot11=77$-yə bölünməlidir. $1\le k\le3079$ aralığında belə ədədlərin sayı: $\left[\dfrac{3079}{77}\right]=39$.',
  2025, 'I', 16, 29)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0023 | əsas: 2025 toplu, I hissə, səh.16 №33
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Düzgün və düzgün olmayan kəsrlər. Sonsuz dövri onluq kəsrlər. Adi kəsrin onluq kəsrə, onluq kəsrin adi kəsrə çevrilməsi'), 'original', 'own', 'az', 'draft', 'matching',
  'Verilmiş kəsrlər üçün uyğunluğu müəyyən edin ($a$ — rəqəmdir).',
  '{"left": [{"key": "1", "text": "$\\dfrac{\\overline{5a4}}{563}$ düzgün kəsrdir"}, {"key": "2", "text": "$\\dfrac{\\overline{a36}}{\\overline{4a2}}$ düzgün kəsrdir"}, {"key": "3", "text": "$\\dfrac{\\overline{a71}}{371}$ düzgün olmayan kəsrdir"}], "right": [{"key": "a", "text": "$a$-nın ən kiçik qiyməti $0$-dır"}, {"key": "b", "text": "$a$-ların cəmi $10$-dur"}, {"key": "c", "text": "$a$-ların sayı $7$-dir"}, {"key": "d", "text": "$a$-nın ən kiçik qiyməti $3$-dür"}, {"key": "e", "text": "$a$-ların sayı $6$-dır"}]}'::jsonb, NULL, '{"1": ["a", "e"], "2": ["b"], "3": ["c", "d"]}'::jsonb, NULL,
  '1) $\overline{5a4}<563$: $a=5$ olduqda $554<563$, $a=6$ olduqda $564>563$. Deməli $a\in\{0;1;2;3;4;5\}$ — ən kiçiyi $0$, sayı $6$. 2) $a\ne0$ (birinci rəqəm). $\overline{a36}<\overline{4a2}$: $a\le3$ olduqda yüzlüklər müqayisəsi ilə doğrudur; $a=4$: $436<442$ — doğrudur; $a\ge5$ olduqda $\overline{a36}>\overline{4a2}$. $a\in\{1;2;3;4\}$, cəmi $10$. 3) $\overline{a71}\ge371\Rightarrow a\ge3$: $a\in\{3;\dots;9\}$ — sayı $7$, ən kiçiyi $3$.',
  2025, 'I', 16, 33)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0024 | əsas: 2025 toplu, I hissə, səh.16 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Kəsrlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$a=\dfrac{5}{9},\ b=0{,}(5),\ c=0{,}(3)$ ədədlərini müqayisə edin.',
  '[{"key": "A", "text": "$a>b>c$"}, {"key": "B", "text": "$a=b<c$"}, {"key": "C", "text": "$a=b>c$"}, {"key": "D", "text": "$a=c<b$"}, {"key": "E", "text": "$a=b=c$"}]'::jsonb, 'C', NULL, NULL,
  '$0{,}(5)=\dfrac{5}{9}$, $0{,}(3)=\dfrac{3}{9}$. Deməli $a=b=\dfrac{5}{9}>\dfrac{3}{9}=c$: $a=b>c$.',
  2025, 'I', 16, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0025 | əsas: 2025 toplu, I hissə, səh.16 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0025', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Kəsrlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$a=\dfrac{1}{3},\ b=0{,}(2),\ c=0{,}(4)$ ədədlərini müqayisə edin.',
  '[{"key": "A", "text": "$b<a<c$"}, {"key": "B", "text": "$c<a<b$"}, {"key": "C", "text": "$b<c<a$"}, {"key": "D", "text": "$a<b<c$"}, {"key": "E", "text": "$a<c<b$"}]'::jsonb, 'A', NULL, NULL,
  '$b=0{,}(2)=\dfrac{2}{9}$, $a=\dfrac{1}{3}=\dfrac{3}{9}$, $c=0{,}(4)=\dfrac{4}{9}$. Deməli $b<a<c$.',
  2025, 'I', 16, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0026 | əsas: 2025 toplu, I hissə, səh.16 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Kəsrlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$a=\dfrac{9}{10},\ b=\dfrac{99}{100},\ c=\dfrac{999}{1000}$ olarsa, bərabərsizliklərdən hansı doğrudur?',
  '[{"key": "A", "text": "$c>b>a$"}, {"key": "B", "text": "$b>c>a$"}, {"key": "C", "text": "$c>a>b$"}, {"key": "D", "text": "$a>b>c$"}, {"key": "E", "text": "$b>a>c$"}]'::jsonb, 'A', NULL, NULL,
  '$a=0{,}9$, $b=0{,}99$, $c=0{,}999$. Deməli $c>b>a$. (Başqa yol: $1-a=0{,}1$, $1-b=0{,}01$, $1-c=0{,}001$ — fərq kiçildikcə ədəd böyüyür.)',
  2025, 'I', 16, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0027 | əsas: 2025 toplu, I hissə, səh.16 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0027', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Kəsrlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$a=\dfrac{1313}{2020};\ b=\dfrac{13}{20};\ c=0{,}65$ kəsrlərini müqayisə edin.',
  '[{"key": "A", "text": "$b=c>a$"}, {"key": "B", "text": "$a>b=c$"}, {"key": "C", "text": "$a=c>b$"}, {"key": "D", "text": "$a=b=c$"}, {"key": "E", "text": "$b>a>c$"}]'::jsonb, 'D', NULL, NULL,
  '$\dfrac{1313}{2020}=\dfrac{13\cdot101}{20\cdot101}=\dfrac{13}{20}$, $\dfrac{13}{20}=\dfrac{65}{100}=0{,}65$. Deməli $a=b=c$.',
  2025, 'I', 16, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0028 | əsas: 2025 toplu, I hissə, səh.16 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0028', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Kəsrlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Ədədlərdən hansı $\dfrac{2}{3}<x<\dfrac{7}{9}$ şərtini ödəyir?',
  '[{"key": "A", "text": "$\\dfrac{11}{18}$"}, {"key": "B", "text": "$\\dfrac{1}{2}$"}, {"key": "C", "text": "$\\dfrac{13}{18}$"}, {"key": "D", "text": "$\\dfrac{5}{6}$"}, {"key": "E", "text": "$\\dfrac{7}{12}$"}]'::jsonb, 'C', NULL, NULL,
  'Ortaq məxrəc $36$: $\dfrac{2}{3}=\dfrac{24}{36}$, $\dfrac{7}{9}=\dfrac{28}{36}$. Variantlar: $\dfrac{5}{6}=\dfrac{30}{36}$, $\dfrac{13}{18}=\dfrac{26}{36}$, $\dfrac{1}{2}=\dfrac{18}{36}$, $\dfrac{7}{12}=\dfrac{21}{36}$, $\dfrac{11}{18}=\dfrac{22}{36}$. Yalnız $\dfrac{26}{36}=\dfrac{13}{18}$ aralıqdadır.',
  2025, 'I', 16, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0029 | əsas: 2025 toplu, I hissə, səh.16 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0029', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Kəsrlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Ədədlərdən hansı $\dfrac{1}{3}<x<\dfrac{5}{8}$ şərtini ödəyir?',
  '[{"key": "A", "text": "$\\dfrac{3}{10}$"}, {"key": "B", "text": "$\\dfrac{1}{4}$"}, {"key": "C", "text": "$\\dfrac{5}{7}$"}, {"key": "D", "text": "$\\dfrac{2}{3}$"}, {"key": "E", "text": "$\\dfrac{1}{2}$"}]'::jsonb, 'E', NULL, NULL,
  '$\dfrac{1}{3}\approx0{,}333$, $\dfrac{5}{8}=0{,}625$. Variantlar: $\dfrac{2}{3}\approx0{,}667$, $\dfrac{1}{4}=0{,}25$, $\dfrac{1}{2}=0{,}5$, $\dfrac{5}{7}\approx0{,}714$, $\dfrac{3}{10}=0{,}3$. Aralıqda yalnız $\dfrac{1}{2}$ var.',
  2025, 'I', 16, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0030 | əsas: 2025 toplu, I hissə, səh.16 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0030', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Kəsrlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{1}{6};\dfrac{2}{5};\dfrac{1}{3};\dfrac{5}{6};\dfrac{1}{2}$ ədədlərinin ən böyüyü ilə ən kiçiyinin fərqini tapın.',
  '[{"key": "A", "text": "$\\dfrac{7}{15}$"}, {"key": "B", "text": "$\\dfrac{1}{3}$"}, {"key": "C", "text": "$\\dfrac{2}{3}$"}, {"key": "D", "text": "$\\dfrac{1}{2}$"}, {"key": "E", "text": "$\\dfrac{4}{5}$"}]'::jsonb, 'C', NULL, NULL,
  'Ən böyüyü $\dfrac{5}{6}$, ən kiçiyi $\dfrac{1}{6}$-dır. Fərq: $\dfrac{5}{6}-\dfrac{1}{6}=\dfrac{4}{6}=\dfrac{2}{3}$.',
  2025, 'I', 16, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0031 | əsas: 2025 toplu, I hissə, səh.16 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0031', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Kəsrlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$a$-nın $\dfrac{5}{6}$-nın, $b$-nin $\dfrac{1}{3}$-nin və $c$-nin $\dfrac{3}{4}$-nün bərabər olduğunu bilərək $a,\ b$ və $c$ ədədlərini müqayisə edin ($a>0;\ b>0;\ c>0$).',
  '[{"key": "A", "text": "$b>a>c$"}, {"key": "B", "text": "$c>a>b$"}, {"key": "C", "text": "$b=c=a$"}, {"key": "D", "text": "$b>c>a$"}, {"key": "E", "text": "$a>b>c$"}]'::jsonb, 'D', NULL, NULL,
  'Ortaq qiyməti $k>0$ ilə işarə edək: $\dfrac{5}{6}a=\dfrac{1}{3}b=\dfrac{3}{4}c=k$. Onda $a=\dfrac{6k}{5}=1{,}2k$, $b=3k$, $c=\dfrac{4k}{3}\approx1{,}33k$. Deməli $b>c>a$.',
  2025, 'I', 16, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0032 | əsas: 2025 toplu, I hissə, səh.17 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0032', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Kəsrlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$a$-nın $\dfrac{3}{5}$-i $b$-nin $\dfrac{2}{3}$-nə, $a$-nın $\dfrac{1}{4}$-ü isə $c$-nin $\dfrac{1}{6}$-na bərabər olduğunu bilərək $a,\ b$ və $c$ ədədlərini müqayisə edin ($a>0;\ b>0;\ c>0$).',
  '[{"key": "A", "text": "$c>a>b$"}, {"key": "B", "text": "$a>b>c$"}, {"key": "C", "text": "$b>c>a$"}, {"key": "D", "text": "$a>c>b$"}, {"key": "E", "text": "$a=b=c$"}]'::jsonb, 'A', NULL, NULL,
  '$\dfrac{3}{5}a=\dfrac{2}{3}b\Rightarrow b=\dfrac{9}{10}a$. $\dfrac{1}{4}a=\dfrac{1}{6}c\Rightarrow c=\dfrac{3}{2}a$. Deməli $c=1{,}5a>a>0{,}9a=b$: $c>a>b$.',
  2025, 'I', 17, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0033 | əsas: 2025 toplu, I hissə, səh.17 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0033', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Kəsrlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$a=\left(\dfrac{1}{3}+\dfrac{1}{4}\right)^2,\ b=\left(\dfrac{1}{3}\right)^2-\left(\dfrac{1}{4}\right)^2$ və $c=\left(\dfrac{1}{3}-\dfrac{1}{4}\right)^2$ ədədlərini artan sırada yazın.',
  '[{"key": "A", "text": "$a,\\ b,\\ c$"}, {"key": "B", "text": "$b,\\ a,\\ c$"}, {"key": "C", "text": "$c,\\ a,\\ b$"}, {"key": "D", "text": "$c,\\ b,\\ a$"}, {"key": "E", "text": "$b,\\ c,\\ a$"}]'::jsonb, 'D', NULL, NULL,
  '$a=\left(\dfrac{7}{12}\right)^2=\dfrac{49}{144}$, $b=\dfrac{1}{9}-\dfrac{1}{16}=\dfrac{16-9}{144}=\dfrac{7}{144}$, $c=\left(\dfrac{1}{12}\right)^2=\dfrac{1}{144}$. Artan sıra: $c,\ b,\ a$.',
  2025, 'I', 17, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0034 | əsas: 2025 toplu, I hissə, səh.17 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0034', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Kəsrlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'open',
  'Sinifdəki qızların sayı bütün sinfin $\dfrac{1}{4}$-dən çox, $\dfrac{2}{7}$-dən az olarsa, sinifdə ən azı neçə şagird olar?',
  NULL, NULL, NULL, '11',
  'Şagirdlərin sayı $n$, qızların sayı $g$ olsun: $\dfrac{n}{4}<g<\dfrac{2n}{7}$. Buradan $n<4g$ və $n>\dfrac{7g}{2}$, yəni $3{,}5g<n<4g$. $g=1$: $3{,}5<n<4$ — natural $n$ yoxdur. $g=2$: $7<n<8$ — yoxdur. $g=3$: $10{,}5<n<12$, $n=11$. Deməli sinifdə ən azı $11$ şagird var (yoxlama: $\dfrac{11}{4}=2{,}75<3<\dfrac{22}{7}\approx3{,}14$).',
  2025, 'I', 17, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0035 | əsas: 2025 toplu, I hissə, səh.17 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0035', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Kəsrlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'open',
  'Sinifdəki oğlanların sayı sinfin bütün şagirdlərinin sayının $\dfrac{2}{7}$-indən çox, $\dfrac{1}{3}$-indən az olarsa, sinifdə ən azı neçə şagird olar?',
  NULL, NULL, NULL, '10',
  'Şagirdlərin sayı $n$, oğlanların sayı $g$ olsun: $\dfrac{2n}{7}<g<\dfrac{n}{3}$. Buradan $3g<n<3{,}5g$. $g=1$: $3<n<3{,}5$ — yoxdur. $g=2$: $6<n<7$ — yoxdur. $g=3$: $9<n<10{,}5$, $n=10$. Cavab: $10$ (yoxlama: $\dfrac{20}{7}\approx2{,}86<3<\dfrac{10}{3}\approx3{,}33$).',
  2025, 'I', 17, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0036 | əsas: 2025 toplu, I hissə, səh.17 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0036', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Kəsrlərin müqayisəsi'), 'original', 'own', 'az', 'draft', 'matching',
  'Kəsrlər üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$a=\\dfrac{3}{8};\\ b=\\dfrac{5}{12};\\ c=\\dfrac{1}{3};\\ d=\\dfrac{4}{9}$"}, {"key": "2", "text": "$a=\\dfrac{5}{6};\\ b=\\dfrac{7}{9};\\ c=\\dfrac{3}{4};\\ d=\\dfrac{11}{12}$"}, {"key": "3", "text": "$a=\\dfrac{9}{7};\\ b=\\dfrac{4}{3};\\ c=\\dfrac{5}{4};\\ d=\\dfrac{6}{5}$"}], "right": [{"key": "a", "text": "$c<a<b<d$"}, {"key": "b", "text": "$c<b<a<d$"}, {"key": "c", "text": "$d<c<a<b$"}, {"key": "d", "text": "$a<b<c<d$"}, {"key": "e", "text": "$d<a<c<b$"}]}'::jsonb, NULL, '{"1": ["a"], "2": ["b"], "3": ["c"]}'::jsonb, NULL,
  '1) Ortaq məxrəc $72$: $a=\dfrac{27}{72}$, $b=\dfrac{30}{72}$, $c=\dfrac{24}{72}$, $d=\dfrac{32}{72}$ — $c<a<b<d$. 2) Ortaq məxrəc $36$: $a=\dfrac{30}{36}$, $b=\dfrac{28}{36}$, $c=\dfrac{27}{36}$, $d=\dfrac{33}{36}$ — $c<b<a<d$. 3) Hamısı $1$-dən böyükdür, $1$-dən artıq hissələri müqayisə edək: $\dfrac{2}{7},\ \dfrac{1}{3},\ \dfrac{1}{4},\ \dfrac{1}{5}$. $\dfrac{1}{5}<\dfrac{1}{4}<\dfrac{2}{7}<\dfrac{1}{3}$, yəni $d<c<a<b$.',
  2025, 'I', 17, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0037 | əsas: 2025 toplu, I hissə, səh.17 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0037', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Ədədin hissəsinin və hissəsinə görə ədədin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  'Ədədin $\dfrac{3}{5}$ hissəsinin üzərinə $8$ əlavə etdikdə ədədin özü alınır. Bu ədədi tapın.',
  '[{"key": "A", "text": "$12$"}, {"key": "B", "text": "$20$"}, {"key": "C", "text": "$15$"}, {"key": "D", "text": "$40$"}, {"key": "E", "text": "$25$"}]'::jsonb, 'B', NULL, NULL,
  'Ədəd $x$ olsun: $\dfrac{3}{5}x+8=x\Rightarrow\dfrac{2}{5}x=8\Rightarrow x=20$.',
  2025, 'I', 17, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0038 | əsas: 2025 toplu, I hissə, səh.17 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0038', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Ədədin hissəsinin və hissəsinə görə ədədin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  'Anar $360$ səhifəsi olan kitabın $\dfrac{5}{8}$ hissəsini oxudu. Neçə səhifə ***oxunmamış*** qaldı?',
  '[{"key": "A", "text": "$150$"}, {"key": "B", "text": "$135$"}, {"key": "C", "text": "$120$"}, {"key": "D", "text": "$180$"}, {"key": "E", "text": "$225$"}]'::jsonb, 'B', NULL, NULL,
  'Oxunmamış hissə $1-\dfrac{5}{8}=\dfrac{3}{8}$. $360\cdot\dfrac{3}{8}=135$ səhifə.',
  2025, 'I', 17, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0039 | əsas: 2025 toplu, I hissə, səh.17 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0039', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Ədədin hissəsinin və hissəsinə görə ədədin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  'Turist atla yolun $\dfrac{5}{9}$ hissəsini getdikdən sonra qalan $28$ km yolu piyada getdi. Turistin getdiyi bütün yolun uzunluğunu tapın.',
  '[{"key": "A", "text": "$45$ km"}, {"key": "B", "text": "$72$ km"}, {"key": "C", "text": "$50{,}4$ km"}, {"key": "D", "text": "$36$ km"}, {"key": "E", "text": "$63$ km"}]'::jsonb, 'E', NULL, NULL,
  'Piyada gedilən hissə $1-\dfrac{5}{9}=\dfrac{4}{9}$. $\dfrac{4}{9}x=28\Rightarrow x=28\cdot\dfrac{9}{4}=63$ km.',
  2025, 'I', 17, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0040 | əsas: 2025 toplu, I hissə, səh.17 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0040', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Ədədin hissəsinin və hissəsinə görə ədədin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  'Piyada yolun $\dfrac{3}{8}$ hissəsini getmişdir. Mənzilə çatmağa daha $45$ km yol qalarsa, yolun uzunluğu nə qədərdir?',
  '[{"key": "A", "text": "$60$ km"}, {"key": "B", "text": "$72$ km"}, {"key": "C", "text": "$120$ km"}, {"key": "D", "text": "$80$ km"}, {"key": "E", "text": "$27$ km"}]'::jsonb, 'B', NULL, NULL,
  'Qalan hissə $1-\dfrac{3}{8}=\dfrac{5}{8}$. $\dfrac{5}{8}x=45\Rightarrow x=72$ km.',
  2025, 'I', 17, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0041 | əsas: 2025 toplu, I hissə, səh.17 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0041', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Ədədin hissəsinin və hissəsinə görə ədədin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  'Azərin bir qutu rəngli qələmi var idi. O, qələmlərin $\dfrac{1}{4}$ hissəsini İlqara, qalanın $\dfrac{2}{5}$ hissəsini isə Arifə verdikdən sonra qutuda $27$ qələm qaldı. Əvvəl qutuda neçə qələm var idi?',
  '[{"key": "A", "text": "$60$"}, {"key": "B", "text": "$72$"}, {"key": "C", "text": "$48$"}, {"key": "D", "text": "$90$"}, {"key": "E", "text": "$80$"}]'::jsonb, 'A', NULL, NULL,
  'Əvvəl $x$ qələm olsun. İlqara verdikdən sonra $\dfrac{3}{4}x$ qalır. Arifə bunun $\dfrac{2}{5}$-i verilir, qalır $\dfrac{3}{5}\cdot\dfrac{3}{4}x=\dfrac{9}{20}x$. $\dfrac{9}{20}x=27\Rightarrow x=60$.',
  2025, 'I', 17, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0042 | əsas: 2025 toplu, I hissə, səh.17 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0042', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Ədədin hissəsinin və hissəsinə görə ədədin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  'Arazın bir bağlama dəftəri var idi. O, dəftərlərin $\dfrac{1}{5}$ hissəsini Gündüzə, qalanın $\dfrac{1}{6}$ hissəsini Elnura verdikdən sonra $20$ dəftəri qaldı. Əvvəl Arazın neçə dəftəri var idi?',
  '[{"key": "A", "text": "$45$"}, {"key": "B", "text": "$36$"}, {"key": "C", "text": "$40$"}, {"key": "D", "text": "$24$"}, {"key": "E", "text": "$30$"}]'::jsonb, 'E', NULL, NULL,
  'Əvvəl $x$ dəftər olsun. Gündüzə verdikdən sonra $\dfrac{4}{5}x$ qalır, Elnura verdikdən sonra $\dfrac{5}{6}\cdot\dfrac{4}{5}x=\dfrac{2}{3}x$. $\dfrac{2}{3}x=20\Rightarrow x=30$.',
  2025, 'I', 17, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0043 | əsas: 2025 toplu, I hissə, səh.17 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0043', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Ədədin hissəsinin və hissəsinə görə ədədin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  'Yolun $\dfrac{4}{11}$ hissəsi təmir olunduqdan sonra $56$ km təmir olunmamış qaldı. Yolun uzunluğu nə qədərdir?',
  '[{"key": "A", "text": "$88$ km"}, {"key": "B", "text": "$154$ km"}, {"key": "C", "text": "$132$ km"}, {"key": "D", "text": "$77$ km"}, {"key": "E", "text": "$99$ km"}]'::jsonb, 'A', NULL, NULL,
  'Təmir olunmamış hissə $1-\dfrac{4}{11}=\dfrac{7}{11}$. $\dfrac{7}{11}x=56\Rightarrow x=88$ km.',
  2025, 'I', 17, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0044 | əsas: 2025 toplu, I hissə, səh.17 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0044', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Ədədin hissəsinin və hissəsinə görə ədədin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  'Bir kran boş çəni $8$ dəqiqəyə, digəri isə $12$ dəqiqəyə doldurur. Hər iki kran bir dəqiqə açıq olarsa, boş çənin hansı hissəsi ***dolmamış*** qalar?',
  '[{"key": "A", "text": "$\\dfrac{1}{2}$"}, {"key": "B", "text": "$\\dfrac{7}{24}$"}, {"key": "C", "text": "$\\dfrac{17}{24}$"}, {"key": "D", "text": "$\\dfrac{19}{24}$"}, {"key": "E", "text": "$\\dfrac{5}{24}$"}]'::jsonb, 'D', NULL, NULL,
  'Bir dəqiqədə birinci kran çənin $\dfrac{1}{8}$, ikinci $\dfrac{1}{12}$ hissəsini doldurur: $\dfrac{1}{8}+\dfrac{1}{12}=\dfrac{3+2}{24}=\dfrac{5}{24}$. Dolmamış hissə: $1-\dfrac{5}{24}=\dfrac{19}{24}$.',
  2025, 'I', 17, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0045 | əsas: 2025 toplu, I hissə, səh.18 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0045', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Ədədin hissəsinin və hissəsinə görə ədədin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  'Bir briqada müəyyən işi $10$ saata, digəri isə $15$ saata yerinə yetirir. Onlar birlikdə $4$ saat işləsələr, işin hansı hissəsi ***görülməmiş*** qalar?',
  '[{"key": "A", "text": "$\\dfrac{1}{3}$"}, {"key": "B", "text": "$\\dfrac{5}{6}$"}, {"key": "C", "text": "$\\dfrac{1}{6}$"}, {"key": "D", "text": "$\\dfrac{1}{5}$"}, {"key": "E", "text": "$\\dfrac{2}{3}$"}]'::jsonb, 'A', NULL, NULL,
  'Birlikdə bir saatda işin $\dfrac{1}{10}+\dfrac{1}{15}=\dfrac{3+2}{30}=\dfrac{1}{6}$ hissəsini görürlər. $4$ saatda: $\dfrac{4}{6}=\dfrac{2}{3}$. Görülməmiş hissə: $1-\dfrac{2}{3}=\dfrac{1}{3}$.',
  2025, 'I', 18, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KSR-0046 | əsas: 2025 toplu, I hissə, səh.18 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KSR-0046', NULL, NULL, (SELECT id FROM topics WHERE name='Adi və onluq kəsrlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Adi və onluq kəsrlər' AND s.title='Ədədin hissəsinin və hissəsinə görə ədədin tapılması'), 'original', 'own', 'az', 'draft', 'closed',
  'Anbarda olan taxılın $\dfrac{4}{13}$ hissəsini satdılar. Anbarda qalan taxıl $72{,}9$ ton olarsa, əvvəl anbarda nə qədər taxıl var idi?',
  '[{"key": "A", "text": "$98{,}1$ t"}, {"key": "B", "text": "$101{,}7$ t"}, {"key": "C", "text": "$94{,}5$ t"}, {"key": "D", "text": "$109{,}2$ t"}, {"key": "E", "text": "$105{,}3$ t"}]'::jsonb, 'E', NULL, NULL,
  'Qalan hissə $1-\dfrac{4}{13}=\dfrac{9}{13}$. $\dfrac{9}{13}x=72{,}9\Rightarrow x=72{,}9\cdot\dfrac{13}{9}=8{,}1\cdot13=105{,}3$ ton.',
  2025, 'I', 18, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
