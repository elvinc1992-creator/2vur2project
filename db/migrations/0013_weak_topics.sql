CREATE TABLE `error_types` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`topic_id` integer NOT NULL,
	`name` text NOT NULL,
	`description` text DEFAULT '' NOT NULL,
	`created_at` integer NOT NULL,
	FOREIGN KEY (`topic_id`) REFERENCES `topics`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE UNIQUE INDEX `error_types_topic_name_uq` ON `error_types` (`topic_id`,`name`);--> statement-breakpoint
CREATE TABLE `task_option_errors` (
	`task_code` text NOT NULL,
	`option` text NOT NULL,
	`error_type_id` integer NOT NULL,
	PRIMARY KEY(`task_code`, `option`),
	FOREIGN KEY (`error_type_id`) REFERENCES `error_types`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `user_loss_history` (
	`user_id` text NOT NULL,
	`date` text NOT NULL,
	`loss` real NOT NULL,
	PRIMARY KEY(`user_id`, `date`),
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `user_topic_stats` (
	`user_id` text NOT NULL,
	`topic_id` integer NOT NULL,
	`mastery` real NOT NULL,
	`loss` real NOT NULL,
	`attempts` integer NOT NULL,
	`status` text NOT NULL,
	`main_error` text,
	`main_error_type_id` integer,
	`main_error_count` integer DEFAULT 0 NOT NULL,
	`guesses` integer DEFAULT 0 NOT NULL,
	`root_topic_id` integer,
	`next_review_at` text,
	`mastered_at` integer,
	`updated_at` integer NOT NULL,
	PRIMARY KEY(`user_id`, `topic_id`),
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`topic_id`) REFERENCES `topics`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `weak_practice_sets` (
	`id` text PRIMARY KEY NOT NULL,
	`user_id` text NOT NULL,
	`topic_id` integer NOT NULL,
	`kind` text NOT NULL,
	`question_ids` text NOT NULL,
	`answers` text DEFAULT '{}' NOT NULL,
	`correct` integer,
	`created_at` integer NOT NULL,
	`finished_at` integer,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`topic_id`) REFERENCES `topics`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE INDEX `weak_practice_sets_user_idx` ON `weak_practice_sets` (`user_id`,`created_at`);--> statement-breakpoint
ALTER TABLE `bank_tasks` ADD `points` real DEFAULT 1 NOT NULL;--> statement-breakpoint
ALTER TABLE `exam_blueprints` ADD `avg_points` real DEFAULT 4 NOT NULL;--> statement-breakpoint
ALTER TABLE `topics` ADD `section` text;--> statement-breakpoint
ALTER TABLE `topics` ADD `dim_frequency` real DEFAULT 0 NOT NULL;--> statement-breakpoint
ALTER TABLE `topics` ADD `exam_types` text DEFAULT '9,11,blok' NOT NULL;--> statement-breakpoint
ALTER TABLE `topics` ADD `prerequisite_id` integer;--> statement-breakpoint
ALTER TABLE `user_answers` ADD `topic_slug` text;--> statement-breakpoint
ALTER TABLE `user_answers` ADD `chosen` text;--> statement-breakpoint
ALTER TABLE `user_answers` ADD `time_ms` integer;--> statement-breakpoint
ALTER TABLE `user_answers` ADD `changes` integer;--> statement-breakpoint
ALTER TABLE `user_answers` ADD `flagged` integer;--> statement-breakpoint
ALTER TABLE `user_answers` ADD `exam_id` text;--> statement-breakpoint
CREATE INDEX `user_answers_question_idx` ON `user_answers` (`question_ref`);