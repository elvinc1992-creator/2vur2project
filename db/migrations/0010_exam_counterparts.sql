CREATE TABLE `exam_counterparts` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`exam_n` integer NOT NULL,
	`topic_id` integer NOT NULL,
	`question` text NOT NULL,
	`options` text NOT NULL,
	`answer` text NOT NULL,
	`figure_tikz` text,
	`sort_order` integer DEFAULT 0 NOT NULL,
	FOREIGN KEY (`exam_n`) REFERENCES `exam_samples`(`n`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`topic_id`) REFERENCES `topics`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE UNIQUE INDEX `exam_counterparts_exam_sort_uq` ON `exam_counterparts` (`exam_n`,`sort_order`);--> statement-breakpoint
CREATE INDEX `exam_counterparts_topic_idx` ON `exam_counterparts` (`topic_id`);