CREATE TABLE `tutor_questions` (
	`id` text PRIMARY KEY NOT NULL,
	`topic_id` integer NOT NULL,
	`type` text NOT NULL,
	`freq` integer DEFAULT 0 NOT NULL,
	`text` text NOT NULL,
	`options` text NOT NULL,
	`ref` text DEFAULT '' NOT NULL,
	`answer` text NOT NULL,
	`hint` text DEFAULT '' NOT NULL,
	`steps` text NOT NULL,
	`sort_order` integer DEFAULT 0 NOT NULL,
	FOREIGN KEY (`topic_id`) REFERENCES `topics`(`id`) ON UPDATE no action ON DELETE no action,
	CONSTRAINT "tutor_questions_answer_check" CHECK("tutor_questions"."answer" in ('A','B','C','D','E'))
);
--> statement-breakpoint
CREATE INDEX `tutor_questions_topic_idx` ON `tutor_questions` (`topic_id`,`sort_order`);--> statement-breakpoint
CREATE TABLE `tutor_theory` (
	`topic_id` integer PRIMARY KEY NOT NULL,
	`body` text NOT NULL,
	FOREIGN KEY (`topic_id`) REFERENCES `topics`(`id`) ON UPDATE no action ON DELETE no action
);
