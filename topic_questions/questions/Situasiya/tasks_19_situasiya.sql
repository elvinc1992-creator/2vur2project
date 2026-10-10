-- Mövzu: Situasiya — 27 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- SIT-0001 | əsas: 2025 toplu, I hissə, səh.197 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0001', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  '**Situasiya №1.** Leyla rəfiqəsinə zəng etmək istəyir. Yeddi rəqəmli telefon nömrəsinin son üç rəqəmini yaddan çıxarıb. Telefon nömrəsinin son üç rəqəmindən biri ($b$) digərindən ($a$-dan) bir vahid böyük, o birisindən ($c$-dən) iki vahid kiçikdir və bu rəqəmlər $b^2=ac$ şərtini ödəyir. Telefon operatorunda zəngin hər dəqiqəsi üçün $4$ qəpik hesablanır. On beş dəqiqədən artıq danışan abunəçi üçün ümumi danışıq haqqının $20\%$-i qədər güzəşt tətbiq edilir.

Yaddan çıxan rəqəmləri tapın.',
  NULL, NULL, NULL, '1, 2, 4',
  '$b=a+1$, $c=b+2=a+3$. $(a+1)^2=a(a+3)\Rightarrow a^2+2a+1=a^2+3a\Rightarrow a=1$. Deməli $a=1$, $b=2$, $c=4$ (yoxlama: $2^2=1\cdot4$).',
  2025, 'I', 197, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0002 | əsas: 2025 toplu, I hissə, səh.197 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0002', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  '**Situasiya №1.** Leyla rəfiqəsinə zəng etmək istəyir. Yeddi rəqəmli telefon nömrəsinin son üç rəqəmini yaddan çıxarıb. Telefon nömrəsinin son üç rəqəmindən biri ($b$) digərindən ($a$-dan) bir vahid böyük, o birisindən ($c$-dən) iki vahid kiçikdir və bu rəqəmlər $b^2=ac$ şərtini ödəyir. Telefon operatorunda zəngin hər dəqiqəsi üçün $4$ qəpik hesablanır. On beş dəqiqədən artıq danışan abunəçi üçün ümumi danışıq haqqının $20\%$-i qədər güzəşt tətbiq edilir.

Telefon nömrəsinin son üç rəqəminin əmələ gətirdiyi ədəd $4$-ə qalıqsız bölünür. Son üç rəqəmin əmələ gətirdiyi ən böyük ədədi tapın.',
  NULL, NULL, NULL, '412',
  '$1,2,4$ rəqəmlərindən düzələn ədədlər: $124,142,214,241,412,421$. $4$-ə bölünənlər son iki rəqəmi $4$-ə bölünənlərdir: $124$ və $412$. Ən böyüyü $412$.',
  2025, 'I', 197, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0003 | əsas: 2025 toplu, I hissə, səh.197 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0003', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  '**Situasiya №1.** Leyla rəfiqəsinə zəng etmək istəyir. Yeddi rəqəmli telefon nömrəsinin son üç rəqəmini yaddan çıxarıb. Telefon nömrəsinin son üç rəqəmindən biri ($b$) digərindən ($a$-dan) bir vahid böyük, o birisindən ($c$-dən) iki vahid kiçikdir və bu rəqəmlər $b^2=ac$ şərtini ödəyir. Telefon operatorunda zəngin hər dəqiqəsi üçün $4$ qəpik hesablanır. On beş dəqiqədən artıq danışan abunəçi üçün ümumi danışıq haqqının $20\%$-i qədər güzəşt tətbiq edilir.

