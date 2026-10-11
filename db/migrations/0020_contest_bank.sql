ALTER TABLE `contest_templates` ADD `source` text DEFAULT 'formula' NOT NULL;--> statement-breakpoint
ALTER TABLE `contest_variants` ADD `task_code` text;--> statement-breakpoint
ALTER TABLE `contest_variants` ADD `image_url` text;--> statement-breakpoint
ALTER TABLE `contest_variants` ADD `image_alt` text;--> statement-breakpoint
ALTER TABLE `contest_variants` ADD `solution` text;--> statement-breakpoint
-- Açılış yarışının sualları sual bankından (mövzular eyni qalır; düstur sahələri saxlanılır).
UPDATE `contest_templates` SET `source` = 'bank' WHERE `contest_id` = 'acilis-2026' AND `topic_id` IS NOT NULL;
