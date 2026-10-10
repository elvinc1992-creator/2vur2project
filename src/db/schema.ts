import { sql } from "drizzle-orm";
import { check, index, integer, primaryKey, real, sqliteTable, text, uniqueIndex } from "drizzle-orm/sqlite-core";

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
    // Qeydiyyatda tələb olunmur — profildə əlavə edilir və kodla təsdiqlənir.
    email: text("email").unique(),
    /** +994XXXXXXXXX (istəyə bağlı, profildə). */
    phone: text("phone").unique(),
    username: text("username").unique(),
    name: text("name").notNull(),
    surname: text("surname"),
    fatherName: text("father_name"),
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

/**
 * Profildə e-poçt əlavə edəndə göndərilən 6 rəqəmli kod. E-poçt users-ə yalnız kod təsdiqlənəndən sonra yazılır.
 * Kodun özü saxlanılmır — yalnız SHA-256 hash.
 */
export const emailCodes = sqliteTable(
  "email_codes",
  {
    id: text("id")
      .primaryKey()
      .$defaultFn(() => crypto.randomUUID()),
    userId: text("user_id")
      .notNull()
      .references(() => users.id, { onDelete: "cascade" }),
    email: text("email").notNull(),
    codeHash: text("code_hash").notNull(),
    attempts: integer("attempts").notNull().default(0),
    expiresAt: integer("expires_at", { mode: "timestamp_ms" }).notNull(),
    createdAt: createdAt(),
  },
  (t) => [index("email_codes_user_idx").on(t.userId)],
);
export const passwordResetTokens = tokenTable("password_reset_tokens");

// Sabit pəncərəli rate limit sayğacları (giriş, qeydiyyat, bərpa, e-poçt).
export const rateLimits = sqliteTable("rate_limits", {
  key: text("key").primaryKey(),
  count: integer("count").notNull(),
  resetAt: integer("reset_at").notNull(),
});

/* ---------------- İstifadəçi fəaliyyəti ---------------- */

/** İstifadəçinin bütün vəziyyəti (cavablar, sınaqlar, alışlar, abunə…) — JSON, userId-yə bağlı. */
export const userState = sqliteTable("user_state", {
  userId: text("user_id")
    .primaryKey()
    .references(() => users.id, { onDelete: "cascade" }),
  data: text("data").notNull(),
  updatedAt: integer("updated_at", { mode: "timestamp_ms" })
    .notNull()
    .$defaultFn(() => new Date())
    .$onUpdateFn(() => new Date()),
});

export const ANSWER_SOURCES = ["daily", "tutor", "review", "exam"] as const;
export type AnswerSource = (typeof ANSWER_SOURCES)[number];

/** Hər cavablanmış sual ayrıca sətir — bal simulyatoru son 7 günü buradan hesablayır. */
export const userAnswers = sqliteTable(
  "user_answers",
  {
    id: integer("id").primaryKey({ autoIncrement: true }),
    userId: text("user_id")
      .notNull()
      .references(() => users.id, { onDelete: "cascade" }),
    source: text("source", { enum: ANSWER_SOURCES }).notNull(),
    /** Sualın istinadı: günün sualı id, repetitor id, təkrar ref, "examId:n". */
    questionRef: text("question_ref").notNull(),
    correct: integer("correct", { mode: "boolean" }).notNull(),
    answeredAt: integer("answered_at", { mode: "timestamp_ms" })
      .notNull()
      .$defaultFn(() => new Date()),
    /* Zəif mövzuların təhlili üçün (köhnə sətirlərdə boşdur). */
    /** Mövzu (slug) — cavab anında yazılır; sual sonradan bankdan çıxsa da məlumat itmir. */
    topicSlug: text("topic_slug"),
    /** Seçilmiş cavab (hərf və ya kodlaşdırılan ədəd). */
    chosen: text("chosen"),
    /** Suala sərf olunan vaxt (ms). */
    timeMs: integer("time_ms"),
    /** Cavab neçə dəfə dəyişdirilib. */
    changes: integer("changes"),
    flagged: integer("flagged", { mode: "boolean" }),
    /** Sınaq (sınaq cavabları üçün). */
    examId: text("exam_id"),
  },
  (t) => [
    index("user_answers_user_time_idx").on(t.userId, t.answeredAt),
    index("user_answers_question_idx").on(t.questionRef),
    check("user_answers_source_check", sql`${t.source} in ('daily','tutor','review','exam')`),
  ],
);