Rəfiqəsinə zəng edən Leyla onunla $25$ dəqiqə fasiləsiz danışmışdır. Danışıq xərcini qəpiklə hesablayın.',
  NULL, NULL, NULL, '92',
  'İlk $15$ dəqiqə: $15\cdot4=60$ qəpik. Qalan $10$ dəqiqəyə $20\%$ güzəşt: $10\cdot4\cdot0{,}8=32$ qəpik. Cəmi $92$ qəpik.',
  2025, 'I', 197, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0004 | əsas: 2025 toplu, I hissə, səh.197 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0004', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  '**Situasiya №2.** Avtomobilin yanacaq çəninin tutumu $50$ $l$, elektromobilin akkumulyatorunun tutumu $80$ $A\cdot$saatdır. Avtomobil tam dolu çən yanacağı sərf edib $800$ km, elektromobil tam dolu akkumulyatoru istifadə etməklə $320$ km yol qət edir. Yanacağın $1$ $l$-nin qiyməti $2$ manat, akkumulyatoru $1$ $A\cdot$saat doldurmaq üçün sərf olunan elektrik enerjisinin qiyməti $0{,}1$ manatdır.

A və B şəhərlərindəki məsafəyə avtomobil $30$ AZN dəyərində benzin sərf edir. Eyni məsafəni getmək üçün elektromobilin elektrik enerjisinə sərf etdiyi xərc avtomobilin yanacağa sərf etdiyi xərcdən neçə faiz azdır?',
  NULL, NULL, NULL, '80',
  '$30:2=15$ $l$ benzin; $1$ $l$-lə $\dfrac{800}{50}=16$ km, məsafə $15\cdot16=240$ km. Elektromobil $1$ $A\cdot$saatla $\dfrac{320}{80}=4$ km gedir: $240:4=60$ $A\cdot$saat, xərc $6$ AZN. $\dfrac{30-6}{30}\cdot100\%=80\%$.',
  2025, 'I', 197, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0005 | əsas: 2025 toplu, I hissə, səh.197 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0005', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  '**Situasiya №2.** Avtomobilin yanacaq çəninin tutumu $50$ $l$, elektromobilin akkumulyatorunun tutumu $80$ $A\cdot$saatdır. Avtomobil tam dolu çən yanacağı sərf edib $800$ km, elektromobil tam dolu akkumulyatoru istifadə etməklə $320$ km yol qət edir. Yanacağın $1$ $l$-nin qiyməti $2$ manat, akkumulyatoru $1$ $A\cdot$saat doldurmaq üçün sərf olunan elektrik enerjisinin qiyməti $0{,}1$ manatdır.

Avtomobilin sürəti elektromobilin sürətindən $40$ km/saat çoxdur. A və B şəhərləri arasındakı məsafəni ($240$ km) avtomobil elektromobildən $1$ saat tez qət edirsə, hər iki nəqliyyat vasitəsinin sürətini tapın.',
  NULL, NULL, NULL, '120 km/saat; 80 km/saat',
  'Avtomobilin sürəti $v$: $\dfrac{240}{v-40}-\dfrac{240}{v}=1\Rightarrow 240\cdot40=v(v-40)\Rightarrow v^2-40v-9600=0\Rightarrow v=120$. Avtomobil $120$ km/saat, elektromobil $80$ km/saat.',
  2025, 'I', 197, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0006 | əsas: 2025 toplu, I hissə, səh.197 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0006', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  '**Situasiya №2.** Avtomobilin yanacaq çəninin tutumu $50$ $l$, elektromobilin akkumulyatorunun tutumu $80$ $A\cdot$saatdır. Avtomobil tam dolu çən yanacağı sərf edib $800$ km, elektromobil tam dolu akkumulyatoru istifadə etməklə $320$ km yol qət edir. Yanacağın $1$ $l$-nin qiyməti $2$ manat, akkumulyatoru $1$ $A\cdot$saat doldurmaq üçün sərf olunan elektrik enerjisinin qiyməti $0{,}1$ manatdır.

