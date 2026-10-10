CREATE TABLE `exam_blueprint_sections` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`blueprint_key` text NOT NULL,
	`format` text NOT NULL,
	`question_count` integer NOT NULL,
	`first_no` integer NOT NULL,
	`last_no` integer NOT NULL,
	`sort_order` integer DEFAULT 0 NOT NULL,
	FOREIGN KEY (`blueprint_key`) REFERENCES `exam_blueprints`(`key`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE UNIQUE INDEX `exam_blueprint_sections_uq` ON `exam_blueprint_sections` (`blueprint_key`,`format`);--> statement-breakpoint
CREATE TABLE `exam_blueprints` (
	`key` text PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`grade` integer NOT NULL,
	`kind` text NOT NULL,
	`subject` text NOT NULL,
	`total_questions` integer NOT NULL,
	`sort_order` integer DEFAULT 0 NOT NULL
);
