-- Mövzu: Koordinat və vektorlar — 38 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- KVK-0001 | əsas: 2025 toplu, II hissə, səh.236 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Nöqtənin koordinatları. İki nöqtə arasındakı məsafə'), 'original', 'own', 'az', 'draft', 'closed',
  '$A(7;\,m)$ və $B(-5;\,5)$ nöqtələri koordinat başlanğıcından eyni məsafədə olarsa, $m$-i tapın.',
  '[{"key": "A", "text": "$0$"}, {"key": "B", "text": "$1$"}, {"key": "C", "text": "$\\pm1$"}, {"key": "D", "text": "$-1$"}, {"key": "E", "text": "$\\pm7$"}]'::jsonb, 'C', NULL, NULL,
  '$OA^2=OB^2$: $49+m^2=25+25\Rightarrow m^2=1$, $m=\pm1$.',
  2025, 'II', 236, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0002 | əsas: 2025 toplu, II hissə, səh.236 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Nöqtənin koordinatları. İki nöqtə arasındakı məsafə'), 'original', 'own', 'az', 'draft', 'closed',
  '$A(m;\,-6)$ və $B(-2;\,6)$ nöqtələri koordinat başlanğıcından eyni məsafədə olarsa, $m$-i tapın.',
  '[{"key": "A", "text": "$\\pm2$"}, {"key": "B", "text": "$\\pm6$"}, {"key": "C", "text": "$0$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$-2$"}]'::jsonb, 'A', NULL, NULL,
  '$m^2+36=4+36\Rightarrow m^2=4$, $m=\pm2$.',
  2025, 'II', 236, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0003 | əsas: 2025 toplu, II hissə, səh.236 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Nöqtənin koordinatları. İki nöqtə arasındakı məsafə'), 'original', 'own', 'az', 'draft', 'closed',
  'Təpələri $A(2;\,-1;\,3)$, $B(4;\,3;\,1)$, $C(-2;\,1;\,5)$ nöqtələri olan üçbucağın $AM$ medianının uzunluğunu tapın.',
  '[{"key": "A", "text": "$\\sqrt6$"}, {"key": "B", "text": "$4$"}, {"key": "C", "text": "$\\sqrt{10}$"}, {"key": "D", "text": "$2\\sqrt3$"}, {"key": "E", "text": "$3$"}]'::jsonb, 'C', NULL, NULL,
  '$M$ – $BC$-nin ortası: $M(1;\,2;\,3)$. $AM=\sqrt{(1-2)^2+(2+1)^2+0^2}=\sqrt{10}$.',
  2025, 'II', 236, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0004 | əsas: 2025 toplu, II hissə, səh.236 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Nöqtənin koordinatları. İki nöqtə arasındakı məsafə'), 'original', 'own', 'az', 'draft', 'closed',
  'Təpələri $A(5;\,-2;\,4)$, $B(1;\,6;\,-3)$, $C(3;\,-4;\,7)$ nöqtələri olan üçbucağın $AK$ medianının uzunluğunu tapın.',
  '[{"key": "A", "text": "$3\\sqrt2$"}, {"key": "B", "text": "$2\\sqrt5$"}, {"key": "C", "text": "$\\sqrt{26}$"}, {"key": "D", "text": "$\\sqrt{22}$"}, {"key": "E", "text": "$5$"}]'::jsonb, 'D', NULL, NULL,
  '$K(2;\,1;\,2)$. $AK=\sqrt{9+9+4}=\sqrt{22}$.',
  2025, 'II', 236, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0005 | əsas: 2025 toplu, II hissə, səh.237 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Nöqtənin koordinatları. İki nöqtə arasındakı məsafə'), 'original', 'own', 'az', 'draft', 'matching',
  '$C$ nöqtəsi $AB$ parçasının orta nöqtəsidir. Uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$A(1;\\,-2;\\,3)$, $B(x;\\,y;\\,z)$, $C(-1;\\,-3;\\,2)$"}, {"key": "2", "text": "$A(4;\\,1;\\,-3)$, $B(2;\\,5;\\,8)$, $C(x;\\,y;\\,z)$"}, {"key": "3", "text": "$A(x;\\,y;\\,z)$, $B(-1;\\,-2;\\,4)$, $C(3;\\,2;\\,0)$"}], "right": [{"key": "a", "text": "$x=-3$"}, {"key": "b", "text": "$y=-4$"}, {"key": "c", "text": "$z=2{,}5$"}, {"key": "d", "text": "$x=7$"}, {"key": "e", "text": "$y=6$"}]}'::jsonb, NULL, '{"1": ["a", "b"], "2": ["c"], "3": ["d", "e"]}'::jsonb, NULL,
  'Orta nöqtə düsturu: $C=\dfrac{A+B}{2}$, $B=2C-A$, $A=2C-B$. 1) $B(-3;\,-4;\,1)$; 2) $C(3;\,3;\,2{,}5)$; 3) $A(7;\,6;\,-4)$.',
  2025, 'II', 237, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0006 | əsas: 2025 toplu, II hissə, səh.237 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Nöqtənin koordinatları. İki nöqtə arasındakı məsafə'), 'original', 'own', 'az', 'draft', 'matching',
  'Düzbucaqlı koordinat sistemində uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$A(3;\\,-5;\\,4)$, $B(3;\\,5;\\,4)$"}, {"key": "2", "text": "$A(-4;\\,1;\\,6)$, $B(4;\\,1;\\,6)$"}, {"key": "3", "text": "$A(2;\\,3;\\,-2)$, $B(2;\\,-3;\\,2)$"}], "right": [{"key": "a", "text": "$A$ və $B$ nöqtələri $xz$ müstəvisinə nəzərən simmetrikdir"}, {"key": "b", "text": "$A$ və $B$ nöqtələri $Ox$ oxuna nəzərən simmetrikdir"}, {"key": "c", "text": "$A$ və $B$ nöqtələri $yz$ müstəvisinə nəzərən simmetrikdir"}, {"key": "d", "text": "$AB=2\\sqrt{13}$"}, {"key": "e", "text": "$AB=10$"}]}'::jsonb, NULL, '{"1": ["a", "e"], "2": ["c"], "3": ["b", "d"]}'::jsonb, NULL,
  '1) Yalnız $y$ işarəsini dəyişib – $xz$ müstəvisinə nəzərən simmetriya, $AB=10$. 2) Yalnız $x$ – $yz$ müstəvisi, $AB=8$. 3) $y$ və $z$ – $Ox$ oxu, $AB=\sqrt{36+16}=2\sqrt{13}$.',
  2025, 'II', 237, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0007 | əsas: 2025 toplu, II hissə, səh.237 №29
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0007', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Nöqtənin koordinatları. İki nöqtə arasındakı məsafə'), 'original', 'own', 'az', 'draft', 'matching',
  'Düzbucaqlı koordinat sistemində uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$A(5;\\,5;\\,-2)$, $B(5;\\,-5;\\,2)$"}, {"key": "2", "text": "$A(-2;\\,5;\\,5)$, $B(-2;\\,5;\\,-5)$"}, {"key": "3", "text": "$A(1;\\,-5;\\,2)$, $B(1;\\,5;\\,2)$"}], "right": [{"key": "a", "text": "$A$ və $B$ nöqtələri $Ox$ oxuna nəzərən simmetrikdir"}, {"key": "b", "text": "$A$ və $B$ nöqtələri $xy$ müstəvisinə nəzərən simmetrikdir"}, {"key": "c", "text": "$AB=2\\sqrt{29}$"}, {"key": "d", "text": "$A$ və $B$ nöqtələri $xz$ müstəvisinə nəzərən simmetrikdir"}, {"key": "e", "text": "$AB=10$"}]}'::jsonb, NULL, '{"1": ["a", "c"], "2": ["b", "e"], "3": ["d", "e"]}'::jsonb, NULL,
  '1) $y,z$ işarəsini dəyişib – $Ox$ oxu; $AB=\sqrt{100+16}=2\sqrt{29}$. 2) Yalnız $z$ – $xy$ müstəvisi; $AB=10$. 3) Yalnız $y$ – $xz$ müstəvisi; $AB=10$.',
  2025, 'II', 237, 29)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0008 | əsas: 2025 toplu, II hissə, səh.237 №30
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Nöqtənin koordinatları. İki nöqtə arasındakı məsafə'), 'original', 'own', 'az', 'draft', 'matching',
  'Fəzada düzbucaqlı koordinat sistemində uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$M(5;\\,0;\\,-3)$"}, {"key": "2", "text": "$M(0;\\,0;\\,7)$"}, {"key": "3", "text": "$M(-2;\\,6;\\,0)$"}], "right": [{"key": "a", "text": "$M$ nöqtəsi $xz$ müstəvisi üzərindədir"}, {"key": "b", "text": "$M$ nöqtəsi $Oz$ oxu üzərindədir"}, {"key": "c", "text": "$M$ nöqtəsi $xy$ müstəvisi üzərindədir"}, {"key": "d", "text": "$M$ nöqtəsindən $yz$ müstəvisinə qədər olan məsafə $5$-dir"}, {"key": "e", "text": "$M$ nöqtəsindən $xy$ müstəvisinə qədər olan məsafə $3$-dür"}]}'::jsonb, NULL, '{"1": ["a", "d", "e"], "2": ["a", "b"], "3": ["c"]}'::jsonb, NULL,
  '$xz$ müstəvisində $y=0$, $Oz$ oxunda $x=y=0$, $xy$ müstəvisində $z=0$. Nöqtədən $yz$ müstəvisinə məsafə $|x|$, $xy$ müstəvisinə məsafə $|z|$-dir. 1) $M(5;0;-3)$: $xz$-də, $|x|=5$, $|z|=3$. 2) $x=y=0$ – $Oz$ oxu üzərindədir (bu ox $xz$ müstəvisində yerləşir). 3) $xy$ müstəvisində.',
  2025, 'II', 237, 30)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0009 | əsas: 2025 toplu, II hissə, səh.238 №31
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Nöqtənin koordinatları. İki nöqtə arasındakı məsafə'), 'original', 'own', 'az', 'draft', 'matching',
  'Düzbucaqlı koordinat sistemində uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$M(0;\\,-4;\\,5)$"}, {"key": "2", "text": "$M(-2;\\,0;\\,3)$"}, {"key": "3", "text": "$M(6;\\,0;\\,0)$"}], "right": [{"key": "a", "text": "$M$ nöqtəsi $yz$ müstəvisi üzərindədir"}, {"key": "b", "text": "$M$ nöqtəsi $xz$ müstəvisi üzərindədir"}, {"key": "c", "text": "$M$ nöqtəsi $Ox$ oxu üzərindədir"}, {"key": "d", "text": "$M$ nöqtəsindən $xz$ müstəvisinə qədər olan məsafə $4$-dür"}, {"key": "e", "text": "$M$ nöqtəsindən $yz$ müstəvisinə qədər olan məsafə $2$-dir"}]}'::jsonb, NULL, '{"1": ["a", "d"], "2": ["b", "e"], "3": ["b", "c"]}'::jsonb, NULL,
  '1) $x=0$ – $yz$ müstəvisi, $xz$-ə məsafə $|y|=4$. 2) $y=0$ – $xz$ müstəvisi, $yz$-ə məsafə $|x|=2$. 3) $y=z=0$ – $Ox$ oxu (o, $xz$ müstəvisində yerləşir).',
  2025, 'II', 238, 31)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0010 | əsas: 2025 toplu, II hissə, səh.239 №20
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Düz xəttin tənliyi və düz xətlərin qarşılıqlı vəziyyəti'), 'original', 'own', 'az', 'draft', 'closed',
  '$A(2;\,-1)$ nöqtəsindən keçən və $4x-2y+3=0$ düz xəttinə paralel olan düz xəttin tənliyini göstərin.',
  '[{"key": "A", "text": "$y=2x-1$"}, {"key": "B", "text": "$y=2x-5$"}, {"key": "C", "text": "$y=-\\dfrac12x$"}, {"key": "D", "text": "$y=-2x+3$"}, {"key": "E", "text": "$y=2x+3$"}]'::jsonb, 'B', NULL, NULL,
  'Paralel düz xətlərin bucaq əmsalları bərabərdir: $4x-2y+3=0\Rightarrow y=2x+1{,}5$, $k=2$. $y+1=2(x-2)\Rightarrow y=2x-5$.',
  2025, 'II', 239, 20)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0011 | əsas: 2025 toplu, II hissə, səh.241 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0011', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Çevrənin tənliyi'), 'original', 'own', 'az', 'draft', 'closed',
  '$x^2+(y+3)^2=100$ çevrəsinin $Oy$ oxu ilə kəsişmə nöqtələrinin koordinatlarını tapın.',
  '[{"key": "A", "text": "$(0;\\,13)$ və $(0;\\,-7)$"}, {"key": "B", "text": "$(0;\\,7)$ və $(0;\\,-13)$"}, {"key": "C", "text": "$(0;\\,10)$ və $(0;\\,-10)$"}, {"key": "D", "text": "$(0;\\,7)$"}, {"key": "E", "text": "$(0;\\,-13)$ və $(0;\\,13)$"}]'::jsonb, 'B', NULL, NULL,
  '$x=0$: $(y+3)^2=100\Rightarrow y+3=\pm10$, $y=7$ və ya $y=-13$.',
  2025, 'II', 241, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0012 | əsas: 2025 toplu, II hissə, səh.243 №34
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0012', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Çevrənin tənliyi'), 'original', 'own', 'az', 'draft', 'matching',
  'Uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$x^2+y^2=16$"}, {"key": "2", "text": "$(x+2)^2+y^2=1$"}, {"key": "3", "text": "$x^2+y^2-3y=0$"}], "right": [{"key": "a", "text": "çevrənin radiusu $1{,}5$-dir"}, {"key": "b", "text": "$M\\left(0;\\,\\dfrac32\\right)$ nöqtəsi çevrənin mərkəzidir"}, {"key": "c", "text": "çevrənin mərkəzi koordinat başlanğıcıdır"}, {"key": "d", "text": "$N(-3;\\,0)$ nöqtəsindən keçir"}, {"key": "e", "text": "$P(0;\\,-4)$ nöqtəsindən keçir"}]}'::jsonb, NULL, '{"1": ["c", "e"], "2": ["d"], "3": ["a", "b"]}'::jsonb, NULL,
  '1) Mərkəz $(0;0)$, $r=4$; $P(0;-4)$ üzərindədir. 2) Mərkəz $(-2;0)$, $r=1$; $N(-3;0)$ üzərindədir. 3) $x^2+\left(y-\dfrac32\right)^2=\dfrac94$: mərkəz $\left(0;\dfrac32\right)$, $r=1{,}5$.',
  2025, 'II', 243, 34)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0013 | əsas: 2025 toplu, II hissə, səh.243 №35
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Çevrənin tənliyi'), 'original', 'own', 'az', 'draft', 'matching',
  'Uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$x^2+y^2=29$"}, {"key": "2", "text": "$(x+4)^2+y^2=4$"}, {"key": "3", "text": "$x^2+y^2+x=0$"}], "right": [{"key": "a", "text": "çevrənin mərkəzi koordinat başlanğıcıdır"}, {"key": "b", "text": "$M(2;\\,-5)$ nöqtəsindən keçir"}, {"key": "c", "text": "$N\\left(-\\dfrac12;\\,0\\right)$ nöqtəsi çevrənin mərkəzidir"}, {"key": "d", "text": "çevrənin radiusu $0{,}5$-dir"}, {"key": "e", "text": "$P(-2;\\,0)$ nöqtəsindən keçir"}]}'::jsonb, NULL, '{"1": ["a", "b"], "2": ["e"], "3": ["c", "d"]}'::jsonb, NULL,
  '1) Mərkəz $O$, $4+25=29$ – $M$ üzərindədir. 2) Mərkəz $(-4;0)$, $r=2$: $P(-2;0)$ üzərindədir. 3) $\left(x+\dfrac12\right)^2+y^2=\dfrac14$: mərkəz $\left(-\dfrac12;0\right)$, $r=0{,}5$.',
  2025, 'II', 243, 35)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0014 | əsas: 2025 toplu, II hissə, səh.243 №36
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Çevrənin tənliyi'), 'original', 'own', 'az', 'draft', 'matching',
  'Uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$(x+3)^2+(y-4)^2=4$"}, {"key": "2", "text": "$(x-6)^2+(y+8)^2=16$"}, {"key": "3", "text": "$x^2+y^2-6x-8y=-24$"}], "right": [{"key": "a", "text": "diametri $8$-ə bərabərdir"}, {"key": "b", "text": "çevrənin mərkəzindən koordinat başlanğıcına qədər məsafə $10$-a bərabərdir"}, {"key": "c", "text": "çevrənin mərkəzindən koordinat başlanğıcına qədər məsafə $5$-ə bərabərdir"}, {"key": "d", "text": "mərkəzi $(-3;\\,4)$ nöqtəsində və radiusu $2$-yə bərabərdir"}, {"key": "e", "text": "mərkəzi $(6;\\,-8)$ nöqtəsində və radiusu $4$-ə bərabərdir"}]}'::jsonb, NULL, '{"1": ["c", "d"], "2": ["a", "b", "e"], "3": ["c"]}'::jsonb, NULL,
  '1) Mərkəz $(-3;4)$, $r=2$, $OO_1=5$. 2) Mərkəz $(6;-8)$, $r=4$, diametr $8$, $OO_1=10$. 3) $(x-3)^2+(y-4)^2=1$: $OO_1=5$.',
  2025, 'II', 243, 36)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0015 | əsas: 2025 toplu, II hissə, səh.243 №37
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0015', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Çevrənin tənliyi'), 'original', 'own', 'az', 'draft', 'matching',
  'Uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$(x+5)^2+(y-12)^2=9$"}, {"key": "2", "text": "$(x-8)^2+(y+15)^2=36$"}, {"key": "3", "text": "$x^2+y^2-16x-30y=-208$"}], "right": [{"key": "a", "text": "mərkəzi $(-5;\\,12)$ nöqtəsində və radiusu $3$-ə bərabərdir"}, {"key": "b", "text": "çevrənin mərkəzindən koordinat başlanğıcına qədər məsafə $13$-ə bərabərdir"}, {"key": "c", "text": "çevrənin mərkəzindən koordinat başlanğıcına qədər məsafə $17$-yə bərabərdir"}, {"key": "d", "text": "mərkəzi $(8;\\,-15)$ nöqtəsində və radiusu $6$-ya bərabərdir"}, {"key": "e", "text": "diametri $18$-ə bərabərdir"}]}'::jsonb, NULL, '{"1": ["a", "b"], "2": ["c", "d"], "3": ["c", "e"]}'::jsonb, NULL,
  '1) Mərkəz $(-5;12)$, $r=3$, $OO_1=13$. 2) Mərkəz $(8;-15)$, $r=6$, $OO_1=17$. 3) $(x-8)^2+(y-15)^2=81$: $r=9$, diametr $18$, $OO_1=17$.',
  2025, 'II', 243, 37)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0016 | əsas: 2025 toplu, II hissə, səh.245 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Vektorun koordinatları, uzunluğu, cəmi, fərqi və ədədə vurulması'), 'original', 'own', 'az', 'draft', 'closed',
  '$\vec a\langle3;\,-2\rangle$ və $\vec b\langle-1;\,4\rangle$ vektorları verilib. $2\vec a-3\vec b$ vektorunun komponentlərini tapın.',
  '[{"key": "A", "text": "$\\left\\langle 9;\\,-16\\right\\rangle$"}, {"key": "B", "text": "$\\left\\langle 5;\\,-16\\right\\rangle$"}, {"key": "C", "text": "$\\left\\langle -16;\\,9\\right\\rangle$"}, {"key": "D", "text": "$\\left\\langle 9;\\,8\\right\\rangle$"}, {"key": "E", "text": "$\\left\\langle 3;\\,8\\right\\rangle$"}]'::jsonb, 'A', NULL, NULL,
  '$2\vec a=\langle6;-4\rangle$, $3\vec b=\langle-3;12\rangle$. $2\vec a-3\vec b=\langle9;\,-16\rangle$.',
  2025, 'II', 245, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0017 | əsas: 2025 toplu, II hissə, səh.245 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Vektorun koordinatları, uzunluğu, cəmi, fərqi və ədədə vurulması'), 'original', 'own', 'az', 'draft', 'closed',
  '$\vec a\langle2;\,-3\rangle$ və $\vec b\langle-1;\,4\rangle$ vektorları verilib. $3\vec a+2\vec b$ vektorunun komponentlərini tapın.',
  '[{"key": "A", "text": "$\\left\\langle 4;\\,-1\\right\\rangle$"}, {"key": "B", "text": "$\\left\\langle -1;\\,4\\right\\rangle$"}, {"key": "C", "text": "$\\left\\langle 8;\\,-17\\right\\rangle$"}, {"key": "D", "text": "$\\left\\langle 1;\\,1\\right\\rangle$"}, {"key": "E", "text": "$\\left\\langle 4;\\,1\\right\\rangle$"}]'::jsonb, 'A', NULL, NULL,
  '$\langle6;-9\rangle+\langle-2;8\rangle=\langle4;\,-1\rangle$.',
  2025, 'II', 245, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0018 | əsas: 2025 toplu, II hissə, səh.246 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Vektorun koordinatları, uzunluğu, cəmi, fərqi və ədədə vurulması'), 'original', 'own', 'az', 'draft', 'closed',
  '$C(4;\,-1)$ və $D(-2;\,3)$ nöqtələri verilmişdir. $\overrightarrow{CD}$ vektorunun komponentlərini tapın.',
  '[{"key": "A", "text": "$\\left\\langle -6;\\,2\\right\\rangle$"}, {"key": "B", "text": "$\\left\\langle 2;\\,2\\right\\rangle$"}, {"key": "C", "text": "$\\left\\langle 4;\\,-6\\right\\rangle$"}, {"key": "D", "text": "$\\left\\langle -6;\\,4\\right\\rangle$"}, {"key": "E", "text": "$\\left\\langle 6;\\,-4\\right\\rangle$"}]'::jsonb, 'D', NULL, NULL,
  '$\overrightarrow{CD}=\langle-2-4;\,3+1\rangle=\langle-6;\,4\rangle$.',
  2025, 'II', 246, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0019 | əsas: 2025 toplu, II hissə, səh.246 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Vektorun koordinatları, uzunluğu, cəmi, fərqi və ədədə vurulması'), 'original', 'own', 'az', 'draft', 'closed',
  '$C(-2;\,5)$ və $D(3;\,-1)$ nöqtələri verilmişdir. $\overrightarrow{CD}$ vektorunun komponentlərini tapın.',
  '[{"key": "A", "text": "$\\left\\langle -6;\\,5\\right\\rangle$"}, {"key": "B", "text": "$\\left\\langle 1;\\,4\\right\\rangle$"}, {"key": "C", "text": "$\\left\\langle -5;\\,6\\right\\rangle$"}, {"key": "D", "text": "$\\left\\langle 5;\\,-6\\right\\rangle$"}, {"key": "E", "text": "$\\left\\langle 5;\\,6\\right\\rangle$"}]'::jsonb, 'D', NULL, NULL,
  '$\overrightarrow{CD}=\langle3+2;\,-1-5\rangle=\langle5;\,-6\rangle$.',
  2025, 'II', 246, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0020 | əsas: 2025 toplu, II hissə, səh.246 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Vektorun koordinatları, uzunluğu, cəmi, fərqi və ədədə vurulması'), 'original', 'own', 'az', 'draft', 'closed',
  '$\vec a\langle4;\,-1;\,2\rangle$ və $\vec b\langle1;\,1;\,-1\rangle$ olarsa, $\vec a-\vec b$ vektorunun uzunluğunu tapın.',
  '[{"key": "A", "text": "$\\sqrt{26}$"}, {"key": "B", "text": "$\\sqrt{30}$"}, {"key": "C", "text": "$4$"}, {"key": "D", "text": "$\\sqrt{14}$"}, {"key": "E", "text": "$\\sqrt{22}$"}]'::jsonb, 'E', NULL, NULL,
  '$\vec a-\vec b=\langle3;\,-2;\,3\rangle$, $|\vec a-\vec b|=\sqrt{9+4+9}=\sqrt{22}$.',
  2025, 'II', 246, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0021 | əsas: 2025 toplu, II hissə, səh.246 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Vektorun koordinatları, uzunluğu, cəmi, fərqi və ədədə vurulması'), 'original', 'own', 'az', 'draft', 'closed',
  '$\vec a\langle2;\,-1\rangle$, $\vec b\langle-3;\,4\rangle$ olarsa, $\vec c=3\vec a+\vec b$ vektorunun uzunluğunu tapın.',
  '[{"key": "A", "text": "$\\sqrt{10}$"}, {"key": "B", "text": "$10$"}, {"key": "C", "text": "$\\sqrt{58}$"}, {"key": "D", "text": "$\\sqrt{34}$"}, {"key": "E", "text": "$4$"}]'::jsonb, 'A', NULL, NULL,
  '$\vec c=\langle6-3;\,-3+4\rangle=\langle3;\,1\rangle$, $|\vec c|=\sqrt{10}$.',
  2025, 'II', 246, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0022 | əsas: 2025 toplu, II hissə, səh.247 №34
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Vektorun koordinatları, uzunluğu, cəmi, fərqi və ədədə vurulması'), 'original', 'own', 'az', 'draft', 'closed',
  '$m$-in hansı qiymətində $\vec a\langle3-m;\,4\rangle$ və $\vec b\langle5;\,m+1\rangle$ vektorlarının uzunluqları bərabər olar?',
  '[{"key": "A", "text": "$\\dfrac14$"}, {"key": "B", "text": "$-\\dfrac18$"}, {"key": "C", "text": "$-\\dfrac14$"}, {"key": "D", "text": "$\\dfrac18$"}, {"key": "E", "text": "$-\\dfrac12$"}]'::jsonb, 'B', NULL, NULL,
  '$(3-m)^2+16=25+(m+1)^2\Rightarrow 25-6m=26+2m\Rightarrow m=-\dfrac18$.',
  2025, 'II', 247, 34)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0023 | əsas: 2025 toplu, II hissə, səh.247 №35
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Vektorun koordinatları, uzunluğu, cəmi, fərqi və ədədə vurulması'), 'original', 'own', 'az', 'draft', 'closed',
  '$m$-in hansı qiymətində $\vec a\langle4+m;\,8\rangle$ və $\vec b\langle8;\,m-1\rangle$ vektorlarının uzunluqları bərabər olar?',
  '[{"key": "A", "text": "$-\\dfrac23$"}, {"key": "B", "text": "$-\\dfrac12$"}, {"key": "C", "text": "$\\dfrac23$"}, {"key": "D", "text": "$\\dfrac32$"}, {"key": "E", "text": "$-\\dfrac32$"}]'::jsonb, 'E', NULL, NULL,
  '$(4+m)^2+64=64+(m-1)^2\Rightarrow 8m+16=-2m+1\Rightarrow m=-1{,}5$.',
  2025, 'II', 247, 35)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0024 | əsas: 2025 toplu, II hissə, səh.247 №49
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0024', '/images/tasks/KVK-0024.png', 'Koordinat müstəvisində O-dan N(3;4) və M(−5;−2) nöqtələrinə yönəlmiş vektorlar', (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Vektorun koordinatları, uzunluğu, cəmi, fərqi və ədədə vurulması'), 'original', 'own', 'az', 'draft', 'closed',
  '$\vec m=\overrightarrow{ON}+\overrightarrow{OM}$ vektorunun komponentlərini tapın.',
  '[{"key": "A", "text": "$\\left\\langle 2;\\,-2\\right\\rangle$"}, {"key": "B", "text": "$\\left\\langle 8;\\,6\\right\\rangle$"}, {"key": "C", "text": "$\\left\\langle -2;\\,-2\\right\\rangle$"}, {"key": "D", "text": "$\\left\\langle -8;\\,2\\right\\rangle$"}, {"key": "E", "text": "$\\left\\langle -2;\\,2\\right\\rangle$"}]'::jsonb, 'E', NULL, NULL,
  'Şəkildən $N(3;\,4)$, $M(-5;\,-2)$. $\overrightarrow{ON}+\overrightarrow{OM}=\langle3-5;\,4-2\rangle=\langle-2;\,2\rangle$.',
  2025, 'II', 247, 49)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0025 | əsas: 2025 toplu, II hissə, səh.248 №50
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0025', '/images/tasks/KVK-0025.png', 'Koordinat müstəvisində O-dan M(−2;3) və N(5;−4) nöqtələrinə yönəlmiş vektorlar', (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Vektorun koordinatları, uzunluğu, cəmi, fərqi və ədədə vurulması'), 'original', 'own', 'az', 'draft', 'closed',
  '$\overrightarrow{ON}+\overrightarrow{OM}$ vektorunun komponentlərini tapın.',
  '[{"key": "A", "text": "$\\left\\langle 3;\\,-1\\right\\rangle$"}, {"key": "B", "text": "$\\left\\langle -7;\\,7\\right\\rangle$"}, {"key": "C", "text": "$\\left\\langle -3;\\,1\\right\\rangle$"}, {"key": "D", "text": "$\\left\\langle 7;\\,-7\\right\\rangle$"}, {"key": "E", "text": "$\\left\\langle 3;\\,1\\right\\rangle$"}]'::jsonb, 'A', NULL, NULL,
  'Şəkildən $M(-2;\,3)$, $N(5;\,-4)$. Cəm: $\langle5-2;\,-4+3\rangle=\langle3;\,-1\rangle$.',
  2025, 'II', 248, 50)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0026 | əsas: 2025 toplu, II hissə, səh.248 №52
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Vektorun koordinatları, uzunluğu, cəmi, fərqi və ədədə vurulması'), 'original', 'own', 'az', 'draft', 'closed',
  '$Ox$ oxu ilə $45^\circ$-li bucaq əmələ gətirən vektorun bu ox üzərindəki proyeksiyası $2\sqrt2$-yə bərabərdir. Vektorun uzunluğunu tapın.',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "$4$"}, {"key": "C", "text": "$4\\sqrt2$"}, {"key": "D", "text": "$2\\sqrt2$"}, {"key": "E", "text": "$\\sqrt2$"}]'::jsonb, 'B', NULL, NULL,
  '$\text{pr}=|\vec a|\cos45^\circ\Rightarrow|\vec a|=\dfrac{2\sqrt2}{\frac{\sqrt2}{2}}=4$.',
  2025, 'II', 248, 52)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0027 | əsas: 2025 toplu, II hissə, səh.248 №53
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0027', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Vektorun koordinatları, uzunluğu, cəmi, fərqi və ədədə vurulması'), 'original', 'own', 'az', 'draft', 'closed',
  '$Ox$ oxu ilə $30^\circ$-li bucaq əmələ gətirən vektorun bu ox üzərindəki proyeksiyası $4\sqrt3$-ə bərabərdir. Vektorun uzunluğunu tapın.',
  '[{"key": "A", "text": "$2\\sqrt3$"}, {"key": "B", "text": "$4$"}, {"key": "C", "text": "$8\\sqrt3$"}, {"key": "D", "text": "$8$"}, {"key": "E", "text": "$6$"}]'::jsonb, 'D', NULL, NULL,
  '$|\vec a|=\dfrac{4\sqrt3}{\cos30^\circ}=\dfrac{4\sqrt3}{\frac{\sqrt3}{2}}=8$.',
  2025, 'II', 248, 53)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0028 | əsas: 2025 toplu, II hissə, səh.251 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0028', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Vektorların skalyar hasili. İki vektor arasındakı bucaq. Vektorların perpendikulyarlığı. Kollinear vektorlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$m$-in hansı qiymətində $\vec a=\langle5;\,-2\rangle$ və $\vec b=\langle4;\,m\rangle$ vektorları perpendikulyardır?',
  '[{"key": "A", "text": "$10$"}, {"key": "B", "text": "$-1{,}6$"}, {"key": "C", "text": "$8$"}, {"key": "D", "text": "$2$"}, {"key": "E", "text": "$-10$"}]'::jsonb, 'A', NULL, NULL,
  '$\vec a\cdot\vec b=20-2m=0\Rightarrow m=10$.',
  2025, 'II', 251, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0029 | əsas: 2025 toplu, II hissə, səh.251 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0029', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Vektorların skalyar hasili. İki vektor arasındakı bucaq. Vektorların perpendikulyarlığı. Kollinear vektorlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$m$-in hansı qiymətində $\vec a=\langle-3;\,6\rangle$ və $\vec b=\langle8;\,m\rangle$ vektorları perpendikulyardır?',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "$-4$"}, {"key": "C", "text": "$16$"}, {"key": "D", "text": "$-16$"}, {"key": "E", "text": "$4$"}]'::jsonb, 'E', NULL, NULL,
  '$-24+6m=0\Rightarrow m=4$.',
  2025, 'II', 251, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0030 | əsas: 2025 toplu, II hissə, səh.251 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0030', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Vektorların skalyar hasili. İki vektor arasındakı bucaq. Vektorların perpendikulyarlığı. Kollinear vektorlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$\vec a\langle4;\,-2\rangle$, $\vec b\langle-6;\,3\rangle$, $\vec c\langle2;\,-4\rangle$, $\vec d\langle2;\,1\rangle$, $\vec m\langle6;\,-3\rangle$ vektorları verilmişdir. Bu vektorlardan eyni istiqamətliləri tapın.',
  '[{"key": "A", "text": "$\\vec c$ və $\\vec m$"}, {"key": "B", "text": "$\\vec a$ və $\\vec c$"}, {"key": "C", "text": "$\\vec a$ və $\\vec m$; $\\vec a$ və $\\vec b$"}, {"key": "D", "text": "$\\vec a$ və $\\vec m$"}, {"key": "E", "text": "$\\vec a$ və $\\vec b$"}]'::jsonb, 'D', NULL, NULL,
  '$\vec m=\dfrac32\vec a$ – eyni istiqamətli. $\vec b=-\dfrac32\vec a$ – $\vec a$ və $\vec m$-ə əks istiqamətlidir. $\vec c$ və $\vec d$ heç biri ilə kollinear deyil. Cavab: $\vec a$ və $\vec m$.',
  2025, 'II', 251, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0031 | əsas: 2025 toplu, II hissə, səh.251 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0031', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Vektorların skalyar hasili. İki vektor arasındakı bucaq. Vektorların perpendikulyarlığı. Kollinear vektorlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$\vec a\langle3;\,-1\rangle$, $\vec b\langle-6;\,2\rangle$, $\vec c\langle1;\,3\rangle$, $\vec d\langle3;\,1\rangle$, $\vec m\langle9;\,-3\rangle$ vektorları verilmişdir. Bu vektorlardan əks istiqamətliləri tapın.',
  '[{"key": "A", "text": "$\\vec a$ və $\\vec b$; $\\vec a$ və $\\vec m$"}, {"key": "B", "text": "$\\vec a$ və $\\vec b$; $\\vec b$ və $\\vec m$"}, {"key": "C", "text": "$\\vec c$ və $\\vec d$"}, {"key": "D", "text": "$\\vec a$ və $\\vec m$"}, {"key": "E", "text": "yalnız $\\vec a$ və $\\vec b$"}]'::jsonb, 'B', NULL, NULL,
  '$\vec b=-2\vec a$, $\vec m=3\vec a$, deməli $\vec b=-\dfrac23\vec m$. Əks istiqamətli cütlər: $\vec a,\vec b$ və $\vec b,\vec m$ ($\vec a,\vec m$ eyni istiqamətlidir). $\vec c$ və $\vec d$ kollinear deyil.',
  2025, 'II', 251, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0032 | əsas: 2025 toplu, II hissə, səh.252 №33
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0032', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Vektorların skalyar hasili. İki vektor arasındakı bucaq. Vektorların perpendikulyarlığı. Kollinear vektorlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$\vec a\langle3;\,-1\rangle$ ilə $\vec b$ kollinear vektorlar və $\vec a\cdot\vec b=-20$ olarsa, $\vec b$ vektorunun komponentlərini tapın.',
  '[{"key": "A", "text": "$\\left\\langle -2;\\,6\\right\\rangle$"}, {"key": "B", "text": "$\\left\\langle 6;\\,-2\\right\\rangle$"}, {"key": "C", "text": "$\\left\\langle -6;\\,2\\right\\rangle$"}, {"key": "D", "text": "$\\left\\langle 2;\\,-6\\right\\rangle$"}, {"key": "E", "text": "$\\left\\langle -3;\\,1\\right\\rangle$"}]'::jsonb, 'C', NULL, NULL,
  '$\vec b=k\vec a$, $\vec a\cdot\vec b=k|\vec a|^2=10k=-20\Rightarrow k=-2$. $\vec b=\langle-6;\,2\rangle$.',
  2025, 'II', 252, 33)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0033 | əsas: 2025 toplu, II hissə, səh.253 №53
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0033', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Vektorların skalyar hasili. İki vektor arasındakı bucaq. Vektorların perpendikulyarlığı. Kollinear vektorlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$\vec a=\langle1;\,-4\rangle$, $\vec b$ vektoru $\vec a$-nın əksi olarsa, $3\vec a+\vec b$ və $\vec b$ vektorlarının skalyar hasilini tapın.',
  '[{"key": "A", "text": "$17$"}, {"key": "B", "text": "$-17$"}, {"key": "C", "text": "$-34$"}, {"key": "D", "text": "$34$"}, {"key": "E", "text": "$-51$"}]'::jsonb, 'C', NULL, NULL,
  '$\vec b=-\vec a$: $(3\vec a-\vec a)\cdot(-\vec a)=-2|\vec a|^2=-2\cdot17=-34$.',
  2025, 'II', 253, 53)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0034 | əsas: 2025 toplu, II hissə, səh.253 №65
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0034', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Vektorların skalyar hasili. İki vektor arasındakı bucaq. Vektorların perpendikulyarlığı. Kollinear vektorlar'), 'original', 'own', 'az', 'draft', 'closed',
  'Diaqonallarının kəsişmə nöqtəsi koordinat başlanğıcında yerləşən $ABCD$ paraleloqramında $A(-2;\,-5)$ və $B(-4;\,1)$ olarsa, $\overrightarrow{AC}$ və $\overrightarrow{BD}$ vektorlarının skalyar hasilini tapın.',
  '[{"key": "A", "text": "$-12$"}, {"key": "B", "text": "$52$"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$12$"}, {"key": "E", "text": "$-48$"}]'::jsonb, 'D', NULL, NULL,
  '$O$ – diaqonalların ortası: $C(2;\,5)$, $D(4;\,-1)$. $\overrightarrow{AC}=\langle4;\,10\rangle$, $\overrightarrow{BD}=\langle8;\,-2\rangle$. $32-20=12$.',
  2025, 'II', 253, 65)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0035 | əsas: 2025 toplu, II hissə, səh.253 №66
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0035', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Koordinat və vektorlar' AND s.title='Vektorların skalyar hasili. İki vektor arasındakı bucaq. Vektorların perpendikulyarlığı. Kollinear vektorlar'), 'original', 'own', 'az', 'draft', 'closed',
  'Diaqonallarının kəsişmə nöqtəsi koordinat başlanğıcında yerləşən $ABCD$ paraleloqramında $C(5;\,2)$ və $B(-1;\,3)$ olarsa, $\overrightarrow{AC}$ və $\overrightarrow{BD}$ vektorlarının skalyar hasilini tapın.',
  '[{"key": "A", "text": "$-1$"}, {"key": "B", "text": "$44$"}, {"key": "C", "text": "$-4$"}, {"key": "D", "text": "$-44$"}, {"key": "E", "text": "$4$"}]'::jsonb, 'C', NULL, NULL,
  '$A(-5;\,-2)$, $D(1;\,-3)$. $\overrightarrow{AC}=\langle10;\,4\rangle$, $\overrightarrow{BD}=\langle2;\,-6\rangle$. $20-24=-4$.',
  2025, 'II', 253, 66)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0036 | əsas: 2025 toplu, II hissə, səh.7 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0036', '/images/tasks/KVK-0036.png', 'Budaqları aşağı yönəlmiş, təpəsi IV rübdə olan və absis oxunu kəsməyən parabola', (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), NULL, 'original', 'own', 'az', 'draft', 'closed',
  '$y=ax^2+bx+c$ funksiyasının qrafikinə əsasən münasibətlərdən hansı doğru **_deyil_**?',
  '[{"key": "A", "text": "$b^2-4ac<0$"}, {"key": "B", "text": "$b>0$"}, {"key": "C", "text": "$\\dfrac ca>0$"}, {"key": "D", "text": "$c<0$"}, {"key": "E", "text": "$a>0$"}]'::jsonb, 'E', NULL, NULL,
  'Budaqlar aşağı yönəlib: $a<0$. Təpənin absisi müsbətdir: $-\dfrac{b}{2a}>0\Rightarrow b>0$. Qrafik $Oy$ oxunu mənfi hissədə kəsir: $c<0$. Absis oxu ilə kəsişmə yoxdur: $D<0$. $a$ və $c$ eyni işarəlidir: $\dfrac ca>0$. Doğru olmayan: $a>0$.',
  2025, 'II', 7, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0037 | əsas: 2025 toplu, II hissə, səh.7 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0037', '/images/tasks/KVK-0037.png', 'Budaqları yuxarı yönəlmiş, təpəsi III rübdə olan və absis oxunu iki nöqtədə kəsən parabola', (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), NULL, 'original', 'own', 'az', 'draft', 'closed',
  '$y=ax^2+bx+c$ funksiyasının qrafikinə əsasən münasibətlərdən hansı doğru **_deyil_**?',
  '[{"key": "A", "text": "$c<0$"}, {"key": "B", "text": "$b^2-4ac>0$"}, {"key": "C", "text": "$b<0$"}, {"key": "D", "text": "$\\dfrac ca<0$"}, {"key": "E", "text": "$a>0$"}]'::jsonb, 'C', NULL, NULL,
  'Budaqlar yuxarı: $a>0$. Təpənin absisi mənfidir: $-\dfrac b{2a}<0\Rightarrow b>0$. $Oy$ oxunu mənfi hissədə kəsir: $c<0$, deməli $\dfrac ca<0$. İki kəsişmə nöqtəsi: $D>0$. Doğru olmayan: $b<0$.',
  2025, 'II', 7, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- KVK-0038 | əsas: 2025 toplu, II hissə, səh.225 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('KVK-0038', NULL, NULL, (SELECT id FROM topics WHERE name='Koordinat və vektorlar'), NULL, 'original', 'own', 'az', 'draft', 'closed',
  '$k=3$ əmsallı homotetiyada $ABC$ üçbucağı $A_1B_1C_1$ üçbucağına keçir. Bu üçbucaqların uyğun $BK$ və $B_1K_1$ medianları üçün $BK+B_1K_1=32$ sm olarsa, $B_1K_1$-i tapın.',
  '[{"key": "A", "text": "$12$ sm"}, {"key": "B", "text": "$24$ sm"}, {"key": "C", "text": "$96$ sm"}, {"key": "D", "text": "$8$ sm"}, {"key": "E", "text": "$16$ sm"}]'::jsonb, 'B', NULL, NULL,
  '$B_1K_1=3\cdot BK$. $BK+3BK=32\Rightarrow BK=8$, $B_1K_1=24$ sm.',
  2025, 'II', 225, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
