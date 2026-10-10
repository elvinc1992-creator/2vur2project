-- Mövzu: Stereometriya — 132 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- STR-0001 | əsas: 2025 toplu, II hissə, səh.256 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Mail, perpendikulyar və proyeksiya'), 'original', 'own', 'az', 'draft', 'closed',
  'Müstəvidən $9$ sm məsafədə yerləşən nöqtədən bu müstəviyə uzunluğu $18$ sm olan mail çəkilmişdir. Mailin müstəvi ilə əmələ gətirdiyi bucağı tapın.',
  '[{"key": "A", "text": "$15^\\circ$"}, {"key": "B", "text": "$60^\\circ$"}, {"key": "C", "text": "$30^\\circ$"}, {"key": "D", "text": "$90^\\circ$"}, {"key": "E", "text": "$45^\\circ$"}]'::jsonb, 'C', NULL, NULL,
  '$\sin\varphi=\dfrac{9}{18}=\dfrac12\Rightarrow\varphi=30^\circ$.',
  2025, 'II', 256, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0002 | əsas: 2025 toplu, II hissə, səh.256 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Mail, perpendikulyar və proyeksiya'), 'original', 'own', 'az', 'draft', 'closed',
  'Nöqtədən müstəviyə uzunluğu $16$ sm olan mail çəkilmişdir. Mailin proyeksiyasının $8$ sm olduğunu bilərək, onun müstəvi ilə əmələ gətirdiyi bucağı tapın.',
  '[{"key": "A", "text": "$30^\\circ$"}, {"key": "B", "text": "$90^\\circ$"}, {"key": "C", "text": "$60^\\circ$"}, {"key": "D", "text": "$50^\\circ$"}, {"key": "E", "text": "$45^\\circ$"}]'::jsonb, 'C', NULL, NULL,
  '$\cos\varphi=\dfrac{8}{16}=\dfrac12\Rightarrow\varphi=60^\circ$.',
  2025, 'II', 256, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0003 | əsas: 2025 toplu, II hissə, səh.256 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Mail, perpendikulyar və proyeksiya'), 'original', 'own', 'az', 'draft', 'closed',
  'Müstəvidən $12$ dm məsafədə olan nöqtədən bu müstəviyə endirilmiş mailin uzunluğu $15$ dm-dir. Mailin müstəvi üzərindəki proyeksiyasını tapın.',
  '[{"key": "A", "text": "$6$ dm"}, {"key": "B", "text": "$9$ dm"}, {"key": "C", "text": "$\\dfrac{48}{5}$ dm"}, {"key": "D", "text": "$\\dfrac{36}{5}$ dm"}, {"key": "E", "text": "$3$ dm"}]'::jsonb, 'B', NULL, NULL,
  '$\sqrt{15^2-12^2}=\sqrt{81}=9$ dm.',
  2025, 'II', 256, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0004 | əsas: 2025 toplu, II hissə, səh.256 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Mail, perpendikulyar və proyeksiya'), 'original', 'own', 'az', 'draft', 'closed',
  'Uzunluğu $10$ sm olan mail müstəvi ilə $45^\circ$-li bucaq əmələ gətirir. Bu mailin müstəvi üzərindəki proyeksiyasını tapın.',
  '[{"key": "A", "text": "$5 \\sqrt{3}$ sm"}, {"key": "B", "text": "$5 \\sqrt{2}$ sm"}, {"key": "C", "text": "$10 \\sqrt{2}$ sm"}, {"key": "D", "text": "$5$ sm"}, {"key": "E", "text": "$10$ sm"}]'::jsonb, 'B', NULL, NULL,
  '$10\cos45^\circ=10\cdot\dfrac{\sqrt2}{2}=5\sqrt2$ sm.',
  2025, 'II', 256, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0005 | əsas: 2025 toplu, II hissə, səh.256 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Mail, perpendikulyar və proyeksiya'), 'original', 'own', 'az', 'draft', 'closed',
  'Müstəvidən $12$ sm məsafədə olan nöqtədən bu müstəviyə mail çəkilmişdir. Mailin proyeksiyasının uzunluğu $16$ sm-dir. Mailin uzunluğunu tapın.',
  '[{"key": "A", "text": "$18$ sm"}, {"key": "B", "text": "$24$ sm"}, {"key": "C", "text": "$28$ sm"}, {"key": "D", "text": "$4 \\sqrt{7}$ sm"}, {"key": "E", "text": "$20$ sm"}]'::jsonb, 'E', NULL, NULL,
  '$\sqrt{144+256}=20$ sm.',
  2025, 'II', 256, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0006 | əsas: 2025 toplu, II hissə, səh.256 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Mail, perpendikulyar və proyeksiya'), 'original', 'own', 'az', 'draft', 'closed',
  'Müstəvidən $8$ sm məsafədə olan nöqtədən bu müstəviyə uzunluğu $17$ sm olan mail çəkilmişdir. Mailin proyeksiyasının uzunluğunu tapın.',
  '[{"key": "A", "text": "$\\sqrt{353}$ sm"}, {"key": "B", "text": "$25$ sm"}, {"key": "C", "text": "$12$ sm"}, {"key": "D", "text": "$15$ sm"}, {"key": "E", "text": "$9$ sm"}]'::jsonb, 'D', NULL, NULL,
  '$\sqrt{289-64}=15$ sm.',
  2025, 'II', 256, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0007 | əsas: 2025 toplu, II hissə, səh.256 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0007', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Mail, perpendikulyar və proyeksiya'), 'original', 'own', 'az', 'draft', 'closed',
  'Müstəvi xaricindəki nöqtədən bu müstəviyə onunla $60^\circ$-li bucaq əmələ gətirən mail çəkilmişdir. Mailin proyeksiyası $7$ sm olarsa, bu mailin uzunluğunu tapın.',
  '[{"key": "A", "text": "$7 \\sqrt{3}$ sm"}, {"key": "B", "text": "$\\dfrac{14 \\sqrt{3}}{3}$ sm"}, {"key": "C", "text": "$\\dfrac{7}{2}$ sm"}, {"key": "D", "text": "$14$ sm"}, {"key": "E", "text": "$7 \\sqrt{2}$ sm"}]'::jsonb, 'D', NULL, NULL,
  'Proyeksiya $=l\cos60^\circ\Rightarrow l=\dfrac{7}{\frac12}=14$ sm.',
  2025, 'II', 256, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0008 | əsas: 2025 toplu, II hissə, səh.257 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Mail, perpendikulyar və proyeksiya'), 'original', 'own', 'az', 'draft', 'closed',
  'Müstəvidən $9$ sm məsafədə olan nöqtədən müstəviyə mail çəkilmişdir. Mailin müstəvi üzərindəki proyeksiyası $9\sqrt3$ sm-dir. Mailin müstəvi ilə əmələ gətirdiyi bucağı tapın.',
  '[{"key": "A", "text": "$30^\\circ$"}, {"key": "B", "text": "$90^\\circ$"}, {"key": "C", "text": "$60^\\circ$"}, {"key": "D", "text": "$75^\\circ$"}, {"key": "E", "text": "$45^\\circ$"}]'::jsonb, 'A', NULL, NULL,
  '$\operatorname{tg}\varphi=\dfrac{9}{9\sqrt3}=\dfrac{1}{\sqrt3}\Rightarrow\varphi=30^\circ$.',
  2025, 'II', 257, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0009 | əsas: 2025 toplu, II hissə, səh.257 №31
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Mail, perpendikulyar və proyeksiya'), 'original', 'own', 'az', 'draft', 'closed',
  'Sahəsi $36\pi$ sm$^2$ olan dairənin mərkəzindən qaldırılmış perpendikulyarın ucundan çevrənin nöqtələrinə qədər olan məsafə $10$ sm-dir. Perpendikulyarın uzunluğunu tapın.',
  '[{"key": "A", "text": "$7$ sm"}, {"key": "B", "text": "$2\\sqrt{17}$ sm"}, {"key": "C", "text": "$4$ sm"}, {"key": "D", "text": "$8$ sm"}, {"key": "E", "text": "$6$ sm"}]'::jsonb, 'D', NULL, NULL,
  '$R^2=36\Rightarrow R=6$. $h=\sqrt{10^2-6^2}=8$ sm.',
  2025, 'II', 257, 31)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0010 | əsas: 2025 toplu, II hissə, səh.258 №32
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Mail, perpendikulyar və proyeksiya'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ düzbucaqlısının müstəvisinə diaqonallarının kəsişmə nöqtəsindən perpendikulyar qaldırılmışdır. Perpendikulyarın ucundan düzbucaqlının təpələrinə qədər olan məsafələr $17$ sm-dir. Düzbucaqlının tərəfləri $18$ sm və $24$ sm olarsa, perpendikulyarın uzunluğunu tapın.',
  '[{"key": "A", "text": "$6$ sm"}, {"key": "B", "text": "$12$ sm"}, {"key": "C", "text": "$10$ sm"}, {"key": "D", "text": "$8$ sm"}, {"key": "E", "text": "$15$ sm"}]'::jsonb, 'D', NULL, NULL,
  'Diaqonal $\sqrt{18^2+24^2}=30$, yarısı $15$. $h=\sqrt{17^2-15^2}=8$ sm.',
  2025, 'II', 258, 32)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0011 | əsas: 2025 toplu, II hissə, səh.258 №33
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0011', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Mail, perpendikulyar və proyeksiya'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ düzbucaqlısının müstəvisinə diaqonallarının kəsişmə nöqtəsindən perpendikulyar qaldırılmışdır. Perpendikulyarın ucundan düzbucaqlının təpələrinə qədər olan məsafələr $29$ sm-dir. Düzbucaqlının tərəfləri $24$ sm və $32$ sm olarsa, perpendikulyarın uzunluğunu tapın.',
  '[{"key": "A", "text": "$20$ sm"}, {"key": "B", "text": "$9$ sm"}, {"key": "C", "text": "$21$ sm"}, {"key": "D", "text": "$24$ sm"}, {"key": "E", "text": "$25$ sm"}]'::jsonb, 'C', NULL, NULL,
  'Diaqonal $40$, yarısı $20$. $h=\sqrt{29^2-20^2}=\sqrt{441}=21$ sm.',
  2025, 'II', 258, 33)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0012 | əsas: 2025 toplu, II hissə, səh.258 №42
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0012', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Mail, perpendikulyar və proyeksiya'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ düzbucaqlısının müstəvisinə $A$ təpəsindən $AM$ perpendikulyarı qaldırılmışdır. $M$ nöqtəsindən düzbucaqlının digər təpələrinə qədər olan məsafələr $7$ sm, $9$ sm və $11$ sm-dir. $AM$-in uzunluğunu tapın.',
  '[{"key": "A", "text": "$3$ sm"}, {"key": "B", "text": "$3 \\sqrt{2}$ sm"}, {"key": "C", "text": "$9$ sm"}, {"key": "D", "text": "$2$ sm"}, {"key": "E", "text": "$4$ sm"}]'::jsonb, 'A', NULL, NULL,
  '$MB^2=AM^2+AB^2$, $MD^2=AM^2+AD^2$, $MC^2=AM^2+AB^2+AD^2$. Buradan $AM^2=MB^2+MD^2-MC^2=49+81-121=9$, $AM=3$ sm.',
  2025, 'II', 258, 42)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0013 | əsas: 2025 toplu, II hissə, səh.258 №43
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Mail, perpendikulyar və proyeksiya'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABCD$ kvadratının $A$ təpəsindən kvadratın müstəvisinə $AM$ perpendikulyarı qaldırılmışdır. $M$ nöqtəsindən kvadratın digər təpələrinə olan məsafələr $9$ sm və $11$ sm olarsa, $AM$-in uzunluğunu tapın.',
  '[{"key": "A", "text": "$\\sqrt{41}$ sm"}, {"key": "B", "text": "$\\sqrt{31}$ sm"}, {"key": "C", "text": "$5$ sm"}, {"key": "D", "text": "$7$ sm"}, {"key": "E", "text": "$2 \\sqrt{10}$ sm"}]'::jsonb, 'A', NULL, NULL,
  '$MB=MD=9$, $MC=11$. $MC^2-MB^2=a^2=40$. $AM^2=81-40=41$, $AM=\sqrt{41}$ sm.',
  2025, 'II', 258, 43)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0014 | əsas: 2025 toplu, II hissə, səh.259 №45
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Mail, perpendikulyar və proyeksiya'), 'original', 'own', 'az', 'draft', 'closed',
  'Rombun diaqonalları $12$ sm və $16$ sm-dir. Rombun müstəvisinə aid olmayan $M$ nöqtəsindən bu müstəviyə qədər məsafə $3{,}6$ sm-dir. $M$ nöqtəsi rombun tərəflərindən bərabər məsafədə olarsa, bu məsafəni tapın.',
  '[{"key": "A", "text": "$4{,}8$ sm"}, {"key": "B", "text": "$6$ sm"}, {"key": "C", "text": "$8$ sm"}, {"key": "D", "text": "$\\sqrt{41}$ sm"}, {"key": "E", "text": "$2\\sqrt{10}$ sm"}]'::jsonb, 'B', NULL, NULL,
  'Romb tərəfi $\sqrt{36+64}=10$, sahəsi $\dfrac{12\cdot16}{2}=96$. Daxilə çəkilmiş çevrənin radiusu $r=\dfrac{S}{2a}=\dfrac{96}{20}=4{,}8$. Məsafə $\sqrt{3{,}6^2+4{,}8^2}=6$ sm.',
  2025, 'II', 259, 45)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0015 | əsas: 2025 toplu, II hissə, səh.259 №46
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0015', '/images/tasks/STR-0015.png', 'Düzbucaqlı ABC üçbucağı, CO medianı, E – medianların kəsişmə nöqtəsi, O nöqtəsindən müstəviyə perpendikulyar DO', (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Mail, perpendikulyar və proyeksiya'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ üçbucağında $\angle ACB=90^\circ$, $E$ – medianların kəsişmə nöqtəsi, $CO$ – median, $DO$ isə $(ABC)$ müstəvisinə qaldırılmış perpendikulyardır. $DO=2\sqrt{10}$ sm, $AB=18$ sm olarsa, $DE$-ni tapın.',
  '[{"key": "A", "text": "$7$ sm"}, {"key": "B", "text": "$11$ sm"}, {"key": "C", "text": "$2 \\sqrt{19}$ sm"}, {"key": "D", "text": "$3 \\sqrt{5}$ sm"}, {"key": "E", "text": "$\\sqrt{58}$ sm"}]'::jsonb, 'A', NULL, NULL,
  'Düzbucaqlı üçbucaqda $CO=\dfrac{AB}{2}=9$, $OE=\dfrac13CO=3$. $DE=\sqrt{40+9}=7$ sm.',
  2025, 'II', 259, 46)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0016 | əsas: 2025 toplu, II hissə, səh.259 №47
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0016', '/images/tasks/STR-0016.png', 'Düzbucaqlı ABC üçbucağı, CO medianı, E – medianların kəsişmə nöqtəsi, O nöqtəsindən müstəviyə perpendikulyar DO', (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Mail, perpendikulyar və proyeksiya'), 'original', 'own', 'az', 'draft', 'closed',
  '$ABC$ üçbucağında $\angle ACB=90^\circ$, $E$ – medianların kəsişmə nöqtəsi, $CO$ – median, $DO$ isə $(ABC)$ müstəvisinə qaldırılmış perpendikulyardır. $DE=9$ sm, $AB=24$ sm olarsa, $DO$-nu tapın.',
  '[{"key": "A", "text": "$4 \\sqrt{5}$ sm"}, {"key": "B", "text": "$\\sqrt{17}$ sm"}, {"key": "C", "text": "$5$ sm"}, {"key": "D", "text": "$3 \\sqrt{5}$ sm"}, {"key": "E", "text": "$\\sqrt{65}$ sm"}]'::jsonb, 'E', NULL, NULL,
  '$CO=12$, $OE=4$. $DO=\sqrt{81-16}=\sqrt{65}$ sm.',
  2025, 'II', 259, 47)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0017 | əsas: 2025 toplu, II hissə, səh.259 №48
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Mail, perpendikulyar və proyeksiya'), 'original', 'own', 'az', 'draft', 'closed',
  'Müstəvidən $5\sqrt2$ sm məsafədə yerləşən nöqtədən bu müstəvi ilə $45^\circ$-li bucaq əmələ gətirən iki mail çəkilmişdir. Maillər arasındakı bucaq $60^\circ$ olarsa, onların oturacaqları arasındakı məsafəni tapın.',
  '[{"key": "A", "text": "$5 \\sqrt{2}$ sm"}, {"key": "B", "text": "$10 \\sqrt{2}$ sm"}, {"key": "C", "text": "$5 \\sqrt{3}$ sm"}, {"key": "D", "text": "$5$ sm"}, {"key": "E", "text": "$10$ sm"}]'::jsonb, 'E', NULL, NULL,
  'Hər mailin uzunluğu $\dfrac{5\sqrt2}{\sin45^\circ}=10$. İki bərabər mail və $60^\circ$ bucaq bərabərtərəfli üçbucaq əmələ gətirir: məsafə $10$ sm.',
  2025, 'II', 259, 48)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0018 | əsas: 2025 toplu, II hissə, səh.259 №49
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Mail, perpendikulyar və proyeksiya'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzbucaqlı üçbucağın katetləri $15$ sm-ə və $20$ sm-ə bərabərdir. Düz bucaq təpəsindən üçbucaq müstəvisinə qaldırılmış perpendikulyarın uzunluğu $9$ sm-ə bərabərdir. Perpendikulyarın üçbucaq müstəvisi üzərində olmayan ucundan hipotenuza qədər olan məsafəni tapın.',
  '[{"key": "A", "text": "$17$ sm"}, {"key": "B", "text": "$3 \\sqrt{34}$ sm"}, {"key": "C", "text": "$25$ sm"}, {"key": "D", "text": "$15$ sm"}, {"key": "E", "text": "$12$ sm"}]'::jsonb, 'D', NULL, NULL,
  'Hipotenuz $25$, ona çəkilmiş hündürlük $\dfrac{15\cdot20}{25}=12$. Üç perpendikulyar teoreminə görə məsafə $\sqrt{9^2+12^2}=15$ sm.',
  2025, 'II', 259, 49)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0019 | əsas: 2025 toplu, II hissə, səh.259 №57
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0019', '/images/tasks/STR-0019.png', 'α müstəvisi, ondan kənarda A nöqtəsi; AC perpendikulyar, AB və AD mailləri, B və D müstəvi üzərində', (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Mail, perpendikulyar və proyeksiya'), 'original', 'own', 'az', 'draft', 'written',
  '$\alpha$ müstəvisi üzərində olmayan $A$ nöqtəsindən bu müstəviyə $AB$ maili və $AC$ perpendikulyarı çəkilmişdir. $DB\perp BC$, $\angle BAD:\angle ADB=4:5$ olarsa, $\angle ADB$-ni tapın $(D\in\alpha)$.',
  NULL, NULL, NULL, '50',
  '$DB\perp BC$ və $BC$ – $AB$ mailinin proyeksiyasıdır, üç perpendikulyar teoreminə görə $DB\perp AB$, yəni $\angle ABD=90^\circ$. $4x+5x=90^\circ\Rightarrow x=10^\circ$, $\angle ADB=50^\circ$.',
  2025, 'II', 259, 57)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0020 | əsas: 2025 toplu, II hissə, səh.260 №67
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Mail, perpendikulyar və proyeksiya'), 'original', 'own', 'az', 'draft', 'written',
  'Tərəfi $9\sqrt3$ olan bərabərtərəfli $ABC$ üçbucağının $A$ təpəsindən onun müstəvisinə uzunluğu $2\sqrt{10}$ olan $AK$ perpendikulyarı qaldırılmışdır. $K$ nöqtəsindən üçbucağın medianlarının kəsişmə nöqtəsinə qədər olan məsafəni tapın.',
  NULL, NULL, NULL, '11',
  '$A$-dan medianların kəsişmə nöqtəsinə qədər məsafə $\dfrac{a}{\sqrt3}=9$. $\sqrt{40+81}=11$.',
  2025, 'II', 260, 67)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0021 | əsas: 2025 toplu, II hissə, səh.260 №68
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Mail, perpendikulyar və proyeksiya'), 'original', 'own', 'az', 'draft', 'written',
  'Tərəfi $12\sqrt3$ olan bərabərtərəfli $MNP$ üçbucağının $M$ təpəsindən onun müstəvisinə uzunluğu $5$ olan $ME$ perpendikulyarı qaldırılmışdır. $E$ nöqtəsindən üçbucağın medianlarının kəsişmə nöqtəsinə qədər olan məsafəni tapın.',
  NULL, NULL, NULL, '13',
  '$\dfrac{12\sqrt3}{\sqrt3}=12$. $\sqrt{25+144}=13$.',
  2025, 'II', 260, 68)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0022 | əsas: 2025 toplu, II hissə, səh.263 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Düz xətt və müstəvinin qarşılıqlı vəziyyəti. Çarpaz düz xətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Müstəvini kəsməyən parçanın ucları müstəvidən $9$ sm və $15$ sm məsafədədir. Parçanın ortasından müstəviyə qədər olan məsafəni tapın.',
  '[{"key": "A", "text": "$24$ sm"}, {"key": "B", "text": "$12$ sm"}, {"key": "C", "text": "$10$ sm"}, {"key": "D", "text": "$6$ sm"}, {"key": "E", "text": "$\\dfrac{27}{2}$ sm"}]'::jsonb, 'B', NULL, NULL,
  'Trapesiyanın orta xətti: $\dfrac{9+15}{2}=12$ sm.',
  2025, 'II', 263, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0023 | əsas: 2025 toplu, II hissə, səh.263 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Düz xətt və müstəvinin qarşılıqlı vəziyyəti. Çarpaz düz xətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Hansı təklif doğrudur?',
  '[{"key": "A", "text": "Kəsişməyən iki müstəvidən birini kəsən düz xətt digər müstəvini kəsməyə də bilər"}, {"key": "B", "text": "Kəsişən iki düz xətdən sonsuz sayda müstəvi keçirmək olar"}, {"key": "C", "text": "Düz xətt və onun üzərində olmayan nöqtədən yalnız bir müstəvi keçir"}, {"key": "D", "text": "Bir düz xətt üzərində olan üç nöqtədən yalnız bir müstəvi keçirmək olar"}, {"key": "E", "text": "Düz xətt onun iki nöqtəsi müstəviyə aiddirsə, bu müstəvini kəsir"}]'::jsonb, 'C', NULL, NULL,
  'Aksiom nəticəsi: düz xətt və onun üzərində olmayan nöqtədən yeganə müstəvi keçir. Bir düz xəttin üç nöqtəsindən sonsuz sayda müstəvi keçir; paralel müstəvilərdən birini kəsən düz xətt digərini də kəsir; iki nöqtəsi müstəvidə olan düz xətt müstəvidə yerləşir; kəsişən iki düz xətdən yalnız bir müstəvi keçir.',
  2025, 'II', 263, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0024 | əsas: 2025 toplu, II hissə, səh.263 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Düz xətt və müstəvinin qarşılıqlı vəziyyəti. Çarpaz düz xətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Hansı təklif doğrudur?',
  '[{"key": "A", "text": "Bir düz xətt üzərində olan iki nöqtədən yalnız bir müstəvi keçirmək olar"}, {"key": "B", "text": "İki kəsişən düz xətdən sonsuz sayda müstəvi keçir"}, {"key": "C", "text": "İki çarpaz düz xəttin hər birindən digərinə perpendikulyar olan müstəvi həmişə keçirmək olar"}, {"key": "D", "text": "İki paralel müstəvi üçüncü müstəvi ilə kəsişirsə, onda kəsişmə xətləri paraleldir"}, {"key": "E", "text": "Kəsişməyən iki müstəvidən birini kəsən düz xətt digər müstəvini kəsməyə bilər"}]'::jsonb, 'D', NULL, NULL,
  'İki paralel müstəvinin üçüncü müstəvi ilə kəsişmə xətləri paraleldir. Digər təkliflər yanlışdır: iki nöqtədən sonsuz sayda müstəvi keçir; çarpaz düz xətlərdən birindən digərinə perpendikulyar müstəvi yalnız onlar perpendikulyar olduqda keçir; paralel müstəvilərdən birini kəsən düz xətt digərini də kəsir; kəsişən düz xətlərdən yeganə müstəvi keçir.',
  2025, 'II', 263, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0025 | əsas: 2025 toplu, II hissə, səh.264 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0025', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Düz xətt və müstəvinin qarşılıqlı vəziyyəti. Çarpaz düz xətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Hansı təklif doğrudur?',
  '[{"key": "A", "text": "Bir düz xətt üzərində olmayan üç nöqtədən sonsuz sayda müstəvi keçir"}, {"key": "B", "text": "Müstəvi üzərində olmayan düz xətt bu müstəvi üzərindəki hər hansı düz xəttə paraleldirsə, həmin müstəviyə də paraleldir"}, {"key": "C", "text": "Düz xətt və onun üzərində olmayan nöqtədən sonsuz sayda müstəvi keçirmək olar"}, {"key": "D", "text": "Üç nöqtədən həmişə yalnız bir müstəvi keçir"}, {"key": "E", "text": "Kəsişməyən iki müstəvidən birini kəsən düz xətt digər müstəviyə paraleldir"}]'::jsonb, 'B', NULL, NULL,
  'Düz xəttin müstəviyə paralellik əlaməti: düz xətt müstəvidəki hər hansı düz xəttə paraleldirsə (və müstəvidə deyilsə), müstəviyə paraleldir. Qalanları yanlışdır (üç nöqtə bir düz xətt üzərində ola bilər; paralel müstəvilərdən birini kəsən düz xətt digərini də kəsir).',
  2025, 'II', 264, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0026 | əsas: 2025 toplu, II hissə, səh.264 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Düz xətt və müstəvinin qarşılıqlı vəziyyəti. Çarpaz düz xətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Hansı təklif doğrudur?',
  '[{"key": "A", "text": "Bir düz xətt üzərində olan üç nöqtədən yalnız bir müstəvi keçirmək olar"}, {"key": "B", "text": "İki paralel müstəvi üçüncü müstəvi ilə kəsişirsə, kəsişmə xətləri kəsişirlər"}, {"key": "C", "text": "Bir düz xətt üzərindən yalnız bir müstəvi keçirmək olar"}, {"key": "D", "text": "İki çarpaz düz xəttin hər birindən digərinə paralel olan müstəvi keçirmək mümkün deyil"}, {"key": "E", "text": "Kəsişməyən iki müstəvidən birini kəsən düz xətt digər müstəvini də kəsir"}]'::jsonb, 'E', NULL, NULL,
  'Paralel müstəvilərdən birini kəsən düz xətt digərini də kəsir. Bir düz xətdən sonsuz sayda müstəvi keçir; kəsişmə xətləri paraleldir; çarpaz düz xətlərin hər birindən digərinə paralel müstəvi keçirmək mümkündür.',
  2025, 'II', 264, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0027 | əsas: 2025 toplu, II hissə, səh.264 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0027', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Düz xətt və müstəvinin qarşılıqlı vəziyyəti. Çarpaz düz xətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Hansı təklif doğru **_deyil_**?',
  '[{"key": "A", "text": "Verilmiş düz xətt xaricindəki nöqtədən bu düz xəttə paralel olan bir və yalnız bir düz xətt keçirmək olar"}, {"key": "B", "text": "İki düz xətt üçüncü düz xəttə paraleldirsə, onda onlar paraleldir"}, {"key": "C", "text": "Müstəvi xaricindəki nöqtədən bu müstəviyə paralel sonsuz sayda müstəvi keçirmək olar"}, {"key": "D", "text": "Bir müstəvinin kəsişən iki düz xətti, uyğun olaraq, digər müstəvinin kəsişən iki düz xəttinə paraleldirsə, onda bu müstəvilər paraleldir"}, {"key": "E", "text": "Düz xətt və onun üzərində olmayan nöqtədən bir və yalnız bir müstəvi keçirmək olar"}]'::jsonb, 'C', NULL, NULL,
  'Müstəvi xaricindəki nöqtədən ona paralel yalnız bir müstəvi keçir. Qalan təkliflər doğrudur.',
  2025, 'II', 264, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0028 | əsas: 2025 toplu, II hissə, səh.264 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0028', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Düz xətt və müstəvinin qarşılıqlı vəziyyəti. Çarpaz düz xətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Hansı təklif doğru **_deyil_**?',
  '[{"key": "A", "text": "Fəzada verilmiş müstəvi fəzanı iki yarımfəzaya ayırır"}, {"key": "B", "text": "Müstəvi üzərindəki düz xətt mailin proyeksiyasına perpendikulyardırsa, onda həmin düz xətt mailin özünə də perpendikulyardır"}, {"key": "C", "text": "Müstəvi ona aid olan düz xətt ilə müstəvini iki yarımmüstəviyə ayırır"}, {"key": "D", "text": "İki nöqtədən bir və yalnız bir düz xətt keçirmək olar"}, {"key": "E", "text": "Fəzanın iki nöqtəsindən bir və yalnız bir müstəvi keçirmək olar"}]'::jsonb, 'E', NULL, NULL,
  'İki nöqtədən sonsuz sayda müstəvi keçir (onları birləşdirən düz xəttdən keçən istənilən müstəvi). Qalan təkliflər doğrudur.',
  2025, 'II', 264, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0029 | əsas: 2025 toplu, II hissə, səh.264 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0029', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Düz xətt və müstəvinin qarşılıqlı vəziyyəti. Çarpaz düz xətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Müstəvini kəsməyən parçanın ortası və bir ucu müstəvidən uyğun olaraq $p$ və $q$ məsafədədir $(q>p)$. Parçanın digər ucunun müstəvidən olan məsafəsini tapın.',
  '[{"key": "A", "text": "$2p-q$"}, {"key": "B", "text": "$q-\\dfrac p2$"}, {"key": "C", "text": "$q+\\dfrac p2$"}, {"key": "D", "text": "$\\dfrac{q-p}{2}$"}, {"key": "E", "text": "$2q-p$"}]'::jsonb, 'A', NULL, NULL,
  'Ortanın məsafəsi uc nöqtələrin məsafələrinin ədədi ortasıdır: $p=\dfrac{q+x}{2}\Rightarrow x=2p-q$.',
  2025, 'II', 264, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0030 | əsas: 2025 toplu, II hissə, səh.264 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0030', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Düz xətt və müstəvinin qarşılıqlı vəziyyəti. Çarpaz düz xətlər'), 'original', 'own', 'az', 'draft', 'closed',
  'Parçanın bir ucu və ortası müstəvidən uyğun olaraq $p$ və $q$ məsafədədir $(q>p)$. Parça müstəvini kəsmirsə, onun digər ucunun müstəvidən olan məsafəsini tapın.',
  '[{"key": "A", "text": "$2p-q$"}, {"key": "B", "text": "$q-p$"}, {"key": "C", "text": "$\\dfrac{q+p}{2}$"}, {"key": "D", "text": "$p-\\dfrac q2$"}, {"key": "E", "text": "$2q-p$"}]'::jsonb, 'E', NULL, NULL,
  '$q=\dfrac{p+x}{2}\Rightarrow x=2q-p$.',
  2025, 'II', 264, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0031 | əsas: 2025 toplu, II hissə, səh.266 №61
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0031', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Düz xətt və müstəvinin qarşılıqlı vəziyyəti. Çarpaz düz xətlər'), 'original', 'own', 'az', 'draft', 'written',
  'Uzunluğu $10$ olan $AB$ parçası müstəvini $O$ nöqtəsində kəsir. $B$ nöqtəsindən müstəviyə qədər məsafə $6$ və $OB=4$ olarsa, $A$ nöqtəsindən müstəviyə qədər məsafəni tapın.',
  NULL, NULL, NULL, '9',
  '$AO=10-4=6$. Oxşar üçbucaqlardan $\dfrac{d_A}{d_B}=\dfrac{AO}{OB}$: $d_A=6\cdot\dfrac64=9$.',
  2025, 'II', 266, 61)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0032 | əsas: 2025 toplu, II hissə, səh.266 №62
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0032', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Düz xətt və müstəvinin qarşılıqlı vəziyyəti. Çarpaz düz xətlər'), 'original', 'own', 'az', 'draft', 'written',
  'Uzunluğu $5$ olan parça müstəvini kəsir. Parçanın ucları müstəvidən $1{,}8$ və $1{,}2$ məsafədə olarsa, onun müstəvi üzərindəki proyeksiyasını tapın.',
  NULL, NULL, NULL, '4',
  'Uclar müstəvinin müxtəlif tərəflərindədir, onların müstəviyə perpendikulyar istiqamətdə fərqi $1{,}8+1{,}2=3$. Proyeksiya $\sqrt{5^2-3^2}=4$.',
  2025, 'II', 266, 62)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0033 | əsas: 2025 toplu, II hissə, səh.266 №63
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0033', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Düz xətt və müstəvinin qarşılıqlı vəziyyəti. Çarpaz düz xətlər'), 'original', 'own', 'az', 'draft', 'written',
  'Uzunluğu $10$ olan parça müstəvini kəsir. Parçanın ucları müstəvidən $5$ və $3$ məsafədə olarsa, onun müstəvi üzərindəki proyeksiyasını tapın.',
  NULL, NULL, NULL, '6',
  '$\sqrt{10^2-(5+3)^2}=\sqrt{36}=6$.',
  2025, 'II', 266, 63)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0034 | əsas: 2025 toplu, II hissə, səh.268 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0034', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='İki müstəvinin qarşılıqlı vəziyyəti. İkiüzlü bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  'İkiüzlü bucağın bir üzündəki $A$ nöqtəsi digər üzdən $7$ sm məsafədədir. İkiüzlü bucaq $30^\circ$ olarsa, $A$ nöqtəsindən bucağın tilinə qədər olan məsafəni tapın.',
  '[{"key": "A", "text": "$7 \\sqrt{2}$ sm"}, {"key": "B", "text": "$7 \\sqrt{3}$ sm"}, {"key": "C", "text": "$\\dfrac{7}{2}$ sm"}, {"key": "D", "text": "$\\dfrac{14 \\sqrt{3}}{3}$ sm"}, {"key": "E", "text": "$14$ sm"}]'::jsonb, 'E', NULL, NULL,
  '$d=\dfrac{7}{\sin30^\circ}=14$ sm.',
  2025, 'II', 268, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0035 | əsas: 2025 toplu, II hissə, səh.269 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0035', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='İki müstəvinin qarşılıqlı vəziyyəti. İkiüzlü bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$45^\circ$-li ikiüzlü bucağın bir üzü üzərində yerləşən nöqtədən digər üzə qədər məsafə $11$ sm-dir. Bu nöqtədən ikiüzlü bucağın tilinə qədər olan məsafəni tapın.',
  '[{"key": "A", "text": "$11 \\sqrt{3}$ sm"}, {"key": "B", "text": "$11$ sm"}, {"key": "C", "text": "$22$ sm"}, {"key": "D", "text": "$\\dfrac{11 \\sqrt{2}}{2}$ sm"}, {"key": "E", "text": "$11 \\sqrt{2}$ sm"}]'::jsonb, 'E', NULL, NULL,
  '$\dfrac{11}{\sin45^\circ}=11\sqrt2$ sm.',
  2025, 'II', 269, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0036 | əsas: 2025 toplu, II hissə, səh.269 №32
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0036', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='İki müstəvinin qarşılıqlı vəziyyəti. İkiüzlü bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  'İki paralel müstəvi arasındakı məsafə $9$ sm-dir. Uzunluğu $15$ sm-ə bərabər olan parçanın ucları bu müstəvilər üzərindədir. Parçanın müstəvilər üzərindəki proyeksiyasını tapın.',
  '[{"key": "A", "text": "$9$ sm"}, {"key": "B", "text": "$12$ sm"}, {"key": "C", "text": "$6$ sm"}, {"key": "D", "text": "$24$ sm"}, {"key": "E", "text": "$3 \\sqrt{34}$ sm"}]'::jsonb, 'B', NULL, NULL,
  '$\sqrt{15^2-9^2}=12$ sm.',
  2025, 'II', 269, 32)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0037 | əsas: 2025 toplu, II hissə, səh.269 №33
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0037', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='İki müstəvinin qarşılıqlı vəziyyəti. İkiüzlü bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  'Paralel iki müstəvi arasındakı məsafə $5$-ə bərabərdir. Ucları bu müstəvilər üzərində olan parçanın hər iki müstəvi üzərindəki proyeksiyası $12$-yə bərabər olarsa, parçanın uzunluğunu tapın.',
  '[{"key": "A", "text": "$17$"}, {"key": "B", "text": "$\\sqrt{119}$"}, {"key": "C", "text": "$12$"}, {"key": "D", "text": "$13$"}, {"key": "E", "text": "$7$"}]'::jsonb, 'D', NULL, NULL,
  '$\sqrt{5^2+12^2}=13$.',
  2025, 'II', 269, 33)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0038 | əsas: 2025 toplu, II hissə, səh.270 №37
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0038', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='İki müstəvinin qarşılıqlı vəziyyəti. İkiüzlü bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  'Hipotenuzu $AB=12$ olan bərabəryanlı $ABC$ düzbucaqlı üçbucağının $BC$ katetindən keçən $\alpha$ müstəvisi üçbucağın müstəvisi ilə $45^\circ$-li bucaq əmələ gətirir. $A$ nöqtəsindən $\alpha$ müstəvisinə qədər məsafəni tapın.',
  '[{"key": "A", "text": "$12$"}, {"key": "B", "text": "$3 \\sqrt{2}$"}, {"key": "C", "text": "$6$"}, {"key": "D", "text": "$4 \\sqrt{3}$"}, {"key": "E", "text": "$6 \\sqrt{2}$"}]'::jsonb, 'C', NULL, NULL,
  '$AC=\dfrac{12}{\sqrt2}=6\sqrt2$, $AC\perp BC$. $d=AC\sin45^\circ=6$.',
  2025, 'II', 270, 37)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0039 | əsas: 2025 toplu, II hissə, səh.270 №38
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0039', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='İki müstəvinin qarşılıqlı vəziyyəti. İkiüzlü bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  'Kvadratın tərəfindən keçən müstəvi onun müstəvisi ilə $45^\circ$-li bucaq əmələ gətirir. Kvadratın diaqonalı ilə bu müstəvi arasındakı bucağı tapın.',
  '[{"key": "A", "text": "$30^\\circ$"}, {"key": "B", "text": "$\\arccos\\dfrac{\\sqrt2}{4}$"}, {"key": "C", "text": "$45^\\circ$"}, {"key": "D", "text": "$\\arcsin\\dfrac{\\sqrt6}{4}$"}, {"key": "E", "text": "$\\arcsin\\dfrac{\\sqrt2}{4}$"}]'::jsonb, 'A', NULL, NULL,
  'Tərəf $a$ olsun. Qarşı təpədən müstəviyə məsafə $a\sin45^\circ=\dfrac{a\sqrt2}{2}$, diaqonal $a\sqrt2$. $\sin\varphi=\dfrac{a\sqrt2/2}{a\sqrt2}=\dfrac12\Rightarrow\varphi=30^\circ$.',
  2025, 'II', 270, 38)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0040 | əsas: 2025 toplu, II hissə, səh.270 №39
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0040', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='İki müstəvinin qarşılıqlı vəziyyəti. İkiüzlü bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  'Kvadratın tərəfindən keçən müstəvi onun müstəvisi ilə $60^\circ$-li bucaq əmələ gətirir. Kvadratın diaqonalı ilə bu müstəvi arasındakı bucağı tapın.',
  '[{"key": "A", "text": "$\\arcsin\\dfrac{\\sqrt3}{4}$"}, {"key": "B", "text": "$\\arccos\\dfrac{\\sqrt6}{4}$"}, {"key": "C", "text": "$30^\\circ$"}, {"key": "D", "text": "$\\arcsin\\dfrac{\\sqrt6}{4}$"}, {"key": "E", "text": "$45^\\circ$"}]'::jsonb, 'D', NULL, NULL,
  '$\sin\varphi=\dfrac{a\sin60^\circ}{a\sqrt2}=\dfrac{\sqrt3}{2\sqrt2}=\dfrac{\sqrt6}{4}$, $\varphi=\arcsin\dfrac{\sqrt6}{4}$.',
  2025, 'II', 270, 39)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0041 | əsas: 2025 toplu, II hissə, səh.270 №40
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0041', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='İki müstəvinin qarşılıqlı vəziyyəti. İkiüzlü bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzbucaqlı üçbucağın iti bucaq təpəsindən qarşıdakı katetə paralel müstəvi keçirilmişdir. O biri katetin bu müstəvi üzərindəki proyeksiyası $5$ m, hipotenuzun proyeksiyası isə $13$ m-dir. Müstəviyə paralel katetin uzunluğunu tapın.',
  '[{"key": "A", "text": "$\\sqrt{194}$ m"}, {"key": "B", "text": "$12$ m"}, {"key": "C", "text": "$4 \\sqrt{3}$ m"}, {"key": "D", "text": "$8$ m"}, {"key": "E", "text": "$18$ m"}]'::jsonb, 'B', NULL, NULL,
  'Paralel katet öz uzunluğunda proyeksiyalanır və üç perpendikulyar teoreminə görə proyeksiyada düz bucaq saxlanılır. $\sqrt{13^2-5^2}=12$ m.',
  2025, 'II', 270, 40)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0042 | əsas: 2025 toplu, II hissə, səh.270 №41
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0042', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='İki müstəvinin qarşılıqlı vəziyyəti. İkiüzlü bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  'Rombun tərəfindən keçən müstəvi qarşıdakı tərəfdən $5$ sm məsafədədir. Rombun diaqonallarının bu müstəvi üzərindəki proyeksiyaları $25$ sm və $1$ sm olarsa, rombun tərəflərinin bu müstəvi üzərindəki proyeksiyalarını tapın.',
  '[{"key": "A", "text": "$13$ sm və $12$ sm"}, {"key": "B", "text": "$13$ sm və $13$ sm"}, {"key": "C", "text": "$12$ sm və $1$ sm"}, {"key": "D", "text": "$13$ sm və $5$ sm"}, {"key": "E", "text": "$12$ sm və $5$ sm"}]'::jsonb, 'A', NULL, NULL,
  'Romb $ABCD$, $AB\subset\alpha$, tərəf $a$; $AD$-nin proyeksiyası $p$. Paraleloqramda $d_1^2+d_2^2=2(a^2+p^2)$: $626=2(a^2+p^2)\Rightarrow a^2+p^2=313$. $a^2=p^2+25$. Buradan $p=12$, $a=13$. Proyeksiyalar $13$ sm və $12$ sm.',
  2025, 'II', 270, 41)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0043 | əsas: 2025 toplu, II hissə, səh.270 №42
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0043', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='İki müstəvinin qarşılıqlı vəziyyəti. İkiüzlü bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$AB$ maili $\alpha$ müstəvisi ilə $30^\circ$-li, proyeksiyası isə bu müstəvi üzərindəki $AC$ düz xətti ilə $45^\circ$-li bucaq əmələ gətirir. $\angle CAB$-ni tapın.',
  '[{"key": "A", "text": "$\\arccos\\dfrac{\\sqrt6}{3}$"}, {"key": "B", "text": "$\\arccos\\dfrac{\\sqrt2}{4}$"}, {"key": "C", "text": "$\\arccos\\dfrac{\\sqrt6}{4}$"}, {"key": "D", "text": "$\\arccos\\dfrac{\\sqrt3}{4}$"}, {"key": "E", "text": "$\\arccos\\dfrac14$"}]'::jsonb, 'C', NULL, NULL,
  '$\cos\angle CAB=\cos30^\circ\cdot\cos45^\circ=\dfrac{\sqrt3}{2}\cdot\dfrac{\sqrt2}{2}=\dfrac{\sqrt6}{4}$.',
  2025, 'II', 270, 42)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0044 | əsas: 2025 toplu, II hissə, səh.271 №62
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0044', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='İki müstəvinin qarşılıqlı vəziyyəti. İkiüzlü bucaqlar'), 'original', 'own', 'az', 'draft', 'written',
  '$ABC$ üçbucağında $\angle A=90^\circ$, $AC=8$, $BC=17$. Bu üçbucağın $AC$ tərəfindən üçbucaq müstəvisi ilə $30^\circ$-li bucaq əmələ gətirən $\alpha$ müstəvisi keçirilmişdir. $B$ təpəsindən $\alpha$ müstəvisinə qədər məsafəni hesablayın.',
  NULL, NULL, NULL, '7,5',
  '$AB=\sqrt{17^2-8^2}=15$, $AB\perp AC$, deməli $AB$ ilə $\alpha$ arasındakı bucaq $30^\circ$-dir. $d=15\sin30^\circ=7{,}5$.',
  2025, 'II', 271, 62)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0045 | əsas: 2025 toplu, II hissə, səh.271 №63
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0045', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='İki müstəvinin qarşılıqlı vəziyyəti. İkiüzlü bucaqlar'), 'original', 'own', 'az', 'draft', 'written',
  '$ABC$ üçbucağında $\angle B=90^\circ$, $AC=13$ və $AB=12$-dir. $AB$ katetindən keçirilən $\alpha$ müstəvisinin $C$ təpəsindən məsafəsi $\dfrac{5\sqrt3}{2}$ olarsa, onun üçbucaq müstəvisi ilə əmələ gətirdiyi bucağın dərəcə ölçüsünü tapın.',
  NULL, NULL, NULL, '60',
  '$BC=\sqrt{169-144}=5$, $BC\perp AB$. $\sin\varphi=\dfrac{5\sqrt3/2}{5}=\dfrac{\sqrt3}{2}\Rightarrow\varphi=60^\circ$.',
  2025, 'II', 271, 63)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0046 | əsas: 2025 toplu, II hissə, səh.272 №74
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0046', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='İki müstəvinin qarşılıqlı vəziyyəti. İkiüzlü bucaqlar'), 'original', 'own', 'az', 'draft', 'written',
  'Düzbucaqlı üçbucağın düz bucaq təpəsindən onun hipotenuzuna paralel müstəvi keçirilmişdir. Hipotenuzun müstəvidən məsafəsi $6$ m, katetlərin bu müstəvi üzərindəki proyeksiyaları isə $9$ m və $4$ m olarsa, hipotenuzun uzunluğunu tapın.',
  NULL, NULL, NULL, '13',
  'Hər katetin uclarından biri müstəvidə, digəri $6$ m məsafədədir: $a^2=81+36$, $b^2=16+36$. $c=\sqrt{a^2+b^2}=\sqrt{169}=13$ m.',
  2025, 'II', 272, 74)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0047 | əsas: 2025 toplu, II hissə, səh.272 №75
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0047', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='İki müstəvinin qarşılıqlı vəziyyəti. İkiüzlü bucaqlar'), 'original', 'own', 'az', 'draft', 'written',
  'Düzbucaqlı üçbucağın düz bucaq təpəsindən onun hipotenuzuna paralel müstəvi keçirilmişdir. Hipotenuzun müstəvidən məsafəsi $4$ sm, katetlərin bu müstəvi üzərindəki proyeksiyaları isə $8$ sm və $5$ sm olarsa, hipotenuzun uzunluğunu tapın.',
  NULL, NULL, NULL, '11',
  '$c^2=(64+16)+(25+16)=121$, $c=11$ sm.',
  2025, 'II', 272, 75)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0048 | əsas: 2025 toplu, II hissə, səh.276 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0048', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizma və onun elementləri'), 'original', 'own', 'az', 'draft', 'closed',
  'Altıbucaqlı prizmanın neçə diaqonal kəsiyi var?',
  '[{"key": "A", "text": "$9$"}, {"key": "B", "text": "$12$"}, {"key": "C", "text": "$18$"}, {"key": "D", "text": "$6$"}, {"key": "E", "text": "$3$"}]'::jsonb, 'A', NULL, NULL,
  'Diaqonal kəsiklər oturacağın diaqonallarından keçir. Altıbucaqlının $\dfrac{6\cdot3}{2}=9$ diaqonalı var, deməli $9$ diaqonal kəsik.',
  2025, 'II', 276, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0049 | əsas: 2025 toplu, II hissə, səh.275 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0049', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın səthinin sahəsi. Prizmanın müstəvi kəsikləri'), 'original', 'own', 'az', 'draft', 'closed',
  'Yan səthinin sahəsi $100$ m$^2$ olan kubun tam səthinin sahəsini tapın.',
  '[{"key": "A", "text": "$125$ m$^2$"}, {"key": "B", "text": "$250$ m$^2$"}, {"key": "C", "text": "$150$ m$^2$"}, {"key": "D", "text": "$133\\dfrac13$ m$^2$"}, {"key": "E", "text": "$200$ m$^2$"}]'::jsonb, 'C', NULL, NULL,
  'Bir üzün sahəsi $\dfrac{100}{4}=25$. Tam səth $6\cdot25=150$ m$^2$.',
  2025, 'II', 275, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0050 | əsas: 2025 toplu, II hissə, səh.275 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0050', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın səthinin sahəsi. Prizmanın müstəvi kəsikləri'), 'original', 'own', 'az', 'draft', 'closed',
  'Tam səthinin sahəsi $300$ m$^2$ olan kubun yan səthinin sahəsini tapın.',
  '[{"key": "A", "text": "$200$ m$^2$"}, {"key": "B", "text": "$150$ m$^2$"}, {"key": "C", "text": "$100$ m$^2$"}, {"key": "D", "text": "$240$ m$^2$"}, {"key": "E", "text": "$250$ m$^2$"}]'::jsonb, 'A', NULL, NULL,
  'Bir üz: $\dfrac{300}{6}=50$. Yan səth $4\cdot50=200$ m$^2$.',
  2025, 'II', 275, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0051 | əsas: 2025 toplu, II hissə, səh.275 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0051', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın səthinin sahəsi. Prizmanın müstəvi kəsikləri'), 'original', 'own', 'az', 'draft', 'closed',
  'Prizmanın bütün üzləri tərəfi $6$ sm və iti bucağı $60^\circ$ olan rombdur. Prizmanın yan səthinin sahəsini tapın.',
  '[{"key": "A", "text": "$108 \\sqrt{3}$ sm$^2$"}, {"key": "B", "text": "$36 \\sqrt{3}$ sm$^2$"}, {"key": "C", "text": "$72$ sm$^2$"}, {"key": "D", "text": "$72 \\sqrt{3}$ sm$^2$"}, {"key": "E", "text": "$144$ sm$^2$"}]'::jsonb, 'D', NULL, NULL,
  'Bir üzün sahəsi $6^2\sin60^\circ=18\sqrt3$. Yan səth $4\cdot18\sqrt3=72\sqrt3$ sm$^2$.',
  2025, 'II', 275, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0052 | əsas: 2025 toplu, II hissə, səh.276 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0052', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın səthinin sahəsi. Prizmanın müstəvi kəsikləri'), 'original', 'own', 'az', 'draft', 'closed',
  'Prizmanın bütün üzləri tərəfi $4$ sm və iti bucağı $45^\circ$ olan rombdur. Prizmanın tam səthinin sahəsini tapın.',
  '[{"key": "A", "text": "$96 \\sqrt{2}$ sm$^2$"}, {"key": "B", "text": "$96$ sm$^2$"}, {"key": "C", "text": "$32 \\sqrt{2}$ sm$^2$"}, {"key": "D", "text": "$48 \\sqrt{2}$ sm$^2$"}, {"key": "E", "text": "$48 \\sqrt{3}$ sm$^2$"}]'::jsonb, 'D', NULL, NULL,
  'Bir üz: $16\sin45^\circ=8\sqrt2$. Tam səth $6\cdot8\sqrt2=48\sqrt2$ sm$^2$.',
  2025, 'II', 276, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0053 | əsas: 2025 toplu, II hissə, səh.276 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0053', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın səthinin sahəsi. Prizmanın müstəvi kəsikləri'), 'original', 'own', 'az', 'draft', 'closed',
  'Diaqonalı $18$ sm olan kubun tam səthinin sahəsini tapın.',
  '[{"key": "A", "text": "$324$ sm$^2$"}, {"key": "B", "text": "$648$ sm$^2$"}, {"key": "C", "text": "$432$ sm$^2$"}, {"key": "D", "text": "$1944$ sm$^2$"}, {"key": "E", "text": "$972$ sm$^2$"}]'::jsonb, 'B', NULL, NULL,
  '$a\sqrt3=18\Rightarrow a^2=108$. $S=6\cdot108=648$ sm$^2$.',
  2025, 'II', 276, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0054 | əsas: 2025 toplu, II hissə, səh.276 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0054', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın səthinin sahəsi. Prizmanın müstəvi kəsikləri'), 'original', 'own', 'az', 'draft', 'closed',
  'Diaqonalı $15$ sm olan kubun tam səthinin sahəsini tapın.',
  '[{"key": "A", "text": "$225$ sm$^2$"}, {"key": "B", "text": "$675$ sm$^2$"}, {"key": "C", "text": "$1350$ sm$^2$"}, {"key": "D", "text": "$300$ sm$^2$"}, {"key": "E", "text": "$450$ sm$^2$"}]'::jsonb, 'E', NULL, NULL,
  '$a^2=\dfrac{225}{3}=75$. $S=6\cdot75=450$ sm$^2$.',
  2025, 'II', 276, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0055 | əsas: 2025 toplu, II hissə, səh.276 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0055', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın səthinin sahəsi. Prizmanın müstəvi kəsikləri'), 'original', 'own', 'az', 'draft', 'closed',
  'Kubun bütün tillərini $4$ dəfə kiçiltdikdə yan səthin sahəsi neçə dəfə kiçilər?',
  '[{"key": "A", "text": "$16$"}, {"key": "B", "text": "$4$"}, {"key": "C", "text": "$64$"}, {"key": "D", "text": "$8$"}, {"key": "E", "text": "$12$"}]'::jsonb, 'A', NULL, NULL,
  'Sahə xətti ölçünün kvadratı ilə mütənasibdir: $4^2=16$ dəfə.',
  2025, 'II', 276, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0056 | əsas: 2025 toplu, II hissə, səh.276 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0056', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın səthinin sahəsi. Prizmanın müstəvi kəsikləri'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzgün altıbucaqlı prizmanın oturacağının tərəfi $5$ sm-ə, yan üzünün diaqonalı $13$ sm-ə bərabərdir. Prizmanın yan səthinin sahəsini tapın.',
  '[{"key": "A", "text": "$180$ sm$^2$"}, {"key": "B", "text": "$300$ sm$^2$"}, {"key": "C", "text": "$420$ sm$^2$"}, {"key": "D", "text": "$390$ sm$^2$"}, {"key": "E", "text": "$360$ sm$^2$"}]'::jsonb, 'E', NULL, NULL,
  '$h=\sqrt{13^2-5^2}=12$. $S_{yan}=6\cdot5\cdot12=360$ sm$^2$.',
  2025, 'II', 276, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0057 | əsas: 2025 toplu, II hissə, səh.276 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0057', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın səthinin sahəsi. Prizmanın müstəvi kəsikləri'), 'original', 'own', 'az', 'draft', 'written',
  'Yan səthinin sahəsi $12$ olan düzgün altıbucaqlı prizmanın böyük diaqonal kəsiyinin sahəsini tapın.',
  NULL, NULL, NULL, '4',
  '$S_{yan}=6ah=12\Rightarrow ah=2$. Böyük diaqonal kəsik $2a\times h$ düzbucaqlısıdır: $2ah=4$.',
  2025, 'II', 276, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0058 | əsas: 2025 toplu, II hissə, səh.276 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0058', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın səthinin sahəsi. Prizmanın müstəvi kəsikləri'), 'original', 'own', 'az', 'draft', 'written',
  'Böyük diaqonal kəsiyinin sahəsi $5$-ə bərabər olan düzgün altıbucaqlı prizmanın yan səthinin sahəsini tapın.',
  NULL, NULL, NULL, '15',
  '$2ah=5\Rightarrow ah=2{,}5$. $S_{yan}=6ah=15$.',
  2025, 'II', 276, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0059 | əsas: 2025 toplu, II hissə, səh.277 №27
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0059', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın səthinin sahəsi. Prizmanın müstəvi kəsikləri'), 'original', 'own', 'az', 'draft', 'written',
  'Oturacağı tərəfləri $6$ və $3$, onlar arasındakı bucaq $30^\circ$ olan paraleloqram, yan tili isə $7$ olan düz dördbucaqlı prizmanın tam səthinin sahəsini tapın.',
  NULL, NULL, NULL, '144',
  '$S_{ot}=6\cdot3\cdot\sin30^\circ=9$, $S_{yan}=2(6+3)\cdot7=126$. $S=2\cdot9+126=144$.',
  2025, 'II', 277, 27)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0060 | əsas: 2025 toplu, II hissə, səh.277 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0060', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın səthinin sahəsi. Prizmanın müstəvi kəsikləri'), 'original', 'own', 'az', 'draft', 'written',
  'Düz prizmanın oturacağı iti bucağı $30^\circ$, tərəfi $6$ olan rombdur. Prizmanın yan tili $5$ olarsa, onun tam səthinin sahəsini tapın.',
  NULL, NULL, NULL, '156',
  '$S_{ot}=36\sin30^\circ=18$, $S_{yan}=4\cdot6\cdot5=120$. $S=36+120=156$.',
  2025, 'II', 277, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0061 | əsas: 2025 toplu, II hissə, səh.277 №36
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0061', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın səthinin sahəsi. Prizmanın müstəvi kəsikləri'), 'original', 'own', 'az', 'draft', 'written',
  'Hündürlüyü oturacağının tərəfindən $3$ dəfə böyük olan düzgün altıbucaqlı prizmanın böyük diaqonalı $3\sqrt{13}$ olarsa, yan səthinin sahəsini tapın.',
  NULL, NULL, NULL, '162',
  'Böyük diaqonal: $(2a)^2+(3a)^2=117\Rightarrow13a^2=117$, $a=3$, $h=9$. $S_{yan}=6\cdot3\cdot9=162$.',
  2025, 'II', 277, 36)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0062 | əsas: 2025 toplu, II hissə, səh.277 №37
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0062', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın səthinin sahəsi. Prizmanın müstəvi kəsikləri'), 'original', 'own', 'az', 'draft', 'written',
  'Hündürlüyü oturacağının tərəfindən $4$ dəfə böyük olan düzgün altıbucaqlı prizmanın böyük diaqonalı $6\sqrt5$ olarsa, yan səthinin sahəsini tapın.',
  NULL, NULL, NULL, '216',
  '$(2a)^2+(4a)^2=180\Rightarrow20a^2=180$, $a=3$, $h=12$. $S_{yan}=6\cdot3\cdot12=216$.',
  2025, 'II', 277, 37)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0063 | əsas: 2025 toplu, II hissə, səh.277 №38
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0063', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın səthinin sahəsi. Prizmanın müstəvi kəsikləri'), 'original', 'own', 'az', 'draft', 'matching',
  'Tili $5$ olan kub üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "Tam səthinin sahəsi"}, {"key": "2", "text": "Yan səthinin sahəsi"}, {"key": "3", "text": "Kubun diaqonalı"}], "right": [{"key": "a", "text": "$5\\sqrt2$"}, {"key": "b", "text": "$100$"}, {"key": "c", "text": "$150$"}, {"key": "d", "text": "$5\\sqrt3$"}, {"key": "e", "text": "$25$"}]}'::jsonb, NULL, '{"1": ["c"], "2": ["b"], "3": ["d"]}'::jsonb, NULL,
  'Tam səth $6\cdot25=150$, yan səth $4\cdot25=100$, diaqonal $5\sqrt3$.',
  2025, 'II', 277, 38)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0064 | əsas: 2025 toplu, II hissə, səh.279 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0064', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Piramida və onun elementləri'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzgün üçbucaqlı piramidanın hündürlüyü oturacağın tərəfindən $\sqrt3$ dəfə kiçikdir. Yan tilin oturacaq müstəvisi ilə əmələ gətirdiyi bucağın dərəcə ölçüsünü tapın.',
  '[{"key": "A", "text": "$75^\\circ$"}, {"key": "B", "text": "$60^\\circ$"}, {"key": "C", "text": "$30^\\circ$"}, {"key": "D", "text": "$45^\\circ$"}, {"key": "E", "text": "$90^\\circ$"}]'::jsonb, 'D', NULL, NULL,
  '$R=\dfrac{a}{\sqrt3}$, $h=\dfrac{a}{\sqrt3}$. $\operatorname{tg}\varphi=\dfrac hR=1\Rightarrow\varphi=45^\circ$.',
  2025, 'II', 279, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0065 | əsas: 2025 toplu, II hissə, səh.279 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0065', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Piramida və onun elementləri'), 'original', 'own', 'az', 'draft', 'closed',
  'Düzgün dördbucaqlı piramidanın hündürlüyü $\dfrac{\sqrt6}{2}a$-ya, oturacağının tərəfi isə $a$-ya bərabərdir. Yan tilin oturacaq müstəvisi ilə əmələ gətirdiyi bucağın dərəcə ölçüsünü tapın.',
  '[{"key": "A", "text": "$45^\\circ$"}, {"key": "B", "text": "$75^\\circ$"}, {"key": "C", "text": "$60^\\circ$"}, {"key": "D", "text": "$90^\\circ$"}, {"key": "E", "text": "$30^\\circ$"}]'::jsonb, 'C', NULL, NULL,
  '$R=\dfrac{a\sqrt2}{2}$. $\operatorname{tg}\varphi=\dfrac{a\sqrt6/2}{a\sqrt2/2}=\sqrt3\Rightarrow\varphi=60^\circ$.',
  2025, 'II', 279, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0066 | əsas: 2025 toplu, II hissə, səh.279 №27
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0066', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Piramida və onun elementləri'), 'original', 'own', 'az', 'draft', 'matching',
  'Uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "Dördbucaqlı prizma"}, {"key": "2", "text": "Beşbucaqlı piramida"}, {"key": "3", "text": "Üçbucaqlı prizma"}], "right": [{"key": "a", "text": "$12$ tili var"}, {"key": "b", "text": "$6$ təpə nöqtəsi var"}, {"key": "c", "text": "$6$ üzü var"}, {"key": "d", "text": "$5$ üzü var"}, {"key": "e", "text": "$10$ tili var"}]}'::jsonb, NULL, '{"1": ["a", "c"], "2": ["b", "c", "e"], "3": ["b", "d"]}'::jsonb, NULL,
  'Dördbucaqlı prizma: $12$ til, $8$ təpə, $6$ üz. Beşbucaqlı piramida: $10$ til, $6$ təpə, $6$ üz. Üçbucaqlı prizma: $9$ til, $6$ təpə, $5$ üz.',
  2025, 'II', 279, 27)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0067 | əsas: 2025 toplu, II hissə, səh.279 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0067', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Piramida və onun elementləri'), 'original', 'own', 'az', 'draft', 'matching',
  'Uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "Beşbucaqlı prizma"}, {"key": "2", "text": "Altıbucaqlı piramida"}, {"key": "3", "text": "Kub"}], "right": [{"key": "a", "text": "$7$ üzü var"}, {"key": "b", "text": "$12$ tili var"}, {"key": "c", "text": "$10$ təpə nöqtəsi var"}, {"key": "d", "text": "$8$ təpə nöqtəsi var"}, {"key": "e", "text": "$15$ tili var"}]}'::jsonb, NULL, '{"1": ["a", "c", "e"], "2": ["a", "b"], "3": ["b", "d"]}'::jsonb, NULL,
  'Beşbucaqlı prizma: $15$ til, $10$ təpə, $7$ üz. Altıbucaqlı piramida: $12$ til, $7$ təpə, $7$ üz. Kub: $12$ til, $8$ təpə, $6$ üz.',
  2025, 'II', 279, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0068 | əsas: 2025 toplu, II hissə, səh.279 №29
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0068', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Piramida və onun elementləri'), 'original', 'own', 'az', 'draft', 'matching',
  'Uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$8$-bucaqlı prizma"}, {"key": "2", "text": "$9$-bucaqlı piramida"}, {"key": "3", "text": "Düzbucaqlı paralelepiped"}], "right": [{"key": "a", "text": "yan üzləri üçbucaqdır"}, {"key": "b", "text": "yan üzləri düzbucaqlıdır"}, {"key": "c", "text": "oturacağının $27$ diaqonalı var"}, {"key": "d", "text": "$40$ diaqonalı var"}, {"key": "e", "text": "$18$ tili var"}]}'::jsonb, NULL, '{"1": ["b", "d"], "2": ["a", "c", "e"], "3": ["b"]}'::jsonb, NULL,
  '$8$-bucaqlı prizma: $24$ til, diaqonalları $8\cdot5=40$. $9$-bucaqlı piramida: yan üzləri üçbucaq, oturacağın diaqonalları $\dfrac{9\cdot6}{2}=27$, $18$ til. Düz prizmaların (o cümlədən paralelepipedin) yan üzləri düzbucaqlıdır.',
  2025, 'II', 279, 29)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0069 | əsas: 2025 toplu, II hissə, səh.279 №30
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0069', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Piramida və onun elementləri'), 'original', 'own', 'az', 'draft', 'matching',
  'Uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$6$-bucaqlı prizma"}, {"key": "2", "text": "$10$-bucaqlı piramida"}, {"key": "3", "text": "Kub"}], "right": [{"key": "a", "text": "$18$ tili var"}, {"key": "b", "text": "oturacağının $35$ diaqonalı var"}, {"key": "c", "text": "$20$ tili var"}, {"key": "d", "text": "$12$ tili var"}, {"key": "e", "text": "yan üzləri üçbucaqdır"}]}'::jsonb, NULL, '{"1": ["a"], "2": ["b", "c", "e"], "3": ["d"]}'::jsonb, NULL,
  '$6$-bucaqlı prizma: $18$ til. $10$-bucaqlı piramida: $20$ til, oturacağın diaqonalları $\dfrac{10\cdot7}{2}=35$, yan üzləri üçbucaq. Kub: $12$ til.',
  2025, 'II', 279, 30)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0070 | əsas: 2025 toplu, II hissə, səh.281 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0070', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Piramidanın səthinin sahəsi. Kəsik piramida'), 'original', 'own', 'az', 'draft', 'closed',
  'Hündürlüyü $8$ sm olan düzgün kəsik piramidanın oturacaqlarının xaricinə çəkilmiş çevrələrin radiusları $4$ sm və $10$ sm-dir. Bu piramidanın yan tilini tapın.',
  '[{"key": "A", "text": "$2 \\sqrt{29}$ sm"}, {"key": "B", "text": "$6$ sm"}, {"key": "C", "text": "$8 \\sqrt{2}$ sm"}, {"key": "D", "text": "$14$ sm"}, {"key": "E", "text": "$10$ sm"}]'::jsonb, 'E', NULL, NULL,
  'Yan til, hündürlük və radiusların fərqi düzbucaqlı trapesiya əmələ gətirir: $\sqrt{8^2+6^2}=10$ sm.',
  2025, 'II', 281, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0071 | əsas: 2025 toplu, II hissə, səh.281 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0071', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Piramidanın səthinin sahəsi. Kəsik piramida'), 'original', 'own', 'az', 'draft', 'closed',
  'Hündürlüyü $5$ sm olan düzgün kəsik piramidanın oturacaqlarının xaricinə çəkilmiş çevrələrin radiusları $20$ sm və $8$ sm-dir. Bu piramidanın yan tilini tapın.',
  '[{"key": "A", "text": "$5 \\sqrt{5}$ sm"}, {"key": "B", "text": "$12$ sm"}, {"key": "C", "text": "$13$ sm"}, {"key": "D", "text": "$\\sqrt{89}$ sm"}, {"key": "E", "text": "$17$ sm"}]'::jsonb, 'C', NULL, NULL,
  '$\sqrt{5^2+12^2}=13$ sm.',
  2025, 'II', 281, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0072 | əsas: 2025 toplu, II hissə, səh.281 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0072', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Piramidanın səthinin sahəsi. Kəsik piramida'), 'original', 'own', 'az', 'draft', 'written',
  'Oturacaqlarının tərəfləri $10$ və $4$, apofemi $7$ olan düzgün kəsik dördbucaqlı piramidanın tam səthini tapın.',
  NULL, NULL, NULL, '312',
  '$S=10^2+4^2+4\cdot\dfrac{10+4}{2}\cdot7=116+196=312$.',
  2025, 'II', 281, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0073 | əsas: 2025 toplu, II hissə, səh.281 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0073', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Piramidanın səthinin sahəsi. Kəsik piramida'), 'original', 'own', 'az', 'draft', 'written',
  'Oturacaqlarının tərəfləri $8$ və $2$, apofemi $5$ olan düzgün kəsik dördbucaqlı piramidanın tam səthini tapın.',
  NULL, NULL, NULL, '168',
  '$S=64+4+4\cdot\dfrac{8+2}{2}\cdot5=68+100=168$.',
  2025, 'II', 281, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0074 | əsas: 2025 toplu, II hissə, səh.281 №27
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0074', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Piramidanın səthinin sahəsi. Kəsik piramida'), 'original', 'own', 'az', 'draft', 'written',
  'Yan səthinin sahəsi $48$, apofemi $6$ olan düzgün dördbucaqlı piramidanın tam səthinin sahəsini tapın.',
  NULL, NULL, NULL, '64',
  '$S_{yan}=4\cdot\dfrac{a\cdot6}{2}=12a=48\Rightarrow a=4$. $S=48+16=64$.',
  2025, 'II', 281, 27)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0075 | əsas: 2025 toplu, II hissə, səh.281 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0075', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Piramidanın səthinin sahəsi. Kəsik piramida'), 'original', 'own', 'az', 'draft', 'written',
  'Oturacağının tərəfi $6$, tam səthinin sahəsi $120$ olan düzgün dördbucaqlı piramidanın apofemini tapın.',
  NULL, NULL, NULL, '7',
  '$S_{yan}=120-36=84=4\cdot\dfrac{6l}{2}=12l\Rightarrow l=7$.',
  2025, 'II', 281, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0076 | əsas: 2025 toplu, II hissə, səh.281 №31
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0076', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Piramidanın səthinin sahəsi. Kəsik piramida'), 'original', 'own', 'az', 'draft', 'written',
  'Düzgün dördbucaqlı piramidanın oturacağının tərəfi $8$-dir. Piramidanın oturacağına paralel və onu kəsən müstəvi piramidanın təpəsindən başlayaraq onun hündürlüyünü $3:5$ nisbətində bölür. Alınan kəsiyin sahəsini tapın.',
  NULL, NULL, NULL, '9',
  'Kəsik oturacağa oxşardır, oxşarlıq əmsalı $\dfrac38$. Kəsiyin tərəfi $8\cdot\dfrac38=3$, sahəsi $9$.',
  2025, 'II', 281, 31)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0077 | əsas: 2025 toplu, II hissə, səh.282 №32
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0077', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Piramidanın səthinin sahəsi. Kəsik piramida'), 'original', 'own', 'az', 'draft', 'written',
  'Düzgün dördbucaqlı piramidanın oturacağının tərəfi $10$-dur. Piramidanın oturacağına paralel və onu kəsən müstəvi piramidanın təpəsindən başlayaraq onun hündürlüyünü $2:3$ nisbətində bölür. Alınan kəsiyin sahəsini tapın.',
  NULL, NULL, NULL, '16',
  'Oxşarlıq əmsalı $\dfrac25$, kəsiyin tərəfi $4$, sahəsi $16$.',
  2025, 'II', 282, 32)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0078 | əsas: 2025 toplu, II hissə, səh.282 №39
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0078', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Piramidanın səthinin sahəsi. Kəsik piramida'), 'original', 'own', 'az', 'draft', 'matching',
  'Düzgün tetraedrin yan səthinin sahəsi $S$ olarsa, uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$S=12 \\sqrt{3}$"}, {"key": "2", "text": "$S=48 \\sqrt{3}$"}, {"key": "3", "text": "$S=75 \\sqrt{3}$"}], "right": [{"key": "a", "text": "tam səthinin sahəsi $16\\sqrt3$-dür"}, {"key": "b", "text": "tam səthinin sahəsi $100\\sqrt3$-dür"}, {"key": "c", "text": "tilinin uzunluğu $8$-dir"}, {"key": "d", "text": "tilinin uzunluğu $4$-dür"}, {"key": "e", "text": "tilinin uzunluğu $10$-dur"}]}'::jsonb, NULL, '{"1": ["a", "d"], "2": ["c"], "3": ["b", "e"]}'::jsonb, NULL,
  '$S_{yan}=3\cdot\dfrac{\sqrt3}{4}a^2$, $S_{tam}=\sqrt3a^2$. 1) $a^2=16$, $a=4$, $S_{tam}=16\sqrt3$. 2) $a=8$. 3) $a=10$, $S_{tam}=100\sqrt3$.',
  2025, 'II', 282, 39)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0079 | əsas: 2025 toplu, II hissə, səh.282 №40
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0079', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Piramidanın səthinin sahəsi. Kəsik piramida'), 'original', 'own', 'az', 'draft', 'matching',
  'Düzgün tetraedrin yan səthinin sahəsi $S$ olarsa, uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$S=3 \\sqrt{3}$"}, {"key": "2", "text": "$S=27 \\sqrt{3}$"}, {"key": "3", "text": "$S=147 \\sqrt{3}$"}], "right": [{"key": "a", "text": "tilinin uzunluğu $2$-dir"}, {"key": "b", "text": "tilinin uzunluğu $14$-dür"}, {"key": "c", "text": "tilinin uzunluğu $6$-dır"}, {"key": "d", "text": "tam səthinin sahəsi $36\\sqrt3$-dür"}, {"key": "e", "text": "tam səthinin sahəsi $196\\sqrt3$-dür"}]}'::jsonb, NULL, '{"1": ["a"], "2": ["c", "d"], "3": ["b", "e"]}'::jsonb, NULL,
  '1) $a^2=4$, $a=2$. 2) $a^2=36$, $a=6$, $S_{tam}=36\sqrt3$. 3) $a^2=196$, $a=14$, $S_{tam}=196\sqrt3$.',
  2025, 'II', 282, 40)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0080 | əsas: 2025 toplu, II hissə, səh.283 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0080', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın və piramidanın həcmi. Kəsik piramidanın həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Həcmi $125$ sm$^3$ olan piramida ilə eyni böyüklükdə (həcmdə) olan kubun tilini tapın.',
  '[{"key": "A", "text": "$\\dfrac{125}{3}$ sm"}, {"key": "B", "text": "$10$ sm"}, {"key": "C", "text": "$15$ sm"}, {"key": "D", "text": "$25$ sm"}, {"key": "E", "text": "$5$ sm"}]'::jsonb, 'E', NULL, NULL,
  '$a^3=125\Rightarrow a=5$ sm.',
  2025, 'II', 283, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0081 | əsas: 2025 toplu, II hissə, səh.283 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0081', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın və piramidanın həcmi. Kəsik piramidanın həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Həcmi $216$ sm$^3$ olan piramida ilə eyni böyüklükdə (həcmdə) olan kubun tilini tapın.',
  '[{"key": "A", "text": "$36$ sm"}, {"key": "B", "text": "$12$ sm"}, {"key": "C", "text": "$8$ sm"}, {"key": "D", "text": "$6$ sm"}, {"key": "E", "text": "$72$ sm"}]'::jsonb, 'D', NULL, NULL,
  '$a^3=216\Rightarrow a=6$ sm.',
  2025, 'II', 283, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0082 | əsas: 2025 toplu, II hissə, səh.284 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0082', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın və piramidanın həcmi. Kəsik piramidanın həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Üçbucaqlı piramidanın yan tilləri cüt-cüt perpendikulyar olmaqla $5$ sm, $6$ sm və $8$ sm-ə bərabərdir. Piramidanın həcmini tapın.',
  '[{"key": "A", "text": "$40$ sm$^3$"}, {"key": "B", "text": "$20$ sm$^3$"}, {"key": "C", "text": "$120$ sm$^3$"}, {"key": "D", "text": "$80$ sm$^3$"}, {"key": "E", "text": "$60$ sm$^3$"}]'::jsonb, 'A', NULL, NULL,
  'Bir til hündürlük, digər ikisi düzbucaqlı oturacağın katetləridir: $V=\dfrac13\cdot\dfrac{5\cdot6}{2}\cdot8=40$ sm$^3$.',
  2025, 'II', 284, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0083 | əsas: 2025 toplu, II hissə, səh.284 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0083', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın və piramidanın həcmi. Kəsik piramidanın həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Üçbucaqlı piramidanın yan tilləri cüt-cüt perpendikulyar olmaqla $4$ sm, $6$ sm və $7$ sm-ə bərabərdir. Piramidanın həcmini tapın.',
  '[{"key": "A", "text": "$168$ sm$^3$"}, {"key": "B", "text": "$28$ sm$^3$"}, {"key": "C", "text": "$56$ sm$^3$"}, {"key": "D", "text": "$84$ sm$^3$"}, {"key": "E", "text": "$14$ sm$^3$"}]'::jsonb, 'B', NULL, NULL,
  '$V=\dfrac{4\cdot6\cdot7}{6}=28$ sm$^3$.',
  2025, 'II', 284, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0084 | əsas: 2025 toplu, II hissə, səh.284 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0084', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın və piramidanın həcmi. Kəsik piramidanın həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Kubun diaqonallarının kəsişmə nöqtəsindən hər hansı üzünə qədər olan məsafə $4$ sm olarsa, kubun həcmini tapın.',
  '[{"key": "A", "text": "$512$ sm$^3$"}, {"key": "B", "text": "$1024$ sm$^3$"}, {"key": "C", "text": "$64$ sm$^3$"}, {"key": "D", "text": "$128$ sm$^3$"}, {"key": "E", "text": "$256$ sm$^3$"}]'::jsonb, 'A', NULL, NULL,
  'Məsafə tilin yarısıdır: $a=8$, $V=512$ sm$^3$.',
  2025, 'II', 284, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0085 | əsas: 2025 toplu, II hissə, səh.284 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0085', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın və piramidanın həcmi. Kəsik piramidanın həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Kubun diaqonallarının kəsişmə nöqtəsindən hər hansı üzünə qədər olan məsafə $5$ sm olarsa, kubun həcmini tapın.',
  '[{"key": "A", "text": "$250$ sm$^3$"}, {"key": "B", "text": "$125$ sm$^3$"}, {"key": "C", "text": "$100$ sm$^3$"}, {"key": "D", "text": "$1000$ sm$^3$"}, {"key": "E", "text": "$500$ sm$^3$"}]'::jsonb, 'D', NULL, NULL,
  '$a=10$, $V=1000$ sm$^3$.',
  2025, 'II', 284, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0086 | əsas: 2025 toplu, II hissə, səh.287 №73
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0086', '/images/tasks/STR-0086.png', 'Kubun açılışı: altı kvadrat; birinci sıranın sol kvadratında M, ikinci kvadratın üstündəki kvadratda N – diaqonalların kəsişmə nöqtələri', (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın və piramidanın həcmi. Kəsik piramidanın həcmi'), 'original', 'own', 'az', 'draft', 'written',
  'Kubun açılışında iki üzünün diaqonallarının $M$ və $N$ kəsişmə nöqtələri arasındakı məsafə $5\sqrt2$ olarsa, onun həcmini tapın.',
  NULL, NULL, NULL, '125',
  'Açılışda $M$ və $N$ qonşu üzlərin mərkəzləridir: onlar arasında üfüqi və şaquli istiqamətdə məsafə tilə bərabərdir, yəni $MN=a\sqrt2=5\sqrt2\Rightarrow a=5$, $V=125$.',
  2025, 'II', 287, 73)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0087 | əsas: 2025 toplu, II hissə, səh.289 №104
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0087', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın və piramidanın həcmi. Kəsik piramidanın həcmi'), 'original', 'own', 'az', 'draft', 'written',
  'Düz prizmanın oturacağı trapesiyadır. Prizmanın paralel olan yan üzlərinin sahələri $6$ və $14$, onlar arasındakı məsafə isə $4$-ə bərabərdir. Prizmanın həcmini tapın.',
  NULL, NULL, NULL, '40',
  'Paralel üzlər $a\cdot h$ və $b\cdot h$, aralarındakı məsafə trapesiyanın hündürlüyüdür. $V=\dfrac{a+b}{2}\cdot4\cdot h=\dfrac{(6+14)\cdot4}{2}=40$.',
  2025, 'II', 289, 104)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0088 | əsas: 2025 toplu, II hissə, səh.289 №105
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0088', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın və piramidanın həcmi. Kəsik piramidanın həcmi'), 'original', 'own', 'az', 'draft', 'written',
  'Həcmi $60$-a bərabər olan düz prizmanın oturacağı trapesiyadır. Prizmanın paralel olan yan üzlərinin sahələri $9$ və $15$-ə bərabərdir. Paralel yan üzlər arasındakı məsafəni tapın.',
  NULL, NULL, NULL, '5',
  '$V=\dfrac{(9+15)d}{2}=12d=60\Rightarrow d=5$.',
  2025, 'II', 289, 105)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0089 | əsas: 2025 toplu, II hissə, səh.290 №122
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0089', '/images/tasks/STR-0089.png', 'Kub; bir təpəsindən çıxan şaquli tilin yuxarı ucu ilə oturacaqdakı C təpəsindən 4 və 6 sm məsafədəki B və A nöqtələrindən düzəldilmiş piramida', (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın və piramidanın həcmi. Kəsik piramidanın həcmi'), 'original', 'own', 'az', 'draft', 'written',
  'Tili $12$ sm olan kubdan $CB=4$ sm, $CA=6$ sm olmaqla piramida kəsilmişdir (piramidanın təpəsi $C$-dən keçən tilin digər ucundadır). Alınan piramidanın həcminin kubun həcminə nisbətini tapın.',
  NULL, NULL, NULL, '1/36',
  'Piramidanın oturacağı katetləri $4$ və $6$ olan düzbucaqlı üçbucaq, hündürlüyü kubun tili $12$-dir: $V_p=\dfrac13\cdot12\cdot12=48$. $V_k=1728$. Nisbət $\dfrac{48}{1728}=\dfrac{1}{36}$.',
  2025, 'II', 290, 122)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0090 | əsas: 2025 toplu, II hissə, səh.291 №126
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0090', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın və piramidanın həcmi. Kəsik piramidanın həcmi'), 'original', 'own', 'az', 'draft', 'written',
  'Həcmi $96$ olan düz prizmanın oturacağı düzbucaqlı üçbucaqdır. Bu prizmanın oturacağının katetləri və yan tili uyğun olaraq $3:4:2$ nisbətində olarsa, onun yan səthinin sahəsini tapın.',
  NULL, NULL, NULL, '96',
  'Katetlər $3k$, $4k$, yan til $2k$: $V=\dfrac{3k\cdot4k}{2}\cdot2k=12k^3=96\Rightarrow k=2$. Katetlər $6$, $8$, hipotenuz $10$, yan til $4$. $S_{yan}=24\cdot4=96$.',
  2025, 'II', 291, 126)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0091 | əsas: 2025 toplu, II hissə, səh.291 №127
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0091', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın və piramidanın həcmi. Kəsik piramidanın həcmi'), 'original', 'own', 'az', 'draft', 'written',
  'Həcmi $240$ olan düz prizmanın oturacağı düzbucaqlı üçbucaqdır. Bu prizmanın oturacağının katetləri və yan tili uyğun olaraq $5:12:1$ nisbətində olarsa, onun yan səthinin sahəsini tapın.',
  NULL, NULL, NULL, '120',
  '$V=\dfrac{5k\cdot12k}{2}\cdot k=30k^3=240\Rightarrow k=2$. Katetlər $10$, $24$, hipotenuz $26$, yan til $2$. $S_{yan}=60\cdot2=120$.',
  2025, 'II', 291, 127)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0092 | əsas: 2025 toplu, II hissə, səh.292 №131
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0092', '/images/tasks/STR-0092.png', 'Aşağı hissəsi düzbucaqlı paralelepiped, yuxarısı piramida olan qab; dibində az miqdarda su', (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın və piramidanın həcmi. Kəsik piramidanın həcmi'), 'original', 'own', 'az', 'draft', 'written',
  'Aşağı hissəsi düzbucaqlı paralelepiped, yuxarı hissəsi isə oturacağı paralelepipedin üst oturacağı ilə eyni olan piramidadan ibarət qapalı qabın ümumi hündürlüyü $14$ dm-dir. Paralelepipedin oturacağının ölçüləri $2$ dm və $6$ dm, hündürlüyü isə $8$ dm-ə bərabərdir. Qabın daxilindəki suyun hündürlüyü $0{,}25$ dm olarsa, qabı tərsinə çevirsək, suyun hündürlüyü neçə dm olar?',
  NULL, NULL, NULL, '3',
  'Piramidanın hündürlüyü $14-8=6$, həcmi $\dfrac13\cdot12\cdot6=24$. Suyun həcmi $12\cdot0{,}25=3$. Çevirdikdə su piramidanın təpə hissəsində ona oxşar piramida əmələ gətirir: $24\left(\dfrac x6\right)^3=3\Rightarrow x^3=27$, $x=3$ dm.',
  2025, 'II', 292, 131)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0093 | əsas: 2025 toplu, II hissə, səh.292 №132
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0093', '/images/tasks/STR-0093.png', 'Yuxarı hissəsi paralelepiped, aşağısı təpəsi aşağı yönəlmiş piramida olan qab; piramidanın içində su', (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Prizmanın və piramidanın həcmi. Kəsik piramidanın həcmi'), 'original', 'own', 'az', 'draft', 'written',
  'Yuxarı hissəsi düzbucaqlı paralelepiped, aşağı hissəsi isə oturacağı paralelepipedin alt oturacağı ilə eyni olan piramidadan ibarət qapalı qabın ümumi hündürlüyü $18$ dm-dir. Paralelepipedin oturacağının ölçüləri $2$ dm və $3$ dm, hündürlüyü isə $6$ dm-ə bərabərdir. Qabın daxilindəki suyun hündürlüyü $6$ dm olarsa, qabı tərsinə çevirsək, suyun hündürlüyü neçə dm olar?',
  NULL, NULL, NULL, '0,5',
  'Piramidanın hündürlüyü $12$, həcmi $\dfrac13\cdot6\cdot12=24$. Su piramidanın təpəsində ona oxşar (əmsal $\dfrac12$) piramidadır: $V_s=24\cdot\dfrac18=3$. Çevirdikdə su paralelepipedin dibində olur: $\dfrac{3}{6}=0{,}5$ dm.',
  2025, 'II', 292, 132)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0094 | əsas: 2025 toplu, II hissə, səh.293 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0094', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Silindr və onun müstəvi kəsikləri. Silindrin səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Silindrin oturacağının diametri $12$ sm, hündürlüyü isə $5$ sm-dir. Silindrin həcmini tapın.',
  '[{"key": "A", "text": "$90 \\pi$ sm$^3$"}, {"key": "B", "text": "$180 \\pi$ sm$^3$"}, {"key": "C", "text": "$720 \\pi$ sm$^3$"}, {"key": "D", "text": "$60 \\pi$ sm$^3$"}, {"key": "E", "text": "$360 \\pi$ sm$^3$"}]'::jsonb, 'B', NULL, NULL,
  '$r=6$: $V=\pi\cdot36\cdot5=180\pi$ sm$^3$.',
  2025, 'II', 293, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0095 | əsas: 2025 toplu, II hissə, səh.293 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0095', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Silindr və onun müstəvi kəsikləri. Silindrin səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Ox kəsiyinin diaqonalı $17$ sm, hündürlüyü $8$ sm olan silindrin oturacağının radiusunu tapın.',
  '[{"key": "A", "text": "$\\dfrac{17}{2}$ sm"}, {"key": "B", "text": "$9$ sm"}, {"key": "C", "text": "$15$ sm"}, {"key": "D", "text": "$8$ sm"}, {"key": "E", "text": "$\\dfrac{15}{2}$ sm"}]'::jsonb, 'E', NULL, NULL,
  'Ox kəsiyi düzbucaqlıdır: diametr $\sqrt{289-64}=15$, $r=7{,}5$ sm.',
  2025, 'II', 293, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0096 | əsas: 2025 toplu, II hissə, səh.293 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0096', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Silindr və onun müstəvi kəsikləri. Silindrin səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Silindrin oturacağının radiusu $4$ və hündürlüyü $7$ olarsa, yan səthinin sahəsini tapın.',
  '[{"key": "A", "text": "$112 \\pi$"}, {"key": "B", "text": "$28 \\pi$"}, {"key": "C", "text": "$32 \\pi$"}, {"key": "D", "text": "$56 \\pi$"}, {"key": "E", "text": "$44 \\pi$"}]'::jsonb, 'D', NULL, NULL,
  '$S=2\pi rh=2\pi\cdot4\cdot7=56\pi$.',
  2025, 'II', 293, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0097 | əsas: 2025 toplu, II hissə, səh.293 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0097', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Silindr və onun müstəvi kəsikləri. Silindrin səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Silindrin oturacağının radiusu $5$ və hündürlüyü $3$ olarsa, yan səthinin sahəsini tapın.',
  '[{"key": "A", "text": "$75 \\pi$"}, {"key": "B", "text": "$25 \\pi$"}, {"key": "C", "text": "$50 \\pi$"}, {"key": "D", "text": "$30 \\pi$"}, {"key": "E", "text": "$15 \\pi$"}]'::jsonb, 'D', NULL, NULL,
  '$2\pi\cdot5\cdot3=30\pi$.',
  2025, 'II', 293, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0098 | əsas: 2025 toplu, II hissə, səh.293 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0098', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Silindr və onun müstəvi kəsikləri. Silindrin səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Silindrin hündürlüyü $3$ dəfə, oturacağının diametri $2$ dəfə artırılarsa, həcmi necə dəyişər?',
  '[{"key": "A", "text": "$6$ dəfə artar"}, {"key": "B", "text": "$18$ dəfə artar"}, {"key": "C", "text": "$12$ dəfə artar"}, {"key": "D", "text": "$36$ dəfə artar"}, {"key": "E", "text": "$12$ dəfə azalar"}]'::jsonb, 'C', NULL, NULL,
  '$V=\pi r^2h$: $2^2\cdot3=12$ dəfə artar.',
  2025, 'II', 293, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0099 | əsas: 2025 toplu, II hissə, səh.293 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0099', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Silindr və onun müstəvi kəsikləri. Silindrin səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Silindrin həm hündürlüyü, həm də oturacağının diametri $50\%$ azalarsa, silindrin həcmi necə dəyişər?',
  '[{"key": "A", "text": "$2$ dəfə azalar"}, {"key": "B", "text": "$8$ dəfə azalar"}, {"key": "C", "text": "$8$ dəfə artar"}, {"key": "D", "text": "$16$ dəfə azalar"}, {"key": "E", "text": "$4$ dəfə azalar"}]'::jsonb, 'B', NULL, NULL,
  'Hər ölçü $2$ dəfə azalır: $\left(\dfrac12\right)^2\cdot\dfrac12=\dfrac18$ – $8$ dəfə azalar.',
  2025, 'II', 293, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0100 | əsas: 2025 toplu, II hissə, səh.294 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0100', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Silindr və onun müstəvi kəsikləri. Silindrin səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Silindrin ox kəsiyi diaqonalı $10\sqrt2$ sm-ə bərabər olan kvadratdır. Silindrin oturacağının radiusunu tapın.',
  '[{"key": "A", "text": "$5$ sm"}, {"key": "B", "text": "$10 \\sqrt{2}$ sm"}, {"key": "C", "text": "$10$ sm"}, {"key": "D", "text": "$5 \\sqrt{2}$ sm"}, {"key": "E", "text": "$\\dfrac{5 \\sqrt{2}}{2}$ sm"}]'::jsonb, 'A', NULL, NULL,
  'Kvadratın tərəfi $\dfrac{10\sqrt2}{\sqrt2}=10$ – diametrdir, $r=5$ sm.',
  2025, 'II', 294, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0101 | əsas: 2025 toplu, II hissə, səh.294 №34
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0101', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Silindr və onun müstəvi kəsikləri. Silindrin səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'written',
  'Ox kəsiyi kvadrat olan silindrin oturacağının sahəsi $9\pi$-dir. Silindrin ox kəsiyinin sahəsini tapın.',
  NULL, NULL, NULL, '36',
  '$r=3$, kvadratın tərəfi $2r=6$, sahəsi $36$.',
  2025, 'II', 294, 34)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0102 | əsas: 2025 toplu, II hissə, səh.296 №63
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0102', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Silindr və onun müstəvi kəsikləri. Silindrin səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'written',
  'Tam səthinin sahəsi $50\pi$ və yan səthinin sahəsi $32\pi$ olan silindrin həcmini tapın $(\pi=3)$.',
  NULL, NULL, NULL, '144',
  '$2\pi r^2=18\pi\Rightarrow r=3$. $2\pi\cdot3h=32\pi\Rightarrow h=\dfrac{16}{3}$. $V=\pi r^2h=3\cdot9\cdot\dfrac{16}{3}=144$.',
  2025, 'II', 296, 63)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0103 | əsas: 2025 toplu, II hissə, səh.296 №64
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0103', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Silindr və onun müstəvi kəsikləri. Silindrin səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'written',
  'Tam səthinin sahəsi $112\pi$ və yan səthinin sahəsi $80\pi$ olan silindrin həcmini tapın $(\pi=3)$.',
  NULL, NULL, NULL, '480',
  '$2\pi r^2=32\pi\Rightarrow r=4$. $8\pi h=80\pi\Rightarrow h=10$. $V=3\cdot16\cdot10=480$.',
  2025, 'II', 296, 64)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0104 | əsas: 2025 toplu, II hissə, səh.298 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0104', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Konus və onun müstəvi kəsikləri. Konusun və kəsik konusun səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Oturacağının sahəsi $15\pi$ sm$^2$, hündürlüyü $4$ sm olan konusun həcmini tapın.',
  '[{"key": "A", "text": "$60 \\pi$ sm$^3$"}, {"key": "B", "text": "$20 \\pi$ sm$^3$"}, {"key": "C", "text": "$45 \\pi$ sm$^3$"}, {"key": "D", "text": "$30 \\pi$ sm$^3$"}, {"key": "E", "text": "$10 \\pi$ sm$^3$"}]'::jsonb, 'B', NULL, NULL,
  '$V=\dfrac13\cdot15\pi\cdot4=20\pi$ sm$^3$.',
  2025, 'II', 298, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0105 | əsas: 2025 toplu, II hissə, səh.298 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0105', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Konus və onun müstəvi kəsikləri. Konusun və kəsik konusun səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Oturacağının sahəsi $24\pi$ sm$^2$, hündürlüyü $5$ sm olan konusun həcmini tapın.',
  '[{"key": "A", "text": "$60 \\pi$ sm$^3$"}, {"key": "B", "text": "$30 \\pi$ sm$^3$"}, {"key": "C", "text": "$40 \\pi$ sm$^3$"}, {"key": "D", "text": "$120 \\pi$ sm$^3$"}, {"key": "E", "text": "$80 \\pi$ sm$^3$"}]'::jsonb, 'C', NULL, NULL,
  '$V=\dfrac13\cdot24\pi\cdot5=40\pi$ sm$^3$.',
  2025, 'II', 298, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0106 | əsas: 2025 toplu, II hissə, səh.298 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0106', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Konus və onun müstəvi kəsikləri. Konusun və kəsik konusun səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Konusun doğuranı $5\sqrt2$ sm, ox kəsiyinin təpə bucağı $90^\circ$-dir. Konusun oturacağının sahəsini tapın.',
  '[{"key": "A", "text": "$25 \\pi$ sm$^2$"}, {"key": "B", "text": "$50 \\pi$ sm$^2$"}, {"key": "C", "text": "$5 \\sqrt{2} \\pi$ sm$^2$"}, {"key": "D", "text": "$\\dfrac{25 \\pi}{2}$ sm$^2$"}, {"key": "E", "text": "$10 \\pi$ sm$^2$"}]'::jsonb, 'A', NULL, NULL,
  'Ox kəsiyi bərabəryanlı düzbucaqlı üçbucaqdır: $r=h=\dfrac{l}{\sqrt2}=5$. $S=25\pi$ sm$^2$.',
  2025, 'II', 298, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0107 | əsas: 2025 toplu, II hissə, səh.298 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0107', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Konus və onun müstəvi kəsikləri. Konusun və kəsik konusun səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Konusun doğuranı $3\sqrt2$ sm, ox kəsiyinin təpə bucağı $90^\circ$ olarsa, konusun həcmini tapın.',
  '[{"key": "A", "text": "$9 \\pi$ sm$^3$"}, {"key": "B", "text": "$27 \\pi$ sm$^3$"}, {"key": "C", "text": "$9 \\sqrt{2} \\pi$ sm$^3$"}, {"key": "D", "text": "$3 \\pi$ sm$^3$"}, {"key": "E", "text": "$18 \\pi$ sm$^3$"}]'::jsonb, 'A', NULL, NULL,
  '$r=h=3$: $V=\dfrac13\pi\cdot9\cdot3=9\pi$ sm$^3$.',
  2025, 'II', 298, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0108 | əsas: 2025 toplu, II hissə, səh.298 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0108', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Konus və onun müstəvi kəsikləri. Konusun və kəsik konusun səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Konusun doğuranı $4\sqrt2$ sm, ox kəsiyinin təpə bucağı $90^\circ$-dir. Konusun oturacağının sahəsini tapın.',
  '[{"key": "A", "text": "$8 \\pi$ sm$^2$"}, {"key": "B", "text": "$4 \\sqrt{2} \\pi$ sm$^2$"}, {"key": "C", "text": "$16 \\pi$ sm$^2$"}, {"key": "D", "text": "$32 \\pi$ sm$^2$"}, {"key": "E", "text": "$16 \\sqrt{2} \\pi$ sm$^2$"}]'::jsonb, 'C', NULL, NULL,
  '$r=\dfrac{4\sqrt2}{\sqrt2}=4$, $S=16\pi$ sm$^2$.',
  2025, 'II', 298, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0109 | əsas: 2025 toplu, II hissə, səh.298 №18
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0109', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Konus və onun müstəvi kəsikləri. Konusun və kəsik konusun səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Konusun doğuranı $8$ sm olub oturacaq müstəvisi ilə $60^\circ$-li bucaq əmələ gətirir. Konusun həcmini tapın.',
  '[{"key": "A", "text": "$\\dfrac{64 \\pi}{3}$ sm$^3$"}, {"key": "B", "text": "$64 \\sqrt{3} \\pi$ sm$^3$"}, {"key": "C", "text": "$64 \\pi$ sm$^3$"}, {"key": "D", "text": "$32 \\sqrt{3} \\pi$ sm$^3$"}, {"key": "E", "text": "$\\dfrac{64 \\sqrt{3} \\pi}{3}$ sm$^3$"}]'::jsonb, 'E', NULL, NULL,
  '$r=8\cos60^\circ=4$, $h=8\sin60^\circ=4\sqrt3$. $V=\dfrac13\pi\cdot16\cdot4\sqrt3=\dfrac{64\sqrt3}{3}\pi$ sm$^3$.',
  2025, 'II', 298, 18)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0110 | əsas: 2025 toplu, II hissə, səh.298 №19
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0110', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Konus və onun müstəvi kəsikləri. Konusun və kəsik konusun səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Konusun doğuranı $12$ sm olub oturacaq müstəvisi ilə $30^\circ$-li bucaq əmələ gətirir. Konusun həcmini tapın.',
  '[{"key": "A", "text": "$648 \\pi$ sm$^3$"}, {"key": "B", "text": "$216 \\pi$ sm$^3$"}, {"key": "C", "text": "$216 \\sqrt{3} \\pi$ sm$^3$"}, {"key": "D", "text": "$72 \\sqrt{3} \\pi$ sm$^3$"}, {"key": "E", "text": "$108 \\pi$ sm$^3$"}]'::jsonb, 'B', NULL, NULL,
  '$r=12\cos30^\circ=6\sqrt3$, $h=6$. $V=\dfrac13\pi\cdot108\cdot6=216\pi$ sm$^3$.',
  2025, 'II', 298, 19)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0111 | əsas: 2025 toplu, II hissə, səh.299 №27
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0111', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Konus və onun müstəvi kəsikləri. Konusun və kəsik konusun səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Konusun ox kəsiyi sahəsi $25$ sm$^2$ olan bərabəryanlı düzbucaqlı üçbucaqdır. Konusun həcmini tapın.',
  '[{"key": "A", "text": "$25 \\pi$ sm$^3$"}, {"key": "B", "text": "$\\dfrac{250 \\pi}{3}$ sm$^3$"}, {"key": "C", "text": "$125 \\pi$ sm$^3$"}, {"key": "D", "text": "$\\dfrac{125 \\pi}{3}$ sm$^3$"}, {"key": "E", "text": "$\\dfrac{125 \\pi}{6}$ sm$^3$"}]'::jsonb, 'D', NULL, NULL,
  'Ox kəsiyinin sahəsi $r\cdot h=r^2=25\Rightarrow r=h=5$. $V=\dfrac13\pi\cdot25\cdot5=\dfrac{125\pi}{3}$ sm$^3$.',
  2025, 'II', 299, 27)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0112 | əsas: 2025 toplu, II hissə, səh.299 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0112', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Konus və onun müstəvi kəsikləri. Konusun və kəsik konusun səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Ox kəsiyi bərabərtərəfli üçbucaq olan konusun oturacağının sahəsi $9$ sm$^2$ olarsa, onun həcmini tapın.',
  '[{"key": "A", "text": "$3\\sqrt{3\\pi}$ sm$^3$"}, {"key": "B", "text": "$9\\sqrt\\pi$ sm$^3$"}, {"key": "C", "text": "$\\dfrac{9\\sqrt3}{\\sqrt\\pi}$ sm$^3$"}, {"key": "D", "text": "$\\dfrac{27\\sqrt3}{\\sqrt\\pi}$ sm$^3$"}, {"key": "E", "text": "$9\\sqrt3$ sm$^3$"}]'::jsonb, 'C', NULL, NULL,
  '$\pi r^2=9\Rightarrow r=\dfrac{3}{\sqrt\pi}$, $h=r\sqrt3$. $V=\dfrac13\cdot9\cdot\dfrac{3\sqrt3}{\sqrt\pi}=\dfrac{9\sqrt3}{\sqrt\pi}$ sm$^3$.',
  2025, 'II', 299, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0113 | əsas: 2025 toplu, II hissə, səh.300 №47
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0113', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Konus və onun müstəvi kəsikləri. Konusun və kəsik konusun səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Doğuranı $l$, hündürlüyü $h$ olan konusun ox kəsiyinin təpə bucağı düz bucaqdır. $l^2-h^2=16$ olarsa, konusun həcmini tapın.',
  '[{"key": "A", "text": "$32 \\pi$"}, {"key": "B", "text": "$\\dfrac{32 \\pi}{3}$"}, {"key": "C", "text": "$64 \\pi$"}, {"key": "D", "text": "$\\dfrac{64 \\pi}{3}$"}, {"key": "E", "text": "$16 \\pi$"}]'::jsonb, 'D', NULL, NULL,
  '$l^2-h^2=r^2=16\Rightarrow r=4$; düz təpə bucağında $h=r=4$. $V=\dfrac13\pi\cdot16\cdot4=\dfrac{64\pi}{3}$.',
  2025, 'II', 300, 47)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0114 | əsas: 2025 toplu, II hissə, səh.300 №48
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0114', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Konus və onun müstəvi kəsikləri. Konusun və kəsik konusun səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'closed',
  'Doğuranı $l$, hündürlüyü $h$ olan konusun ox kəsiyinin təpə bucağı düz bucaqdır. $l^2-h^2=36$ olarsa, konusun həcmini tapın.',
  '[{"key": "A", "text": "$36 \\pi$"}, {"key": "B", "text": "$144 \\pi$"}, {"key": "C", "text": "$72 \\pi$"}, {"key": "D", "text": "$108 \\pi$"}, {"key": "E", "text": "$216 \\pi$"}]'::jsonb, 'C', NULL, NULL,
  '$r^2=36\Rightarrow r=h=6$. $V=\dfrac13\pi\cdot36\cdot6=72\pi$.',
  2025, 'II', 300, 48)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0115 | əsas: 2025 toplu, II hissə, səh.300 №55
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0115', '/images/tasks/STR-0115.png', 'Konus: A təpəsi, O oturacağın mərkəzi, oturacağın çevrəsi üzərində M, N, K nöqtələri və onlara çəkilmiş doğuranlar', (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Konus və onun müstəvi kəsikləri. Konusun və kəsik konusun səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'written',
  'Oturacağının radiusu $3$, hündürlüyü $AO=4$ olan konusun oturacağının çevrəsi üzərində $M$, $N$ və $K$ nöqtələri götürülmüşdür. $AM+AN+AK$ cəmini tapın.',
  NULL, NULL, NULL, '15',
  'Hər biri doğurandır: $l=\sqrt{3^2+4^2}=5$. Cəm $3\cdot5=15$.',
  2025, 'II', 300, 55)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0116 | əsas: 2025 toplu, II hissə, səh.301 №56
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0116', '/images/tasks/STR-0116.png', 'Konus: A təpəsi, O oturacağın mərkəzi, oturacağın çevrəsi üzərində M, N, K nöqtələri və onlara çəkilmiş doğuranlar', (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Konus və onun müstəvi kəsikləri. Konusun və kəsik konusun səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'written',
  'Oturacağının radiusu $\sqrt{11}$, hündürlüyü $AO=5$ olan konusun oturacağının çevrəsi üzərində $M$, $N$ və $K$ nöqtələri götürülmüşdür. $AM+AN+AK$ cəmini tapın.',
  NULL, NULL, NULL, '18',
  '$l=\sqrt{11+25}=6$. Cəm $18$.',
  2025, 'II', 301, 56)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0117 | əsas: 2025 toplu, II hissə, səh.301 №72
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0117', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Konus və onun müstəvi kəsikləri. Konusun və kəsik konusun səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'written',
  'Həcmləri $V_1$, $V_2$, uyğun olaraq oturacaqlarının radiusları $r_1$, $r_2$, hündürlükləri $h_1$, $h_2$ olan iki konus verilmişdir. $r_1:r_2=4:3$, $h_1:h_2=9:8$ olarsa, $\dfrac{V_1}{V_2}$ nisbətini tapın.',
  NULL, NULL, NULL, '2',
  '$\dfrac{V_1}{V_2}=\left(\dfrac{r_1}{r_2}\right)^2\cdot\dfrac{h_1}{h_2}=\dfrac{16}{9}\cdot\dfrac98=2$.',
  2025, 'II', 301, 72)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0118 | əsas: 2025 toplu, II hissə, səh.303 №105
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0118', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Konus və onun müstəvi kəsikləri. Konusun və kəsik konusun səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'written',
  '$y=|x|$ funksiyasının $x\in[1;4]$ parçasındakı qrafikinin absis oxu ətrafında fırlanmasından alınan cismin həcmini tapın $(\pi=3)$.',
  NULL, NULL, NULL, '63',
  'Kəsik konus alınır: $V=\pi\displaystyle\int_1^4x^2dx=\pi\cdot\dfrac{64-1}{3}=21\pi=63$.',
  2025, 'II', 303, 105)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0119 | əsas: 2025 toplu, II hissə, səh.303 №106
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0119', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Konus və onun müstəvi kəsikləri. Konusun və kəsik konusun səthinin sahəsi və həcmi'), 'original', 'own', 'az', 'draft', 'written',
  '$y=|x|$ funksiyasının $x\in[2;4]$ parçasındakı qrafikinin absis oxu ətrafında fırlanmasından alınan cismin həcmini tapın $(\pi=3)$.',
  NULL, NULL, NULL, '56',
  '$V=\pi\cdot\dfrac{64-8}{3}=\dfrac{56\pi}{3}=56$.',
  2025, 'II', 303, 106)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0120 | əsas: 2025 toplu, II hissə, səh.304 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0120', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Kürə və onun həcmi. Sfera və onun səthinin sahəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Sferanın diametrini $4$ dəfə azaltdıqda onun sahəsi necə dəyişər?',
  '[{"key": "A", "text": "$4$ dəfə azalar"}, {"key": "B", "text": "$64$ dəfə azalar"}, {"key": "C", "text": "$16$ dəfə azalar"}, {"key": "D", "text": "$16$ dəfə artar"}, {"key": "E", "text": "$8$ dəfə azalar"}]'::jsonb, 'C', NULL, NULL,
  'Sahə radiusun kvadratı ilə mütənasibdir: $4^2=16$ dəfə azalar.',
  2025, 'II', 304, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0121 | əsas: 2025 toplu, II hissə, səh.304 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0121', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Kürə və onun həcmi. Sfera və onun səthinin sahəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Həcmi $36\pi$ sm$^3$-ə bərabər olan kürənin radiusunu tapın.',
  '[{"key": "A", "text": "$27$ sm"}, {"key": "B", "text": "$6$ sm"}, {"key": "C", "text": "$3$ sm"}, {"key": "D", "text": "$6^{\\dfrac{2}{3}}$ sm"}, {"key": "E", "text": "$9$ sm"}]'::jsonb, 'C', NULL, NULL,
  '$\dfrac43\pi R^3=36\pi\Rightarrow R^3=27$, $R=3$ sm.',
  2025, 'II', 304, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0122 | əsas: 2025 toplu, II hissə, səh.304 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0122', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Kürə və onun həcmi. Sfera və onun səthinin sahəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Həcmi $250\pi$ sm$^3$-ə bərabər olan kürənin radiusunu tapın.',
  '[{"key": "A", "text": "$\\sqrt[3]{375}$ sm"}, {"key": "B", "text": "$\\sqrt[3]{250}$ sm"}, {"key": "C", "text": "$5$ sm"}, {"key": "D", "text": "$\\dfrac{375}{2}$ sm"}, {"key": "E", "text": "$\\sqrt[3]{\\dfrac{375}{2}}$ sm"}]'::jsonb, 'E', NULL, NULL,
  '$R^3=\dfrac{3\cdot250}{4}=\dfrac{375}{2}$, $R=\sqrt[3]{\dfrac{375}{2}}$ sm.',
  2025, 'II', 304, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0123 | əsas: 2025 toplu, II hissə, səh.304 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0123', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Kürə və onun həcmi. Sfera və onun səthinin sahəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Radiusu $R$-ə bərabər olan kürənin həcmi hansı düsturla hesablanır?',
  '[{"key": "A", "text": "$\\dfrac{4\\pi R^3}{3}$"}, {"key": "B", "text": "$4\\pi R^2$"}, {"key": "C", "text": "$\\dfrac{\\pi R^3}{6}$"}, {"key": "D", "text": "$\\dfrac{8\\pi R^3}{3}$"}, {"key": "E", "text": "$\\dfrac{3\\pi R^3}{4}$"}]'::jsonb, 'A', NULL, NULL,
  '$V=\dfrac43\pi R^3$.',
  2025, 'II', 304, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0124 | əsas: 2025 toplu, II hissə, səh.304 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0124', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Kürə və onun həcmi. Sfera və onun səthinin sahəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Kürənin radiusunu necə dəyişmək lazımdır ki, həcmi $27$ dəfə azalsın?',
  '[{"key": "A", "text": "$27$ dəfə azaltmaq"}, {"key": "B", "text": "$3$ dəfə artırmaq"}, {"key": "C", "text": "$\\sqrt[3]{3}$ dəfə azaltmaq"}, {"key": "D", "text": "$9$ dəfə azaltmaq"}, {"key": "E", "text": "$3$ dəfə azaltmaq"}]'::jsonb, 'E', NULL, NULL,
  '$V\sim R^3$: $\sqrt[3]{27}=3$ dəfə azaltmaq lazımdır.',
  2025, 'II', 304, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0125 | əsas: 2025 toplu, II hissə, səh.304 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0125', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Kürə və onun həcmi. Sfera və onun səthinin sahəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'İki sferanın səthlərinin sahələri nisbəti $49:4$-dür. Bu sferaların radiuslarının nisbətini tapın.',
  '[{"key": "A", "text": "$2:7$"}, {"key": "B", "text": "$7:2$"}, {"key": "C", "text": "$49:4$"}, {"key": "D", "text": "$7:1$"}, {"key": "E", "text": "$343:8$"}]'::jsonb, 'B', NULL, NULL,
  '$\dfrac{R_1}{R_2}=\sqrt{\dfrac{49}{4}}=\dfrac72$.',
  2025, 'II', 304, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0126 | əsas: 2025 toplu, II hissə, səh.304 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0126', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Kürə və onun həcmi. Sfera və onun səthinin sahəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'İki kürənin həcmləri nisbəti $27:8$-dir. Bu kürələrin radiusları nisbətini tapın.',
  '[{"key": "A", "text": "$27:8$"}, {"key": "B", "text": "$3\\sqrt6:4$"}, {"key": "C", "text": "$2:3$"}, {"key": "D", "text": "$9:4$"}, {"key": "E", "text": "$3:2$"}]'::jsonb, 'E', NULL, NULL,
  '$\sqrt[3]{\dfrac{27}{8}}=\dfrac32$.',
  2025, 'II', 304, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0127 | əsas: 2025 toplu, II hissə, səh.304 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0127', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Kürə və onun həcmi. Sfera və onun səthinin sahəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Kürənin səthinin sahəsi $100\pi$ olarsa, onun həcmini tapın.',
  '[{"key": "A", "text": "$500 \\pi$"}, {"key": "B", "text": "$\\dfrac{500 \\pi}{3}$"}, {"key": "C", "text": "$\\dfrac{1000 \\pi}{3}$"}, {"key": "D", "text": "$125 \\pi$"}, {"key": "E", "text": "$100 \\pi$"}]'::jsonb, 'B', NULL, NULL,
  '$4\pi R^2=100\pi\Rightarrow R=5$. $V=\dfrac43\pi\cdot125=\dfrac{500\pi}{3}$.',
  2025, 'II', 304, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0128 | əsas: 2025 toplu, II hissə, səh.304 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0128', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Kürə və onun həcmi. Sfera və onun səthinin sahəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Kürənin səthinin sahəsi $64\pi$ sm$^2$ olarsa, onun həcmini tapın.',
  '[{"key": "A", "text": "$256 \\pi$ sm$^3$"}, {"key": "B", "text": "$\\dfrac{256 \\pi}{3}$ sm$^3$"}, {"key": "C", "text": "$64 \\pi$ sm$^3$"}, {"key": "D", "text": "$\\dfrac{64 \\pi}{3}$ sm$^3$"}, {"key": "E", "text": "$\\dfrac{128 \\pi}{3}$ sm$^3$"}]'::jsonb, 'B', NULL, NULL,
  '$R=4$. $V=\dfrac43\pi\cdot64=\dfrac{256\pi}{3}$ sm$^3$.',
  2025, 'II', 304, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0129 | əsas: 2025 toplu, II hissə, səh.304 №19
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0129', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Kürə və onun həcmi. Sfera və onun səthinin sahəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Kürənin radiusunu $10\%$ artırdıqda həcmi neçə faiz artar?',
  '[{"key": "A", "text": "$33{,}1\\%$"}, {"key": "B", "text": "$133\\%$"}, {"key": "C", "text": "$10\\%$"}, {"key": "D", "text": "$21\\%$"}, {"key": "E", "text": "$30\\%$"}]'::jsonb, 'A', NULL, NULL,
  '$1{,}1^3=1{,}331$ – həcm $33{,}1\%$ artar.',
  2025, 'II', 304, 19)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0130 | əsas: 2025 toplu, II hissə, səh.305 №20
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0130', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Kürə və onun həcmi. Sfera və onun səthinin sahəsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Sferanın radiusu $20\%$ artırıldıqda, səthinin sahəsi neçə faiz artar?',
  '[{"key": "A", "text": "$144\\%$"}, {"key": "B", "text": "$44\\%$"}, {"key": "C", "text": "$20\\%$"}, {"key": "D", "text": "$72{,}8\\%$"}, {"key": "E", "text": "$40\\%$"}]'::jsonb, 'B', NULL, NULL,
  '$1{,}2^2=1{,}44$ – sahə $44\%$ artar.',
  2025, 'II', 305, 20)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0131 | əsas: 2025 toplu, II hissə, səh.306 №47
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0131', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Kürə və onun həcmi. Sfera və onun səthinin sahəsi'), 'original', 'own', 'az', 'draft', 'written',
  'Sferaya toxunan müstəvi üzərində götürülmüş nöqtədən toxunma nöqtəsinə qədər məsafə $8$ sm, sferanın mərkəzinə qədər məsafə isə $10$ sm-dir. Sferanın sahəsini tapın ($\pi=3$).',
  NULL, NULL, NULL, '432',
  'Radius toxunan müstəviyə perpendikulyardır: $R=\sqrt{10^2-8^2}=6$. $S=4\pi R^2=4\cdot3\cdot36=432$ sm$^2$.',
  2025, 'II', 306, 47)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- STR-0132 | əsas: 2025 toplu, II hissə, səh.306 №48
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('STR-0132', NULL, NULL, (SELECT id FROM topics WHERE name='Stereometriya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Stereometriya' AND s.title='Kürə və onun həcmi. Sfera və onun səthinin sahəsi'), 'original', 'own', 'az', 'draft', 'written',
  'Kürəyə toxunan müstəvi üzərində götürülmüş nöqtədən toxunma nöqtəsinə qədər məsafə $4$ sm, kürənin mərkəzinə qədər məsafə isə $5$ sm-dir. Kürənin həcmini tapın ($\pi=3$).',
  NULL, NULL, NULL, '108',
  '$R=\sqrt{25-16}=3$. $V=\dfrac43\pi R^3=4\cdot27=108$ sm$^3$.',
  2025, 'II', 306, 48)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
