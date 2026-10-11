CREATE TABLE `teacher_accounts` (
	`user_id` text PRIMARY KEY NOT NULL,
	`balance` real DEFAULT 0 NOT NULL,
	`daily_limit` integer DEFAULT 10 NOT NULL,
	`created_at` integer NOT NULL,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `teacher_applications` (
	`user_id` text PRIMARY KEY NOT NULL,
	`school` text NOT NULL,
	`note` text,
	`status` text DEFAULT 'pending' NOT NULL,
	`admin_note` text,
	`created_at` integer NOT NULL,
	`decided_at` integer,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `teacher_balance_tx` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`teacher_id` text NOT NULL,
	`amount` real NOT NULL,
	`kind` text NOT NULL,
	`test_id` text,
	`note` text,
	`created_at` integer NOT NULL,
	FOREIGN KEY (`teacher_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE INDEX `teacher_balance_tx_idx` ON `teacher_balance_tx` (`teacher_id`,`created_at`);--> statement-breakpoint
CREATE TABLE `teacher_group_members` (
	`group_id` text NOT NULL,
	`user_id` text NOT NULL,
	`joined_at` integer NOT NULL,
	`left_at` integer,
	PRIMARY KEY(`group_id`, `user_id`),
	FOREIGN KEY (`group_id`) REFERENCES `teacher_groups`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE INDEX `teacher_group_members_user_idx` ON `teacher_group_members` (`user_id`);--> statement-breakpoint
CREATE TABLE `teacher_groups` (
	`id` text PRIMARY KEY NOT NULL,
	`teacher_id` text NOT NULL,
	`name` text NOT NULL,
	`exam_kind` text NOT NULL,
	`code` text NOT NULL,
	`created_at` integer NOT NULL,
	FOREIGN KEY (`teacher_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE UNIQUE INDEX `teacher_groups_code_uq` ON `teacher_groups` (`code`);--> statement-breakpoint
CREATE INDEX `teacher_groups_teacher_idx` ON `teacher_groups` (`teacher_id`);--> statement-breakpoint
CREATE TABLE `teacher_reports` (
	`id` text PRIMARY KEY NOT NULL,
	`teacher_id` text NOT NULL,
	`user_id` text NOT NULL,
	`month` text NOT NULL,
	`note` text,
	`data` text NOT NULL,
	`created_at` integer NOT NULL,
	`expires_at` integer NOT NULL,
	FOREIGN KEY (`teacher_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE INDEX `teacher_reports_teacher_idx` ON `teacher_reports` (`teacher_id`);--> statement-breakpoint
CREATE TABLE `teacher_test_answers` (
	`test_id` text NOT NULL,
	`user_id` text NOT NULL,
	`n` integer NOT NULL,
	`given` text,
	`score` real,
	`updated_at` integer NOT NULL,
	PRIMARY KEY(`test_id`, `user_id`, `n`),
	FOREIGN KEY (`test_id`) REFERENCES `teacher_tests`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `teacher_test_attempts` (
	`test_id` text NOT NULL,
	`user_id` text NOT NULL,
	`started_at` integer NOT NULL,
	`finished_at` integer,
	PRIMARY KEY(`test_id`, `user_id`),
	FOREIGN KEY (`test_id`) REFERENCES `teacher_tests`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `teacher_test_events` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`test_id` text NOT NULL,
	`user_id` text NOT NULL,
	`kind` text NOT NULL,
	`at` integer NOT NULL,
	FOREIGN KEY (`test_id`) REFERENCES `teacher_tests`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE INDEX `teacher_test_events_idx` ON `teacher_test_events` (`test_id`,`user_id`);--> statement-breakpoint
CREATE TABLE `teacher_test_items` (
	`test_id` text NOT NULL,
	`n` integer NOT NULL,
	`task_code` text NOT NULL,
	`format` text NOT NULL,
	PRIMARY KEY(`test_id`, `n`),
	FOREIGN KEY (`test_id`) REFERENCES `teacher_tests`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `teacher_test_variants` (
	`test_id` text NOT NULL,
	`user_id` text NOT NULL,
	`letter` text NOT NULL,
	`order` text NOT NULL,
	`maps` text NOT NULL,
	PRIMARY KEY(`test_id`, `user_id`),
	FOREIGN KEY (`test_id`) REFERENCES `teacher_tests`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `teacher_tests` (
	`id` text PRIMARY KEY NOT NULL,
	`teacher_id` text NOT NULL,
	`group_id` text NOT NULL,
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
	FOREIGN KEY (`teacher_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`group_id`) REFERENCES `teacher_groups`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE INDEX `teacher_tests_teacher_idx` ON `teacher_tests` (`teacher_id`,`created_at`);--> statement-breakpoint
CREATE INDEX `teacher_tests_group_idx` ON `teacher_tests` (`group_id`);--> statement-breakpoint
ALTER TABLE `exam_kinds` ADD `duration_min` integer DEFAULT 90 NOT NULL;--> statement-breakpoint
UPDATE `exam_kinds` SET `duration_min` = CASE `key` WHEN 'qebul-11' THEN 120 WHEN 'movzu' THEN 45 ELSE 90 END;
