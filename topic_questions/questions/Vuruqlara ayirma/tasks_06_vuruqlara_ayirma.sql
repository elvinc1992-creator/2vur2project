-- Mövzu: Çoxhədlinin vuruqlara ayrılması — 30 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- VRA-0001 | əsas: 2025 toplu, I hissə, səh.41 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Müxtəsər vurma düsturlarının köməyi ilə vuruqlara ayırma'), 'original', 'own', 'az', 'draft', 'closed',
  '$x^3-8=(x-2)A$ olduğunu bilərək, $A$ çoxhədlisini tapın.',
  '[{"key": "A", "text": "$x+2$"}, {"key": "B", "text": "$x^2+2x+4$"}, {"key": "C", "text": "$x^2+4x+4$"}, {"key": "D", "text": "$x^2-2x+4$"}, {"key": "E", "text": "$x^2-4x+4$"}]'::jsonb, 'B', NULL, NULL,
  'Kublar fərqi: $x^3-8=x^3-2^3=(x-2)(x^2+2x+4)$. Deməli $A=x^2+2x+4$.',
  2025, 'I', 41, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0002 | əsas: 2025 toplu, I hissə, səh.41 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Müxtəsər vurma düsturlarının köməyi ilə vuruqlara ayırma'), 'original', 'own', 'az', 'draft', 'closed',
  '$a^2(x-y)-b^2(x-y)$ çoxhədlisini vuruqlara ayırın.',
  '[{"key": "A", "text": "$(x+y)(a-b)(a+b)$"}, {"key": "B", "text": "$(x-y)(a-x)(b-y)$"}, {"key": "C", "text": "$(a-x)(b-y)(a+b)$"}, {"key": "D", "text": "$(x-y)(a^2-x)(b^2-y)$"}, {"key": "E", "text": "$(x-y)(a-b)(a+b)$"}]'::jsonb, 'E', NULL, NULL,
  'Ortaq vuruq $(x-y)$-i mötərizə xaricinə çıxaraq: $(x-y)(a^2-b^2)=(x-y)(a-b)(a+b)$.',
  2025, 'I', 41, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0003 | əsas: 2025 toplu, I hissə, səh.41 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Müxtəsər vurma düsturlarının köməyi ilə vuruqlara ayırma'), 'original', 'own', 'az', 'draft', 'closed',
  '$(a+b-c)^2-(a-b+c)^2$ çoxhədlisini vuruqlara ayırın.',
  '[{"key": "A", "text": "$2a(b-c)$"}, {"key": "B", "text": "$4c(a-b)$"}, {"key": "C", "text": "$4a(b+c)$"}, {"key": "D", "text": "$4a(b-c)$"}, {"key": "E", "text": "$4b(c-a)$"}]'::jsonb, 'D', NULL, NULL,
  'Kvadratlar fərqi: $\big((a+b-c)-(a-b+c)\big)\big((a+b-c)+(a-b+c)\big)=(2b-2c)\cdot2a=4a(b-c)$.',
  2025, 'I', 41, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0004 | əsas: 2025 toplu, I hissə, səh.41 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Müxtəsər vurma düsturlarının köməyi ilə vuruqlara ayırma'), 'original', 'own', 'az', 'draft', 'closed',
  '$(3+x-y)^2-(3-x+y)^2$ çoxhədlisini vuruqlara ayırın.',
  '[{"key": "A", "text": "$6xy$"}, {"key": "B", "text": "$12(x-y)$"}, {"key": "C", "text": "$12(x+y)$"}, {"key": "D", "text": "$3(x+y)$"}, {"key": "E", "text": "$(3+x)(3-y)$"}]'::jsonb, 'B', NULL, NULL,
  '$\big((3+x-y)-(3-x+y)\big)\big((3+x-y)+(3-x+y)\big)=(2x-2y)\cdot6=12(x-y)$.',
  2025, 'I', 41, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0005 | əsas: 2025 toplu, I hissə, səh.41 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Müxtəsər vurma düsturlarının köməyi ilə vuruqlara ayırma'), 'original', 'own', 'az', 'draft', 'closed',
  '$(x+2)^3-(x-2)^3$ ifadəsini vuruqlara ayırın.',
  '[{"key": "A", "text": "$4x(3x^2+4)$"}, {"key": "B", "text": "$16$"}, {"key": "C", "text": "$4(3x^2+4)$"}, {"key": "D", "text": "$-4(3x^2+4)$"}, {"key": "E", "text": "$12x^2$"}]'::jsonb, 'C', NULL, NULL,
  '$A^3-B^3=(A-B)(A^2+AB+B^2)$, $A=x+2$, $B=x-2$: $A-B=4$; $A^2+AB+B^2=(x^2+4x+4)+(x^2-4)+(x^2-4x+4)=3x^2+4$. Nəticə: $4(3x^2+4)$.',
  2025, 'I', 41, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0006 | əsas: 2025 toplu, I hissə, səh.41 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Müxtəsər vurma düsturlarının köməyi ilə vuruqlara ayırma'), 'original', 'own', 'az', 'draft', 'closed',
  '$(a-3)^3+(a+3)^3$ ifadəsini vuruqlara ayırın.',
  '[{"key": "A", "text": "$2a^3$"}, {"key": "B", "text": "$2a(a^2+9)$"}, {"key": "C", "text": "$a^2+27$"}, {"key": "D", "text": "$a^3$"}, {"key": "E", "text": "$2a(a^2+27)$"}]'::jsonb, 'E', NULL, NULL,
  '$A^3+B^3=(A+B)(A^2-AB+B^2)$, $A=a-3$, $B=a+3$: $A+B=2a$; $A^2-AB+B^2=(a^2-6a+9)-(a^2-9)+(a^2+6a+9)=a^2+27$. Nəticə: $2a(a^2+27)$.',
  2025, 'I', 41, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0007 | əsas: 2025 toplu, I hissə, səh.41 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0007', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Müxtəsər vurma düsturlarının köməyi ilə vuruqlara ayırma'), 'original', 'own', 'az', 'draft', 'written',
  '$k$-nın hansı qiymətində $x^{k^2-5k+9}-27=(x-3)\left(x^2+3x+k^2-4k+12\right)$ bərabərliyi eynilikdir?',
  NULL, NULL, NULL, '3',
  'Sol tərəf $x^3-27=(x-3)(x^2+3x+9)$ olmalıdır. Onda iki şərt: $k^2-4k+12=9\Rightarrow k^2-4k+3=0\Rightarrow k\in\{1;3\}$ və $k^2-5k+9=3\Rightarrow k^2-5k+6=0\Rightarrow k\in\{2;3\}$. Ortaq qiymət: $k=3$.',
  2025, 'I', 41, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0008 | əsas: 2025 toplu, I hissə, səh.41 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Müxtəsər vurma düsturlarının köməyi ilə vuruqlara ayırma'), 'original', 'own', 'az', 'draft', 'written',
  '$k$ parametrinin hansı qiymətində $x^{k^2-7k+13}+8=(x+2)\left(x^2-2x+k^2-5k+10\right)$ bərabərliyi eynilikdir?',
  NULL, NULL, NULL, '2',
  'Sağ tərəfin $x^3+8=(x+2)(x^2-2x+4)$ olması üçün $k^2-5k+10=4\Rightarrow k^2-5k+6=0\Rightarrow k\in\{2;3\}$. Sol tərəfdə üst $3$ olmalıdır: $k^2-7k+13=3\Rightarrow k^2-7k+10=0\Rightarrow k\in\{2;5\}$. Ortaq qiymət: $k=2$.',
  2025, 'I', 41, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0009 | əsas: 2025 toplu, I hissə, səh.41 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Müxtəlif üsulların köməyi ilə vuruqlara ayırma'), 'original', 'own', 'az', 'draft', 'closed',
  '$2x^2-5x-12$ kvadrat üçhədlisini vuruqlarına ayırın.',
  '[{"key": "A", "text": "$(x-4)(2x+3)$"}, {"key": "B", "text": "$2(x-4)(x+3)$"}, {"key": "C", "text": "$(x-3)(2x+4)$"}, {"key": "D", "text": "$(x+4)(2x-3)$"}, {"key": "E", "text": "$(2x-4)(x+3)$"}]'::jsonb, 'A', NULL, NULL,
  'Kökləri: $x=\dfrac{5\pm\sqrt{25+96}}{4}=\dfrac{5\pm11}{4}$, yəni $4$ və $-\dfrac{3}{2}$. $2x^2-5x-12=2(x-4)\left(x+\dfrac{3}{2}\right)=(x-4)(2x+3)$.',
  2025, 'I', 41, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0010 | əsas: 2025 toplu, I hissə, səh.42 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Müxtəlif üsulların köməyi ilə vuruqlara ayırma'), 'original', 'own', 'az', 'draft', 'closed',
  '$x^4+4x^2+16$ çoxhədlisini vuruqlara ayırın.',
  '[{"key": "A", "text": "$(x^2-2x+4)^2$"}, {"key": "B", "text": "$(x^2+2x+4)(x^2-2x+4)$"}, {"key": "C", "text": "$(x^2+4)(x^2-4)$"}, {"key": "D", "text": "$(x^2+2x+4)(x^2-2x-4)$"}, {"key": "E", "text": "$(x^2+4)^2$"}]'::jsonb, 'B', NULL, NULL,
  'Tam kvadrata tamamlayaq: $x^4+4x^2+16=(x^4+8x^2+16)-4x^2=(x^2+4)^2-(2x)^2=(x^2-2x+4)(x^2+2x+4)$.',
  2025, 'I', 42, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0011 | əsas: 2025 toplu, I hissə, səh.42 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0011', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Müxtəlif üsulların köməyi ilə vuruqlara ayırma'), 'original', 'own', 'az', 'draft', 'closed',
  '$x^2(y+2)-y^2(x+2)$ çoxhədlisini vuruqlara ayırın.',
  '[{"key": "A", "text": "$(x-y)(2xy+x+y)$"}, {"key": "B", "text": "$(x+y)(xy+2x+2y)$"}, {"key": "C", "text": "$(x-y)(xy-2x-2y)$"}, {"key": "D", "text": "$(x-y)(xy+2x+2y)$"}, {"key": "E", "text": "$(x+y)(xy-2x-2y)$"}]'::jsonb, 'D', NULL, NULL,
  '$x^2y+2x^2-xy^2-2y^2=xy(x-y)+2(x^2-y^2)=xy(x-y)+2(x-y)(x+y)=(x-y)(xy+2x+2y)$.',
  2025, 'I', 42, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0012 | əsas: 2025 toplu, I hissə, səh.42 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0012', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Müxtəlif üsulların köməyi ilə vuruqlara ayırma'), 'original', 'own', 'az', 'draft', 'closed',
  '$x^2(y-3)-y^2(x-3)$ çoxhədlisini vuruqlara ayırın.',
  '[{"key": "A", "text": "$(x+y)(xy+3x+3y)$"}, {"key": "B", "text": "$(x-y)(xy+3x+3y)$"}, {"key": "C", "text": "$(x-y)(xy-3x-3y)$"}, {"key": "D", "text": "$(x-y)(xy-3x+3y)$"}, {"key": "E", "text": "$(x+y)(xy-3x-3y)$"}]'::jsonb, 'C', NULL, NULL,
  '$x^2y-3x^2-xy^2+3y^2=xy(x-y)-3(x^2-y^2)=(x-y)(xy-3x-3y)$.',
  2025, 'I', 42, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0013 | əsas: 2025 toplu, I hissə, səh.42 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Müxtəlif üsulların köməyi ilə vuruqlara ayırma'), 'original', 'own', 'az', 'draft', 'closed',
  '$25c^2-6xy-9x^2-y^2$ çoxhədlisini vuruqlara ayırın.',
  '[{"key": "A", "text": "$(5c-3x-y)(5c+3x+y)$"}, {"key": "B", "text": "$(5c-3x-y)(5c-3x+y)$"}, {"key": "C", "text": "$(5c+3x+y)^2$"}, {"key": "D", "text": "$(5c-3x+y)(5c+3x-y)$"}, {"key": "E", "text": "$(5c+3x-y)(5c+3x+y)$"}]'::jsonb, 'A', NULL, NULL,
  '$25c^2-(9x^2+6xy+y^2)=(5c)^2-(3x+y)^2=(5c-3x-y)(5c+3x+y)$.',
  2025, 'I', 42, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0014 | əsas: 2025 toplu, I hissə, səh.42 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Müxtəlif üsulların köməyi ilə vuruqlara ayırma'), 'original', 'own', 'az', 'draft', 'closed',
  '$49x^2+20yz-4y^2-25z^2$ çoxhədlisini vuruqlara ayırın.',
  '[{"key": "A", "text": "$(7x-2y+5z)(7x+2y-5z)$"}, {"key": "B", "text": "$(7x+2y-5z)(7x+2y+5z)$"}, {"key": "C", "text": "$(7x-2y-5z)(7x+2y+5z)$"}, {"key": "D", "text": "$(7x+2y+5z)(7x-2y-5z)$"}, {"key": "E", "text": "$(7x-2y+5z)^2$"}]'::jsonb, 'A', NULL, NULL,
  '$49x^2-(4y^2-20yz+25z^2)=(7x)^2-(2y-5z)^2=(7x-2y+5z)(7x+2y-5z)$.',
  2025, 'I', 42, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0015 | əsas: 2025 toplu, I hissə, səh.42 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0015', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Müxtəlif üsulların köməyi ilə vuruqlara ayırma'), 'original', 'own', 'az', 'draft', 'closed',
  '$10x^{3}y^{2}+10x^{2}y^{3}+15x^{2}y+5x^{2}+15xy^{2}+5xy$ çoxhədlisini vuruqlarına ayırın.',
  '[{"key": "A", "text": "$5x(x+3y)(1+y+2xy^2)$"}, {"key": "B", "text": "$x(x+y)(5+3y+10xy^2)$"}, {"key": "C", "text": "$5(x+y)(1+3xy+2x^2y)$"}, {"key": "D", "text": "$(5x+y)(1+3y+2xy^2)$"}, {"key": "E", "text": "$5x(x+y)(1+3y+2xy^2)$"}]'::jsonb, 'E', NULL, NULL,
  'Hədləri qruplaşdıraq: $5x^2+5xy=5x(x+y)$; $15x^2y+15xy^2=15xy(x+y)$; $10x^3y^2+10x^2y^3=10x^2y^2(x+y)$. Cəm: $(x+y)\left(5x+15xy+10x^2y^2\right)=5x(x+y)\left(1+3y+2xy^2\right)$.',
  2025, 'I', 42, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0016 | əsas: 2025 toplu, I hissə, səh.43 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Müxtəlif üsulların köməyi ilə vuruqlara ayırma'), 'original', 'own', 'az', 'draft', 'closed',
  '$a^4-8a^3+128a-256$ çoxhədlisini vuruqlarına ayırın.',
  '[{"key": "A", "text": "$(a-4)^3(a+4)$"}, {"key": "B", "text": "$(a-4)^3(a+2)$"}, {"key": "C", "text": "$(a-2)^3(a+4)$"}, {"key": "D", "text": "$(a-4)^2(a+4)^2$"}, {"key": "E", "text": "$(a+4)^3(a-4)$"}]'::jsonb, 'A', NULL, NULL,
  'Qruplaşdıraq: $(a^4-256)-8a(a^2-16)=(a^2-16)(a^2+16)-8a(a^2-16)=(a^2-16)(a^2-8a+16)=(a-4)(a+4)(a-4)^2=(a-4)^3(a+4)$.',
  2025, 'I', 43, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0017 | əsas: 2025 toplu, I hissə, səh.45 №41
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Müxtəlif üsulların köməyi ilə vuruqlara ayırma'), 'original', 'own', 'az', 'draft', 'written',
  'Hündürlüyü $3$ olan düzbucaqlı paralelepipedin həcmi $V(x)=3x^3-24$ çoxhədlisi ilə ifadə olunub. Bu paralelepipedin oturacağının eni $A(x)=x-2$ olarsa, tam səthinin sahəsini ifadə edən çoxhədlini müəyyən edin $(x>2)$.',
  NULL, NULL, NULL, '2x^3+6x^2+18x-4',
  'Oturacağın sahəsi: $\dfrac{V}{3}=x^3-8=(x-2)(x^2+2x+4)$. Eni $x-2$ olduğundan uzunluğu $x^2+2x+4$-dür. Tam səth: $2\cdot S_{\text{ot}}+2h(\text{en}+\text{uzunluq})=2(x^3-8)+2\cdot3\left(x-2+x^2+2x+4\right)=2x^3-16+6x^2+18x+12=2x^3+6x^2+18x-4$.',
  2025, 'I', 45, 41)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0018 | əsas: 2025 toplu, I hissə, səh.45 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Vuruqlara ayırma üsulu ilə ifadələrin ədədi qiymətinin hesablanması'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{1515^2-5^2}{755}$ kəsrinin qiymətini tapın.',
  '[{"key": "A", "text": "$1520$"}, {"key": "B", "text": "$3040$"}, {"key": "C", "text": "$2020$"}, {"key": "D", "text": "$3030$"}, {"key": "E", "text": "$1510$"}]'::jsonb, 'B', NULL, NULL,
  '$1515^2-5^2=(1515-5)(1515+5)=1510\cdot1520$. $\dfrac{1510\cdot1520}{755}=2\cdot1520=3040$.',
  2025, 'I', 45, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0019 | əsas: 2025 toplu, I hissə, səh.45 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Vuruqlara ayırma üsulu ilə ifadələrin ədədi qiymətinin hesablanması'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{0{,}4^2-2{,}4^2}{0{,}4^2-2\cdot0{,}4\cdot2{,}4+2{,}4^2}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$-0{,}7$"}, {"key": "B", "text": "$0{,}7$"}, {"key": "C", "text": "$-1{,}4$"}, {"key": "D", "text": "$1{,}4$"}, {"key": "E", "text": "$-2{,}8$"}]'::jsonb, 'C', NULL, NULL,
  'Surət: $(0{,}4-2{,}4)(0{,}4+2{,}4)=-2\cdot2{,}8$. Məxrəc: $(0{,}4-2{,}4)^2=4$. Nisbət: $\dfrac{-5{,}6}{4}=-1{,}4$.',
  2025, 'I', 45, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0020 | əsas: 2025 toplu, I hissə, səh.45 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Vuruqlara ayırma üsulu ilə ifadələrin ədədi qiymətinin hesablanması'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{(3{,}6+2{,}4)(3{,}6-2{,}4)}{(3{,}6-2{,}4)^2}$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$0{,}2$"}, {"key": "B", "text": "$1{,}2$"}, {"key": "C", "text": "$5$"}, {"key": "D", "text": "$-5$"}, {"key": "E", "text": "$6$"}]'::jsonb, 'C', NULL, NULL,
  '$(3{,}6-2{,}4)$ vuruğu ilə ixtisar edək: $\dfrac{3{,}6+2{,}4}{3{,}6-2{,}4}=\dfrac{6}{1{,}2}=5$.',
  2025, 'I', 45, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0021 | əsas: 2025 toplu, I hissə, səh.45 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Vuruqlara ayırma üsulu ilə ifadələrin ədədi qiymətinin hesablanması'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{8{,}4^3+2{,}5^3}{10{,}9}-8{,}4^2-2{,}5^2$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$0$"}, {"key": "B", "text": "$10{,}9$"}, {"key": "C", "text": "$-10{,}9$"}, {"key": "D", "text": "$-21$"}, {"key": "E", "text": "$21$"}]'::jsonb, 'D', NULL, NULL,
  '$8{,}4+2{,}5=10{,}9$, ona görə $\dfrac{8{,}4^3+2{,}5^3}{10{,}9}=8{,}4^2-8{,}4\cdot2{,}5+2{,}5^2$. İfadə: $-8{,}4\cdot2{,}5=-21$.',
  2025, 'I', 45, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0022 | əsas: 2025 toplu, I hissə, səh.45 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Vuruqlara ayırma üsulu ilə ifadələrin ədədi qiymətinin hesablanması'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{41^3+43^3}{28}-3\cdot41\cdot43$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$4$"}, {"key": "B", "text": "$-12$"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$12$"}, {"key": "E", "text": "$6$"}]'::jsonb, 'D', NULL, NULL,
  '$41+43=84=3\cdot28$, ona görə $\dfrac{41^3+43^3}{28}=3\left(41^2-41\cdot43+43^2\right)$. İfadə: $3\left(41^2-2\cdot41\cdot43+43^2\right)=3(43-41)^2=12$.',
  2025, 'I', 45, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0023 | əsas: 2025 toplu, I hissə, səh.45 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Vuruqlara ayırma üsulu ilə ifadələrin ədədi qiymətinin hesablanması'), 'original', 'own', 'az', 'draft', 'closed',
  '$\dfrac{6{,}5^3+3{,}2^3}{9{,}7}-6{,}5^2-3{,}2^2$ ifadəsinin qiymətini hesablayın.',
  '[{"key": "A", "text": "$20{,}8$"}, {"key": "B", "text": "$9{,}7$"}, {"key": "C", "text": "$-9{,}7$"}, {"key": "D", "text": "$-10{,}4$"}, {"key": "E", "text": "$-20{,}8$"}]'::jsonb, 'E', NULL, NULL,
  '$6{,}5+3{,}2=9{,}7$: $\dfrac{6{,}5^3+3{,}2^3}{9{,}7}=6{,}5^2-6{,}5\cdot3{,}2+3{,}2^2$. İfadə: $-6{,}5\cdot3{,}2=-20{,}8$.',
  2025, 'I', 45, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0024 | əsas: 2025 toplu, I hissə, səh.46 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Vuruqlara ayırma üsulu ilə ifadələrin ədədi qiymətinin hesablanması'), 'original', 'own', 'az', 'draft', 'written',
  '$(x+a)^2-(y+b)^2=(x+y+4)(x-y+2)$ bərabərliyinin $x$ və $y$-in istənilən qiymətində doğru olduğunu bilərək, $a+2b$ ifadəsinin qiymətini tapın.',
  NULL, NULL, NULL, '5',
  'Sol tərəf: $(x+a+y+b)(x+a-y-b)=(x+y+(a+b))(x-y+(a-b))$. Müqayisə: $a+b=4$, $a-b=2$. Buradan $a=3$, $b=1$; $a+2b=5$.',
  2025, 'I', 46, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0025 | əsas: 2025 toplu, I hissə, səh.46 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0025', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Vuruqlara ayırma üsulu ilə ifadələrin ədədi qiymətinin hesablanması'), 'original', 'own', 'az', 'draft', 'written',
  '$(x+a)^2-(y+2)^2=(x+y+6)(x-y+b)$ bərabərliyi $x$ və $y$-in istənilən qiymətində doğru olarsa, $(2a-b)$-ni tapın.',
  NULL, NULL, NULL, '6',
  'Sol tərəf: $(x+y+a+2)(x-y+a-2)$. Müqayisə: $a+2=6\Rightarrow a=4$; $b=a-2=2$. $2a-b=8-2=6$.',
  2025, 'I', 46, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0026 | əsas: 2025 toplu, I hissə, səh.46 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Vuruqlara ayırma üsulu ilə ifadələrin ədədi qiymətinin hesablanması'), 'original', 'own', 'az', 'draft', 'written',
  '$(x-a)^2-(y+b)^2=(x+y+3)(x-y-9)$ bərabərliyi $x$ və $y$-in istənilən qiymətində doğru olarsa, $(2a-4b)$-ni tapın.',
  NULL, NULL, NULL, '-18',
  'Sol tərəf: $(x-a+y+b)(x-a-y-b)=(x+y+(b-a))(x-y-(a+b))$. Müqayisə: $b-a=3$ və $a+b=9$. Buradan $b=6$, $a=3$. $2a-4b=6-24=-18$.',
  2025, 'I', 46, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0027 | əsas: 2025 toplu, I hissə, səh.46 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0027', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Vuruqlara ayırma üsulu ilə ifadələrin ədədi qiymətinin hesablanması'), 'original', 'own', 'az', 'draft', 'written',
  '$a^2+b^2=3$ olarsa, $a^6+9a^2b^2+b^6+1$ ifadəsini hesablayın.',
  NULL, NULL, NULL, '28',
  '$(a^2+b^2)^3=a^6+b^6+3a^2b^2(a^2+b^2)$, yəni $27=a^6+b^6+9a^2b^2$. İfadə: $27+1=28$.',
  2025, 'I', 46, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0028 | əsas: 2025 toplu, I hissə, səh.46 №27
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0028', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Vuruqlara ayırma üsulu ilə ifadələrin ədədi qiymətinin hesablanması'), 'original', 'own', 'az', 'draft', 'written',
  '$a^2-b^2=2$ olarsa, $a^6-6a^2b^2-b^6+5$ ifadəsini hesablayın.',
  NULL, NULL, NULL, '13',
  '$(a^2-b^2)^3=a^6-b^6-3a^2b^2(a^2-b^2)=a^6-b^6-6a^2b^2$. Deməli $a^6-6a^2b^2-b^6=2^3=8$, ifadə $8+5=13$.',
  2025, 'I', 46, 27)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0029 | əsas: 2025 toplu, I hissə, səh.46 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0029', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Vuruqlara ayırma üsulu ilə ifadələrin ədədi qiymətinin hesablanması'), 'original', 'own', 'az', 'draft', 'written',
  'İstənilən $x$ üçün $x^3+4x-16=(x-2)\cdot P(x)$ ödənərsə, $P(2)$-ni tapın.',
  NULL, NULL, NULL, '16',
  'Bölək: $x^3+4x-16=(x-2)(x^2+2x+8)$ (yoxlama: $x^3+2x^2+8x-2x^2-4x-16$). $P(x)=x^2+2x+8$, $P(2)=4+4+8=16$.',
  2025, 'I', 46, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- VRA-0030 | əsas: 2025 toplu, I hissə, səh.46 №29
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('VRA-0030', NULL, NULL, (SELECT id FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Çoxhədlinin vuruqlara ayrılması' AND s.title='Vuruqlara ayırma üsulu ilə ifadələrin ədədi qiymətinin hesablanması'), 'original', 'own', 'az', 'draft', 'written',
  'İstənilən $x$ üçün $x^3+2x-33=(x-3)\cdot P(x)$ ödənərsə, $P(3)$-ü tapın.',
  NULL, NULL, NULL, '29',
  '$x^3+2x-33=(x-3)(x^2+3x+11)$ (yoxlama: $x^3+3x^2+11x-3x^2-9x-33$). $P(3)=9+9+11=29$.',
  2025, 'I', 46, 29)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
