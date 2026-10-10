-- Mövzu: İsbat məsələləri — 26 orijinal sual (toplu tipləri əsasında, rəqəmlər və variantlar dəyişdirilib)
-- Əvvəlcə question_bank_v2.sql tətbiq olunmalıdır. Təkrar işə salmaq təhlükəsizdir (ON CONFLICT (code) DO UPDATE).
BEGIN;
-- ISB-0001 | əsas: 2025 toplu, I hissə, səh.194 №1
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0001', NULL, NULL, (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  'İsbat edin ki, $(x+m)$ vuruğu $x^2+px+q$ və $x^2+kx+t$ çoxhədlilərinin ortaq vuruğu olarsa ($p\ne k$), $m=\dfrac{t-q}{k-p}$ olar.',
  NULL, NULL, NULL, 'İsbat',
  '$x=-m$ hər iki çoxhədlinin köküdür: $m^2-pm+q=0$ və $m^2-km+t=0$. Bərabərlikləri tərəf-tərəfə çıxaq: $(k-p)m+(q-t)=0\Rightarrow m=\dfrac{t-q}{k-p}$.',
  2025, 'I', 194, 1)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0002 | əsas: 2025 toplu, I hissə, səh.194 №2
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0002', NULL, NULL, (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  '$\dfrac{m}{n}+\dfrac{p}{q}=1$ olarsa, $\left(\dfrac mn\right)^2+\dfrac pq=\left(\dfrac pq\right)^2+\dfrac mn$ olduğunu isbat edin.',
  NULL, NULL, NULL, 'İsbat',
  '$u=\dfrac mn$, $v=\dfrac pq$, $u+v=1$. $u^2+v-(v^2+u)=(u-v)(u+v)-(u-v)=(u-v)(u+v-1)=0$.',
  2025, 'I', 194, 2)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0003 | əsas: 2025 toplu, I hissə, səh.194 №3
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0003', NULL, NULL, (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  '$x>0$, $y>0$, $z>0$ olduqda $(x+y)(y+z)(z+x)\ge8xyz$ olduğunu isbat edin.',
  NULL, NULL, NULL, 'İsbat',
  'Ədədi və həndəsi orta arasındakı bərabərsizliyə görə $x+y\ge2\sqrt{xy}$, $y+z\ge2\sqrt{yz}$, $z+x\ge2\sqrt{zx}$. Müsbət tərəfləri vuraq: $(x+y)(y+z)(z+x)\ge8\sqrt{x^2y^2z^2}=8xyz$.',
  2025, 'I', 194, 3)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0004 | əsas: 2025 toplu, I hissə, səh.194 №4
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0004', NULL, NULL, (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  'Ümumi hədləri $a_n$ və $b_n$ olan ədədi silsilələr verilmişdir. Ümumi həddi $c_n=3a_n-5b_n$ olan ardıcıllığın ədədi silsilə olduğunu isbat edin.',
  NULL, NULL, NULL, 'İsbat',
  '$a_n$-in fərqi $d_1$, $b_n$-in fərqi $d_2$ olsun. $c_{n+1}-c_n=3(a_{n+1}-a_n)-5(b_{n+1}-b_n)=3d_1-5d_2$ – $n$-dən asılı olmayan sabitdir, deməli $(c_n)$ ədədi silsilədir.',
  2025, 'I', 194, 4)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0005 | əsas: 2025 toplu, I hissə, səh.194 №5
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0005', '/images/tasks/ISB-0005.png', 'a və b düz xətləri, onları kəsən c düz xətti (b ilə 50°, a ilə 40°) və b-ni 100° bucaqla kəsən d düz xətti', (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  'Şəkildə $c$ düz xətti $b$ ilə $50^\circ$-li, $a$ ilə $40^\circ$-li bucaq əmələ gətirir. $a$ və $b$ düz xətlərinin perpendikulyar olduğunu isbat edin.',
  NULL, NULL, NULL, 'İsbat',
  '$a$, $b$ və $c$ düz xətləri üçbucaq əmələ gətirir. Onun iki bucağı $50^\circ$ və $40^\circ$-dir. Üçbucağın bucaqları cəmi $180^\circ$ olduğundan üçüncü bucaq – $a$ ilə $b$ arasındakı bucaq $180^\circ-50^\circ-40^\circ=90^\circ$-dir. Deməli $a\perp b$. ($d$ düz xətti və $100^\circ$-li bucaq köməkçi məlumatdır: $d$ ilə $b$ arasındakı qonşu bucaq $80^\circ$-dir.)',
  2025, 'I', 194, 5)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0006 | əsas: 2025 toplu, I hissə, səh.194 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0006', '/images/tasks/ISB-0006.png', 'MNPK dördbucaqlısı, MP diaqonalı, NE və KF tənbölənləri', (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  '$MNPK$ dördbucaqlısında $MN=PK$, $NP=KM$; $NE$ və $KF$ uyğun olaraq $MNP$ və $MKP$ bucaqlarının tənbölənləridir ($E,F\in MP$). $MNE$ və $PKF$ üçbucaqlarının konqruent olduqlarını isbat edin.',
  NULL, NULL, NULL, 'İsbat',
  '$\triangle MNP\cong\triangle PKM$ (üç tərəfə görə: $MN=PK$, $NP=KM$, $MP$ – ortaq). Buradan $\angle NMP=\angle KPM$ və $\angle MNP=\angle PKM$. Tənbölənlər bu bucaqları yarıya bölür: $\angle MNE=\angle PKF$. $\triangle MNE$ və $\triangle PKF$-də $MN=PK$, $\angle NMP=\angle KPM$, $\angle MNE=\angle PKF$ – tərəf və ona bitişik iki bucağa görə konqruentdirlər.',
  2025, 'I', 194, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0007 | əsas: 2025 toplu, I hissə, səh.194 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0007', '/images/tasks/ISB-0007.png', 'MON bucağı, OL tənböləni və ona K nöqtəsində perpendikulyar PQ parçası', (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  '$OL$ şüası $MON$ bucağının tənböləni, $K\in OL$ və $PQ\perp OL$ ($P\in OM$, $Q\in ON$, $K\in PQ$) olarsa, $OP=OQ$ olduğunu isbat edin.',
  NULL, NULL, NULL, 'İsbat',
  '$\triangle OKP$ və $\triangle OKQ$ düzbucaqlıdır ($\angle OKP=\angle OKQ=90^\circ$), $OK$ – ortaq katet, $\angle POK=\angle QOK$ (tənbölən). Katet və iti bucağa görə üçbucaqlar konqruentdir, deməli $OP=OQ$.',
  2025, 'I', 194, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0008 | əsas: 2025 toplu, I hissə, səh.194 №8
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0008', '/images/tasks/ISB-0008.png', 'MNK üçbucağı, K təpəsində xarici bucağın MN-ə paralel tənböləni', (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  'İsbat edin ki, üçbucağın $K$ təpəsindəki xarici bucağın tənböləni $MN$ tərəfinə paraleldirsə, $MNK$ üçbucağı bərabəryanlıdır.',
  NULL, NULL, NULL, 'İsbat',
  'Tənbölən xarici bucağı iki bərabər $\varphi$ hissəyə bölür. Paralel düz xətlər və kəsənə görə: bir hissə $\angle M$-ə uyğun bucaqdır, digəri $\angle N$-ə çarpaz bucaqdır. Deməli $\angle M=\varphi=\angle N$, üçbucaq bərabəryanlıdır ($KM=KN$).',
  2025, 'I', 194, 8)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0009 | əsas: 2025 toplu, I hissə, səh.194 №9
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0009', '/images/tasks/ISB-0009.png', 'AOB bucağı, OC tənböləni üzərində P nöqtəsi və tərəflərə endirilmiş PM, PK perpendikulyarları', (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  'Bucağın tənböləni üzərində götürülmüş $P$ nöqtəsindən bucağın tərəflərinə endirilmiş $PM$ və $PK$ perpendikulyarlarının bərabər olduğunu isbat edin.',
  NULL, NULL, NULL, 'İsbat',
  '$\triangle OMP$ və $\triangle OKP$ düzbucaqlıdır, $OP$ – ortaq hipotenuz, $\angle MOP=\angle KOP$. Hipotenuz və iti bucağa görə konqruentdirlər: $PM=PK$.',
  2025, 'I', 194, 9)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0010 | əsas: 2025 toplu, I hissə, səh.194 №10
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0010', '/images/tasks/ISB-0010.png', 'Düzbucaqlı ABC üçbucağı və bir tərəfi AB hipotenuzu üzərində olan EFKD kvadratı', (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  '$ABC$ düzbucaqlı üçbucağının ($\angle C=90^\circ$) daxilinə bir tərəfi $FK$ hipotenuz üzərində olan $EFKD$ kvadratı çəkilmişdir ($E\in AC$, $D\in BC$). İsbat edin ki, $S_{EFKD}=AF\cdot KB$.',
  NULL, NULL, NULL, 'İsbat',
  '$\triangle AFE\sim\triangle DKB$: hər ikisi düzbucaqlıdır və $\angle AEF=\angle B$ (hər biri $90^\circ-\angle A$). Oxşarlıqdan $\dfrac{AF}{EF}=\dfrac{DK}{KB}$, yəni $AF\cdot KB=EF\cdot DK=a^2$, burada $a$ – kvadratın tərəfidir. Deməli $S_{EFKD}=AF\cdot KB$.',
  2025, 'I', 194, 10)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0011 | əsas: 2025 toplu, I hissə, səh.194 №11
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0011', '/images/tasks/ISB-0011.png', 'ABC üçbucağı, AM və BN medianları', (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  'İsbat edin ki, üçbucağın $AM$ və $BN$ medianları bərabərdirsə, bu üçbucaq bərabəryanlıdır.',
  NULL, NULL, NULL, 'İsbat',
  'Medianların kəsişmə nöqtəsi $O$ olsun. $AO=\dfrac23AM=\dfrac23BN=BO$, $OM=ON$. $\triangle AON\cong\triangle BOM$ (iki tərəf və aralarındakı qarşılıqlı bucaq): $AN=BM$. Deməli $\dfrac{AC}{2}=\dfrac{BC}{2}$, $AC=BC$.',
  2025, 'I', 194, 11)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0012 | əsas: 2025 toplu, I hissə, səh.194 №12
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0012', '/images/tasks/ISB-0012.png', 'Bərabəryanlı ABC üçbucağı, BC-nin uzantısında P nöqtəsi və ondan AB, AC düz xətlərinə perpendikulyarlar', (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  'İsbat edin ki, bərabəryanlı üçbucağın oturacağının uzantısı üzərində götürülmüş nöqtədən yan tərəfləri üzərində saxlayan düz xətlərə qədər məsafələrin fərqi üçbucağın yan tərəfinə çəkilmiş hündürlüyünə bərabərdir.',
  NULL, NULL, NULL, 'İsbat',
  '$AB=AC$, $P$ – $BC$-nin $C$-dən o tərəfdəki uzantısında. $S_{ABP}=S_{ABC}+S_{ACP}$: $\dfrac12AB\cdot d_1=\dfrac12AB\cdot h+\dfrac12AC\cdot d_2$. $AB=AC$ olduğundan $d_1=h+d_2$, yəni $d_1-d_2=h$.',
  2025, 'I', 194, 12)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0013 | əsas: 2025 toplu, I hissə, səh.195 №13
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0013', NULL, NULL, (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  'İsbat edin ki, $MNK$ üçbucağının daxilində götürülmüş ixtiyari $O$ nöqtəsindən üçbucağın təpə nöqtələrinə qədər məsafələrin cəmi üçbucağın yarımperimetrindən böyükdür.',
  NULL, NULL, NULL, 'İsbat',
  'Üçbucaq bərabərsizliyinə görə $OM+ON>MN$, $ON+OK>NK$, $OK+OM>KM$. Toplayaq: $2(OM+ON+OK)>MN+NK+KM$, buradan $OM+ON+OK>p$.',
  2025, 'I', 195, 13)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0014 | əsas: 2025 toplu, I hissə, səh.195 №14
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0014', NULL, NULL, (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  '$MNK$ bərabəryanlı üçbucağının $MK$ oturacağı üzərində götürülmüş $P$ nöqtəsindən yan tərəflərə paralel $PE$ və $PF$ düz xətləri çəkilmişdir ($E\in MN$, $F\in NK$). Alınmış $NEPF$ dördbucaqlısının perimetrinin üçbucağın yan tərəflərinin cəminə bərabər olduğunu isbat edin.',
  NULL, NULL, NULL, 'İsbat',
  '$NEPF$ paraleloqramdır: $PE=NF$, $PF=NE$. $PE\parallel NK$ olduğundan $\angle EPM=\angle K=\angle M$, yəni $\triangle MEP$ bərabəryanlıdır: $PE=ME$. Onda $P_{NEPF}=2(NE+PE)=2(NE+EM)=2MN=MN+NK$.',
  2025, 'I', 195, 14)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0015 | əsas: 2025 toplu, I hissə, səh.195 №15
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0015', NULL, NULL, (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  'Düzbucaqlı üçbucağın xaricinə çəkilmiş çevrənin radiusu $R$, daxilinə çəkilmiş çevrənin radiusu $r$ olarsa, onun perimetrinin $P=2(2R+r)$ olduğunu isbat edin.',
  NULL, NULL, NULL, 'İsbat',
  'Hipotenuz $c=2R$. Daxilə çəkilmiş çevrə üçün toxunanlar xassəsindən $a+b-c=2r$, yəni $a+b=2R+2r$. $P=a+b+c=2R+2r+2R=2(2R+r)$.',
  2025, 'I', 195, 15)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0016 | əsas: 2025 toplu, I hissə, səh.195 №16
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0016', '/images/tasks/ISB-0016.png', 'Bərabərtərəfli ABC üçbucağı, daxilə çəkilmiş O mərkəzli çevrə və C bucağında iki tərəfə və bu çevrəyə toxunan kiçik O₁ mərkəzli çevrə', (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  '$ABC$ bərabərtərəfli üçbucağının daxilinə mərkəzi $O$ nöqtəsində radiusu $r$ olan çevrə, üçbucağın $C$ təpəsindən çıxan iki tərəfinə və bu çevrəyə toxunan mərkəzi $O_1$ nöqtəsində radiusu $r_1$ olan çevrə çəkilmişdir. İsbat edin ki, $\dfrac{r}{r_1}=3$.',
  NULL, NULL, NULL, 'İsbat',
  '$O$ və $O_1$ $C$ bucağının tənböləni üzərindədir, $\angle C=60^\circ$, tənbölən tərəflə $30^\circ$ bucaq əmələ gətirir. Ona görə $CO=\dfrac{r}{\sin30^\circ}=2r$, $CO_1=2r_1$. Çevrələr toxunduğundan $CO=CO_1+r_1+r$: $2r=3r_1+r\Rightarrow r=3r_1$.',
  2025, 'I', 195, 16)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0017 | əsas: 2025 toplu, I hissə, səh.195 №17
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0017', '/images/tasks/ISB-0017.png', 'O mərkəzli çevrə, BC düz xətti, C-dən çevrəyə AC toxunanı və AB vətəri', (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  'Mərkəzi $O$ olan çevrəyə $CA$ toxunanı çəkilmiş, $B$ – $CO$ düz xəttinin çevrə ilə ikinci (uzaq) kəsişmə nöqtəsi, $D$ isə yaxın kəsişmə nöqtəsidir. $AB=AC$ olarsa, isbat edin ki, çevrənin radiusu $DC$ parçasına bərabərdir.',
  NULL, NULL, NULL, 'İsbat',
  '$AB=AC\Rightarrow\angle B=\angle C=\varphi$. $OA=OB\Rightarrow\angle OAB=\varphi$, $\angle AOC=2\varphi$ (xarici bucaq). $OA\perp AC$: $\triangle OAC$-də $2\varphi+\varphi=90^\circ$, $\varphi=30^\circ$. Onda $OC=2OA=2R$ ($30^\circ$ qarşısındakı katet), $DC=OC-OD=2R-R=R$.',
  2025, 'I', 195, 17)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0018 | əsas: 2025 toplu, I hissə, səh.195 №18
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0018', '/images/tasks/ISB-0018.png', 'Bərabərtərəfli MNK üçbucağı və MK üzərində qurulmuş yarımçevrə; yarımçevrə yan tərəfləri P və Q nöqtələrində kəsir', (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  'Bərabərtərəfli $MNK$ üçbucağının $MK$ tərəfi üzərində qurulmuş yarımçevrə üçbucağın digər iki tərəfi ilə $P$ və $Q$ nöqtələrində kəsişir ($P\in MN$, $Q\in NK$). İsbat edin ki, yarımçevrə üç bərabər qövsə bölünür: $\smile MP=\smile PQ=\smile QK$.',
  NULL, NULL, NULL, 'İsbat',
  '$O$ – $MK$-nın ortası. $OM=OP$ və $\angle M=60^\circ$ olduğundan $\triangle MOP$ bərabərtərəflidir: $\angle MOP=60^\circ$. Eyni qayda ilə $\angle QOK=60^\circ$. Onda $\angle POQ=180^\circ-60^\circ-60^\circ=60^\circ$. Bərabər mərkəzi bucaqlara bərabər qövslər uyğundur.',
  2025, 'I', 195, 18)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0019 | əsas: 2025 toplu, I hissə, səh.195 №19
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0019', '/images/tasks/ISB-0019.png', 'O₁ və O₂ mərkəzli kəsişən çevrələr, A və B kəsişmə nöqtələri, AC və AD diametrləri', (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  'İki çevrənin $A$ kəsişmə nöqtəsindən onların $AC$ və $AD$ diametrləri çəkilmişdir. İsbat edin ki, bu diametrlərin $C$ və $D$ uc nöqtələri və çevrələrin digər $B$ kəsişmə nöqtəsi bir düz xətt üzərində yerləşir.',
  NULL, NULL, NULL, 'İsbat',
  '$\angle ABC=90^\circ$ (diametrə söykənən çevrə daxilinə çəkilmiş bucaq) və $\angle ABD=90^\circ$. $BC$ və $BD$ şüaları $AB$-yə $B$ nöqtəsində perpendikulyardır, deməli eyni düz xətt üzərindədir: $C$, $B$, $D$ kollineardır.',
  2025, 'I', 195, 19)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0020 | əsas: 2025 toplu, I hissə, səh.195 №20
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0020', '/images/tasks/ISB-0020.png', 'ABC üçbucağı və tərəflərin orta nöqtələri A₁, B₁, C₁', (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  'İsbat edin ki, üçbucağın tərəflərinin orta nöqtələrindən keçən çevrənin radiusu bu üçbucağın xaricinə çəkilmiş çevrənin radiusundan $2$ dəfə kiçikdir.',
  NULL, NULL, NULL, 'İsbat',
  'Orta nöqtələrin əmələ gətirdiyi $A_1B_1C_1$ üçbucağının tərəfləri orta xətlərdir və $ABC$-nin tərəflərinin yarısına bərabərdir. Deməli $\triangle A_1B_1C_1\sim\triangle ABC$, əmsal $\dfrac12$. Oxşar üçbucaqların xaricinə çəkilmiş çevrələrin radiusları da həmin nisbətdədir: $R_1=\dfrac R2$.',
  2025, 'I', 195, 20)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0021 | əsas: 2025 toplu, I hissə, səh.195 №21
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0021', '/images/tasks/ISB-0021.png', 'Çevrə, N nöqtəsində MN toxunanı, NP tənböləni və NQ vətəri', (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  '$MN$ çevrəyə $N$ nöqtəsində çəkilmiş toxunan, $NP$ vətəri $MNQ$ bucağının tənbölənidir ($P$, $Q$ – çevrə üzərindədir). İsbat edin ki, $NPQ$ üçbucağı bərabəryanlıdır.',
  NULL, NULL, NULL, 'İsbat',
  'Toxunan ilə vətər arasındakı bucaq bu vətərin gərdiyi qövsün yarısına bərabərdir: $\angle MNP=\angle NQP$. Tənbölən şərtinə görə $\angle MNP=\angle PNQ$. Deməli $\angle PNQ=\angle NQP$, $\triangle NPQ$ bərabəryanlıdır: $PN=PQ$.',
  2025, 'I', 195, 21)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0022 | əsas: 2025 toplu, I hissə, səh.195 №22
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0022', '/images/tasks/ISB-0022.png', 'O₁ və O₂ mərkəzli iki çevrə və F nöqtəsində kəsişən AB, CD ortaq daxili toxunanları', (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  '$AB$ və $CD$ parçaları $F$ nöqtəsində kəsişən, mərkəzləri $O_1$ və $O_2$ olan çevrələrin ortaq daxili toxunanlarıdır ($A$, $C$ – birinci, $B$, $D$ – ikinci çevrədə toxunma nöqtələri). $\angle AFC=\angle BFD$ olduğunu isbat edin.',
  NULL, NULL, NULL, 'İsbat',
  '$AB$ və $CD$ düz xətləri $F$ nöqtəsində kəsişir, $\angle AFC$ və $\angle BFD$ – qarşılıqlı bucaqlardır ($A$ və $B$, eləcə də $C$ və $D$ $F$-in müxtəlif tərəflərindədir). Qarşılıqlı bucaqlar bərabərdir: $\angle AFC=\angle BFD$. Həm də $FO_1$ və $FO_2$ bu bucaqların tənbölənləridir (bir nöqtədən çəkilmiş toxunanlar xassəsi).',
  2025, 'I', 195, 22)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0023 | əsas: 2025 toplu, I hissə, səh.195 №23
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0023', '/images/tasks/ISB-0023.png', 'ABCD düzbucaqlısı və B-dən keçib AD, CD tərəflərinə toxunan çevrə', (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  'Eni $m$, uzunluğu $n$ olan $ABCD$ düzbucaqlısının $B$ təpə nöqtəsi çevrə üzərindədir, $AD$ və $CD$ tərəfləri isə bu çevrəyə toxunur. Çevrənin radiusunun uzunluğunun $m+n-\sqrt{2mn}$ olduğunu isbat edin.',
  NULL, NULL, NULL, 'İsbat',
  '$D$-ni koordinat başlanğıcı götürək: $A(-n;0)$, $C(0;m)$, $B(-n;m)$. Çevrə $DA$ və $DC$-yə toxunduğundan mərkəzi $(-r;r)$. $B$ çevrədədir: $(n-r)^2+(m-r)^2=r^2\Rightarrow r^2-2(m+n)r+m^2+n^2=0$. $r=m+n\pm\sqrt{2mn}$; $r\le m$ olduğundan $r=m+n-\sqrt{2mn}$.',
  2025, 'I', 195, 23)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0024 | əsas: 2025 toplu, I hissə, səh.195 №24
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0024', NULL, NULL, (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  'İsbat edin ki, müxtəlif radiuslu iki çevrənin kəsişmə nöqtələrindən keçən düz xətt üzərində (çevrələrdən kənarda) yerləşən istənilən nöqtədən bu çevrələrə çəkilən toxunanlar konqruentdirlər.',
  NULL, NULL, NULL, 'İsbat',
  '$A$, $B$ – kəsişmə nöqtələri, $P\in AB$, $PT_1$ və $PT_2$ – toxunanlar. Toxunan və kəsən haqqında teoremə görə $PT_1^2=PA\cdot PB$ və $PT_2^2=PA\cdot PB$. Deməli $PT_1=PT_2$.',
  2025, 'I', 195, 24)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0025 | əsas: 2025 toplu, I hissə, səh.143 №6
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0025', NULL, NULL, (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  '$\alpha$ və $\beta$ uyğun tərəfləri perpendikulyar olan bucaqlardır. Fikrinizi əsaslandırmaqla $x+y$ cəmini tapın.

