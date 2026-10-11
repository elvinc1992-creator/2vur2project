-- Müəllimin kağız sınağı ödənişlidir (sınaq başına, standart 2 AZN; admin dəyişir).
ALTER TABLE `exam_kinds` ADD `teacher_paper_price` real DEFAULT 2 NOT NULL;--> statement-breakpoint
-- 11-ci sinif blok: 30 sual — 22 qapalı (№1-22), 5 açıq kodlaşdırılan (№23-27), 3 yazılı (№28-30).
-- Əvvəl açıq bölmə 4 sual idi (№23-26) və №27 boş qalırdı (cəmi 29).
UPDATE `exam_blueprint_sections` SET `question_count` = 5, `last_no` = 27 WHERE `blueprint_key` = 'qebul-11' AND `format` = 'open';--> statement-breakpoint
-- 11-ci sinif buraxılışda "Limit, törəmə, inteqral" mövzusundan sual olmur (dim-movzular.md) — yalnız blok.
UPDATE `topics` SET `exam_types` = 'blok' WHERE `slug` = 'limit-toreme-inteqral';
