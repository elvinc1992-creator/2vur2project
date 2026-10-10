-- =====================================================================
-- DİM riyaziyyat sual bankı — TAM SXEM (son versiya, v2)
-- Boş bazada da, 001–005 tətbiq olunmuş bazada da təhlükəsiz işləyir
-- (CREATE ... IF NOT EXISTS, ADD COLUMN IF NOT EXISTS, idempotent seed).
-- PostgreSQL 13+ (gen_random_uuid daxili funksiyadır).
-- =====================================================================
BEGIN;

-- ---------- 1. Əsas cədvəllər ----------
CREATE TABLE IF NOT EXISTS topics (
  id          serial PRIMARY KEY,
  name        text NOT NULL,
  part        text,
  sort_order  int NOT NULL DEFAULT 0
);
CREATE UNIQUE INDEX IF NOT EXISTS ux_topics_name ON topics(name);
ALTER TABLE topics ADD COLUMN IF NOT EXISTS part text;
ALTER TABLE topics ADD COLUMN IF NOT EXISTS sort_order int NOT NULL DEFAULT 0;

CREATE TABLE IF NOT EXISTS task_types (
  id        serial PRIMARY KEY,
  topic_id  int REFERENCES topics(id) ON DELETE CASCADE,
  name      text NOT NULL
);

CREATE TABLE IF NOT EXISTS exam_questions (
  id           serial PRIMARY KEY,
  year         smallint,
  exam         text NOT NULL,
  question_no  int NOT NULL,
  topic_id     int REFERENCES topics(id),
  note         text
);

CREATE TABLE IF NOT EXISTS exam_question_refs (
  id                serial PRIMARY KEY,
  exam_question_id  int NOT NULL REFERENCES exam_questions(id) ON DELETE CASCADE,
  book_year         smallint NOT NULL,
  part              text CHECK (part IN ('I','II')),
  page              int,
  task_nos          text,
  match_level       text CHECK (match_level IN ('identical','very_close','similar','weak','not_found','unchecked'))
);

CREATE TABLE IF NOT EXISTS tasks (
  id            uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  topic_id      int NOT NULL REFERENCES topics(id),
  task_type_id  int REFERENCES task_types(id),
  origin        text NOT NULL DEFAULT 'original',
  body_md       text,
  book_year     smallint,
  book_part     text,
  book_page     int,
  book_task_no  int,
  status        text NOT NULL DEFAULT 'draft',
  created_at    timestamptz NOT NULL DEFAULT now(),
  updated_at    timestamptz NOT NULL DEFAULT now()
);

-- ---------- 2. Mövzular (27) ----------
INSERT INTO topics(name,part,sort_order) SELECT 'Natural ədədlər','I',1 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Natural ədədlər');
INSERT INTO topics(name,part,sort_order) SELECT 'Adi və onluq kəsrlər','I',2 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Adi və onluq kəsrlər');
INSERT INTO topics(name,part,sort_order) SELECT 'Faiz. Nisbət. Tənasüb','I',3 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Faiz. Nisbət. Tənasüb');
INSERT INTO topics(name,part,sort_order) SELECT 'Həqiqi ədədlər','I',4 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Həqiqi ədədlər');
INSERT INTO topics(name,part,sort_order) SELECT 'Tam cəbri ifadələr','I',5 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Tam cəbri ifadələr');
INSERT INTO topics(name,part,sort_order) SELECT 'Çoxhədlinin vuruqlara ayrılması','I',6 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Çoxhədlinin vuruqlara ayrılması');
INSERT INTO topics(name,part,sort_order) SELECT 'Rasional kəsrlər','I',7 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Rasional kəsrlər');
INSERT INTO topics(name,part,sort_order) SELECT 'Kvadrat köklər. Həqiqi üstlü qüvvət','I',8 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Kvadrat köklər. Həqiqi üstlü qüvvət');
INSERT INTO topics(name,part,sort_order) SELECT 'Birməchullu tənliklər və məsələlər','I',9 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Birməchullu tənliklər və məsələlər');
INSERT INTO topics(name,part,sort_order) SELECT 'Tənliklər sistemi','I',10 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Tənliklər sistemi');
INSERT INTO topics(name,part,sort_order) SELECT 'Bərabərsizliklər və sistemləri','I',11 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Bərabərsizliklər və sistemləri');
INSERT INTO topics(name,part,sort_order) SELECT 'Ədədi ardıcıllıqlar. Silsilələr','I',12 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Ədədi ardıcıllıqlar. Silsilələr');
INSERT INTO topics(name,part,sort_order) SELECT 'Çoxluqlar','I',13 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Çoxluqlar');
INSERT INTO topics(name,part,sort_order) SELECT 'Həndəsənin əsas anlayışları','I',14 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Həndəsənin əsas anlayışları');
INSERT INTO topics(name,part,sort_order) SELECT 'Üçbucaqlar','I',15 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Üçbucaqlar');
INSERT INTO topics(name,part,sort_order) SELECT 'Çoxbucaqlılar. Dördbucaqlılar','I',16 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Çoxbucaqlılar. Dördbucaqlılar');
INSERT INTO topics(name,part,sort_order) SELECT 'Çevrə və dairə','I',17 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Çevrə və dairə');
INSERT INTO topics(name,part,sort_order) SELECT 'İsbat məsələləri','I',18 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='İsbat məsələləri');
INSERT INTO topics(name,part,sort_order) SELECT 'Situasiya','I',19 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Situasiya');
INSERT INTO topics(name,part,sort_order) SELECT 'Funksiya və qrafiklər','II',20 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Funksiya və qrafiklər');
INSERT INTO topics(name,part,sort_order) SELECT 'Triqonometriya','II',21 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Triqonometriya');
INSERT INTO topics(name,part,sort_order) SELECT 'Loqarifm, üstlü tənlik/bərabərsizlik','II',22 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Loqarifm, üstlü tənlik/bərabərsizlik');
INSERT INTO topics(name,part,sort_order) SELECT 'Limit, törəmə, inteqral','II',23 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Limit, törəmə, inteqral');
INSERT INTO topics(name,part,sort_order) SELECT 'Kombinatorika və ehtimal','II',24 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Kombinatorika və ehtimal');
INSERT INTO topics(name,part,sort_order) SELECT 'Kompleks ədədlər','II',25 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Kompleks ədədlər');
INSERT INTO topics(name,part,sort_order) SELECT 'Koordinat və vektorlar','II',26 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Koordinat və vektorlar');
INSERT INTO topics(name,part,sort_order) SELECT 'Stereometriya','II',27 WHERE NOT EXISTS (SELECT 1 FROM topics WHERE name='Stereometriya');

