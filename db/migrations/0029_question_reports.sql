CREATE TABLE `question_reports` (
	`id` text PRIMARY KEY NOT NULL,
	`user_id` text NOT NULL,
	`code` text NOT NULL,
	`source` text NOT NULL,
	`context` text,
	`text` text NOT NULL,
	`resolved` integer DEFAULT false NOT NULL,
	`created_at` integer NOT NULL,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE INDEX `question_reports_created_idx` ON `question_reports` (`created_at`);--> statement-breakpoint
CREATE INDEX `question_reports_code_idx` ON `question_reports` (`code`);