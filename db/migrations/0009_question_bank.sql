CREATE TABLE `bank_tasks` (
	`code` text PRIMARY KEY NOT NULL,
	`topic_id` integer NOT NULL,
	`subtopic_id` integer,
	`format` text NOT NULL,
	`body` text NOT NULL,
	`options` text,
	`correct_option` text,
	`matching_answer` text,
	`answer_value` text,
	`solution` text NOT NULL,
	`image_url` text,
	`image_alt` text,
	`difficulty` integer,
	`based_on_year` integer,
	`based_on_part` text,
	`based_on_page` integer,
	`based_on_task_no` integer,
	`status` text DEFAULT 'draft' NOT NULL,
	`author` text,
	`sort_order` integer DEFAULT 0 NOT NULL,
	FOREIGN KEY (`topic_id`) REFERENCES `topics`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`subtopic_id`) REFERENCES `subtopics`(`id`) ON UPDATE no action ON DELETE no action,
	CONSTRAINT "bank_tasks_format_check" CHECK("bank_tasks"."format" in ('closed','matching','open','written'))
);
--> statement-breakpoint
CREATE INDEX `bank_tasks_topic_idx` ON `bank_tasks` (`topic_id`,`sort_order`);--> statement-breakpoint
CREATE INDEX `bank_tasks_ref_idx` ON `bank_tasks` (`based_on_part`,`based_on_page`,`based_on_task_no`);--> statement-breakpoint
CREATE TABLE `exam_samples` (
	`n` integer PRIMARY KEY NOT NULL,
	`topic_id` integer NOT NULL,
	`year` integer NOT NULL,
	`exam` text NOT NULL,
	`question_no` integer NOT NULL,
	`type` text NOT NULL,
	`toplu` text NOT NULL,
	`match_level` text NOT NULL,
	`question` text NOT NULL,
	`options` text NOT NULL,
	`answer` text NOT NULL,
	FOREIGN KEY (`topic_id`) REFERENCES `topics`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `subtopics` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`topic_id` integer NOT NULL,
	`book_year` integer NOT NULL,
	`book_part` text NOT NULL,
	`title` text NOT NULL,
	`start_page` integer,
	`page_verified` integer DEFAULT false NOT NULL,
	`sort_order` integer DEFAULT 0 NOT NULL,
	FOREIGN KEY (`topic_id`) REFERENCES `topics`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE UNIQUE INDEX `subtopics_topic_title_uq` ON `subtopics` (`topic_id`,`title`);