Milli Parkdakı gölün ətrafında radiusu $\dfrac4\pi$ km uzunluqlu çevrə üzrə salınmış yolla $12$ nəfər üçün nəzərdə tutulmuş elektromobillə turistlər üçün gəzinti təşkil olunur. Tam dolu akkumulyatoru tam sərf etməklə ən çox neçə turisti elektromobillə göl ətrafında bir dövrə vurmaqla gəzdirmək olar?',
  NULL, NULL, NULL, '480',
  'Bir dövrə: $2\pi\cdot\dfrac4\pi=8$ km. Tam akkumulyatorla $320:8=40$ dövrə, hər dövrədə $12$ turist: $40\cdot12=480$ turist.',
  2025, 'I', 197, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0007 | əsas: 2025 toplu, I hissə, səh.197 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0007', '/images/tasks/SIT-0007.png', 'Sütun diaqramı: böyük 25%, orta 50%, kiçik 25%', (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  '**Situasiya №3.** Şirkət mebel sexinə ümumi sayı $60$ ədəd olan $3$ müxtəlif növ iş masası sifariş verdi. Böyük ölçülü masa $150$ manata, orta ölçülü masa $90$ manata və kiçik ölçülü masa isə $70$ manatadır. Mebel sexi hər hansı növdən $20$ ədəd və daha çox alan müştəriyə həmin növ üçün qiymətdə $20\%$ endirim edir. Şirkətdə $22$ otaq var və alınmış masalar bəzi otaqlarda iki növ, bəzilərində isə yalnız bir növ masa olmaqla yerləşdirildi. Diaqramda alınmış masaların faizlə miqdarı göstərilmişdir.

Şirkət ən çox məbləği hansı növ masalara ödəmişdir və bu məbləğ ümumilikdə nə qədərdir?',
  NULL, NULL, NULL, 'Böyük; 5460 manat',
  'Böyük: $60\cdot0{,}25=15$ ədəd, $15\cdot150=2250$ man. Orta: $30$ ədəd ($\ge20$, endirim): $30\cdot90\cdot0{,}8=2160$ man. Kiçik: $15$ ədəd, $15\cdot70=1050$ man. Ən çox – böyük masalara ($2250$ man). Ümumi məbləğ: $2250+2160+1050=5460$ manat.',
  2025, 'I', 197, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0008 | əsas: 2025 toplu, I hissə, səh.197 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0008', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  '**Situasiya №3.** Şirkət mebel sexinə ümumi sayı $60$ ədəd olan $3$ müxtəlif növ iş masası sifariş verdi. Böyük ölçülü masa $150$ manata, orta ölçülü masa $90$ manata və kiçik ölçülü masa isə $70$ manatadır. Mebel sexi hər hansı növdən $20$ ədəd və daha çox alan müştəriyə həmin növ üçün qiymətdə $20\%$ endirim edir. Şirkətdə $22$ otaq var və alınmış masalar bəzi otaqlarda iki növ, bəzilərində isə yalnız bir növ masa olmaqla yerləşdirildi. Diaqramda alınmış masaların faizlə miqdarı göstərilmişdir.

Cədvəldə müxtəlif növ masalar qoyulmuş otaqların sayı göstərilmişdir. $A$ – böyük ölçülü masalar qoyulmuş otaqlar çoxluğu, $B$ – orta ölçülü masalar qoyulmuş otaqlar çoxluğu, $C$ – kiçik ölçülü masalar qoyulmuş otaqlar çoxluğu olarsa, verilənlərdən istifadə edərək Eyler-Venn diaqramı qurun.

