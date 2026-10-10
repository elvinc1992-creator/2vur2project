-- Mövzu: Həndəsənin əsas anlayışları — 40 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- HEA-0001 | əsas: 2025 toplu, I hissə, səh.135 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Düz xətt, şüa, parça. Parçaların ölçülməsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Uzunluğu $54$ sm olan düz xətt parçası üç bərabər hissəyə bölünmüşdür. Kənar hissələrin orta nöqtələri arasındakı məsafəni tapın.',
  '[{"key": "A", "text": "$24$ sm"}, {"key": "B", "text": "$45$ sm"}, {"key": "C", "text": "$36$ sm"}, {"key": "D", "text": "$27$ sm"}, {"key": "E", "text": "$18$ sm"}]'::jsonb, 'C', NULL, NULL,
  'Hər hissə $54:3=18$ sm. Kənar hissələrin orta nöqtələri arasında: yarım hissə + tam orta hissə + yarım hissə $=9+18+9=36$ sm.',
  2025, 'I', 135, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0002 | əsas: 2025 toplu, I hissə, səh.135 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Düz xətt, şüa, parça. Parçaların ölçülməsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Uzunluğu $48$ sm olan düz xətt parçası üç bərabər hissəyə bölünmüşdür. Kənar hissələrin orta nöqtələri arasındakı məsafəni tapın.',
  '[{"key": "A", "text": "$36$ sm"}, {"key": "B", "text": "$24$ sm"}, {"key": "C", "text": "$16$ sm"}, {"key": "D", "text": "$40$ sm"}, {"key": "E", "text": "$32$ sm"}]'::jsonb, 'E', NULL, NULL,
  'Hissə $16$ sm; məsafə $8+16+8=32$ sm (parçanın $\dfrac23$ hissəsi).',
  2025, 'I', 135, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0003 | əsas: 2025 toplu, I hissə, səh.135 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Düz xətt, şüa, parça. Parçaların ölçülməsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Düz xətt üzərində $7$ nöqtə verilmişdir. Alınmış şüaların sayını tapın.',
  '[{"key": "A", "text": "$42$"}, {"key": "B", "text": "$14$"}, {"key": "C", "text": "$12$"}, {"key": "D", "text": "$7$"}, {"key": "E", "text": "$21$"}]'::jsonb, 'B', NULL, NULL,
  'Hər nöqtə iki əks istiqamətli şüanın başlanğıcıdır: $2\cdot7=14$ şüa.',
  2025, 'I', 135, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0004 | əsas: 2025 toplu, I hissə, səh.135 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Düz xətt, şüa, parça. Parçaların ölçülməsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Düz xətt üzərində $7$ nöqtə verilmişdir. Alınmış parçaların sayını tapın.',
  '[{"key": "A", "text": "$28$"}, {"key": "B", "text": "$42$"}, {"key": "C", "text": "$7$"}, {"key": "D", "text": "$21$"}, {"key": "E", "text": "$14$"}]'::jsonb, 'D', NULL, NULL,
  'Hər parça iki nöqtə ilə təyin olunur: $\dfrac{7\cdot6}{2}=21$.',
  2025, 'I', 135, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0005 | əsas: 2025 toplu, I hissə, səh.135 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Düz xətt, şüa, parça. Parçaların ölçülməsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Uzunluğu $45$ sm olan $AB$ düz xətt parçası üzərində $M$ nöqtəsi götürülmüşdür. $AM$ parçasının uzunluğu $MB$ parçasının uzunluğundan $4$ dəfə böyükdür. $MB$ parçasının uzunluğunu tapın.',
  '[{"key": "A", "text": "$5$ sm"}, {"key": "B", "text": "$15$ sm"}, {"key": "C", "text": "$9$ sm"}, {"key": "D", "text": "$36$ sm"}, {"key": "E", "text": "$11{,}25$ sm"}]'::jsonb, 'C', NULL, NULL,
  '$AM=4\cdot MB$, $AM+MB=5\cdot MB=45\Rightarrow MB=9$ sm.',
  2025, 'I', 135, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0006 | əsas: 2025 toplu, I hissə, səh.135 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Düz xətt, şüa, parça. Parçaların ölçülməsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Uzunluğu $60$ sm olan $AB$ düz xətt parçası üzərində $C$ nöqtəsi götürülmüşdür. $AC$ parçasının uzunluğu $CB$ parçasının uzunluğundan $5$ dəfə böyükdür. $CB$ parçasının uzunluğunu tapın.',
  '[{"key": "A", "text": "$15$ sm"}, {"key": "B", "text": "$10$ sm"}, {"key": "C", "text": "$50$ sm"}, {"key": "D", "text": "$12$ sm"}, {"key": "E", "text": "$6$ sm"}]'::jsonb, 'B', NULL, NULL,
  '$6\cdot CB=60\Rightarrow CB=10$ sm.',
  2025, 'I', 135, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0007 | əsas: 2025 toplu, I hissə, səh.135 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0007', '/images/tasks/HEA-0007.png', 'A, C, B nöqtələri olan parça; C nöqtəsi A ilə B arasındadır', (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Düz xətt, şüa, parça. Parçaların ölçülməsi'), 'original', 'own', 'az', 'draft', 'closed',
  'Şəkildə verilmiş $AC$ parçası $CB$-dən $3$ dəfə uzundur. $CB=7$ sm olarsa, $AB$-ni tapın.',
  '[{"key": "A", "text": "$24$ sm"}, {"key": "B", "text": "$21$ sm"}, {"key": "C", "text": "$28$ sm"}, {"key": "D", "text": "$14$ sm"}, {"key": "E", "text": "$35$ sm"}]'::jsonb, 'C', NULL, NULL,
  '$AC=3\cdot7=21$ sm, $AB=AC+CB=21+7=28$ sm.',
  2025, 'I', 135, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0008 | əsas: 2025 toplu, I hissə, səh.135 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0008', '/images/tasks/HEA-0008.png', 'A, C, B nöqtələri olan parça', (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Düz xətt, şüa, parça. Parçaların ölçülməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$AC$ parçası $CB$-dən $40\%$ böyükdür. $CB=15$ sm olarsa, $AB$-ni tapın.',
  '[{"key": "A", "text": "$21$ sm"}, {"key": "B", "text": "$42$ sm"}, {"key": "C", "text": "$51$ sm"}, {"key": "D", "text": "$30$ sm"}, {"key": "E", "text": "$36$ sm"}]'::jsonb, 'E', NULL, NULL,
  '$AC=1{,}4\cdot15=21$ sm, $AB=21+15=36$ sm.',
  2025, 'I', 135, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0009 | əsas: 2025 toplu, I hissə, səh.135 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Düz xətt, şüa, parça. Parçaların ölçülməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$C$ nöqtəsi $AB$ parçasının orta nöqtəsidir. $D$ nöqtəsi isə $A$ ilə $C$ arasında yerləşir. $AD=a,\ BD=b$ olarsa, $DC$-ni tapın.',
  '[{"key": "A", "text": "$\\dfrac{a-b}{2}$"}, {"key": "B", "text": "$b-a$"}, {"key": "C", "text": "$\\dfrac{2b-a}{2}$"}, {"key": "D", "text": "$\\dfrac{b-a}{2}$"}, {"key": "E", "text": "$\\dfrac{a+b}{2}$"}]'::jsonb, 'D', NULL, NULL,
  '$AB=AD+DB=a+b$, $AC=\dfrac{a+b}{2}$. $D$ nöqtəsi $A$ ilə $C$ arasında olduğundan $DC=AC-AD=\dfrac{a+b}{2}-a=\dfrac{b-a}{2}$.',
  2025, 'I', 135, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0010 | əsas: 2025 toplu, I hissə, səh.135 №18
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Düz xətt, şüa, parça. Parçaların ölçülməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$C$ nöqtəsi $AB$ parçasının orta nöqtəsidir. $D$ nöqtəsi $AB$ düz xətti üzərində $B$ nöqtəsindən sağda yerləşir. $AD=a,\ BD=b$ olarsa, $AC$-ni tapın.',
  '[{"key": "A", "text": "$\\dfrac{a-b}{2}$"}, {"key": "B", "text": "$a-b$"}, {"key": "C", "text": "$\\dfrac{a+b}{2}$"}, {"key": "D", "text": "$\\dfrac{a+2b}{2}$"}, {"key": "E", "text": "$\\dfrac{2a-b}{2}$"}]'::jsonb, 'A', NULL, NULL,
  '$D$ nöqtəsi $B$-dən sağda olduğundan $AB=AD-BD=a-b$. $AC=\dfrac{AB}{2}=\dfrac{a-b}{2}$.',
  2025, 'I', 135, 18)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0011 | əsas: 2025 toplu, I hissə, səh.136 №20
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0011', '/images/tasks/HEA-0011.png', 'A, K, B nöqtələri olan parça', (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Düz xətt, şüa, parça. Parçaların ölçülməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$AB$ parçasına daxil olan $K$ nöqtəsi üçün $AB:KB=7:4$ olduqda $AK:AB$ nisbətini tapın.',
  '[{"key": "A", "text": "$7:3$"}, {"key": "B", "text": "$3:7$"}, {"key": "C", "text": "$3:4$"}, {"key": "D", "text": "$4:7$"}, {"key": "E", "text": "$4:3$"}]'::jsonb, 'B', NULL, NULL,
  '$AB=7t$, $KB=4t$, onda $AK=3t$. $AK:AB=3:7$.',
  2025, 'I', 136, 20)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0012 | əsas: 2025 toplu, I hissə, səh.136 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0012', '/images/tasks/HEA-0012.png', 'E, M, F nöqtələri olan parça', (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Düz xətt, şüa, parça. Parçaların ölçülməsi'), 'original', 'own', 'az', 'draft', 'closed',
  '$M$ nöqtəsi $EF$ parçasını $EM:MF=3:4$ nisbətində iki hissəyə ayırır. $EF:EM$ nisbətini tapın.',
  '[{"key": "A", "text": "$7:3$"}, {"key": "B", "text": "$4:3$"}, {"key": "C", "text": "$3:7$"}, {"key": "D", "text": "$4:7$"}, {"key": "E", "text": "$7:4$"}]'::jsonb, 'A', NULL, NULL,
  '$EM=3t$, $MF=4t$, $EF=7t$. $EF:EM=7:3$.',
  2025, 'I', 136, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0013 | əsas: 2025 toplu, I hissə, səh.136 №29
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Düz xətt, şüa, parça. Parçaların ölçülməsi'), 'original', 'own', 'az', 'draft', 'open',
  '$C$ nöqtəsi $AB$ parçasını $A$ nöqtəsindən başlayaraq $3:4$ nisbətində bölür. $AB=56$ olarsa, $CB$-ni tapın.',
  NULL, NULL, NULL, '32',
  '$AB=7$ hissə, $CB=4$ hissə: $CB=\dfrac{56}{7}\cdot4=32$.',
  2025, 'I', 136, 29)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0014 | əsas: 2025 toplu, I hissə, səh.136 №30
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Düz xətt, şüa, parça. Parçaların ölçülməsi'), 'original', 'own', 'az', 'draft', 'open',
  '$C$ nöqtəsi $AB$ parçasını $A$ nöqtəsindən başlayaraq $4:7$ nisbətində bölür. $AC=48$ olarsa, $AB$-ni tapın.',
  NULL, NULL, NULL, '132',
  '$AC=4$ hissə $=48\Rightarrow$ bir hissə $12$. $AB=11$ hissə $=132$.',
  2025, 'I', 136, 30)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0015 | əsas: 2025 toplu, I hissə, səh.136 №33
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0015', '/images/tasks/HEA-0015.png', 'A, C, K, D, B nöqtələri ardıcıl yerləşmiş parça', (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Düz xətt, şüa, parça. Parçaların ölçülməsi'), 'original', 'own', 'az', 'draft', 'written',
  '$AB$ parçasında $CK:KD=2:3$, $AK:KD=8:3$ və $AC=BD=24$ sm olarsa, $CB$-nin uzunluğunu tapın.',
  NULL, NULL, NULL, '44',
  'Nöqtələr $A,\ C,\ K,\ D,\ B$ ardıcıllığı ilə yerləşir. $KD=3t$, $CK=2t$, $AK=8t$. $AC=AK-CK=6t=24\Rightarrow t=4$. $AK=32$, $KD=12$, $AB=AK+KD+DB=32+12+24=68$ sm. $CB=AB-AC=68-24=44$ sm.',
  2025, 'I', 136, 33)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0016 | əsas: 2025 toplu, I hissə, səh.137 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Bucaq. Bucaqların ölçülməsi. Bucağın tənböləni'), 'original', 'own', 'az', 'draft', 'closed',
  '$140^\circ$-li bucağın təpəsindən çıxan şüa onu dərəcə ölçülərinin fərqi $36^\circ$ olan iki bucağa ayırır. Alınan böyük bucağı tapın.',
  '[{"key": "A", "text": "$88^\\circ$"}, {"key": "B", "text": "$76^\\circ$"}, {"key": "C", "text": "$70^\\circ$"}, {"key": "D", "text": "$52^\\circ$"}, {"key": "E", "text": "$104^\\circ$"}]'::jsonb, 'A', NULL, NULL,
  '$x+y=140$, $x-y=36\Rightarrow x=88^\circ$.',
  2025, 'I', 137, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0017 | əsas: 2025 toplu, I hissə, səh.137 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Bucaq. Bucaqların ölçülməsi. Bucağın tənböləni'), 'original', 'own', 'az', 'draft', 'closed',
  '$160^\circ$-li bucağın təpəsindən çıxan şüa onu $5:3$ nisbətində iki bucağa ayırır. Alınan kiçik bucağı tapın.',
  '[{"key": "A", "text": "$40^\\circ$"}, {"key": "B", "text": "$32^\\circ$"}, {"key": "C", "text": "$100^\\circ$"}, {"key": "D", "text": "$80^\\circ$"}, {"key": "E", "text": "$60^\\circ$"}]'::jsonb, 'E', NULL, NULL,
  '$160:8=20^\circ$ — bir hissə. Kiçik bucaq $3\cdot20=60^\circ$.',
  2025, 'I', 137, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0018 | əsas: 2025 toplu, I hissə, səh.137 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Bucaq. Bucaqların ölçülməsi. Bucağın tənböləni'), 'original', 'own', 'az', 'draft', 'closed',
  'Açıq bucağın təpəsindən eyni yarımmüstəvidə olmaqla çıxan iki şüa, onu dərəcə ölçüləri $2:3:4$ nisbətində olan üç bucağa ayırır. Alınan böyük bucağı tapın.',
  '[{"key": "A", "text": "$60^\\circ$"}, {"key": "B", "text": "$100^\\circ$"}, {"key": "C", "text": "$40^\\circ$"}, {"key": "D", "text": "$90^\\circ$"}, {"key": "E", "text": "$80^\\circ$"}]'::jsonb, 'E', NULL, NULL,
  'Açıq bucaq $180^\circ$: $180:9=20^\circ$. Böyük bucaq $4\cdot20=80^\circ$.',
  2025, 'I', 137, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0019 | əsas: 2025 toplu, I hissə, səh.137 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Bucaq. Bucaqların ölçülməsi. Bucağın tənböləni'), 'original', 'own', 'az', 'draft', 'closed',
  'Açıq bucağın təpəsindən eyni yarımmüstəvidə olmaqla çıxan iki şüa, onu dərəcə ölçüləri $1:3:5$ nisbətində olan üç bucağa ayırır. Alınan kiçik bucağı tapın.',
  '[{"key": "A", "text": "$30^\\circ$"}, {"key": "B", "text": "$36^\\circ$"}, {"key": "C", "text": "$60^\\circ$"}, {"key": "D", "text": "$20^\\circ$"}, {"key": "E", "text": "$100^\\circ$"}]'::jsonb, 'D', NULL, NULL,
  '$180:9=20^\circ$ — kiçik bucaq.',
  2025, 'I', 137, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0020 | əsas: 2025 toplu, I hissə, səh.137 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Bucaq. Bucaqların ölçülməsi. Bucağın tənböləni'), 'original', 'own', 'az', 'draft', 'closed',
  '$AOB$ kor bucağının $OC$ tənböləni onu dərəcə ölçüləri $(3x+y)$ və $(5x-3y)$ olan iki bucağa ayırır. $AOB$ bucağının ala biləcəyi qiymətlərin cəmini tapın $(x,y\in N)$.',
  '[{"key": "A", "text": "$882^\\circ$"}, {"key": "B", "text": "$840^\\circ$"}, {"key": "C", "text": "$798^\\circ$"}, {"key": "D", "text": "$756^\\circ$"}, {"key": "E", "text": "$714^\\circ$"}]'::jsonb, 'C', NULL, NULL,
  'Tənbölən bucağı iki bərabər hissəyə bölür: $3x+y=5x-3y\Rightarrow x=2y$. Onda hər hissə $7y$, $\angle AOB=14y$. Kor bucaq: $90<14y<180\Rightarrow6{,}4<y<12{,}9$, yəni $y\in\{7;\dots;12\}$ ($x=2y$ də natural). Cəm: $14(7+8+9+10+11+12)=14\cdot57=798^\circ$.',
  2025, 'I', 137, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0021 | əsas: 2025 toplu, I hissə, səh.138 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Qonşu və qarşılıqlı bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$\alpha$ bucağı ilə qonşu olan iki bucağın cəmi $230^\circ$-dir. $\alpha$ bucağını tapın.',
  '[{"key": "A", "text": "$50^\\circ$"}, {"key": "B", "text": "$32{,}5^\\circ$"}, {"key": "C", "text": "$115^\\circ$"}, {"key": "D", "text": "$130^\\circ$"}, {"key": "E", "text": "$65^\\circ$"}]'::jsonb, 'E', NULL, NULL,
  'İki düz xəttin kəsişməsində $\alpha$ ilə qonşu olan hər iki bucaq $180^\circ-\alpha$-ya bərabərdir: $2(180^\circ-\alpha)=230^\circ\Rightarrow\alpha=65^\circ$.',
  2025, 'I', 138, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0022 | əsas: 2025 toplu, I hissə, səh.138 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Qonşu və qarşılıqlı bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  'İki düz xəttin kəsişməsindən alınan bucaqlardan ikisinin cəmi $110^\circ$-dir. Bu bucaqları tapın.',
  '[{"key": "A", "text": "$50^\\circ$ və $60^\\circ$"}, {"key": "B", "text": "$45^\\circ$ və $65^\\circ$"}, {"key": "C", "text": "$40^\\circ$ və $70^\\circ$"}, {"key": "D", "text": "$55^\\circ$ və $55^\\circ$"}, {"key": "E", "text": "$35^\\circ$ və $75^\\circ$"}]'::jsonb, 'D', NULL, NULL,
  'Qonşu bucaqların cəmi $180^\circ$-dir, ona görə cəmi $110^\circ$ olan iki bucaq qarşılıqlı bucaqlardır və bərabərdir: hər biri $55^\circ$.',
  2025, 'I', 138, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0023 | əsas: 2025 toplu, I hissə, səh.138 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Qonşu və qarşılıqlı bucaqlar'), 'original', 'own', 'az', 'draft', 'open',
  'Qonşu bucaqların dərəcə ölçüləri $(2a+1):(2a+3)$ nisbətindədir. Bu bucaqların dərəcə ölçüləri natural ədədlər olarsa, $a$-nın ala biləcəyi natural qiymətlərin sayını tapın.',
  NULL, NULL, NULL, '5',
  'Bucaqlar $180^\circ\cdot\dfrac{2a+1}{4a+4}=\dfrac{45(2a+1)}{a+1}=90-\dfrac{45}{a+1}$ və $90+\dfrac{45}{a+1}$. Natural olması üçün $a+1$ ədədi $45$-in böləni olmalıdır, $a\ge1$ olduğundan $a+1\in\{3;5;9;15;45\}$ — $5$ qiymət.',
  2025, 'I', 138, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0024 | əsas: 2025 toplu, I hissə, səh.138 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Qonşu və qarşılıqlı bucaqlar'), 'original', 'own', 'az', 'draft', 'written',
  '$\alpha$ və $\beta$ iki düz xəttin kəsişməsindən alınan qonşu bucaqlardır. $\alpha$-nın dərəcə ölçüsü $30\%$ azaldılıb $x$ bucağı, $\beta$-nın dərəcə ölçüsü $50\%$ artırılıb $y$ bucağı alınır. $x$ və $y$ bucaqlarının cəmi $180^\circ$ olarsa, $\alpha$ və $\beta$-nın qiymətlərini tapın.',
  NULL, NULL, NULL, '112,5; 67,5',
  '$\alpha+\beta=180^\circ$ və $0{,}7\alpha+1{,}5\beta=180^\circ$. Birincini $0{,}7$-yə vurub çıxaq: $0{,}8\beta=54\Rightarrow\beta=67{,}5^\circ$, $\alpha=112{,}5^\circ$.',
  2025, 'I', 138, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0025 | əsas: 2025 toplu, I hissə, səh.139 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0025', '/images/tasks/HEA-0025.png', 'Paralel a və b düz xətləri arasında sınıq xətt; a ilə 35°, b ilə 28° bucaq əmələ gətirir, təpədəki bucaq x', (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='İki paralel düz xəttin üçüncü ilə kəsişməsindən alınan bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$a\parallel b$ olarsa, $x$-i tapın.',
  '[{"key": "A", "text": "$73^\\circ$"}, {"key": "B", "text": "$53^\\circ$"}, {"key": "C", "text": "$7^\\circ$"}, {"key": "D", "text": "$63^\\circ$"}, {"key": "E", "text": "$117^\\circ$"}]'::jsonb, 'D', NULL, NULL,
  '$x$ bucağının təpəsindən $a$ və $b$-yə paralel düz xətt keçirək. Daxili çarpaz bucaqlar bərabər olduğundan $x$ iki hissəyə ayrılır: $35^\circ$ və $28^\circ$. $x=35^\circ+28^\circ=63^\circ$.',
  2025, 'I', 139, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0026 | əsas: 2025 toplu, I hissə, səh.139 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0026', '/images/tasks/HEA-0026.png', 'Paralel a və b düz xətləri arasında sınıq xətt; a ilə 42°, b ilə 31° bucaq əmələ gətirir, təpədəki bucaq x', (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='İki paralel düz xəttin üçüncü ilə kəsişməsindən alınan bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$a\parallel b$ olarsa, $x$-i tapın.',
  '[{"key": "A", "text": "$107^\\circ$"}, {"key": "B", "text": "$83^\\circ$"}, {"key": "C", "text": "$11^\\circ$"}, {"key": "D", "text": "$63^\\circ$"}, {"key": "E", "text": "$73^\\circ$"}]'::jsonb, 'E', NULL, NULL,
  'Təpədən paralel düz xətt keçirsək, $x$ bucağı daxili çarpaz bucaqların cəminə bərabər olur: $x=42^\circ+31^\circ=73^\circ$.',
  2025, 'I', 139, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0027 | əsas: 2025 toplu, I hissə, səh.143 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0027', NULL, NULL, (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Uyğun tərəfləri paralel və perpendikulyar olan bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$\alpha$ və $\beta$ uyğun tərəfləri paralel olan eyni növlü bucaqlardır. Bu bucaqlardan birini $25\%$ azaldıb, digərini $75\%$ artırsaq yenə uyğun tərəfləri paralel olan bucaqlar alınar. $(\alpha+\beta)$-nı tapın.',
  '[{"key": "A", "text": "$150^\\circ$"}, {"key": "B", "text": "$72^\\circ$"}, {"key": "C", "text": "$144^\\circ$"}, {"key": "D", "text": "$126^\\circ$"}, {"key": "E", "text": "$180^\\circ$"}]'::jsonb, 'C', NULL, NULL,
  'Eyni növlü olduğundan $\alpha=\beta$. Yeni bucaqlar $0{,}75\alpha$ və $1{,}75\alpha$ bərabər ola bilməz, ona görə onların cəmi $180^\circ$-dir: $2{,}5\alpha=180^\circ\Rightarrow\alpha=72^\circ$. $\alpha+\beta=144^\circ$.',
  2025, 'I', 143, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0028 | əsas: 2025 toplu, I hissə, səh.143 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0028', NULL, NULL, (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Uyğun tərəfləri paralel və perpendikulyar olan bucaqlar'), 'original', 'own', 'az', 'draft', 'written',
  'Uyğun tərəfləri paralel olan $\alpha$ və $\beta$ bucaqları üçün $\alpha+4\beta=300^\circ$. $\alpha$ və $\beta$-nın ala biləcəyi qiymətləri tapın. İki hala baxın.',
  NULL, NULL, NULL, '60; 60 və ya 140; 40',
  'Uyğun tərəfləri paralel olan bucaqlar ya bərabər, ya da cəmi $180^\circ$ olur. 1) $\alpha=\beta$: $5\beta=300^\circ\Rightarrow\alpha=\beta=60^\circ$. 2) $\alpha+\beta=180^\circ$: $3\beta=120^\circ\Rightarrow\beta=40^\circ$, $\alpha=140^\circ$.',
  2025, 'I', 143, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0029 | əsas: 2025 toplu, I hissə, səh.143 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0029', NULL, NULL, (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Uyğun tərəfləri paralel və perpendikulyar olan bucaqlar'), 'original', 'own', 'az', 'draft', 'written',
  'Uyğun tərəfləri perpendikulyar olan $\alpha$ və $\beta$ bucaqları üçün $2\alpha+\beta=240^\circ$. $\alpha$ və $\beta$-nın ala biləcəyi qiymətləri tapın. İki hala baxın.',
  NULL, NULL, NULL, '80; 80 və ya 60; 120',
  'Uyğun tərəfləri perpendikulyar olan bucaqlar ya bərabər, ya da cəmi $180^\circ$ olur. 1) $\alpha=\beta$: $3\alpha=240^\circ\Rightarrow\alpha=\beta=80^\circ$. 2) $\alpha+\beta=180^\circ$: $2\alpha+\beta=\alpha+180^\circ=240^\circ\Rightarrow\alpha=60^\circ$, $\beta=120^\circ$.',
  2025, 'I', 143, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0030 | əsas: 2025 toplu, I hissə, səh.137 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0030', '/images/tasks/HEA-0030.png', 'O nöqtəsindən çıxan OA, OB, OC şüaları; heç bir şüa digər ikisi arasındakı bucağın daxilində deyil', (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Bucaq. Bucaqların ölçülməsi. Bucağın tənböləni'), 'original', 'own', 'az', 'draft', 'closed',
  '$O$ nöqtəsindən çıxan $OA,\ OB,\ OC$ şüaları şəkildəki kimi yerləşmişdir. $\angle AOB-\angle AOC=24^\circ$, $\angle AOB-\angle BOC=36^\circ$ olarsa, $\angle AOC$-nin dərəcə ölçüsünü tapın.',
  '[{"key": "A", "text": "$104^\\circ$"}, {"key": "B", "text": "$116^\\circ$"}, {"key": "C", "text": "$92^\\circ$"}, {"key": "D", "text": "$128^\\circ$"}, {"key": "E", "text": "$140^\\circ$"}]'::jsonb, 'B', NULL, NULL,
  'Üç şüa müstəvini üç bucağa bölür və onların cəmi $360^\circ$-dir. $\angle AOB=x$ olsun: $\angle AOC=x-24^\circ$, $\angle BOC=x-36^\circ$. $3x-60^\circ=360^\circ\Rightarrow x=140^\circ$, $\angle AOC=116^\circ$.',
  2025, 'I', 137, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0031 | əsas: 2025 toplu, I hissə, səh.137 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0031', '/images/tasks/HEA-0031.png', 'O nöqtəsindən çıxan OC, OD, OK şüaları', (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Bucaq. Bucaqların ölçülməsi. Bucağın tənböləni'), 'original', 'own', 'az', 'draft', 'closed',
  '$O$ nöqtəsindən çıxan $OC,\ OD,\ OK$ şüaları şəkildəki kimi yerləşmişdir. $\angle COD-\angle KOD=50^\circ$ və $\angle COD-\angle KOC=40^\circ$ olarsa, $KOD$ bucağının dərəcə ölçüsünü tapın.',
  '[{"key": "A", "text": "$120^\\circ$"}, {"key": "B", "text": "$110^\\circ$"}, {"key": "C", "text": "$100^\\circ$"}, {"key": "D", "text": "$150^\\circ$"}, {"key": "E", "text": "$90^\\circ$"}]'::jsonb, 'C', NULL, NULL,
  '$\angle COD=x$: $\angle KOD=x-50^\circ$, $\angle KOC=x-40^\circ$. Cəm $360^\circ$: $3x-90^\circ=360^\circ\Rightarrow x=150^\circ$. $\angle KOD=100^\circ$.',
  2025, 'I', 137, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0032 | əsas: 2025 toplu, I hissə, səh.138 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0032', '/images/tasks/HEA-0032.png', 'C, B, E nöqtələri bir düz xətt üzərində; B-dən BA və BD şüaları çıxır', (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='Qonşu və qarşılıqlı bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$BD$ şüası $\angle ABC$-nin tənbölənidir və $\angle DBE=146^\circ$ olarsa, $\angle ABE$-ni tapın ($C,\ B$ və $E$ nöqtələri bir düz xətt üzərində yerləşir).',
  '[{"key": "A", "text": "$112^\\circ$"}, {"key": "B", "text": "$56^\\circ$"}, {"key": "C", "text": "$68^\\circ$"}, {"key": "D", "text": "$34^\\circ$"}, {"key": "E", "text": "$124^\\circ$"}]'::jsonb, 'A', NULL, NULL,
  '$\angle DBC=180^\circ-146^\circ=34^\circ$ (qonşu bucaqlar). $BD$ tənbölən olduğundan $\angle ABC=68^\circ$. $\angle ABE=180^\circ-68^\circ=112^\circ$.',
  2025, 'I', 138, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0033 | əsas: 2025 toplu, I hissə, səh.139 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0033', '/images/tasks/HEA-0033.png', 'd1 və d2 paralel düz xətləri üzərində A və C nöqtələri, onlardan aşağıda B nöqtəsi; A-dakı və C-dəki bucaqlar göstərilib', (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='İki paralel düz xəttin üçüncü ilə kəsişməsindən alınan bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$\angle A=125^\circ$, $\angle C=145^\circ$ və $d_1\parallel d_2$ olarsa, $\angle B$-ni tapın.',
  '[{"key": "A", "text": "$110^\\circ$"}, {"key": "B", "text": "$70^\\circ$"}, {"key": "C", "text": "$100^\\circ$"}, {"key": "D", "text": "$90^\\circ$"}, {"key": "E", "text": "$80^\\circ$"}]'::jsonb, 'D', NULL, NULL,
  '$d_1$ və $d_2$ bir düz xətt üzərində yerləşir, ona görə $A$, $B$, $C$ üçbucaq əmələ gətirir. $\angle A$ ilə qonşu daxili bucaq $180^\circ-125^\circ=55^\circ$, $\angle C$ ilə qonşu daxili bucaq $180^\circ-145^\circ=35^\circ$. $\angle B=180^\circ-55^\circ-35^\circ=90^\circ$.',
  2025, 'I', 139, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0034 | əsas: 2025 toplu, I hissə, səh.139 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0034', '/images/tasks/HEA-0034.png', 'd1 və d2 paralel düz xətləri üzərində A və C nöqtələri, onlardan aşağıda B nöqtəsi; A-dakı və C-dəki bucaqlar göstərilib', (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='İki paralel düz xəttin üçüncü ilə kəsişməsindən alınan bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$\angle A=140^\circ$, $\angle C=120^\circ$ və $d_1\parallel d_2$ olarsa, $\angle B$-ni tapın.',
  '[{"key": "A", "text": "$90^\\circ$"}, {"key": "B", "text": "$70^\\circ$"}, {"key": "C", "text": "$80^\\circ$"}, {"key": "D", "text": "$100^\\circ$"}, {"key": "E", "text": "$60^\\circ$"}]'::jsonb, 'C', NULL, NULL,
  '$d_1$ və $d_2$ bir düz xətt üzərində yerləşir, ona görə $A$, $B$, $C$ üçbucaq əmələ gətirir. $\angle A$ ilə qonşu daxili bucaq $180^\circ-140^\circ=40^\circ$, $\angle C$ ilə qonşu daxili bucaq $180^\circ-120^\circ=60^\circ$. $\angle B=180^\circ-40^\circ-60^\circ=80^\circ$.',
  2025, 'I', 139, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0035 | əsas: 2025 toplu, I hissə, səh.139 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0035', '/images/tasks/HEA-0035.png', 'd1 və d2 paralel düz xətləri; B nöqtəsi d2 üzərində, D nöqtəsi d1 üzərində; A təpəsindəki bucaq x', (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='İki paralel düz xəttin üçüncü ilə kəsişməsindən alınan bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$\angle D=135^\circ$, $\angle B=60^\circ$ və $d_1\parallel d_2$. $\angle A$-nı tapın.',
  '[{"key": "A", "text": "$75^\\circ$"}, {"key": "B", "text": "$95^\\circ$"}, {"key": "C", "text": "$85^\\circ$"}, {"key": "D", "text": "$65^\\circ$"}, {"key": "E", "text": "$90^\\circ$"}]'::jsonb, 'A', NULL, NULL,
  '$AB$ şüası $d_2$ ilə $60^\circ$, $AD$ şüası $d_1$ ilə $135^\circ$ bucaq əmələ gətirir (hər iki bucaq paralel düz xətlərin eyni istiqamətindən ölçülür). Ona görə $AB$ və $AD$ arasındakı bucaq bu bucaqların fərqinə bərabərdir: $x=135^\circ-60^\circ=75^\circ$.',
  2025, 'I', 139, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0036 | əsas: 2025 toplu, I hissə, səh.139 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0036', '/images/tasks/HEA-0036.png', 'd1 və d2 paralel düz xətləri; B nöqtəsi d2 üzərində, D nöqtəsi d1 üzərində; A təpəsindəki bucaq x', (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='İki paralel düz xəttin üçüncü ilə kəsişməsindən alınan bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$\angle D=130^\circ$, $\angle B=70^\circ$ və $d_1\parallel d_2$. $\angle A$-nı tapın.',
  '[{"key": "A", "text": "$60^\\circ$"}, {"key": "B", "text": "$75^\\circ$"}, {"key": "C", "text": "$50^\\circ$"}, {"key": "D", "text": "$70^\\circ$"}, {"key": "E", "text": "$80^\\circ$"}]'::jsonb, 'A', NULL, NULL,
  '$AB$ şüası $d_2$ ilə $70^\circ$, $AD$ şüası $d_1$ ilə $130^\circ$ bucaq əmələ gətirir (hər iki bucaq paralel düz xətlərin eyni istiqamətindən ölçülür). Ona görə $AB$ və $AD$ arasındakı bucaq bu bucaqların fərqinə bərabərdir: $x=130^\circ-70^\circ=60^\circ$.',
  2025, 'I', 139, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0037 | əsas: 2025 toplu, I hissə, səh.139 №20
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0037', '/images/tasks/HEA-0037.png', 'D, C, E nöqtələri bir düz xətt üzərində; CA və EF şüaları; AB parçası EF-ə paralel', (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='İki paralel düz xəttin üçüncü ilə kəsişməsindən alınan bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$AB\parallel EF$, $\angle ACD=35^\circ$, $\angle CEF=155^\circ$ olarsa, $\angle BAC$-ni tapın ($D,\ C,\ E$ nöqtələri bir düz xətt üzərindədir).',
  '[{"key": "A", "text": "$60^\\circ$"}, {"key": "B", "text": "$70^\\circ$"}, {"key": "C", "text": "$25^\\circ$"}, {"key": "D", "text": "$35^\\circ$"}, {"key": "E", "text": "$50^\\circ$"}]'::jsonb, 'A', NULL, NULL,
  '$EF$ şüası $DE$ düz xətti ilə ($E$-dən sağa) $180^\circ-155^\circ=25^\circ$ bucaq əmələ gətirir; $AB\parallel EF$ olduğundan $AB$ də həmin istiqamətlə $25^\circ$ bucaq əmələ gətirir. $AC$ isə bu istiqamətlə $35^\circ$ bucaq altında aşağı yönəlib. Deməli $\angle BAC=25^\circ+35^\circ=60^\circ$.',
  2025, 'I', 139, 20)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0038 | əsas: 2025 toplu, I hissə, səh.140 №32
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0038', '/images/tasks/HEA-0038.png', 'D, C, E nöqtələri bir düz xətt üzərində; CA və EF şüaları; AB parçası EF-ə paralel', (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='İki paralel düz xəttin üçüncü ilə kəsişməsindən alınan bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$AB\parallel EF$, $\angle ACD=45^\circ$, $\angle CEF=140^\circ$ olarsa, $\angle BAC$-ni tapın ($D,\ C,\ E$ nöqtələri bir düz xətt üzərindədir).',
  '[{"key": "A", "text": "$75^\\circ$"}, {"key": "B", "text": "$85^\\circ$"}, {"key": "C", "text": "$40^\\circ$"}, {"key": "D", "text": "$45^\\circ$"}, {"key": "E", "text": "$95^\\circ$"}]'::jsonb, 'B', NULL, NULL,
  '$EF$ şüası $DE$ düz xətti ilə ($E$-dən sağa) $180^\circ-140^\circ=40^\circ$ bucaq əmələ gətirir; $AB\parallel EF$ olduğundan $AB$ də həmin istiqamətlə $40^\circ$ bucaq əmələ gətirir. $AC$ isə bu istiqamətlə $45^\circ$ bucaq altında aşağı yönəlib. Deməli $\angle BAC=40^\circ+45^\circ=85^\circ$.',
  2025, 'I', 140, 32)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0039 | əsas: 2025 toplu, I hissə, səh.140 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0039', '/images/tasks/HEA-0039.png', 'İki paralel düz xətt (B üzərində və D üzərində), A nöqtəsi onların arasında, AC — BAD bucağının tənböləni', (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='İki paralel düz xəttin üçüncü ilə kəsişməsindən alınan bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$BM\parallel DE$, $\angle ABC=100^\circ$, $\angle ADE=140^\circ$ və $AC$ isə $BAD$ bucağının tənböləni olarsa, $\angle ACM$-in dərəcə ölçüsünü tapın.',
  '[{"key": "A", "text": "$130^\\circ$"}, {"key": "B", "text": "$160^\\circ$"}, {"key": "C", "text": "$20^\\circ$"}, {"key": "D", "text": "$140^\\circ$"}, {"key": "E", "text": "$120^\\circ$"}]'::jsonb, 'B', NULL, NULL,
  '$A$-dan paralel düz xətt keçirsək, $\angle BAD=(180^\circ-100^\circ)+(180^\circ-140^\circ)=120^\circ$. Tənbölən: $\angle BAC=60^\circ$. $ABC$ üçbucağında $\angle BCA=180^\circ-100^\circ-60^\circ=20^\circ$. $\angle ACM=180^\circ-20^\circ=160^\circ$.',
  2025, 'I', 140, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- HEA-0040 | əsas: 2025 toplu, I hissə, səh.140 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('HEA-0040', '/images/tasks/HEA-0040.png', 'İki paralel düz xətt (B üzərində və D üzərində), A nöqtəsi onların arasında, AC — BAD bucağının tənböləni', (SELECT id FROM topics WHERE name='Həndəsənin əsas anlayışları'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Həndəsənin əsas anlayışları' AND s.title='İki paralel düz xəttin üçüncü ilə kəsişməsindən alınan bucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$BK\parallel DM$, $\angle ABC=95^\circ$, $\angle ADM=145^\circ$ və $AC$ isə $BAD$ bucağının tənböləni olarsa, $\angle ACK$-in dərəcə ölçüsünü tapın.',
  '[{"key": "A", "text": "$135^\\circ$"}, {"key": "B", "text": "$155^\\circ$"}, {"key": "C", "text": "$25^\\circ$"}, {"key": "D", "text": "$115^\\circ$"}, {"key": "E", "text": "$125^\\circ$"}]'::jsonb, 'B', NULL, NULL,
  '$A$-dan paralel düz xətt keçirsək, $\angle BAD=(180^\circ-95^\circ)+(180^\circ-145^\circ)=120^\circ$. Tənbölən: $\angle BAC=60^\circ$. $ABC$ üçbucağında $\angle BCA=180^\circ-95^\circ-60^\circ=25^\circ$. $\angle ACK=180^\circ-25^\circ=155^\circ$.',
  2025, 'I', 140, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
