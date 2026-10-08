CREATE TABLE `email_verification_tokens` (
	`id` text PRIMARY KEY NOT NULL,
	`user_id` text NOT NULL,
	`token_hash` text NOT NULL,
	`expires_at` integer NOT NULL,
	`used_at` integer,
	`created_at` integer NOT NULL,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE UNIQUE INDEX `email_verification_tokens_token_hash_unique` ON `email_verification_tokens` (`token_hash`);--> statement-breakpoint
CREATE INDEX `email_verification_tokens_user_idx` ON `email_verification_tokens` (`user_id`);--> statement-breakpoint
CREATE TABLE `oauth_accounts` (
	`id` text PRIMARY KEY NOT NULL,
	`user_id` text NOT NULL,
	`provider` text NOT NULL,
	`provider_account_id` text NOT NULL,
	`created_at` integer NOT NULL,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE UNIQUE INDEX `oauth_accounts_provider_uq` ON `oauth_accounts` (`provider`,`provider_account_id`);--> statement-breakpoint
CREATE INDEX `oauth_accounts_user_idx` ON `oauth_accounts` (`user_id`);--> statement-breakpoint
CREATE TABLE `password_reset_tokens` (
	`id` text PRIMARY KEY NOT NULL,
	`user_id` text NOT NULL,
	`token_hash` text NOT NULL,
	`expires_at` integer NOT NULL,
	`used_at` integer,
	`created_at` integer NOT NULL,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE UNIQUE INDEX `password_reset_tokens_token_hash_unique` ON `password_reset_tokens` (`token_hash`);--> statement-breakpoint
CREATE INDEX `password_reset_tokens_user_idx` ON `password_reset_tokens` (`user_id`);--> statement-breakpoint
CREATE TABLE `rate_limits` (
	`key` text PRIMARY KEY NOT NULL,
	`count` integer NOT NULL,
	`reset_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `users` (
	`id` text PRIMARY KEY NOT NULL,
	`email` text NOT NULL,
	`username` text,
	`name` text NOT NULL,
	`password_hash` text,
	`role` text DEFAULT 'student' NOT NULL,
	`grade` integer,
	`target_exam` text,
	`email_verified_at` integer,
	`terms_accepted_at` integer,
	`onboarding_completed_at` integer,
	`guardian_name` text,
	`guardian_email` text,
	`guardian_consent_at` integer,
	`created_at` integer NOT NULL,
	`updated_at` integer NOT NULL,
	CONSTRAINT "users_role_check" CHECK("users"."role" in ('student','teacher','editor','admin')),
	CONSTRAINT "users_grade_check" CHECK("users"."grade" is null or "users"."grade" in (9, 10, 11)),
	CONSTRAINT "users_target_exam_check" CHECK("users"."target_exam" is null or "users"."target_exam" in ('buraxilis','qebul','both'))
);
--> statement-breakpoint
CREATE UNIQUE INDEX `users_email_unique` ON `users` (`email`);--> statement-breakpoint
CREATE UNIQUE INDEX `users_username_unique` ON `users` (`username`);