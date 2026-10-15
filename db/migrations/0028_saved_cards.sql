CREATE TABLE `saved_cards` (
	`user_id` text PRIMARY KEY NOT NULL,
	`card_id` text NOT NULL,
	`card_mask` text,
	`created_at` integer NOT NULL,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
ALTER TABLE `payment_orders` ADD `card_id` text;