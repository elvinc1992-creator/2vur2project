CREATE TABLE `contest_answers` (
	`registration_id` text NOT NULL,
	`n` integer NOT NULL,
	`given` text,
	`correct` integer NOT NULL,
	`answered_at` integer NOT NULL,
	`time_ms` integer NOT NULL,
	PRIMARY KEY(`registration_id`, `n`),
	FOREIGN KEY (`registration_id`) REFERENCES `contest_registrations`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `contest_attempts` (
	`registration_id` text PRIMARY KEY NOT NULL,
	`started_at` integer NOT NULL,
	`current_n` integer DEFAULT 1 NOT NULL,
	`current_started_at` integer NOT NULL,
	`finished_at` integer,
	FOREIGN KEY (`registration_id`) REFERENCES `contest_registrations`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `contest_emails` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`registration_id` text NOT NULL,
	`kind` text NOT NULL,
	`sent_at` integer NOT NULL,
	FOREIGN KEY (`registration_id`) REFERENCES `contest_registrations`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE INDEX `contest_emails_reg_idx` ON `contest_emails` (`registration_id`,`kind`);--> statement-breakpoint
CREATE TABLE `contest_events` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`registration_id` text NOT NULL,
	`kind` text NOT NULL,
	`n` integer,
	`at` integer NOT NULL,
	FOREIGN KEY (`registration_id`) REFERENCES `contest_registrations`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE INDEX `contest_events_reg_idx` ON `contest_events` (`registration_id`,`at`);--> statement-breakpoint
CREATE TABLE `contest_prizes` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`contest_id` text NOT NULL,
	`place_from` integer NOT NULL,
	`place_to` integer NOT NULL,
	`amount` real,
	`description` text NOT NULL,
	FOREIGN KEY (`contest_id`) REFERENCES `contests`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `contest_registrations` (
	`id` text PRIMARY KEY NOT NULL,
	`contest_id` text NOT NULL,
	`user_id` text NOT NULL,
	`first_name` text NOT NULL,
	`last_name` text NOT NULL,
	`grade` integer NOT NULL,
	`region` text NOT NULL,
	`school` text,
	`email` text NOT NULL,
	`invite_code` text NOT NULL,
	`invited_by_code` text,
	`invited_by_id` text,
	`agree_rules` integer NOT NULL,
	`agree_parent` integer NOT NULL,
	`agree_email` integer NOT NULL,
	`unsubscribed_at` integer,
	`created_at` integer NOT NULL,
	FOREIGN KEY (`contest_id`) REFERENCES `contests`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE UNIQUE INDEX `contest_reg_user_uq` ON `contest_registrations` (`contest_id`,`user_id`);--> statement-breakpoint
CREATE UNIQUE INDEX `contest_reg_code_uq` ON `contest_registrations` (`invite_code`);--> statement-breakpoint
CREATE INDEX `contest_reg_contest_idx` ON `contest_registrations` (`contest_id`,`created_at`);--> statement-breakpoint
CREATE TABLE `contest_results` (
	`registration_id` text PRIMARY KEY NOT NULL,
	`contest_id` text NOT NULL,
	`score` integer NOT NULL,
	`total_ms` integer NOT NULL,
	`place` integer,
	`finalist` integer DEFAULT false NOT NULL,
	`final_attended` integer,
	`final_score` real,
	`final_place` integer,
	`disqualified` integer DEFAULT false NOT NULL,
	`dq_reason` text,
	`prize_method` text,
	`prize_status` text,
	FOREIGN KEY (`registration_id`) REFERENCES `contest_registrations`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`contest_id`) REFERENCES `contests`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE INDEX `contest_results_contest_idx` ON `contest_results` (`contest_id`,`place`);--> statement-breakpoint
CREATE TABLE `contest_templates` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`contest_id` text NOT NULL,
	`n` integer NOT NULL,
	`topic_id` integer,
	`body` text NOT NULL,
	`vars` text NOT NULL,
	`condition` text,
	`answer` text NOT NULL,
	`distractors` text NOT NULL,
	`solution` text DEFAULT '' NOT NULL,
	`time_sec` integer DEFAULT 75 NOT NULL,
	FOREIGN KEY (`contest_id`) REFERENCES `contests`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`topic_id`) REFERENCES `topics`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE UNIQUE INDEX `contest_templates_n_uq` ON `contest_templates` (`contest_id`,`n`);--> statement-breakpoint
CREATE TABLE `contest_variants` (
	`registration_id` text NOT NULL,
	`n` integer NOT NULL,
	`template_id` integer NOT NULL,
	`values` text NOT NULL,
	`text` text NOT NULL,
	`options` text NOT NULL,
	`correct` text NOT NULL,
	`time_sec` integer NOT NULL,
	PRIMARY KEY(`registration_id`, `n`),
	FOREIGN KEY (`registration_id`) REFERENCES `contest_registrations`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `contests` (
	`id` text PRIMARY KEY NOT NULL,
	`slug` text NOT NULL,
	`title` text NOT NULL,
	`description` text DEFAULT '' NOT NULL,
	`reg_start_at` integer NOT NULL,
	`reg_end_at` integer NOT NULL,
	`start_at` integer NOT NULL,
	`entry_window_min` integer DEFAULT 10 NOT NULL,
	`duration_min` integer DEFAULT 25 NOT NULL,
	`question_count` integer DEFAULT 20 NOT NULL,
	`finalist_count` integer DEFAULT 25 NOT NULL,
	`prize_fund` real DEFAULT 0 NOT NULL,
	`boost_threshold` integer,
	`boost_first_prize` real,
	`status` text DEFAULT 'draft' NOT NULL,
	`final_at` integer,
	`final_place` text,
	`awards_at` integer,
	`results_computed_at` integer,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `contests_slug_uq` ON `contests` (`slug`);