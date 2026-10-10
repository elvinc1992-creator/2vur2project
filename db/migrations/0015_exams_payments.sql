CREATE TABLE `exam_items` (
	`exam_id` text NOT NULL,
	`n` integer NOT NULL,
	`task_code` text NOT NULL,
	`format` text NOT NULL,
	PRIMARY KEY(`exam_id`, `n`),
	FOREIGN KEY (`exam_id`) REFERENCES `exams`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `exams` (
	`id` text PRIMARY KEY NOT NULL,
	`blueprint_key` text NOT NULL,
	`number` integer NOT NULL,
	`title` text NOT NULL,
	`duration_min` integer NOT NULL,
	`status` text DEFAULT 'published' NOT NULL,
	`created_at` integer NOT NULL,
	FOREIGN KEY (`blueprint_key`) REFERENCES `exam_blueprints`(`key`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE UNIQUE INDEX `exams_blueprint_number_uq` ON `exams` (`blueprint_key`,`number`);--> statement-breakpoint
CREATE TABLE `payments` (
	`id` text PRIMARY KEY NOT NULL,
	`user_id` text NOT NULL,
	`kind` text NOT NULL,
	`title` text NOT NULL,
	`amount` real NOT NULL,
	`tier` text,
	`period` text,
	`exam_id` text,
	`created_at` integer NOT NULL,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE INDEX `payments_created_idx` ON `payments` (`created_at`);--> statement-breakpoint
CREATE INDEX `payments_user_idx` ON `payments` (`user_id`);--> statement-breakpoint
ALTER TABLE `topics` ADD `curriculum_order` integer DEFAULT 0 NOT NULL;