-- ---------- 2b. Kitablar, alt mövzular, teqlər (005) ----------
CREATE TABLE IF NOT EXISTS books (
  id     serial PRIMARY KEY,
  year   smallint NOT NULL,
  part   text NOT NULL CHECK (part IN ('I','II')),
  title  text NOT NULL,
  UNIQUE (year, part)
);
INSERT INTO books(year,part,title) VALUES (2025,'I','2025 Test toplusu, I hissə'),(2025,'II','2025 Test toplusu, II hissə'),(2023,'I','2023 Test toplusu, I hissə'),(2023,'II','2023 Test toplusu, II hissə') ON CONFLICT DO NOTHING;

-- Alt mövzu = kitabın bölməsi (mündəricat başlığı). start_page kitabın öz səhifə nömrəsidir.
CREATE TABLE IF NOT EXISTS subtopics (
  id             serial PRIMARY KEY,
  topic_id       int NOT NULL REFERENCES topics(id) ON DELETE CASCADE,
  book_id        int REFERENCES books(id),
  title          text NOT NULL,
  start_page     int,
  page_verified  boolean NOT NULL DEFAULT false,
  sort_order     int NOT NULL DEFAULT 0,
  UNIQUE (topic_id, title)
);
CREATE INDEX IF NOT EXISTS idx_subtopics_book_page ON subtopics(book_id, start_page);

ALTER TABLE task_types      ADD COLUMN IF NOT EXISTS subtopic_id int REFERENCES subtopics(id);
ALTER TABLE exam_questions  ADD COLUMN IF NOT EXISTS subtopic_id int REFERENCES subtopics(id);
ALTER TABLE tasks           ADD COLUMN IF NOT EXISTS subtopic_id int REFERENCES subtopics(id);
ALTER TABLE tasks           ADD COLUMN IF NOT EXISTS code text UNIQUE;           -- oxunaqlı id, məs. HQ-MOD-0001
ALTER TABLE tasks           ADD COLUMN IF NOT EXISTS language text NOT NULL DEFAULT 'az';
ALTER TABLE tasks           ADD COLUMN IF NOT EXISTS rights_status text NOT NULL DEFAULT 'own'
  CHECK (rights_status IN ('own','licensed','reference_only'));
ALTER TABLE tasks           ADD COLUMN IF NOT EXISTS rights_note text;           -- icazənin mənbəyi (məs. sənəd, tarix)
CREATE INDEX IF NOT EXISTS idx_tasks_subtopic ON tasks(subtopic_id, status);


-- Teqlər (ixtiyari): "modul", "parametr", "şəkilli" və s.
CREATE TABLE IF NOT EXISTS tags (id serial PRIMARY KEY, slug text NOT NULL UNIQUE, name text NOT NULL);
CREATE TABLE IF NOT EXISTS task_tags (
  task_id uuid NOT NULL REFERENCES tasks(id) ON DELETE CASCADE,
  tag_id  int  NOT NULL REFERENCES tags(id)  ON DELETE CASCADE,
  PRIMARY KEY (task_id, tag_id)
);

-- Kitab səhifəsindən alt mövzunu tapır: həmin kitabda start_page <= səhifə olan ən son bölmə
CREATE OR REPLACE FUNCTION subtopic_for_page(p_year smallint, p_part text, p_page int) RETURNS int AS $$
  SELECT s.id FROM subtopics s JOIN books b ON b.id = s.book_id
  WHERE b.year = p_year AND b.part = p_part AND s.start_page <= p_page
  ORDER BY s.start_page DESC, s.sort_order DESC LIMIT 1;
