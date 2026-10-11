CREATE TABLE `waitlist` (
	`email` text PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`role` text NOT NULL,
	`grade` text,
	`consent` integer NOT NULL,
	`created_at` integer NOT NULL
);