$$\begin{array}{|l|c|}\hline \text{Otaqlar} & \text{Say}\\ \hline \text{Kiçik ölçülü masa qoyulmuş} & 9\\ \hline \text{Orta ölçülü masa qoyulmuş} & 14\\ \hline \textit{Ancaq}\text{ böyük ölçülü masa qoyulmuş} & 4\\ \hline \textit{Ancaq}\text{ kiçik ölçülü masa qoyulmuş} & 2\\ \hline \text{Həm kiçik, həm də orta ölçülü masa qoyulmuş} & 5\\ \hline \text{Həm orta, həm də böyük ölçülü masa qoyulmuş} & 0\\ \hline\end{array}$$',
  NULL, NULL, NULL, 'A\B\C=4; B\A\C=9; C\A\B=2; B∩C=5; A∩C=2; A∩B=0',
  'Otaqlarda ən çox iki növ masa var, ona görə $A\cap B\cap C=\varnothing$. $A\cap B=\varnothing$ (orta və böyük birlikdə yoxdur). $|B\cap C|=5$. $|C|=9$: yalnız $C$ – $2$, $C\cap A=9-2-5=2$. $|B|=14$: yalnız $B$ – $14-5=9$. Yalnız $A$ – $4$. Yoxlama: $4+9+2+5+2=22$ otaq. Diaqramda: $A$ dairəsinin yalnız özünə aid hissəsində $4$, $A\cap C$-də $2$, $C$-nin yalnız özünə aid hissəsində $2$, $B\cap C$-də $5$, $B$-nin yalnız özünə aid hissəsində $9$; $A$ və $B$ kəsişmir.',
  2025, 'I', 197, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0009 | əsas: 2025 toplu, I hissə, səh.197 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0009', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  '**Situasiya №3.** Şirkət mebel sexinə ümumi sayı $60$ ədəd olan $3$ müxtəlif növ iş masası sifariş verdi. Böyük ölçülü masa $150$ manata, orta ölçülü masa $90$ manata və kiçik ölçülü masa isə $70$ manatadır. Mebel sexi hər hansı növdən $20$ ədəd və daha çox alan müştəriyə həmin növ üçün qiymətdə $20\%$ endirim edir. Şirkətdə $22$ otaq var və alınmış masalar bəzi otaqlarda iki növ, bəzilərində isə yalnız bir növ masa olmaqla yerləşdirildi. Diaqramda alınmış masaların faizlə miqdarı göstərilmişdir.

$$\begin{array}{|l|c|}\hline \text{Otaqlar} & \text{Say}\\ \hline \text{Kiçik ölçülü masa qoyulmuş} & 9\\ \hline \text{Orta ölçülü masa qoyulmuş} & 14\\ \hline \textit{Ancaq}\text{ böyük ölçülü masa qoyulmuş} & 4\\ \hline \textit{Ancaq}\text{ kiçik ölçülü masa qoyulmuş} & 2\\ \hline \text{Həm kiçik, həm də orta ölçülü masa qoyulmuş} & 5\\ \hline \text{Həm orta, həm də böyük ölçülü masa qoyulmuş} & 0\\ \hline\end{array}$$

Konfrans keçirilməsi üçün otaqlardan $2$-si seçilməlidir. Seçilmiş otaqlarda yalnız bir növdən olan masaların olması və o otaqların birindəki masaların növünün digərindən fərqli olması hadisəsinin ehtimalını tapın.',
  NULL, NULL, NULL, '62/231',
  'Yalnız bir növ masa olan otaqlar: böyük – $4$, orta – $9$, kiçik – $2$. Fərqli növlü cütlər: $4\cdot9+4\cdot2+9\cdot2=62$. Bütün hallar ${}_{22}C_2=231$. $P=\dfrac{62}{231}$.',
  2025, 'I', 197, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0010 | əsas: 2025 toplu, I hissə, səh.198 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0010', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  '**Situasiya №4.** $10$-cu sinif şagirdlərinin ekskursiyaya getmələri üçün avtobus sifariş edildi. Avtobusda sərnişinlər üçün ayrılmış oturacaqların sayı $36$-dır. Ekskursiyaya şagirdlərlə yanaşı sinif rəhbəri və bir bələdçi gedir. Avtobusda bütün oturacaqlar dolur. Məktəbdən saat $9{:}00$-da hərəkətə başlayan avtobus gediş zamanı $v$ km/saat orta sürətlə hərəkət edərək yola $5$ saat vaxt sərf edir.

Avtobusdakı şagirdlərdən qızların sayının iki misli oğlanların sayından $8$ nəfər çox olarsa, oğlanların və qızların sayını tapın (məsələni tənlik və ya tənliklər sistemi qurmaqla həll edin).',
  NULL, NULL, NULL, 'qızlar 14, oğlanlar 20',
  'Şagirdlər: $36-2=34$. $\begin{cases}x+y=34\\2x-y=8\end{cases}\Rightarrow3x=42$, $x=14$ qız, $y=20$ oğlan.',
  2025, 'I', 198, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0011 | əsas: 2025 toplu, I hissə, səh.198 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0011', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  '**Situasiya №4.** $10$-cu sinif şagirdlərinin ekskursiyaya getmələri üçün avtobus sifariş edildi. Avtobusda sərnişinlər üçün ayrılmış oturacaqların sayı $36$-dır. Ekskursiyaya şagirdlərlə yanaşı sinif rəhbəri və bir bələdçi gedir. Avtobusda bütün oturacaqlar dolur. Məktəbdən saat $9{:}00$-da hərəkətə başlayan avtobus gediş zamanı $v$ km/saat orta sürətlə hərəkət edərək yola $5$ saat vaxt sərf edir.