$$ LANGUAGE sql STABLE;

-- Alt mövzu seed (2025 toplu). page_verified=false: başlıq skan mətnindən tapılıb, ±1–2 səhifə fərq ola bilər.
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Natural ədədlər. Natural ədədlərin onluq say sistemində yazılışı',4,true,1 FROM topics t, books b WHERE t.name='Natural ədədlər' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Natural ədədlərin toplanması, çıxılması, vurulması və bölünməsi',5,true,2 FROM topics t, books b WHERE t.name='Natural ədədlər' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Natural ədədlərin bölünmə əlamətləri. Qalıqlı bölmə',6,true,3 FROM topics t, books b WHERE t.name='Natural ədədlər' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Natural ədədlərin sadə vuruqlara ayrılışı. ƏBOB. ƏKOB',7,true,4 FROM topics t, books b WHERE t.name='Natural ədədlər' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Adi və onluq kəsrlər. Toplanması, çıxılması, vurulması və bölünməsi',13,true,5 FROM topics t, books b WHERE t.name='Adi və onluq kəsrlər' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Düzgün və düzgün olmayan kəsrlər. Sonsuz dövri onluq kəsrlər. Adi kəsrin onluq kəsrə, onluq kəsrin adi kəsrə çevrilməsi',14,true,6 FROM topics t, books b WHERE t.name='Adi və onluq kəsrlər' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Kəsrlərin müqayisəsi',16,true,7 FROM topics t, books b WHERE t.name='Adi və onluq kəsrlər' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Ədədin hissəsinin və hissəsinə görə ədədin tapılması',17,true,8 FROM topics t, books b WHERE t.name='Adi və onluq kəsrlər' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Nisbət. Tənasüb. Tənasübün xassələri. Düz və tərs mütənasiblik',20,true,9 FROM topics t, books b WHERE t.name='Faiz. Nisbət. Tənasüb' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Faiz. Ədədin faizinin tapılması',22,true,10 FROM topics t, books b WHERE t.name='Faiz. Nisbət. Tənasüb' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Faizinə görə ədədin tapılması. İki ədədin faiz nisbəti',22,true,11 FROM topics t, books b WHERE t.name='Faiz. Nisbət. Tənasüb' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Faizə aid məsələlər',25,true,12 FROM topics t, books b WHERE t.name='Faiz. Nisbət. Tənasüb' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Rasional ədədlər. Rasional ədədlər üzərində əməllər',31,true,13 FROM topics t, books b WHERE t.name='Həqiqi ədədlər' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'İrrasional ədədlər',31,true,14 FROM topics t, books b WHERE t.name='Həqiqi ədədlər' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Ədədin modulu. Modul daxil olan ifadələrin çevrilməsi',32,true,15 FROM topics t, books b WHERE t.name='Həqiqi ədədlər' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Ədədi orta. Həqiqi ədədlərin müqayisəsi',33,true,16 FROM topics t, books b WHERE t.name='Həqiqi ədədlər' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Ədədin tam və kəsr hissəsi. Ədədin standart şəkli',35,true,17 FROM topics t, books b WHERE t.name='Həqiqi ədədlər' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Birhədli və onun standart şəkli. Natural üstlü qüvvət',36,true,18 FROM topics t, books b WHERE t.name='Tam cəbri ifadələr' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Çoxhədlilər və onlar üzərində əməllər',36,true,19 FROM topics t, books b WHERE t.name='Tam cəbri ifadələr' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Müxtəsər vurma düsturları',38,true,20 FROM topics t, books b WHERE t.name='Tam cəbri ifadələr' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'İfadələrin ədədi qiymətlərinin hesablanması',39,true,21 FROM topics t, books b WHERE t.name='Tam cəbri ifadələr' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'İfadələrin ən kiçik və ən böyük qiymətlərinin tapılması',40,true,22 FROM topics t, books b WHERE t.name='Tam cəbri ifadələr' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Müxtəsər vurma düsturlarının köməyi ilə vuruqlara ayırma',41,true,23 FROM topics t, books b WHERE t.name='Çoxhədlinin vuruqlara ayrılması' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Müxtəlif üsulların köməyi ilə vuruqlara ayırma',41,true,24 FROM topics t, books b WHERE t.name='Çoxhədlinin vuruqlara ayrılması' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Vuruqlara ayırma üsulu ilə ifadələrin ədədi qiymətinin hesablanması',45,true,25 FROM topics t, books b WHERE t.name='Çoxhədlinin vuruqlara ayrılması' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Kəsrlərin ixtisarı. DMQ çoxluğu',47,true,26 FROM topics t, books b WHERE t.name='Rasional kəsrlər' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'İfadələrin sadələşdirilməsi',49,true,27 FROM topics t, books b WHERE t.name='Rasional kəsrlər' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'İfadələrin ədədi qiymətlərinin tapılması',52,true,28 FROM topics t, books b WHERE t.name='Rasional kəsrlər' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Hesabi kvadrat kök və onun xassələri',55,true,29 FROM topics t, books b WHERE t.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'n-ci dərəcədən kök. Həqiqi üstlü qüvvət və onun xassələri. Ədədlərin müqayisəsi',58,true,30 FROM topics t, books b WHERE t.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Kəsrlərin ixtisarı. İfadələrin sadələşdirilməsi və ədədi qiymətinin tapılması',62,true,31 FROM topics t, books b WHERE t.name='Kvadrat köklər. Həqiqi üstlü qüvvət' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Xətti tənliklər',68,true,32 FROM topics t, books b WHERE t.name='Birməchullu tənliklər və məsələlər' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Kvadrat tənliklər və onların araşdırılması',69,true,33 FROM topics t, books b WHERE t.name='Birməchullu tənliklər və məsələlər' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Viyet teoremi və onun tərsi olan teorem',71,true,34 FROM topics t, books b WHERE t.name='Birməchullu tənliklər və məsələlər' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Rasional tənliklər',75,true,35 FROM topics t, books b WHERE t.name='Birməchullu tənliklər və məsələlər' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Modul işarəsi daxilində dəyişəni olan tənliklər. İrrasional tənliklər',76,true,36 FROM topics t, books b WHERE t.name='Birməchullu tənliklər və məsələlər' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Tənlik qurmaqla məsələlər həlli',81,true,37 FROM topics t, books b WHERE t.name='Birməchullu tənliklər və məsələlər' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Xətti tənliklər sistemi',86,true,38 FROM topics t, books b WHERE t.name='Tənliklər sistemi' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Xətti tənliklər sisteminin həllinin araşdırılması',88,true,39 FROM topics t, books b WHERE t.name='Tənliklər sistemi' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Biri birdərəcəli, digəri ikidərəcəli və daha yüksək dərəcəli olan tənliklər sistemi',90,true,40 FROM topics t, books b WHERE t.name='Tənliklər sistemi' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Hər iki tənliyi ikidərəcəli və daha yüksək dərəcəli olan tənliklər sistemi',93,true,41 FROM topics t, books b WHERE t.name='Tənliklər sistemi' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Tənliklər sistemi qurmaqla məsələlər həlli',94,true,42 FROM topics t, books b WHERE t.name='Tənliklər sistemi' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Ədədi bərabərsizliklər və onların əsas xassələri',97,true,43 FROM topics t, books b WHERE t.name='Bərabərsizliklər və sistemləri' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Birdəyişənli xətti bərabərsizliklər. Birdəyişənli xətti bərabərsizliklər sistemi. Bərabərsizliklər heyəti',98,true,44 FROM topics t, books b WHERE t.name='Bərabərsizliklər və sistemləri' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'İkidərəcəli və yüksək dərəcəli bərabərsizliklər',101,true,45 FROM topics t, books b WHERE t.name='Bərabərsizliklər və sistemləri' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Rasional bərabərsizliklər',105,true,46 FROM topics t, books b WHERE t.name='Bərabərsizliklər və sistemləri' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Modul işarəsi daxilində dəyişəni olan bərabərsizliklər',108,true,47 FROM topics t, books b WHERE t.name='Bərabərsizliklər və sistemləri' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Kvadrat bərabərsizliklər sistemi. İrrasional bərabərsizliklər',110,true,48 FROM topics t, books b WHERE t.name='Bərabərsizliklər və sistemləri' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Ədədi ardıcıllıqlar',113,true,49 FROM topics t, books b WHERE t.name='Ədədi ardıcıllıqlar. Silsilələr' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Ədədi silsilələr',115,true,50 FROM topics t, books b WHERE t.name='Ədədi ardıcıllıqlar. Silsilələr' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Həndəsi silsilələr. Sonsuz həndəsi silsilənin cəmi (|q|<1)',121,true,51 FROM topics t, books b WHERE t.name='Ədədi ardıcıllıqlar. Silsilələr' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Ədədi və həndəsi silsilələrə aid məsələlər',125,true,52 FROM topics t, books b WHERE t.name='Ədədi ardıcıllıqlar. Silsilələr' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Çoxluqlar. Çoxluqların birləşməsi, kəsişməsi, fərqi',129,true,53 FROM topics t, books b WHERE t.name='Çoxluqlar' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Çoxluqların birləşməsi, kəsişməsi və fərqinin elementlərinin sayı',131,true,54 FROM topics t, books b WHERE t.name='Çoxluqlar' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Düz xətt, şüa, parça. Parçaların ölçülməsi',135,true,55 FROM topics t, books b WHERE t.name='Həndəsənin əsas anlayışları' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Bucaq. Bucaqların ölçülməsi. Bucağın tənböləni',137,true,56 FROM topics t, books b WHERE t.name='Həndəsənin əsas anlayışları' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Qonşu və qarşılıqlı bucaqlar',138,true,57 FROM topics t, books b WHERE t.name='Həndəsənin əsas anlayışları' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'İki paralel düz xəttin üçüncü ilə kəsişməsindən alınan bucaqlar',138,true,58 FROM topics t, books b WHERE t.name='Həndəsənin əsas anlayışları' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Uyğun tərəfləri paralel və perpendikulyar olan bucaqlar',143,true,59 FROM topics t, books b WHERE t.name='Həndəsənin əsas anlayışları' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Üçbucaq. Üçbucaq bərabərsizliyi. Üçbucağın perimetri',144,true,60 FROM topics t, books b WHERE t.name='Üçbucaqlar' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Üçbucağın medianı, tənböləni, hündürlüyü. Medianların və tənbölənlərin xassəsi',145,true,61 FROM topics t, books b WHERE t.name='Üçbucaqlar' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Üçbucağın daxili bucaqlarının cəmi. Üçbucağın xarici bucağının xassəsi',147,true,62 FROM topics t, books b WHERE t.name='Üçbucaqlar' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Üçbucaqların konqruyentlik əlaməti. Fales teoremi. Üçbucağın orta xətti',150,true,63 FROM topics t, books b WHERE t.name='Üçbucaqlar' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Bərabəryanlı üçbucaqlar. Bərabərtərəfli üçbucaqlar',150,true,64 FROM topics t, books b WHERE t.name='Üçbucaqlar' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Düzbucaqlı üçbucaq. Pifaqor teoremi. Düzbucaqlı üçbucağın tərəfləri və bucaqları arasındakı münasibətlər',153,true,65 FROM topics t, books b WHERE t.name='Üçbucaqlar' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Sinuslar teoremi. Kosinuslar teoremi',160,true,66 FROM topics t, books b WHERE t.name='Üçbucaqlar' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Qabarıq çoxbucaqlı. Qabarıq çoxbucaqlının daxili və xarici bucaqlarının cəmi. Düzgün çoxbucaqlı',162,true,67 FROM topics t, books b WHERE t.name='Çoxbucaqlılar. Dördbucaqlılar' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Paraleloqram, onun xassələri və əlamətləri',164,true,68 FROM topics t, books b WHERE t.name='Çoxbucaqlılar. Dördbucaqlılar' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Düzbucaqlı, kvadrat, romb və onların xassələri',166,true,69 FROM topics t, books b WHERE t.name='Çoxbucaqlılar. Dördbucaqlılar' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Trapesiya və onun orta xətti',169,true,70 FROM topics t, books b WHERE t.name='Çoxbucaqlılar. Dördbucaqlılar' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Çevrə. Dairə. Radius, diametr, vətər. Çevrənin və çevrə qövsünün uzunluğu. Çevrələrin qarşılıqlı vəziyyəti',173,true,71 FROM topics t, books b WHERE t.name='Çevrə və dairə' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Mərkəzi bucaq. Daxilə çəkilmiş bucaq. Toxunanla vətər arasındakı bucaq',175,true,72 FROM topics t, books b WHERE t.name='Çevrə və dairə' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Çevrədə mütənasib parçalar. Toxunan və kəsənin xassələri',182,true,73 FROM topics t, books b WHERE t.name='Çevrə və dairə' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Çevrənin daxilinə və xaricinə çəkilmiş üçbucaqlar',186,true,74 FROM topics t, books b WHERE t.name='Çevrə və dairə' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Çevrənin daxilinə və xaricinə çəkilmiş çoxbucaqlılar',190,true,75 FROM topics t, books b WHERE t.name='Çevrə və dairə' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'İsbat məsələləri',194,true,76 FROM topics t, books b WHERE t.name='İsbat məsələləri' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Situasiya',197,true,77 FROM topics t, books b WHERE t.name='Situasiya' AND b.year=2025 AND b.part='I' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'y=kx+b, y=k/x funksiyaları, onların qrafikləri və qrafiklərinin çevrilmələri',4,true,78 FROM topics t, books b WHERE t.name='Funksiya və qrafiklər' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'y=x², y=xⁿ (n>2) funksiyaları, kvadratik funksiya, onların qrafikləri və qrafiklərinin çevrilmələri',6,true,79 FROM topics t, books b WHERE t.name='Funksiya və qrafiklər' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Tək və cüt funksiyalar. Artan və azalan funksiyalar. Dövri funksiya',12,false,80 FROM topics t, books b WHERE t.name='Funksiya və qrafiklər' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Mürəkkəb funksiyalar. Tərs funksiya. Bəzi funksiyaların təyin oblastı və qiymətlər çoxluğu',16,false,81 FROM topics t, books b WHERE t.name='Funksiya və qrafiklər' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Funksiyaların qrafiklərinin qarşılıqlı vəziyyəti',24,false,82 FROM topics t, books b WHERE t.name='Funksiya və qrafiklər' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Bucağın radian və dərəcə ölçüsü. İstənilən bucağın triqonometrik funksiyaları',26,false,83 FROM topics t, books b WHERE t.name='Triqonometriya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Əsas triqonometrik eyniliklər',29,false,84 FROM topics t, books b WHERE t.name='Triqonometriya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'y=sinx və y=cosx funksiyaları və onların xassələri',32,true,85 FROM topics t, books b WHERE t.name='Triqonometriya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Çevirmə düsturları',40,true,86 FROM topics t, books b WHERE t.name='Triqonometriya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Triqonometrik funksiyaların ən böyük və ən kiçik qiymətləri',45,true,87 FROM topics t, books b WHERE t.name='Triqonometriya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Tərs triqonometrik funksiyalar',46,true,88 FROM topics t, books b WHERE t.name='Triqonometriya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'İki bucağın cəminin və fərqinin triqonometrik funksiyaları',49,false,89 FROM topics t, books b WHERE t.name='Triqonometriya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'İkiqat və yarım arqumentin triqonometrik funksiyaları',52,false,90 FROM topics t, books b WHERE t.name='Triqonometriya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Triqonometrik funksiyaların cəminin və fərqinin hasilə çevrilməsi. Hasili cəmə çevirmə düsturları',60,true,91 FROM topics t, books b WHERE t.name='Triqonometriya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Sadə triqonometrik tənliklər',64,false,92 FROM topics t, books b WHERE t.name='Triqonometriya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Triqonometrik tənliklərin müxtəlif üsullarla həlli',73,true,93 FROM topics t, books b WHERE t.name='Triqonometriya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Üstlü funksiya və onun xassələri',83,true,94 FROM topics t, books b WHERE t.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Ədədin loqarifmi. Loqarifmin xassələri',86,true,95 FROM topics t, books b WHERE t.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Loqarifmik funksiya və onun xassələri',97,false,96 FROM topics t, books b WHERE t.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Üstlü və loqarifmik tənliklər',102,false,97 FROM topics t, books b WHERE t.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Üstlü və loqarifmik bərabərsizliklər',112,true,98 FROM topics t, books b WHERE t.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Üstlü və loqarifmik tənliklər sistemi',119,true,99 FROM topics t, books b WHERE t.name='Loqarifm, üstlü tənlik/bərabərsizlik' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Ədədi ardıcıllığın limiti. Funksiyanın limiti',121,true,100 FROM topics t, books b WHERE t.name='Limit, törəmə, inteqral' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Funksiyanın törəməsi',131,true,101 FROM topics t, books b WHERE t.name='Limit, törəmə, inteqral' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Törəmənin həndəsi mənası. Toxunanın tənliyi',137,true,102 FROM topics t, books b WHERE t.name='Limit, törəmə, inteqral' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Funksiyanın böhran nöqtəsi. Artma və azalma aralıqları, ekstremum nöqtələri, ən böyük və ən kiçik qiymətlər',142,true,103 FROM topics t, books b WHERE t.name='Limit, törəmə, inteqral' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'İbtidai funksiya. Qeyri-müəyyən inteqral',148,false,104 FROM topics t, books b WHERE t.name='Limit, törəmə, inteqral' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Müəyyən inteqral. Nyuton-Leybnis düsturu',154,false,105 FROM topics t, books b WHERE t.name='Limit, törəmə, inteqral' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Əyrilərlə hüdudlanmış fiqurun sahəsi',161,true,106 FROM topics t, books b WHERE t.name='Limit, törəmə, inteqral' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Kompleks ədədlər',165,true,107 FROM topics t, books b WHERE t.name='Kompleks ədədlər' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Birləşmələr nəzəriyyəsi',170,false,108 FROM topics t, books b WHERE t.name='Kombinatorika və ehtimal' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Ehtimal nəzəriyyəsi və statistika',178,true,109 FROM topics t, books b WHERE t.name='Kombinatorika və ehtimal' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Kvadratın və düzbucaqlının sahəsi (Çoxbucaqlılar)',196,false,110 FROM topics t, books b WHERE t.name='Çoxbucaqlılar. Dördbucaqlılar' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Üçbucağın sahəsi (Üçbucaqlar)',198,false,111 FROM topics t, books b WHERE t.name='Çoxbucaqlılar. Dördbucaqlılar' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Paraleloqramın və rombun sahəsi (Çoxbucaqlılar)',206,false,112 FROM topics t, books b WHERE t.name='Çoxbucaqlılar. Dördbucaqlılar' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Trapesiyanın sahəsi (Çoxbucaqlılar)',210,false,113 FROM topics t, books b WHERE t.name='Çoxbucaqlılar. Dördbucaqlılar' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Dairənin və dairə hissələrinin sahəsi (Çevrə və dairə)',213,true,114 FROM topics t, books b WHERE t.name='Çoxbucaqlılar. Dördbucaqlılar' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Bəzi çoxbucaqlıların sahəsi (Çoxbucaqlılar)',214,true,115 FROM topics t, books b WHERE t.name='Çoxbucaqlılar. Dördbucaqlılar' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Simmetriya çevrilmələri. Paralel köçürmə (Həndəsənin əsas anlayışları)',220,true,116 FROM topics t, books b WHERE t.name='Həndəsənin əsas anlayışları' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Homotetiya. Oxşarlıq çevrilməsi. Oxşar fiqurlar (Üçbucaqlar)',225,true,117 FROM topics t, books b WHERE t.name='Həndəsənin əsas anlayışları' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Nöqtənin koordinatları. İki nöqtə arasındakı məsafə',236,true,118 FROM topics t, books b WHERE t.name='Koordinat və vektorlar' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Düz xəttin tənliyi və düz xətlərin qarşılıqlı vəziyyəti',238,true,119 FROM topics t, books b WHERE t.name='Koordinat və vektorlar' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Çevrənin tənliyi',241,true,120 FROM topics t, books b WHERE t.name='Koordinat və vektorlar' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Vektorun koordinatları, uzunluğu, cəmi, fərqi və ədədə vurulması',245,false,121 FROM topics t, books b WHERE t.name='Koordinat və vektorlar' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Vektorların skalyar hasili. İki vektor arasındakı bucaq. Vektorların perpendikulyarlığı. Kollinear vektorlar',250,true,122 FROM topics t, books b WHERE t.name='Koordinat və vektorlar' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Mail, perpendikulyar və proyeksiya',256,true,123 FROM topics t, books b WHERE t.name='Stereometriya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Düz xətt və müstəvinin qarşılıqlı vəziyyəti. Çarpaz düz xətlər',262,true,124 FROM topics t, books b WHERE t.name='Stereometriya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'İki müstəvinin qarşılıqlı vəziyyəti. İkiüzlü bucaqlar',267,true,125 FROM topics t, books b WHERE t.name='Stereometriya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Prizma və onun elementləri',273,true,126 FROM topics t, books b WHERE t.name='Stereometriya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Prizmanın səthinin sahəsi. Prizmanın müstəvi kəsikləri',276,true,127 FROM topics t, books b WHERE t.name='Stereometriya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Piramida və onun elementləri',278,true,128 FROM topics t, books b WHERE t.name='Stereometriya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Piramidanın səthinin sahəsi. Kəsik piramida',280,true,129 FROM topics t, books b WHERE t.name='Stereometriya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Prizmanın və piramidanın həcmi. Kəsik piramidanın həcmi',283,true,130 FROM topics t, books b WHERE t.name='Stereometriya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Silindr və onun müstəvi kəsikləri. Silindrin səthinin sahəsi və həcmi',293,true,131 FROM topics t, books b WHERE t.name='Stereometriya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Konus və onun müstəvi kəsikləri. Konusun və kəsik konusun səthinin sahəsi və həcmi',298,true,132 FROM topics t, books b WHERE t.name='Stereometriya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Kürə və onun həcmi. Sfera və onun səthinin sahəsi',304,true,133 FROM topics t, books b WHERE t.name='Stereometriya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Fırlanma cisimlərinin kombinasiyaları',306,true,134 FROM topics t, books b WHERE t.name='Stereometriya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'Situasiya',310,false,135 FROM topics t, books b WHERE t.name='Situasiya' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;
INSERT INTO subtopics(topic_id,book_id,title,start_page,page_verified,sort_order) SELECT t.id,b.id,'İsbat məsələləri',320,false,136 FROM topics t, books b WHERE t.name='İsbat məsələləri' AND b.year=2025 AND b.part='II' ON CONFLICT (topic_id,title) DO NOTHING;

