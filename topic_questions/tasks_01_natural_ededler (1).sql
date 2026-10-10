-- Mövzu: Natural ədədlər — 58 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- NAT-0001 | əsas: 2025 toplu, I hissə, səh.4 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlər. Natural ədədlərin onluq say sistemində yazılışı'), 'original', 'own', 'az', 'draft', 'open',
  '$\overline{ab}$ ikirəqəmli ədədi üçün $\dfrac{\overline{ab}-\overline{ba}}{a+b}=5$ olarsa, $a\cdot b$ hasilini tapın.',
  NULL, NULL, NULL, '14',
  '$\overline{ab}-\overline{ba}=(10a+b)-(10b+a)=9(a-b)$. Onda $9(a-b)=5(a+b)$, yəni $4a=14b$, $2a=7b$. $a$ və $b$ rəqəm olduğundan ($a\le 9$) yeganə həll $a=7,\ b=2$-dir. $\overline{ab}=72$, $a\cdot b=7\cdot 2=14$.',
  2025, 'I', 4, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0002 | əsas: 2025 toplu, I hissə, səh.4 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlər. Natural ədədlərin onluq say sistemində yazılışı'), 'original', 'own', 'az', 'draft', 'open',
  '$\overline{ab}$ ikirəqəmli ədədi üçün $\dfrac{\overline{ab}-\overline{ba}}{a+b}=1$ olarsa, $a\cdot b$ hasilini tapın.',
  NULL, NULL, NULL, '20',
  '$\overline{ab}-\overline{ba}=9(a-b)$. Onda $9(a-b)=a+b$, yəni $8a=10b$, $4a=5b$. Rəqəmlər üçün yeganə həll $a=5,\ b=4$-dür. $\overline{ab}=54$, $a\cdot b=20$.',
  2025, 'I', 4, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0003 | əsas: 2025 toplu, I hissə, səh.5 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlər. Natural ədədlərin onluq say sistemində yazılışı'), 'original', 'own', 'az', 'draft', 'open',
  '$\overline{ab}+\overline{ba}+a+b<100$ olarsa, $ab$ hasilinin ala biləcəyi ən böyük qiyməti ilə ən kiçik qiymətinin cəmini tapın.',
  NULL, NULL, NULL, '17',
  '$\overline{ab}+\overline{ba}=11(a+b)$, ona görə şərt $12(a+b)<100$, yəni $a+b\le 8$ şəklinə düşür ($a\ge1,\ b\ge1$, çünki hər iki ədəd ikirəqəmlidir). Cəmi sabit olan iki ədədin hasili ədədlər bərabər olduqda ən böyükdür: $a=b=4$ olduqda $ab=16$. Ən kiçik hasil $a=b=1$ olduqda $ab=1$-dir. Cavab: $16+1=17$.',
  2025, 'I', 5, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0004 | əsas: 2025 toplu, I hissə, səh.5 №27
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlər. Natural ədədlərin onluq say sistemində yazılışı'), 'original', 'own', 'az', 'draft', 'open',
  '$a=13^{145}\cdot 8^{62}+17^{33}$ ədədinin son rəqəmini tapın.',
  NULL, NULL, NULL, '9',
  '$3$-ün qüvvətlərinin son rəqəmləri $3,9,7,1$ dövrü ilə təkrarlanır; $145=4\cdot36+1$ olduğundan $13^{145}$ ədədinin son rəqəmi $3$-dür. $8$-in qüvvətləri üçün dövr $8,4,2,6$-dır; $62=4\cdot15+2$, son rəqəm $4$. Hasilin son rəqəmi $3\cdot4=12\to 2$. $7$-nin qüvvətləri üçün dövr $7,9,3,1$-dir; $33=4\cdot8+1$, son rəqəm $7$. Cəmin son rəqəmi: $2+7=9$.',
  2025, 'I', 5, 27)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0005 | əsas: 2025 toplu, I hissə, səh.5 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlər. Natural ədədlərin onluq say sistemində yazılışı'), 'original', 'own', 'az', 'draft', 'matching',
  'İfadələrin qiymətləri üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$\\overline{ab}-\\overline{ba}$"}, {"key": "2", "text": "$\\overline{aaa}-\\overline{bbb}$"}, {"key": "3", "text": "$\\overline{ab}+\\overline{ba}$"}], "right": [{"key": "a", "text": "$37$-yə bölünür"}, {"key": "b", "text": "$9$-a bölünür"}, {"key": "c", "text": "$111$-ə bölünür"}, {"key": "d", "text": "$11$-ə bölünür"}, {"key": "e", "text": "$10$-a bölünür"}]}'::jsonb, NULL, '{"1": ["b"], "2": ["a", "c"], "3": ["d"]}'::jsonb, NULL,
  '1) $\overline{ab}-\overline{ba}=9(a-b)$ — həmişə $9$-a bölünür. 2) $\overline{aaa}-\overline{bbb}=111a-111b=111(a-b)=3\cdot37\cdot(a-b)$ — həmişə $37$-yə və $111$-ə bölünür. 3) $\overline{ab}+\overline{ba}=11(a+b)$ — həmişə $11$-ə bölünür. Digər bölünmələr hər $a,b$ üçün doğru deyil (məs., $a=2,b=1$).',
  2025, 'I', 5, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0006 | əsas: 2025 toplu, I hissə, səh.5 №29
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlər. Natural ədədlərin onluq say sistemində yazılışı'), 'original', 'own', 'az', 'draft', 'matching',
  'İfadələrin qiymətləri üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$\\overline{aa}+\\overline{bb}$"}, {"key": "2", "text": "$\\overline{abc}-\\overline{acb}$"}, {"key": "3", "text": "$\\overline{aaa}+\\overline{bbb}$"}], "right": [{"key": "a", "text": "$11$-ə bölünür"}, {"key": "b", "text": "$9$-a bölünür"}, {"key": "c", "text": "$37$-yə bölünür"}, {"key": "d", "text": "$99$-a bölünür"}, {"key": "e", "text": "$111$-ə bölünür"}]}'::jsonb, NULL, '{"1": ["a"], "2": ["b"], "3": ["c", "e"]}'::jsonb, NULL,
  '1) $\overline{aa}+\overline{bb}=11a+11b=11(a+b)$ — $11$-ə bölünür. 2) $\overline{abc}-\overline{acb}=(100a+10b+c)-(100a+10c+b)=9(b-c)$ — $9$-a bölünür. 3) $\overline{aaa}+\overline{bbb}=111(a+b)=3\cdot37(a+b)$ — $37$-yə və $111$-ə bölünür. $99$-a bölünmə heç birində həmişə ödənmir.',
  2025, 'I', 5, 29)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0007 | əsas: 2025 toplu, I hissə, səh.5 №30
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0007', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlər. Natural ədədlərin onluq say sistemində yazılışı'), 'original', 'own', 'az', 'draft', 'matching',
  '$a$ və $b$ rəqəmləri üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$\\overline{ab}-\\overline{ba}=5a-2b$"}, {"key": "2", "text": "$\\overline{ab}=3a+7b$"}, {"key": "3", "text": "$\\overline{ab4}-\\overline{ab}=355$"}], "right": [{"key": "a", "text": "$a+b=11$"}, {"key": "b", "text": "$a-b=3$"}, {"key": "c", "text": "$b-a=1$"}, {"key": "d", "text": "$a+b=12$"}, {"key": "e", "text": "$a+b=13$"}]}'::jsonb, NULL, '{"1": ["a", "b"], "2": ["c", "e"], "3": ["d"]}'::jsonb, NULL,
  '1) $9a-9b=5a-2b\Rightarrow 4a=7b\Rightarrow a=7,\ b=4$: $a+b=11$, $a-b=3$. 2) $10a+b=3a+7b\Rightarrow 7a=6b\Rightarrow a=6,\ b=7$: $b-a=1$, $a+b=13$. 3) $\overline{ab4}-\overline{ab}=10\cdot\overline{ab}+4-\overline{ab}=9\cdot\overline{ab}+4=355\Rightarrow \overline{ab}=39$: $a+b=12$.',
  2025, 'I', 5, 30)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0008 | əsas: 2023 toplu, I hissə, səh.78 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlər. Natural ədədlərin onluq say sistemində yazılışı'), 'original', 'own', 'az', 'draft', 'closed',
  '$6\cdot10^{-3}+5\cdot10^{-1}+7+2\cdot10^{2}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$270{,}506$"}, {"key": "B", "text": "$702{,}506$"}, {"key": "C", "text": "$207{,}056$"}, {"key": "D", "text": "$207{,}506$"}, {"key": "E", "text": "$205{,}706$"}]'::jsonb, 'D', NULL, NULL,
  '$6\cdot10^{-3}=0{,}006$; $5\cdot10^{-1}=0{,}5$; $2\cdot10^{2}=200$. Cəm: $200+7+0{,}5+0{,}006=207{,}506$.',
  2023, 'I', 78, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0009 | əsas: 2023 toplu, I hissə, səh.78 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlər. Natural ədədlərin onluq say sistemində yazılışı'), 'original', 'own', 'az', 'draft', 'closed',
  '$7\cdot10^{-3}+2\cdot10^{-2}+9+5\cdot10^{2}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$527{,}9$"}, {"key": "B", "text": "$590{,}027$"}, {"key": "C", "text": "$509{,}027$"}, {"key": "D", "text": "$509{,}207$"}, {"key": "E", "text": "$509{,}27$"}]'::jsonb, 'C', NULL, NULL,
  '$7\cdot10^{-3}=0{,}007$; $2\cdot10^{-2}=0{,}02$; $5\cdot10^{2}=500$. Cəm: $500+9+0{,}02+0{,}007=509{,}027$.',
  2023, 'I', 78, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0010 | əsas: 2025 toplu, I hissə, səh.5 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin toplanması, çıxılması, vurulması və bölünməsi'), 'original', 'own', 'az', 'draft', 'open',
  '$x,\ y,\ z$ natural ədədlər, $5y=9z$ və $x=4z$ olarsa, $x+y+z$ cəminin ən kiçik qiymətini tapın.',
  NULL, NULL, NULL, '34',
  '$5y=9z$ və $\text{ƏBOB}(5,9)=1$ olduğundan $z$ ədədi $5$-ə bölünməlidir: $z=5k$, $y=9k$, $x=20k$ ($k\in N$). $x+y+z=34k$, ən kiçik qiymət $k=1$ olduqda $34$-dür.',
  2025, 'I', 5, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0011 | əsas: 2025 toplu, I hissə, səh.5 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0011', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin toplanması, çıxılması, vurulması və bölünməsi'), 'original', 'own', 'az', 'draft', 'open',
  '$x,\ y,\ z$ natural ədədlər, $3y=11z$ və $x=2z$ olarsa, $x+y+z$ cəminin ən kiçik qiymətini tapın.',
  NULL, NULL, NULL, '20',
  '$3y=11z$ olduğundan $z=3k$, $y=11k$, $x=6k$ ($k\in N$). $x+y+z=20k$, ən kiçik qiymət $k=1$ olduqda $20$-dir.',
  2025, 'I', 5, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0012 | əsas: 2025 toplu, I hissə, səh.6 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0012', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin toplanması, çıxılması, vurulması və bölünməsi'), 'original', 'own', 'az', 'draft', 'open',
  '$a$ və $b$ natural ədədləri üçün $3a+7b=100$ olarsa, $7a+3b$ ifadəsinin ala biləcəyi ən böyük qiyməti tapın.',
  NULL, NULL, NULL, '220',
  '$7a+3b=\dfrac{7}{3}(3a+7b)-\dfrac{40}{3}b=\dfrac{700-40b}{3}$, yəni ifadə $b$ azaldıqca artır. $3a=100-7b$ natural ədədin $3$-ə bölünməsi üçün $7b\equiv100\equiv1\pmod 3$, yəni $b\equiv1\pmod3$. Ən kiçik $b=1$: $a=31$. Onda $7a+3b=217+3=220$.',
  2025, 'I', 6, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0013 | əsas: 2025 toplu, I hissə, səh.6 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin toplanması, çıxılması, vurulması və bölünməsi'), 'original', 'own', 'az', 'draft', 'open',
  '$a$ və $b$ natural ədədləri üçün $5a+8b=111$ olarsa, $8a+5b$ ifadəsinin ala biləcəyi ən böyük qiyməti tapın.',
  NULL, NULL, NULL, '162',
  '$8a+5b=\dfrac{8}{5}(5a+8b)-\dfrac{39}{5}b$ — ifadə $b$ azaldıqca artır. $5a=111-8b$ olduğundan $8b\equiv111\equiv1\pmod5$, yəni $3b\equiv1\pmod5$, $b\equiv2\pmod5$. Ən kiçik $b=2$: $5a=95$, $a=19$. $8a+5b=152+10=162$.',
  2025, 'I', 6, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0014 | əsas: 2025 toplu, I hissə, səh.6 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin toplanması, çıxılması, vurulması və bölünməsi'), 'original', 'own', 'az', 'draft', 'matching',
  '$a$ və $b$ rəqəmləri üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$\\overline{ab}-\\overline{ba}=6a-4b$"}, {"key": "2", "text": "$\\overline{ab}=5a+9b$"}, {"key": "3", "text": "$\\overline{ab7}-\\overline{ab}=430$"}], "right": [{"key": "a", "text": "$a-b=2$"}, {"key": "b", "text": "$a+b=13$"}, {"key": "c", "text": "$b-a=3$"}, {"key": "d", "text": "$a+b=8$"}, {"key": "e", "text": "$a+b=11$"}]}'::jsonb, NULL, '{"1": ["a", "d"], "2": ["b"], "3": ["c", "e"]}'::jsonb, NULL,
  '1) $9a-9b=6a-4b\Rightarrow 3a=5b\Rightarrow a=5,\ b=3$: $a-b=2$, $a+b=8$. 2) $10a+b=5a+9b\Rightarrow 5a=8b\Rightarrow a=8,\ b=5$: $a+b=13$. 3) $9\cdot\overline{ab}+7=430\Rightarrow\overline{ab}=47$: $b-a=3$, $a+b=11$.',
  2025, 'I', 6, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0015 | əsas: 2025 toplu, I hissə, səh.6 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0015', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin bölünmə əlamətləri. Qalıqlı bölmə'), 'original', 'own', 'az', 'draft', 'closed',
  '$x$-in yerinə hansı rəqəmi yazdıqda $\overline{62x47x1}$ ədədi $9$-a tam bölünür?',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$2$"}, {"key": "C", "text": "$9$"}, {"key": "D", "text": "$8$"}, {"key": "E", "text": "$6$"}]'::jsonb, 'D', NULL, NULL,
  'Rəqəmlər cəmi: $6+2+x+4+7+x+1=20+2x$. $9$-a bölünmə üçün $20+2x$ ədədi $9$-a bölünməlidir. $0\le x\le9$ olduqda $20\le 20+2x\le38$; bu aralıqda $9$-a bölünən ədədlər $27$ və $36$-dır. $20+2x=27$ tam həll vermir, $20+2x=36\Rightarrow x=8$.',
  2025, 'I', 6, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0016 | əsas: 2025 toplu, I hissə, səh.6 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin bölünmə əlamətləri. Qalıqlı bölmə'), 'original', 'own', 'az', 'draft', 'closed',
  '$a$ ədədini $12$-yə böldükdə natamam qismətdə $c$, qalıqda $10$ alınır. $a$ ədədinin $4$-ə bölünməsindən alınan natamam qisməti tapın.',
  '[{"key": "A", "text": "$3c+2$"}, {"key": "B", "text": "$c+2$"}, {"key": "C", "text": "$3c+1$"}, {"key": "D", "text": "$3c+3$"}, {"key": "E", "text": "$4c+2$"}]'::jsonb, 'A', NULL, NULL,
  '$a=12c+10=4(3c+2)+2$. Qalıq $2<4$ olduğundan $4$-ə bölünmədə natamam qismət $3c+2$-dir.',
  2025, 'I', 6, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0017 | əsas: 2025 toplu, I hissə, səh.6 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin bölünmə əlamətləri. Qalıqlı bölmə'), 'original', 'own', 'az', 'draft', 'closed',
  '$a$ ədədini $9$-a böldükdə qalıqda $5$ alınır. $4a+3$ ədədini $9$-a böldükdə alınan qalığı tapın.',
  '[{"key": "A", "text": "$5$"}, {"key": "B", "text": "$6$"}, {"key": "C", "text": "$8$"}, {"key": "D", "text": "$0$"}, {"key": "E", "text": "$2$"}]'::jsonb, 'A', NULL, NULL,
  '$a=9k+5$. Onda $4a+3=36k+23=9(4k+2)+5$. Qalıq $5$-dir.',
  2025, 'I', 6, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0018 | əsas: 2025 toplu, I hissə, səh.6 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin bölünmə əlamətləri. Qalıqlı bölmə'), 'original', 'own', 'az', 'draft', 'closed',
  'Natural ədədi $36$-ya böldükdə qalıqda $29$ alınır. Bu ədədi $12$-yə böldükdə alınan qalığı tapın.',
  '[{"key": "A", "text": "$7$"}, {"key": "B", "text": "$11$"}, {"key": "C", "text": "$5$"}, {"key": "D", "text": "$9$"}, {"key": "E", "text": "$3$"}]'::jsonb, 'C', NULL, NULL,
  '$n=36k+29=12(3k+2)+5$. $36$ ədədi $12$-yə bölündüyündən qalıq $29$-un $12$-yə bölünməsindən alınan qalığa bərabərdir: $5$.',
  2025, 'I', 6, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0019 | əsas: 2025 toplu, I hissə, səh.6 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin bölünmə əlamətləri. Qalıqlı bölmə'), 'original', 'own', 'az', 'draft', 'closed',
  'Natural ədədi $24$-ə böldükdə qalıqda $17$ alınır. Bu ədədi $8$-ə böldükdə alınan qalığı tapın.',
  '[{"key": "A", "text": "$5$"}, {"key": "B", "text": "$3$"}, {"key": "C", "text": "$0$"}, {"key": "D", "text": "$7$"}, {"key": "E", "text": "$1$"}]'::jsonb, 'E', NULL, NULL,
  '$n=24k+17=8(3k+2)+1$. Qalıq $1$-dir.',
  2025, 'I', 6, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0020 | əsas: 2025 toplu, I hissə, səh.6 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin bölünmə əlamətləri. Qalıqlı bölmə'), 'original', 'own', 'az', 'draft', 'closed',
  'Altırəqəmli $\overline{51843a}$ ədədinin $6$-ya bölünməsi üçün $a$-nın mümkün qiymətlərinin cəmini tapın.',
  '[{"key": "A", "text": "$9$"}, {"key": "B", "text": "$6$"}, {"key": "C", "text": "$12$"}, {"key": "D", "text": "$18$"}, {"key": "E", "text": "$3$"}]'::jsonb, 'B', NULL, NULL,
  '$6$-ya bölünmə üçün ədəd həm $2$-yə, həm də $3$-ə bölünməlidir. $2$-yə bölünmə: $a$ cütdür. Rəqəmlər cəmi $5+1+8+4+3+a=21+a$ — $3$-ə bölünməsi üçün $a\in\{0;3;6;9\}$. Hər iki şərt: $a\in\{0;6\}$. Cəm: $0+6=6$.',
  2025, 'I', 6, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0021 | əsas: 2025 toplu, I hissə, səh.6 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin bölünmə əlamətləri. Qalıqlı bölmə'), 'original', 'own', 'az', 'draft', 'closed',
  '$n$-in hansı qiymətlərində beşrəqəmli $\overline{835n2}$ ədədi $3$-ə tam bölünür?',
  '[{"key": "A", "text": "$0;\\ 3;\\ 6;\\ 9$"}, {"key": "B", "text": "$1;\\ 4;\\ 7$"}, {"key": "C", "text": "$3;\\ 6;\\ 9$"}, {"key": "D", "text": "$2;\\ 5;\\ 8$"}, {"key": "E", "text": "$0;\\ 6$"}]'::jsonb, 'A', NULL, NULL,
  'Rəqəmlər cəmi $8+3+5+n+2=18+n$. $18$ ədədi $3$-ə bölündüyündən $n$ özü $3$-ə bölünməlidir: $n\in\{0;3;6;9\}$.',
  2025, 'I', 6, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0022 | əsas: 2025 toplu, I hissə, səh.6 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin bölünmə əlamətləri. Qalıqlı bölmə'), 'original', 'own', 'az', 'draft', 'closed',
  '$4$-ə qalıqsız bölünən natural ədədləri $30$-a böldükdə alına bilən müxtəlif qalıqların cəmini tapın.',
  '[{"key": "A", "text": "$210$"}, {"key": "B", "text": "$196$"}, {"key": "C", "text": "$105$"}, {"key": "D", "text": "$240$"}, {"key": "E", "text": "$180$"}]'::jsonb, 'A', NULL, NULL,
  '$n=4k$. $\text{ƏBOB}(4,30)=2$ olduğundan $4k$ ədədinin $30$-a bölünməsindən alınan qalıq həmişə cütdür və $0,2,4,\dots,28$ qalıqlarının hamısı alınır (məs., $4,8,12,16,20,24,28,32\to2,36\to6,\dots$). Cəm: $2(0+1+\dots+14)=2\cdot105=210$.',
  2025, 'I', 6, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0023 | əsas: 2025 toplu, I hissə, səh.6 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin bölünmə əlamətləri. Qalıqlı bölmə'), 'original', 'own', 'az', 'draft', 'closed',
  '$6$-ya qalıqsız bölünən natural ədədləri $45$-ə böldükdə alına bilən müxtəlif qalıqların cəmini tapın.',
  '[{"key": "A", "text": "$300$"}, {"key": "B", "text": "$270$"}, {"key": "C", "text": "$315$"}, {"key": "D", "text": "$345$"}, {"key": "E", "text": "$330$"}]'::jsonb, 'C', NULL, NULL,
  '$n=6k$. $\text{ƏBOB}(6,45)=3$ olduğundan alınan qalıqlar $3$-ün $45$-dən kiçik bütün qeyri-mənfi bölünənləridir: $0,3,6,\dots,42$. Cəm: $3(0+1+\dots+14)=3\cdot105=315$.',
  2025, 'I', 6, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0024 | əsas: 2025 toplu, I hissə, səh.6 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin bölünmə əlamətləri. Qalıqlı bölmə'), 'original', 'own', 'az', 'draft', 'open',
  '$\overline{a3b5c}$ ədədi $12$-yə bölünürsə, $a+b+c$ ifadəsinin ala biləcəyi ən kiçik qiyməti tapın.',
  NULL, NULL, NULL, '4',
  '$12=3\cdot4$. $4$-ə bölünmə: $\overline{5c}$ ədədi $4$-ə bölünməlidir, yəni $c\in\{2;6\}$. $3$-ə bölünmə: $a+3+b+5+c=a+b+c+8$ ədədi $3$-ə bölünməlidir, yəni $a+b+c\equiv1\pmod3$. $a\ge1$, $c\ge2$ olduğundan $a+b+c\ge3$; $3\not\equiv1$, ona görə ən kiçik qiymət $4$-dür (məs., $a=2,\ b=0,\ c=2$: $23052=12\cdot1921$).',
  2025, 'I', 6, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0025 | əsas: 2025 toplu, I hissə, səh.6 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0025', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin bölünmə əlamətləri. Qalıqlı bölmə'), 'original', 'own', 'az', 'draft', 'open',
  'Rəqəmləri fərqli olan ikirəqəmli ədədi $6$-ya böldükdə qalıq ən böyük olarsa, bu şərti ödəyən neçə ikirəqəmli ədəd var?',
  NULL, NULL, NULL, '13',
  '$6$-ya bölünmədə ən böyük qalıq $5$-dir, yəni $n=6k+5$. Belə ikirəqəmli ədədlər: $11,17,23,29,35,41,47,53,59,65,71,77,83,89,95$ — cəmi $15$ ədəd. Bunlardan rəqəmləri eyni olanlar $11$ və $77$-dir. Cavab: $15-2=13$.',
  2025, 'I', 6, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0026 | əsas: 2025 toplu, I hissə, səh.7 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin bölünmə əlamətləri. Qalıqlı bölmə'), 'original', 'own', 'az', 'draft', 'open',
  '$8$-ə böldükdə qalıqda $3$ alınan ədədlər $5$-ə tam bölünürsə, bu şərti ödəyən ikirəqəmli ədədlərdən ən kiçik və ən böyüyünün cəmini tapın.',
  NULL, NULL, NULL, '110',
  '$n=8k+3$ və $5\mid n$. $n\equiv3\pmod8$, $n\equiv0\pmod5$ şərtlərini ödəyən ən kiçik natural ədəd $35$-dir; $\text{ƏKOB}(8,5)=40$ olduğundan bütün belə ədədlər $n=40m+35$ şəklindədir. İkirəqəmlilər: $35$ və $75$. Cəm: $110$.',
  2025, 'I', 7, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0027 | əsas: 2025 toplu, I hissə, səh.7 №27
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0027', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin bölünmə əlamətləri. Qalıqlı bölmə'), 'original', 'own', 'az', 'draft', 'open',
  '$m$ ədədini $9$-a böldükdə qalıqda $4$ alınır. $m^2+5m+2$ ədədini $9$-a böldükdə qalıqda neçə alınar?',
  NULL, NULL, NULL, '2',
  '$m\equiv4\pmod9$ olduğundan $m^2+5m+2\equiv16+20+2=38\pmod9$. $38=9\cdot4+2$, qalıq $2$-dir.',
  2025, 'I', 7, 27)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0028 | əsas: 2025 toplu, I hissə, səh.7 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0028', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin bölünmə əlamətləri. Qalıqlı bölmə'), 'original', 'own', 'az', 'draft', 'open',
  '$m$ ədədini $7$-yə böldükdə qalıqda $2$ alınır. $m^2+4m+6$ ədədini $7$-yə böldükdə qalıqda neçə alınar?',
  NULL, NULL, NULL, '4',
  '$m\equiv2\pmod7$ olduğundan $m^2+4m+6\equiv4+8+6=18\pmod7$. $18=7\cdot2+4$, qalıq $4$-dür.',
  2025, 'I', 7, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0029 | əsas: 2025 toplu, I hissə, səh.7 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0029', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'closed',
  '$a$ natural ədədi $b$ natural ədədinə bölünür. $\text{ƏKOB}(a,b):\text{ƏBOB}(a,b)$ nisbətini tapın.',
  '[{"key": "A", "text": "$a$"}, {"key": "B", "text": "$b$"}, {"key": "C", "text": "$\\dfrac{b}{a}$"}, {"key": "D", "text": "$a\\cdot b$"}, {"key": "E", "text": "$\\dfrac{a}{b}$"}]'::jsonb, 'E', NULL, NULL,
  '$a$ ədədi $b$-yə bölündüyündən $\text{ƏKOB}(a,b)=a$, $\text{ƏBOB}(a,b)=b$. Nisbət: $\dfrac{a}{b}$.',
  2025, 'I', 7, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0030 | əsas: 2025 toplu, I hissə, səh.7 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0030', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'closed',
  '$b$ ədədi $a$ ədədinin natural bölənidir. $\text{ƏKOB}(a,b)+\text{ƏBOB}(a,b)$ cəmini tapın.',
  '[{"key": "A", "text": "$a-b$"}, {"key": "B", "text": "$a+b$"}, {"key": "C", "text": "$2a$"}, {"key": "D", "text": "$a\\cdot b$"}, {"key": "E", "text": "$2b$"}]'::jsonb, 'B', NULL, NULL,
  '$b\mid a$ olduğundan $\text{ƏKOB}(a,b)=a$, $\text{ƏBOB}(a,b)=b$. Cəm: $a+b$.',
  2025, 'I', 7, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0031 | əsas: 2025 toplu, I hissə, səh.7 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0031', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'closed',
  '$36$-dan böyük olmayan ikirəqəmli ədədlər içərisində $36$ ilə qarşılıqlı sadə olan neçə natural ədəd var?',
  '[{"key": "A", "text": "$8$"}, {"key": "B", "text": "$9$"}, {"key": "C", "text": "$10$"}, {"key": "D", "text": "$11$"}, {"key": "E", "text": "$12$"}]'::jsonb, 'B', NULL, NULL,
  '$36=2^2\cdot3^2$, ona görə ədəd nə $2$-yə, nə də $3$-ə bölünməməlidir. $10$-dan $36$-ya qədər olan belə ədədlər: $11,13,17,19,23,25,29,31,35$ — cəmi $9$ ədəd.',
  2025, 'I', 7, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0032 | əsas: 2025 toplu, I hissə, səh.7 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0032', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'closed',
  '$8$-ə, $9$-a və $12$-yə böldükdə qalıqda $5$ alınan ən kiçik çoxrəqəmli natural ədədin rəqəmlərinin cəmini tapın.',
  '[{"key": "A", "text": "$9$"}, {"key": "B", "text": "$12$"}, {"key": "C", "text": "$14$"}, {"key": "D", "text": "$7$"}, {"key": "E", "text": "$11$"}]'::jsonb, 'C', NULL, NULL,
  'Axtarılan ədəd $n=k\cdot\text{ƏKOB}(8,9,12)+5=72k+5$ şəklindədir. $k=0$ olduqda $n=5$ birrəqəmlidir, $k=1$ olduqda $n=77$. Rəqəmlər cəmi: $7+7=14$.',
  2025, 'I', 7, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0033 | əsas: 2025 toplu, I hissə, səh.7 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0033', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'closed',
  '$4$-ə, $6$-ya və $10$-a böldükdə qalıqda $3$ alınan ən kiçik çoxrəqəmli natural ədədin rəqəmlərinin cəmini tapın.',
  '[{"key": "A", "text": "$6$"}, {"key": "B", "text": "$3$"}, {"key": "C", "text": "$12$"}, {"key": "D", "text": "$8$"}, {"key": "E", "text": "$9$"}]'::jsonb, 'E', NULL, NULL,
  '$\text{ƏKOB}(4,6,10)=60$, ona görə $n=60k+3$. $k=0$: $n=3$ birrəqəmlidir; $k=1$: $n=63$. Rəqəmlər cəmi: $6+3=9$.',
  2025, 'I', 7, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0034 | əsas: 2025 toplu, I hissə, səh.7 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0034', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{\text{ƏKOB}(84;126)}{\text{ƏBOB}(84;126)}$ nisbətini hesablayın.',
  '[{"key": "A", "text": "$3$"}, {"key": "B", "text": "$2$"}, {"key": "C", "text": "$12$"}, {"key": "D", "text": "$6$"}, {"key": "E", "text": "$9$"}]'::jsonb, 'D', NULL, NULL,
  '$84=2^2\cdot3\cdot7$, $126=2\cdot3^2\cdot7$. $\text{ƏBOB}=2\cdot3\cdot7=42$, $\text{ƏKOB}=2^2\cdot3^2\cdot7=252$. Nisbət: $252:42=6$.',
  2025, 'I', 7, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0035 | əsas: 2025 toplu, I hissə, səh.7 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0035', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{\text{ƏKOB}(90;150)}{\text{ƏBOB}(90;150)}$ nisbətini hesablayın.',
  '[{"key": "A", "text": "$45$"}, {"key": "B", "text": "$15$"}, {"key": "C", "text": "$30$"}, {"key": "D", "text": "$10$"}, {"key": "E", "text": "$5$"}]'::jsonb, 'B', NULL, NULL,
  '$90=2\cdot3^2\cdot5$, $150=2\cdot3\cdot5^2$. $\text{ƏBOB}=2\cdot3\cdot5=30$, $\text{ƏKOB}=2\cdot3^2\cdot5^2=450$. Nisbət: $450:30=15$.',
  2025, 'I', 7, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0036 | əsas: 2025 toplu, I hissə, səh.7 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0036', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'closed',
  '$a$ natural ədədinin sadə vuruqlara ayrılışında $4$ sadə vuruq, $b$ natural ədədinin ayrılışında isə $7$ sadə vuruq var (təkrarlanan vuruqlar da sayılır). $a\cdot b$ ədədinin sadə vuruqlara ayrılışında neçə sadə vuruq var?',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$3$"}, {"key": "C", "text": "$7$"}, {"key": "D", "text": "$28$"}, {"key": "E", "text": "$11$"}]'::jsonb, 'E', NULL, NULL,
  '$a=p_1p_2p_3p_4$, $b=q_1q_2\cdots q_7$ (vuruqlar təkrarlana bilər). Onda $a\cdot b=p_1\cdots p_4\cdot q_1\cdots q_7$ — sadə vuruqlara ayrılış yeganədir, ona görə vuruqların sayı $4+7=11$-dir.',
  2025, 'I', 7, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0037 | əsas: 2025 toplu, I hissə, səh.7 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0037', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'closed',
  '$a$ natural ədədinin sadə vuruqlara ayrılışında $6$ sadə vuruq, $b$ natural ədədinin ayrılışında isə $9$ sadə vuruq var (təkrarlanan vuruqlar da sayılır). $a\cdot b$ ədədinin sadə vuruqlara ayrılışında neçə sadə vuruq var?',
  '[{"key": "A", "text": "$15$"}, {"key": "B", "text": "$3$"}, {"key": "C", "text": "$9$"}, {"key": "D", "text": "$6$"}, {"key": "E", "text": "$54$"}]'::jsonb, 'A', NULL, NULL,
  'Sadə vuruqlara ayrılış yeganə olduğundan $a\cdot b$ ədədinin ayrılışı $a$ və $b$-nin ayrılışlarının birləşməsidir: $6+9=15$ sadə vuruq.',
  2025, 'I', 7, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0038 | əsas: 2025 toplu, I hissə, səh.7 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0038', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'closed',
  'Biri o birinin $\dfrac{2}{5}$-ni təşkil edən iki natural ədədin ƏBOB-u $14$-dür. Bu ədədlərin cəmini tapın.',
  '[{"key": "A", "text": "$196$"}, {"key": "B", "text": "$126$"}, {"key": "C", "text": "$70$"}, {"key": "D", "text": "$98$"}, {"key": "E", "text": "$84$"}]'::jsonb, 'D', NULL, NULL,
  'Ədədlər $2k$ və $5k$ şəklindədir; $\text{ƏBOB}(2,5)=1$ olduğundan $\text{ƏBOB}(2k,5k)=k=14$. Ədədlər $28$ və $70$, cəmi $98$.',
  2025, 'I', 7, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0039 | əsas: 2025 toplu, I hissə, səh.8 №29
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0039', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'open',
  '$a,\ b$ natural ədədləri üçün $\dfrac{a}{b}=\dfrac{2}{7}$ və $\text{ƏKOB}(a,b)+\text{ƏBOB}(a,b)=120$ olarsa, $b-a$-nı tapın.',
  NULL, NULL, NULL, '40',
  '$a=2k$, $b=7k$; $\text{ƏBOB}=k$, $\text{ƏKOB}=14k$. $14k+k=15k=120\Rightarrow k=8$. $a=16$, $b=56$, $b-a=40$.',
  2025, 'I', 8, 29)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0040 | əsas: 2025 toplu, I hissə, səh.8 №30
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0040', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'open',
  '$a,\ b$ natural ədədləri üçün $\dfrac{a}{b}=\dfrac{3}{5}$ və $\text{ƏKOB}(a,b)-\text{ƏBOB}(a,b)=70$ olarsa, $a+b$-ni tapın.',
  NULL, NULL, NULL, '40',
  '$a=3k$, $b=5k$; $\text{ƏBOB}=k$, $\text{ƏKOB}=15k$. $15k-k=14k=70\Rightarrow k=5$. $a=15$, $b=25$, $a+b=40$.',
  2025, 'I', 8, 30)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0041 | əsas: 2025 toplu, I hissə, səh.8 №31
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0041', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'open',
  'Natural $a$ və $b$ ədədləri üçün $a:b=4$ və $\text{ƏKOB}(a;b)=96$ olarsa, $\text{ƏBOB}(a;b)$-ni tapın.',
  NULL, NULL, NULL, '24',
  '$a=4b$, yəni $a$ ədədi $b$-yə bölünür. Onda $\text{ƏKOB}(a;b)=a=96$, $b=24$, $\text{ƏBOB}(a;b)=b=24$.',
  2025, 'I', 8, 31)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0042 | əsas: 2025 toplu, I hissə, səh.8 №32
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0042', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'open',
  '$a:b=6$ və $\text{ƏKOB}(a,b)=84$ olarsa, $\text{ƏBOB}(a,b)$-ni tapın.',
  NULL, NULL, NULL, '14',
  '$a=6b$ olduğundan $\text{ƏKOB}(a,b)=a=84$, $b=14$, $\text{ƏBOB}(a,b)=b=14$.',
  2025, 'I', 8, 32)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0043 | əsas: 2025 toplu, I hissə, səh.8 №33
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0043', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'open',
  '$n=42^2+28^2$ ədədinin müxtəlif sadə vuruqlarının sayını tapın.',
  NULL, NULL, NULL, '3',
  '$42^2+28^2=14^2\cdot3^2+14^2\cdot2^2=14^2(9+4)=14^2\cdot13=2^2\cdot7^2\cdot13$. Müxtəlif sadə vuruqlar: $2,\ 7,\ 13$ — cəmi $3$.',
  2025, 'I', 8, 33)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0044 | əsas: 2025 toplu, I hissə, səh.8 №34
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0044', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'open',
  '$26^2+39^2$ ədədinin müxtəlif sadə vuruqlarının sayını tapın.',
  NULL, NULL, NULL, '1',
  '$26^2+39^2=13^2\cdot2^2+13^2\cdot3^2=13^2(4+9)=13^3$. Yeganə sadə vuruq $13$-dür, cavab $1$.',
  2025, 'I', 8, 34)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0045 | əsas: 2025 toplu, I hissə, səh.9 №40
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0045', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'open',
  '$a=5^n\cdot7^m$ ədədinin sadə vuruqlarının sayı (təkrarlananlar da sayılır) $10$, natural bölənlərinin sayı $32$ olarsa, $|m-n|$-i tapın.',
  NULL, NULL, NULL, '4',
  'Sadə vuruqların sayı $n+m=10$. Bölənlərin sayı $(n+1)(m+1)=32$. $(n+1)+(m+1)=12$ və $(n+1)(m+1)=32$ olduğundan $n+1$ və $m+1$ ədədləri $t^2-12t+32=0$ tənliyinin kökləridir: $4$ və $8$. Deməli, $\{n,m\}=\{3,7\}$, $|m-n|=4$.',
  2025, 'I', 9, 40)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0046 | əsas: 2025 toplu, I hissə, səh.11 №68
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0046', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'written',
  'Ölçüləri $60$ metr və $84$ metr olan düzbucaqlı şəklində kiçik parkın ətrafına onun sərhədləri boyunca bir-birlərindən bərabər məsafələrdə künc nöqtələrindən başlayaraq, hər birinin qiyməti $35$ manat olan işıq dirəkləri bərkidilib. Bu dirəklərin alınmasına ən az neçə manat xərclənib?',
  NULL, NULL, NULL, '840',
  'Dirəklər künclərdə olmalı və aralarındakı məsafə bərabər olmalıdır, ona görə məsafə həm $60$-ın, həm də $84$-ün bölənidir. Xərcin ən az olması üçün məsafə ən böyük olmalıdır: $\text{ƏBOB}(60;84)=12$ m. Perimetr: $2(60+84)=288$ m. Qapalı xətt boyunca dirəklərin sayı $288:12=24$. Xərc: $24\cdot35=840$ manat.',
  2025, 'I', 11, 68)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0047 | əsas: 2025 toplu, I hissə, səh.11 №69
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0047', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'written',
  'Ölçüləri $45$ metr və $75$ metr olan düzbucaqlı şəklində kiçik parkın ətrafına onun sərhədləri boyunca bir-birlərindən bərabər məsafələrdə künc nöqtələrindən başlayaraq, hər birinin qiyməti $45$ manat olan işıq dirəkləri bərkidilib. Bu dirəklərin alınmasına ən az neçə manat xərclənib?',
  NULL, NULL, NULL, '720',
  'Məsafə $45$ və $75$-in ortaq böləni olmalıdır; dirəklərin sayının ən az olması üçün o, ən böyük olmalıdır: $\text{ƏBOB}(45;75)=15$ m. Perimetr $2(45+75)=240$ m, dirəklərin sayı $240:15=16$. Xərc: $16\cdot45=720$ manat.',
  2025, 'I', 11, 69)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0048 | əsas: 2025 toplu, I hissə, səh.11 №70
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0048', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'written',
  '$a$ və $b$ natural ədədlərinin sadə vuruqlara ayrılışı $a=2^m\cdot5^6\cdot13^n$ və $b=2^5\cdot5^k\cdot13^4\cdot3^2$ kimidir. $\text{ƏBOB}(a;b)=2\cdot5^5\cdot13^3$ olarsa, $m\cdot n\cdot k$ hasilini tapın.',
  NULL, NULL, NULL, '15',
  'ƏBOB-da hər sadə vuruq iki ayrılışdakı üstlərin kiçiyi ilə daxil olur. $2$: $\min(m;5)=1\Rightarrow m=1$. $5$: $\min(6;k)=5\Rightarrow k=5$. $13$: $\min(n;4)=3\Rightarrow n=3$. $m\cdot n\cdot k=1\cdot3\cdot5=15$.',
  2025, 'I', 11, 70)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0049 | əsas: 2025 toplu, I hissə, səh.11 №71
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0049', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'written',
  '$a$ və $b$ natural ədədlərinin sadə vuruqlara ayrılışı $a=3^m\cdot2^6\cdot7^5\cdot11^4$ və $b=2^n\cdot3^5\cdot7^k$ kimidir. $\text{ƏBOB}(a;b)=2^4\cdot3^2\cdot7^3$ olarsa, $m\cdot n\cdot k$ hasilini tapın.',
  NULL, NULL, NULL, '24',
  '$2$: $\min(6;n)=4\Rightarrow n=4$. $3$: $\min(m;5)=2\Rightarrow m=2$. $7$: $\min(5;k)=3\Rightarrow k=3$. $11$ yalnız $a$-da olduğundan ƏBOB-a daxil deyil. $m\cdot n\cdot k=2\cdot4\cdot3=24$.',
  2025, 'I', 11, 71)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0050 | əsas: 2025 toplu, I hissə, səh.11 №72
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0050', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'written',
  'Döşəməsi kvadrat formasında olan otağın döşəməsinin tərəflərinin uzunluğu **ən az** neçə **metr** olmalıdır ki, onu ölçüləri $36$ sm və $60$ sm olan düzbucaqlı formasında kafellərdən itkisiz istifadə etməklə tam örtmək mümkün olsun?',
  NULL, NULL, NULL, '1,8',
  'Kvadratın tərəfi kafellərin hər iki ölçüsünə bölünməlidir, ən kiçik belə uzunluq $\text{ƏKOB}(36;60)$-dır. $36=2^2\cdot3^2$, $60=2^2\cdot3\cdot5$, $\text{ƏKOB}=2^2\cdot3^2\cdot5=180$ sm $=1{,}8$ m.',
  2025, 'I', 11, 72)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0051 | əsas: 2025 toplu, I hissə, səh.11 №73
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0051', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'written',
  'Döşəməsi kvadrat formasında olan otağın döşəməsinin tərəflərinin uzunluğu **ən az** neçə **metr** olmalıdır ki, onu ölçüləri $48$ sm və $80$ sm olan düzbucaqlı formasında kafellərdən itkisiz istifadə etməklə tam örtmək mümkün olsun?',
  NULL, NULL, NULL, '2,4',
  'Tərəf $48$ və $80$-in ortaq bölünəni olmalıdır, ən kiçiyi $\text{ƏKOB}(48;80)$-dır. $48=2^4\cdot3$, $80=2^4\cdot5$, $\text{ƏKOB}=2^4\cdot3\cdot5=240$ sm $=2{,}4$ m.',
  2025, 'I', 11, 73)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0052 | əsas: 2025 toplu, I hissə, səh.11 №74
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0052', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'written',
  '$a$ və $b$ natural ədədlərinin sadə vuruqlara ayrılışı $a=2^m\cdot3^4\cdot7^n$ və $b=2^3\cdot3^k\cdot7^2\cdot11^p$ kimidir. $\text{ƏKOB}(a;b)=2^5\cdot3^6\cdot7^4\cdot11^2$ olarsa, $m+n+k+p$ cəmini tapın.',
  NULL, NULL, NULL, '17',
  'ƏKOB-da hər sadə vuruq üstlərin böyüyü ilə daxil olur. $2$: $\max(m;3)=5\Rightarrow m=5$. $3$: $\max(4;k)=6\Rightarrow k=6$. $7$: $\max(n;2)=4\Rightarrow n=4$. $11$: yalnız $b$-də var, $p=2$. $m+n+k+p=5+4+6+2=17$.',
  2025, 'I', 11, 74)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0053 | əsas: 2025 toplu, I hissə, səh.11 №75
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0053', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'written',
  '$a$ və $b$ natural ədədlərinin sadə vuruqlara ayrılışı $a=3^m\cdot5^2\cdot13^n$ və $b=3^4\cdot5^k\cdot13\cdot2^p$ kimidir. $\text{ƏKOB}(a;b)=2^4\cdot3^7\cdot5^3\cdot13^5$ olarsa, $m+n+k+p$ cəmini tapın.',
  NULL, NULL, NULL, '19',
  '$3$: $\max(m;4)=7\Rightarrow m=7$. $5$: $\max(2;k)=3\Rightarrow k=3$. $13$: $\max(n;1)=5\Rightarrow n=5$. $2$: yalnız $b$-də var, $p=4$. $m+n+k+p=7+5+3+4=19$.',
  2025, 'I', 11, 75)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0054 | əsas: 2025 toplu, I hissə, səh.11 №76
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0054', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'written',
  'Ölçüləri $42$ metr, $56$ metr və $70$ metr olan üçbucaq şəklində bağın ətrafına onun sərhədləri boyunca künc nöqtələrindən başlayaraq bir-birlərindən bərabər məsafələrdə olmaqla ağaclar əkilməlidir. Bunun üçün ən az neçə ədəd ağac lazımdır?',
  NULL, NULL, NULL, '12',
  'Ağaclar künclərdə olmalı və məsafələr bərabər olmalıdır, ona görə məsafə hər üç tərəfin ortaq bölənidir; ağacların sayının ən az olması üçün o, ən böyük olmalıdır: $\text{ƏBOB}(42;56;70)=14$ m. Perimetr $42+56+70=168$ m, ağacların sayı $168:14=12$.',
  2025, 'I', 11, 76)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0055 | əsas: 2025 toplu, I hissə, səh.11 №77
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0055', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'written',
  'Ölçüləri $36$ metr, $54$ metr və $90$ metr olan üçbucaq şəklində bağın ətrafına onun sərhədləri boyunca künc nöqtələrindən başlayaraq bir-birlərindən bərabər məsafələrdə olmaqla ağaclar əkilməlidir. Bunun üçün ən az neçə ədəd ağac lazımdır?',
  NULL, NULL, NULL, '10',
  'Məsafə $\text{ƏBOB}(36;54;90)=18$ m olmalıdır. Perimetr $36+54+90=180$ m, ağacların sayı $180:18=10$.',
  2025, 'I', 11, 77)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0056 | əsas: 2025 toplu, I hissə, səh.12 №81
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0056', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'open',
  '$a=5x-2$ və $b=2y+1$ qarşılıqlı sadə ədədləri üçün $14(5x-2)=26(2y+1)$ olarsa, $xy$ hasilini tapın $(x\in N,\ y\in N)$.',
  NULL, NULL, NULL, '9',
  'Bərabərlik $14a=26b$, yəni $7a=13b$ şəklindədir. $a$ və $b$ qarşılıqlı sadə olduğundan $a\mid13$, $b\mid7$ və $\dfrac{a}{b}=\dfrac{13}{7}$ — deməli $a=13$, $b=7$. $5x-2=13\Rightarrow x=3$; $2y+1=7\Rightarrow y=3$. $xy=9$.',
  2025, 'I', 12, 81)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0057 | əsas: 2025 toplu, I hissə, səh.12 №82
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0057', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Natural ədədlər' AND s.title='Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB'), 'original', 'own', 'az', 'draft', 'open',
  '$3x+1$ və $4y+1$ qarşılıqlı sadə ədədləri üçün $34(3x+1)=38(4y+1)$ olarsa, $xy$ hasilini tapın $(x\in N,\ y\in N)$.',
  NULL, NULL, NULL, '24',
  'Bərabərliyi $2$-yə bölək: $17(3x+1)=19(4y+1)$. Ədədlər qarşılıqlı sadə olduğundan $3x+1=19$, $4y+1=17$. Buradan $x=6$, $y=4$, $xy=24$.',
  2025, 'I', 12, 82)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- NAT-0058 | əsas: 2025 toplu, I hissə, səh.40 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('NAT-0058', NULL, NULL, (SELECT id FROM topics WHERE name='Natural ədədlər'), NULL, 'original', 'own', 'az', 'draft', 'open',
  '$a$ və $b$ natural ədədləri üçün $|7a-3b|$ ifadəsinin ən kiçik qiymət aldığını bilərək $\dfrac{120}{a+b}$ ifadəsinin ən böyük qiymətini tapın.',
  NULL, NULL, NULL, '12',
  '$|7a-3b|\ge0$ və $0$ qiyməti $7a=3b$ olduqda alınır. $\text{ƏBOB}(7,3)=1$ olduğundan $a=3k$, $b=7k$ ($k\in N$), $a+b=10k$. $\dfrac{120}{10k}=\dfrac{12}{k}$ ifadəsi $k=1$ olduqda ən böyükdür: $12$.',
  2025, 'I', 40, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