/* ---------------- Onlayn repetitor ---------------- */

/* Köhnə test sualları (tutor_questions) silindi — suallar yalnız bank_tasks-dadır. */

/* ---------------- Sual bankı (müəllifin sualları, topic_questions/*.sql) ---------------- */

/** Alt mövzu = test toplusunun bölməsi; start_page — kitabın səhifəsi. */
export const subtopics = sqliteTable(
  "subtopics",
  {
    id: integer("id").primaryKey({ autoIncrement: true }),
    topicId: integer("topic_id")
      .notNull()
      .references(() => topics.id),
    bookYear: integer("book_year").notNull(),
    bookPart: text("book_part").notNull(),
    title: text("title").notNull(),
    startPage: integer("start_page"),
    pageVerified: integer("page_verified", { mode: "boolean" }).notNull().default(false),
    sortOrder: integer("sort_order").notNull().default(0),
  },
  (t) => [uniqueIndex("subtopics_topic_title_uq").on(t.topicId, t.title)],
);

export const TASK_FORMATS = ["closed", "matching", "open", "written"] as const;
export type TaskFormat = (typeof TASK_FORMATS)[number];

/**
 * Müəllifin orijinal sualları (toplu tipləri əsasında, rəqəmlər dəyişdirilib).
 * closed — A–E (options: [{key,text}]), matching — uyğunluq (options: {left,right}, matching_answer),
 * open / written — açıq və yazılı cavab (answer_value).
 */
export const bankTasks = sqliteTable(
  "bank_tasks",
  {
    code: text("code").primaryKey(),
    topicId: integer("topic_id")
      .notNull()
      .references(() => topics.id),
    subtopicId: integer("subtopic_id").references(() => subtopics.id),
    format: text("format", { enum: TASK_FORMATS }).notNull(),
    body: text("body").notNull(),
    /** JSON. */
    options: text("options"),
    correctOption: text("correct_option"),
    /** JSON: {"1":["b"],...}. */
    matchingAnswer: text("matching_answer"),
    answerValue: text("answer_value"),
    solution: text("solution").notNull(),
    imageUrl: text("image_url"),
    imageAlt: text("image_alt"),
    difficulty: integer("difficulty"),
    /** Sualın balı (imtahandakı çəki); müəllim dəyişə bilər. */
    points: real("points").notNull().default(1),
    basedOnYear: integer("based_on_year"),
    basedOnPart: text("based_on_part"),
    basedOnPage: integer("based_on_page"),
    basedOnTaskNo: integer("based_on_task_no"),
    status: text("status").notNull().default("draft"),
    author: text("author"),
    sortOrder: integer("sort_order").notNull().default(0),
  },
  (t) => [
    index("bank_tasks_topic_idx").on(t.topicId, t.sortOrder),
    index("bank_tasks_ref_idx").on(t.basedOnPart, t.basedOnPage, t.basedOnTaskNo),
    check("bank_tasks_format_check", sql`${t.format} in ('closed','matching','open','written')`),
  ],
);

/** Real imtahan sualı nümunələri (hər mövzudan biri) və onların toplu istinadı. */
export const examSamples = sqliteTable("exam_samples", {
  n: integer("n").primaryKey(),
  topicId: integer("topic_id")
    .notNull()
    .references(() => topics.id),
  year: integer("year").notNull(),
  exam: text("exam").notNull(),
  questionNo: integer("question_no").notNull(),
  type: text("type").notNull(),
  /** "II h. səh.257 №26" — toplu istinadı (2025). */
  toplu: text("toplu").notNull(),
  matchLevel: text("match_level").notNull(),
  question: text("question").notNull(),
  /** JSON: 5 variant (A–E sırası ilə). */
  options: text("options").notNull(),
  answer: text("answer").notNull(),
});