-- Mövcud imtahan suallarını 2025 istinadından alt mövzuya bağla (ilk 2025 istinadının səhifəsi ilə)
UPDATE exam_questions eq SET subtopic_id = subtopic_for_page(2025::smallint, COALESCE(r.part,'I'), r.page)
FROM exam_question_refs r
WHERE r.exam_question_id = eq.id AND r.book_year = 2025 AND r.page IS NOT NULL AND r.match_level IN ('identical','very_close','similar');

-- ---------- 3. Sual bankı üçün əlavə sahələr (v2) ----------
-- format: closed = qapalı (A–E), matching = uyğunluq, open = kodlaşdırılan/açıq cavab, written = ətraflı yazılı
ALTER TABLE tasks ADD COLUMN IF NOT EXISTS format          text;
ALTER TABLE tasks ADD COLUMN IF NOT EXISTS options         jsonb;   -- closed: [{"key":"A","text":"..."},...]; matching: {"left":[{"key":"1","text":"..."}],"right":[{"key":"a","text":"..."}]}
ALTER TABLE tasks ADD COLUMN IF NOT EXISTS correct_option  text;    -- closed: 'A'..'E'
ALTER TABLE tasks ADD COLUMN IF NOT EXISTS matching_answer jsonb;   -- matching: {"1":["b"],"2":["a","c"],"3":["d"]}
ALTER TABLE tasks ADD COLUMN IF NOT EXISTS answer_value    text;    -- open/written: yekun cavab (onluq kəsr vergüllə: '1,8')
ALTER TABLE tasks ADD COLUMN IF NOT EXISTS solution_md     text;    -- həll (Markdown + LaTeX $...$)
ALTER TABLE tasks ADD COLUMN IF NOT EXISTS image_url       text;    -- şəkil/diaqram (varsa)
ALTER TABLE tasks ADD COLUMN IF NOT EXISTS image_alt       text;
ALTER TABLE tasks ADD COLUMN IF NOT EXISTS difficulty      smallint;
-- Orijinal sualın hansı toplu tapşırığı əsasında qurulduğu (yalnız istinad, mətn yox)
ALTER TABLE tasks ADD COLUMN IF NOT EXISTS based_on_year    smallint;
ALTER TABLE tasks ADD COLUMN IF NOT EXISTS based_on_part    text;
ALTER TABLE tasks ADD COLUMN IF NOT EXISTS based_on_page    int;
ALTER TABLE tasks ADD COLUMN IF NOT EXISTS based_on_task_no int;
ALTER TABLE tasks ADD COLUMN IF NOT EXISTS author          text NOT NULL DEFAULT 'Cəfərli Elvin müəllim';
ALTER TABLE tasks ADD COLUMN IF NOT EXISTS ownership_note  text NOT NULL DEFAULT 'Bu material Cəfərli Elvin müəllimə məxsusdur';
ALTER TABLE tasks ADD COLUMN IF NOT EXISTS created_at      timestamptz NOT NULL DEFAULT now();
ALTER TABLE tasks ADD COLUMN IF NOT EXISTS updated_at      timestamptz NOT NULL DEFAULT now();