$3$ qız, $7$ oğlan, sinif rəhbəri və bələdçi avtobusdan bir dayanacaqda düşmüşdür. Avtobusa minmək üçün yaxınlaşan növbəti $2$ sərnişindən birincisinin qız, ikincisinin isə oğlan şagird olması ehtimalını tapın (sinif rəhbəri və bələdçi əvvəlcədən avtobusda əyləşmişdir).',
  NULL, NULL, NULL, '7/30',
  'Birinci qız: $\dfrac3{10}$; sonra qalan $9$ şagirddən oğlan: $\dfrac79$. $P=\dfrac3{10}\cdot\dfrac79=\dfrac{7}{30}$.',
  2025, 'I', 198, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0012 | əsas: 2025 toplu, I hissə, səh.198 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0012', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  '**Situasiya №4.** $10$-cu sinif şagirdlərinin ekskursiyaya getmələri üçün avtobus sifariş edildi. Avtobusda sərnişinlər üçün ayrılmış oturacaqların sayı $36$-dır. Ekskursiyaya şagirdlərlə yanaşı sinif rəhbəri və bir bələdçi gedir. Avtobusda bütün oturacaqlar dolur. Məktəbdən saat $9{:}00$-da hərəkətə başlayan avtobus gediş zamanı $v$ km/saat orta sürətlə hərəkət edərək yola $5$ saat vaxt sərf edir.

Geri qayıtmaq üçün saat $15{:}00$-da hərəkətə başlayan avtobus $v$ km/saat sürətlə $2$ saat getdikdən sonra texniki nasazlığa görə $36$ dəq. dayanır. Saat $20{:}00$-da məktəbə çatmaq üçün avtobus qalan yolda əvvəlki $v$ orta sürətini neçə faiz artırmalıdır?',
  NULL, NULL, NULL, '25',
  'Qalan yol $3v$ km. Qalan vaxt $5-2-0{,}6=2{,}4$ saat. Yeni sürət $\dfrac{3v}{2{,}4}=1{,}25v$ – $25\%$ artırmalıdır.',
  2025, 'I', 198, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0013 | əsas: 2025 toplu, I hissə, səh.198 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0013', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  '**Situasiya №5.** İdman yarışında iştirak edən komandanın tərkibi iki məşqçi və bir neçə idmançıdan ibarətdir. Məşqçilərin hər birinin yaşı idmançıların yaşlarından çoxdur və komandanın üzvləri arasında eyni yaşlılar yoxdur. $(3;\,110)$ intervalında yerləşən bütün tam kvadrat ədədlər komandanın hər hansı bir üzvünün yaşını ifadə edir.

Komandadakı idmançıların sayını və onların yaşlarının ədədi ortasını tapın.',
  NULL, NULL, NULL, '7; 29',
  '$(3;110)$-da tam kvadratlar: $4,9,16,25,36,49,64,81,100$ – $9$ ədəd. Ən böyük ikisi ($81$, $100$) məşqçilərdir, idmançılar $7$ nəfərdir: $4,9,16,25,36,49,64$. Ədədi orta $\dfrac{203}{7}=29$.',
  2025, 'I', 198, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0014 | əsas: 2025 toplu, I hissə, səh.198 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0014', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  '**Situasiya №5.** İdman yarışında iştirak edən komandanın tərkibi iki məşqçi və bir neçə idmançıdan ibarətdir. Məşqçilərin hər birinin yaşı idmançıların yaşlarından çoxdur və komandanın üzvləri arasında eyni yaşlılar yoxdur. $(3;\,110)$ intervalında yerləşən bütün tam kvadrat ədədlər komandanın hər hansı bir üzvünün yaşını ifadə edir.

