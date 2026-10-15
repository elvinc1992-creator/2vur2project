CREATE TABLE `payment_orders` (
	`id` text PRIMARY KEY NOT NULL,
	`user_id` text NOT NULL,
	`kind` text NOT NULL,
	`title` text NOT NULL,
	`amount` real NOT NULL,
	`tier` text,
	`period` text,
	`exam_id` text,
	`status` text DEFAULT 'new' NOT NULL,
	`transaction` text,
	`message` text,
	`card_mask` text,
	`receipt_id` text,
	`created_at` integer NOT NULL,
	`paid_at` integer,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE INDEX `payment_orders_user_idx` ON `payment_orders` (`user_id`);