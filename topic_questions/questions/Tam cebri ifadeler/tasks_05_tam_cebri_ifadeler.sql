-- Mövzu: Tam cəbri ifadələr — 35 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- TCI-0001 | əsas: 2025 toplu, I hissə, səh.36 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Birhədli və onun standart şəkli. Natural üstlü qüvvət'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{\left(2\cdot3^{15}+5\cdot3^{14}\right)\cdot33}{\left(11\cdot9^4\right)^2}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$\\dfrac{11}{3}$"}, {"key": "B", "text": "$\\dfrac{1}{11}$"}, {"key": "C", "text": "$\\dfrac{1}{9}$"}, {"key": "D", "text": "$\\dfrac{1}{3}$"}, {"key": "E", "text": "$3$"}]'::jsonb, 'D', NULL, NULL,
  '$2\cdot3^{15}+5\cdot3^{14}=3^{14}(6+5)=11\cdot3^{14}$. Surət: $11\cdot3^{14}\cdot33=11^2\cdot3^{15}$. Məxrəc: $11^2\cdot\left(3^2\right)^8=11^2\cdot3^{16}$. Nisbət: $\dfrac{3^{15}}{3^{16}}=\dfrac{1}{3}$.',
  2025, 'I', 36, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0002 | əsas: 2025 toplu, I hissə, səh.36 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Birhədli və onun standart şəkli. Natural üstlü qüvvət'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{\left(5\cdot2^{13}+3\cdot2^{14}\right)\cdot44}{\left(22\cdot64\right)^2}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$2$"}, {"key": "B", "text": "$\\dfrac{11}{2}$"}, {"key": "C", "text": "$4$"}, {"key": "D", "text": "$1$"}, {"key": "E", "text": "$\\dfrac{1}{2}$"}]'::jsonb, 'A', NULL, NULL,
  '$5\cdot2^{13}+3\cdot2^{14}=2^{13}(5+6)=11\cdot2^{13}$. Surət: $11\cdot2^{13}\cdot44=11^2\cdot2^{15}$. Məxrəc: $(22\cdot64)^2=(11\cdot2^7)^2=11^2\cdot2^{14}$. Nisbət: $2^{15}:2^{14}=2$.',
  2025, 'I', 36, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0003 | əsas: 2025 toplu, I hissə, səh.36 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Birhədli və onun standart şəkli. Natural üstlü qüvvət'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left(-\dfrac{1}{2}a^3\right)^4\cdot\left(-4ab^2\right)^2$ birhədlisinin qüvvəti ilə əmsalının hasilini tapın.',
  '[{"key": "A", "text": "$16$"}, {"key": "B", "text": "$36$"}, {"key": "C", "text": "$-18$"}, {"key": "D", "text": "$1$"}, {"key": "E", "text": "$18$"}]'::jsonb, 'E', NULL, NULL,
  '$\left(-\dfrac{1}{2}a^3\right)^4=\dfrac{1}{16}a^{12}$, $\left(-4ab^2\right)^2=16a^2b^4$. Hasil: $a^{14}b^4$ — əmsalı $1$, qüvvəti $14+4=18$. Cavab: $1\cdot18=18$.',
  2025, 'I', 36, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0004 | əsas: 2025 toplu, I hissə, səh.36 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Birhədli və onun standart şəkli. Natural üstlü qüvvət'), 'original', 'own', 'az', 'draft', 'closed',
  '$8\cdot\left(-0{,}5a^4\right)^3\cdot\left(\dfrac{1}{2}ab^2\right)^2$ birhədlisinin qüvvəti ilə əmsalının hasilini tapın.',
  '[{"key": "A", "text": "$-0{,}25$"}, {"key": "B", "text": "$-18$"}, {"key": "C", "text": "$18$"}, {"key": "D", "text": "$4{,}5$"}, {"key": "E", "text": "$-4{,}5$"}]'::jsonb, 'E', NULL, NULL,
  '$\left(-0{,}5a^4\right)^3=-\dfrac{1}{8}a^{12}$, $\left(\dfrac{1}{2}ab^2\right)^2=\dfrac{1}{4}a^2b^4$. Hasil: $8\cdot\left(-\dfrac{1}{8}\right)\cdot\dfrac{1}{4}a^{14}b^4=-\dfrac{1}{4}a^{14}b^4$. Qüvvət $18$, əmsal $-\dfrac{1}{4}$; hasil: $-\dfrac{18}{4}=-4{,}5$.',
  2025, 'I', 36, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0005 | əsas: 2025 toplu, I hissə, səh.36 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Birhədli və onun standart şəkli. Natural üstlü qüvvət'), 'original', 'own', 'az', 'draft', 'open',
  '$M_1$ birhədlisinin dərəcəsi $7$, $M_2$ birhədlisinin dərəcəsi $9$-dur. Bu birhədlilərin hasilinin dərəcəsini tapın.',
  NULL, NULL, NULL, '16',
  'Birhədlilər vurulduqda dərəcələr toplanır: $7+9=16$.',
  2025, 'I', 36, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0006 | əsas: 2025 toplu, I hissə, səh.36 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Birhədli və onun standart şəkli. Natural üstlü qüvvət'), 'original', 'own', 'az', 'draft', 'open',
  '$M_1$ və $M_2$ birhədlilərinin hasilinin dərəcəsi $31$, $M_1$-in dərəcəsi $13$-dür. $M_2$ birhədlisinin dərəcəsini tapın.',
  NULL, NULL, NULL, '18',
  'Hasilin dərəcəsi dərəcələrin cəminə bərabərdir: $13+d=31\Rightarrow d=18$.',
  2025, 'I', 36, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0007 | əsas: 2025 toplu, I hissə, səh.36 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0007', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Birhədli və onun standart şəkli. Natural üstlü qüvvət'), 'original', 'own', 'az', 'draft', 'open',
  '$\dfrac{8^5+2^{16}}{4^8}$ ifadəsinin qiymətini hesablayın.',
  NULL, NULL, NULL, '1,5',
  '$8^5=2^{15}$, $4^8=2^{16}$. $\dfrac{2^{15}+2^{16}}{2^{16}}=\dfrac{2^{15}(1+2)}{2^{16}}=\dfrac{3}{2}=1{,}5$.',
  2025, 'I', 36, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0008 | əsas: 2025 toplu, I hissə, səh.36 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Çoxhədlilər və onlar üzərində əməllər'), 'original', 'own', 'az', 'draft', 'closed',
  '$a$ parametrinin hansı qiymətində $(x^3+3x^2-4x)(x+a)$ çoxhədlisinin standart şəkildə yazılışında $x^3$-un əmsalı $0$ olar?',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$-3$"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$0$"}, {"key": "E", "text": "$-4$"}]'::jsonb, 'B', NULL, NULL,
  '$x^3$ həddi iki yolla alınır: $x^3\cdot a$ və $3x^2\cdot x$. Əmsal: $a+3=0\Rightarrow a=-3$.',
  2025, 'I', 36, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0009 | əsas: 2025 toplu, I hissə, səh.36 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Çoxhədlilər və onlar üzərində əməllər'), 'original', 'own', 'az', 'draft', 'closed',
  '$3a(a-b+c)+3b(a+b-c)-3c(a-b-c)$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$3(a^2+b^2-c^2)$"}, {"key": "B", "text": "$3(a^2+b^2+c^2)$"}, {"key": "C", "text": "$3(a^2-b^2+c^2)$"}, {"key": "D", "text": "$3(b^2+c^2)$"}, {"key": "E", "text": "$3(a^2+c^2)$"}]'::jsonb, 'B', NULL, NULL,
  '$3a^2-3ab+3ac+3ab+3b^2-3bc-3ac+3bc+3c^2=3a^2+3b^2+3c^2=3(a^2+b^2+c^2)$.',
  2025, 'I', 36, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0010 | əsas: 2025 toplu, I hissə, səh.37 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Çoxhədlilər və onlar üzərində əməllər'), 'original', 'own', 'az', 'draft', 'closed',
  '$4x(x+y-z)-4y(x-y+z)+4z(x+y+z)$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$4(x^2-y^2+z^2)$"}, {"key": "B", "text": "$4(xy+yz+xz)$"}, {"key": "C", "text": "$4(x^2+z^2)$"}, {"key": "D", "text": "$4(x^2+y^2+z^2)$"}, {"key": "E", "text": "$4(x^2+y^2-z^2)$"}]'::jsonb, 'D', NULL, NULL,
  '$4x^2+4xy-4xz-4xy+4y^2-4yz+4xz+4yz+4z^2=4(x^2+y^2+z^2)$.',
  2025, 'I', 37, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0011 | əsas: 2025 toplu, I hissə, səh.37 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0011', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Çoxhədlilər və onlar üzərində əməllər'), 'original', 'own', 'az', 'draft', 'closed',
  '$b$ parametrinin hansı qiymətində $(bx^5+4x^3-2)+(2x^5-5x^4+x+3)$ çoxhədlisinin dərəcəsi $4$ olar?',
  '[{"key": "A", "text": "$\\dfrac{1}{2}$"}, {"key": "B", "text": "$2$"}, {"key": "C", "text": "$-2$"}, {"key": "D", "text": "$5$"}, {"key": "E", "text": "$-\\dfrac{1}{2}$"}]'::jsonb, 'C', NULL, NULL,
  'Cəmdə $x^5$-in əmsalı $b+2$-dir. Dərəcənin $4$ olması üçün $b+2=0$, yəni $b=-2$ (bu halda $-5x^4$ həddi qalır).',
  2025, 'I', 37, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0012 | əsas: 2025 toplu, I hissə, səh.37 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0012', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Çoxhədlilər və onlar üzərində əməllər'), 'original', 'own', 'az', 'draft', 'closed',
  '$b$ parametrinin hansı qiymətində $(5x^6+2x^3-x)-(bx^6-3x^5+x^2)$ çoxhədlisinin dərəcəsi $5$ olar?',
  '[{"key": "A", "text": "$5$"}, {"key": "B", "text": "$3$"}, {"key": "C", "text": "$0$"}, {"key": "D", "text": "$-5$"}, {"key": "E", "text": "$-3$"}]'::jsonb, 'A', NULL, NULL,
  '$x^6$-nın əmsalı $5-b$-dir. $5-b=0\Rightarrow b=5$; onda ən yüksək hədd $3x^5$ olur, dərəcə $5$-dir.',
  2025, 'I', 37, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0013 | əsas: 2025 toplu, I hissə, səh.37 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Çoxhədlilər və onlar üzərində əməllər'), 'original', 'own', 'az', 'draft', 'open',
  '$M_1$ birhədlisinin dərəcəsi $11$, $M_2$ birhədlisinin dərəcəsi $14$ olarsa, $M_1+M_2$ çoxhədlisinin dərəcəsini tapın.',
  NULL, NULL, NULL, '14',
  'Dərəcələri fərqli olan birhədlilər oxşar deyil, ixtisar olunmur. Cəmin dərəcəsi böyük dərəcəyə bərabərdir: $14$.',
  2025, 'I', 37, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0014 | əsas: 2025 toplu, I hissə, səh.37 №18
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Çoxhədlilər və onlar üzərində əməllər'), 'original', 'own', 'az', 'draft', 'open',
  '$M_1$ birhədlisinin dərəcəsi $6$, $M_2$ birhədlisinin dərəcəsi $17$ olarsa, $M_1-M_2$ çoxhədlisinin dərəcəsini tapın.',
  NULL, NULL, NULL, '17',
  'Dərəcələr fərqli olduğundan hədlər ixtisar olunmur; fərqin dərəcəsi $\max(6;17)=17$-dir.',
  2025, 'I', 37, 18)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0015 | əsas: 2025 toplu, I hissə, səh.37 №19
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0015', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Çoxhədlilər və onlar üzərində əməllər'), 'original', 'own', 'az', 'draft', 'open',
  '$M$ çoxhədlisinin dərəcəsi $5$, $N$ çoxhədlisinin dərəcəsi $8$ olarsa, $(M-N)^3\cdot N$ çoxhədlisinin dərəcəsini tapın.',
  NULL, NULL, NULL, '32',
  '$M-N$ çoxhədlisinin dərəcəsi $8$-dir (böyük dərəcə). $(M-N)^3$ — dərəcə $24$; $N$-ə vurduqda $24+8=32$.',
  2025, 'I', 37, 19)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0016 | əsas: 2025 toplu, I hissə, səh.37 №20
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Çoxhədlilər və onlar üzərində əməllər'), 'original', 'own', 'az', 'draft', 'open',
  '$P$ çoxhədlisinin dərəcəsi $6$, $Q$ çoxhədlisinin dərəcəsi $3$ olarsa, $(P+Q)^2\cdot Q^3$ çoxhədlisinin dərəcəsini tapın.',
  NULL, NULL, NULL, '21',
  '$P+Q$ çoxhədlisinin dərəcəsi $6$-dır; $(P+Q)^2$ — $12$; $Q^3$ — $9$. Hasil: $12+9=21$.',
  2025, 'I', 37, 20)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0017 | əsas: 2025 toplu, I hissə, səh.37 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Çoxhədlilər və onlar üzərində əməllər'), 'original', 'own', 'az', 'draft', 'open',
  '$\left(3x^{n+5}+x^{2n}-7\right)^4$ çoxhədlisinin dərəcəsi $56$-ya bərabər olarsa, $n$-i tapın.',
  NULL, NULL, NULL, '7',
  'Mötərizədəki çoxhədlinin dərəcəsi $56:4=14$ olmalıdır, yəni $\max(n+5;\,2n)=14$. Əgər $2n=14$, onda $n=7$ və $n+5=12<14$ — uyğundur. Əgər $n+5=14$, onda $n=9$, amma $2n=18>14$ — uyğun deyil. Cavab: $n=7$.',
  2025, 'I', 37, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0018 | əsas: 2025 toplu, I hissə, səh.37 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Çoxhədlilər və onlar üzərində əməllər'), 'original', 'own', 'az', 'draft', 'open',
  '$\left(2x^{4n-9}+x^{n+3}-6\right)^3$ çoxhədlisinin dərəcəsi $33$-ə bərabər olarsa, $n$-i tapın.',
  NULL, NULL, NULL, '5',
  'Mötərizənin dərəcəsi $33:3=11$: $\max(4n-9;\,n+3)=11$. $4n-9=11\Rightarrow n=5$, onda $n+3=8<11$ — uyğundur. $n+3=11\Rightarrow n=8$, amma $4n-9=23>11$ — uyğun deyil. Cavab: $n=5$.',
  2025, 'I', 37, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0019 | əsas: 2025 toplu, I hissə, səh.38 №31
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Çoxhədlilər və onlar üzərində əməllər'), 'original', 'own', 'az', 'draft', 'open',
  '$k$-nın hansı qiymətində $3a^{\frac{30}{k}}-4b^{k-1}+c^{9-k}$ çoxhədlisinin dərəcəsi ən kiçik olar?',
  NULL, NULL, NULL, '6',
  'Çoxhədli olması üçün üstlər qeyri-mənfi tam olmalıdır: $k$ ədədi $30$-un böləni və $1\le k\le9$, yəni $k\in\{1;2;3;5;6\}$. Dərəcə $\max\left(\dfrac{30}{k};\,k-1;\,9-k\right)$: $k=1$ — $30$; $k=2$ — $15$; $k=3$ — $10$; $k=5$ — $6$; $k=6$ — $5$. Ən kiçik dərəcə $k=6$ olduqda alınır.',
  2025, 'I', 38, 31)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0020 | əsas: 2025 toplu, I hissə, səh.38 №32
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Çoxhədlilər və onlar üzərində əməllər'), 'original', 'own', 'az', 'draft', 'open',
  '$k$-nın hansı qiymətində $5a^{\frac{20}{k}}+2b^{k-3}-c^{10-k}$ çoxhədlisinin dərəcəsi ən kiçik olar?',
  NULL, NULL, NULL, '5',
  '$k$ ədədi $20$-nin böləni və $3\le k\le10$: $k\in\{4;5;10\}$. Dərəcələr: $k=4$ — $\max(5;1;6)=6$; $k=5$ — $\max(4;2;5)=5$; $k=10$ — $\max(2;7;0)=7$. Cavab: $k=5$.',
  2025, 'I', 38, 32)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0021 | əsas: 2025 toplu, I hissə, səh.38 №34
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Çoxhədlilər və onlar üzərində əməllər'), 'original', 'own', 'az', 'draft', 'written',
  '$a$-nın hansı qiymətində $3x^{\frac{12}{a-1}}-2x^{a-8}+1$ ifadəsi dərəcəsi $5$ olan çoxhədli olar?',
  NULL, NULL, NULL, '13',
  'Çoxhədli üçün $\dfrac{12}{a-1}$ və $a-8$ qeyri-mənfi tam olmalıdır: $a-1\in\{1;2;3;4;6;12\}$ və $a\ge8$, yəni $a=13$ (yeganə). Onda üstlər $\dfrac{12}{12}=1$ və $13-8=5$, dərəcə $5$-dir. Cavab: $a=13$.',
  2025, 'I', 38, 34)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0022 | əsas: 2025 toplu, I hissə, səh.38 №35
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Çoxhədlilər və onlar üzərində əməllər'), 'original', 'own', 'az', 'draft', 'open',
  '$n$-in hansı qiymətində $3x^{10}y^4-x^7y^n+2x^2y^{11}$ və $5a^9b^8-a^4b^{12}$ çoxhədlilərinin dərəcələri (qüvvətləri) bərabərdir?',
  NULL, NULL, NULL, '10',
  'İkinci çoxhədlinin dərəcəsi $\max(17;16)=17$. Birincinin hədlərinin dərəcələri: $14$, $7+n$, $13$. Dərəcənin $17$ olması üçün $7+n=17$, $n=10$.',
  2025, 'I', 38, 35)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0023 | əsas: 2025 toplu, I hissə, səh.38 №36
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Çoxhədlilər və onlar üzərində əməllər'), 'original', 'own', 'az', 'draft', 'open',
  '$m$-in hansı qiymətində $4x^3y^{12}-2x^my^5+x^8y^6$ və $6a^{10}b^7-a^6b^{13}$ çoxhədlilərinin dərəcələri (qüvvətləri) bərabərdir?',
  NULL, NULL, NULL, '14',
  'İkinci çoxhədlinin dərəcəsi $\max(17;19)=19$. Birincinin hədləri: $15$, $m+5$, $14$. $m+5=19\Rightarrow m=14$.',
  2025, 'I', 38, 36)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0024 | əsas: 2025 toplu, I hissə, səh.38 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Müxtəsər vurma düsturları'), 'original', 'own', 'az', 'draft', 'closed',
  '$(a-b)^2$-nı almaq üçün $(a+b)^2$ ifadəsindən hansı ifadəni çıxmaq lazımdır?',
  '[{"key": "A", "text": "$-4ab$"}, {"key": "B", "text": "$4ab$"}, {"key": "C", "text": "$ab^2$"}, {"key": "D", "text": "$2b^2$"}, {"key": "E", "text": "$2ab$"}]'::jsonb, 'B', NULL, NULL,
  '$(a+b)^2-(a-b)^2=(a^2+2ab+b^2)-(a^2-2ab+b^2)=4ab$.',
  2025, 'I', 38, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0025 | əsas: 2025 toplu, I hissə, səh.38 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0025', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Müxtəsər vurma düsturları'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left(\dfrac{2}{5}a+9b^3\right)\left(9b^3-\dfrac{2}{5}a\right)$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$81b^6-\\dfrac{36}{5}ab^3-\\dfrac{4}{25}a^2$"}, {"key": "B", "text": "$\\dfrac{4}{25}a^2-81b^6$"}, {"key": "C", "text": "$81b^6-\\dfrac{4}{25}a^2$"}, {"key": "D", "text": "$81b^6+\\dfrac{4}{25}a^2$"}, {"key": "E", "text": "$\\dfrac{4}{25}a^2+81b^6$"}]'::jsonb, 'C', NULL, NULL,
  'Kvadratlar fərqi: $\left(9b^3+\dfrac{2}{5}a\right)\left(9b^3-\dfrac{2}{5}a\right)=\left(9b^3\right)^2-\left(\dfrac{2}{5}a\right)^2=81b^6-\dfrac{4}{25}a^2$.',
  2025, 'I', 38, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0026 | əsas: 2025 toplu, I hissə, səh.38 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Müxtəsər vurma düsturları'), 'original', 'own', 'az', 'draft', 'closed',
  '$\left(\dfrac{4}{9}m-7n^2\right)\left(-7n^2-\dfrac{4}{9}m\right)$ ifadəsini sadələşdirin.',
  '[{"key": "A", "text": "$49n^4-\\dfrac{56}{9}mn^2-\\dfrac{16}{81}m^2$"}, {"key": "B", "text": "$49n^4+\\dfrac{16}{81}m^2$"}, {"key": "C", "text": "$-49n^4-\\dfrac{16}{81}m^2$"}, {"key": "D", "text": "$49n^4-\\dfrac{16}{81}m^2$"}, {"key": "E", "text": "$\\dfrac{16}{81}m^2-49n^4$"}]'::jsonb, 'D', NULL, NULL,
  '$\left(-7n^2+\dfrac{4}{9}m\right)\left(-7n^2-\dfrac{4}{9}m\right)=\left(-7n^2\right)^2-\left(\dfrac{4}{9}m\right)^2=49n^4-\dfrac{16}{81}m^2$.',
  2025, 'I', 38, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0027 | əsas: 2023 toplu, I hissə, səh.51 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0027', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='Müxtəsər vurma düsturları'), 'original', 'own', 'az', 'draft', 'open',
  '$x=2\cdot3^{8}+3^{-8}$ və $y=2\cdot3^{8}-3^{-8}$ olarsa, $x^2-y^2$ ifadəsinin qiymətini tapın.',
  NULL, NULL, NULL, '8',
  '$x^2-y^2=(x-y)(x+y)$. $x-y=2\cdot3^{-8}$, $x+y=4\cdot3^{8}$. Hasil: $2\cdot3^{-8}\cdot4\cdot3^{8}=8$.',
  2023, 'I', 51, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0028 | əsas: 2025 toplu, I hissə, səh.39 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0028', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='İfadələrin ədədi qiymətlərinin hesablanması'), 'original', 'own', 'az', 'draft', 'closed',
  '$a^2+b^2=89$ və $a+b=13$ olduqda, $ab$-ni tapın.',
  '[{"key": "A", "text": "$44$"}, {"key": "B", "text": "$42$"}, {"key": "C", "text": "$36$"}, {"key": "D", "text": "$38$"}, {"key": "E", "text": "$40$"}]'::jsonb, 'E', NULL, NULL,
  '$(a+b)^2=a^2+2ab+b^2\Rightarrow169=89+2ab\Rightarrow ab=40$.',
  2025, 'I', 39, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0029 | əsas: 2025 toplu, I hissə, səh.39 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0029', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='İfadələrin ədədi qiymətlərinin hesablanması'), 'original', 'own', 'az', 'draft', 'closed',
  '$a-b=6,\ ab=-5$ olduqda, $a^2+b^2$-nı tapın.',
  '[{"key": "A", "text": "$36$"}, {"key": "B", "text": "$31$"}, {"key": "C", "text": "$26$"}, {"key": "D", "text": "$46$"}, {"key": "E", "text": "$41$"}]'::jsonb, 'C', NULL, NULL,
  '$a^2+b^2=(a-b)^2+2ab=36-10=26$.',
  2025, 'I', 39, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0030 | əsas: 2025 toplu, I hissə, səh.39 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0030', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='İfadələrin ədədi qiymətlərinin hesablanması'), 'original', 'own', 'az', 'draft', 'closed',
  '$P(x)$ çoxhədlisi üçün $P(x)+P(x+1)=4x^2+10x+9$ və $P(1)+P(3)=36$ bərabərlikləri ödənərsə, $P(1)$-i tapın.',
  '[{"key": "A", "text": "$7$"}, {"key": "B", "text": "$5$"}, {"key": "C", "text": "$-7$"}, {"key": "D", "text": "$11$"}, {"key": "E", "text": "$9$"}]'::jsonb, 'A', NULL, NULL,
  '$x=1$: $P(1)+P(2)=4+10+9=23$. $x=2$: $P(2)+P(3)=16+20+9=45$. Çıxsaq: $P(3)-P(1)=22$. $P(1)+P(3)=36$ ilə birlikdə: $2P(1)=36-22=14\Rightarrow P(1)=7$.',
  2025, 'I', 39, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0031 | əsas: 2025 toplu, I hissə, səh.39 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0031', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='İfadələrin ədədi qiymətlərinin hesablanması'), 'original', 'own', 'az', 'draft', 'open',
  '$x=\dfrac{1}{5}$ olarsa, $x(x+4)(x-4)-(x-3)\left(x^2+3x+9\right)$ ifadəsinin qiymətini hesablayın.',
  NULL, NULL, NULL, '23,8',
  '$x(x+4)(x-4)=x^3-16x$; $(x-3)(x^2+3x+9)=x^3-27$. Fərq: $x^3-16x-x^3+27=27-16x$. $x=\dfrac{1}{5}$: $27-3{,}2=23{,}8$.',
  2025, 'I', 39, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0032 | əsas: 2025 toplu, I hissə, səh.39 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0032', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='İfadələrin ədədi qiymətlərinin hesablanması'), 'original', 'own', 'az', 'draft', 'open',
  '$x=0{,}2$ olarsa, $x(x+5)(x-5)-(x-1)\left(x^2+x+1\right)$ ifadəsinin qiymətini hesablayın.',
  NULL, NULL, NULL, '-4',
  '$x(x^2-25)-(x^3-1)=x^3-25x-x^3+1=1-25x$. $x=0{,}2$: $1-5=-4$.',
  2025, 'I', 39, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0033 | əsas: 2025 toplu, I hissə, səh.40 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0033', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='İfadələrin ən kiçik və ən böyük qiymətlərinin tapılması'), 'original', 'own', 'az', 'draft', 'matching',
  'İfadələr üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$a^2-6a+5$"}, {"key": "2", "text": "$-a^2+2a+8$"}, {"key": "3", "text": "$a^2+4a+1$"}], "right": [{"key": "a", "text": "ən kiçik qiyməti $(-4)$-dür"}, {"key": "b", "text": "ən böyük qiyməti $9$-dur"}, {"key": "c", "text": "ən kiçik qiyməti yoxdur"}, {"key": "d", "text": "ən kiçik qiymətini $a=-2$ olduqda alır"}, {"key": "e", "text": "ən böyük qiymətini $a=3$ olduqda alır"}]}'::jsonb, NULL, '{"1": ["a"], "2": ["b", "c"], "3": ["d"]}'::jsonb, NULL,
  '1) $a^2-6a+5=(a-3)^2-4$: ən kiçik qiymət $-4$ ($a=3$-də), ən böyük qiymət yoxdur. 2) $-a^2+2a+8=9-(a-1)^2$: ən böyük qiymət $9$ ($a=1$-də), ən kiçik qiymət yoxdur. 3) $a^2+4a+1=(a+2)^2-3$: ən kiçik qiymət $-3$, $a=-2$ olduqda alınır.',
  2025, 'I', 40, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0034 | əsas: 2025 toplu, I hissə, səh.40 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0034', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='İfadələrin ən kiçik və ən böyük qiymətlərinin tapılması'), 'original', 'own', 'az', 'draft', 'matching',
  'İfadələr üçün uyğunluğu müəyyən edin.',
  '{"left": [{"key": "1", "text": "$-a^2+8a$"}, {"key": "2", "text": "$a^2+8a+10$"}, {"key": "3", "text": "$-a^2-8a+3$"}], "right": [{"key": "a", "text": "ən böyük qiyməti $16$-dır"}, {"key": "b", "text": "ən böyük qiyməti yoxdur"}, {"key": "c", "text": "ən böyük qiymətini $a=-4$ olduqda alır"}, {"key": "d", "text": "ən kiçik qiyməti $(-6)$-dır"}, {"key": "e", "text": "ən böyük qiyməti $19$-dur"}]}'::jsonb, NULL, '{"1": ["a"], "2": ["b", "d"], "3": ["c", "e"]}'::jsonb, NULL,
  '1) $-a^2+8a=16-(a-4)^2$: ən böyük qiymət $16$ ($a=4$-də). 2) $a^2+8a+10=(a+4)^2-6$: ən kiçik qiymət $-6$, ən böyük qiymət yoxdur. 3) $-a^2-8a+3=19-(a+4)^2$: ən böyük qiymət $19$, $a=-4$ olduqda alınır.',
  2025, 'I', 40, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- TCI-0035 | əsas: 2025 toplu, I hissə, səh.40 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('TCI-0035', NULL, NULL, (SELECT id FROM topics WHERE name='Tam cəbri ifadələr'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Tam cəbri ifadələr' AND s.title='İfadələrin ən kiçik və ən böyük qiymətlərinin tapılması'), 'original', 'own', 'az', 'draft', 'matching',
  'İfadələr üçün uyğunluğu müəyyən edin ($a$ — dəyişən, $p$ — parametrdir).',
  '{"left": [{"key": "1", "text": "$(p-2)a^2+3a-1$"}, {"key": "2", "text": "$\\left(p^2+4\\right)a^2-5a+2$"}, {"key": "3", "text": "$(p+5)a^2-a+7$"}], "right": [{"key": "a", "text": "$p$-nin istənilən qiymətində ƏKQ var"}, {"key": "b", "text": "yalnız $p\\in(2;+\\infty)$ olduqda ƏKQ var"}, {"key": "c", "text": "$p=-5$ olduqda ƏBQ və ƏKQ yoxdur"}, {"key": "d", "text": "yalnız $p\\in(-\\infty;-5)$ olduqda ƏBQ var"}, {"key": "e", "text": "yalnız $p\\in(-\\infty;2)$ olduqda ƏBQ var"}]}'::jsonb, NULL, '{"1": ["b", "e"], "2": ["a"], "3": ["c", "d"]}'::jsonb, NULL,
  '$ka^2+ma+n$ ifadəsinin ən kiçik qiyməti (ƏKQ) yalnız $k>0$, ən böyük qiyməti (ƏBQ) yalnız $k<0$ olduqda var; $k=0$ olduqda ifadə xəttidir ($m\ne0$) və heç biri yoxdur. 1) $k=p-2$: ƏKQ yalnız $p>2$, ƏBQ yalnız $p<2$ olduqda. 2) $k=p^2+4>0$ həmişə — ƏKQ istənilən $p$-də var. 3) $k=p+5$: $p=-5$ olduqda ifadə $-a+7$ — heç biri yoxdur; ƏBQ yalnız $p<-5$ olduqda var.',
  2025, 'I', 40, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
