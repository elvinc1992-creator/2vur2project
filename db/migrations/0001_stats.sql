CREATE TABLE `exam_questions_stats` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`year` integer NOT NULL,
	`exam_name` text NOT NULL,
	`exam_key` text NOT NULL,
	`exam_kind` text NOT NULL,
	`exam_group` text,
	`question_no` integer NOT NULL,
	`topic_id` integer NOT NULL,
	`part` text NOT NULL,
	`type` text,
	`ref_2023` text,
	`match_2023` text,
	`ref_2025` text,
	`match_2025` text,
	FOREIGN KEY (`topic_id`) REFERENCES `topics`(`id`) ON UPDATE no action ON DELETE no action,
	CONSTRAINT "exam_questions_stats_kind_check" CHECK("exam_questions_stats"."exam_kind" in ('buraxilis','qebul')),
	CONSTRAINT "exam_questions_stats_match_2023_check" CHECK("exam_questions_stats"."match_2023" is null or "exam_questions_stats"."match_2023" in ('EYNİ','Çox yaxın','Oxşar','Zəif','Tapılmadı','Yoxlanmayıb')),
	CONSTRAINT "exam_questions_stats_match_2025_check" CHECK("exam_questions_stats"."match_2025" is null or "exam_questions_stats"."match_2025" in ('EYNİ','Çox yaxın','Oxşar','Zəif','Tapılmadı','Yoxlanmayıb'))
);
--> statement-breakpoint
CREATE UNIQUE INDEX `exam_questions_stats_uq` ON `exam_questions_stats` (`exam_name`,`question_no`);--> statement-breakpoint
CREATE INDEX `exam_questions_stats_topic_idx` ON `exam_questions_stats` (`topic_id`);--> statement-breakpoint
CREATE INDEX `exam_questions_stats_filter_idx` ON `exam_questions_stats` (`exam_kind`,`year`);--> statement-breakpoint
CREATE TABLE `stat_notes` (
	`key` text PRIMARY KEY NOT NULL,
	`section` text NOT NULL,
	`title` text NOT NULL,
	`body` text NOT NULL,
	`sort_order` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `topics` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`slug` text NOT NULL,
	`name` text NOT NULL,
	`part` text NOT NULL,
	`sort_order` integer NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `topics_slug_unique` ON `topics` (`slug`);--> statement-breakpoint
CREATE UNIQUE INDEX `topics_name_unique` ON `topics` (`name`);