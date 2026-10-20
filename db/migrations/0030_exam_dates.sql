CREATE TABLE `exam_dates` (
	`id` text PRIMARY KEY NOT NULL,
	`exam_type` text NOT NULL,
	`title` text NOT NULL,
	`exam_date` integer NOT NULL,
	`is_estimated` integer DEFAULT false NOT NULL,
	`is_active` integer DEFAULT true NOT NULL,
	`created_at` integer NOT NULL,
	`updated_at` integer NOT NULL
);
--> statement-breakpoint
CREATE INDEX `exam_dates_type_idx` ON `exam_dates` (`exam_type`,`is_active`);--> statement-breakpoint
-- Təxmini tarixlər (rəsmi elan olunana qədər; admin paneldən dəyişdirilir), saat 10:00 Asia/Baku.
-- Buraxılış: 2026-cı ildə 9 mart olub → 9 mart 2027. Blok (qəbul): iyunun ortası → 20 iyun 2027.
INSERT INTO `exam_dates` (`id`, `exam_type`, `title`, `exam_date`, `is_estimated`, `is_active`, `created_at`, `updated_at`) VALUES
	('seed-buraxilis-9-2027', 'buraxilis_9', '9-cu sinif buraxılış imtahanı', 1804572000000, 1, 1, 1792495997563, 1792495997563),
	('seed-buraxilis-11-2027', 'buraxilis_11', '11-ci sinif buraxılış imtahanı', 1804572000000, 1, 1, 1792495997563, 1792495997563),
	('seed-blok-2027', 'blok', 'Blok (qəbul) imtahanı', 1813471200000, 1, 1, 1792495997563, 1792495997563);