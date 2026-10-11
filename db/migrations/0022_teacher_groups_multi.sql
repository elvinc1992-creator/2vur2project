-- Müəllim sınağı bir və ya bir neçə qrupa bağlanır (teacher_test_groups); qrupun imtahan növü yoxdur;
-- onlayn sınağın qiyməti sınaq başına (exam_kinds.teacher_price).
CREATE TABLE `teacher_test_groups` (
	`test_id` text NOT NULL,
	`group_id` text NOT NULL,
	PRIMARY KEY(`test_id`, `group_id`),
	FOREIGN KEY (`test_id`) REFERENCES `teacher_tests`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`group_id`) REFERENCES `teacher_groups`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE INDEX `teacher_test_groups_group_idx` ON `teacher_test_groups` (`group_id`);--> statement-breakpoint
INSERT INTO `teacher_test_groups` (`test_id`, `group_id`) SELECT `id`, `group_id` FROM `teacher_tests`;--> statement-breakpoint
PRAGMA foreign_keys=OFF;--> statement-breakpoint
CREATE TABLE `__new_teacher_tests` (
	`id` text PRIMARY KEY NOT NULL,
	`teacher_id` text NOT NULL,
	`number` integer NOT NULL,
	`exam_kind` text NOT NULL,
	`mode` text NOT NULL,
	`opens_at` integer NOT NULL,
	`duration_min` integer NOT NULL,
	`shuffle` integer DEFAULT true NOT NULL,
	`no_repeat` integer DEFAULT true NOT NULL,
	`reused` integer DEFAULT 0 NOT NULL,
	`charged` real DEFAULT 0 NOT NULL,
	`refunded_at` integer,
	`results_at` integer,
	`created_at` integer NOT NULL,
	FOREIGN KEY (`teacher_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
INSERT INTO `__new_teacher_tests` (`id`, `teacher_id`, `number`, `exam_kind`, `mode`, `opens_at`, `duration_min`, `shuffle`, `no_repeat`, `reused`, `charged`, `refunded_at`, `results_at`, `created_at`)
  SELECT `id`, `teacher_id`, `number`, `exam_kind`, `mode`, `opens_at`, `duration_min`, `shuffle`, `no_repeat`, `reused`, `charged`, `refunded_at`, `results_at`, `created_at` FROM `teacher_tests`;--> statement-breakpoint
DROP TABLE `teacher_tests`;--> statement-breakpoint
ALTER TABLE `__new_teacher_tests` RENAME TO `teacher_tests`;--> statement-breakpoint
PRAGMA foreign_keys=ON;--> statement-breakpoint
CREATE INDEX `teacher_tests_teacher_idx` ON `teacher_tests` (`teacher_id`,`created_at`);--> statement-breakpoint
ALTER TABLE `exam_kinds` ADD `teacher_price` real DEFAULT 0 NOT NULL;--> statement-breakpoint
UPDATE `exam_kinds` SET `teacher_price` = CASE `key` WHEN 'movzu' THEN 2 WHEN 'buraxilis-9' THEN 2 WHEN 'buraxilis-11' THEN 3 WHEN 'qebul-11' THEN 3 ELSE 0 END;--> statement-breakpoint
ALTER TABLE `teacher_groups` DROP COLUMN `exam_kind`;