İdmançılardan ən böyüyünün qızıl medal, ən kiçiyinin gümüş medal və digərlərinin bürünc medal alması hadisəsinin ehtimalını tapın (medallar idmançılar arasında təsadüfi paylanır: bir qızıl, bir gümüş, qalanları bürünc).',
  NULL, NULL, NULL, '1/42',
  '$7$ idmançı. Qızıl medalın ən böyüyə düşməsi $\dfrac17$, sonra gümüşün ən kiçiyə düşməsi $\dfrac16$; qalanları avtomatik bürünc alır. $P=\dfrac1{42}$.',
  2025, 'I', 198, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0015 | əsas: 2025 toplu, I hissə, səh.198 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0015', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  '**Situasiya №5.** İdman yarışında iştirak edən komandanın tərkibi iki məşqçi və bir neçə idmançıdan ibarətdir. Məşqçilərin hər birinin yaşı idmançıların yaşlarından çoxdur və komandanın üzvləri arasında eyni yaşlılar yoxdur. $(3;\,110)$ intervalında yerləşən bütün tam kvadrat ədədlər komandanın hər hansı bir üzvünün yaşını ifadə edir.

Yarışda əldə olunmuş $4060$ manat pul mükafatı yalnız idmançılar arasında onların yaşlarına mütənasib olaraq bölünərsə, ən yaşlı idmançıya nə qədər pul mükafatı düşər?',
  NULL, NULL, NULL, '1280',
  'İdmançıların yaşları cəmi $203$. Ən yaşlı idmançı $64$ yaşındadır: $4060\cdot\dfrac{64}{203}=1280$ manat.',
  2025, 'I', 198, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0016 | əsas: 2025 toplu, I hissə, səh.198 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0016', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  '**Situasiya №6.** Çoxmərtəbəli, bir bloklu binanın müəyyən mərtəbələri yaşayış, digərləri isə qeyri-yaşayış üçün nəzərdə tutulmuşdur. Yaşayış üçün nəzərdə tutulan hər mərtəbədə $5$ mənzil var. Qeyri-yaşayış üçün nəzərdə tutulan hər mərtəbədə $4$ ofis var. Ofis və mənzillərin sayları nisbəti $2:5$ olub, sayları cəmi $70$-dir.

Yaşayış və qeyri-yaşayış mərtəbələrinin sayını tapın.',
  NULL, NULL, NULL, '10 və 5',
  'Ofislər $70\cdot\dfrac27=20$, mənzillər $50$. Yaşayış mərtəbələri $50:5=10$, qeyri-yaşayış $20:4=5$.',
  2025, 'I', 198, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0017 | əsas: 2025 toplu, I hissə, səh.198 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0017', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  '**Situasiya №6.** Çoxmərtəbəli, bir bloklu binanın müəyyən mərtəbələri yaşayış, digərləri isə qeyri-yaşayış üçün nəzərdə tutulmuşdur. Yaşayış üçün nəzərdə tutulan hər mərtəbədə $5$ mənzil var. Qeyri-yaşayış üçün nəzərdə tutulan hər mərtəbədə $4$ ofis var. Ofis və mənzillərin sayları nisbəti $2:5$ olub, sayları cəmi $70$-dir.

Yaşayış mərtəbəsində olan hər mənzilin sahələri cədvəldə verilmişdir. Mənzillərin hər kvadrat metri üçün aylıq $40$ qəpik xidmət haqqı alınır. Hər mərtəbədə verilmiş hər növ mənzildən bir ədəd olarsa, bir ay müddətində bütün mənzillərdən yığılan xidmət haqqının miqdarını tapın.

