-- E-poçt qeydiyyatda tələb olunmur (profildə əlavə edilir və kodla təsdiqlənir); telefon (+994) — istəyə bağlı.
CREATE TABLE `email_codes` (
	`id` text PRIMARY KEY NOT NULL,
	`user_id` text NOT NULL,
	`email` text NOT NULL,
	`code_hash` text NOT NULL,
	`attempts` integer DEFAULT 0 NOT NULL,
	`expires_at` integer NOT NULL,
	`created_at` integer NOT NULL,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE INDEX `email_codes_user_idx` ON `email_codes` (`user_id`);--> statement-breakpoint
ALTER TABLE `users` ADD `phone` text;--> statement-breakpoint
CREATE UNIQUE INDEX `users_phone_unique` ON `users` (`phone`);--> statement-breakpoint
DROP INDEX `users_email_unique`;--> statement-breakpoint
ALTER TABLE `users` ALTER COLUMN "email" TO "email" text;--> statement-breakpoint
CREATE UNIQUE INDEX `users_email_unique` ON `users` (`email`);
