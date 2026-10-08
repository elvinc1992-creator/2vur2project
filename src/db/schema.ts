import { sql } from "drizzle-orm";
import { check, index, integer, sqliteTable, text, uniqueIndex } from "drizzle-orm/sqlite-core";

// Vaxt sütunları — Unix millisaniyə (integer, mode: timestamp_ms).
const createdAt = () =>
  integer("created_at", { mode: "timestamp_ms" })
    .notNull()
    .$defaultFn(() => new Date());

export const USER_ROLES = ["student", "teacher", "editor", "admin"] as const;
export const TARGET_EXAMS = ["buraxilis", "qebul", "both"] as const;

export const users = sqliteTable(
  "users",
  {
    id: text("id")
      .primaryKey()
      .$defaultFn(() => crypto.randomUUID()),
    // E-poçt və istifadəçi adı kiçik hərflə saxlanılır.
    email: text("email").notNull().unique(),
    username: text("username").unique(),
    name: text("name").notNull(),
    // Yalnız Google ilə yaradılmış hesabda boş olur.
    passwordHash: text("password_hash"),
    role: text("role", { enum: USER_ROLES }).notNull().default("student"),
    grade: integer("grade"),
    targetExam: text("target_exam", { enum: TARGET_EXAMS }),
    emailVerifiedAt: integer("email_verified_at", { mode: "timestamp_ms" }),
    termsAcceptedAt: integer("terms_accepted_at", { mode: "timestamp_ms" }),
    onboardingCompletedAt: integer("onboarding_completed_at", { mode: "timestamp_ms" }),
    // Valideyn axını FEATURE_GUARDIAN_CONSENT ilə söndürülüb, sahələr hazırdır.
    guardianName: text("guardian_name"),
    guardianEmail: text("guardian_email"),
    guardianConsentAt: integer("guardian_consent_at", { mode: "timestamp_ms" }),
    createdAt: createdAt(),
    updatedAt: integer("updated_at", { mode: "timestamp_ms" })
      .notNull()
      .$defaultFn(() => new Date())
      .$onUpdateFn(() => new Date()),
  },
  (t) => [
    check("users_role_check", sql`${t.role} in ('student','teacher','editor','admin')`),
    check("users_grade_check", sql`${t.grade} is null or ${t.grade} in (9, 10, 11)`),
    check(
      "users_target_exam_check",
      sql`${t.targetExam} is null or ${t.targetExam} in ('buraxilis','qebul','both')`,
    ),
  ],
);

export const oauthAccounts = sqliteTable(
  "oauth_accounts",
  {
    id: text("id")
      .primaryKey()
      .$defaultFn(() => crypto.randomUUID()),
    userId: text("user_id")
      .notNull()
      .references(() => users.id, { onDelete: "cascade" }),
    provider: text("provider").notNull(),
    providerAccountId: text("provider_account_id").notNull(),
    createdAt: createdAt(),
  },
  (t) => [
    uniqueIndex("oauth_accounts_provider_uq").on(t.provider, t.providerAccountId),
    index("oauth_accounts_user_idx").on(t.userId),
  ],
);

// Tokenin özü saxlanılmır — yalnız SHA-256 hash.
const tokenTable = (name: string) =>
  sqliteTable(
    name,
    {
      id: text("id")
        .primaryKey()
        .$defaultFn(() => crypto.randomUUID()),
      userId: text("user_id")
        .notNull()
        .references(() => users.id, { onDelete: "cascade" }),
      tokenHash: text("token_hash").notNull().unique(),
      expiresAt: integer("expires_at", { mode: "timestamp_ms" }).notNull(),
      usedAt: integer("used_at", { mode: "timestamp_ms" }),
      createdAt: createdAt(),
    },
    (t) => [index(`${name}_user_idx`).on(t.userId)],
  );

export const emailVerificationTokens = tokenTable("email_verification_tokens");
export const passwordResetTokens = tokenTable("password_reset_tokens");

// Sabit pəncərəli rate limit sayğacları (giriş, qeydiyyat, bərpa, e-poçt).
export const rateLimits = sqliteTable("rate_limits", {
  key: text("key").primaryKey(),
  count: integer("count").notNull(),
  resetAt: integer("reset_at").notNull(),
});

export type User = typeof users.$inferSelect;
export type UserRole = (typeof USER_ROLES)[number];
export type TargetExam = (typeof TARGET_EXAMS)[number];

/* ---------------- Statistika (Excel analizi) ---------------- */
// Sualların MƏTNİ saxlanmır — yalnız təsnifat, toplu istinadı və uyğunluq dərəcəsi.

export const MATCH_LEVELS = ["EYNİ", "Çox yaxın", "Oxşar", "Zəif", "Tapılmadı", "Yoxlanmayıb"] as const;
export type MatchLevel = (typeof MATCH_LEVELS)[number];
export const EXAM_KINDS = ["buraxilis", "qebul"] as const;

export const topics = sqliteTable("topics", {
  id: integer("id").primaryKey({ autoIncrement: true }),
  slug: text("slug").notNull().unique(),
  name: text("name").notNull().unique(),
  part: text("part").notNull(),
  sortOrder: integer("sort_order").notNull(),
});

const matchCheck = (col: unknown) =>
  sql`${col} is null or ${col} in ('EYNİ','Çox yaxın','Oxşar','Zəif','Tapılmadı','Yoxlanmayıb')`;

export const examQuestionsStats = sqliteTable(
  "exam_questions_stats",
  {
    id: integer("id").primaryKey({ autoIncrement: true }),
    year: integer("year").notNull(),
    examName: text("exam_name").notNull(),
    // Səhifələrə bölünmüş eyni imtahan ("… (26–40)", "… (41–50)") bir açarda birləşir.
    examKey: text("exam_key").notNull(),
    examKind: text("exam_kind", { enum: EXAM_KINDS }).notNull(),
    examGroup: text("exam_group"),
    questionNo: integer("question_no").notNull(),
    topicId: integer("topic_id")
      .notNull()
      .references(() => topics.id),
    part: text("part").notNull(),
    type: text("type"),
    ref2023: text("ref_2023"),
    match2023: text("match_2023"),
    ref2025: text("ref_2025"),
    match2025: text("match_2025"),
  },
  (t) => [
    uniqueIndex("exam_questions_stats_uq").on(t.examName, t.questionNo),
    index("exam_questions_stats_topic_idx").on(t.topicId),
    index("exam_questions_stats_filter_idx").on(t.examKind, t.year),
    check("exam_questions_stats_kind_check", sql`${t.examKind} in ('buraxilis','qebul')`),
    check("exam_questions_stats_match_2023_check", matchCheck(t.match2023)),
    check("exam_questions_stats_match_2025_check", matchCheck(t.match2025)),
  ],
);

/** "Qeydlər" vərəqi: metodika, məhdudiyyətlər, mənbələr. */
export const statNotes = sqliteTable("stat_notes", {
  key: text("key").primaryKey(),
  section: text("section").notNull(),
  title: text("title").notNull(),
  body: text("body").notNull(),
  sortOrder: integer("sort_order").notNull(),
});