$$\begin{array}{|c|c|c|c|c|}\hline 1\text{ otaqlı} & 2\text{ otaqlı} & 3\text{ otaqlı} & 4\text{ otaqlı} & 5\text{ otaqlı}\\ \hline 50\ m^2 & 70\ m^2 & 90\ m^2 & 110\ m^2 & 130\ m^2\\ \hline\end{array}$$',
  NULL, NULL, NULL, '1800',
  'Bir mərtəbədə $50+70+90+110+130=450$ $m^2$, $10$ mərtəbədə $4500$ $m^2$. Haqq: $4500\cdot0{,}4=1800$ manat.',
  2025, 'I', 198, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0018 | əsas: 2025 toplu, I hissə, səh.198 №18
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0018', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  '**Situasiya №6.** Çoxmərtəbəli, bir bloklu binanın müəyyən mərtəbələri yaşayış, digərləri isə qeyri-yaşayış üçün nəzərdə tutulmuşdur. Yaşayış üçün nəzərdə tutulan hər mərtəbədə $5$ mənzil var. Qeyri-yaşayış üçün nəzərdə tutulan hər mərtəbədə $4$ ofis var. Ofis və mənzillərin sayları nisbəti $2:5$ olub, sayları cəmi $70$-dir.

Binanın hər hansı mərtəbəsindən mənzil almaq istəyən Kamran, eyni zamanda qeyri-yaşayış mərtəbəsindən ofis icarəyə götürmək istəyir. O, mərtəbələr arasından seçimi neçə fərqli üsulla edə bilər?',
  NULL, NULL, NULL, '1000',
  'Mənzil $50$, ofis $20$ üsulla seçilir (onlar həmişə fərqli mərtəbələrdədir). Hasil qaydası: $50\cdot20=1000$.',
  2025, 'I', 198, 18)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0019 | əsas: 2025 toplu, I hissə, səh.34 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0019', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'closed',
  '$n$ sayda ədədin ədədi ortası $0{,}4$-ə, $m$ sayda ədədin ədədi ortası $1{,}2$-yə, $(n+m)$ sayda ədədin ədədi ortası $0{,}7$-yə bərabər olarsa, $n+m$-in ən kiçik qiymətini tapın.',
  '[{"key": "A", "text": "$6$"}, {"key": "B", "text": "$8$"}, {"key": "C", "text": "$3$"}, {"key": "D", "text": "$5$"}, {"key": "E", "text": "$16$"}]'::jsonb, 'B', NULL, NULL,
  '$0{,}4n+1{,}2m=0{,}7(n+m)\Rightarrow0{,}5m=0{,}3n\Rightarrow5m=3n$. Ən kiçik natural həll: $n=5$, $m=3$; $n+m=8$.',
  2025, 'I', 34, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0020 | əsas: 2025 toplu, I hissə, səh.34 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0020', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'closed',
  '$a$, $b$ və $c$ müsbət həqiqi ədədlərdir. $a$ və $b$ ədədlərinin həndəsi ortası $p$, $a$ və $c$ ədədlərinin həndəsi ortası $q$, $b$ və $c$ ədədlərinin həndəsi ortası $r$ olarsa, $a$, $b$ və $c$ ədədlərinin ədədi ortasını tapın.',
  '[{"key": "A", "text": "$\\dfrac{p^2q^2+p^2r^2+q^2r^2}{3pqr}$"}, {"key": "B", "text": "$\\dfrac{3(pq+qr+pr)}{pqr}$"}, {"key": "C", "text": "$\\dfrac{pq+qr+pr}{pqr}$"}, {"key": "D", "text": "$\\dfrac{p^2+q^2+r^2}{3}$"}, {"key": "E", "text": "$\\dfrac{pq+qr+pr}{3pqr}$"}]'::jsonb, 'A', NULL, NULL,
  '$ab=p^2$, $ac=q^2$, $bc=r^2$. $abc=pqr$. $a=\dfrac{pqr}{r^2}=\dfrac{pq}{r}$, $b=\dfrac{pr}{q}$, $c=\dfrac{qr}{p}$. $\dfrac{a+b+c}{3}=\dfrac{p^2q^2+p^2r^2+q^2r^2}{3pqr}$.',
  2025, 'I', 34, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0021 | əsas: 2025 toplu, I hissə, səh.34 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0021', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  '$12$ ədədin ədədi ortası $8{,}5$-ə bərabərdir. Bu ədədlərin cəminin $\dfrac16$ hissəsini tapın.',
  NULL, NULL, NULL, '17',
  'Cəm $12\cdot8{,}5=102$; $\dfrac{102}{6}=17$.',
  2025, 'I', 34, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0022 | əsas: 2025 toplu, I hissə, səh.34 №25
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0022', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  '$16$ ədədin ədədi ortası $9{,}5$-ə bərabərdir. Bu ədədlərin cəminin $\dfrac18$ hissəsini tapın.',
  NULL, NULL, NULL, '19',
  'Cəm $152$; $\dfrac{152}{8}=19$.',
  2025, 'I', 34, 25)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0023 | əsas: 2025 toplu, I hissə, səh.34 №26
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0023', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  'Beş ədədin ədədi ortası $17$-yə bərabərdir. Bu ədədlərə yeni bir ədəd əlavə etdikdən sonra ədədi orta $15$ oldu. Əlavə olunmuş ədədi tapın.',
  NULL, NULL, NULL, '5',
  '$6\cdot15-5\cdot17=90-85=5$.',
  2025, 'I', 34, 26)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0024 | əsas: 2025 toplu, I hissə, səh.34 №27
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0024', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  'Yeddi ədədin ədədi ortası $15$-ə bərabərdir. Bu ədədlərdən birini çıxardıqdan sonra ədədi orta $13$ oldu. Çıxarılmış ədədi tapın.',
  NULL, NULL, NULL, '27',
  '$105-78=27$.',
  2025, 'I', 34, 27)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0025 | əsas: 2025 toplu, I hissə, səh.34 №28
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0025', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  '$a$, $b$ müsbət həqiqi ədədlərinin ədədi ortası $6$ və həndəsi ortası $5$ olarsa, $a^2+b^2$ cəmini tapın.',
  NULL, NULL, NULL, '94',
  '$a+b=12$, $ab=25$. $a^2+b^2=(a+b)^2-2ab=144-50=94$.',
  2025, 'I', 34, 28)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0026 | əsas: 2025 toplu, II hissə, səh.190 №142
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0026', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  'Sinifdəki $30$ şagirddən şahmat dərnəyinə gedənlərin və getməyənlərin sayı cədvəldə verilmişdir. Bu şagirdlər arasından təsadüfən seçilmiş $2$ şagirddən hər ikisinin şahmat dərnəyinə gedən oğlan olması hadisəsinin ehtimalını tapın.

