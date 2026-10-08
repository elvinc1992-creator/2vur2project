-- Mövzu üzrə "Sual tipi" bölgüsü (tip doldurulmuş sətirlər).
CREATE VIEW `topic_type_stats` AS
SELECT topic_id, type, COUNT(*) AS n
FROM `exam_questions_stats`
WHERE type IS NOT NULL
GROUP BY topic_id, type;
