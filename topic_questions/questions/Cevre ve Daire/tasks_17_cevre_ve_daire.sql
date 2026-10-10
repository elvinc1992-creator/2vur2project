-- Mövzu: Çevrə və dairə — 69 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- CVD-0001 | əsas: 2025 toplu, I hissə, səh.173 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrə. Dairə. Radius, diametr, vətər. Çevrənin və çevrə qövsünün uzunluğu. Çevrələrin qarşılıqlı vəziyyəti'), 'original', 'own', 'az', 'draft', 'closed',
  'Konsentrik iki çevrənin radiusları $9:5$ nisbətindədir. Bu çevrələr arasında qalan halqanın qalınlığı isə $8$ sm-dir. Kiçik çevrənin radiusunu tapın.',
  '[{"key": "A", "text": "$18$ sm"}, {"key": "B", "text": "$8$ sm"}, {"key": "C", "text": "$10$ sm"}, {"key": "D", "text": "$20$ sm"}, {"key": "E", "text": "$16$ sm"}]'::jsonb, 'C', NULL, NULL,
  'Radiuslar $9t$ və $5t$; qalınlıq $4t=8\Rightarrow t=2$. Kiçik radius $10$ sm.',
  2025, 'I', 173, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0002 | əsas: 2025 toplu, I hissə, səh.173 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrə. Dairə. Radius, diametr, vətər. Çevrənin və çevrə qövsünün uzunluğu. Çevrələrin qarşılıqlı vəziyyəti'), 'original', 'own', 'az', 'draft', 'closed',
  'Konsentrik iki çevrənin radiusları $5:2$ nisbətindədir. Bu çevrələr arasında qalan halqanın qalınlığı $9$ sm-dir. Kiçik çevrənin radiusunu tapın.',
  '[{"key": "A", "text": "$6$ sm"}, {"key": "B", "text": "$15$ sm"}, {"key": "C", "text": "$9$ sm"}, {"key": "D", "text": "$12$ sm"}, {"key": "E", "text": "$3$ sm"}]'::jsonb, 'A', NULL, NULL,
  '$3t=9\Rightarrow t=3$; kiçik radius $6$ sm.',
  2025, 'I', 173, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0003 | əsas: 2025 toplu, I hissə, səh.173 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrə. Dairə. Radius, diametr, vətər. Çevrənin və çevrə qövsünün uzunluğu. Çevrələrin qarşılıqlı vəziyyəti'), 'original', 'own', 'az', 'draft', 'closed',
  'Çevrənin ən böyük vətərinin uzunluğu $18$ sm-ə bərabərdir. Bu çevrənin radiusunu tapın.',
  '[{"key": "A", "text": "$6$ sm"}, {"key": "B", "text": "$4{,}5$ sm"}, {"key": "C", "text": "$18$ sm"}, {"key": "D", "text": "$9$ sm"}, {"key": "E", "text": "$36$ sm"}]'::jsonb, 'D', NULL, NULL,
  'Ən böyük vətər diametrdir: $R=9$ sm.',
  2025, 'I', 173, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0004 | əsas: 2025 toplu, I hissə, səh.173 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrə. Dairə. Radius, diametr, vətər. Çevrənin və çevrə qövsünün uzunluğu. Çevrələrin qarşılıqlı vəziyyəti'), 'original', 'own', 'az', 'draft', 'closed',
  'Çevrənin radiusu $8$ sm-ə bərabərdir. Bu çevrənin ən böyük vətərinin uzunluğunu tapın.',
  '[{"key": "A", "text": "$16$ sm"}, {"key": "B", "text": "$24$ sm"}, {"key": "C", "text": "$8$ sm"}, {"key": "D", "text": "$4$ sm"}, {"key": "E", "text": "$32$ sm"}]'::jsonb, 'A', NULL, NULL,
  'Ən böyük vətər diametrdir: $16$ sm.',
  2025, 'I', 173, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0005 | əsas: 2025 toplu, I hissə, səh.173 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrə. Dairə. Radius, diametr, vətər. Çevrənin və çevrə qövsünün uzunluğu. Çevrələrin qarşılıqlı vəziyyəti'), 'original', 'own', 'az', 'draft', 'closed',
  'Çevrə xaricindəki nöqtədən çevrə üzərindəki ən uzaq nöqtəyə qədər məsafə $25$ sm, ən yaxın nöqtəyə qədər məsafə isə $7$ sm-dir. Çevrənin radiusunu tapın.',
  '[{"key": "A", "text": "$16$ sm"}, {"key": "B", "text": "$18$ sm"}, {"key": "C", "text": "$7$ sm"}, {"key": "D", "text": "$9$ sm"}, {"key": "E", "text": "$12$ sm"}]'::jsonb, 'D', NULL, NULL,
  'Ən uzaq və ən yaxın nöqtələr mərkəzdən keçən düz xətt üzərindədir; fərq diametrdir: $25-7=18$, $R=9$ sm.',
  2025, 'I', 173, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0006 | əsas: 2025 toplu, I hissə, səh.173 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrə. Dairə. Radius, diametr, vətər. Çevrənin və çevrə qövsünün uzunluğu. Çevrələrin qarşılıqlı vəziyyəti'), 'original', 'own', 'az', 'draft', 'closed',
  'Çevrə xaricindəki nöqtədən çevrə üzərindəki ən uzaq nöqtəyə qədər məsafə $26$ sm, ən yaxın nöqtəyə qədər məsafə isə $10$ sm-dir. Çevrənin radiusunu tapın.',
  '[{"key": "A", "text": "$8$ sm"}, {"key": "B", "text": "$5$ sm"}, {"key": "C", "text": "$13$ sm"}, {"key": "D", "text": "$18$ sm"}, {"key": "E", "text": "$16$ sm"}]'::jsonb, 'A', NULL, NULL,
  'Diametr $16$, $R=8$ sm.',
  2025, 'I', 173, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0007 | əsas: 2025 toplu, I hissə, səh.174 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0007', '/images/tasks/CVD-0007.png', 'Çevrəyə xaricdəki A nöqtəsindən AB və AC toxunanları; BnC qövsü A-dan uzaq tərəfdədir', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrə. Dairə. Radius, diametr, vətər. Çevrənin və çevrə qövsünün uzunluğu. Çevrələrin qarşılıqlı vəziyyəti'), 'original', 'own', 'az', 'draft', 'closed',
  '$AB$, $AC$ — mərkəzi $O$ olan çevrənin toxunanları, $\angle BAC=90^\circ$, $AO=10\sqrt2$ sm olarsa, $BnC$ qövsünün uzunluğunu tapın.',
  '[{"key": "A", "text": "$20 \\pi$ sm"}, {"key": "B", "text": "$5 \\pi$ sm"}, {"key": "C", "text": "$10 \\pi$ sm"}, {"key": "D", "text": "$15$ sm"}, {"key": "E", "text": "$15 \\pi$ sm"}]'::jsonb, 'E', NULL, NULL,
  '$AO$ — $\angle BAC$-nin tənbölənidir: $R=AO\sin45^\circ=10$. $ABOC$ dördbucaqlısında $\angle BOC=180^\circ-90^\circ=90^\circ$; $BnC$ böyük qövsdür: $360^\circ-90^\circ=270^\circ$. Uzunluq $2\pi\cdot10\cdot\dfrac{270}{360}=15\pi$ sm.',
  2025, 'I', 174, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0008 | əsas: 2025 toplu, I hissə, səh.174 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrə. Dairə. Radius, diametr, vətər. Çevrənin və çevrə qövsünün uzunluğu. Çevrələrin qarşılıqlı vəziyyəti'), 'original', 'own', 'az', 'draft', 'open',
  'Çevrənin diametri vətərlə kəsişərək bu vətəri uzunluqları $4$ sm və $10$ sm olan parçalara bölür. Çevrənin mərkəzindən vətərə qədər olan məsafə $\sqrt3$ sm-ə bərabərdir. Vətərlə diametr arasındakı iti bucağın dərəcə ölçüsünü tapın.',
  NULL, NULL, NULL, '30',
  'Vətərin yarısı $7$; kəsişmə nöqtəsi vətərin ortasından $7-4=3$ sm uzaqdadır. Mərkəz, vətərin ortası və kəsişmə nöqtəsi düzbucaqlı üçbucaq yaradır: $\operatorname{tg}\varphi=\dfrac{\sqrt3}{3}\Rightarrow\varphi=30^\circ$.',
  2025, 'I', 174, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0009 | əsas: 2025 toplu, I hissə, səh.174 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrə. Dairə. Radius, diametr, vətər. Çevrənin və çevrə qövsünün uzunluğu. Çevrələrin qarşılıqlı vəziyyəti'), 'original', 'own', 'az', 'draft', 'closed',
  'Çevrənin diametri vətərlə $60^\circ$ bucaq altında kəsişərək bu vətəri uzunluqları $3$ və $7$ sm olan parçalara bölür. Çevrənin mərkəzindən vətərə qədər olan məsafəni tapın.',
  '[{"key": "A", "text": "$4$ sm"}, {"key": "B", "text": "$2$ sm"}, {"key": "C", "text": "$\\sqrt{3}$ sm"}, {"key": "D", "text": "$2 \\sqrt{3}$ sm"}, {"key": "E", "text": "$3$ sm"}]'::jsonb, 'D', NULL, NULL,
  'Vətərin yarısı $5$; kəsişmə nöqtəsindən vətərin ortasına $2$ sm. Məsafə $2\operatorname{tg}60^\circ=2\sqrt3$ sm.',
  2025, 'I', 174, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0010 | əsas: 2025 toplu, I hissə, səh.175 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0010', '/images/tasks/CVD-0010.png', 'AB diametrli çevrə, C nöqtəsi AB-nin uzantısında, CM toxunanı, AM vətəri', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Mərkəzi bucaq. Daxilə çəkilmiş bucaq. Toxunanla vətər arasındakı bucaq'), 'original', 'own', 'az', 'draft', 'closed',
  '$AB$ çevrənin diametri, $CM$ — toxunan ($C$ nöqtəsi $AB$ düz xətti üzərindədir), $\angle MAC=20^\circ$ olarsa, $\angle MCA$ bucağını tapın.',
  '[{"key": "A", "text": "$60^\\circ$"}, {"key": "B", "text": "$50^\\circ$"}, {"key": "C", "text": "$20^\\circ$"}, {"key": "D", "text": "$70^\\circ$"}, {"key": "E", "text": "$40^\\circ$"}]'::jsonb, 'B', NULL, NULL,
  '$\angle MOC=2\angle MAC=40^\circ$ (mərkəzi bucaq). $OM\perp CM$ olduğundan $\angle MCA=90^\circ-40^\circ=50^\circ$.',
  2025, 'I', 175, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0011 | əsas: 2025 toplu, I hissə, səh.175 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0011', '/images/tasks/CVD-0011.png', 'AB diametrli çevrə, CM toxunanı, AM vətəri', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Mərkəzi bucaq. Daxilə çəkilmiş bucaq. Toxunanla vətər arasındakı bucaq'), 'original', 'own', 'az', 'draft', 'closed',
  '$AB$ çevrənin diametri, $CM$ — toxunan ($C$ nöqtəsi $AB$ düz xətti üzərindədir), $\angle MCA=40^\circ$ olarsa, $\angle MAC$ bucağını tapın.',
  '[{"key": "A", "text": "$25^\\circ$"}, {"key": "B", "text": "$20^\\circ$"}, {"key": "C", "text": "$40^\\circ$"}, {"key": "D", "text": "$65^\\circ$"}, {"key": "E", "text": "$50^\\circ$"}]'::jsonb, 'A', NULL, NULL,
  '$\angle MOC=90^\circ-40^\circ=50^\circ$. $\angle MAC=\dfrac{\angle MOC}{2}=25^\circ$.',
  2025, 'I', 175, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0012 | əsas: 2025 toplu, I hissə, səh.176 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0012', '/images/tasks/CVD-0012.png', 'BD diametrli çevrə, OA radiusu, DC vətəri; m nöqtəsi A ilə B, n nöqtəsi B ilə C arasındakı qövsdədir', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Mərkəzi bucaq. Daxilə çəkilmiş bucaq. Toxunanla vətər arasındakı bucaq'), 'original', 'own', 'az', 'draft', 'closed',
  'Mərkəzi $O$ nöqtəsi olan çevrədə $BD$ diametrdir, $\angle AOB=50^\circ$, $\angle CDB=35^\circ$. $\cup AmB$ və $\cup CnB$ qövslərinin uzunluqları nisbətini tapın.',
  '[{"key": "A", "text": "$2:3$"}, {"key": "B", "text": "$10:7$"}, {"key": "C", "text": "$7:5$"}, {"key": "D", "text": "$5:14$"}, {"key": "E", "text": "$5:7$"}]'::jsonb, 'E', NULL, NULL,
  '$\cup AmB=\angle AOB=50^\circ$. $\angle CDB$ daxilə çəkilmiş bucaqdır: $\cup CnB=2\cdot35^\circ=70^\circ$. Nisbət $50:70=5:7$.',
  2025, 'I', 176, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0013 | əsas: 2025 toplu, I hissə, səh.176 №18
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0013', '/images/tasks/CVD-0013.png', 'BD diametrli çevrə, OA radiusu, DC vətəri; m — A ilə B arasındakı, n — B ilə C arasındakı qövsdə', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Mərkəzi bucaq. Daxilə çəkilmiş bucaq. Toxunanla vətər arasındakı bucaq'), 'original', 'own', 'az', 'draft', 'closed',
  'Mərkəzi $O$ nöqtəsi olan çevrədə $BD$ diametrdir, $\angle AOB=30^\circ$, $\angle BDC=40^\circ$. $\cup AmB$ və $\cup BnC$ qövslərinin dərəcə ölçülərinin nisbətini tapın.',
  '[{"key": "A", "text": "$\\dfrac{3}{5}$"}, {"key": "B", "text": "$\\dfrac83$"}, {"key": "C", "text": "$\\dfrac34$"}, {"key": "D", "text": "$\\dfrac38$"}, {"key": "E", "text": "$\\dfrac{4}{3}$"}]'::jsonb, 'D', NULL, NULL,
  '$\cup AmB=30^\circ$; $\cup BnC=2\angle BDC=80^\circ$. Nisbət $\dfrac{30}{80}=\dfrac38$.',
  2025, 'I', 176, 18)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0014 | əsas: 2025 toplu, I hissə, səh.177 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0014', '/images/tasks/CVD-0014.png', 'Çevrəyə xaricdəki B nöqtəsindən BA və BC toxunanları, OA, OB, OC parçaları', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Mərkəzi bucaq. Daxilə çəkilmiş bucaq. Toxunanla vətər arasındakı bucaq'), 'original', 'own', 'az', 'draft', 'closed',
  'Mərkəzi $O$ nöqtəsində olan çevrəyə $BA$ və $BC$ toxunanları çəkilmişdir. $\angle OBA=25^\circ$ olarsa, $\angle ABC$-ni tapın.',
  '[{"key": "A", "text": "$50^\\circ$"}, {"key": "B", "text": "$25^\\circ$"}, {"key": "C", "text": "$60^\\circ$"}, {"key": "D", "text": "$65^\\circ$"}, {"key": "E", "text": "$130^\\circ$"}]'::jsonb, 'A', NULL, NULL,
  '$BO$ — iki toxunan arasındakı bucağın tənbölənidir: $\angle ABC=2\cdot25^\circ=50^\circ$.',
  2025, 'I', 177, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0015 | əsas: 2025 toplu, I hissə, səh.177 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0015', '/images/tasks/CVD-0015.png', 'Çevrəyə xaricdəki B nöqtəsindən BA və BC toxunanları, OA, OB, OC parçaları', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Mərkəzi bucaq. Daxilə çəkilmiş bucaq. Toxunanla vətər arasındakı bucaq'), 'original', 'own', 'az', 'draft', 'closed',
  'Mərkəzi $O$ nöqtəsində olan çevrəyə $BA$ və $BC$ toxunanları çəkilmişdir. $\angle OBA=35^\circ$ olarsa, $\angle ABC$-ni tapın.',
  '[{"key": "A", "text": "$55^\\circ$"}, {"key": "B", "text": "$80^\\circ$"}, {"key": "C", "text": "$110^\\circ$"}, {"key": "D", "text": "$70^\\circ$"}, {"key": "E", "text": "$35^\\circ$"}]'::jsonb, 'D', NULL, NULL,
  '$BO$ — iki toxunan arasındakı bucağın tənbölənidir: $\angle ABC=2\cdot35^\circ=70^\circ$.',
  2025, 'I', 177, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0016 | əsas: 2025 toplu, I hissə, səh.177 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0016', '/images/tasks/CVD-0016.png', 'BC diametrli çevrə, A nöqtəsi; n — A ilə B arasındakı qövsdə', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Mərkəzi bucaq. Daxilə çəkilmiş bucaq. Toxunanla vətər arasındakı bucaq'), 'original', 'own', 'az', 'draft', 'closed',
  'Mərkəzi $O$ nöqtəsində olan çevrədə $BC$ diametrdir və $AnB$ qövsünün dərəcə ölçüsü $52^\circ$ olarsa, $ABC$ bucağını tapın.',
  '[{"key": "A", "text": "$128^\\circ$"}, {"key": "B", "text": "$38^\\circ$"}, {"key": "C", "text": "$64^\\circ$"}, {"key": "D", "text": "$26^\\circ$"}, {"key": "E", "text": "$52^\\circ$"}]'::jsonb, 'C', NULL, NULL,
  '$\angle ABC$ $AC$ qövsünə söykənir: $\cup AC=180^\circ-52^\circ=128^\circ$. $\angle ABC=64^\circ$.',
  2025, 'I', 177, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0017 | əsas: 2025 toplu, I hissə, səh.177 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0017', '/images/tasks/CVD-0017.png', 'AB diametrli çevrə, AC vətəri; n — A ilə C arasındakı qövsdə', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Mərkəzi bucaq. Daxilə çəkilmiş bucaq. Toxunanla vətər arasındakı bucaq'), 'original', 'own', 'az', 'draft', 'closed',
  'Mərkəzi $O$ nöqtəsində olan çevrədə $AB$ diametrdir və $AnC$ qövsünün dərəcə ölçüsü $74^\circ$ olarsa, $BAC$ bucağını tapın.',
  '[{"key": "A", "text": "$37^\\circ$"}, {"key": "B", "text": "$106^\\circ$"}, {"key": "C", "text": "$16^\\circ$"}, {"key": "D", "text": "$74^\\circ$"}, {"key": "E", "text": "$53^\\circ$"}]'::jsonb, 'E', NULL, NULL,
  '$\angle BAC$ $BC$ qövsünə söykənir: $\cup BC=180^\circ-74^\circ=106^\circ$; $\angle BAC=53^\circ$.',
  2025, 'I', 177, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0018 | əsas: 2025 toplu, I hissə, səh.177 №27
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0018', '/images/tasks/CVD-0018.png', 'Çevrədə AB və CD vətərləri K nöqtəsində kəsişir; m — A ilə C, n — B ilə D arasındakı qövsdə', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Mərkəzi bucaq. Daxilə çəkilmiş bucaq. Toxunanla vətər arasındakı bucaq'), 'original', 'own', 'az', 'draft', 'open',
  '$AB$ və $CD$ — vətərlər, $K$ — onların kəsişmə nöqtəsi, $\angle AKC=70^\circ$ və $BnD$ qövsünün dərəcə ölçüsü $95^\circ$ olarsa, $AmC$ qövsünün dərəcə ölçüsünü tapın.',
  NULL, NULL, NULL, '45',
  'Vətərlərin kəsişməsindən alınan bucaq qövslərin yarım cəminə bərabərdir: $70^\circ=\dfrac{\cup AmC+95^\circ}{2}\Rightarrow\cup AmC=45^\circ$.',
  2025, 'I', 177, 27)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0019 | əsas: 2025 toplu, I hissə, səh.177 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0019', '/images/tasks/CVD-0019.png', 'AD diametrli çevrə; çevrə üzərində C və B nöqtələri, AC, BD, DC vətərləri', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Mərkəzi bucaq. Daxilə çəkilmiş bucaq. Toxunanla vətər arasındakı bucaq'), 'original', 'own', 'az', 'draft', 'closed',
  'Mərkəzi $O$ nöqtəsində olan çevrədə $AD$ diametr, $AC=BD$ və $\angle BDC=36^\circ$ olarsa, $\angle CAD$-ni tapın.',
  '[{"key": "A", "text": "$27^\\circ$"}, {"key": "B", "text": "$36^\\circ$"}, {"key": "C", "text": "$54^\\circ$"}, {"key": "D", "text": "$18^\\circ$"}, {"key": "E", "text": "$72^\\circ$"}]'::jsonb, 'A', NULL, NULL,
  '$AC=BD\Rightarrow\cup AC=\cup BD$, buradan $\cup AB=\cup CD$. $\angle BDC=36^\circ\Rightarrow\cup BC=72^\circ$. $AD$ diametr: $\cup CD+\cup BC+\cup AB=180^\circ\Rightarrow2\cup CD=108^\circ$, $\cup CD=54^\circ$. $\angle CAD=27^\circ$.',
  2025, 'I', 177, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0020 | əsas: 2025 toplu, I hissə, səh.177 №29
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0020', '/images/tasks/CVD-0020.png', 'AB diametrli çevrə, AB-yə perpendikulyar CD vətəri, OC radiusu', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Mərkəzi bucaq. Daxilə çəkilmiş bucaq. Toxunanla vətər arasındakı bucaq'), 'original', 'own', 'az', 'draft', 'closed',
  'Mərkəzi $O$ nöqtəsində olan çevrədə $AB$ diametr, $\cup AmD=\cup AnC$ və $\angle DCO=25^\circ$ olarsa, $\angle BOC$-ni tapın.',
  '[{"key": "A", "text": "$125^\\circ$"}, {"key": "B", "text": "$50^\\circ$"}, {"key": "C", "text": "$130^\\circ$"}, {"key": "D", "text": "$65^\\circ$"}, {"key": "E", "text": "$115^\\circ$"}]'::jsonb, 'E', NULL, NULL,
  'Qövslər bərabərdir, ona görə $C$ və $D$ $AB$-yə nəzərən simmetrikdir. $OCD$ bərabəryanlıdır: $\angle COD=180^\circ-2\cdot25^\circ=130^\circ$, $\angle AOC=65^\circ$. $\angle BOC=180^\circ-65^\circ=115^\circ$.',
  2025, 'I', 177, 29)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0021 | əsas: 2025 toplu, I hissə, səh.178 №39
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0021', '/images/tasks/CVD-0021.png', 'AB diametrli çevrə, M nöqtəsi, MB və AM vətərləri', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Mərkəzi bucaq. Daxilə çəkilmiş bucaq. Toxunanla vətər arasındakı bucaq'), 'original', 'own', 'az', 'draft', 'closed',
  '$O$ nöqtəsi çevrənin mərkəzi, $AB$ diametr, $MB=8$ sm və $\angle MBA=60^\circ$ olarsa, $A$ nöqtəsindən $BM$ düz xəttinə qədər olan məsafəni tapın.',
  '[{"key": "A", "text": "$8$ sm"}, {"key": "B", "text": "$4 \\sqrt{3}$ sm"}, {"key": "C", "text": "$16$ sm"}, {"key": "D", "text": "$8 \\sqrt{3}$ sm"}, {"key": "E", "text": "$4$ sm"}]'::jsonb, 'D', NULL, NULL,
  '$\angle AMB=90^\circ$ (diametrə söykənən bucaq), deməli $A$-dan $BM$-ə məsafə $AM$-dir. $AM=MB\operatorname{tg}60^\circ=8\sqrt3$ sm.',
  2025, 'I', 178, 39)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0022 | əsas: 2025 toplu, I hissə, səh.178 №40
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0022', '/images/tasks/CVD-0022.png', 'AB diametrli çevrə, BM və AM vətərləri', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Mərkəzi bucaq. Daxilə çəkilmiş bucaq. Toxunanla vətər arasındakı bucaq'), 'original', 'own', 'az', 'draft', 'closed',
  '$O$ nöqtəsi çevrənin mərkəzidir, $AB$ diametr, $AB=14$ sm, $\angle MBA=30^\circ$. $A$ nöqtəsindən $BM$ düz xəttinə qədər olan məsafəni tapın.',
  '[{"key": "A", "text": "$7$ sm"}, {"key": "B", "text": "$3{,}5$ sm"}, {"key": "C", "text": "$14$ sm"}, {"key": "D", "text": "$7 \\sqrt{3}$ sm"}, {"key": "E", "text": "$7 \\sqrt{2}$ sm"}]'::jsonb, 'A', NULL, NULL,
  '$AM\perp BM$; $AM=AB\sin30^\circ=7$ sm.',
  2025, 'I', 178, 40)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0023 | əsas: 2025 toplu, I hissə, səh.178 №41
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0023', '/images/tasks/CVD-0023.png', 'BC diametrli çevrə; xaricdəki A nöqtəsindən AB və AC kəsənləri çevrəni M və N-də kəsir', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Mərkəzi bucaq. Daxilə çəkilmiş bucaq. Toxunanla vətər arasındakı bucaq'), 'original', 'own', 'az', 'draft', 'closed',
  'Mərkəzi $O$ nöqtəsi olan çevrədə $BC$ diametrdir. $A$ nöqtəsindən çəkilmiş kəsənlər çevrəni $M$, $B$ və $N$, $C$ nöqtələrində kəsir. $BM$ və $NC$ qövsləri bərabər, $MN$ qövsü isə $80^\circ$-dir. $\angle BAC$-ni tapın.',
  '[{"key": "A", "text": "$80^\\circ$"}, {"key": "B", "text": "$40^\\circ$"}, {"key": "C", "text": "$100^\\circ$"}, {"key": "D", "text": "$65^\\circ$"}, {"key": "E", "text": "$50^\\circ$"}]'::jsonb, 'E', NULL, NULL,
  'Xaricdəki nöqtədən çəkilmiş kəsənlər arasındakı bucaq qövslərin yarım fərqinə bərabərdir: $\angle BAC=\dfrac{\cup BC-\cup MN}{2}=\dfrac{180^\circ-80^\circ}{2}=50^\circ$.',
  2025, 'I', 178, 41)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0024 | əsas: 2025 toplu, I hissə, səh.178 №42
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0024', '/images/tasks/CVD-0024.png', 'BC diametrli çevrə, C nöqtəsində AC toxunanı, AB kəsəni çevrəni D-də kəsir', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Mərkəzi bucaq. Daxilə çəkilmiş bucaq. Toxunanla vətər arasındakı bucaq'), 'original', 'own', 'az', 'draft', 'closed',
  'Mərkəzi $O$ nöqtəsi olan çevrədə $BC$ diametr, $AC$ — çevrəyə $C$ nöqtəsində toxunan, $AB$ çevrəni $D$ nöqtəsində kəsir. $CD$ və $DB$ qövslərinin dərəcə ölçüləri $1:2$ nisbətindədirsə, $\angle BAC$-ni tapın.',
  '[{"key": "A", "text": "$30^\\circ$"}, {"key": "B", "text": "$60^\\circ$"}, {"key": "C", "text": "$15^\\circ$"}, {"key": "D", "text": "$45^\\circ$"}, {"key": "E", "text": "$75^\\circ$"}]'::jsonb, 'B', NULL, NULL,
  '$\cup CD+\cup DB=180^\circ$, nisbət $1:2$: $\cup CD=60^\circ$. $\angle ABC=\dfrac{\cup CD}{2}=30^\circ$. $ABC$ üçbucağında $\angle C=90^\circ$ (toxunan diametrə perpendikulyardır): $\angle BAC=60^\circ$.',
  2025, 'I', 178, 42)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0025 | əsas: 2025 toplu, I hissə, səh.178 №47
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0025', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Mərkəzi bucaq. Daxilə çəkilmiş bucaq. Toxunanla vətər arasındakı bucaq'), 'original', 'own', 'az', 'draft', 'closed',
  'Çevrənin bir nöqtəsindən hər birinin uzunluğu $6$ sm olan qarşılıqlı perpendikulyar iki vətər çəkilmişdir. Bu çevrənin radiusunun uzunluğunu tapın.',
  '[{"key": "A", "text": "$6$ sm"}, {"key": "B", "text": "$6 \\sqrt{2}$ sm"}, {"key": "C", "text": "$3 \\sqrt{2}$ sm"}, {"key": "D", "text": "$2 \\sqrt{3}$ sm"}, {"key": "E", "text": "$3$ sm"}]'::jsonb, 'C', NULL, NULL,
  '$90^\circ$-li daxilə çəkilmiş bucaq diametrə söykənir: diametr $\sqrt{36+36}=6\sqrt2$, $R=3\sqrt2$ sm.',
  2025, 'I', 178, 47)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0026 | əsas: 2025 toplu, I hissə, səh.178 №48
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Mərkəzi bucaq. Daxilə çəkilmiş bucaq. Toxunanla vətər arasındakı bucaq'), 'original', 'own', 'az', 'draft', 'closed',
  'Radiusu $5$ sm olan çevrənin bir nöqtəsindən qarşılıqlı perpendikulyar olan iki bərabər vətər çəkilmişdir. Bu vətərlərin uzunluğunu tapın.',
  '[{"key": "A", "text": "$10 \\sqrt{2}$ sm"}, {"key": "B", "text": "$10$ sm"}, {"key": "C", "text": "$5 \\sqrt{2}$ sm"}, {"key": "D", "text": "$2{,}5$ sm"}, {"key": "E", "text": "$5$ sm"}]'::jsonb, 'C', NULL, NULL,
  'Vətərlərin uclarını birləşdirən parça diametrdir ($10$): $a\sqrt2=10\Rightarrow a=5\sqrt2$ sm.',
  2025, 'I', 178, 48)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0027 | əsas: 2025 toplu, I hissə, səh.179 №62
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0027', '/images/tasks/CVD-0027.png', 'Çevrə, OA və OC radiusları, kiçik AC qövsündə B nöqtəsi; BA, BC vətərləri', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Mərkəzi bucaq. Daxilə çəkilmiş bucaq. Toxunanla vətər arasındakı bucaq'), 'original', 'own', 'az', 'draft', 'closed',
  'Mərkəzi $O$ nöqtəsində olan çevrədə $\angle AOC=140^\circ$ olarsa ($B$ nöqtəsi kiçik $AC$ qövsü üzərindədir), $ABC$ bucağının dərəcə ölçüsünü tapın.',
  '[{"key": "A", "text": "$70^\\circ$"}, {"key": "B", "text": "$110^\\circ$"}, {"key": "C", "text": "$140^\\circ$"}, {"key": "D", "text": "$100^\\circ$"}, {"key": "E", "text": "$120^\\circ$"}]'::jsonb, 'B', NULL, NULL,
  '$\angle ABC$ $B$-ni saxlamayan böyük $AC$ qövsünə söykənir: $360^\circ-140^\circ=220^\circ$. $\angle ABC=110^\circ$.',
  2025, 'I', 179, 62)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0028 | əsas: 2025 toplu, I hissə, səh.179 №63
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0028', '/images/tasks/CVD-0028.png', 'Çevrə, OA və OC radiusları, B nöqtəsi kiçik AC qövsündə', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Mərkəzi bucaq. Daxilə çəkilmiş bucaq. Toxunanla vətər arasındakı bucaq'), 'original', 'own', 'az', 'draft', 'closed',
  'Mərkəzi $O$ nöqtəsində olan çevrədə $\angle ABC=125^\circ$ olarsa ($B$ nöqtəsi kiçik $AC$ qövsü üzərindədir), $AOC$ bucağının dərəcə ölçüsünü tapın.',
  '[{"key": "A", "text": "$55^\\circ$"}, {"key": "B", "text": "$135^\\circ$"}, {"key": "C", "text": "$125^\\circ$"}, {"key": "D", "text": "$110^\\circ$"}, {"key": "E", "text": "$70^\\circ$"}]'::jsonb, 'D', NULL, NULL,
  'Böyük $AC$ qövsü $2\cdot125^\circ=250^\circ$; kiçik qövs $110^\circ$, $\angle AOC=110^\circ$.',
  2025, 'I', 179, 63)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0029 | əsas: 2025 toplu, I hissə, səh.180 №75
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0029', '/images/tasks/CVD-0029.png', 'CA diametrli çevrə; yuxarıda D, aşağıda B nöqtəsi; CDA və CBA üçbucaqları', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Mərkəzi bucaq. Daxilə çəkilmiş bucaq. Toxunanla vətər arasındakı bucaq'), 'original', 'own', 'az', 'draft', 'closed',
  '$O$ nöqtəsi çevrənin mərkəzi, $CA$ diametr, $D$ və $B$ nöqtələri çevrə üzərindədir ($AC$-nin müxtəlif tərəflərində). $\angle DAC=32^\circ$, $\angle ACB=41^\circ$ olarsa, $\angle BCD$-ni tapın.',
  '[{"key": "A", "text": "$73^\\circ$"}, {"key": "B", "text": "$81^\\circ$"}, {"key": "C", "text": "$122^\\circ$"}, {"key": "D", "text": "$99^\\circ$"}, {"key": "E", "text": "$58^\\circ$"}]'::jsonb, 'D', NULL, NULL,
  '$\angle ADC=90^\circ$, ona görə $\angle ACD=90^\circ-32^\circ=58^\circ$. $\angle BCD=41^\circ+58^\circ=99^\circ$.',
  2025, 'I', 180, 75)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0030 | əsas: 2025 toplu, I hissə, səh.180 №76
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0030', '/images/tasks/CVD-0030.png', 'CA diametrli çevrə, D və B nöqtələri, CDA və CBA üçbucaqları', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Mərkəzi bucaq. Daxilə çəkilmiş bucaq. Toxunanla vətər arasındakı bucaq'), 'original', 'own', 'az', 'draft', 'closed',
  '$O$ nöqtəsi çevrənin mərkəzi, $CA$ diametr, $D$ və $B$ nöqtələri çevrə üzərindədir ($AC$-nin müxtəlif tərəflərində). $\angle BAD=75^\circ$, $\angle ACD=52^\circ$ olarsa, $\angle CAB$-ni tapın.',
  '[{"key": "A", "text": "$38^\\circ$"}, {"key": "B", "text": "$37^\\circ$"}, {"key": "C", "text": "$15^\\circ$"}, {"key": "D", "text": "$52^\\circ$"}, {"key": "E", "text": "$23^\\circ$"}]'::jsonb, 'B', NULL, NULL,
  '$\angle ADC=90^\circ\Rightarrow\angle CAD=90^\circ-52^\circ=38^\circ$. $\angle CAB=75^\circ-38^\circ=37^\circ$.',
  2025, 'I', 180, 76)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0031 | əsas: 2025 toplu, I hissə, səh.183 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0031', '/images/tasks/CVD-0031.png', 'M nöqtəsindən çevrəyə MK toxunanı və M-N-P kəsəni', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrədə mütənasib parçalar. Toxunan və kəsənin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$MK$ — çevrəyə toxunan, $MP$ — kəsən ($N$ çevrə ilə yaxın kəsişmə nöqtəsidir). $MK=10$ sm, $MP=20$ sm olarsa, $MN$-i tapın.',
  '[{"key": "A", "text": "$5$ sm"}, {"key": "B", "text": "$4$ sm"}, {"key": "C", "text": "$15$ sm"}, {"key": "D", "text": "$2{,}5$ sm"}, {"key": "E", "text": "$10$ sm"}]'::jsonb, 'A', NULL, NULL,
  'Toxunan və kəsən teoremi: $MK^2=MN\cdot MP\Rightarrow MN=\dfrac{100}{20}=5$ sm.',
  2025, 'I', 183, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0032 | əsas: 2025 toplu, I hissə, səh.183 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0032', '/images/tasks/CVD-0032.png', 'M nöqtəsindən çevrəyə MK toxunanı və M-N-P kəsəni', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrədə mütənasib parçalar. Toxunan və kəsənin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$MK$ — çevrəyə toxunan, $MP$ — kəsən ($N$ yaxın kəsişmə nöqtəsidir). $MK=12$ sm, $MN=8$ sm olarsa, $MP$-ni tapın.',
  '[{"key": "A", "text": "$20$ sm"}, {"key": "B", "text": "$16$ sm"}, {"key": "C", "text": "$12$ sm"}, {"key": "D", "text": "$24$ sm"}, {"key": "E", "text": "$18$ sm"}]'::jsonb, 'E', NULL, NULL,
  '$MP=\dfrac{MK^2}{MN}=\dfrac{144}{8}=18$ sm.',
  2025, 'I', 183, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0033 | əsas: 2025 toplu, I hissə, səh.183 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0033', '/images/tasks/CVD-0033.png', 'O mərkəzli çevrə, M nöqtəsindən MA toxunanı və mərkəzdən keçən MB kəsəni', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrədə mütənasib parçalar. Toxunan və kəsənin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$O$ mərkəzli çevrənin radiusu $4$ sm-dir. $MA$ — toxunan, $MB$ — mərkəzdən keçən kəsəndir ($B$ uzaq kəsişmə nöqtəsi). $MB=3MA$ olarsa, $MO$-nu tapın.',
  '[{"key": "A", "text": "$4$ sm"}, {"key": "B", "text": "$8$ sm"}, {"key": "C", "text": "$5$ sm"}, {"key": "D", "text": "$\\dfrac{20}{3}$ sm"}, {"key": "E", "text": "$6$ sm"}]'::jsonb, 'C', NULL, NULL,
  '$MO=x$: $MB=x+4$, yaxın kəsişmə nöqtəsinə qədər $x-4$. $MA^2=(x-4)(x+4)$ və $MA=\dfrac{x+4}{3}$: $\dfrac{(x+4)^2}{9}=(x-4)(x+4)\Rightarrow x+4=9x-36\Rightarrow x=5$ sm.',
  2025, 'I', 183, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0034 | əsas: 2025 toplu, I hissə, səh.183 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0034', '/images/tasks/CVD-0034.png', 'DC diametrli çevrə, A nöqtəsindən AC və AB toxunanları, BC vətəri', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrədə mütənasib parçalar. Toxunan və kəsənin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  'Mərkəzi $O$ nöqtəsində olan çevrənin $DC$ diametri $10$ sm-dir. $AC$ və $AB$ toxunanları arasındakı bucaq $90^\circ$ olarsa, $BC$-ni tapın.',
  '[{"key": "A", "text": "$5 \\sqrt{3}$ sm"}, {"key": "B", "text": "$5 \\sqrt{2}$ sm"}, {"key": "C", "text": "$5$ sm"}, {"key": "D", "text": "$10$ sm"}, {"key": "E", "text": "$10 \\sqrt{2}$ sm"}]'::jsonb, 'B', NULL, NULL,
  '$R=5$. $\angle BAC=90^\circ$ və $AB=AC$; $ABOC$ kvadratdır ($AC=R=5$). $BC$ onun diaqonalıdır: $5\sqrt2$ sm.',
  2025, 'I', 183, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0035 | əsas: 2025 toplu, I hissə, səh.183 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0035', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrədə mütənasib parçalar. Toxunan və kəsənin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  'Tərəfləri çevrəyə toxunan düz bucağın təpə nöqtəsindən həmin çevrəyə ən yaxın məsafə $11$ sm olarsa, çevrənin radiusunu tapın.',
  '[{"key": "A", "text": "$-11 + 11 \\sqrt{2}$ sm"}, {"key": "B", "text": "$11 + 11 \\sqrt{2}$ sm"}, {"key": "C", "text": "$11$ sm"}, {"key": "D", "text": "$11 \\sqrt{2}$ sm"}, {"key": "E", "text": "$22$ sm"}]'::jsonb, 'B', NULL, NULL,
  'Təpədən mərkəzə məsafə $R\sqrt2$, ən yaxın nöqtəyə $R\sqrt2-R=11\Rightarrow R=\dfrac{11}{\sqrt2-1}=11(\sqrt2+1)$ sm.',
  2025, 'I', 183, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0036 | əsas: 2025 toplu, I hissə, səh.183 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0036', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrədə mütənasib parçalar. Toxunan və kəsənin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  'Çevrənin kəsişən iki vətərindən birinci vətər $8$ sm və $18$ sm-lik hissələrə, ikincisi isə $4:9$ nisbətində bölünmüşdür. İkinci vətərin uzunluğunu tapın.',
  '[{"key": "A", "text": "$52$ sm"}, {"key": "B", "text": "$24$ sm"}, {"key": "C", "text": "$18$ sm"}, {"key": "D", "text": "$26$ sm"}, {"key": "E", "text": "$13$ sm"}]'::jsonb, 'D', NULL, NULL,
  '$4x\cdot9x=8\cdot18\Rightarrow36x^2=144\Rightarrow x=2$. Vətər $13x=26$ sm.',
  2025, 'I', 183, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0037 | əsas: 2025 toplu, I hissə, səh.183 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0037', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrədə mütənasib parçalar. Toxunan və kəsənin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  'Kəsişən iki vətərdən birinci vətər $32$ sm və $2$ sm-lik hissələrə, ikincisi isə yarıya bölünmüşdür. İkinci vətərin uzunluğunu tapın.',
  '[{"key": "A", "text": "$32$ sm"}, {"key": "B", "text": "$16$ sm"}, {"key": "C", "text": "$8$ sm"}, {"key": "D", "text": "$17$ sm"}, {"key": "E", "text": "$34$ sm"}]'::jsonb, 'B', NULL, NULL,
  '$x^2=32\cdot2=64\Rightarrow x=8$. Vətər $16$ sm.',
  2025, 'I', 183, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0038 | əsas: 2025 toplu, I hissə, səh.183 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0038', '/images/tasks/CVD-0038.png', 'M nöqtəsindən çevrəyə MA və MB toxunanları, OA radiusu, MO parçası', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrədə mütənasib parçalar. Toxunan və kəsənin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$MA$ və $MB$ çevrəyə toxunanlar, $O$ — çevrənin mərkəzidir. $AO=8$ sm, $MA+MB=30$ sm-dir. $MO$ parçasının uzunluğunu tapın.',
  '[{"key": "A", "text": "$23$ sm"}, {"key": "B", "text": "$15$ sm"}, {"key": "C", "text": "$17$ sm"}, {"key": "D", "text": "$\\sqrt{241}$ sm"}, {"key": "E", "text": "$19$ sm"}]'::jsonb, 'C', NULL, NULL,
  'Toxunanlar bərabərdir: $MA=15$. $OA\perp MA$: $MO=\sqrt{15^2+8^2}=17$ sm.',
  2025, 'I', 183, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0039 | əsas: 2025 toplu, I hissə, səh.183 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0039', '/images/tasks/CVD-0039.png', 'O mərkəzli çevrə, OC radiusu AB vətərinə D nöqtəsində perpendikulyardır', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrədə mütənasib parçalar. Toxunan və kəsənin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  '$O$ nöqtəsi çevrənin mərkəzi, $OC$ radiusu $AB$ vətərinə perpendikulyardır və onu $D$ nöqtəsində kəsir. $OD=6$ sm, $OC=10$ sm olarsa, $AB$ vətərinin uzunluğunu tapın.',
  '[{"key": "A", "text": "$10$ sm"}, {"key": "B", "text": "$8$ sm"}, {"key": "C", "text": "$12$ sm"}, {"key": "D", "text": "$20$ sm"}, {"key": "E", "text": "$16$ sm"}]'::jsonb, 'E', NULL, NULL,
  'Radiusa perpendikulyar vətər yarıya bölünür: $AD=\sqrt{100-36}=8$, $AB=16$ sm.',
  2025, 'I', 183, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0040 | əsas: 2025 toplu, I hissə, səh.184 №19
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0040', '/images/tasks/CVD-0040.png', 'AD və CF diametrli çevrə; B və E nöqtələri; ABC və DEF bucaqları', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrədə mütənasib parçalar. Toxunan və kəsənin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  'Mərkəzi $O$ nöqtəsində olan çevrədə $AD$ və $CF$ diametrlərdir, $B$ nöqtəsi kiçik $AC$ qövsü üzərində, $E$ nöqtəsi isə kiçik $DF$ qövsü üzərindədir. $\angle AOC:\angle ABC=2:5$ olarsa, $\angle DEF$-i tapın.',
  '[{"key": "A", "text": "$120^\\circ$"}, {"key": "B", "text": "$150^\\circ$"}, {"key": "C", "text": "$140^\\circ$"}, {"key": "D", "text": "$30^\\circ$"}, {"key": "E", "text": "$60^\\circ$"}]'::jsonb, 'B', NULL, NULL,
  '$\angle AOC=x$. $B$ kiçik $AC$ qövsündədir, ona görə $\angle ABC=\dfrac{360^\circ-x}{2}$. $\dfrac{x}{(360^\circ-x)/2}=\dfrac25\Rightarrow5x=360^\circ-x\Rightarrow x=60^\circ$. $\angle DOF=\angle AOC=60^\circ$ (qarşılıqlı), $E$ kiçik $DF$ qövsündədir: $\angle DEF=\dfrac{360^\circ-60^\circ}{2}=150^\circ$.',
  2025, 'I', 184, 19)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0041 | əsas: 2025 toplu, I hissə, səh.184 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0041', '/images/tasks/CVD-0041.png', 'İki çevrə, onların AB və CD ortaq xarici toxunanları, O1D parçası', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrədə mütənasib parçalar. Toxunan və kəsənin xassələri'), 'original', 'own', 'az', 'draft', 'closed',
  'Mərkəzləri $O_1$ və $O_2$ nöqtələrində olan çevrələrdə $AB$ və $CD$ ortaq xarici toxunanlardır. $O_1$ mərkəzli çevrənin radiusu $9$, $AB=5a-3$ və $CD=2a+6$ olarsa, $O_1$ nöqtəsi ilə $D$ nöqtəsi arasındakı məsafəni tapın.',
  '[{"key": "A", "text": "$13$"}, {"key": "B", "text": "$21$"}, {"key": "C", "text": "$9$"}, {"key": "D", "text": "$15$"}, {"key": "E", "text": "$12$"}]'::jsonb, 'D', NULL, NULL,
  'Ortaq xarici toxunanların toxunma nöqtələri arasındakı parçalar bərabərdir: $5a-3=2a+6\Rightarrow a=3$, $CD=12$. $O_1C\perp CD$: $O_1D=\sqrt{81+144}=15$.',
  2025, 'I', 184, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0042 | əsas: 2025 toplu, I hissə, səh.184 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0042', '/images/tasks/CVD-0042.png', 'İki çevrə, AB və CD ortaq xarici toxunanları, AB üzərindəki K nöqtəsindən çevrələrə toxunanlar CD-ni M və N-də kəsir', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrədə mütənasib parçalar. Toxunan və kəsənin xassələri'), 'original', 'own', 'az', 'draft', 'written',
  'Mərkəzləri $O_1$ və $O_2$ nöqtələrində olan çevrələrdə $AB$ və $CD$ ortaq xarici toxunanlardır. $K\in AB$ nöqtəsindən çevrələrə çəkilmiş $KM$ və $KN$ toxunanları $CD$-ni $M$ və $N$ nöqtələrində kəsir. $P_{\triangle MKN}=18$ olarsa, $AB$-ni tapın.',
  NULL, NULL, NULL, '9',
  'Bir nöqtədən çəkilmiş toxunanlar bərabərdir. Perimetr $MK+KN+MN$ toxunanların hissələrinə ayrılır və $AB+CD=2AB$-yə bərabər olur. $2AB=18\Rightarrow AB=9$.',
  2025, 'I', 184, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0043 | əsas: 2025 toplu, I hissə, səh.185 №36
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0043', '/images/tasks/CVD-0043.png', 'Çevrədə AB və CD vətərləri K nöqtəsində kəsişir', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrədə mütənasib parçalar. Toxunan və kəsənin xassələri'), 'original', 'own', 'az', 'draft', 'written',
  'Çevrənin $AB$ və $CD$ vətərləri $K$ nöqtəsində kəsişir. $CK\cdot KD=30$, $AK-KB=7$ olarsa, $AB$-ni tapın.',
  NULL, NULL, NULL, '13',
  '$AK\cdot KB=CK\cdot KD=30$. $KB=x$, $AK=x+7$: $x(x+7)=30\Rightarrow x=3$. $AB=3+10=13$.',
  2025, 'I', 185, 36)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0044 | əsas: 2025 toplu, I hissə, səh.185 №37
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0044', '/images/tasks/CVD-0044.png', 'Çevrədə AB və CD vətərləri M nöqtəsində kəsişir', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrədə mütənasib parçalar. Toxunan və kəsənin xassələri'), 'original', 'own', 'az', 'draft', 'written',
  'Çevrənin $AB$ və $CD$ vətərləri $M$ nöqtəsində kəsişir. $AM\cdot MB=33$, $DM-MC=8$ olarsa, $CD$-ni tapın.',
  NULL, NULL, NULL, '14',
  '$CM\cdot MD=33$; $MC=x$, $MD=x+8$: $x(x+8)=33\Rightarrow x=3$. $CD=3+11=14$.',
  2025, 'I', 185, 37)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0045 | əsas: 2025 toplu, I hissə, səh.187 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0045', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş üçbucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  'Radiusu $7{,}5$ sm olan çevrə daxilinə çəkilmiş düzbucaqlı üçbucağın hipotenuzunu tapın.',
  '[{"key": "A", "text": "$12$ sm"}, {"key": "B", "text": "$7{,}5$ sm"}, {"key": "C", "text": "$30$ sm"}, {"key": "D", "text": "$10$ sm"}, {"key": "E", "text": "$15$ sm"}]'::jsonb, 'E', NULL, NULL,
  'Hipotenuz diametrdir: $15$ sm.',
  2025, 'I', 187, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0046 | əsas: 2025 toplu, I hissə, səh.187 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0046', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş üçbucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  'Hipotenuzu $22$ sm olan düzbucaqlı üçbucağın xaricinə çəkilmiş çevrənin radiusunu tapın.',
  '[{"key": "A", "text": "$22$ sm"}, {"key": "B", "text": "$5{,}5$ sm"}, {"key": "C", "text": "$11$ sm"}, {"key": "D", "text": "$44$ sm"}, {"key": "E", "text": "$10$ sm"}]'::jsonb, 'C', NULL, NULL,
  '$R=\dfrac{c}{2}=11$ sm.',
  2025, 'I', 187, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0047 | əsas: 2025 toplu, I hissə, səh.188 №27
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0047', '/images/tasks/CVD-0047.png', 'Daxilinə çevrə çəkilmiş düzbucaqlı ABC üçbucağı, çevrə hipotenuza D nöqtəsində toxunur', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş üçbucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  'Çevrə xaricinə çəkilmiş $ABC$ düzbucaqlı üçbucağında $\angle C=90^\circ$, çevrə $AB$ hipotenuzuna $D$ nöqtəsində toxunur, $BD=5$ sm və $DA=12$ sm olarsa, çevrənin uzunluğunu tapın.',
  '[{"key": "A", "text": "$8 \\pi$ sm"}, {"key": "B", "text": "$6 \\pi$ sm"}, {"key": "C", "text": "$17 \\pi$ sm"}, {"key": "D", "text": "$12 \\pi$ sm"}, {"key": "E", "text": "$3 \\pi$ sm"}]'::jsonb, 'B', NULL, NULL,
  'Toxunanların bərabərliyi: katetlər $5+r$ və $12+r$, hipotenuz $17$. Pifaqor teoremi: $(5+r)^2+(12+r)^2=17^2\Rightarrow r=3$. Çevrənin uzunluğu $2\pi r=6\pi$ sm.',
  2025, 'I', 188, 27)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0048 | əsas: 2025 toplu, I hissə, səh.188 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0048', '/images/tasks/CVD-0048.png', 'Daxilinə çevrə çəkilmiş düzbucaqlı ABC üçbucağı, çevrə hipotenuza D nöqtəsində toxunur', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş üçbucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  'Çevrə xaricinə çəkilmiş $ABC$ düzbucaqlı üçbucağında $\angle C=90^\circ$, çevrə $AB$ hipotenuzuna $D$ nöqtəsində toxunur, $BD=10$ sm və $DA=3$ sm olarsa, çevrənin uzunluğunu tapın.',
  '[{"key": "A", "text": "$2 \\pi$ sm"}, {"key": "B", "text": "$6 \\pi$ sm"}, {"key": "C", "text": "$4 \\pi$ sm"}, {"key": "D", "text": "$13 \\pi$ sm"}, {"key": "E", "text": "$8 \\pi$ sm"}]'::jsonb, 'C', NULL, NULL,
  'Toxunanların bərabərliyi: katetlər $10+r$ və $3+r$, hipotenuz $13$. Pifaqor teoremi: $(10+r)^2+(3+r)^2=13^2\Rightarrow r=2$. Çevrənin uzunluğu $2\pi r=4\pi$ sm.',
  2025, 'I', 188, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0049 | əsas: 2025 toplu, I hissə, səh.188 №29
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0049', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş üçbucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$60^\circ$-li bucağının qarşısındakı tərəfinin uzunluğu $12$ sm olan üçbucağın xaricinə çəkilmiş çevrənin radiusunu tapın.',
  '[{"key": "A", "text": "$4 \\sqrt{3}$ sm"}, {"key": "B", "text": "$12$ sm"}, {"key": "C", "text": "$6 \\sqrt{3}$ sm"}, {"key": "D", "text": "$2 \\sqrt{3}$ sm"}, {"key": "E", "text": "$6$ sm"}]'::jsonb, 'A', NULL, NULL,
  '$2R=\dfrac{a}{\sin\alpha}=\dfrac{12}{\sqrt3/2}=8\sqrt3\Rightarrow R=4\sqrt3$ sm.',
  2025, 'I', 188, 29)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0050 | əsas: 2025 toplu, I hissə, səh.188 №30
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0050', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş üçbucaqlar'), 'original', 'own', 'az', 'draft', 'closed',
  '$45^\circ$-li bucağının qarşısındakı tərəfinin uzunluğu $10$ sm olan üçbucağın xaricinə çəkilmiş çevrənin radiusunu tapın.',
  '[{"key": "A", "text": "$5 \\sqrt{2}$ sm"}, {"key": "B", "text": "$2 \\sqrt{5}$ sm"}, {"key": "C", "text": "$5$ sm"}, {"key": "D", "text": "$10 \\sqrt{2}$ sm"}, {"key": "E", "text": "$10$ sm"}]'::jsonb, 'A', NULL, NULL,
  '$2R=\dfrac{10}{\sqrt2/2}=10\sqrt2\Rightarrow R=5\sqrt2$ sm.',
  2025, 'I', 188, 30)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0051 | əsas: 2025 toplu, I hissə, səh.189 №45
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0051', '/images/tasks/CVD-0051.png', 'Düzbucaqlı ABC üçbucağı, CD hündürlüyü, ACD və BCD üçbucaqlarının xaricinə çəkilmiş çevrələr', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş üçbucaqlar'), 'original', 'own', 'az', 'draft', 'written',
  'Hipotenuzu $AB$ olan düzbucaqlı $ABC$ üçbucağının $CD$ hündürlüyü çəkilmişdir. $ACD$ və $BCD$ üçbucaqlarının xaricinə çəkilmiş çevrələrin radiusları uyğun olaraq $6$ və $8$-dür. $ABC$ üçbucağının daxilinə çəkilmiş çevrənin radiusunu tapın.',
  NULL, NULL, NULL, '4',
  '$ACD$ və $BCD$ düzbucaqlıdır, hipotenuzları $AC$ və $BC$ xaricə çəkilmiş çevrələrin diametrləridir: $AC=12$, $BC=16$. $AB=20$. $r=\dfrac{AC+BC-AB}{2}=4$.',
  2025, 'I', 189, 45)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0052 | əsas: 2025 toplu, I hissə, səh.189 №46
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0052', '/images/tasks/CVD-0052.png', 'Düzbucaqlı ABC üçbucağı, CD hündürlüyü, ACD və BCD üçbucaqlarının xaricinə çəkilmiş çevrələr', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş üçbucaqlar'), 'original', 'own', 'az', 'draft', 'written',
  'Hipotenuzu $AB$ olan düzbucaqlı $ABC$ üçbucağının $CD$ hündürlüyü çəkilmişdir. $ACD$ və $BCD$ üçbucaqlarının xaricinə çəkilmiş çevrələrin radiusları uyğun olaraq $9$ və $12$-dür. $ABC$ üçbucağının daxilinə çəkilmiş çevrənin radiusunu tapın.',
  NULL, NULL, NULL, '6',
  '$ACD$ və $BCD$ düzbucaqlıdır, hipotenuzları $AC$ və $BC$ xaricə çəkilmiş çevrələrin diametrləridir: $AC=18$, $BC=24$. $AB=30$. $r=\dfrac{AC+BC-AB}{2}=6$.',
  2025, 'I', 189, 46)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0053 | əsas: 2025 toplu, I hissə, səh.189 №47
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0053', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş üçbucaqlar'), 'original', 'own', 'az', 'draft', 'written',
  'İki tərəfi $14$ və $18$ olan üçbucağın üçüncü tərəfinə çəkilən hündürlüyü $12$ olarsa, bu üçbucağın xaricinə çəkilmiş çevrənin radiusunu tapın.',
  NULL, NULL, NULL, '10,5',
  '$b=2R\sin\gamma$ və $h=a\sin\gamma$ əlaqələrindən: $R=\dfrac{ab}{2h}=\dfrac{14\cdot18}{24}=10{,}5$.',
  2025, 'I', 189, 47)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0054 | əsas: 2025 toplu, I hissə, səh.189 №48
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0054', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş üçbucaqlar'), 'original', 'own', 'az', 'draft', 'written',
  'İki tərəfi $20$ və $24$ olan üçbucağın üçüncü tərəfinə çəkilən hündürlüyü $16$ olarsa, bu üçbucağın xaricinə çəkilmiş çevrənin radiusunu tapın.',
  NULL, NULL, NULL, '15',
  '$R=\dfrac{ab}{2h}=\dfrac{480}{32}=15$.',
  2025, 'I', 189, 48)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0055 | əsas: 2025 toplu, I hissə, səh.189 №49
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0055', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş üçbucaqlar'), 'original', 'own', 'az', 'draft', 'written',
  'Düzbucaqlı üçbucağın katetlərindən biri digərinin $75\%$-dir. Bu üçbucağın daxilinə çəkilmiş çevrənin radiusu $3$ olarsa, hipotenuzu tapın.',
  NULL, NULL, NULL, '15',
  'Katetlər $3k$, $4k$, hipotenuz $5k$; $r=\dfrac{3k+4k-5k}{2}=k=3$. Hipotenuz $15$.',
  2025, 'I', 189, 49)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0056 | əsas: 2025 toplu, I hissə, səh.189 №50
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0056', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş üçbucaqlar'), 'original', 'own', 'az', 'draft', 'written',
  'Düzbucaqlı üçbucağın katetlərindən biri digərinin $75\%$-dir. Bu üçbucağın hipotenuzu $20$ olarsa, daxilinə çəkilmiş çevrənin radiusunu tapın.',
  NULL, NULL, NULL, '4',
  'Katetlər $12$ və $16$; $r=\dfrac{12+16-20}{2}=4$.',
  2025, 'I', 189, 50)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0057 | əsas: 2025 toplu, I hissə, səh.189 №51
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0057', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş üçbucaqlar'), 'original', 'own', 'az', 'draft', 'written',
  '$r$ radiuslu çevrə hipotenuzu $c$ olan düzbucaqlı üçbucağın daxilinə çəkilmişdir. $-9,\ r,\ c,\ 24$ ədədləri ədədi silsilə əmələ gətirirsə, üçbucağın perimetrini tapın.',
  NULL, NULL, NULL, '30',
  'Fərq $\dfrac{24+9}{3}=11$: $r=2$, $c=13$. Düzbucaqlı üçbucaqda $a+b=2r+c=17$, perimetr $2r+2c=30$ (üçbucaq $5,12,13$).',
  2025, 'I', 189, 51)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0058 | əsas: 2025 toplu, I hissə, səh.190 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0058', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş çoxbucaqlılar'), 'original', 'own', 'az', 'draft', 'closed',
  'Çevrə daxilinə çəkilmiş dördbucaqlının üç ardıcıl bucağının nisbəti $3:4:6$ kimidir. Dördbucaqlının dördüncü bucağını tapın.',
  '[{"key": "A", "text": "$120^\\circ$"}, {"key": "B", "text": "$60^\\circ$"}, {"key": "C", "text": "$100^\\circ$"}, {"key": "D", "text": "$90^\\circ$"}, {"key": "E", "text": "$80^\\circ$"}]'::jsonb, 'C', NULL, NULL,
  'Qarşı bucaqların cəmi $180^\circ$: $3k+6k=180^\circ\Rightarrow k=20^\circ$. $\angle B=80^\circ$, $\angle D=100^\circ$.',
  2025, 'I', 190, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0059 | əsas: 2025 toplu, I hissə, səh.190 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0059', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş çoxbucaqlılar'), 'original', 'own', 'az', 'draft', 'closed',
  'Çevrə daxilinə çəkilmiş dördbucaqlının üç ardıcıl bucağı $2:3:7$ nisbətindədir. Dördbucaqlının ən kiçik bucağını tapın.',
  '[{"key": "A", "text": "$45^\\circ$"}, {"key": "B", "text": "$30^\\circ$"}, {"key": "C", "text": "$60^\\circ$"}, {"key": "D", "text": "$20^\\circ$"}, {"key": "E", "text": "$40^\\circ$"}]'::jsonb, 'E', NULL, NULL,
  '$2k+7k=180^\circ\Rightarrow k=20^\circ$: bucaqlar $40^\circ,60^\circ,140^\circ$, $\angle D=120^\circ$. Ən kiçiyi $40^\circ$.',
  2025, 'I', 190, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0060 | əsas: 2025 toplu, I hissə, səh.190 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0060', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş çoxbucaqlılar'), 'original', 'own', 'az', 'draft', 'closed',
  'Kvadratın xaricinə çəkilən çevrənin radiusu $5\sqrt2$ sm-dir. Kvadratın tərəfini tapın.',
  '[{"key": "A", "text": "$10$ sm"}, {"key": "B", "text": "$10 \\sqrt{2}$ sm"}, {"key": "C", "text": "$5 \\sqrt{2}$ sm"}, {"key": "D", "text": "$20$ sm"}, {"key": "E", "text": "$5$ sm"}]'::jsonb, 'A', NULL, NULL,
  'Diaqonal $2R=10\sqrt2=a\sqrt2\Rightarrow a=10$ sm.',
  2025, 'I', 190, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0061 | əsas: 2025 toplu, I hissə, səh.190 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0061', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş çoxbucaqlılar'), 'original', 'own', 'az', 'draft', 'closed',
  'Kvadratın xaricinə çəkilən çevrənin radiusu $4$ sm-dir. Kvadratın tərəfini tapın.',
  '[{"key": "A", "text": "$2 \\sqrt{2}$ sm"}, {"key": "B", "text": "$8$ sm"}, {"key": "C", "text": "$4 \\sqrt{2}$ sm"}, {"key": "D", "text": "$8 \\sqrt{2}$ sm"}, {"key": "E", "text": "$4$ sm"}]'::jsonb, 'C', NULL, NULL,
  '$a\sqrt2=8\Rightarrow a=4\sqrt2$ sm.',
  2025, 'I', 190, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0062 | əsas: 2025 toplu, I hissə, səh.191 №31
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0062', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş çoxbucaqlılar'), 'original', 'own', 'az', 'draft', 'closed',
  'Oturacaqları $4$ sm və $16$ sm olan bərabəryanlı trapesiyanın daxilinə çəkilmiş çevrənin radiusunu tapın.',
  '[{"key": "A", "text": "$10$ sm"}, {"key": "B", "text": "$4$ sm"}, {"key": "C", "text": "$8$ sm"}, {"key": "D", "text": "$5$ sm"}, {"key": "E", "text": "$6$ sm"}]'::jsonb, 'B', NULL, NULL,
  'Daxilinə çevrə çəkilibsə, yan tərəflərin cəmi oturacaqların cəminə bərabərdir: yan tərəf $10$. Hündürlük $\sqrt{100-36}=8$, $r=4$ sm.',
  2025, 'I', 191, 31)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0063 | əsas: 2025 toplu, I hissə, səh.191 №32
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0063', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş çoxbucaqlılar'), 'original', 'own', 'az', 'draft', 'closed',
  'İti bucağı $30^\circ$ olan bərabəryanlı trapesiyanın daxilinə çevrə çəkilmişdir. Trapesiyanın orta xətti $12$ sm-dir. Çevrənin radiusunu tapın.',
  '[{"key": "A", "text": "$1{,}5$ sm"}, {"key": "B", "text": "$4$ sm"}, {"key": "C", "text": "$12$ sm"}, {"key": "D", "text": "$6$ sm"}, {"key": "E", "text": "$3$ sm"}]'::jsonb, 'E', NULL, NULL,
  'Yan tərəflərin cəmi oturacaqların cəmi, yəni $24$-dür: yan tərəf $12$. Hündürlük $12\sin30^\circ=6$, $r=3$ sm.',
  2025, 'I', 191, 32)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0064 | əsas: 2025 toplu, I hissə, səh.191 №33
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0064', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş çoxbucaqlılar'), 'original', 'own', 'az', 'draft', 'closed',
  'İti bucağı $60^\circ$, oturacaqları fərqi $4$ sm olan bərabəryanlı trapesiyanın daxilinə çəkilmiş çevrənin radiusunu tapın.',
  '[{"key": "A", "text": "$2 \\sqrt{3}$ sm"}, {"key": "B", "text": "$\\sqrt{3}$ sm"}, {"key": "C", "text": "$1{,}5$ sm"}, {"key": "D", "text": "$3$ sm"}, {"key": "E", "text": "$2$ sm"}]'::jsonb, 'B', NULL, NULL,
  'Yan tərəfin proyeksiyası $\dfrac42=2$; hündürlük $2\operatorname{tg}60^\circ=2\sqrt3$, $r=\sqrt3$ sm.',
  2025, 'I', 191, 33)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0065 | əsas: 2025 toplu, I hissə, səh.192 №34
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0065', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş çoxbucaqlılar'), 'original', 'own', 'az', 'draft', 'closed',
  'Çevrənin xaricinə kiçik oturacağı $4$ sm olan bərabəryanlı trapesiya çəkilmişdir. Çevrənin yan tərəflərlə toxunduğu nöqtələri birləşdirən parçanın uzunluğu $6$ sm olduğunu bilərək, böyük oturacağı tapın.',
  '[{"key": "A", "text": "$10$ sm"}, {"key": "B", "text": "$6$ sm"}, {"key": "C", "text": "$12$ sm"}, {"key": "D", "text": "$8$ sm"}, {"key": "E", "text": "$16$ sm"}]'::jsonb, 'C', NULL, NULL,
  'Yan tərəflərin toxunma nöqtələrini birləşdirən parça $\dfrac{2ab}{a+b}$-yə bərabərdir (oturacaqların harmonik ortası). $\dfrac{8a}{a+4}=6\Rightarrow a=12$ sm.',
  2025, 'I', 192, 34)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0066 | əsas: 2025 toplu, I hissə, səh.192 №35
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0066', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş çoxbucaqlılar'), 'original', 'own', 'az', 'draft', 'closed',
  'Çevrə xaricinə oturacaqları $3$ sm və $6$ sm olan bərabəryanlı trapesiya çəkilmişdir. Çevrənin trapesiyanın yan tərəflərinə toxunma nöqtələrini birləşdirən vətərin uzunluğunu tapın.',
  '[{"key": "A", "text": "$4{,}5$ sm"}, {"key": "B", "text": "$3$ sm"}, {"key": "C", "text": "$5$ sm"}, {"key": "D", "text": "$4$ sm"}, {"key": "E", "text": "$6$ sm"}]'::jsonb, 'D', NULL, NULL,
  'Vətər $\dfrac{2\cdot3\cdot6}{3+6}=4$ sm.',
  2025, 'I', 192, 35)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0067 | əsas: 2025 toplu, I hissə, səh.192 №36
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0067', NULL, NULL, (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş çoxbucaqlılar'), 'original', 'own', 'az', 'draft', 'closed',
  'Oturacaqları $8$ sm, $2$ sm və bir yan tərəfi $5$ sm olan trapesiyanın daxilinə çəkilmiş çevrənin uzunluğunu tapın.',
  '[{"key": "A", "text": "$8 \\pi$ sm"}, {"key": "B", "text": "$\\dfrac{5 \\pi}{2}$ sm"}, {"key": "C", "text": "$5 \\pi$ sm"}, {"key": "D", "text": "$2 \\pi$ sm"}, {"key": "E", "text": "$4 \\pi$ sm"}]'::jsonb, 'E', NULL, NULL,
  'Yan tərəflərin cəmi $8+2=10$, digər yan tərəf $5$ — trapesiya bərabəryanlıdır. Hündürlük $\sqrt{25-9}=4$, $r=2$, çevrənin uzunluğu $4\pi$ sm.',
  2025, 'I', 192, 36)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0068 | əsas: 2025 toplu, I hissə, səh.192 №43
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0068', '/images/tasks/CVD-0068.png', 'Düzbucaqlı ABCD trapesiyası (A və B düz bucaqdır), daxilinə çevrə çəkilib', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş çoxbucaqlılar'), 'original', 'own', 'az', 'draft', 'written',
  'Oturacaqları $BC=3$ və $AD=6$ olan düzbucaqlı $ABCD$ trapesiyasının ($\angle A=\angle B=90^\circ$) daxilinə çəkilmiş çevrənin radiusunun uzunluğunu tapın.',
  NULL, NULL, NULL, '2',
  '$AB=2r$. Daxilinə çevrə çəkildiyindən $AB+CD=AD+BC=9\Rightarrow CD=9-2r$. $CD^2=AB^2+(AD-BC)^2$: $(9-2r)^2=4r^2+9\Rightarrow81-36r=9\Rightarrow r=2$.',
  2025, 'I', 192, 43)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- CVD-0069 | əsas: 2025 toplu, I hissə, səh.192 №44
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('CVD-0069', '/images/tasks/CVD-0069.png', 'Düzbucaqlı ABCD trapesiyası, daxilinə çevrə çəkilib', (SELECT id FROM topics WHERE name='Çevrə və dairə'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çevrə və dairə' AND s.title='Çevrənin daxilinə və xaricinə çəkilmiş çoxbucaqlılar'), 'original', 'own', 'az', 'draft', 'written',
  'Daxilinə çəkilmiş çevrənin uzunluğu $8\pi$, kiçik oturacağı $BC=6$ olan düzbucaqlı $ABCD$ trapesiyasının ($\angle A=\angle B=90^\circ$) böyük oturacağını tapın.',
  NULL, NULL, NULL, '12',
  '$r=4$, $AB=8$. $CD=AD+6-8=AD-2$. $CD^2=64+(AD-6)^2$: $(AD-2)^2=64+(AD-6)^2\Rightarrow8AD=96\Rightarrow AD=12$.',
  2025, 'I', 192, 44)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