$$\begin{array}{|l|c|c|}\hline & \text{Şahmat dərnəyinə gedənlər} & \text{Şahmat dərnəyinə getməyənlər}\\ \hline \text{Qız} & m & 9\\ \hline \text{Oğlan} & 2m & 6\\ \hline\end{array}$$',
  NULL, NULL, NULL, '3/29',
  '$m+9+2m+6=30\Rightarrow m=5$. Dərnəyə gedən oğlanlar $10$. $P=\dfrac{{}_{10}C_2}{{}_{30}C_2}=\dfrac{45}{435}=\dfrac{3}{29}$.',
  2025, 'II', 190, 142)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- SIT-0027 | əsas: 2025 toplu, II hissə, səh.190 №143
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('SIT-0027', NULL, NULL, (SELECT id FROM topics WHERE name='Situasiya'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='Situasiya' AND s.title='Situasiya'), 'original', 'own', 'az', 'draft', 'written',
  'Sinifdəki $30$ şagirddən eynək taxan və eynək taxmayanların sayı cədvəldə verilmişdir. Bu şagirdlər arasından təsadüfi seçilmiş $2$ nəfərdən birincinin eynəkli oğlan, ikincinin eynəksiz qız olması hadisəsinin ehtimalını tapın.

$$\begin{array}{|l|c|c|}\hline & \text{Eynəkli} & \text{Eynəksiz}\\ \hline \text{Qız} & 6 & 10\\ \hline \text{Oğlan} & m & 8\\ \hline\end{array}$$',
  NULL, NULL, NULL, '2/29',
  '$m=30-6-10-8=6$. $P=\dfrac{6}{30}\cdot\dfrac{10}{29}=\dfrac{2}{29}$.',
  2025, 'II', 190, 143)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
