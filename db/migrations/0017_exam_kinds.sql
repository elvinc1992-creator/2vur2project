-- Sınaq tipləri (qiymət ilə) və statuslar: active (saytda görünür) / passive (görünmür) / finished (bitib).
CREATE TABLE `exam_kinds` (
	`key` text PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`price` real NOT NULL,
	`blueprint_key` text,
	`sort_order` integer DEFAULT 0 NOT NULL,
	FOREIGN KEY (`blueprint_key`) REFERENCES `exam_blueprints`(`key`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
-- Mövzu sınağının sabit quruluşu yoxdur (bölmələrin sayını admin seçir) — boş quruluş sətri.
INSERT OR IGNORE INTO `exam_blueprints` (`key`, `name`, `grade`, `kind`, `subject`, `total_questions`, `avg_points`, `sort_order`)
VALUES ('movzu', 'Mövzu sınağı', 11, 'buraxilis', 'Riyaziyyat', 0, 4, 99);
--> statement-breakpoint
INSERT OR IGNORE INTO `exam_kinds` (`key`, `name`, `price`, `blueprint_key`, `sort_order`) VALUES
  ('buraxilis-9', '9-cu sinif buraxılış', 3, 'buraxilis-9', 1),
  ('buraxilis-11', '11-ci sinif buraxılış', 3, 'buraxilis-11', 2),
  ('qebul-11', '11-ci sinif blok', 3, 'qebul-11', 3),
  ('movzu', 'Mövzu sınağı', 2, 'movzu', 4);
--> statement-breakpoint
ALTER TABLE `exams` ADD `kind` text REFERENCES exam_kinds(key);
--> statement-breakpoint
ALTER TABLE `exams` ADD `topic_id` integer REFERENCES topics(id);
--> statement-breakpoint
UPDATE `exams` SET `kind` = `blueprint_key` WHERE `kind` IS NULL;
--> statement-breakpoint
UPDATE `exams` SET `status` = CASE `status` WHEN 'published' THEN 'active' WHEN 'draft' THEN 'passive' ELSE `status` END;
