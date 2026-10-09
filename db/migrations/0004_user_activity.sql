CREATE TABLE `user_answers` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`user_id` text NOT NULL,
	`source` text NOT NULL,
	`question_ref` text NOT NULL,
	`correct` integer NOT NULL,
	`answered_at` integer NOT NULL,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade,
	CONSTRAINT "user_answers_source_check" CHECK("user_answers"."source" in ('daily','tutor','review','exam'))
);
--> statement-breakpoint
CREATE INDEX `user_answers_user_time_idx` ON `user_answers` (`user_id`,`answered_at`);--> statement-breakpoint
CREATE TABLE `user_state` (
	`user_id` text PRIMARY KEY NOT NULL,
	`data` text NOT NULL,
	`updated_at` integer NOT NULL,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
ALTER TABLE `users` ADD `surname` text;--> statement-breakpoint
ALTER TABLE `users` ADD `father_name` text;