-- Statistika səhifəsinin bütün rəqəmləri bu view-lardan gəlir.
-- "Tapılan" = EYNİ + Çox yaxın + Oxşar (Excel-in "Yekun" vərəqi ilə eyni qayda).

-- Mövzu × imtahan: süzgəclər (növ, qrup, il) bu səviyyədə tətbiq olunur.
CREATE VIEW `topic_exam_stats` AS
SELECT
  q.topic_id,
  q.exam_key,
  q.year,
  q.exam_kind,
  q.exam_group,
  COUNT(*) AS n,
  SUM(q.match_2023 IN ('EYNİ', 'Çox yaxın', 'Oxşar')) AS found_2023,
  SUM(q.match_2025 IN ('EYNİ', 'Çox yaxın', 'Oxşar')) AS found_2025,
  SUM(q.match_2023 IN ('EYNİ', 'Çox yaxın', 'Oxşar') AND q.match_2025 IN ('EYNİ', 'Çox yaxın', 'Oxşar')) AS found_both
FROM `exam_questions_stats` q
GROUP BY q.topic_id, q.exam_key, q.year, q.exam_kind, q.exam_group;
--> statement-breakpoint

-- Mövzu üzrə ümumi göstəricilər (süzgəcsiz).
CREATE VIEW `topic_stats` AS
SELECT
  t.id AS topic_id,
  t.slug,
  t.name,
  t.part,
  t.sort_order,
  COUNT(q.id) AS total,
  CAST(COUNT(q.id) AS REAL) / (SELECT COUNT(*) FROM `exam_questions_stats`) AS share,
  SUM(q.year = 2017) AS y2017,
  SUM(q.year = 2018) AS y2018,
  SUM(q.year = 2023) AS y2023,
  SUM(q.year = 2025) AS y2025,
  SUM(q.exam_kind = 'buraxilis') AS buraxilis,
  SUM(q.exam_kind = 'qebul') AS qebul,
  CAST(COUNT(q.id) AS REAL) / (SELECT COUNT(DISTINCT exam_key) FROM `exam_questions_stats`) AS avg_per_exam,
  SUM(q.match_2023 IN ('EYNİ', 'Çox yaxın', 'Oxşar')) AS found_2023,
  SUM(q.match_2025 IN ('EYNİ', 'Çox yaxın', 'Oxşar')) AS found_2025,
  SUM(q.match_2023 IN ('EYNİ', 'Çox yaxın', 'Oxşar') AND q.match_2025 IN ('EYNİ', 'Çox yaxın', 'Oxşar')) AS found_both
FROM `topics` t
LEFT JOIN `exam_questions_stats` q ON q.topic_id = t.id
GROUP BY t.id;
--> statement-breakpoint

-- İmtahan üzrə sual sayı və toplu uyğunluğu.
CREATE VIEW `exam_stats` AS
SELECT
  q.exam_key,
  MIN(q.year) AS year,
  q.exam_kind,
  q.exam_group,
  COUNT(*) AS questions,
  SUM(q.match_2023 IN ('EYNİ', 'Çox yaxın', 'Oxşar')) AS found_2023,
  SUM(q.match_2025 IN ('EYNİ', 'Çox yaxın', 'Oxşar')) AS found_2025,
  CAST(SUM(q.match_2023 IN ('EYNİ', 'Çox yaxın', 'Oxşar')) AS REAL) / COUNT(*) AS pct_2023,
  CAST(SUM(q.match_2025 IN ('EYNİ', 'Çox yaxın', 'Oxşar')) AS REAL) / COUNT(*) AS pct_2025
FROM `exam_questions_stats` q
GROUP BY q.exam_key;
--> statement-breakpoint

-- Uyğunluq dərəcələrinin bölgüsü (mövzu detalı üçün), süzgəc sahələri ilə.
CREATE VIEW `topic_match_stats` AS
SELECT topic_id, year, exam_kind, exam_group, '2023' AS toplu, COALESCE(match_2023, 'Yoxlanmayıb') AS match, COUNT(*) AS n
FROM `exam_questions_stats`
GROUP BY topic_id, year, exam_kind, exam_group, match_2023
UNION ALL
SELECT topic_id, year, exam_kind, exam_group, '2025' AS toplu, COALESCE(match_2025, 'Yoxlanmayıb') AS match, COUNT(*) AS n
FROM `exam_questions_stats`
GROUP BY topic_id, year, exam_kind, exam_group, match_2025;