$$\begin{array}{|c|c|c|}\hline & \text{Eyni növlü bucaqlar} & \text{Müxtəlif növlü bucaqlar}\\ \hline \alpha & 125^\circ & y\\ \hline \beta & x & 65^\circ\\ \hline\end{array}$$',
  NULL, NULL, NULL, '240',
  'Uyğun tərəfləri perpendikulyar olan bucaqlar eyni növlüdürsə (ikisi də iti və ya ikisi də kor) bərabərdir: $x=125^\circ$. Müxtəlif növlüdürsə, cəmi $180^\circ$-dir: $y=180^\circ-65^\circ=115^\circ$. $x+y=240^\circ$.',
  2025, 'I', 143, 6)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
-- ISB-0026 | əsas: 2025 toplu, I hissə, səh.143 №7
INSERT INTO tasks (code, image_url, image_alt, topic_id, subtopic_id, origin, rights_status, language, status, format, body_md, options, correct_option, matching_answer, answer_value, solution_md, based_on_year, based_on_part, based_on_page, based_on_task_no)
VALUES ('ISB-0026', NULL, NULL, (SELECT id FROM topics WHERE name='İsbat məsələləri'), (SELECT s.id FROM subtopics s JOIN topics tp ON tp.id=s.topic_id WHERE tp.name='İsbat məsələləri' AND s.title='İsbat məsələləri'), 'original', 'own', 'az', 'draft', 'written',
  '$\alpha$ və $\beta$ uyğun tərəfləri paralel olan bucaqlardır. Fikrinizi əsaslandırmaqla $x+y$ cəmini tapın.

$$\begin{array}{|c|c|c|}\hline & \text{Eyni növlü bucaqlar} & \text{Müxtəlif növlü bucaqlar}\\ \hline \alpha & 140^\circ & y\\ \hline \beta & x & 70^\circ\\ \hline\end{array}$$',
  NULL, NULL, NULL, '250',
  'Uyğun tərəfləri paralel olan eyni növlü bucaqlar bərabərdir: $x=140^\circ$; müxtəlif növlü bucaqların cəmi $180^\circ$-dir: $y=110^\circ$. $x+y=250^\circ$.',
  2025, 'I', 143, 7)
ON CONFLICT (code) DO UPDATE SET options=EXCLUDED.options, correct_option=EXCLUDED.correct_option, body_md=EXCLUDED.body_md,
  solution_md=EXCLUDED.solution_md, answer_value=EXCLUDED.answer_value, matching_answer=EXCLUDED.matching_answer,
  image_url=EXCLUDED.image_url, image_alt=EXCLUDED.image_alt, subtopic_id=EXCLUDED.subtopic_id;
COMMIT;
