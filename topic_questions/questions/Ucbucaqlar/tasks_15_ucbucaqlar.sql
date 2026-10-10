-- Mövzu: Üçbucaqlar — 115 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- UCB-0001 | əsas: 2025 toplu, I hissə, səh.144 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucaq. Üçbucaq bərabərsizliyi. Üçbucağın perimetri'), 'original', 'own', 'az', 'draft', 'closed',
  'İki tərəfi $9{,}3$ sm və $4{,}6$ sm olan üçbucağın üçüncü tərəfinin ən böyük tam qiymətini tapın.',
  '[{"key": "A", "text": "$12$ sm"}, {"key": "B", "text": "$14$ sm"}, {"key": "C", "text": "$5$ sm"}, {"key": "D", "text": "$13$ sm"}, {"key": "E", "text": "$10$ sm"}]'::jsonb, 'D', NULL, NULL,
  'Üçbucaq bərabərsizliyinə görə üçüncü tərəf $9{,}3+4{,}6=13{,}9$ sm-dən kiçikdir. Ən böyük tam qiymət $13$ sm-dir.',
  2025, 'I', 144, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0002 | əsas: 2025 toplu, I hissə, səh.144 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucaq. Üçbucaq bərabərsizliyi. Üçbucağın perimetri'), 'original', 'own', 'az', 'draft', 'closed',
  'İki tərəfi $8{,}4$ sm və $2{,}9$ sm olan üçbucağın üçüncü tərəfinin ən böyük tam qiymətini tapın.',
  '[{"key": "A", "text": "$12$ sm"}, {"key": "B", "text": "$10$ sm"}, {"key": "C", "text": "$9$ sm"}, {"key": "D", "text": "$11$ sm"}, {"key": "E", "text": "$6$ sm"}]'::jsonb, 'D', NULL, NULL,
  'Üçüncü tərəf $<8{,}4+2{,}9=11{,}3$ sm, ən böyük tam qiyməti $11$ sm.',
  2025, 'I', 144, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0003 | əsas: 2025 toplu, I hissə, səh.144 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucaq. Üçbucaq bərabərsizliyi. Üçbucağın perimetri'), 'original', 'own', 'az', 'draft', 'closed',
  'Üçbucağın iki tərəfinin uzunluğu $3$ sm və $8$ sm-dir. Üçbucağın perimetri üçün hansı münasibət doğrudur?',
  '[{"key": "A", "text": "$19\\text{ sm}<P<22\\text{ sm}$"}, {"key": "B", "text": "$11\\text{ sm}<P<16\\text{ sm}$"}, {"key": "C", "text": "$16\\text{ sm}\\le P\\le22\\text{ sm}$"}, {"key": "D", "text": "$5\\text{ sm}<P<11\\text{ sm}$"}, {"key": "E", "text": "$16\\text{ sm}<P<22\\text{ sm}$"}]'::jsonb, 'E', NULL, NULL,
  'Üçüncü tərəf $c$: $8-3<c<8+3$, yəni $5<c<11$. Perimetr $P=11+c$: $16<P<22$ (sm). Sərhədlər daxil deyil, çünki bərabərsizliklər ciddidir.',
  2025, 'I', 144, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0004 | əsas: 2025 toplu, I hissə, səh.144 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucaq. Üçbucaq bərabərsizliyi. Üçbucağın perimetri'), 'original', 'own', 'az', 'draft', 'closed',
  'Üçbucağın iki tərəfinin uzunluğu $5$ sm və $9$ sm-dir. Üçbucağın perimetri üçün hansı münasibət doğrudur?',
  '[{"key": "A", "text": "$18\\text{ sm}<P<28\\text{ sm}$"}, {"key": "B", "text": "$4\\text{ sm}<P<14\\text{ sm}$"}, {"key": "C", "text": "$9\\text{ sm}<P<23\\text{ sm}$"}, {"key": "D", "text": "$14\\text{ sm}<P<28\\text{ sm}$"}, {"key": "E", "text": "$18\\text{ sm}\\le P\\le28\\text{ sm}$"}]'::jsonb, 'A', NULL, NULL,
  '$4<c<14$, $P=14+c$: $18<P<28$ (sm).',
  2025, 'I', 144, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0005 | əsas: 2025 toplu, I hissə, səh.144 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucaq. Üçbucaq bərabərsizliyi. Üçbucağın perimetri'), 'original', 'own', 'az', 'draft', 'closed',
  'Üçbucağın tərəflərinin uzunluqları nisbəti $7:5:4$ kimidir. Üçbucağın perimetri $64$ sm olarsa, onun kiçik tərəfini tapın.',
  '[{"key": "A", "text": "$16$ sm"}, {"key": "B", "text": "$12$ sm"}, {"key": "C", "text": "$28$ sm"}, {"key": "D", "text": "$20$ sm"}, {"key": "E", "text": "$8$ sm"}]'::jsonb, 'A', NULL, NULL,
  '$7k+5k+4k=16k=64\Rightarrow k=4$. Kiçik tərəf $4k=16$ sm.',
  2025, 'I', 144, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0006 | əsas: 2025 toplu, I hissə, səh.144 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucaq. Üçbucaq bərabərsizliyi. Üçbucağın perimetri'), 'original', 'own', 'az', 'draft', 'closed',
  'Perimetri $36$ sm olan üçbucağın tərəflərinin uzunluqları nisbəti $3:4:5$ kimidir. Onun tərəflərini tapın.',
  '[{"key": "A", "text": "$9;\\ 12;\\ 15$ sm"}, {"key": "B", "text": "$8;\\ 12;\\ 16$ sm"}, {"key": "C", "text": "$3;\\ 12;\\ 21$ sm"}, {"key": "D", "text": "$10;\\ 12;\\ 14$ sm"}, {"key": "E", "text": "$6;\\ 12;\\ 18$ sm"}]'::jsonb, 'A', NULL, NULL,
  '$12k=36\Rightarrow k=3$. Tərəflər $9;\ 12;\ 15$ sm.',
  2025, 'I', 144, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0007 | əsas: 2025 toplu, I hissə, səh.144 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0007', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucaq. Üçbucaq bərabərsizliyi. Üçbucağın perimetri'), 'original', 'own', 'az', 'draft', 'open',
  'Üçbucağın $a,\ b,\ c$ tərəfləri $|a+b-16|+|b+c-18|+|a+c-20|\le0$ şərtini ödəyərsə, bu üçbucağın perimetrini tapın.',
  NULL, NULL, NULL, '27',
  'Modulların cəmi mənfi ola bilməz, ona görə hər modul sıfırdır: $a+b=16$, $b+c=18$, $a+c=20$. Toplasaq: $2(a+b+c)=54\Rightarrow P=27$. (Tərəflər $9,7,11$ — üçbucaq bərabərsizliyi ödənir.)',
  2025, 'I', 144, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0008 | əsas: 2025 toplu, I hissə, səh.144 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucaq. Üçbucaq bərabərsizliyi. Üçbucağın perimetri'), 'original', 'own', 'az', 'draft', 'open',
  'Üçbucağın $a,\ b,\ c$ tərəfləri $|a+b-9|+|b+c-11|+|a+c-14|\le0$ şərtini ödəyərsə, bu üçbucağın perimetrini tapın.',
  NULL, NULL, NULL, '17',
  '$a+b=9$, $b+c=11$, $a+c=14$; $2P=34\Rightarrow P=17$. (Tərəflər $6,3,8$ — üçbucaq mövcuddur.)',
  2025, 'I', 144, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0009 | əsas: 2025 toplu, I hissə, səh.145 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucaq. Üçbucaq bərabərsizliyi. Üçbucağın perimetri'), 'original', 'own', 'az', 'draft', 'open',
  '$ABC$ üçbucağında $AB=6$, $BC=11$ və $\angle B>\angle A$ olarsa, $AC$ tərəfinin ala biləcəyi ən böyük və ən kiçik tam qiymətlərin cəmini tapın.',
  NULL, NULL, NULL, '28',
  'Böyük bucaq qarşısında böyük tərəf durur: $\angle B>\angle A\Rightarrow AC>BC=11$. Üçbucaq bərabərsizliyi: $AC<AB+BC=17$. Tam qiymətlər $12,\dots,16$; cəm $12+16=28$.',
  2025, 'I', 145, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0010 | əsas: 2025 toplu, I hissə, səh.145 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucaq. Üçbucaq bərabərsizliyi. Üçbucağın perimetri'), 'original', 'own', 'az', 'draft', 'open',
  '$ABC$ üçbucağında $AB=9$, $BC=13$ və $\angle B>\angle A$ olarsa, $AC$ tərəfinin ala biləcəyi ən böyük və ən kiçik tam qiymətlərin cəmini tapın.',
  NULL, NULL, NULL, '35',
  '$AC>BC=13$ və $AC<9+13=22$. Tam qiymətlər $14,\dots,21$; cəm $35$.',
  2025, 'I', 145, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0011 | əsas: 2025 toplu, I hissə, səh.145 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0011', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın medianı, tənböləni, hündürlüyü. Medianların və tənbölənlərin xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Oturacağı $AB$ olan bərabəryanlı üçbucaqda $CD$ mediandır. $ABC$ və $ADC$ üçbucaqlarının perimetrləri uyğun olaraq $40$ sm və $32$ sm olarsa, $CD$-ni tapın.',
  '[{"key": "A", "text": "$20$ sm"}, {"key": "B", "text": "$16$ sm"}, {"key": "C", "text": "$12$ sm"}, {"key": "D", "text": "$8$ sm"}, {"key": "E", "text": "$6$ sm"}]'::jsonb, 'C', NULL, NULL,
  '$P_{ABC}=2AC+AB=40\Rightarrow AC+\dfrac{AB}{2}=20$. $P_{ADC}=AC+AD+CD=AC+\dfrac{AB}{2}+CD=20+CD=32\Rightarrow CD=12$ sm.',
  2025, 'I', 145, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0012 | əsas: 2025 toplu, I hissə, səh.145 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0012', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın medianı, tənböləni, hündürlüyü. Medianların və tənbölənlərin xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Tərəfləri $4$ sm, $7$ sm, $9$ sm olan üçbucağın böyük tərəfinə çəkilmiş medianının uzunluğunu tapın.',
  '[{"key": "A", "text": "$\\sqrt{13}$ sm"}, {"key": "B", "text": "$3{,}5$ sm"}, {"key": "C", "text": "$\\dfrac12\\sqrt{65}$ sm"}, {"key": "D", "text": "$4{,}5$ sm"}, {"key": "E", "text": "$7$ sm"}]'::jsonb, 'B', NULL, NULL,
  'Median düsturu: $m_c=\dfrac12\sqrt{2a^2+2b^2-c^2}=\dfrac12\sqrt{32+98-81}=\dfrac12\sqrt{49}=3{,}5$ sm.',
  2025, 'I', 145, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0013 | əsas: 2025 toplu, I hissə, səh.145 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın medianı, tənböləni, hündürlüyü. Medianların və tənbölənlərin xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'İki tərəfi $5$ sm və $9$ sm, üçüncü tərəfinə çəkilən median $6$ sm olan üçbucağın üçüncü tərəfini tapın.',
  '[{"key": "A", "text": "$8$ sm"}, {"key": "B", "text": "$\\sqrt{53}$ sm"}, {"key": "C", "text": "$\\sqrt{34}$ sm"}, {"key": "D", "text": "$2\\sqrt{17}$ sm"}, {"key": "E", "text": "$2\\sqrt{13}$ sm"}]'::jsonb, 'D', NULL, NULL,
  '$4m_c^2=2a^2+2b^2-c^2\Rightarrow144=50+162-c^2\Rightarrow c^2=68\Rightarrow c=2\sqrt{17}$ sm.',
  2025, 'I', 145, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0014 | əsas: 2025 toplu, I hissə, səh.146 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın medianı, tənböləni, hündürlüyü. Medianların və tənbölənlərin xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ üçbucağında $BD$ tənböləndir, $AB=12$ sm, $BC=15$ sm, $AC=18$ sm olarsa, $DC$-nin uzunluğunu tapın.',
  '[{"key": "A", "text": "$8$ sm"}, {"key": "B", "text": "$12$ sm"}, {"key": "C", "text": "$9$ sm"}, {"key": "D", "text": "$10$ sm"}, {"key": "E", "text": "$6$ sm"}]'::jsonb, 'D', NULL, NULL,
  'Tənbölənin xassəsi: $\dfrac{AD}{DC}=\dfrac{AB}{BC}=\dfrac{12}{15}=\dfrac45$. $DC=\dfrac{5}{9}\cdot18=10$ sm.',
  2025, 'I', 146, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0015 | əsas: 2025 toplu, I hissə, səh.146 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0015', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın medianı, tənböləni, hündürlüyü. Medianların və tənbölənlərin xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$AD$ parçası $ABC$ üçbucağının tənbölənidir. $AB=14$ sm, $AC=21$ sm və $DC-BD=3$ sm olarsa, $BD$-ni tapın.',
  '[{"key": "A", "text": "$15$ sm"}, {"key": "B", "text": "$12$ sm"}, {"key": "C", "text": "$6$ sm"}, {"key": "D", "text": "$3$ sm"}, {"key": "E", "text": "$9$ sm"}]'::jsonb, 'C', NULL, NULL,
  '$\dfrac{BD}{DC}=\dfrac{AB}{AC}=\dfrac{14}{21}=\dfrac23$: $BD=2t$, $DC=3t$. $DC-BD=t=3$, $BD=6$ sm.',
  2025, 'I', 146, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0016 | əsas: 2025 toplu, I hissə, səh.146 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın medianı, tənböləni, hündürlüyü. Medianların və tənbölənlərin xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Perimetri $30$ sm olan üçbucağın medianlarından biri onu perimetrləri $19$ sm və $21$ sm olan iki üçbucağa bölür. Medianın uzunluğunu tapın.',
  '[{"key": "A", "text": "$9$ sm"}, {"key": "B", "text": "$5$ sm"}, {"key": "C", "text": "$6$ sm"}, {"key": "D", "text": "$4$ sm"}, {"key": "E", "text": "$10$ sm"}]'::jsonb, 'B', NULL, NULL,
  'Hər iki kiçik üçbucağın perimetrinə median bir dəfə daxildir, böyük üçbucağın tərəfləri isə birlikdə tam daxildir: $19+21=30+2m\Rightarrow m=5$ sm.',
  2025, 'I', 146, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0017 | əsas: 2025 toplu, I hissə, səh.146 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın medianı, tənböləni, hündürlüyü. Medianların və tənbölənlərin xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Medianları cəmi $9\sqrt3$ sm olan bərabərtərəfli üçbucağın perimetrini tapın.',
  '[{"key": "A", "text": "$24$ sm"}, {"key": "B", "text": "$27$ sm"}, {"key": "C", "text": "$18$ sm"}, {"key": "D", "text": "$9$ sm"}, {"key": "E", "text": "$12$ sm"}]'::jsonb, 'C', NULL, NULL,
  'Hər median $3\sqrt3$ sm. Bərabərtərəfli üçbucaqda median $\dfrac{a\sqrt3}{2}$: $\dfrac{a\sqrt3}{2}=3\sqrt3\Rightarrow a=6$. $P=18$ sm.',
  2025, 'I', 146, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0018 | əsas: 2025 toplu, I hissə, səh.146 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın medianı, tənböləni, hündürlüyü. Medianların və tənbölənlərin xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ üçbucağının $B$ və $C$ bucaqlarının tənbölənlərinin kəsişmə nöqtəsindən üçbucağın $AB$ və $AC$ tərəflərini uyğun olaraq $M$ və $N$ nöqtələrində kəsən və $BC$-yə paralel düz xətt çəkilmişdir. $MB=8$ sm, $NC=5$ sm olarsa, $MN$-i tapın.',
  '[{"key": "A", "text": "$10$ sm"}, {"key": "B", "text": "$40$ sm"}, {"key": "C", "text": "$6{,}5$ sm"}, {"key": "D", "text": "$3$ sm"}, {"key": "E", "text": "$13$ sm"}]'::jsonb, 'E', NULL, NULL,
  'Tənbölənlərin kəsişmə nöqtəsi $O$ olsun. $MN\parallel BC$ olduğundan $\angle MOB=\angle OBC=\angle OBM$, yəni $MOB$ bərabəryanlıdır: $MO=MB=8$. Eyni qayda ilə $NO=NC=5$. $MN=8+5=13$ sm.',
  2025, 'I', 146, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0019 | əsas: 2025 toplu, I hissə, səh.146 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın medianı, tənböləni, hündürlüyü. Medianların və tənbölənlərin xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Bərabəryanlı üçbucağın oturacağındakı təpədən yan tərəfinə çəkilən median onun perimetrini $9$ sm və $15$ sm olan hissələrə ayırır. Üçbucağın oturacağını tapın.',
  '[{"key": "A", "text": "$10$ sm"}, {"key": "B", "text": "$4$ və ya $12$ sm"}, {"key": "C", "text": "$4$ sm"}, {"key": "D", "text": "$12$ sm"}, {"key": "E", "text": "$6$ sm"}]'::jsonb, 'C', NULL, NULL,
  'Yan tərəf $b$, oturacaq $a$. Median yan tərəfi iki $\dfrac b2$ hissəyə bölür; perimetrin hissələri $b+\dfrac b2=\dfrac{3b}{2}$ və $\dfrac b2+a$. 1) $\dfrac{3b}{2}=9\Rightarrow b=6$, $a=15-3=12$ — amma $6+6=12$, üçbucaq yoxdur. 2) $\dfrac{3b}{2}=15\Rightarrow b=10$, $a=9-5=4$ — uyğundur. Cavab: $4$ sm.',
  2025, 'I', 146, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0020 | əsas: 2025 toplu, I hissə, səh.146 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın medianı, tənböləni, hündürlüyü. Medianların və tənbölənlərin xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'İki tərəfi $6$ sm və $12$ sm, bu tərəflərə çəkilmiş hündürlüklərin ədədi ortası üçüncü tərəfə çəkilmiş hündürlüyə bərabər olan üçbucağın üçüncü tərəfinin uzunluğunu tapın.',
  '[{"key": "A", "text": "$7$ sm"}, {"key": "B", "text": "$10$ sm"}, {"key": "C", "text": "$6$ sm"}, {"key": "D", "text": "$9$ sm"}, {"key": "E", "text": "$8$ sm"}]'::jsonb, 'E', NULL, NULL,
  'Sahə $S$ olsun: $h_a=\dfrac{2S}{6}$, $h_b=\dfrac{2S}{12}$, $h_c=\dfrac{2S}{c}$. Şərt: $\dfrac12\left(\dfrac{S}{3}+\dfrac{S}{6}\right)=\dfrac{2S}{c}\Rightarrow\dfrac{S}{4}=\dfrac{2S}{c}\Rightarrow c=8$ sm. Yoxlama: $6+8>12$ — üçbucaq mövcuddur.',
  2025, 'I', 146, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0021 | əsas: 2025 toplu, I hissə, səh.147 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın medianı, tənböləni, hündürlüyü. Medianların və tənbölənlərin xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$M$ nöqtəsi $ABC$ üçbucağının medianlarının kəsişmə nöqtəsidir. $AM\perp MC$ və $BM=24$ olarsa, $AC$-nin uzunluğunu hesablayın.',
  '[{"key": "A", "text": "$12$"}, {"key": "B", "text": "$18$"}, {"key": "C", "text": "$36$"}, {"key": "D", "text": "$16$"}, {"key": "E", "text": "$24$"}]'::jsonb, 'E', NULL, NULL,
  '$K$ — $AC$-nin ortası olsun. $BK$ median, $M$ onu $2:1$ nisbətində bölür: $MK=\dfrac{BM}{2}=12$. $AMC$ düzbucaqlı üçbucaqdır, $MK$ onun hipotenuzaya çəkilmiş medianıdır: $MK=\dfrac{AC}{2}\Rightarrow AC=24$.',
  2025, 'I', 147, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0022 | əsas: 2025 toplu, I hissə, səh.147 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın medianı, tənböləni, hündürlüyü. Medianların və tənbölənlərin xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ üçbucağının $AM$ və $BN$ medianları perpendikulyar olub $K$ nöqtəsində kəsişirlər. $AM=18$ və $BN=24$ olarsa, $CK$ parçasının uzunluğunu tapın.',
  '[{"key": "A", "text": "$30$"}, {"key": "B", "text": "$25$"}, {"key": "C", "text": "$15$"}, {"key": "D", "text": "$20$"}, {"key": "E", "text": "$10$"}]'::jsonb, 'D', NULL, NULL,
  '$AK=\dfrac23\cdot18=12$, $BK=\dfrac23\cdot24=16$, $\angle AKB=90^\circ\Rightarrow AB=20$. $C$-dən çəkilən median $AB$-nin ortası $P$-dən keçir; $KP$ — $AKB$ düzbucaqlı üçbucağında hipotenuzaya median: $KP=10$. $CK=2KP=20$.',
  2025, 'I', 147, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0023 | əsas: 2025 toplu, I hissə, səh.147 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın daxili bucaqlarının cəmi. Üçbucağın xarici bucağının xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzbucaqlı üçbucağın iti bucaqlarından biri $\dfrac{\pi}{7}$ olarsa, o biri iti bucağı tapın.',
  '[{"key": "A", "text": "$\\dfrac{3\\pi}{7}$"}, {"key": "B", "text": "$\\dfrac{5\\pi}{14}$"}, {"key": "C", "text": "$\\dfrac{\\pi}{14}$"}, {"key": "D", "text": "$\\dfrac{9\\pi}{14}$"}, {"key": "E", "text": "$\\dfrac{2\\pi}{7}$"}]'::jsonb, 'B', NULL, NULL,
  'İti bucaqların cəmi $\dfrac{\pi}{2}$: $\dfrac{\pi}{2}-\dfrac{\pi}{7}=\dfrac{7\pi-2\pi}{14}=\dfrac{5\pi}{14}$.',
  2025, 'I', 147, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0024 | əsas: 2025 toplu, I hissə, səh.147 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın daxili bucaqlarının cəmi. Üçbucağın xarici bucağının xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Üçbucağın $A$ təpəsindəki xarici bucağı ilə $B$ təpəsindəki daxili bucağının fərqi $48^\circ$-dir. $C$ təpəsindəki daxili bucağı tapın.',
  '[{"key": "A", "text": "$24^\\circ$"}, {"key": "B", "text": "$42^\\circ$"}, {"key": "C", "text": "$48^\\circ$"}, {"key": "D", "text": "$90^\\circ$"}, {"key": "E", "text": "$132^\\circ$"}]'::jsonb, 'C', NULL, NULL,
  'Xarici bucaq özünə qonşu olmayan iki daxili bucağın cəminə bərabərdir: $\angle A_{xar}=\angle B+\angle C$. Deməli $\angle C=48^\circ$.',
  2025, 'I', 147, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0025 | əsas: 2025 toplu, I hissə, səh.148 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0025', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın daxili bucaqlarının cəmi. Üçbucağın xarici bucağının xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Üçbucağın iki xarici bucağı $110^\circ$ və $135^\circ$-dir. Üçüncü xarici bucağı tapın.',
  '[{"key": "A", "text": "$65^\\circ$"}, {"key": "B", "text": "$115^\\circ$"}, {"key": "C", "text": "$105^\\circ$"}, {"key": "D", "text": "$125^\\circ$"}, {"key": "E", "text": "$245^\\circ$"}]'::jsonb, 'B', NULL, NULL,
  'Hər təpədən bir xarici bucaq götürsək, cəm $360^\circ$-dir: $360^\circ-110^\circ-135^\circ=115^\circ$.',
  2025, 'I', 148, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0026 | əsas: 2025 toplu, I hissə, səh.148 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın daxili bucaqlarının cəmi. Üçbucağın xarici bucağının xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Üçbucağın daxili bucaqlarından biri $40^\circ$, xarici bucaqlarından biri isə $100^\circ$-dir (başqa təpədə). Üçbucağın qalan xarici bucaqlarını tapın.',
  '[{"key": "A", "text": "$140^\\circ,\\ 100^\\circ$"}, {"key": "B", "text": "$80^\\circ,\\ 60^\\circ$"}, {"key": "C", "text": "$130^\\circ,\\ 120^\\circ$"}, {"key": "D", "text": "$140^\\circ,\\ 120^\\circ$"}, {"key": "E", "text": "$150^\\circ,\\ 110^\\circ$"}]'::jsonb, 'D', NULL, NULL,
  '$100^\circ$-li xarici bucağa qonşu daxili bucaq $80^\circ$. Üçüncü daxili bucaq $180^\circ-40^\circ-80^\circ=60^\circ$. Qalan xarici bucaqlar: $180^\circ-40^\circ=140^\circ$ və $180^\circ-60^\circ=120^\circ$.',
  2025, 'I', 148, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0027 | əsas: 2025 toplu, I hissə, səh.148 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0027', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın daxili bucaqlarının cəmi. Üçbucağın xarici bucağının xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Bərabərtərəfli üçbucağın təpəsindən çəkilmiş hündürlüklə bu təpədən çıxan yan tərəf arasındakı bucaq neçə dərəcədir?',
  '[{"key": "A", "text": "$15^\\circ$"}, {"key": "B", "text": "$90^\\circ$"}, {"key": "C", "text": "$45^\\circ$"}, {"key": "D", "text": "$30^\\circ$"}, {"key": "E", "text": "$60^\\circ$"}]'::jsonb, 'D', NULL, NULL,
  'Bərabərtərəfli üçbucaqda hündürlük həm də tənböləndir, $60^\circ$-li bucağı iki bərabər hissəyə bölür: $30^\circ$.',
  2025, 'I', 148, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0028 | əsas: 2025 toplu, I hissə, səh.148 №19
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0028', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın daxili bucaqlarının cəmi. Üçbucağın xarici bucağının xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ üçbucağında $\angle BAC=80^\circ$, $D\in AB$, $E\in BC$, $F\in AC$ nöqtələri üçün $BD=BE$ və $CE=CF$ olarsa, $DEF$ bucağını tapın.',
  '[{"key": "A", "text": "$80^\\circ$"}, {"key": "B", "text": "$50^\\circ$"}, {"key": "C", "text": "$40^\\circ$"}, {"key": "D", "text": "$25^\\circ$"}, {"key": "E", "text": "$100^\\circ$"}]'::jsonb, 'B', NULL, NULL,
  '$BDE$ bərabəryanlıdır: $\angle BED=90^\circ-\dfrac{\angle B}{2}$. Eyni qayda ilə $\angle CEF=90^\circ-\dfrac{\angle C}{2}$. $\angle DEF=180^\circ-\angle BED-\angle CEF=\dfrac{\angle B+\angle C}{2}=\dfrac{180^\circ-80^\circ}{2}=50^\circ$.',
  2025, 'I', 148, 19)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0029 | əsas: 2025 toplu, I hissə, səh.149 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0029', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın daxili bucaqlarının cəmi. Üçbucağın xarici bucağının xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ üçbucağının $AA_1$ və $CC_1$ hündürlükləri $K$ nöqtəsində kəsişir. $\angle A=55^\circ$, $\angle C=70^\circ$ olduğunu bilərək, $\angle AKC$-ni tapın.',
  '[{"key": "A", "text": "$135^\\circ$"}, {"key": "B", "text": "$110^\\circ$"}, {"key": "C", "text": "$125^\\circ$"}, {"key": "D", "text": "$70^\\circ$"}, {"key": "E", "text": "$55^\\circ$"}]'::jsonb, 'C', NULL, NULL,
  '$BA_1KC_1$ dördbucaqlısında $A_1$ və $C_1$ bucaqları düzdür, ona görə $\angle A_1KC_1=180^\circ-\angle B=180^\circ-55^\circ=125^\circ$; $\angle AKC$ ona qarşılıqlı bucaqdır: $125^\circ$ ($=\angle A+\angle C$).',
  2025, 'I', 149, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0030 | əsas: 2025 toplu, I hissə, səh.149 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0030', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın daxili bucaqlarının cəmi. Üçbucağın xarici bucağının xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$MNK$ üçbucağında $\angle M=48^\circ$, $\angle K=67^\circ$-dir. $M$ və $K$ təpələrindən çəkilən hündürlüklər $E$ nöqtəsində kəsişir. $MEK$ bucağının qiymətini tapın.',
  '[{"key": "A", "text": "$115^\\circ$"}, {"key": "B", "text": "$65^\\circ$"}, {"key": "C", "text": "$95^\\circ$"}, {"key": "D", "text": "$105^\\circ$"}, {"key": "E", "text": "$125^\\circ$"}]'::jsonb, 'A', NULL, NULL,
  'Əvvəlki tipdə olduğu kimi: $\angle MEK=180^\circ-\angle N=\angle M+\angle K=115^\circ$.',
  2025, 'I', 149, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0031 | əsas: 2025 toplu, I hissə, səh.149 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0031', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın daxili bucaqlarının cəmi. Üçbucağın xarici bucağının xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ üçbucağının $A$ və $B$ təpələrindən çəkilmiş tənbölənlər $D$ nöqtəsində kəsişirlər. $\angle DAC+\angle ABD=55^\circ$ olarsa, $\angle ACB$-ni tapın.',
  '[{"key": "A", "text": "$70^\\circ$"}, {"key": "B", "text": "$55^\\circ$"}, {"key": "C", "text": "$125^\\circ$"}, {"key": "D", "text": "$110^\\circ$"}, {"key": "E", "text": "$35^\\circ$"}]'::jsonb, 'A', NULL, NULL,
  '$\angle DAC=\dfrac{\angle A}{2}$, $\angle ABD=\dfrac{\angle B}{2}$: $\angle A+\angle B=110^\circ$. $\angle C=180^\circ-110^\circ=70^\circ$.',
  2025, 'I', 149, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0032 | əsas: 2025 toplu, I hissə, səh.149 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0032', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın daxili bucaqlarının cəmi. Üçbucağın xarici bucağının xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ üçbucağının $A$ və $B$ təpələrindən çəkilmiş tənbölənlər $D$ nöqtəsində kəsişirlər. $\angle ACB=64^\circ$ olarsa, $\angle ADB$-ni tapın.',
  '[{"key": "A", "text": "$128^\\circ$"}, {"key": "B", "text": "$148^\\circ$"}, {"key": "C", "text": "$116^\\circ$"}, {"key": "D", "text": "$122^\\circ$"}, {"key": "E", "text": "$58^\\circ$"}]'::jsonb, 'D', NULL, NULL,
  '$\angle ADB=180^\circ-\dfrac{\angle A+\angle B}{2}=180^\circ-\dfrac{180^\circ-64^\circ}{2}=90^\circ+32^\circ=122^\circ$.',
  2025, 'I', 149, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0033 | əsas: 2025 toplu, I hissə, səh.149 №30
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0033', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın daxili bucaqlarının cəmi. Üçbucağın xarici bucağının xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ üçbucağının $C$ təpəsindən daxili və xarici bucaqların tənbölənləri çəkilmişdir. Daxili bucağın tənböləni $AB$ tərəfi ilə $65^\circ$-li bucaq əmələ gətirir. Xarici bucağın tənböləninin $AB$ tərəfinin uzantısı ilə əmələ gətirdiyi bucağı tapın.',
  '[{"key": "A", "text": "$115^\\circ$"}, {"key": "B", "text": "$35^\\circ$"}, {"key": "C", "text": "$25^\\circ$"}, {"key": "D", "text": "$65^\\circ$"}, {"key": "E", "text": "$90^\\circ$"}]'::jsonb, 'C', NULL, NULL,
  'Qonşu bucaqların tənbölənləri perpendikulyardır. Daxili tənbölən, xarici tənbölən və $AB$ düz xətti düzbucaqlı üçbucaq əmələ gətirir; onun iti bucaqları $65^\circ$ və $90^\circ-65^\circ=25^\circ$.',
  2025, 'I', 149, 30)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0034 | əsas: 2025 toplu, I hissə, səh.149 №33
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0034', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucağın daxili bucaqlarının cəmi. Üçbucağın xarici bucağının xassəsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ üçbucağında $\angle A=52^\circ$, $BD\perp AC$, $CK\perp AB$ və $BD$ ilə $CK$ $O$ nöqtəsində kəsişirsə, $\angle BOK$-ni tapın.',
  '[{"key": "A", "text": "$128^\\circ$"}, {"key": "B", "text": "$104^\\circ$"}, {"key": "C", "text": "$26^\\circ$"}, {"key": "D", "text": "$38^\\circ$"}, {"key": "E", "text": "$52^\\circ$"}]'::jsonb, 'E', NULL, NULL,
  '$AKOD$ dördbucaqlısında $K$ və $D$ bucaqları düzdür: $\angle KOD=180^\circ-52^\circ=128^\circ$. $\angle BOK$ ona qonşudur: $180^\circ-128^\circ=52^\circ$.',
  2025, 'I', 149, 33)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0035 | əsas: 2025 toplu, I hissə, səh.150 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0035', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucaqların konqruyentlik əlaməti. Fales teoremi. Üçbucağın orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Üçbucağın uzunluğu $a$ olan tərəfinə paralel orta xətti $b$-dir. $a+b=24$ sm olarsa, $a$-nı tapın.',
  '[{"key": "A", "text": "$16$ sm"}, {"key": "B", "text": "$8$ sm"}, {"key": "C", "text": "$18$ sm"}, {"key": "D", "text": "$12$ sm"}, {"key": "E", "text": "$20$ sm"}]'::jsonb, 'A', NULL, NULL,
  '$b=\dfrac a2$: $\dfrac{3a}{2}=24\Rightarrow a=16$ sm.',
  2025, 'I', 150, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0036 | əsas: 2025 toplu, I hissə, səh.150 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0036', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucaqların konqruyentlik əlaməti. Fales teoremi. Üçbucağın orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Üçbucağın perimetri $9{,}4$ sm-dir. Üçbucağın orta xətlərindən birinin verilən üçbucaqdan ayırdığı üçbucağın perimetrini tapın.',
  '[{"key": "A", "text": "$18{,}8$ sm"}, {"key": "B", "text": "$4{,}5$ sm"}, {"key": "C", "text": "$3{,}1$ sm"}, {"key": "D", "text": "$4{,}7$ sm"}, {"key": "E", "text": "$9{,}4$ sm"}]'::jsonb, 'D', NULL, NULL,
  'Ayrılan üçbucaq verilən üçbucağa $\dfrac12$ əmsalı ilə oxşardır, perimetri $9{,}4:2=4{,}7$ sm.',
  2025, 'I', 150, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0037 | əsas: 2025 toplu, I hissə, səh.150 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0037', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucaqların konqruyentlik əlaməti. Fales teoremi. Üçbucağın orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Üçbucağın orta xətti paralel olduğu tərəfdən $7{,}5$ sm kiçikdir. Üçbucağın bu tərəfi ilə orta xəttinin uzunluqları cəmini tapın.',
  '[{"key": "A", "text": "$22{,}5$ sm"}, {"key": "B", "text": "$18{,}5$ sm"}, {"key": "C", "text": "$30$ sm"}, {"key": "D", "text": "$7{,}5$ sm"}, {"key": "E", "text": "$15$ sm"}]'::jsonb, 'A', NULL, NULL,
  'Orta xətt $\dfrac a2$; $a-\dfrac a2=7{,}5\Rightarrow a=15$. Cəm: $15+7{,}5=22{,}5$ sm.',
  2025, 'I', 150, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0038 | əsas: 2025 toplu, I hissə, səh.150 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0038', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucaqların konqruyentlik əlaməti. Fales teoremi. Üçbucağın orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Bərabəryanlı üçbucağın yan tərəfinə paralel olan orta xətti $5$ sm-dir. Üçbucağın perimetri $26$ sm olarsa, oturacağını tapın.',
  '[{"key": "A", "text": "$16$ sm"}, {"key": "B", "text": "$6$ sm"}, {"key": "C", "text": "$8$ sm"}, {"key": "D", "text": "$3$ sm"}, {"key": "E", "text": "$10$ sm"}]'::jsonb, 'B', NULL, NULL,
  'Yan tərəf $2\cdot5=10$ sm. Oturacaq: $26-20=6$ sm.',
  2025, 'I', 150, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0039 | əsas: 2025 toplu, I hissə, səh.150 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0039', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucaqların konqruyentlik əlaməti. Fales teoremi. Üçbucağın orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Bərabəryanlı üçbucağın oturacağa paralel olan orta xəttinin uzunluğu $6$ sm-dir. Üçbucağın perimetri $32$ sm olarsa, yan tərəfini tapın.',
  '[{"key": "A", "text": "$20$ sm"}, {"key": "B", "text": "$10$ sm"}, {"key": "C", "text": "$6$ sm"}, {"key": "D", "text": "$12$ sm"}, {"key": "E", "text": "$8$ sm"}]'::jsonb, 'B', NULL, NULL,
  'Oturacaq $12$ sm; yan tərəflər cəmi $20$, hər biri $10$ sm.',
  2025, 'I', 150, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0040 | əsas: 2025 toplu, I hissə, səh.150 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0040', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucaqların konqruyentlik əlaməti. Fales teoremi. Üçbucağın orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Üçbucağın tərəfləri nisbəti $2:3:4$ kimidir. Tərəfləri bu üçbucağın orta xətləri olan ikinci üçbucağın perimetri $6{,}3$ sm-dir. Birinci üçbucağın böyük tərəfini tapın.',
  '[{"key": "A", "text": "$2{,}8$ sm"}, {"key": "B", "text": "$11{,}2$ sm"}, {"key": "C", "text": "$4{,}2$ sm"}, {"key": "D", "text": "$6{,}3$ sm"}, {"key": "E", "text": "$5{,}6$ sm"}]'::jsonb, 'E', NULL, NULL,
  'Orta xətlərdən ibarət üçbucağın perimetri ilkin üçbucağın perimetrinin yarısıdır: $P=12{,}6$ sm. Böyük tərəf: $12{,}6\cdot\dfrac49=5{,}6$ sm.',
  2025, 'I', 150, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0041 | əsas: 2025 toplu, I hissə, səh.150 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0041', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Üçbucaqların konqruyentlik əlaməti. Fales teoremi. Üçbucağın orta xətti'), 'original', 'own', 'az', 'draft', 'closed',
  'Parça düz xətti kəsir və onun ucları düz xətdən $4$ sm və $12$ sm-lik məsafədədir. Parçanın orta nöqtəsi bu düz xətdən hansı məsafədədir?',
  '[{"key": "A", "text": "$16$ sm"}, {"key": "B", "text": "$8$ sm"}, {"key": "C", "text": "$2$ sm"}, {"key": "D", "text": "$4$ sm"}, {"key": "E", "text": "$6$ sm"}]'::jsonb, 'D', NULL, NULL,
  'Parça düz xətti kəsdiyi üçün uclar düz xəttin müxtəlif tərəflərindədir; işarəli məsafələr $12$ və $-4$. Orta nöqtənin məsafəsi $\dfrac{12-4}{2}=4$ sm (trapesiyanın orta xətti kimi düşünmək olar).',
  2025, 'I', 150, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0042 | əsas: 2025 toplu, I hissə, səh.150 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0042', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Bərabəryanlı üçbucaqlar. Bərabərtərəfli üçbucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  'Bərabəryanlı üçbucaqda oturacağa çəkilmiş hündürlük yan tərəfin yarısına bərabər olarsa, oturacağa bitişik bucağı tapın.',
  '[{"key": "A", "text": "$15^\\circ$"}, {"key": "B", "text": "$45^\\circ$"}, {"key": "C", "text": "$30^\\circ$"}, {"key": "D", "text": "$75^\\circ$"}, {"key": "E", "text": "$60^\\circ$"}]'::jsonb, 'C', NULL, NULL,
  'Hündürlük yan tərəfi hipotenuz olan düzbucaqlı üçbucaq yaradır; hipotenuzun yarısına bərabər katetin qarşısındakı bucaq $30^\circ$-dir. Bu bucaq oturacağa bitişik bucaqdır.',
  2025, 'I', 150, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0043 | əsas: 2025 toplu, I hissə, səh.150 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0043', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Bərabəryanlı üçbucaqlar. Bərabərtərəfli üçbucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  'Oturacağı $18$ sm olan bərabəryanlı üçbucağın təpə bucağı $120^\circ$-dir. Yan tərəfini tapın.',
  '[{"key": "A", "text": "$3\\sqrt3$ sm"}, {"key": "B", "text": "$9\\sqrt3$ sm"}, {"key": "C", "text": "$9\\sqrt2$ sm"}, {"key": "D", "text": "$6\\sqrt3$ sm"}, {"key": "E", "text": "$12\\sqrt3$ sm"}]'::jsonb, 'D', NULL, NULL,
  'Oturacaq bucaqları $30^\circ$. Hündürlük oturacağı yarıya bölür: $\cos30^\circ=\dfrac{9}{b}\Rightarrow b=\dfrac{9}{\sqrt3/2}=\dfrac{18}{\sqrt3}=6\sqrt3$ sm.',
  2025, 'I', 150, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0044 | əsas: 2025 toplu, I hissə, səh.153 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0044', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Uzunluğu $36$ sm olan düz xətt parçası hər hansı düz xəttlə $30^\circ$-li bucaq əmələ gətirir. Bu parçanın həmin düz xətt üzərindəki proyeksiyasını tapın.',
  '[{"key": "A", "text": "$18$ sm"}, {"key": "B", "text": "$18\\sqrt3$ sm"}, {"key": "C", "text": "$12\\sqrt3$ sm"}, {"key": "D", "text": "$18\\sqrt2$ sm"}, {"key": "E", "text": "$36$ sm"}]'::jsonb, 'B', NULL, NULL,
  'Proyeksiya $=36\cos30^\circ=36\cdot\dfrac{\sqrt3}{2}=18\sqrt3$ sm.',
  2025, 'I', 153, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0045 | əsas: 2025 toplu, I hissə, səh.153 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0045', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Üçbucağın bucaqları $1:2:3$ nisbətindədir. Onun kiçik tərəfi ilə böyük tərəfinin cəmi $9{,}6$ sm olarsa, böyük tərəfi tapın.',
  '[{"key": "A", "text": "$6{,}4$ sm"}, {"key": "B", "text": "$5{,}6$ sm"}, {"key": "C", "text": "$3{,}2$ sm"}, {"key": "D", "text": "$9{,}6$ sm"}, {"key": "E", "text": "$4{,}8$ sm"}]'::jsonb, 'A', NULL, NULL,
  'Bucaqlar $30^\circ,60^\circ,90^\circ$. Kiçik tərəf ($30^\circ$ qarşısında) hipotenuzun yarısıdır: $x+2x=9{,}6\Rightarrow x=3{,}2$, hipotenuz $6{,}4$ sm.',
  2025, 'I', 153, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0046 | əsas: 2025 toplu, I hissə, səh.153 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0046', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Bərabəryanlı üçbucağın oturacağı $14$ sm, təpə bucağı isə $90^\circ$-dir. Oturacağa endirilmiş hündürlüyü tapın.',
  '[{"key": "A", "text": "$7\\sqrt2$ sm"}, {"key": "B", "text": "$14$ sm"}, {"key": "C", "text": "$7$ sm"}, {"key": "D", "text": "$3{,}5$ sm"}, {"key": "E", "text": "$7\\sqrt3$ sm"}]'::jsonb, 'C', NULL, NULL,
  'Düzbucaqlı üçbucaqda hipotenuza çəkilən median (burada həm də hündürlük) hipotenuzun yarısıdır: $7$ sm.',
  2025, 'I', 153, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0047 | əsas: 2025 toplu, I hissə, səh.153 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0047', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Bərabəryanlı düzbucaqlı üçbucaqda hipotenuza çəkilən hündürlük $9$ sm-dir. Hipotenuzu tapın.',
  '[{"key": "A", "text": "$9$ sm"}, {"key": "B", "text": "$9\\sqrt2$ sm"}, {"key": "C", "text": "$27$ sm"}, {"key": "D", "text": "$18$ sm"}, {"key": "E", "text": "$12$ sm"}]'::jsonb, 'D', NULL, NULL,
  'Bu hündürlük həm də hipotenuza çəkilən mediandır: $c=2h=18$ sm.',
  2025, 'I', 153, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0048 | əsas: 2025 toplu, I hissə, səh.153 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0048', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzbucaqlı üçbucaqda hipotenuza çəkilən medianla hipotenuzun cəmi $45\sqrt3$ sm olarsa, hipotenuzun uzunluğunu tapın.',
  '[{"key": "A", "text": "$30$ sm"}, {"key": "B", "text": "$30\\sqrt3$ sm"}, {"key": "C", "text": "$45\\sqrt3$ sm"}, {"key": "D", "text": "$20\\sqrt3$ sm"}, {"key": "E", "text": "$15\\sqrt3$ sm"}]'::jsonb, 'B', NULL, NULL,
  'Median $\dfrac c2$: $\dfrac{3c}{2}=45\sqrt3\Rightarrow c=30\sqrt3$ sm.',
  2025, 'I', 153, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0049 | əsas: 2025 toplu, I hissə, səh.153 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0049', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Bərabəryanlı düzbucaqlı üçbucaqda hipotenuza endirilən hündürlüklə hipotenuzun cəmi $18\sqrt2$ sm olarsa, hipotenuzu tapın.',
  '[{"key": "A", "text": "$18\\sqrt2$ sm"}, {"key": "B", "text": "$9\\sqrt2$ sm"}, {"key": "C", "text": "$6\\sqrt2$ sm"}, {"key": "D", "text": "$24\\sqrt2$ sm"}, {"key": "E", "text": "$12\\sqrt2$ sm"}]'::jsonb, 'E', NULL, NULL,
  'Hündürlük $\dfrac c2$: $\dfrac{3c}{2}=18\sqrt2\Rightarrow c=12\sqrt2$ sm.',
  2025, 'I', 153, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0050 | əsas: 2025 toplu, I hissə, səh.153 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0050', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Katetləri $9$ sm və $12$ sm olan düzbucaqlı üçbucağın hipotenuzuna çəkilmiş medianın uzunluğunu tapın.',
  '[{"key": "A", "text": "$6$ sm"}, {"key": "B", "text": "$7{,}5$ sm"}, {"key": "C", "text": "$10{,}5$ sm"}, {"key": "D", "text": "$15$ sm"}, {"key": "E", "text": "$7$ sm"}]'::jsonb, 'B', NULL, NULL,
  'Hipotenuz $\sqrt{81+144}=15$; median $7{,}5$ sm.',
  2025, 'I', 153, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0051 | əsas: 2025 toplu, I hissə, səh.153 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0051', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Katetləri $7$ sm və $24$ sm olan düzbucaqlı üçbucağın perimetrini tapın.',
  '[{"key": "A", "text": "$50$ sm"}, {"key": "B", "text": "$48$ sm"}, {"key": "C", "text": "$62$ sm"}, {"key": "D", "text": "$31$ sm"}, {"key": "E", "text": "$56$ sm"}]'::jsonb, 'E', NULL, NULL,
  'Hipotenuz $\sqrt{49+576}=25$; $P=7+24+25=56$ sm.',
  2025, 'I', 153, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0052 | əsas: 2025 toplu, I hissə, səh.153 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0052', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzbucaqlı üçbucağın katetlərinin hipotenuz üzərindəki proyeksiyalarının uzunluqları $18$ sm və $32$ sm-ə bərabərdir. Düz bucaq təpəsindən hipotenuza çəkilmiş hündürlüyü tapın.',
  '[{"key": "A", "text": "$24$ sm"}, {"key": "B", "text": "$50$ sm"}, {"key": "C", "text": "$14$ sm"}, {"key": "D", "text": "$36$ sm"}, {"key": "E", "text": "$25$ sm"}]'::jsonb, 'A', NULL, NULL,
  '$h^2=18\cdot32=576\Rightarrow h=24$ sm.',
  2025, 'I', 153, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0053 | əsas: 2025 toplu, I hissə, səh.153 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0053', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzbucaqlı üçbucağın katetlərinin hipotenuz üzərindəki proyeksiyaları $8$ sm və $50$ sm-dir. Düz bucaq təpəsindən hipotenuza çəkilmiş hündürlüyü tapın.',
  '[{"key": "A", "text": "$29$ sm"}, {"key": "B", "text": "$20$ sm"}, {"key": "C", "text": "$58$ sm"}, {"key": "D", "text": "$16$ sm"}, {"key": "E", "text": "$42$ sm"}]'::jsonb, 'B', NULL, NULL,
  '$h=\sqrt{8\cdot50}=\sqrt{400}=20$ sm.',
  2025, 'I', 153, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0054 | əsas: 2025 toplu, I hissə, səh.154 №19
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0054', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzbucaqlı üçbucağın katetlərinin hipotenuz üzərindəki proyeksiyalarının uzunluqları $12$ sm və $75$ sm-ə bərabərdir. Düz bucaq təpəsindən hipotenuza çəkilmiş hündürlüyü tapın.',
  '[{"key": "A", "text": "$36$ sm"}, {"key": "B", "text": "$25$ sm"}, {"key": "C", "text": "$45$ sm"}, {"key": "D", "text": "$87$ sm"}, {"key": "E", "text": "$30$ sm"}]'::jsonb, 'E', NULL, NULL,
  '$h=\sqrt{12\cdot75}=\sqrt{900}=30$ sm.',
  2025, 'I', 154, 19)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0055 | əsas: 2025 toplu, I hissə, səh.154 №20
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0055', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzbucaqlı üçbucağın iti bucaq təpəsindən çəkilən tənbölən qarşıdakı katetlə $72^\circ$-li bucaq əmələ gətirir. Üçbucağın böyük iti bucağını tapın.',
  '[{"key": "A", "text": "$45^\\circ$"}, {"key": "B", "text": "$72^\\circ$"}, {"key": "C", "text": "$36^\\circ$"}, {"key": "D", "text": "$54^\\circ$"}, {"key": "E", "text": "$18^\\circ$"}]'::jsonb, 'D', NULL, NULL,
  '$\angle C=90^\circ$, $A$-dan çəkilən tənbölən $BC$-ni $D$-də kəsir, $\angle ADC=72^\circ$. $ADC$ üçbucağında $\angle CAD=90^\circ-72^\circ=18^\circ$, onda $\angle A=36^\circ$, $\angle B=54^\circ$. Böyük iti bucaq $54^\circ$.',
  2025, 'I', 154, 20)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0056 | əsas: 2025 toplu, I hissə, səh.154 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0056', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzbucaqlı üçbucaqda hipotenuza çəkilmiş hündürlük $3$ sm-ə, katetlərdən biri isə $3\sqrt2$ sm-ə bərabərdir. Bu üçbucağın iti bucaqlarını tapın.',
  '[{"key": "A", "text": "$40^\\circ;\\ 50^\\circ$"}, {"key": "B", "text": "$15^\\circ;\\ 75^\\circ$"}, {"key": "C", "text": "$20^\\circ;\\ 70^\\circ$"}, {"key": "D", "text": "$45^\\circ;\\ 45^\\circ$"}, {"key": "E", "text": "$30^\\circ;\\ 60^\\circ$"}]'::jsonb, 'D', NULL, NULL,
  'Hündürlük, katet və hipotenuzun hissəsi düzbucaqlı üçbucaq yaradır: kateti hipotenuz kimi götürsək, $\sin\varphi=\dfrac{3}{3\sqrt2}=\dfrac{\sqrt2}{2}$, $\varphi=45^\circ$. Bu, böyük üçbucağın iti bucağıdır; o biri də $45^\circ$.',
  2025, 'I', 154, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0057 | əsas: 2025 toplu, I hissə, səh.154 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0057', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Üçbucağın bucaqlarının nisbəti $1:2:3$ kimidir. Böyük tərəfin uzunluğu $14$ sm-dir. Böyük tərəfə çəkilmiş medianla kiçik tərəfin uzunluqları cəmini tapın.',
  '[{"key": "A", "text": "$14$ sm"}, {"key": "B", "text": "$10{,}5$ sm"}, {"key": "C", "text": "$21$ sm"}, {"key": "D", "text": "$7$ sm"}, {"key": "E", "text": "$12$ sm"}]'::jsonb, 'A', NULL, NULL,
  'Bucaqlar $30^\circ,60^\circ,90^\circ$; böyük tərəf hipotenuzdur. Hipotenuza çəkilən median $\dfrac{14}{2}=7$, $30^\circ$ qarşısındakı kiçik katet də $7$. Cəm $14$ sm.',
  2025, 'I', 154, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0058 | əsas: 2025 toplu, I hissə, səh.154 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0058', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzbucaqlı üçbucağın iti bucaqlarından biri $60^\circ$, ona bitişik katet $5$ sm-dir. Hipotenuza çəkilmiş medianın uzunluğunu tapın.',
  '[{"key": "A", "text": "$5\\sqrt3$ sm"}, {"key": "B", "text": "$5\\sqrt2$ sm"}, {"key": "C", "text": "$2{,}5$ sm"}, {"key": "D", "text": "$10$ sm"}, {"key": "E", "text": "$5$ sm"}]'::jsonb, 'E', NULL, NULL,
  'Hipotenuz $=\dfrac{5}{\cos60^\circ}=10$; median hipotenuzun yarısı: $5$ sm.',
  2025, 'I', 154, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0059 | əsas: 2025 toplu, I hissə, səh.154 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0059', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzbucaqlı üçbucağın iti bucağı $70^\circ$-yə bərabərdir. Bu üçbucağın düz bucaq təpəsindən çəkilmiş hündürlüyü və medianı arasındakı bucağı tapın.',
  '[{"key": "A", "text": "$25^\\circ$"}, {"key": "B", "text": "$50^\\circ$"}, {"key": "C", "text": "$40^\\circ$"}, {"key": "D", "text": "$20^\\circ$"}, {"key": "E", "text": "$45^\\circ$"}]'::jsonb, 'B', NULL, NULL,
  '$\angle A=70^\circ$, $\angle B=20^\circ$. Median $CM=MB$, ona görə $\angle MCB=20^\circ$. Hündürlük $CH$ ilə $\angle HCB=90^\circ-20^\circ=70^\circ$. Aralarındakı bucaq $70^\circ-20^\circ=50^\circ$.',
  2025, 'I', 154, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0060 | əsas: 2025 toplu, I hissə, səh.154 №27
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0060', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzbucaqlı üçbucağın iti bucağı $70^\circ$-yə bərabərdir. Bu üçbucağın düz bucaq təpəsindən çəkilmiş tənböləni və medianı arasındakı bucağı tapın.',
  '[{"key": "A", "text": "$20^\\circ$"}, {"key": "B", "text": "$25^\\circ$"}, {"key": "C", "text": "$50^\\circ$"}, {"key": "D", "text": "$15^\\circ$"}, {"key": "E", "text": "$45^\\circ$"}]'::jsonb, 'B', NULL, NULL,
  'Tənbölən $\angle C$-ni $45^\circ$-yə bölür; median $B$ tərəfdə $20^\circ$ əmələ gətirir ($\angle MCB=\angle B=20^\circ$). Aralarındakı bucaq $45^\circ-20^\circ=25^\circ$.',
  2025, 'I', 154, 27)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0061 | əsas: 2025 toplu, I hissə, səh.154 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0061', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Katetləri $a=15$ sm, $b=20$ sm olan düzbucaqlı üçbucaqda $a$ katetinin hipotenuz üzərindəki proyeksiyasını tapın.',
  '[{"key": "A", "text": "$16$ sm"}, {"key": "B", "text": "$7{,}5$ sm"}, {"key": "C", "text": "$12$ sm"}, {"key": "D", "text": "$10$ sm"}, {"key": "E", "text": "$9$ sm"}]'::jsonb, 'E', NULL, NULL,
  '$c=25$; $a_c=\dfrac{a^2}{c}=\dfrac{225}{25}=9$ sm.',
  2025, 'I', 154, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0062 | əsas: 2025 toplu, I hissə, səh.154 №31
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0062', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzbucaqlı üçbucağın iti bucaqlarından biri $60^\circ$, hipotenuzu ilə kiçik katetin cəmi $21$ sm-dir. Hipotenuzun uzunluğunu tapın.',
  '[{"key": "A", "text": "$7$ sm"}, {"key": "B", "text": "$10{,}5$ sm"}, {"key": "C", "text": "$7\\sqrt3$ sm"}, {"key": "D", "text": "$12$ sm"}, {"key": "E", "text": "$14$ sm"}]'::jsonb, 'E', NULL, NULL,
  'Kiçik katet $30^\circ$ qarşısındadır: $\dfrac c2$. $\dfrac{3c}{2}=21\Rightarrow c=14$ sm.',
  2025, 'I', 154, 31)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0063 | əsas: 2025 toplu, I hissə, səh.154 №32
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0063', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ düzbucaqlı üçbucağında $\angle C=90^\circ$, $\angle A=60^\circ$, $CM$ — hündürlükdür. $AM=5$ sm olarsa, $MB$-ni tapın.',
  '[{"key": "A", "text": "$5\\sqrt3$ sm"}, {"key": "B", "text": "$25$ sm"}, {"key": "C", "text": "$15$ sm"}, {"key": "D", "text": "$20$ sm"}, {"key": "E", "text": "$10$ sm"}]'::jsonb, 'C', NULL, NULL,
  '$ACM$ üçbucağında $\angle ACM=30^\circ$: $AC=2AM=10$. $ABC$-də $\angle B=30^\circ$: $AB=2AC=20$. $MB=20-5=15$ sm.',
  2025, 'I', 154, 32)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0064 | əsas: 2025 toplu, I hissə, səh.154 №34
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0064', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ düzbucaqlı üçbucağında $\angle C=90^\circ$, $D$ nöqtəsi $BC$ katetinin üzərindədir. $AB=12$, $BD=4\sqrt3$, $DC=2\sqrt3$ olarsa, $AD$-ni tapın.',
  '[{"key": "A", "text": "$4\\sqrt2$"}, {"key": "B", "text": "$4\\sqrt3$"}, {"key": "C", "text": "$8$"}, {"key": "D", "text": "$2\\sqrt{15}$"}, {"key": "E", "text": "$6$"}]'::jsonb, 'B', NULL, NULL,
  '$BC=6\sqrt3$, $AC^2=144-108=36$. $AD^2=AC^2+DC^2=36+12=48\Rightarrow AD=4\sqrt3$.',
  2025, 'I', 154, 34)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0065 | əsas: 2025 toplu, I hissə, səh.155 №38
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0065', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Oturacağı $22$ sm olan bərabəryanlı üçbucağın təpə bucağı $90^\circ$ olarsa, yan tərəfini tapın.',
  '[{"key": "A", "text": "$11\\sqrt3$ sm"}, {"key": "B", "text": "$11\\sqrt2$ sm"}, {"key": "C", "text": "$11$ sm"}, {"key": "D", "text": "$22\\sqrt2$ sm"}, {"key": "E", "text": "$22$ sm"}]'::jsonb, 'B', NULL, NULL,
  'Yan tərəflər katetdir: $b\sqrt2=22\Rightarrow b=11\sqrt2$ sm.',
  2025, 'I', 155, 38)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0066 | əsas: 2025 toplu, I hissə, səh.155 №43
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0066', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzbucaqlı üçbucaqda iti bucaqların nisbəti $1:2$ kimidir. Düz bucaq təpəsindən çəkilmiş median və hündürlük arasındakı bucağı tapın.',
  '[{"key": "A", "text": "$60^\\circ$"}, {"key": "B", "text": "$45^\\circ$"}, {"key": "C", "text": "$30^\\circ$"}, {"key": "D", "text": "$15^\\circ$"}, {"key": "E", "text": "$20^\\circ$"}]'::jsonb, 'C', NULL, NULL,
  'Bucaqlar $30^\circ$ və $60^\circ$. Median və hündürlük arasındakı bucaq iti bucaqların fərqinə bərabərdir: $30^\circ$.',
  2025, 'I', 155, 43)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0067 | əsas: 2025 toplu, I hissə, səh.155 №45
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0067', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ düzbucaqlı üçbucağında $\angle C=90^\circ$, $CD\perp AB$, $AC=3$, $BC=7$ olarsa, $\dfrac{BD}{AD}$ nisbətini tapın.',
  '[{"key": "A", "text": "$\\dfrac{7}{3}$"}, {"key": "B", "text": "$\\dfrac{58}{9}$"}, {"key": "C", "text": "$\\dfrac{49}{9}$"}, {"key": "D", "text": "$\\dfrac{3}{7}$"}, {"key": "E", "text": "$\\dfrac{9}{49}$"}]'::jsonb, 'C', NULL, NULL,
  '$BC^2=BD\cdot AB$, $AC^2=AD\cdot AB$. Bölsək: $\dfrac{BD}{AD}=\dfrac{BC^2}{AC^2}=\dfrac{49}{9}$.',
  2025, 'I', 155, 45)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0068 | əsas: 2025 toplu, I hissə, səh.155 №46
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0068', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ düzbucaqlı üçbucağında $\angle C=90^\circ$, $CD\perp AB$, $AD=16$, $DB=9$ olarsa, $\dfrac{AC}{CB}$ nisbətini tapın.',
  '[{"key": "A", "text": "$\\dfrac{4}{3}$"}, {"key": "B", "text": "$\\dfrac{5}{3}$"}, {"key": "C", "text": "$\\dfrac{16}{9}$"}, {"key": "D", "text": "$\\dfrac{3}{4}$"}, {"key": "E", "text": "$\\dfrac{9}{16}$"}]'::jsonb, 'A', NULL, NULL,
  '$\dfrac{AC^2}{CB^2}=\dfrac{AD}{DB}=\dfrac{16}{9}\Rightarrow\dfrac{AC}{CB}=\dfrac43$.',
  2025, 'I', 155, 46)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0069 | əsas: 2025 toplu, I hissə, səh.155 №47
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0069', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzbucaqlı üçbucağın düz bucağının tənböləni ilə bir iti bucağının tənböləni $75^\circ$-li bucaq altında kəsişir. Bu üçbucağın kiçik iti bucağını tapın.',
  '[{"key": "A", "text": "$60^\\circ$"}, {"key": "B", "text": "$45^\\circ$"}, {"key": "C", "text": "$20^\\circ$"}, {"key": "D", "text": "$15^\\circ$"}, {"key": "E", "text": "$30^\\circ$"}]'::jsonb, 'E', NULL, NULL,
  'Tənbölənlərin arasındakı küt bucaq $180^\circ-75^\circ=105^\circ$. Tənbölənlərin və hipotenuzun yaratdığı üçbucaqda: $45^\circ+\dfrac{\alpha}{2}+105^\circ=180^\circ\Rightarrow\alpha=60^\circ$. Digər iti bucaq $30^\circ$ — kiçiyi $30^\circ$.',
  2025, 'I', 155, 47)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0070 | əsas: 2025 toplu, I hissə, səh.155 №49
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0070', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ üçbucağında $\angle C=90^\circ$, $CD\perp AB$, $\angle DAC=60^\circ$, $AC=12$ olarsa, $BD$-ni tapın.',
  '[{"key": "A", "text": "$18$"}, {"key": "B", "text": "$12$"}, {"key": "C", "text": "$6$"}, {"key": "D", "text": "$24$"}, {"key": "E", "text": "$9$"}]'::jsonb, 'A', NULL, NULL,
  '$AD=AC\cos60^\circ=6$, $AB=\dfrac{AC}{\cos60^\circ}=24$. $BD=24-6=18$.',
  2025, 'I', 155, 49)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0071 | əsas: 2025 toplu, I hissə, səh.156 №55
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0071', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzbucaqlı $ABC$ üçbucağında $\angle C=90^\circ$, $CD\perp AB$, $AC=6$, $BC=9$ olarsa, $\dfrac{BD}{AD}$ nisbətini tapın.',
  '[{"key": "A", "text": "$\\dfrac{9}{4}$"}, {"key": "B", "text": "$\\dfrac{3}{2}$"}, {"key": "C", "text": "$\\dfrac{13}{9}$"}, {"key": "D", "text": "$\\dfrac{4}{9}$"}, {"key": "E", "text": "$\\dfrac{2}{3}$"}]'::jsonb, 'A', NULL, NULL,
  '$\dfrac{BD}{AD}=\dfrac{BC^2}{AC^2}=\dfrac{81}{36}=\dfrac94$.',
  2025, 'I', 156, 55)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0072 | əsas: 2025 toplu, I hissə, səh.156 №58
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0072', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ üçbucağında $\angle C=90^\circ$, $CD\perp AB$, $DC=12$ sm, $BC=15$ sm olarsa, $AC$-ni tapın.',
  '[{"key": "A", "text": "$9$ sm"}, {"key": "B", "text": "$12$ sm"}, {"key": "C", "text": "$16$ sm"}, {"key": "D", "text": "$20$ sm"}, {"key": "E", "text": "$25$ sm"}]'::jsonb, 'D', NULL, NULL,
  '$BD=\sqrt{225-144}=9$. $BC^2=BD\cdot AB\Rightarrow AB=25$. $AC=\sqrt{625-225}=20$ sm.',
  2025, 'I', 156, 58)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0073 | əsas: 2025 toplu, I hissə, səh.156 №61
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0073', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Mərkəzləri düzbucaqlı üçbucağın iti bucaq təpələrində olan iki çevrənin hər biri düz bucaq təpəsindən keçir. Üçbucağın katetləri $9$ sm və $12$ sm olarsa, çevrələrin kəsişmə nöqtələri arasındakı məsafəni tapın.',
  '[{"key": "A", "text": "$12$ sm"}, {"key": "B", "text": "$18$ sm"}, {"key": "C", "text": "$14{,}4$ sm"}, {"key": "D", "text": "$7{,}2$ sm"}, {"key": "E", "text": "$15$ sm"}]'::jsonb, 'C', NULL, NULL,
  'İki çevrənin ümumi vətəri mərkəzləri birləşdirən hipotenuza perpendikulyardır və onunla yarıya bölünür. Vətərin yarısı düz bucaq təpəsindən hipotenuza çəkilən hündürlükdür: $h=\dfrac{9\cdot12}{15}=7{,}2$. Məsafə $2h=14{,}4$ sm.',
  2025, 'I', 156, 61)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0074 | əsas: 2025 toplu, I hissə, səh.156 №62
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0074', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'written',
  'Düz xətdən $5$ sm məsafədə yerləşən nöqtədən bu düz xəttə hər birinin uzunluğu $13$ sm olan iki mail çəkilmişdir. Maillərin oturacaqları arasındakı məsafəni (sm-lə) tapın.',
  NULL, NULL, NULL, '24',
  'Hər mailin proyeksiyası $\sqrt{13^2-5^2}=12$. Bərabər maillər perpendikulyarın müxtəlif tərəflərindədir: $2\cdot12=24$ sm.',
  2025, 'I', 156, 62)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0075 | əsas: 2025 toplu, I hissə, səh.156 №63
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0075', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'written',
  'Düz xətdən $5$ sm məsafədə yerləşən nöqtədən bu düz xəttə iki bərabər mail çəkilmişdir. Maillərin oturacaqları arasındakı məsafə $24$ sm olarsa, maillərin uzunluqlarını (sm-lə) tapın.',
  NULL, NULL, NULL, '13',
  'Proyeksiyalar $12$-yə bərabərdir; mail $\sqrt{12^2+5^2}=13$ sm.',
  2025, 'I', 156, 63)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0076 | əsas: 2025 toplu, I hissə, səh.156 №65
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0076', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Üçbucaqda $\sin\alpha=\dfrac{3}{\sqrt{34}}$ və $a^2+b^2=c^2$ olarsa ($\alpha$ bucağı $a$ tərəfinin qarşısındadır), $\dfrac{2a+3b}{4b-a}$ ifadəsinin qiymətini tapın.',
  '[{"key": "A", "text": "$1$"}, {"key": "B", "text": "$\\dfrac{21}{34}$"}, {"key": "C", "text": "$\\dfrac{3}{5}$"}, {"key": "D", "text": "$\\dfrac{17}{21}$"}, {"key": "E", "text": "$\\dfrac{21}{17}$"}]'::jsonb, 'E', NULL, NULL,
  '$c$ hipotenuzdur, $\sin\alpha=\dfrac ac=\dfrac{3}{\sqrt{34}}$: $a=3k$, $c=\sqrt{34}k$, $b=\sqrt{34-9}\,k=5k$. $\dfrac{6k+15k}{20k-3k}=\dfrac{21}{17}$.',
  2025, 'I', 156, 65)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0077 | əsas: 2025 toplu, I hissə, səh.157 №67
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0077', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'written',
  'İtibucaqlı üçbucağın iki tərəfi $13$ və $15$, üçüncü tərəfə çəkilmiş hündürlüyü $12$ olarsa, bu üçbucağın üçüncü tərəfini tapın.',
  NULL, NULL, NULL, '14',
  'Hündürlük üçüncü tərəfi $\sqrt{169-144}=5$ və $\sqrt{225-144}=9$ hissələrinə bölür (itibucaqlı olduğundan hündürlüyün oturacağı tərəfin daxilindədir). Üçüncü tərəf $14$.',
  2025, 'I', 157, 67)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0078 | əsas: 2025 toplu, I hissə, səh.157 №68
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0078', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'written',
  'İki tərəfi $17$ və $10$, üçüncü tərəfə çəkilmiş hündürlüyün bu tərəfdən ayırdığı böyük parçası $15$ olan üçbucağın üçüncü tərəfini tapın.',
  NULL, NULL, NULL, '21',
  '$h=\sqrt{17^2-15^2}=8$. Digər parça $\sqrt{10^2-8^2}=6$. Üçüncü tərəf $15+6=21$.',
  2025, 'I', 157, 68)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0079 | əsas: 2025 toplu, I hissə, səh.157 №69
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0079', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'written',
  'Katetləri $9$ və $12$-yə bərabər olan düzbucaqlı üçbucağın hipotenuzundan böyük orta xəttinə qədər olan məsafəni tapın.',
  NULL, NULL, NULL, '3,6',
  'Böyük orta xətt hipotenuza paraleldir və hipotenuza çəkilən hündürlüyü yarıya bölür. $h=\dfrac{9\cdot12}{15}=7{,}2$; məsafə $3{,}6$.',
  2025, 'I', 157, 69)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0080 | əsas: 2025 toplu, I hissə, səh.157 №73
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0080', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'written',
  'Bərabəryanlı $ABC$ üçbucağında $AB=AC$ və $\operatorname{tg}\angle A=\dfrac{12}{5}$ olarsa, $\operatorname{tg}\angle B$-ni tapın.',
  NULL, NULL, NULL, '1,5',
  '$\angle B=90^\circ-\dfrac{\angle A}{2}$, ona görə $\operatorname{tg}B=\operatorname{ctg}\dfrac A2$. $t=\operatorname{tg}\dfrac A2$: $\dfrac{2t}{1-t^2}=\dfrac{12}{5}\Rightarrow6t^2+5t-6=0\Rightarrow t=\dfrac23$. $\operatorname{tg}B=\dfrac32=1{,}5$.',
  2025, 'I', 157, 73)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0081 | əsas: 2025 toplu, I hissə, səh.157 №75
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0081', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'written',
  '$ABC$ üçbucağında $D$ nöqtəsi $AC$ tərəfi üzərindədir, $\angle CBD=90^\circ$, $\angle BCD=18^\circ$ və $CD=2AB$ olarsa, $\angle BAD$-nin dərəcə ölçüsünü tapın.',
  NULL, NULL, NULL, '36',
  '$M$ — $CD$-nin ortası olsun. $CBD$ düzbucaqlı üçbucaqdır, ona görə $BM=MC=MD=\dfrac{CD}{2}=AB$. $\angle MBC=\angle MCB=18^\circ$, xarici bucaq $\angle BMD=36^\circ$. $ABM$ üçbucağı bərabəryanlıdır ($AB=BM$): $\angle BAD=\angle BMA=36^\circ$.',
  2025, 'I', 157, 75)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0082 | əsas: 2025 toplu, I hissə, səh.159 №86
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0082', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'written',
  'Dron $C$ nöqtəsindədir, onun yer üzərindəki proyeksiyası $K$-dır. $AK=32$ m, $KB=8$ m ($K$ nöqtəsi $A$ ilə $B$ arasındadır) və $ACB$ bucağı düz bucaq olarsa, dronun yerdən məsafəsini ($CK$-nı) hesablayın.',
  NULL, NULL, NULL, '16',
  '$CK$ düzbucaqlı $ACB$ üçbucağında hipotenuza çəkilən hündürlükdür: $CK=\sqrt{AK\cdot KB}=\sqrt{256}=16$ m.',
  2025, 'I', 159, 86)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0083 | əsas: 2025 toplu, I hissə, səh.159 №90
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0083', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'written',
  '$AB\perp BC$, $BC\perp CD$, $A$ və $D$ nöqtələri $BC$ düz xəttinin müxtəlif tərəflərindədir. $AB=\sqrt2$ sm, $CD=3\sqrt2$ sm, $BC=2$ sm olarsa, $A$ və $D$ nöqtələri arasındakı ən qısa məsafəni tapın.',
  NULL, NULL, NULL, '6',
  '$A$ və $D$-ni koordinat müstəvisində yerləşdirək: $B(0;0)$, $C(2;0)$, $A(0;\sqrt2)$, $D(2;-3\sqrt2)$. $AD=\sqrt{2^2+(4\sqrt2)^2}=\sqrt{4+32}=6$ sm.',
  2025, 'I', 159, 90)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0084 | əsas: 2025 toplu, I hissə, səh.160 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0084', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Sinuslar teoremi. Kosinuslar teoremi'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ üçbucağında $\angle C=45^\circ$, $\angle B=60^\circ$ və $AB=6\sqrt2$ sm. $AC$-ni tapın.',
  '[{"key": "A", "text": "$6\\sqrt2$ sm"}, {"key": "B", "text": "$9$ sm"}, {"key": "C", "text": "$12$ sm"}, {"key": "D", "text": "$3\\sqrt6$ sm"}, {"key": "E", "text": "$6\\sqrt3$ sm"}]'::jsonb, 'E', NULL, NULL,
  'Sinuslar teoremi: $\dfrac{AC}{\sin B}=\dfrac{AB}{\sin C}\Rightarrow AC=\dfrac{6\sqrt2\cdot\frac{\sqrt3}{2}}{\frac{\sqrt2}{2}}=6\sqrt3$ sm.',
  2025, 'I', 160, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0085 | əsas: 2025 toplu, I hissə, səh.160 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0085', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Sinuslar teoremi. Kosinuslar teoremi'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ üçbucağının tərəfləri $BC=7$ sm, $AC=5$ sm və $AB=8$ sm olarsa, $A$ bucağının kosinusunu tapın.',
  '[{"key": "A", "text": "$\\dfrac{\\sqrt3}{2}$"}, {"key": "B", "text": "$\\dfrac{2}{5}$"}, {"key": "C", "text": "$\\dfrac{1}{2}$"}, {"key": "D", "text": "$\\dfrac{7}{10}$"}, {"key": "E", "text": "$\\dfrac{5}{8}$"}]'::jsonb, 'C', NULL, NULL,
  '$\cos A=\dfrac{AC^2+AB^2-BC^2}{2\cdot AC\cdot AB}=\dfrac{25+64-49}{80}=\dfrac12$.',
  2025, 'I', 160, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0086 | əsas: 2025 toplu, I hissə, səh.160 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0086', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Sinuslar teoremi. Kosinuslar teoremi'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ üçbucağında $\angle C=45^\circ$, $\angle B=30^\circ$ və $AC=4$ sm olarsa, $AB$-ni tapın.',
  '[{"key": "A", "text": "$4\\sqrt3$ sm"}, {"key": "B", "text": "$2\\sqrt6$ sm"}, {"key": "C", "text": "$4\\sqrt2$ sm"}, {"key": "D", "text": "$2\\sqrt2$ sm"}, {"key": "E", "text": "$8$ sm"}]'::jsonb, 'C', NULL, NULL,
  '$\dfrac{AB}{\sin C}=\dfrac{AC}{\sin B}\Rightarrow AB=\dfrac{4\cdot\frac{\sqrt2}{2}}{\frac12}=4\sqrt2$ sm.',
  2025, 'I', 160, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0087 | əsas: 2025 toplu, I hissə, səh.160 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0087', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Sinuslar teoremi. Kosinuslar teoremi'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ üçbucağında $\angle A=75^\circ$, $\angle B=60^\circ$, $AB=4$ dm olarsa, $AC$ tərəfini tapın.',
  '[{"key": "A", "text": "$2\\sqrt6$ dm"}, {"key": "B", "text": "$4\\sqrt2$ dm"}, {"key": "C", "text": "$2\\sqrt3$ dm"}, {"key": "D", "text": "$4\\sqrt3$ dm"}, {"key": "E", "text": "$\\sqrt6$ dm"}]'::jsonb, 'A', NULL, NULL,
  '$\angle C=45^\circ$. $AC=\dfrac{AB\sin B}{\sin C}=\dfrac{4\cdot\frac{\sqrt3}{2}}{\frac{\sqrt2}{2}}=2\sqrt6$ dm.',
  2025, 'I', 160, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0088 | əsas: 2025 toplu, I hissə, səh.160 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0088', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Sinuslar teoremi. Kosinuslar teoremi'), 'original', 'own', 'az', 'draft', 'closed',
  'Tərəfləri $3$ sm, $5$ sm, $7$ sm olan üçbucağın kiçik bucağının kosinusunu tapın.',
  '[{"key": "A", "text": "$\\dfrac{5}{7}$"}, {"key": "B", "text": "$\\dfrac{1}{2}$"}, {"key": "C", "text": "$-\\dfrac12$"}, {"key": "D", "text": "$\\dfrac{11}{14}$"}, {"key": "E", "text": "$\\dfrac{13}{14}$"}]'::jsonb, 'E', NULL, NULL,
  'Kiçik bucaq kiçik tərəfin ($3$) qarşısındadır: $\cos\alpha=\dfrac{25+49-9}{2\cdot5\cdot7}=\dfrac{65}{70}=\dfrac{13}{14}$.',
  2025, 'I', 160, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0089 | əsas: 2025 toplu, I hissə, səh.160 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0089', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Sinuslar teoremi. Kosinuslar teoremi'), 'original', 'own', 'az', 'draft', 'closed',
  'Tərəfləri $5$ sm, $5$ sm, $8$ sm olan üçbucağın böyük bucağının kosinusunu tapın.',
  '[{"key": "A", "text": "$-\\dfrac{7}{25}$"}, {"key": "B", "text": "$-\\dfrac{4}{5}$"}, {"key": "C", "text": "$\\dfrac{3}{5}$"}, {"key": "D", "text": "$\\dfrac{7}{25}$"}, {"key": "E", "text": "$\\dfrac{4}{5}$"}]'::jsonb, 'A', NULL, NULL,
  'Böyük bucaq $8$-in qarşısındadır: $\cos\gamma=\dfrac{25+25-64}{50}=-\dfrac{7}{25}$ (bucaq kütdür).',
  2025, 'I', 160, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0090 | əsas: 2025 toplu, I hissə, səh.161 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0090', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Sinuslar teoremi. Kosinuslar teoremi'), 'original', 'own', 'az', 'draft', 'open',
  '$ABC$ üçbucağında $\angle B=120^\circ$, $AB=5$, $BC=3$ olarsa, $AC$-ni tapın.',
  NULL, NULL, NULL, '7',
  '$AC^2=25+9-2\cdot5\cdot3\cos120^\circ=34+15=49\Rightarrow AC=7$.',
  2025, 'I', 161, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0091 | əsas: 2025 toplu, I hissə, səh.161 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0091', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Sinuslar teoremi. Kosinuslar teoremi'), 'original', 'own', 'az', 'draft', 'open',
  '$ABC$ üçbucağında $\angle A=60^\circ$, $AB=16$, $AC=10$ olarsa, $BC$-ni tapın.',
  NULL, NULL, NULL, '14',
  '$BC^2=256+100-160=196\Rightarrow BC=14$.',
  2025, 'I', 161, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0092 | əsas: 2025 toplu, I hissə, səh.161 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0092', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Sinuslar teoremi. Kosinuslar teoremi'), 'original', 'own', 'az', 'draft', 'open',
  'Tərəfləri $a,\ b$ və $c$ olan üçbucağın tərəfləri $a^2=b^2+c^2-bc$ münasibətini ödəyir. Üçbucağın $a$ tərəfi qarşısındakı bucağın dərəcə ölçüsünü tapın.',
  NULL, NULL, NULL, '60',
  'Kosinuslar teoremi: $a^2=b^2+c^2-2bc\cos A$. Müqayisə: $2\cos A=1\Rightarrow\cos A=\dfrac12\Rightarrow A=60^\circ$.',
  2025, 'I', 161, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0093 | əsas: 2025 toplu, I hissə, səh.161 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0093', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Sinuslar teoremi. Kosinuslar teoremi'), 'original', 'own', 'az', 'draft', 'open',
  'Tərəfləri $a,\ b$ və $c$ olan üçbucağın tərəfləri $b^2=a^2+c^2+ac$ münasibətini ödəyir. Üçbucağın $b$ tərəfi qarşısındakı bucağın dərəcə ölçüsünü tapın.',
  NULL, NULL, NULL, '120',
  '$-2\cos B=1\Rightarrow\cos B=-\dfrac12\Rightarrow B=120^\circ$.',
  2025, 'I', 161, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0094 | əsas: 2025 toplu, I hissə, səh.161 №27
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0094', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Sinuslar teoremi. Kosinuslar teoremi'), 'original', 'own', 'az', 'draft', 'closed',
  '$45^\circ$-li bucağı qarşısındakı tərəfi $8$ olan üçbucağın böyük tərəfinin mümkün olan ən böyük qiymətini tapın.',
  '[{"key": "A", "text": "$16$"}, {"key": "B", "text": "$4\\sqrt2$"}, {"key": "C", "text": "$8$"}, {"key": "D", "text": "$8\\sqrt2$"}, {"key": "E", "text": "$8\\sqrt3$"}]'::jsonb, 'D', NULL, NULL,
  'Sinuslar teoremi: istənilən tərəf $x=\dfrac{8}{\sin45^\circ}\sin\varphi=8\sqrt2\sin\varphi\le8\sqrt2$. Bərabərlik $\varphi=90^\circ$ olduqda alınır (onda digər bucaq $45^\circ$-dir, üçbucaq mövcuddur). Cavab: $8\sqrt2$.',
  2025, 'I', 161, 27)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0095 | əsas: 2025 toplu, I hissə, səh.161 №31
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0095', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Sinuslar teoremi. Kosinuslar teoremi'), 'original', 'own', 'az', 'draft', 'written',
  'İti bucaqları qarşısındakı tərəfləri $7$ və $4$ olan korbucaqlı üçbucağın üçüncü tərəfinin ala biləcəyi ən kiçik və ən böyük natural qiymətlərinin cəmini tapın.',
  NULL, NULL, NULL, '19',
  'Üçüncü tərəf kor bucağın qarşısındadır: $c^2>7^2+4^2=65$, yəni $c\ge9$. Üçbucaq bərabərsizliyi: $c<11$. $c\in\{9;10\}$, cəm $19$.',
  2025, 'I', 161, 31)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0096 | əsas: 2025 toplu, I hissə, səh.161 №32
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0096', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Sinuslar teoremi. Kosinuslar teoremi'), 'original', 'own', 'az', 'draft', 'written',
  'İti bucaqları qarşısındakı tərəfləri $6$ və $3$ olan korbucaqlı üçbucağın üçüncü tərəfinin ala biləcəyi ən kiçik və ən böyük natural qiymətlərinin cəmini tapın.',
  NULL, NULL, NULL, '15',
  '$c^2>36+9=45\Rightarrow c\ge7$; $c<9$. $c\in\{7;8\}$, cəm $15$.',
  2025, 'I', 161, 32)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0097 | əsas: 2025 toplu, I hissə, səh.155 №39
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0097', '/images/tasks/UCB-0097.png', 'Düzbucaqlı üçbucaq; düz bucaq təpəsindən hipotenuza hündürlük 6, hipotenuzun bir hissəsi 12, digər hissəsi x', (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Şəkildə düzbucaqlı üçbucaq və onun düz bucaq təpəsindən hipotenuza çəkilmiş hündürlüyü verilmişdir. $x$ parçasının uzunluğunu tapın.',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "$3$"}, {"key": "C", "text": "$6$"}, {"key": "D", "text": "$9$"}, {"key": "E", "text": "$4$"}]'::jsonb, 'B', NULL, NULL,
  'Düz bucaq təpəsindən çəkilən hündürlük hipotenuzun hissələrinin ədədi ortasıdır (həndəsi ortası): $h^2=12\cdot x\Rightarrow36=12x\Rightarrow x=3$.',
  2025, 'I', 155, 39)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0098 | əsas: 2025 toplu, I hissə, səh.155 №40
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0098', '/images/tasks/UCB-0098.png', 'Düzbucaqlı üçbucaq; hündürlük 10, hipotenuzun bir hissəsi 4, digəri x', (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Şəkildə düzbucaqlı üçbucaq və onun düz bucaq təpəsindən hipotenuza çəkilmiş hündürlüyü verilmişdir. $x$ parçasının uzunluğunu tapın.',
  '[{"key": "A", "text": "$40$"}, {"key": "B", "text": "$14$"}, {"key": "C", "text": "$25$"}, {"key": "D", "text": "$2{,}5$"}, {"key": "E", "text": "$10$"}]'::jsonb, 'C', NULL, NULL,
  '$h^2=x\cdot4\Rightarrow100=4x\Rightarrow x=25$.',
  2025, 'I', 155, 40)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0099 | əsas: 2025 toplu, I hissə, səh.155 №41
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0099', '/images/tasks/UCB-0099.png', 'Düzbucaqlı ABC üçbucağı, CD hündürlüyü, D nöqtəsindən AC və BC-yə DM və DN perpendikulyarları', (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzbucaqlı $ABC$ üçbucağında $C$ düz bucaq təpəsindən $CD$ hündürlüyü çəkilmişdir. $DM\perp AC$, $DN\perp BC$, $DM=3$ sm, $DN=6$ sm olarsa, $AC$ katetini tapın.',
  '[{"key": "A", "text": "$4{,}5$ sm"}, {"key": "B", "text": "$9$ sm"}, {"key": "C", "text": "$7{,}5$ sm"}, {"key": "D", "text": "$12$ sm"}, {"key": "E", "text": "$6$ sm"}]'::jsonb, 'C', NULL, NULL,
  '$CNDM$ düzbucaqlıdır: $CM=DN=6$. $ADC$ düzbucaqlı üçbucağında ($\angle D=90^\circ$) $DM$ hipotenuza çəkilmiş hündürlükdür: $DM^2=CM\cdot MA\Rightarrow9=6\cdot MA\Rightarrow MA=1{,}5$. $AC=6+1{,}5=7{,}5$ sm.',
  2025, 'I', 155, 41)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0100 | əsas: 2025 toplu, I hissə, səh.155 №42
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0100', '/images/tasks/UCB-0100.png', 'Düzbucaqlı ABC üçbucağı, CD hündürlüyü, DM ⊥ AC və DN ⊥ BC', (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzbucaqlı $ABC$ üçbucağında $C$ düz bucaq təpəsindən $CD$ hündürlüyü çəkilmişdir. $DM\perp AC$, $DN\perp BC$, $DM=2$ sm, $DN=4$ sm olarsa, $BC$ katetinin uzunluğunu tapın.',
  '[{"key": "A", "text": "$5$ sm"}, {"key": "B", "text": "$12$ sm"}, {"key": "C", "text": "$10$ sm"}, {"key": "D", "text": "$6$ sm"}, {"key": "E", "text": "$8$ sm"}]'::jsonb, 'C', NULL, NULL,
  '$CN=DM=2$. $BDC$ üçbucağında ($\angle D=90^\circ$) $DN$ hündürlükdür: $DN^2=CN\cdot NB\Rightarrow16=2\cdot NB\Rightarrow NB=8$. $BC=2+8=10$ sm.',
  2025, 'I', 155, 42)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0101 | əsas: 2025 toplu, I hissə, səh.155 №51
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0101', '/images/tasks/UCB-0101.png', 'AB və CD paralel parçalar, BC onlara perpendikulyar, AD parçası BC-ni E nöqtəsində kəsir', (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$AD$ və $BC$ parçaları $E$ nöqtəsində kəsişir. $\angle B=\angle C=90^\circ$, $CD=3AB$, $BC=12$, $AD=20$ olarsa, $CD$-ni tapın.',
  '[{"key": "A", "text": "$16$"}, {"key": "B", "text": "$12$"}, {"key": "C", "text": "$8$"}, {"key": "D", "text": "$9$"}, {"key": "E", "text": "$4$"}]'::jsonb, 'B', NULL, NULL,
  '$AB\parallel CD$ (hər ikisi $BC$-yə perpendikulyardır). $A$-dan $CD$-nin uzantısına perpendikulyar endirsək, katetləri $BC=12$ və $AB+CD=4AB$ olan, hipotenuzu $AD=20$ olan düzbucaqlı üçbucaq alınır: $144+16AB^2=400\Rightarrow AB=4$, $CD=12$.',
  2025, 'I', 155, 51)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0102 | əsas: 2025 toplu, I hissə, səh.156 №52
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0102', '/images/tasks/UCB-0102.png', 'MP və KN paralel parçalar, PK onlara perpendikulyar, MN parçası PK-ni O nöqtəsində kəsir', (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$PK$ və $MN$ parçaları $O$ nöqtəsində kəsişir. $\angle P=\angle K=90^\circ$, $MP=4KN$, $PK=15$, $MN=25$ olarsa, $KN$-i tapın.',
  '[{"key": "A", "text": "$3$"}, {"key": "B", "text": "$5$"}, {"key": "C", "text": "$2$"}, {"key": "D", "text": "$4$"}, {"key": "E", "text": "$6$"}]'::jsonb, 'D', NULL, NULL,
  '$MP\parallel KN$. Uyğun düzbucaqlı üçbucaq: katetlər $PK=15$ və $MP+KN=5KN$, hipotenuz $MN=25$: $225+25KN^2=625\Rightarrow KN=4$.',
  2025, 'I', 156, 52)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0103 | əsas: 2025 toplu, I hissə, səh.156 №53
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0103', '/images/tasks/UCB-0103.png', 'ABC üçbucağı, tərəflərin orta nöqtələri M, N, E birləşdirilib; MEN bucağı düzdür', (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ üçbucağında $\angle A=30^\circ$, $M,\ N,\ E$ nöqtələri isə uyğun olaraq $AC$, $CB$ və $AB$ tərəflərinin orta nöqtələridir. $\angle MEN=90^\circ$, $MN+BC=16$ sm olarsa, $AC$-ni tapın.',
  '[{"key": "A", "text": "$8\\sqrt3$ sm"}, {"key": "B", "text": "$16$ sm"}, {"key": "C", "text": "$8\\sqrt2$ sm"}, {"key": "D", "text": "$16\\sqrt3$ sm"}, {"key": "E", "text": "$4\\sqrt3$ sm"}]'::jsonb, 'A', NULL, NULL,
  '$ME\parallel CB$ və $NE\parallel CA$ (orta xətlər), ona görə $\angle MEN=\angle C=90^\circ$. $MN=\dfrac{AB}{2}$, $BC=\dfrac{AB}{2}$ ($30^\circ$ qarşısındakı katet). $MN+BC=AB=16$. $AC=AB\cos30^\circ=8\sqrt3$ sm.',
  2025, 'I', 156, 53)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0104 | əsas: 2025 toplu, I hissə, səh.156 №54
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0104', '/images/tasks/UCB-0104.png', 'ABC üçbucağı, tərəflərin orta nöqtələri M, N, E birləşdirilib; MEN bucağı düzdür', (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ üçbucağında $\angle A=30^\circ$, $M,\ N,\ E$ nöqtələri isə uyğun olaraq $AC$, $CB$ və $AB$ tərəflərinin orta nöqtələridir. $\angle MEN=90^\circ$, $MN+BC=10$ sm olarsa, $AC$-ni tapın.',
  '[{"key": "A", "text": "$5\\sqrt3$ sm"}, {"key": "B", "text": "$2{,}5\\sqrt3$ sm"}, {"key": "C", "text": "$5\\sqrt2$ sm"}, {"key": "D", "text": "$10\\sqrt3$ sm"}, {"key": "E", "text": "$10$ sm"}]'::jsonb, 'A', NULL, NULL,
  '$ME\parallel CB$ və $NE\parallel CA$ (orta xətlər), ona görə $\angle MEN=\angle C=90^\circ$. $MN=\dfrac{AB}{2}$, $BC=\dfrac{AB}{2}$ ($30^\circ$ qarşısındakı katet). $MN+BC=AB=10$. $AC=AB\cos30^\circ=5\sqrt3$ sm.',
  2025, 'I', 156, 54)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0105 | əsas: 2025 toplu, I hissə, səh.156 №56
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0105', '/images/tasks/UCB-0105.png', 'ABC üçbucağı, BN hündürlüyü və A bucağının AM tənböləni D nöqtəsində kəsişir', (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'closed',
  '$AM$ parçası $ABC$ üçbucağının $A$ bucağının tənbölənidir. $BN\perp AC$, $AN=NC$, $\angle A=60^\circ$ və $AM$ ilə $BN$ $D$ nöqtəsində kəsişir. $DN=2\sqrt3$ sm olarsa, $BC$ tərəfinin uzunluğunu tapın.',
  '[{"key": "A", "text": "$6\\sqrt3$ sm"}, {"key": "B", "text": "$6$ sm"}, {"key": "C", "text": "$12\\sqrt2$ sm"}, {"key": "D", "text": "$12\\sqrt3$ sm"}, {"key": "E", "text": "$12$ sm"}]'::jsonb, 'E', NULL, NULL,
  '$BN$ həm hündürlük, həm median olduğundan $AB=BC$; $\angle A=60^\circ$ olduğu üçün üçbucaq bərabərtərəflidir. $ADN$ üçbucağında $\angle DAN=30^\circ$: $AN=DN\sqrt3=6$. $AC=12$, $BC=12$ sm.',
  2025, 'I', 156, 56)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0106 | əsas: 2025 toplu, I hissə, səh.156 №57
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0106', '/images/tasks/UCB-0106.png', 'ABC üçbucağı, BN hündürlüyü və AM tənböləni', (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'written',
  '$AM$ parçası $ABC$ üçbucağının $A$ bucağının tənbölənidir. $\angle B=60^\circ$, $MC=2\sqrt3$ sm, $BN\perp AC$ və $AN=NC$ olarsa, $AM$-in uzunluğunu tapın.',
  NULL, NULL, NULL, '6',
  '$BN$ hündürlük və median olduğundan $AB=BC$, $\angle B=60^\circ$ — üçbucaq bərabərtərəflidir. Tənbölən $AM$ həm də mediandır: $BC=2MC=4\sqrt3$. $AM=\dfrac{a\sqrt3}{2}=\dfrac{4\sqrt3\cdot\sqrt3}{2}=6$ sm.',
  2025, 'I', 156, 57)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0107 | əsas: 2025 toplu, I hissə, səh.159 №88
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0107', '/images/tasks/UCB-0107.png', 'Düzbucaqlı ABC üçbucağı (B düz bucaq), BK və MN dayaqları AC-yə perpendikulyar', (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'written',
  'Uşaq əyləncə mərkəzində sürət qatarının relsi $ABC$ üçbucağı üzərində qurulmuşdur ($\angle B=90^\circ$). Relsi saxlamaq üçün olan $MN$ və $BK$ dayaqları $AC$ tərəfinə perpendikulyardır. $BM=MC$, $AN=22$ m və $NC=4$ m olarsa, $BK$ dayağının uzunluğunu tapın.',
  NULL, NULL, NULL, '12',
  '$MN\parallel BK$ və $M$ — $BC$-nin ortası, ona görə (Fales) $N$ — $KC$-nin ortasıdır: $KC=2NC=8$, $AK=AN-NC=18$. Düz bucaq təpəsindən çəkilən hündürlük: $BK=\sqrt{AK\cdot KC}=\sqrt{144}=12$ m.',
  2025, 'I', 159, 88)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0108 | əsas: 2025 toplu, I hissə, səh.159 №89
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0108', '/images/tasks/UCB-0108.png', 'Düzbucaqlı ABC üçbucağı (B düz bucaq), BK və MN dayaqları AC-yə perpendikulyar', (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'written',
  'Uşaq əyləncə mərkəzində sürət qatarının relsi $ABC$ üçbucağı üzərində qurulmuşdur ($\angle B=90^\circ$). Relsi saxlamaq üçün olan $MN$ və $BK$ dayaqları $AC$ tərəfinə perpendikulyardır. $BM=MC$, $AN=33$ m və $NC=6$ m olarsa, $BK$ dayağının uzunluğunu tapın.',
  NULL, NULL, NULL, '18',
  '$MN\parallel BK$ və $M$ — $BC$-nin ortası, ona görə (Fales) $N$ — $KC$-nin ortasıdır: $KC=2NC=12$, $AK=AN-NC=27$. Düz bucaq təpəsindən çəkilən hündürlük: $BK=\sqrt{AK\cdot KC}=\sqrt{324}=18$ m.',
  2025, 'I', 159, 89)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0109 | əsas: 2025 toplu, I hissə, səh.159 №92
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0109', '/images/tasks/UCB-0109.png', 'İki şəkil: taxta yerdəki A nöqtəsindən blok yığınının B kənarına söykənib; birinci şəkildə 6, ikincidə 5 blok', (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'written',
  '$AB$ taxta parçasının $B$ ucu birinci şəkildə altıncı blokun, ikinci şəkildə isə beşinci blokun üst kənarına söykənib, $A$ ucu isə yerdədir. Bloklar düzbucaqlı paralelepiped şəklində olub hündürlükləri $4$ sm-dir. İkinci şəkildəki $A$ nöqtəsi blokdan birinci şəkildəkinə nisbətən $8$ sm daha uzaqdadır. $AB$-nin uzunluğunu tapın.',
  NULL, NULL, NULL, '25',
  'Birinci şəkildə $B$ $24$ sm, ikincidə $20$ sm hündürlükdədir. $A$-nın blokdan məsafəsi birinci şəkildə $x$, ikincidə $x+8$. Taxtanın uzunluğu dəyişmir: $24^2+x^2=20^2+(x+8)^2\Rightarrow576=400+16x+64\Rightarrow x=7$. $AB=\sqrt{24^2+7^2}=25$ sm.',
  2025, 'I', 159, 92)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0110 | əsas: 2025 toplu, I hissə, səh.159 №93
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0110', '/images/tasks/UCB-0110.png', 'ABC üçbucağı; AB=10, AD=6, DC=15, E nöqtəsi BC üzərində, DE parçası', (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər'), 'original', 'own', 'az', 'draft', 'written',
  '$ABC$ üçbucağında $D\in AC$, $E\in BC$; $AB=10$, $AD=6$, $DC=15$ və $BE=EC=DE$ olarsa, $BC$-ni tapın.',
  NULL, NULL, NULL, '17',
  '$E$ — $BC$-nin ortası və $DE=\dfrac{BC}{2}$; deməli $D$ nöqtəsi $BC$ diametrli çevrə üzərindədir və $\angle BDC=90^\circ$, yəni $BD\perp AC$. $BD=\sqrt{10^2-6^2}=8$. $BC=\sqrt{8^2+15^2}=17$.',
  2025, 'I', 159, 93)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0111 | əsas: 2025 toplu, I hissə, səh.161 №20
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0111', '/images/tasks/UCB-0111.png', 'ABC üçbucağı: AC=12, BC=9, A-dakı bucaq α, B-dəki bucaq β', (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Sinuslar teoremi. Kosinuslar teoremi'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ üçbucağında $AC=12$ və $BC=9$ olarsa, $\dfrac{\sin\beta}{\sin\alpha}$ nisbətini tapın ($\alpha=\angle A$, $\beta=\angle B$).',
  '[{"key": "A", "text": "$\\dfrac{16}{9}$"}, {"key": "B", "text": "$\\dfrac{4}{3}$"}, {"key": "C", "text": "$\\dfrac{3}{4}$"}, {"key": "D", "text": "$\\dfrac{3}{7}$"}, {"key": "E", "text": "$\\dfrac{9}{16}$"}]'::jsonb, 'B', NULL, NULL,
  'Sinuslar teoremi: $\dfrac{AC}{\sin\beta}=\dfrac{BC}{\sin\alpha}\Rightarrow\dfrac{\sin\beta}{\sin\alpha}=\dfrac{AC}{BC}=\dfrac{12}{9}=\dfrac43$.',
  2025, 'I', 161, 20)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0112 | əsas: 2025 toplu, I hissə, səh.161 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0112', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Sinuslar teoremi. Kosinuslar teoremi'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ üçbucağında $B$ və $C$ bucaqlarının tənbölənləri $K$ nöqtəsində kəsişir. $BK=8$ və $CK=6$ olarsa, $BC$ parçasının uzunluğunun ən kiçik natural qiymətini tapın.',
  '[{"key": "A", "text": "$13$"}, {"key": "B", "text": "$10$"}, {"key": "C", "text": "$14$"}, {"key": "D", "text": "$11$"}, {"key": "E", "text": "$12$"}]'::jsonb, 'D', NULL, NULL,
  '$\angle BKC=90^\circ+\dfrac{\angle A}{2}>90^\circ$, yəni $BKC$ üçbucağında $K$ bucağı kordur: $BC^2>8^2+6^2=100\Rightarrow BC>10$. Həmçinin $BC<8+6=14$. Ən kiçik natural qiymət $11$.',
  2025, 'I', 161, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0113 | əsas: 2025 toplu, I hissə, səh.161 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0113', '/images/tasks/UCB-0113.png', 'ABC üçbucağı, AC tərəfi üzərində D nöqtəsi, BD parçası', (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Sinuslar teoremi. Kosinuslar teoremi'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ üçbucağında $D\in AC$, $AB=BD=6$ və $DC=5$ olarsa, $BC$ parçasının uzunluğunun ən kiçik natural qiymətini tapın.',
  '[{"key": "A", "text": "$8$"}, {"key": "B", "text": "$10$"}, {"key": "C", "text": "$9$"}, {"key": "D", "text": "$6$"}, {"key": "E", "text": "$7$"}]'::jsonb, 'A', NULL, NULL,
  '$ABD$ bərabəryanlıdır, $\angle BDA$ iti bucaqdır, ona görə ona qonşu $\angle BDC$ kordur. $BDC$ üçbucağında: $BC^2>6^2+5^2=61\Rightarrow BC>\sqrt{61}\approx7{,}8$. Həmçinin $BC<11$. Ən kiçik natural qiymət $8$.',
  2025, 'I', 161, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0114 | əsas: 2025 toplu, I hissə, səh.161 №34
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0114', NULL, NULL, (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Sinuslar teoremi. Kosinuslar teoremi'), 'original', 'own', 'az', 'draft', 'matching',
  '$AB=10$, $BC=6$ olarsa, $ABC$ üçbucağı üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$AC=8$"}, {"key": "2", "text": "$AC=9$"}, {"key": "3", "text": "$AC=6$"}], "right": [{"key": "a", "text": "$\\cos\\angle A=\\dfrac{29}{36}$"}, {"key": "b", "text": "$\\sin\\angle A=\\dfrac35$"}, {"key": "c", "text": "korbucaqlı üçbucaqdır"}, {"key": "d", "text": "itibucaqlı üçbucaqdır"}, {"key": "e", "text": "düzbucaqlı üçbucaqdır"}]}'::jsonb, NULL, '{"1": ["b", "e"], "2": ["a", "d"], "3": ["c"]}'::jsonb, NULL,
  '1) $6^2+8^2=10^2$ — düzbucaqlı ($\angle C=90^\circ$), $\sin A=\dfrac{BC}{AB}=\dfrac35$. 2) $6^2+9^2=117>100$ — itibucaqlı; $\cos A=\dfrac{100+81-36}{2\cdot10\cdot9}=\dfrac{145}{180}=\dfrac{29}{36}$. 3) $6^2+6^2=72<100$ — korbucaqlı.',
  2025, 'I', 161, 34)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- UCB-0115 | əsas: 2025 toplu, I hissə, səh.161 №35
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('UCB-0115', '/images/tasks/UCB-0115.png', 'BD və AC parçaları E-də kəsişir; ECD düzbucaqlı üçbucaq (C düz bucaq), AB parçası', (SELECT id FROM topics WHERE name='Üçbucaqlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Üçbucaqlar' AND s.title='Sinuslar teoremi. Kosinuslar teoremi'), 'original', 'own', 'az', 'draft', 'written',
  '$BD$ və $AC$ parçaları $E$ nöqtəsində kəsişir. $\angle C=90^\circ$ ($\angle ECD$), $CD=6$, $ED=10$, $BE=5$ və $AE=8$ olarsa, $AB$-ni tapın.',
  NULL, NULL, NULL, '5',
  '$ECD$ düzbucaqlı üçbucağında $CE=\sqrt{10^2-6^2}=8$, $\cos\angle CED=\dfrac{8}{10}=\dfrac45$. $\angle AEB=\angle CED$ (qarşılıqlı bucaqlar). Kosinuslar teoremi: $AB^2=5^2+8^2-2\cdot5\cdot8\cdot\dfrac45=25+64-64=25$, $AB=5$.',
  2025, 'I', 161, 35)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