/**
 * İmtahan sualının bizim saytdakı qarşılıqları (bir imtahan sualına bir neçə qarşılıq ola bilər).
 * Mənbə: imtahan_*.json → `qarsiligi`.
 */
export const examCounterparts = sqliteTable(
  "exam_counterparts",
  {
    id: integer("id").primaryKey({ autoIncrement: true }),
    examN: integer("exam_n")
      .notNull()
      .references(() => examSamples.n),
    topicId: integer("topic_id")
      .notNull()
      .references(() => topics.id),
    question: text("question").notNull(),
    /** JSON: 5 variant (A–E sırası ilə). */
    options: text("options").notNull(),
    answer: text("answer").notNull(),
    /** TikZ şəkli (sadə alt çoxluq: xətlər, düzbucaqlı, çevrə, nöqtə adları). */
    figureTikz: text("figure_tikz"),
    sortOrder: integer("sort_order").notNull().default(0),
  },
  (t) => [uniqueIndex("exam_counterparts_exam_sort_uq").on(t.examN, t.sortOrder), index("exam_counterparts_topic_idx").on(t.topicId)],
);

/**
 * DİM imtahanlarının quruluşu (sınaq generasiyası üçün): imtahan → sual tipləri üzrə say və nömrə aralığı.
 * Mənbə: topic_questions/sual_tipleri_cedveli.txt.
 */
export const examBlueprints = sqliteTable("exam_blueprints", {
  /** "buraxilis-9", "buraxilis-11", "qebul-11". */
  key: text("key").primaryKey(),
  name: text("name").notNull(),
  grade: integer("grade").notNull(),
  kind: text("kind", { enum: ["buraxilis", "qebul"] }).notNull(),
  subject: text("subject").notNull(),
  totalQuestions: integer("total_questions").notNull(),
  /** Bir sualın orta balı (maksimal bal / sual sayı) — bal itkisinin hesablanması üçün. */
  avgPoints: real("avg_points").notNull().default(4),
  sortOrder: integer("sort_order").notNull().default(0),
});

export const examBlueprintSections = sqliteTable(
  "exam_blueprint_sections",
  {
    id: integer("id").primaryKey({ autoIncrement: true }),
    blueprintKey: text("blueprint_key")
      .notNull()
      .references(() => examBlueprints.key),
    /** bank_tasks.format ilə eyni: closed (qapalı), open (açıq kodlaşdırılan), written (izahlı). */
    format: text("format", { enum: TASK_FORMATS }).notNull(),
    questionCount: integer("question_count").notNull(),
    /** İmtahan kitabçasındakı nömrələr (məs. 9-cu sinif: №61–75). */
    firstNo: integer("first_no").notNull(),
    lastNo: integer("last_no").notNull(),
    sortOrder: integer("sort_order").notNull().default(0),
  },
  (t) => [uniqueIndex("exam_blueprint_sections_uq").on(t.blueprintKey, t.format)],
);