ALTER TABLE tasks DROP CONSTRAINT IF EXISTS tasks_origin_check;
ALTER TABLE tasks ADD  CONSTRAINT tasks_origin_check CHECK (origin IN ('original','book_reference'));
ALTER TABLE tasks DROP CONSTRAINT IF EXISTS tasks_status_check;
ALTER TABLE tasks ADD  CONSTRAINT tasks_status_check CHECK (status IN ('draft','review','published','archived'));
ALTER TABLE tasks DROP CONSTRAINT IF EXISTS tasks_format_check;
ALTER TABLE tasks ADD  CONSTRAINT tasks_format_check CHECK (format IS NULL OR format IN ('closed','matching','open','written'));
ALTER TABLE tasks DROP CONSTRAINT IF EXISTS tasks_difficulty_check;
ALTER TABLE tasks ADD  CONSTRAINT tasks_difficulty_check CHECK (difficulty IS NULL OR difficulty BETWEEN 1 AND 3);
ALTER TABLE tasks DROP CONSTRAINT IF EXISTS tasks_part_check;
ALTER TABLE tasks ADD  CONSTRAINT tasks_part_check CHECK ((book_part IS NULL OR book_part IN ('I','II')) AND (based_on_part IS NULL OR based_on_part IN ('I','II')));

