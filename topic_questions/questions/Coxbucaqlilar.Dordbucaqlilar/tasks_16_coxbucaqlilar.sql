-- Mövzu: Çoxbucaqlılar. Dördbucaqlılar — 102 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- CXB-0001 | əsas: 2025 toplu, I hissə, səh.162 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'closed',
  'Daxili bucaqlarının cəmi $1980^\circ$ olan qabarıq çoxbucaqlının tərəflərinin sayını tapın.',
  '[{"key": "A", "text": "$13$"}, {"key": "B", "text": "$12$"}, {"key": "C", "text": "$11$"}, {"key": "D", "text": "$15$"}, {"key": "E", "text": "$14$"}]'::jsonb, 'A', NULL, NULL,
  '$180^\circ(n-2)=1980^\circ\Rightarrow n-2=11\Rightarrow n=13$.',
  2025, 'I', 162, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0002 | əsas: 2025 toplu, I hissə, səh.162 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'closed',
  'Daxili bucaqlarının cəmi $2340^\circ$ olan qabarıq çoxbucaqlının tərəflərinin sayını tapın.',
  '[{"key": "A", "text": "$16$"}, {"key": "B", "text": "$14$"}, {"key": "C", "text": "$15$"}, {"key": "D", "text": "$13$"}, {"key": "E", "text": "$17$"}]'::jsonb, 'C', NULL, NULL,
  '$180^\circ(n-2)=2340^\circ\Rightarrow n=15$.',
  2025, 'I', 162, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0003 | əsas: 2025 toplu, I hissə, səh.162 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'closed',
  'Perimetri $42$ sm olan düzgün altıbucaqlının böyük diaqonalını tapın.',
  '[{"key": "A", "text": "$14 \\sqrt{3}$ sm"}, {"key": "B", "text": "$28$ sm"}, {"key": "C", "text": "$7$ sm"}, {"key": "D", "text": "$14$ sm"}, {"key": "E", "text": "$7 \\sqrt{3}$ sm"}]'::jsonb, 'D', NULL, NULL,
  'Tərəf $42:6=7$ sm. Düzgün altıbucaqlının böyük diaqonalı tərəfin iki mislidir: $14$ sm.',
  2025, 'I', 162, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0004 | əsas: 2025 toplu, I hissə, səh.162 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'closed',
  'Perimetri $48$ sm olan düzgün altıbucaqlının kiçik diaqonalını tapın.',
  '[{"key": "A", "text": "$8 \\sqrt{3}$ sm"}, {"key": "B", "text": "$16 \\sqrt{3}$ sm"}, {"key": "C", "text": "$8$ sm"}, {"key": "D", "text": "$16$ sm"}, {"key": "E", "text": "$4 \\sqrt{3}$ sm"}]'::jsonb, 'A', NULL, NULL,
  'Tərəf $8$ sm. Kiçik diaqonal $120^\circ$-li bucağın qarşısındadır: $a\sqrt3=8\sqrt3$ sm.',
  2025, 'I', 162, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0005 | əsas: 2025 toplu, I hissə, səh.162 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'closed',
  'Böyük diaqonalı $10$ sm olan düzgün altıbucaqlının perimetrini tapın.',
  '[{"key": "A", "text": "$30$ sm"}, {"key": "B", "text": "$15$ sm"}, {"key": "C", "text": "$10$ sm"}, {"key": "D", "text": "$20$ sm"}, {"key": "E", "text": "$60$ sm"}]'::jsonb, 'A', NULL, NULL,
  'Tərəf böyük diaqonalın yarısıdır: $5$ sm. $P=30$ sm.',
  2025, 'I', 162, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0006 | əsas: 2025 toplu, I hissə, səh.162 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'closed',
  'Kiçik diaqonalı $5\sqrt3$ sm olan düzgün altıbucaqlının perimetrini tapın.',
  '[{"key": "A", "text": "$60$ sm"}, {"key": "B", "text": "$45$ sm"}, {"key": "C", "text": "$15$ sm"}, {"key": "D", "text": "$30 \\sqrt{3}$ sm"}, {"key": "E", "text": "$30$ sm"}]'::jsonb, 'E', NULL, NULL,
  '$a\sqrt3=5\sqrt3\Rightarrow a=5$ sm. $P=30$ sm.',
  2025, 'I', 162, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0007 | əsas: 2025 toplu, I hissə, səh.162 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0007', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'closed',
  'Bir təpəsindən çıxan diaqonallarının sayı $13$ olan düzgün qabarıq çoxbucaqlının daxili bucağını tapın.',
  '[{"key": "A", "text": "$157{,}5^\\circ$"}, {"key": "B", "text": "$150^\\circ$"}, {"key": "C", "text": "$135^\\circ$"}, {"key": "D", "text": "$162^\\circ$"}, {"key": "E", "text": "$165^\\circ$"}]'::jsonb, 'A', NULL, NULL,
  'Bir təpədən $n-3$ diaqonal çıxır: $n-3=13\Rightarrow n=16$. Daxili bucaq $\dfrac{180^\circ\cdot14}{16}=157{,}5^\circ$.',
  2025, 'I', 162, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0008 | əsas: 2025 toplu, I hissə, səh.162 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'closed',
  'Bir təpəsindən çıxan diaqonallarının sayı $21$ olan qabarıq çoxbucaqlının tərəflərinin sayını tapın.',
  '[{"key": "A", "text": "$23$"}, {"key": "B", "text": "$21$"}, {"key": "C", "text": "$25$"}, {"key": "D", "text": "$24$"}, {"key": "E", "text": "$22$"}]'::jsonb, 'D', NULL, NULL,
  '$n-3=21\Rightarrow n=24$.',
  2025, 'I', 162, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0009 | əsas: 2025 toplu, I hissə, səh.162 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzgün $18$-bucaqlının bir daxili bucağını tapın.',
  '[{"key": "A", "text": "$160^\\circ$"}, {"key": "B", "text": "$170^\\circ$"}, {"key": "C", "text": "$165^\\circ$"}, {"key": "D", "text": "$150^\\circ$"}, {"key": "E", "text": "$140^\\circ$"}]'::jsonb, 'A', NULL, NULL,
  '$\dfrac{180^\circ\cdot16}{18}=160^\circ$.',
  2025, 'I', 162, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0010 | əsas: 2025 toplu, I hissə, səh.162 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzgün $10$-bucaqlının bir daxili bucağını tapın.',
  '[{"key": "A", "text": "$144^\\circ$"}, {"key": "B", "text": "$150^\\circ$"}, {"key": "C", "text": "$108^\\circ$"}, {"key": "D", "text": "$160^\\circ$"}, {"key": "E", "text": "$135^\\circ$"}]'::jsonb, 'A', NULL, NULL,
  '$\dfrac{180^\circ\cdot8}{10}=144^\circ$.',
  2025, 'I', 162, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0011 | əsas: 2025 toplu, I hissə, səh.162 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0011', '/images/tasks/CXB-0011.png', 'Sütunlu diaqram: A — 95°, B — 120°, C — 100°, D — 135°', (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'closed',
  'Diaqramda $ABCDE$ beşbucaqlısının dörd daxili bucağının dərəcə ölçüsü verilmişdir. Digər daxili bucağı tapın.',
  '[{"key": "A", "text": "$110^\\circ$"}, {"key": "B", "text": "$70^\\circ$"}, {"key": "C", "text": "$80^\\circ$"}, {"key": "D", "text": "$90^\\circ$"}, {"key": "E", "text": "$100^\\circ$"}]'::jsonb, 'D', NULL, NULL,
  'Beşbucaqlının daxili bucaqlarının cəmi $540^\circ$. Diaqramdan: $95^\circ+120^\circ+100^\circ+135^\circ=450^\circ$. $\angle E=540^\circ-450^\circ=90^\circ$.',
  2025, 'I', 162, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0012 | əsas: 2025 toplu, I hissə, səh.162 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0012', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzgün $10$-bucaqlının simmetriya oxlarının sayı, qabarıq beşbucaqlının diaqonalları sayının neçə faizidir?',
  '[{"key": "A", "text": "$50\\%$"}, {"key": "B", "text": "$150\\%$"}, {"key": "C", "text": "$100\\%$"}, {"key": "D", "text": "$250\\%$"}, {"key": "E", "text": "$200\\%$"}]'::jsonb, 'E', NULL, NULL,
  'Düzgün $n$-bucaqlının $n$ simmetriya oxu var: $10$. Beşbucaqlının diaqonalları: $\dfrac{5\cdot2}{2}=5$. $\dfrac{10}{5}\cdot100\%=200\%$.',
  2025, 'I', 162, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0013 | əsas: 2025 toplu, I hissə, səh.162 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzgün altıbucaqlının bir təpəsindən çıxan qonşu iki diaqonalı arasındakı bucağı tapın.',
  '[{"key": "A", "text": "$60^\\circ$"}, {"key": "B", "text": "$30^\\circ$"}, {"key": "C", "text": "$20^\\circ$"}, {"key": "D", "text": "$45^\\circ$"}, {"key": "E", "text": "$15^\\circ$"}]'::jsonb, 'B', NULL, NULL,
  'Düzgün çoxbucaqlı çevrəyə daxildir; bir təpədən çıxan qonşu diaqonallar arasındakı bucaq bir tərəfin üzərinə söykənən daxilə çəkilmiş bucaqdır: $\dfrac{360^\circ}{6}:2=30^\circ$.',
  2025, 'I', 162, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0014 | əsas: 2025 toplu, I hissə, səh.163 №18
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzgün altıbucaqlının böyük diaqonalının uzunluğu $6$ sm olarsa, onun bütün diaqonallarının uzunluqları cəmini tapın.',
  '[{"key": "A", "text": "$18 \\sqrt{3}$ sm"}, {"key": "B", "text": "$54$ sm"}, {"key": "C", "text": "$18 + 18 \\sqrt{3}$ sm"}, {"key": "D", "text": "$36$ sm"}, {"key": "E", "text": "$9 \\sqrt{3} + 18$ sm"}]'::jsonb, 'C', NULL, NULL,
  'Tərəf $3$ sm. Altıbucaqlının $9$ diaqonalı var: $3$ böyük ($6$ sm) və $6$ kiçik ($3\sqrt3$ sm). Cəm: $18+18\sqrt3$ sm.',
  2025, 'I', 163, 18)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0015 | əsas: 2025 toplu, I hissə, səh.163 №19
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0015', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'closed',
  'Qabarıq $9$-bucaqlının daxili bucaqlarından ən çoxu neçəsi düz bucaq ola bilər?',
  '[{"key": "A", "text": "$5$"}, {"key": "B", "text": "$2$"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$9$"}, {"key": "E", "text": "$4$"}]'::jsonb, 'C', NULL, NULL,
  'Xarici bucaqların cəmi $360^\circ$-dir. Düz daxili bucağa $90^\circ$-li xarici bucaq uyğundur. $4$ düz bucaq olsa, onların xarici bucaqları artıq $360^\circ$ edər və qalan $5$ xarici bucaq üçün yer qalmaz. Deməli ən çoxu $3$.',
  2025, 'I', 163, 19)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0016 | əsas: 2025 toplu, I hissə, səh.163 №20
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'closed',
  'Perimetri $144$ və daxili bucaqlarının cəmi $1440^\circ$ olan düzgün çoxbucaqlının tərəfinin uzunluğunu tapın.',
  '[{"key": "A", "text": "$16$"}, {"key": "B", "text": "$12$"}, {"key": "C", "text": "$14{,}4$"}, {"key": "D", "text": "$14$"}, {"key": "E", "text": "$18$"}]'::jsonb, 'C', NULL, NULL,
  '$180^\circ(n-2)=1440^\circ\Rightarrow n=10$. Tərəf $144:10=14{,}4$.',
  2025, 'I', 163, 20)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0017 | əsas: 2025 toplu, I hissə, səh.163 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'open',
  'Hər bir xarici bucağı $24^\circ$ olan düzgün çoxbucaqlının bir təpəsindən çıxan diaqonallarının sayını tapın.',
  NULL, NULL, NULL, '12',
  '$n=\dfrac{360^\circ}{24^\circ}=15$; bir təpədən $15-3=12$ diaqonal.',
  2025, 'I', 163, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0018 | əsas: 2025 toplu, I hissə, səh.163 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'open',
  'Hər bir xarici bucağı $40^\circ$ olan düzgün çoxbucaqlının bir təpəsindən çıxan diaqonallarının sayını tapın.',
  NULL, NULL, NULL, '6',
  '$n=9$; $9-3=6$.',
  2025, 'I', 163, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0019 | əsas: 2025 toplu, I hissə, səh.163 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'open',
  'Daxili bucağı xarici bucağından $7$ dəfə böyük olan düzgün çoxbucaqlının neçə tərəfi var?',
  NULL, NULL, NULL, '16',
  '$\alpha+7\alpha=180^\circ\Rightarrow\alpha=22{,}5^\circ$ (xarici bucaq). $n=\dfrac{360^\circ}{22{,}5^\circ}=16$.',
  2025, 'I', 163, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0020 | əsas: 2025 toplu, I hissə, səh.163 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'open',
  'Daxili bucağı xarici bucağından $4$ dəfə böyük olan düzgün çoxbucaqlının neçə tərəfi var?',
  NULL, NULL, NULL, '10',
  'Xarici bucaq $\dfrac{180^\circ}{5}=36^\circ$; $n=10$.',
  2025, 'I', 163, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0021 | əsas: 2025 toplu, I hissə, səh.163 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'open',
  'Qabarıq beşbucaqlının daxili bucaqlarından biri düz, qalanları isə $3:4:5:6$ nisbətindədir. Ən kiçik daxili bucağı tapın.',
  NULL, NULL, NULL, '75',
  'Qalan dörd bucağın cəmi $540^\circ-90^\circ=450^\circ$; bir hissə $450^\circ:18=25^\circ$. Bucaqlar $75^\circ,100^\circ,125^\circ,150^\circ$; ən kiçiyi $75^\circ$ ($90^\circ$-dən də kiçikdir).',
  2025, 'I', 163, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0022 | əsas: 2025 toplu, I hissə, səh.163 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'open',
  'Qabarıq altıbucaqlının daxili bucaqlarından üçü $130^\circ$, $140^\circ$ və $150^\circ$, qalanları isə $1:2:3$ nisbətindədir. Bu altıbucaqlının ən kiçik bucağını tapın.',
  NULL, NULL, NULL, '50',
  'Cəm $720^\circ$; qalan üç bucaq $300^\circ$: $50^\circ,100^\circ,150^\circ$. Ən kiçiyi $50^\circ$.',
  2025, 'I', 163, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0023 | əsas: 2025 toplu, I hissə, səh.163 №27
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'open',
  'Diaqonallarının sayı $35$ olan qabarıq çoxbucaqlının bir təpəsindən çıxan diaqonalların sayını tapın.',
  NULL, NULL, NULL, '7',
  '$\dfrac{n(n-3)}{2}=35\Rightarrow n^2-3n-70=0\Rightarrow n=10$. Bir təpədən $7$ diaqonal.',
  2025, 'I', 163, 27)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0024 | əsas: 2025 toplu, I hissə, səh.163 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'open',
  'Diaqonallarının sayı $54$ olan qabarıq çoxbucaqlının bir təpəsindən çıxan diaqonalların sayını tapın.',
  NULL, NULL, NULL, '9',
  '$n(n-3)=108\Rightarrow n=12$; $12-3=9$.',
  2025, 'I', 163, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0025 | əsas: 2025 toplu, I hissə, səh.163 №34
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0025', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'matching',
  'Düzgün çoxbucaqlılar üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "Daxili bucaqlarının cəmi $1980^\\circ$-yə bərabərdir"}, {"key": "2", "text": "Xarici bucağı daxili bucağından $3$ dəfə kiçikdir"}, {"key": "3", "text": "Bir daxili bucağı $150^\\circ$-yə bərabərdir"}], "right": [{"key": "a", "text": "diaqonallarının sayı $65$-dir"}, {"key": "b", "text": "diaqonallarının sayı $54$-dür"}, {"key": "c", "text": "diaqonallarının sayı $20$-dir"}, {"key": "d", "text": "tərəflərinin sayı $15$-dir"}, {"key": "e", "text": "tərəflərinin sayı $12$-dir"}]}'::jsonb, NULL, '{"1": ["a"], "2": ["c"], "3": ["b", "e"]}'::jsonb, NULL,
  '1) $180^\circ(n-2)=1980^\circ\Rightarrow n=13$; diaqonallar $\dfrac{13\cdot10}{2}=65$. 2) Xarici $x$, daxili $3x$: $4x=180^\circ$, $x=45^\circ$, $n=8$; diaqonallar $\dfrac{8\cdot5}{2}=20$. 3) Xarici bucaq $30^\circ$, $n=12$; diaqonallar $\dfrac{12\cdot9}{2}=54$.',
  2025, 'I', 163, 34)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0026 | əsas: 2025 toplu, I hissə, səh.164 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Paraleloqram, onun xassələri və əlamətləri'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ paraleloqramında $\angle A=4x$ və $\angle D=5x$ olarsa, $C$ bucağını tapın.',
  '[{"key": "A", "text": "$40^\\circ$"}, {"key": "B", "text": "$100^\\circ$"}, {"key": "C", "text": "$20^\\circ$"}, {"key": "D", "text": "$60^\\circ$"}, {"key": "E", "text": "$80^\\circ$"}]'::jsonb, 'E', NULL, NULL,
  'Qonşu bucaqlar: $4x+5x=180^\circ\Rightarrow x=20^\circ$. $\angle C=\angle A=80^\circ$.',
  2025, 'I', 164, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0027 | əsas: 2025 toplu, I hissə, səh.164 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0027', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Paraleloqram, onun xassələri və əlamətləri'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ paraleloqramında $\angle A=5x$, $\angle B=7x$ olarsa, $D$ bucağını tapın.',
  '[{"key": "A", "text": "$90^\\circ$"}, {"key": "B", "text": "$75^\\circ$"}, {"key": "C", "text": "$120^\\circ$"}, {"key": "D", "text": "$105^\\circ$"}, {"key": "E", "text": "$15^\\circ$"}]'::jsonb, 'D', NULL, NULL,
  '$5x+7x=180^\circ\Rightarrow x=15^\circ$, $\angle A=75^\circ$. $\angle D=180^\circ-75^\circ=105^\circ$.',
  2025, 'I', 164, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0028 | əsas: 2025 toplu, I hissə, səh.164 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0028', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Paraleloqram, onun xassələri və əlamətləri'), 'original', 'own', 'az', 'draft', 'closed',
  'Paraleloqramın bir tərəfinə bitişik bucaqları $4:5$ nisbətində olarsa, onun bucaqlarını tapın.',
  '[{"key": "A", "text": "$75^\\circ;\\ 105^\\circ;\\ 75^\\circ;\\ 105^\\circ$"}, {"key": "B", "text": "$80^\\circ;\\ 100^\\circ;\\ 80^\\circ;\\ 100^\\circ$"}, {"key": "C", "text": "$72^\\circ;\\ 108^\\circ;\\ 72^\\circ;\\ 108^\\circ$"}, {"key": "D", "text": "$40^\\circ;\\ 50^\\circ;\\ 40^\\circ;\\ 50^\\circ$"}, {"key": "E", "text": "$60^\\circ;\\ 120^\\circ;\\ 60^\\circ;\\ 120^\\circ$"}]'::jsonb, 'B', NULL, NULL,
  'Bitişik bucaqların cəmi $180^\circ$: $180^\circ:9=20^\circ$; bucaqlar $80^\circ$ və $100^\circ$, qarşı bucaqlar bərabərdir.',
  2025, 'I', 164, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0029 | əsas: 2025 toplu, I hissə, səh.164 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0029', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Paraleloqram, onun xassələri və əlamətləri'), 'original', 'own', 'az', 'draft', 'closed',
  'Paraleloqramın bir tərəfinə bitişik bucaqları $2:7$ nisbətində olarsa, onun bucaqlarını tapın.',
  '[{"key": "A", "text": "$45^\\circ;\\ 135^\\circ;\\ 45^\\circ;\\ 135^\\circ$"}, {"key": "B", "text": "$20^\\circ;\\ 70^\\circ;\\ 20^\\circ;\\ 70^\\circ$"}, {"key": "C", "text": "$50^\\circ;\\ 130^\\circ;\\ 50^\\circ;\\ 130^\\circ$"}, {"key": "D", "text": "$40^\\circ;\\ 140^\\circ;\\ 40^\\circ;\\ 140^\\circ$"}, {"key": "E", "text": "$36^\\circ;\\ 144^\\circ;\\ 36^\\circ;\\ 144^\\circ$"}]'::jsonb, 'D', NULL, NULL,
  '$180^\circ:9=20^\circ$; bucaqlar $40^\circ$ və $140^\circ$.',
  2025, 'I', 164, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0030 | əsas: 2025 toplu, I hissə, səh.164 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0030', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Paraleloqram, onun xassələri və əlamətləri'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ paraleloqramında $\angle D-\angle A=36^\circ$ olarsa, $\angle A$-nı tapın.',
  '[{"key": "A", "text": "$72^\\circ$"}, {"key": "B", "text": "$36^\\circ$"}, {"key": "C", "text": "$90^\\circ$"}, {"key": "D", "text": "$54^\\circ$"}, {"key": "E", "text": "$108^\\circ$"}]'::jsonb, 'A', NULL, NULL,
  '$\angle A+\angle D=180^\circ$, $\angle D-\angle A=36^\circ\Rightarrow\angle A=72^\circ$.',
  2025, 'I', 164, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0031 | əsas: 2025 toplu, I hissə, səh.164 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0031', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Paraleloqram, onun xassələri və əlamətləri'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ paraleloqramında $\angle D-\angle A=50^\circ$ olarsa, $\angle D$-ni tapın.',
  '[{"key": "A", "text": "$105^\\circ$"}, {"key": "B", "text": "$115^\\circ$"}, {"key": "C", "text": "$130^\\circ$"}, {"key": "D", "text": "$125^\\circ$"}, {"key": "E", "text": "$65^\\circ$"}]'::jsonb, 'B', NULL, NULL,
  '$\angle A+\angle D=180^\circ$, $\angle D-\angle A=50^\circ\Rightarrow\angle D=115^\circ$.',
  2025, 'I', 164, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0032 | əsas: 2025 toplu, I hissə, səh.164 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0032', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Paraleloqram, onun xassələri və əlamətləri'), 'original', 'own', 'az', 'draft', 'closed',
  'Bərabəryanlı üçbucağın yan tərəfi $7$ sm-dir. Bu üçbucağın oturacağı üzərində götürülmüş nöqtədən yan tərəflərə paralel iki düz xətt çəkilmişdir. Alınan paraleloqramın perimetrini tapın.',
  '[{"key": "A", "text": "$3{,}5$ sm"}, {"key": "B", "text": "$21$ sm"}, {"key": "C", "text": "$14$ sm"}, {"key": "D", "text": "$28$ sm"}, {"key": "E", "text": "$7$ sm"}]'::jsonb, 'C', NULL, NULL,
  'Paralel düz xətlər bərabəryanlı üçbucaqlar ayırır: paraleloqramın bir tərəfi yan tərəfin bir hissəsinə, digəri qalan hissəsinə bərabər olur. Perimetr $2(x+(7-x))=14$ sm.',
  2025, 'I', 164, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0033 | əsas: 2025 toplu, I hissə, səh.164 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0033', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Paraleloqram, onun xassələri və əlamətləri'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ paraleloqramında $B$ təpəsindən $AD$ tərəfinə çəkilən hündürlük bu tərəfi yarıya bölür. $AB=6$ və $P_{\triangle ABD}=21$ olarsa, $AD$-ni tapın.',
  '[{"key": "A", "text": "$10$"}, {"key": "B", "text": "$9$"}, {"key": "C", "text": "$7$"}, {"key": "D", "text": "$12$"}, {"key": "E", "text": "$6$"}]'::jsonb, 'B', NULL, NULL,
  '$B$-dən çəkilən hündürlük $ABD$ üçbucağında həm də mediandır, ona görə $BD=AB=6$. $AD=21-6-6=9$.',
  2025, 'I', 164, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0034 | əsas: 2025 toplu, I hissə, səh.164 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0034', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Paraleloqram, onun xassələri və əlamətləri'), 'original', 'own', 'az', 'draft', 'closed',
  'Perimetri $50$ sm olan paraleloqram diaqonalları ilə $4$ üçbucağa bölünmüşdür. İki qonşu üçbucağın perimetrləri fərqi $7$ sm-ə bərabərdir. Paraleloqramın tərəflərinin uzunluqlarını tapın.',
  '[{"key": "A", "text": "$18$ sm; $7$ sm"}, {"key": "B", "text": "$16$ sm; $9$ sm"}, {"key": "C", "text": "$14$ sm; $11$ sm"}, {"key": "D", "text": "$17$ sm; $8$ sm"}, {"key": "E", "text": "$15$ sm; $10$ sm"}]'::jsonb, 'B', NULL, NULL,
  'Qonşu üçbucaqların diaqonal yarımları ortaqdır, perimetrləri fərqi tərəflərin fərqidir: $a-b=7$, $a+b=25\Rightarrow a=16$, $b=9$ sm.',
  2025, 'I', 164, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0035 | əsas: 2025 toplu, I hissə, səh.164 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0035', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Paraleloqram, onun xassələri və əlamətləri'), 'original', 'own', 'az', 'draft', 'closed',
  'Perimetri $18$ sm olan paraleloqramın xarici oblastında olmaqla onun tərəfləri üzərində qurulmuş rombların perimetrləri cəmini tapın.',
  '[{"key": "A", "text": "$144$ sm"}, {"key": "B", "text": "$72$ sm"}, {"key": "C", "text": "$90$ sm"}, {"key": "D", "text": "$54$ sm"}, {"key": "E", "text": "$36$ sm"}]'::jsonb, 'B', NULL, NULL,
  'Romb tərəfi paraleloqramın tərəfinə bərabərdir. Rombların perimetrləri: $4a+4b+4a+4b=4\cdot2(a+b)=4\cdot18=72$ sm.',
  2025, 'I', 164, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0036 | əsas: 2025 toplu, I hissə, səh.164 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0036', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Paraleloqram, onun xassələri və əlamətləri'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ paraleloqramında $A$ və $D$ bucaqlarının tənbölənlərinin kəsişmə nöqtəsi paraleloqramın daxilində yerləşir. $AB=11$ və $AD=16$ olarsa, bu tənbölənlərin qarşı tərəf ilə kəsişmə nöqtələri arasındakı məsafəni tapın.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$5$"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$6$"}, {"key": "E", "text": "$8$"}]'::jsonb, 'D', NULL, NULL,
  '$A$-nın tənböləni $BC$-ni $K$-da kəsir: $ABK$ bərabəryanlıdır, $BK=AB=11$. Eyni qayda ilə $CL=CD=11$. Kəsişmə daxildə olduğundan $K$ və $L$ bir-birini keçir: $KL=BK+CL-BC=22-16=6$.',
  2025, 'I', 164, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0037 | əsas: 2025 toplu, I hissə, səh.165 №19
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0037', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Paraleloqram, onun xassələri və əlamətləri'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ paraleloqramında $DE\perp BC$ ($E\in BC$), $\angle A=60^\circ$, $AB=10$ və $BE=4$ olarsa, paraleloqramın perimetrini tapın.',
  '[{"key": "A", "text": "$40$"}, {"key": "B", "text": "$38$"}, {"key": "C", "text": "$28$"}, {"key": "D", "text": "$34$"}, {"key": "E", "text": "$48$"}]'::jsonb, 'B', NULL, NULL,
  '$\angle C=\angle A=60^\circ$, $CD=AB=10$. $DEC$ düzbucaqlı üçbucağında $EC=CD\cos60^\circ=5$. $BC=4+5=9$. $P=2(10+9)=38$.',
  2025, 'I', 165, 19)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0038 | əsas: 2025 toplu, I hissə, səh.165 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0038', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Paraleloqram, onun xassələri və əlamətləri'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ paraleloqramında $AC$ diaqonalının uzunluğu $14$ olub, $AD$ tərəfi ilə $30^\circ$-li bucaq əmələ gətirir. $B$ təpəsindən $AD$-yə qədər olan məsafəni tapın.',
  '[{"key": "A", "text": "$7$"}, {"key": "B", "text": "$7 \\sqrt{3}$"}, {"key": "C", "text": "$14$"}, {"key": "D", "text": "$7 \\sqrt{2}$"}, {"key": "E", "text": "$3{,}5$"}]'::jsonb, 'A', NULL, NULL,
  '$C$-dən $AD$-yə məsafə $AC\sin30^\circ=7$. $BC\parallel AD$ olduğundan $B$-dən $AD$-yə məsafə də $7$-dir.',
  2025, 'I', 165, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0039 | əsas: 2025 toplu, I hissə, səh.165 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0039', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Paraleloqram, onun xassələri və əlamətləri'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ paraleloqramının $B$ təpəsindən $AD$ və $CD$ tərəflərinə uyğun olaraq $BN$ və $BM$ hündürlükləri çəkilmişdir. $\angle BAD=50^\circ$ olarsa, $\angle MBN$-in dərəcə ölçüsünü tapın.',
  '[{"key": "A", "text": "$90^\\circ$"}, {"key": "B", "text": "$25^\\circ$"}, {"key": "C", "text": "$50^\\circ$"}, {"key": "D", "text": "$40^\\circ$"}, {"key": "E", "text": "$130^\\circ$"}]'::jsonb, 'C', NULL, NULL,
  '$BNDM$ dördbucaqlısında $N$ və $M$ bucaqları düzdür, $\angle D=180^\circ-50^\circ=130^\circ$. $\angle MBN=360^\circ-90^\circ-90^\circ-130^\circ=50^\circ$.',
  2025, 'I', 165, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0040 | əsas: 2025 toplu, I hissə, səh.165 №27
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0040', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Paraleloqram, onun xassələri və əlamətləri'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ paraleloqramında $N$ — $CD$-nin orta nöqtəsidir, $BN$ parçası $AC$ diaqonalını $M$ nöqtəsində kəsir. $MC=5$ olarsa, $AC$-ni tapın.',
  '[{"key": "A", "text": "$12$"}, {"key": "B", "text": "$10$"}, {"key": "C", "text": "$7{,}5$"}, {"key": "D", "text": "$15$"}, {"key": "E", "text": "$20$"}]'::jsonb, 'D', NULL, NULL,
  '$O$ — diaqonalların kəsişməsi. $BCD$ üçbucağında $BN$ və $CO$ medianlardır, $M$ medianların kəsişməsidir: $MC=\dfrac23CO=\dfrac13AC$. $AC=3\cdot5=15$.',
  2025, 'I', 165, 27)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0041 | əsas: 2025 toplu, I hissə, səh.165 №31
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0041', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Paraleloqram, onun xassələri və əlamətləri'), 'original', 'own', 'az', 'draft', 'written',
  '$ABCD$ paraleloqramının $A$ və $D$ bucaqlarının tənbölənləri $BC$ tərəfi üzərində $M$ nöqtəsində kəsişir. $AMD$ üçbucağının $M$ təpəsindən çəkilən medianı $8$ olarsa, paraleloqramın perimetrini tapın.',
  NULL, NULL, NULL, '48',
  'Qonşu bucaqların tənbölənləri perpendikulyardır: $\angle AMD=90^\circ$, median hipotenuzun yarısıdır: $AD=16$. $ABM$ və $DCM$ bərabəryanlıdır: $AB=BM$, $CD=CM$, ona görə $BC=2AB\Rightarrow AB=8$. $P=2(8+16)=48$.',
  2025, 'I', 165, 31)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0042 | əsas: 2025 toplu, I hissə, səh.166 №35
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0042', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Paraleloqram, onun xassələri və əlamətləri'), 'original', 'own', 'az', 'draft', 'written',
  'Perimetri $60$ olan $ABCD$ paraleloqramında $BAD$ bucağının tənböləni $BC$ tərəfini $B$ nöqtəsindən başlayaraq $3:4$ nisbətində bölür. Paraleloqramın kiçik tərəfini tapın.',
  NULL, NULL, NULL, '9',
  'Tənbölən $BC$-ni $K$-da kəsir: $ABK$ bərabəryanlıdır, $AB=BK=3t$, $KC=4t$, $BC=7t$. $2(3t+7t)=60\Rightarrow t=3$. Kiçik tərəf $AB=9$.',
  2025, 'I', 166, 35)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0043 | əsas: 2025 toplu, I hissə, səh.166 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0043', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Düzbucaqlı, kvadrat, romb və onların xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  'Perimetri $36$ sm, iti bucağı $60^\circ$ olan rombun kiçik diaqonalının uzunluğunu tapın.',
  '[{"key": "A", "text": "$36$ sm"}, {"key": "B", "text": "$18$ sm"}, {"key": "C", "text": "$9$ sm"}, {"key": "D", "text": "$4{,}5$ sm"}, {"key": "E", "text": "$9 \\sqrt{3}$ sm"}]'::jsonb, 'C', NULL, NULL,
  'Tərəf $9$ sm. Kiçik diaqonal rombu iki bərabərtərəfli üçbucağa ayırır: $9$ sm.',
  2025, 'I', 166, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0044 | əsas: 2025 toplu, I hissə, səh.166 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0044', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Düzbucaqlı, kvadrat, romb və onların xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  'Rombun $60^\circ$-li bucağının qarşısındakı diaqonalı $13$ sm olarsa, onun perimetrini tapın.',
  '[{"key": "A", "text": "$39$ sm"}, {"key": "B", "text": "$26$ sm"}, {"key": "C", "text": "$13$ sm"}, {"key": "D", "text": "$52$ sm"}, {"key": "E", "text": "$65$ sm"}]'::jsonb, 'D', NULL, NULL,
  'Bu diaqonal bərabərtərəfli üçbucağın tərəfidir, rombun tərəfi $13$ sm. $P=52$ sm.',
  2025, 'I', 166, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0045 | əsas: 2025 toplu, I hissə, səh.166 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0045', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Düzbucaqlı, kvadrat, romb və onların xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  'Rombun perimetri $24$ sm, hündürlüyü isə $3\sqrt2$ sm olarsa, onun iti bucağını tapın.',
  '[{"key": "A", "text": "$15^\\circ$"}, {"key": "B", "text": "$75^\\circ$"}, {"key": "C", "text": "$30^\\circ$"}, {"key": "D", "text": "$60^\\circ$"}, {"key": "E", "text": "$45^\\circ$"}]'::jsonb, 'E', NULL, NULL,
  'Tərəf $6$ sm. $\sin\alpha=\dfrac{h}{a}=\dfrac{3\sqrt2}{6}=\dfrac{\sqrt2}{2}\Rightarrow\alpha=45^\circ$.',
  2025, 'I', 166, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0046 | əsas: 2025 toplu, I hissə, səh.166 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0046', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Düzbucaqlı, kvadrat, romb və onların xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  'Rombun perimetri $48$ sm, iti bucağı $30^\circ$-dir. Rombun hündürlüyünü tapın.',
  '[{"key": "A", "text": "$6$ sm"}, {"key": "B", "text": "$4$ sm"}, {"key": "C", "text": "$12$ sm"}, {"key": "D", "text": "$8$ sm"}, {"key": "E", "text": "$3$ sm"}]'::jsonb, 'A', NULL, NULL,
  'Tərəf $12$; $h=12\sin30^\circ=6$ sm.',
  2025, 'I', 166, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0047 | əsas: 2025 toplu, I hissə, səh.166 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0047', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Düzbucaqlı, kvadrat, romb və onların xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  'İki kvadratın perimetrləri nisbəti $2:5$ kimidir. Kiçik kvadratın tərəfi $6$ sm-dir. Böyük kvadratın tərəfini tapın.',
  '[{"key": "A", "text": "$12$ sm"}, {"key": "B", "text": "$15$ sm"}, {"key": "C", "text": "$10$ sm"}, {"key": "D", "text": "$30$ sm"}, {"key": "E", "text": "$7{,}5$ sm"}]'::jsonb, 'B', NULL, NULL,
  'Perimetrlərin nisbəti tərəflərin nisbətinə bərabərdir: $6\cdot\dfrac52=15$ sm.',
  2025, 'I', 166, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0048 | əsas: 2025 toplu, I hissə, səh.166 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0048', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Düzbucaqlı, kvadrat, romb və onların xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  'Perimetri $46$ sm, tərəflərindən biri isə $8$ sm olan düzbucaqlının diaqonalını tapın.',
  '[{"key": "A", "text": "$13$ sm"}, {"key": "B", "text": "$19$ sm"}, {"key": "C", "text": "$23$ sm"}, {"key": "D", "text": "$15$ sm"}, {"key": "E", "text": "$17$ sm"}]'::jsonb, 'E', NULL, NULL,
  'Digər tərəf $23-8=15$ sm; diaqonal $\sqrt{64+225}=17$ sm.',
  2025, 'I', 166, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0049 | əsas: 2025 toplu, I hissə, səh.166 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0049', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Düzbucaqlı, kvadrat, romb və onların xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  'Kvadratın diaqonalı $9$ sm-dir. Kvadratın tərəflərinin orta nöqtələrini ardıcıl birləşdirən parçaların yaratdığı dördbucaqlının perimetrini tapın.',
  '[{"key": "A", "text": "$9$ sm"}, {"key": "B", "text": "$36$ sm"}, {"key": "C", "text": "$12$ sm"}, {"key": "D", "text": "$9 \\sqrt{2}$ sm"}, {"key": "E", "text": "$18$ sm"}]'::jsonb, 'E', NULL, NULL,
  'Hər parça diaqonala paralel orta xətdir: $\dfrac92$. $P=4\cdot4{,}5=18$ sm.',
  2025, 'I', 166, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0050 | əsas: 2025 toplu, I hissə, səh.166 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0050', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Düzbucaqlı, kvadrat, romb və onların xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  'Kvadratın tərəfi $8$ sm-dir. Onun tərəflərinin orta nöqtələrinin ardıcıl birləşdirilməsindən alınan dördbucaqlının perimetrini tapın.',
  '[{"key": "A", "text": "$16 \\sqrt{2}$ sm"}, {"key": "B", "text": "$16$ sm"}, {"key": "C", "text": "$8 \\sqrt{2}$ sm"}, {"key": "D", "text": "$32 \\sqrt{2}$ sm"}, {"key": "E", "text": "$32$ sm"}]'::jsonb, 'A', NULL, NULL,
  'Diaqonal $8\sqrt2$; yeni kvadratın tərəfi $4\sqrt2$, $P=16\sqrt2$ sm.',
  2025, 'I', 166, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0051 | əsas: 2025 toplu, I hissə, səh.169 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0051', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ trapesiyasında $MK$ orta xətdir. $MK=9$ sm, $BC=5$ sm olarsa, $AD$-ni tapın.',
  '[{"key": "A", "text": "$11$ sm"}, {"key": "B", "text": "$4$ sm"}, {"key": "C", "text": "$13$ sm"}, {"key": "D", "text": "$14$ sm"}, {"key": "E", "text": "$7$ sm"}]'::jsonb, 'C', NULL, NULL,
  '$MK=\dfrac{AD+BC}{2}\Rightarrow AD=18-5=13$ sm.',
  2025, 'I', 169, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0052 | əsas: 2025 toplu, I hissə, səh.169 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0052', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Orta xətti $9$ sm, yan tərəfi $7$ sm olan bərabəryanlı trapesiyanın perimetrini tapın.',
  '[{"key": "A", "text": "$18$ sm"}, {"key": "B", "text": "$25$ sm"}, {"key": "C", "text": "$23$ sm"}, {"key": "D", "text": "$16$ sm"}, {"key": "E", "text": "$32$ sm"}]'::jsonb, 'E', NULL, NULL,
  'Oturacaqların cəmi $18$; $P=18+14=32$ sm.',
  2025, 'I', 169, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0053 | əsas: 2025 toplu, I hissə, səh.169 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0053', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Bərabəryanlı trapesiyada kor bucaq təpəsindən çəkilmiş hündürlük böyük oturacağı $5$ sm və $31$ sm uzunluğunda parçalara bölür. Trapesiyanın kiçik oturacağını tapın.',
  '[{"key": "A", "text": "$18$ sm"}, {"key": "B", "text": "$26$ sm"}, {"key": "C", "text": "$36$ sm"}, {"key": "D", "text": "$31$ sm"}, {"key": "E", "text": "$13$ sm"}]'::jsonb, 'B', NULL, NULL,
  'Kiçik parça $\dfrac{a-b}{2}=5$, böyük parça $\dfrac{a+b}{2}=31$. Çıxsaq: $b=26$ sm.',
  2025, 'I', 169, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0054 | əsas: 2025 toplu, I hissə, səh.169 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0054', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Yan tərəfi $8$ sm olan bərabəryanlı trapesiyanın diaqonalı iti bucağının tənbölənidir. Trapesiyanın kiçik oturacağını tapın.',
  '[{"key": "A", "text": "$6$ sm"}, {"key": "B", "text": "$4$ sm"}, {"key": "C", "text": "$12$ sm"}, {"key": "D", "text": "$8$ sm"}, {"key": "E", "text": "$16$ sm"}]'::jsonb, 'D', NULL, NULL,
  '$\angle CAD=\angle BAC$ (tənbölən) və $\angle CAD=\angle BCA$ (çarpaz bucaqlar), ona görə $ABC$ bərabəryanlıdır: $BC=AB=8$ sm.',
  2025, 'I', 169, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0055 | əsas: 2025 toplu, I hissə, səh.169 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0055', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Orta xətti $21$ sm, oturacaqlarının nisbəti $2:5$ olan trapesiyanın kiçik oturacağını tapın.',
  '[{"key": "A", "text": "$15$ sm"}, {"key": "B", "text": "$12$ sm"}, {"key": "C", "text": "$21$ sm"}, {"key": "D", "text": "$9$ sm"}, {"key": "E", "text": "$30$ sm"}]'::jsonb, 'B', NULL, NULL,
  '$2t+5t=42\Rightarrow t=6$; kiçik oturacaq $12$ sm.',
  2025, 'I', 169, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0056 | əsas: 2025 toplu, I hissə, səh.169 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0056', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Orta xətti $18$ sm, oturacaqlarının nisbəti isə $5:4$ olan trapesiyanın böyük oturacağını tapın.',
  '[{"key": "A", "text": "$9$ sm"}, {"key": "B", "text": "$16$ sm"}, {"key": "C", "text": "$20$ sm"}, {"key": "D", "text": "$24$ sm"}, {"key": "E", "text": "$18$ sm"}]'::jsonb, 'C', NULL, NULL,
  '$9t=36\Rightarrow t=4$; böyük oturacaq $20$ sm.',
  2025, 'I', 169, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0057 | əsas: 2025 toplu, I hissə, səh.169 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0057', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Bərabəryanlı trapesiyanın diaqonalı onun iti bucağını $20^\circ$ və $50^\circ$-li iki bucağa ayırır. Trapesiyanın böyük bucağını hesablayın.',
  '[{"key": "A", "text": "$140^\\circ$"}, {"key": "B", "text": "$70^\\circ$"}, {"key": "C", "text": "$130^\\circ$"}, {"key": "D", "text": "$100^\\circ$"}, {"key": "E", "text": "$110^\\circ$"}]'::jsonb, 'E', NULL, NULL,
  'İti bucaq $70^\circ$; kor bucaq $180^\circ-70^\circ=110^\circ$.',
  2025, 'I', 169, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0058 | əsas: 2025 toplu, I hissə, səh.169 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0058', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Bərabəryanlı trapesiyanın diaqonalı onun kor bucağını $40^\circ$ və $90^\circ$-li iki bucağa ayırır. Trapesiyanın kiçik bucağını hesablayın.',
  '[{"key": "A", "text": "$40^\\circ$"}, {"key": "B", "text": "$90^\\circ$"}, {"key": "C", "text": "$130^\\circ$"}, {"key": "D", "text": "$65^\\circ$"}, {"key": "E", "text": "$50^\\circ$"}]'::jsonb, 'E', NULL, NULL,
  'Kor bucaq $130^\circ$, iti bucaq $50^\circ$.',
  2025, 'I', 169, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0059 | əsas: 2025 toplu, I hissə, səh.169 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0059', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Trapesiyanın diaqonalı onun orta xəttini $7$ sm və $15$ sm olan hissələrə bölür. Trapesiyanın böyük oturacağını tapın.',
  '[{"key": "A", "text": "$30$ sm"}, {"key": "B", "text": "$15$ sm"}, {"key": "C", "text": "$44$ sm"}, {"key": "D", "text": "$14$ sm"}, {"key": "E", "text": "$22$ sm"}]'::jsonb, 'A', NULL, NULL,
  'Orta xəttin hissələri diaqonalın ayırdığı üçbucaqların orta xətləridir: oturacaqlar $14$ və $30$ sm.',
  2025, 'I', 169, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0060 | əsas: 2025 toplu, I hissə, səh.169 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0060', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ bərabəryanlı trapesiyasında ($AD\parallel BC$) $AC$ diaqonalı $CD$ yan tərəfinə perpendikulyardır və $AD$ tərəfi ilə $40^\circ$-li bucaq əmələ gətirir. $\angle BAC$-ni tapın.',
  '[{"key": "A", "text": "$20^\\circ$"}, {"key": "B", "text": "$10^\\circ$"}, {"key": "C", "text": "$40^\\circ$"}, {"key": "D", "text": "$50^\\circ$"}, {"key": "E", "text": "$30^\\circ$"}]'::jsonb, 'B', NULL, NULL,
  '$ACD$ üçbucağında $\angle D=90^\circ-40^\circ=50^\circ$; bərabəryanlı olduğundan $\angle A=50^\circ$. $\angle BAC=50^\circ-40^\circ=10^\circ$.',
  2025, 'I', 169, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0061 | əsas: 2025 toplu, I hissə, səh.169 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0061', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ trapesiyasında ($AB\parallel CD$) $AC$ diaqonalı trapesiyanın orta xəttini $5$ sm və $16$ sm-ə bərabər hissələrə bölür. Trapesiyanın oturacaqlarını tapın.',
  '[{"key": "A", "text": "$26$ sm və $16$ sm"}, {"key": "B", "text": "$42$ sm və $10$ sm"}, {"key": "C", "text": "$21$ sm və $5$ sm"}, {"key": "D", "text": "$32$ sm və $10$ sm"}, {"key": "E", "text": "$16$ sm və $5$ sm"}]'::jsonb, 'D', NULL, NULL,
  'Hissələr müvafiq üçbucaqların orta xətləridir: oturacaqlar $2\cdot16=32$ və $2\cdot5=10$ sm.',
  2025, 'I', 169, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0062 | əsas: 2025 toplu, I hissə, səh.169 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0062', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Bərabəryanlı trapesiyanın yan tərəfi onun orta xəttinə bərabərdir. Trapesiyanın perimetri $60$ sm olarsa, onun yan tərəfini tapın.',
  '[{"key": "A", "text": "$30$ sm"}, {"key": "B", "text": "$12$ sm"}, {"key": "C", "text": "$20$ sm"}, {"key": "D", "text": "$10$ sm"}, {"key": "E", "text": "$15$ sm"}]'::jsonb, 'E', NULL, NULL,
  'Oturacaqların cəmi orta xəttin iki mislidir: $2l$. $P=2l+2l=4l=60\Rightarrow l=15$ sm.',
  2025, 'I', 169, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0063 | əsas: 2025 toplu, I hissə, səh.169 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0063', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Trapesiyanın orta xətti onun kiçik oturacağından $4{,}5$ sm böyükdür. Orta xəttin böyük oturacaqdan nə qədər kiçik olduğunu tapın.',
  '[{"key": "A", "text": "$2{,}25$ sm"}, {"key": "B", "text": "$5$ sm"}, {"key": "C", "text": "$4{,}5$ sm"}, {"key": "D", "text": "$9$ sm"}, {"key": "E", "text": "$3$ sm"}]'::jsonb, 'C', NULL, NULL,
  '$m-b=\dfrac{a-b}{2}=a-m$. Deməli fərq eynidir: $4{,}5$ sm.',
  2025, 'I', 169, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0064 | əsas: 2025 toplu, I hissə, səh.170 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0064', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Bərabəryanlı trapesiyanın oturacaqları $21$ sm və $11$ sm, diaqonalı $20$ sm-dir. Onun perimetrini tapın.',
  '[{"key": "A", "text": "$62$ sm"}, {"key": "B", "text": "$48$ sm"}, {"key": "C", "text": "$52$ sm"}, {"key": "D", "text": "$64$ sm"}, {"key": "E", "text": "$58$ sm"}]'::jsonb, 'E', NULL, NULL,
  'Diaqonalın böyük oturacaq üzərindəki proyeksiyası $\dfrac{21+11}{2}=16$; hündürlük $\sqrt{400-256}=12$. Yan tərəfin proyeksiyası $\dfrac{21-11}{2}=5$; yan tərəf $\sqrt{144+25}=13$. $P=21+11+26=58$ sm.',
  2025, 'I', 170, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0065 | əsas: 2025 toplu, I hissə, səh.170 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0065', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Bərabəryanlı trapesiyanın kor bucaq təpəsindən çəkilmiş hündürlüyü orta xətti $3$ sm və $12$ sm uzunluqda iki parçaya bölür. Böyük oturacağın uzunluğunu tapın.',
  '[{"key": "A", "text": "$30$ sm"}, {"key": "B", "text": "$15$ sm"}, {"key": "C", "text": "$21$ sm"}, {"key": "D", "text": "$9$ sm"}, {"key": "E", "text": "$24$ sm"}]'::jsonb, 'C', NULL, NULL,
  'Orta xətt $m=3+12=15$, ona görə $a+b=30$. Hündürlük orta xətti onun ucundan $\dfrac{a-b}{4}=3$ məsafədə kəsir: $a-b=12$. $a=21$ sm.',
  2025, 'I', 170, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0066 | əsas: 2025 toplu, I hissə, səh.170 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0066', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Trapesiyanın bir oturacağı digərindən $4$ dəfə böyükdür. Bu trapesiyanın orta xətti onun böyük oturacağının hansı hissəsini təşkil edir?',
  '[{"key": "A", "text": "$\\dfrac34$"}, {"key": "B", "text": "$\\dfrac58$"}, {"key": "C", "text": "$\\dfrac12$"}, {"key": "D", "text": "$\\dfrac25$"}, {"key": "E", "text": "$\\dfrac54$"}]'::jsonb, 'B', NULL, NULL,
  'Oturacaqlar $t$ və $4t$, orta xətt $\dfrac{5t}{2}$; nisbət $\dfrac{5t/2}{4t}=\dfrac58$.',
  2025, 'I', 170, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0067 | əsas: 2025 toplu, I hissə, səh.170 №27
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0067', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Trapesiyanın bir oturacağı digərindən $5$ dəfə kiçikdir. Bu trapesiyanın orta xətti kiçik oturacaqdan neçə dəfə böyükdür?',
  '[{"key": "A", "text": "$1{,}5$"}, {"key": "B", "text": "$3$"}, {"key": "C", "text": "$6$"}, {"key": "D", "text": "$2{,}5$"}, {"key": "E", "text": "$5$"}]'::jsonb, 'B', NULL, NULL,
  'Oturacaqlar $t$ və $5t$; orta xətt $3t$, kiçik oturacaqdan $3$ dəfə böyükdür.',
  2025, 'I', 170, 27)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0068 | əsas: 2025 toplu, I hissə, səh.170 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0068', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Bərabəryanlı trapesiyanın oturacaqları $8$ sm və $20$ sm və diaqonalı onun iti bucağını yarıya bölür. Trapesiyanın perimetrini tapın.',
  '[{"key": "A", "text": "$48$ sm"}, {"key": "B", "text": "$40$ sm"}, {"key": "C", "text": "$44$ sm"}, {"key": "D", "text": "$36$ sm"}, {"key": "E", "text": "$52$ sm"}]'::jsonb, 'C', NULL, NULL,
  'Diaqonal iti bucağın tənbölənidirsə, yan tərəf kiçik oturacağa bərabərdir: $8$ sm. $P=8+20+16=44$ sm.',
  2025, 'I', 170, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0069 | əsas: 2025 toplu, I hissə, səh.170 №32
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0069', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Trapesiyanın diaqonalları $9$ sm və $12$ sm olub qarşılıqlı perpendikulyardırlar. Trapesiyanın orta xəttini tapın.',
  '[{"key": "A", "text": "$7{,}5$ sm"}, {"key": "B", "text": "$10{,}5$ sm"}, {"key": "C", "text": "$21$ sm"}, {"key": "D", "text": "$10$ sm"}, {"key": "E", "text": "$15$ sm"}]'::jsonb, 'A', NULL, NULL,
  '$C$-dən $BD$-yə paralel düz xətt çəkək; $AD$ uzantısı ilə alınan üçbucaqda katetlər $9$ və $12$, hipotenuz $a+b=15$. Orta xətt $7{,}5$ sm.',
  2025, 'I', 170, 32)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0070 | əsas: 2025 toplu, I hissə, səh.172 №58
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0070', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'open',
  'Diaqonalları qarşılıqlı perpendikulyar olan düzbucaqlı trapesiyanın oturacaqları $32$ və $2$-dir. Bu trapesiyanın hündürlüyünü tapın.',
  NULL, NULL, NULL, '8',
  'Düzbucaqlı trapesiyada diaqonallar perpendikulyardırsa, $h^2=ab$ (oxşar düzbucaqlı üçbucaqlardan). $h=\sqrt{64}=8$.',
  2025, 'I', 172, 58)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0071 | əsas: 2025 toplu, I hissə, səh.172 №59
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0071', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'open',
  'Diaqonalları qarşılıqlı perpendikulyar olan düzbucaqlı trapesiyanın kiçik oturacağı $3$, hündürlüyü $6$-dır. Bu trapesiyanın böyük oturacağını tapın.',
  NULL, NULL, NULL, '12',
  '$h^2=ab\Rightarrow36=3a\Rightarrow a=12$.',
  2025, 'I', 172, 59)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0072 | əsas: 2025 toplu, I hissə, səh.172 №60
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0072', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'open',
  'Hündürlüyü $6$, iti bucağının tangensi $3$ olan bərabəryanlı trapesiyanın diaqonalı yan tərəfə perpendikulyardır. Trapesiyanın böyük oturacağını tapın.',
  NULL, NULL, NULL, '20',
  '$C$-dən $AD$-yə hündürlük $CK=6$. $\operatorname{tg}D=\dfrac{CK}{KD}=3\Rightarrow KD=2$. $ACD$ düzbucaqlı üçbucağında ($\angle C=90^\circ$) $CK^2=AK\cdot KD\Rightarrow AK=18$. $AD=20$.',
  2025, 'I', 172, 60)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0073 | əsas: 2025 toplu, I hissə, səh.172 №62
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0073', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Oturacaqları $7$ və $25$ olan bərabəryanlı trapesiyanın diaqonalı yan tərəfə perpendikulyardır. Trapesiyanın iti bucağının tangensini tapın.',
  '[{"key": "A", "text": "$\\dfrac45$"}, {"key": "B", "text": "$\\dfrac34$"}, {"key": "C", "text": "$\\dfrac{9}{16}$"}, {"key": "D", "text": "$\\dfrac43$"}, {"key": "E", "text": "$\\dfrac35$"}]'::jsonb, 'D', NULL, NULL,
  '$KD=\dfrac{25-7}{2}=9$, $AK=\dfrac{25+7}{2}=16$. $h=\sqrt{16\cdot9}=12$. $\operatorname{tg}D=\dfrac{12}{9}=\dfrac43$.',
  2025, 'I', 172, 62)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0074 | əsas: 2025 toplu, I hissə, səh.172 №63
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0074', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'open',
  'Düzbucaqlı $ABCD$ trapesiyasının ($\angle A=90^\circ$, $AB\parallel DC$) diaqonalları qarşılıqlı perpendikulyardır. $AB=25$, $AD=15$ olarsa, $DC$ parçasının uzunluğunu tapın.',
  NULL, NULL, NULL, '9',
  '$AD^2=AB\cdot DC$ (perpendikulyar diaqonallar, oxşar üçbucaqlar $ABD\sim DAC$): $225=25\cdot DC\Rightarrow DC=9$.',
  2025, 'I', 172, 63)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0075 | əsas: 2025 toplu, I hissə, səh.172 №65
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0075', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'open',
  'Diaqonalı $17$, hündürlüyü $8$, kiçik oturacağı $12$ olan bərabəryanlı trapesiyanın böyük oturacağının uzunluğunu tapın.',
  NULL, NULL, NULL, '18',
  'Diaqonalın böyük oturacaq üzərindəki proyeksiyası $\sqrt{289-64}=15=\dfrac{a+b}{2}$. $a=30-12=18$.',
  2025, 'I', 172, 65)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0076 | əsas: 2025 toplu, I hissə, səh.162 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0076', '/images/tasks/CXB-0076.png', 'Ortaq tərəfli kvadrat və düzgün altıbucaqlı; x, y, z bucaqları işarələnib', (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'closed',
  'Şəkildə bir tərəfləri ortaq olan kvadrat və düzgün altıbucaqlı verilmişdir. $x$ — kvadratın bucağı, $z$ — altıbucaqlının bucağı, $y$ — ortaq tərəfin aşağı ucunda kvadratla altıbucaqlı arasında qalan bucaqdır. $x+y-z$ neçə dərəcədir?',
  '[{"key": "A", "text": "$180^\\circ$"}, {"key": "B", "text": "$90^\\circ$"}, {"key": "C", "text": "$60^\\circ$"}, {"key": "D", "text": "$150^\\circ$"}, {"key": "E", "text": "$120^\\circ$"}]'::jsonb, 'E', NULL, NULL,
  'Kvadratın bucağı $x=90^\circ$, düzgün altıbucaqlının bucağı $z=120^\circ$. Ortaq təpə ətrafında bucaqların cəmi $360^\circ$: $y=360^\circ-90^\circ-120^\circ=150^\circ$. $x+y-z=90^\circ+150^\circ-120^\circ=120^\circ$.',
  2025, 'I', 162, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0077 | əsas: 2025 toplu, I hissə, səh.192 №47
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0077', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'written',
  'Düzgün çoxbucaqlının xaricinə çəkilmiş çevrənin uzunluğunun onun tərəfinin uzunluğuna nisbəti $\pi\sqrt2$-dir. Çoxbucaqlının neçə tərəfi var?',
  NULL, NULL, NULL, '4',
  '$\dfrac{2\pi R}{a}=\pi\sqrt2\Rightarrow a=R\sqrt2$. $a=2R\sin\dfrac{180^\circ}{n}\Rightarrow\sin\dfrac{180^\circ}{n}=\dfrac{\sqrt2}{2}\Rightarrow n=4$.',
  2025, 'I', 192, 47)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0078 | əsas: 2025 toplu, I hissə, səh.192 №48
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0078', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı'), 'original', 'own', 'az', 'draft', 'written',
  'Tərəfinin uzunluğunun xaricinə çəkilmiş çevrənin uzunluğuna nisbəti $\dfrac{1}{2\pi}$ olan düzgün çoxbucaqlının neçə tərəfi var?',
  NULL, NULL, NULL, '6',
  '$\dfrac{a}{2\pi R}=\dfrac{1}{2\pi}\Rightarrow a=R$. $2R\sin\dfrac{180^\circ}{n}=R\Rightarrow\sin\dfrac{180^\circ}{n}=\dfrac12\Rightarrow n=6$.',
  2025, 'I', 192, 48)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0079 | əsas: 2025 toplu, I hissə, səh.165 №20
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0079', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Paraleloqram, onun xassələri və əlamətləri'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ paraleloqramında $DE\perp BC$ ($E\in BC$), $\angle A=60^\circ$, $AB=16$ və $BE=6$ olarsa, paraleloqramın perimetrini tapın.',
  '[{"key": "A", "text": "$76$"}, {"key": "B", "text": "$64$"}, {"key": "C", "text": "$56$"}, {"key": "D", "text": "$44$"}, {"key": "E", "text": "$60$"}]'::jsonb, 'E', NULL, NULL,
  '$\angle C=60^\circ$, $CD=16$, $EC=16\cos60^\circ=8$. $BC=6+8=14$. $P=2(16+14)=60$.',
  2025, 'I', 165, 20)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0080 | əsas: 2025 toplu, I hissə, səh.165 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0080', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Paraleloqram, onun xassələri və əlamətləri'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ paraleloqramında $N$ — $CD$-nin orta nöqtəsi, $AC$ və $BD$ diaqonallar $O$ nöqtəsində kəsişir, $BN$ isə $AC$-ni $M$ nöqtəsində kəsir. $OM=4$ olarsa, $AC$-ni tapın.',
  '[{"key": "A", "text": "$36$"}, {"key": "B", "text": "$16$"}, {"key": "C", "text": "$24$"}, {"key": "D", "text": "$12$"}, {"key": "E", "text": "$20$"}]'::jsonb, 'C', NULL, NULL,
  '$M$ — $BCD$ üçbucağının medianlarının kəsişməsidir: $OM=\dfrac13OC$. $OC=12$, $AC=24$.',
  2025, 'I', 165, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0081 | əsas: 2025 toplu, I hissə, səh.165 №29
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0081', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Paraleloqram, onun xassələri və əlamətləri'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ paraleloqramında $K\in AD$, $\angle ABK=\angle KBD$, $AB=4AK$ və $P_{\triangle ABD}=35$ olarsa, $BC$-ni tapın.',
  '[{"key": "A", "text": "$7$"}, {"key": "B", "text": "$5$"}, {"key": "C", "text": "$10$"}, {"key": "D", "text": "$8{,}75$"}, {"key": "E", "text": "$8$"}]'::jsonb, 'A', NULL, NULL,
  '$BK$ — $ABD$ üçbucağının tənbölənidir: $\dfrac{AK}{KD}=\dfrac{AB}{BD}=\dfrac{4AK}{BD}\Rightarrow KD=\dfrac{BD}{4}$. $P=AB+BD+AD=4AK+BD+AK+\dfrac{BD}{4}=5\left(AK+\dfrac{BD}{4}\right)=5AD=35\Rightarrow AD=7$. $BC=AD=7$.',
  2025, 'I', 165, 29)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0082 | əsas: 2025 toplu, I hissə, səh.165 №30
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0082', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Paraleloqram, onun xassələri və əlamətləri'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ paraleloqramında $K\in AD$, $\angle ABK=\angle KBD$, $BD=4KD$ və $BC=9$ olarsa, $P_{\triangle ABD}$-ni tapın.',
  '[{"key": "A", "text": "$40$"}, {"key": "B", "text": "$36$"}, {"key": "C", "text": "$45$"}, {"key": "D", "text": "$27$"}, {"key": "E", "text": "$54$"}]'::jsonb, 'C', NULL, NULL,
  'Tənbölən xassəsi: $\dfrac{AB}{BD}=\dfrac{AK}{KD}\Rightarrow AB=4AK$. $P=AB+BD+AD=4AK+4KD+AD=4AD+AD=5\cdot9=45$.',
  2025, 'I', 165, 30)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0083 | əsas: 2025 toplu, I hissə, səh.165 №32
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0083', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Paraleloqram, onun xassələri və əlamətləri'), 'original', 'own', 'az', 'draft', 'written',
  '$ABCD$ paraleloqramının $A$ və $D$ bucaqlarının tənbölənləri $BC$ tərəfi üzərində $M$ nöqtəsində kəsişir. $AMD$ üçbucağının $M$ təpəsindən çəkilən medianı $5{,}5$ sm olarsa, paraleloqramın perimetrini tapın.',
  NULL, NULL, NULL, '33',
  '$\angle AMD=90^\circ$, median hipotenuzun yarısıdır: $AD=11$. $BC=2AB\Rightarrow AB=5{,}5$. $P=2(5{,}5+11)=33$ sm.',
  2025, 'I', 165, 32)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0084 | əsas: 2025 toplu, I hissə, səh.166 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0084', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Düzbucaqlı, kvadrat, romb və onların xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  'Rombun perimetri $32$ sm-ə, hündürlüyü isə $4\sqrt3$ sm-ə bərabərdir. Rombun iti bucağını tapın.',
  '[{"key": "A", "text": "$60^\\circ$"}, {"key": "B", "text": "$30^\\circ$"}, {"key": "C", "text": "$20^\\circ$"}, {"key": "D", "text": "$75^\\circ$"}, {"key": "E", "text": "$45^\\circ$"}]'::jsonb, 'A', NULL, NULL,
  'Tərəf $8$; $\sin\alpha=\dfrac{4\sqrt3}{8}=\dfrac{\sqrt3}{2}\Rightarrow\alpha=60^\circ$.',
  2025, 'I', 166, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0085 | əsas: 2025 toplu, I hissə, səh.166 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0085', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Düzbucaqlı, kvadrat, romb və onların xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  'İki kvadratın perimetrləri nisbəti $3:5$ kimidir və böyük kvadratın tərəfi $15$ sm-dir. Kiçik kvadratın tərəfini tapın.',
  '[{"key": "A", "text": "$9$ sm"}, {"key": "B", "text": "$5$ sm"}, {"key": "C", "text": "$6$ sm"}, {"key": "D", "text": "$25$ sm"}, {"key": "E", "text": "$3$ sm"}]'::jsonb, 'A', NULL, NULL,
  '$15\cdot\dfrac35=9$ sm.',
  2025, 'I', 166, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0086 | əsas: 2025 toplu, I hissə, səh.166 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0086', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Düzbucaqlı, kvadrat, romb və onların xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  'Perimetri $34$ sm, tərəflərindən biri isə $12$ sm olan düzbucaqlının diaqonalını tapın.',
  '[{"key": "A", "text": "$11$ sm"}, {"key": "B", "text": "$13$ sm"}, {"key": "C", "text": "$17$ sm"}, {"key": "D", "text": "$15$ sm"}, {"key": "E", "text": "$12$ sm"}]'::jsonb, 'B', NULL, NULL,
  'Digər tərəf $5$ sm; diaqonal $\sqrt{144+25}=13$ sm.',
  2025, 'I', 166, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0087 | əsas: 2025 toplu, I hissə, səh.167 №20
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0087', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Düzbucaqlı, kvadrat, romb və onların xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzbucaqlının diaqonalları arasındakı bucaqlardan biri $120^\circ$, diaqonalı $30$ olarsa, kiçik tərəfini tapın.',
  '[{"key": "A", "text": "$10$"}, {"key": "B", "text": "$20$"}, {"key": "C", "text": "$30$"}, {"key": "D", "text": "$15 \\sqrt{3}$"}, {"key": "E", "text": "$15$"}]'::jsonb, 'E', NULL, NULL,
  'Diaqonallar arasındakı iti bucaq $60^\circ$; kiçik tərəf $60^\circ$ qarşısındakı bərabərtərəfli üçbucağın tərəfidir: diaqonalın yarısı, $15$.',
  2025, 'I', 167, 20)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0088 | əsas: 2025 toplu, I hissə, səh.167 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0088', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Düzbucaqlı, kvadrat, romb və onların xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzbucaqlının diaqonalları arasındakı bucaqlardan biri $120^\circ$, diaqonalı $22$ olarsa, kiçik tərəfini tapın.',
  '[{"key": "A", "text": "$11 \\sqrt{3}$"}, {"key": "B", "text": "$\\dfrac{22}{3}$"}, {"key": "C", "text": "$22$"}, {"key": "D", "text": "$11$"}, {"key": "E", "text": "$44$"}]'::jsonb, 'D', NULL, NULL,
  'Kiçik tərəf diaqonalın yarısıdır: $11$.',
  2025, 'I', 167, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0089 | əsas: 2025 toplu, I hissə, səh.167 №27
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0089', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Düzbucaqlı, kvadrat, romb və onların xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ düzbucaqlısında $O$ diaqonalların kəsişmə nöqtəsi, $\angle OCD=60^\circ$, $BE\perp AC$ ($E\in AC$) və $OE=5$ olarsa, $AC$-ni tapın.',
  '[{"key": "A", "text": "$25$"}, {"key": "B", "text": "$40$"}, {"key": "C", "text": "$20$"}, {"key": "D", "text": "$15$"}, {"key": "E", "text": "$10$"}]'::jsonb, 'C', NULL, NULL,
  '$\angle BAC=\angle ACD=60^\circ$ və $OA=OB$, ona görə $AOB$ bərabərtərəflidir. $BE$ onun hündürlüyü və medianıdır: $AE=EO=5$, $AO=10$, $AC=20$.',
  2025, 'I', 167, 27)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0090 | əsas: 2025 toplu, I hissə, səh.167 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0090', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Düzbucaqlı, kvadrat, romb və onların xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ düzbucaqlısında $BE\perp AC$, $\angle ACD=60^\circ$ və $AB=8$ olarsa, $OE$-ni tapın ($O$ — diaqonalların kəsişmə nöqtəsi).',
  '[{"key": "A", "text": "$4 \\sqrt{3}$"}, {"key": "B", "text": "$2$"}, {"key": "C", "text": "$6$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$8$"}]'::jsonb, 'D', NULL, NULL,
  '$AOB$ bərabərtərəfli üçbucaqdır ($AB=OA=OB=8$); $BE$ hündürlük olduğundan $OE=\dfrac{8}{2}=4$.',
  2025, 'I', 167, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0091 | əsas: 2025 toplu, I hissə, səh.167 №29
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0091', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Düzbucaqlı, kvadrat, romb və onların xassələri'), 'original', 'own', 'az', 'draft', 'written',
  'İki təpəsi tərəfi $15$ olan kvadratın diaqonalı üzərində, o biri təpələri isə həmin kvadratın tərəfləri üzərində yerləşən kvadratın diaqonalını tapın.',
  NULL, NULL, NULL, '10',
  'Kiçik kvadratın bir tərəfi böyük kvadratın $AC$ diaqonalı üzərindədir, digər iki təpəsi $AB$ və $BC$ üzərindədir. Bu, hipotenuzu $15\sqrt2$, hündürlüyü $\dfrac{15}{\sqrt2}$ olan $ABC$ üçbucağına daxil edilmiş kvadratdır: $s=\dfrac{c\cdot h}{c+h}=\dfrac{15\sqrt2\cdot\frac{15}{\sqrt2}}{\frac{45}{\sqrt2}}=5\sqrt2$. Diaqonal $s\sqrt2=10$.',
  2025, 'I', 167, 29)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0092 | əsas: 2025 toplu, I hissə, səh.167 №30
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0092', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Düzbucaqlı, kvadrat, romb və onların xassələri'), 'original', 'own', 'az', 'draft', 'written',
  'İki təpəsi tərəfi $6$ olan kvadratın diaqonalı üzərində, o biri təpələri isə həmin kvadratın tərəfləri üzərində yerləşən kvadratın diaqonalını tapın.',
  NULL, NULL, NULL, '4',
  'Əvvəlki kimi: $s=\dfrac{6\sqrt2\cdot\frac{6}{\sqrt2}}{6\sqrt2+\frac{6}{\sqrt2}}=2\sqrt2$, diaqonal $4$.',
  2025, 'I', 167, 30)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0093 | əsas: 2025 toplu, I hissə, səh.168 №43
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0093', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Düzbucaqlı, kvadrat, romb və onların xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ düzbucaqlısında $O$ — diaqonalların kəsişmə nöqtəsi, $\angle BAO=60^\circ$, $DF\perp AC$ ($F\in AC$) və $DF=6$ olarsa, $BD$-ni tapın.',
  '[{"key": "A", "text": "$12$"}, {"key": "B", "text": "$8 \\sqrt{3}$"}, {"key": "C", "text": "$4 \\sqrt{3}$"}, {"key": "D", "text": "$16$"}, {"key": "E", "text": "$6 \\sqrt{3}$"}]'::jsonb, 'B', NULL, NULL,
  '$AOB$ bərabərtərəflidir, ona görə $\angle AOB=60^\circ$ və $\angle DOF=60^\circ$ (qarşılıqlı). $DFO$ üçbucağında $OD=\dfrac{DF}{\sin60^\circ}=\dfrac{12}{\sqrt3}=4\sqrt3$. $BD=2OD=8\sqrt3$.',
  2025, 'I', 168, 43)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0094 | əsas: 2025 toplu, I hissə, səh.170 №20
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0094', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ bərabəryanlı trapesiyasında ($AD\parallel BC$) $AC$ diaqonalı $CD$ yan tərəfinə perpendikulyardır və $\angle CAD=30^\circ$. $\angle BAC$-ni tapın.',
  '[{"key": "A", "text": "$40^\\circ$"}, {"key": "B", "text": "$20^\\circ$"}, {"key": "C", "text": "$60^\\circ$"}, {"key": "D", "text": "$30^\\circ$"}, {"key": "E", "text": "$90^\\circ$"}]'::jsonb, 'D', NULL, NULL,
  '$\angle D=90^\circ-30^\circ=60^\circ=\angle A$. $\angle BAC=60^\circ-30^\circ=30^\circ$.',
  2025, 'I', 170, 20)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0095 | əsas: 2025 toplu, I hissə, səh.171 №46
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0095', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'written',
  'Oturacaqları $9$ və $21$ olan bərabəryanlı trapesiyanın diaqonalı onun iti bucağını yarıya bölürsə, bu trapesiyanın perimetrini hesablayın.',
  NULL, NULL, NULL, '48',
  'Diaqonal iti bucağın tənbölənidirsə, yan tərəf kiçik oturacağa bərabərdir ($ABC$ bərabəryanlıdır): $9$. $P=9+21+18=48$.',
  2025, 'I', 171, 46)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0096 | əsas: 2025 toplu, I hissə, səh.171 №47
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0096', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'written',
  'Bərabəryanlı trapesiyanın oturacaqları $6$ və $14$-dür. Diaqonalı onun iti bucağını yarıya bölürsə, bu trapesiyanın perimetrini hesablayın.',
  NULL, NULL, NULL, '32',
  'Yan tərəf kiçik oturacağa bərabərdir: $6$ (yan tərəfin proyeksiyası $4<6$ — trapesiya mövcuddur). $P=6+14+12=32$.',
  2025, 'I', 171, 47)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0097 | əsas: 2025 toplu, I hissə, səh.171 №48
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0097', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'written',
  'Bərabəryanlı trapesiyanın oturacaqları $40$ və $30$, diaqonalı isə $37$-dir. Onun perimetrini tapın.',
  NULL, NULL, NULL, '96',
  'Diaqonalın böyük oturacaq üzərindəki proyeksiyası $35$, hündürlük $\sqrt{37^2-35^2}=12$. Yan tərəfin proyeksiyası $5$, yan tərəf $13$. $P=40+30+26=96$.',
  2025, 'I', 171, 48)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0098 | əsas: 2025 toplu, I hissə, səh.171 №49
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0098', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'written',
  '$ABCD$ trapesiyasında $\angle A=90^\circ$, $BC\parallel AD$, $BC=5$ və $AC=CD$ olarsa, $MN$ orta xəttin uzunluğunu tapın.',
  NULL, NULL, NULL, '7,5',
  '$ACD$ bərabəryanlıdır; $C$-dən $AD$-yə endirilən hündürlük $AD$-ni yarıya bölür. Bu hündürlük $AB$-yə paraleldir, ona görə $AD$-nin yarısı $BC=5$-ə bərabərdir: $AD=10$. $MN=\dfrac{5+10}{2}=7{,}5$.',
  2025, 'I', 171, 49)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0099 | əsas: 2025 toplu, I hissə, səh.171 №50
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0099', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'written',
  '$ABCD$ trapesiyasında $\angle A=90^\circ$, $BC=7$ və $AC=CD$ olarsa, $MN$ orta xəttin uzunluğunu tapın.',
  NULL, NULL, NULL, '10,5',
  '$AD=2BC=14$; $MN=\dfrac{7+14}{2}=10{,}5$.',
  2025, 'I', 171, 50)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0100 | əsas: 2025 toplu, I hissə, səh.171 №51
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0100', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'written',
  '$ABCD$ trapesiyasında ($BC\parallel AD$) $\angle BAD=\alpha$, $\angle BCD=2\alpha$, $BC=6$, $CD=9$ olarsa, $AD$-ni tapın.',
  NULL, NULL, NULL, '15',
  '$C$-dən $AB$-yə paralel $CE$ çəkək ($E\in AD$): $ABCE$ paraleloqramdır, $AE=6$, $\angle BCE=\alpha$, $\angle CED=\alpha$. $\angle ECD=2\alpha-\alpha=\alpha$, ona görə $ECD$ bərabəryanlıdır: $ED=CD=9$. $AD=15$.',
  2025, 'I', 171, 51)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0101 | əsas: 2025 toplu, I hissə, səh.171 №52
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0101', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'written',
  '$ABCD$ trapesiyasında ($BC\parallel AD$) $\angle BAD=\alpha$, $\angle BCD=2\alpha$, $BC=3$, $CD=10$ olarsa, $AD$-ni tapın.',
  NULL, NULL, NULL, '13',
  'Eyni qayda ilə $AD=BC+CD=13$.',
  2025, 'I', 171, 52)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CXB-0102 | əsas: 2025 toplu, I hissə, səh.172 №61
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CXB-0102', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxbucaqlılar. Dördbucaqlılar' AND s.title='Trapesiya və onun orta xətti'), 'original', 'own', 'az', 'draft', 'written',
  'Hündürlüyü $10$, iti bucağının tangensi $\dfrac52$ olan bərabəryanlı trapesiyanın diaqonalı yan tərəfə perpendikulyardır. Trapesiyanın böyük oturacağını tapın.',
  NULL, NULL, NULL, '29',
  '$KD=\dfrac{10}{5/2}=4$; $CK^2=AK\cdot KD\Rightarrow AK=25$. $AD=29$.',
  2025, 'I', 172, 61)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