/** Mövzunun nəzəriyyəsi (Markdown + LaTeX). */
export const tutorTheory = sqliteTable("tutor_theory", {
  topicId: integer("topic_id")
    .primaryKey()
    .references(() => topics.id),
  body: text("body").notNull(),
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
  /** Bölmə: Ədədlər, Cəbr, Funksiyalar, Həndəsə, Statistika və ehtimal. */
  section: text("section"),
  /** Bir imtahanda bu mövzudan orta sual sayı (müəllim daxil edir; ilkin dəyər — imtahan təhlilindən). */
  dimFrequency: real("dim_frequency").notNull().default(0),
  /** Aid olduğu imtahan tipləri, vergüllə: "9,11,blok". */
  examTypes: text("exam_types").notNull().default("9,11,blok"),
  /** Əsas (ilkin) mövzu — kök səbəb təhlili üçün. */
  prerequisiteId: integer("prerequisite_id"),
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

/* ---------------- Zəif mövzular (avtomatik təhlil) ---------------- */

export const WEAK_STATUSES = ["few", "weak", "growing", "mastered"] as const;
export type WeakStatus = (typeof WEAK_STATUSES)[number];

/** Səhv tipi (müəllim yaradır): məs. "Faizdə baza səhvi". */
export const errorTypes = sqliteTable(
  "error_types",
  {
    id: integer("id").primaryKey({ autoIncrement: true }),
    topicId: integer("topic_id")
      .notNull()
      .references(() => topics.id),
    name: text("name").notNull(),
    description: text("description").notNull().default(""),
    createdAt: integer("created_at", { mode: "timestamp_ms" })
      .notNull()
      .$defaultFn(() => new Date()),
  },
  (t) => [uniqueIndex("error_types_topic_name_uq").on(t.topicId, t.name)],
);

/** Sualın yanlış variantı → səhv tipi (könüllü bağlantı). */
export const taskOptionErrors = sqliteTable(
  "task_option_errors",
  {
    taskCode: text("task_code").notNull(),
    option: text("option").notNull(),
    errorTypeId: integer("error_type_id")
      .notNull()
      .references(() => errorTypes.id, { onDelete: "cascade" }),
  },
  (t) => [primaryKey({ columns: [t.taskCode, t.option] })],
);

/** Şagird–mövzu nəticəsi (keş): son hesablamanın nəticəsi. */
export const userTopicStats = sqliteTable(
  "user_topic_stats",
  {
    userId: text("user_id")
      .notNull()
      .references(() => users.id, { onDelete: "cascade" }),
    topicId: integer("topic_id")
      .notNull()
      .references(() => topics.id),
    /** 0..1 */
    mastery: real("mastery").notNull(),
    /** İmtahanda itirilən təxmini bal. */
    loss: real("loss").notNull(),
    attempts: integer("attempts").notNull(),
    status: text("status", { enum: WEAK_STATUSES }).notNull(),
    /** Əsas səhv: səhv tipi (varsa) və ya ən çox səhv edilən alt mövzu. */
    mainError: text("main_error"),
    mainErrorTypeId: integer("main_error_type_id"),
    mainErrorCount: integer("main_error_count").notNull().default(0),
    /** Şübhəli (təxmini) düz cavabların sayı. */
    guesses: integer("guesses").notNull().default(0),
    /** Kök səbəb: zəif əsas mövzu. */
    rootTopicId: integer("root_topic_id"),
    /** Növbəti təkrar yoxlamanın tarixi (YYYY-MM-DD). */
    nextReviewAt: text("next_review_at"),
    /** Təkrar yoxlamadan keçib — "Mənimsənib" (yeni zəif nəticəyə qədər). */
    masteredAt: integer("mastered_at", { mode: "timestamp_ms" }),
    updatedAt: integer("updated_at", { mode: "timestamp_ms" }).notNull(),
  },
  (t) => [primaryKey({ columns: [t.userId, t.topicId] })],
);

/** Gündəlik ümumi bal itkisi — dinamika qrafiki üçün. */
export const userLossHistory = sqliteTable(
  "user_loss_history",
  {
    userId: text("user_id")
      .notNull()
      .references(() => users.id, { onDelete: "cascade" }),
    /** YYYY-MM-DD (Bakı vaxtı). */
    date: text("date").notNull(),
    loss: real("loss").notNull(),
  },
  (t) => [primaryKey({ columns: [t.userId, t.date] })],
);

/** Hədəfli məşq dəsti ("N sualla düzəlt") və təkrar yoxlama (5 sual). */
export const weakPracticeSets = sqliteTable(
  "weak_practice_sets",
  {
    id: text("id").primaryKey(),
    userId: text("user_id")
      .notNull()
      .references(() => users.id, { onDelete: "cascade" }),
    topicId: integer("topic_id")
      .notNull()
      .references(() => topics.id),
    kind: text("kind", { enum: ["fix", "recheck"] }).notNull(),
    /** JSON: sual kodları. */
    questionIds: text("question_ids").notNull(),
    /** JSON: kod → seçilmiş hərf. */
    answers: text("answers").notNull().default("{}"),
    correct: integer("correct"),
    createdAt: integer("created_at", { mode: "timestamp_ms" }).notNull(),
    finishedAt: integer("finished_at", { mode: "timestamp_ms" }),
  },
  (t) => [index("weak_practice_sets_user_idx").on(t.userId, t.createdAt)],
);