-- origin/mətn qaydası (005-in yeni versiyası): öz sual = mətn + həll məcburi, rights=own;
-- kitab istinadı = mətn yalnız rights=licensed olduqda
ALTER TABLE tasks DROP CONSTRAINT IF EXISTS tasks_origin_fields;
ALTER TABLE tasks ADD CONSTRAINT tasks_origin_fields CHECK (
  (origin = 'original' AND body_md IS NOT NULL AND solution_md IS NOT NULL AND format IS NOT NULL AND rights_status = 'own')
  OR
  (origin = 'book_reference'
     AND book_year IS NOT NULL AND book_part IS NOT NULL AND book_page IS NOT NULL AND book_task_no IS NOT NULL
     AND (body_md IS NULL OR rights_status = 'licensed'))
);

-- Cavab qaydası: düzgün cavab mütləq saxlanılır və variantların içində olur
ALTER TABLE tasks DROP CONSTRAINT IF EXISTS tasks_answer_fields;
ALTER TABLE tasks ADD CONSTRAINT tasks_answer_fields CHECK (
  format IS NULL
  OR (format = 'closed'
      AND jsonb_typeof(options) = 'array' AND jsonb_array_length(options) = 5
      AND correct_option IN ('A','B','C','D','E')
      AND jsonb_path_exists(options, '$[*] ? (@.key == $k)', jsonb_build_object('k', correct_option)))
  OR (format = 'matching'
      AND jsonb_typeof(options) = 'object' AND jsonb_typeof(options->'left') = 'array' AND jsonb_typeof(options->'right') = 'array'
      AND jsonb_typeof(matching_answer) = 'object')
  OR (format IN ('open','written') AND answer_value IS NOT NULL AND btrim(answer_value) <> '')
);

CREATE INDEX IF NOT EXISTS idx_tasks_topic ON tasks(topic_id, status);

CREATE OR REPLACE FUNCTION tasks_touch_updated_at() RETURNS trigger AS $$
BEGIN NEW.updated_at := now(); RETURN NEW; END;
$$ LANGUAGE plpgsql;
DROP TRIGGER IF EXISTS trg_tasks_updated_at ON tasks;
CREATE TRIGGER trg_tasks_updated_at BEFORE UPDATE ON tasks FOR EACH ROW EXECUTE FUNCTION tasks_touch_updated_at();

COMMIT;
