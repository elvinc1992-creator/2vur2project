import { sql } from "drizzle-orm";
import { check, index, integer, primaryKey, real, sqliteTable, text, uniqueIndex } from "drizzle-orm/sqlite-core";

// Vaxt sütunları — Unix millisaniyə (integer, mode: timestamp_ms).
const createdAt = () =>
  integer("created_at", { mode: "timestamp_ms" })
    .notNull()
    .$defaultFn(() => new Date());

export const USER_ROLES = ["student", "teacher", "editor", "admin"] as const;
export const TARGET_EXAMS = ["buraxilis", "qebul", "both"] as const;
/** İstifadəçi hesabı və yarış qeydiyyatı: aktiv / passiv (admin dəyişir). */
export const ACCOUNT_STATUSES = ["active", "passive"] as const;
export type AccountStatus = (typeof ACCOUNT_STATUSES)[number];

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
    /** active — normal; passive — admin tərəfindən deaktiv edilib (daxil ola bilmir). */
    status: text("status", { enum: ACCOUNT_STATUSES }).notNull().default("active"),
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

/** Mövzunun nəzəriyyəsi (Markdown + LaTeX) və/və ya vərəqlənən kitab (topic_questions/theoria/kitab-<slug>.html). */
export const tutorTheory = sqliteTable("tutor_theory", {
  topicId: integer("topic_id")
    .primaryKey()
    .references(() => topics.id),
  body: text("body").notNull(),
  /** Hazır HTML kitab (scripts/import-theory.mts emal edir); null — yalnız mətn nəzəriyyəsi. */
  bookHtml: text("book_html"),
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
  /** Tədris sırası (tasks_NN faylının nömrəsi: 1 — Natural ədədlər…) — repetitor və siyahılar bu sıra ilə. */
  curriculumOrder: integer("curriculum_order").notNull().default(0),
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
/* ---------------- Sınaqlar (sual bankından generasiya) ---------------- */

export const EXAM_ITEM_FORMATS = ["closed", "coded", "written"] as const;

/**
 * Sınaq tipləri: 9-cu sinif buraxılış, 11-ci sinif buraxılış, 11-ci sinif blok, Mövzu sınağı.
 * Qiymət (AZN) — tək sınağın alınması üçün. blueprint_key — imtahan quruluşu (mövzu sınağında yoxdur).
 */
export const examKinds = sqliteTable("exam_kinds", {
  /** "buraxilis-9", "buraxilis-11", "qebul-11", "movzu". */
  key: text("key").primaryKey(),
  name: text("name").notNull(),
  price: real("price").notNull(),
  blueprintKey: text("blueprint_key").references(() => examBlueprints.key),
  sortOrder: integer("sort_order").notNull().default(0),
  /** Standart müddət (dəq) — müəllim sınağında və yeni sınaqda (admin dəyişir). */
  durationMin: integer("duration_min").notNull().default(90),
  /** Müəllimin onlayn sınağının qiyməti (AZN, sınaq başına — şagird sayından asılı deyil; admin dəyişir). */
  teacherPrice: real("teacher_price").notNull().default(0),
  /** Müəllimin kağız sınağının qiyməti (AZN, sınaq başına; admin dəyişir). */
  teacherPaperPrice: real("teacher_paper_price").notNull().default(2),
});

export const EXAM_STATUSES = ["active", "passive", "finished"] as const;
export type ExamStatusDb = (typeof EXAM_STATUSES)[number];

/**
 * Sınaq: imtahan quruluşuna (exam_blueprints) görə sual bankından yaradılır.
 * Status: active — saytda görünür; passive — görünmür (yeni yaradılan); finished — bitib (yalnız iştirak edənlər görür).
 */
export const exams = sqliteTable(
  "exams",
  {
    id: text("id").primaryKey(),
    /** Mövzu sınağında "movzu" (bölmələri yoxdur — say adminin seçimidir). */
    blueprintKey: text("blueprint_key")
      .notNull()
      .references(() => examBlueprints.key),
    kind: text("kind").references(() => examKinds.key),
    /** Yalnız mövzu sınağında. */
    topicId: integer("topic_id").references(() => topics.id),
    /** Eyni tip sınaqlar arasında sıra nömrəsi (№1, №2…). */
    number: integer("number").notNull(),
    title: text("title").notNull(),
    durationMin: integer("duration_min").notNull(),
    status: text("status", { enum: EXAM_STATUSES }).notNull().default("passive"),
    createdAt: integer("created_at", { mode: "timestamp_ms" })
      .notNull()
      .$defaultFn(() => new Date()),
  },
  (t) => [uniqueIndex("exams_blueprint_number_uq").on(t.blueprintKey, t.number)],
);

/** Sınağın sualları: n — imtahan kitabçasındakı nömrə (9-cu sinif: 61–85), format — cavab vərəqindəki bölmə. */
export const examItems = sqliteTable(
  "exam_items",
  {
    examId: text("exam_id")
      .notNull()
      .references(() => exams.id, { onDelete: "cascade" }),
    n: integer("n").notNull(),
    taskCode: text("task_code").notNull(),
    format: text("format", { enum: EXAM_ITEM_FORMATS }).notNull(),
  },
  (t) => [primaryKey({ columns: [t.examId, t.n] })],
);

/** Ödənişlər (admin: qazanc). Mock ödəniş də bura yazılır. */
export const payments = sqliteTable(
  "payments",
  {
    id: text("id").primaryKey(),
    userId: text("user_id")
      .notNull()
      .references(() => users.id, { onDelete: "cascade" }),
    kind: text("kind", { enum: ["subscription", "exam", "teacher_topup"] }).notNull(),
    title: text("title").notNull(),
    /** AZN */
    amount: real("amount").notNull(),
    tier: text("tier"),
    period: text("period"),
    examId: text("exam_id"),
    createdAt: integer("created_at", { mode: "timestamp_ms" })
      .notNull()
      .$defaultFn(() => new Date()),
  },
  (t) => [index("payments_created_idx").on(t.createdAt), index("payments_user_idx").on(t.userId)],
);

export const PAYMENT_ORDER_STATUSES = ["new", "success", "failed"] as const;

/**
 * Epoint sifarişi: ödəniş səhifəsinə yönləndirmədən əvvəl yaranır (id = Epoint-dəki order_id).
 * Plan / sınaq yalnız Epoint-in imzalı bildirişi (result_url) və ya status yoxlaması "success" deyəndə açılır.
 */
export const paymentOrders = sqliteTable(
  "payment_orders",
  {
    id: text("id").primaryKey(),
    userId: text("user_id")
      .notNull()
      .references(() => users.id, { onDelete: "cascade" }),
    kind: text("kind", { enum: ["subscription", "exam"] }).notNull(),
    title: text("title").notNull(),
    /** AZN */
    amount: real("amount").notNull(),
    tier: text("tier", { enum: ["pro", "premium"] }),
    period: text("period", { enum: ["month", "year"] }),
    examId: text("exam_id"),
    status: text("status", { enum: PAYMENT_ORDER_STATUSES }).notNull().default("new"),
    /** Epoint əməliyyatı (te…) */
    transaction: text("transaction"),
    /** Bank cavabı / xəta mesajı (son bildirişdən) */
    message: text("message"),
    cardMask: text("card_mask"),
    /** Abunə ödənişində Epoint-də saxlanan kart (card-registration-with-pay) — ödəniş uğurlu olanda saved_cards-a keçir */
    cardId: text("card_id"),
    /** İstifadəçinin qəbzi (state.payments[].id) — ödəniş tətbiq olunanda */
    receiptId: text("receipt_id"),
    createdAt: createdAt(),
    paidAt: integer("paid_at", { mode: "timestamp_ms" }),
  },
  (t) => [index("payment_orders_user_idx").on(t.userId)],
);

/** Abunənin avtomatik yenilənməsi üçün saxlanan kart (Epoint card_id) — istifadəçi başına bir, son uğurlu abunə ödənişindən. */
export const savedCards = sqliteTable("saved_cards", {
  userId: text("user_id")
    .primaryKey()
    .references(() => users.id, { onDelete: "cascade" }),
  cardId: text("card_id").notNull(),
  cardMask: text("card_mask"),
  createdAt: createdAt(),
});

/* ---------------- Sualdakı səhv bildirişləri ---------------- */

export const QUESTION_REPORT_SOURCES = ["exam", "daily", "tutor", "review", "teacher"] as const;
export type QuestionReportSource = (typeof QUESTION_REPORT_SOURCES)[number];

/** İstifadəçinin sualdakı səhv barədə qısa rəyi (sualın yanındakı ikon) — admin "Səhv bildirişləri"ndə baxır. */
export const questionReports = sqliteTable(
  "question_reports",
  {
    id: text("id").primaryKey(),
    userId: text("user_id")
      .notNull()
      .references(() => users.id, { onDelete: "cascade" }),
    /** Bankdakı sualın kodu (bank_tasks.code) */
    code: text("code").notNull(),
    source: text("source", { enum: QUESTION_REPORT_SOURCES }).notNull(),
    /** Sınağın / müəllim sınağının id-si (varsa) */
    context: text("context"),
    text: text("text").notNull(),
    resolved: integer("resolved", { mode: "boolean" }).notNull().default(false),
    createdAt: createdAt(),
  },
  (t) => [index("question_reports_created_idx").on(t.createdAt), index("question_reports_code_idx").on(t.code)],
);

/* ---------------- Riyaziyyat yarışı ---------------- */

export const CONTEST_STATUSES = ["draft", "registration", "running", "finished", "final", "results"] as const;
export type ContestStatus = (typeof CONTEST_STATUSES)[number];

/**
 * Yarış: qeydiyyat → onlayn tur (hamı eyni anda) → əyani final → nəticələr.
 * status: draft (qaralama), registration (qeydiyyat), running (davam edir), finished (onlayn tur bitib),
 * final (final mərhələsi), results (nəticələr elan olunub).
 */
export const contests = sqliteTable(
  "contests",
  {
    id: text("id").primaryKey(),
    slug: text("slug").notNull(),
    title: text("title").notNull(),
    description: text("description").notNull().default(""),
    regStartAt: integer("reg_start_at", { mode: "timestamp_ms" }).notNull(),
    regEndAt: integer("reg_end_at", { mode: "timestamp_ms" }).notNull(),
    startAt: integer("start_at", { mode: "timestamp_ms" }).notNull(),
    /** Başlanğıcdan neçə dəqiqə sonra yeni giriş bağlanır. */
    entryWindowMin: integer("entry_window_min").notNull().default(10),
    durationMin: integer("duration_min").notNull().default(25),
    questionCount: integer("question_count").notNull().default(20),
    finalistCount: integer("finalist_count").notNull().default(25),
    /** AZN */
    prizeFund: real("prize_fund").notNull().default(0),
    /** Bu qədər qeydiyyat olarsa, 1-ci yerin mükafatı boostFirstPrize-a qalxır. */
    boostThreshold: integer("boost_threshold"),
    boostFirstPrize: real("boost_first_prize"),
    status: text("status", { enum: CONTEST_STATUSES }).notNull().default("draft"),
    /** Final: tarix (boşdursa — "Tarix elan olunacaq") və məkan (admin daxil edir). */
    finalAt: integer("final_at", { mode: "timestamp_ms" }),
    finalPlace: text("final_place"),
    awardsAt: integer("awards_at", { mode: "timestamp_ms" }),
    resultsComputedAt: integer("results_computed_at", { mode: "timestamp_ms" }),
    createdAt: createdAt(),
  },
  (t) => [uniqueIndex("contests_slug_uq").on(t.slug)],
);

/** Mükafatlar: yer aralığı (1, 2, 3, 4–10) və təsviri. */
export const contestPrizes = sqliteTable("contest_prizes", {
  id: integer("id").primaryKey({ autoIncrement: true }),
  contestId: text("contest_id")
    .notNull()
    .references(() => contests.id, { onDelete: "cascade" }),
  placeFrom: integer("place_from").notNull(),
  placeTo: integer("place_to").notNull(),
  /** AZN (pul mükafatı yoxdursa — null). */
  amount: real("amount"),
  description: text("description").notNull(),
});

/** Qeydiyyat: bir istifadəçi bir yarışa bir dəfə. Dəvət kodu yalnız statistika və fond üçün. */
export const contestRegistrations = sqliteTable(
  "contest_registrations",
  {
    id: text("id").primaryKey(),
    contestId: text("contest_id")
      .notNull()
      .references(() => contests.id, { onDelete: "cascade" }),
    userId: text("user_id")
      .notNull()
      .references(() => users.id, { onDelete: "cascade" }),
    firstName: text("first_name").notNull(),
    lastName: text("last_name").notNull(),
    grade: integer("grade").notNull(),
    region: text("region").notNull(),
    school: text("school"),
    email: text("email").notNull(),
    inviteCode: text("invite_code").notNull(),
    invitedByCode: text("invited_by_code"),
    invitedById: text("invited_by_id"),
    agreeRules: integer("agree_rules", { mode: "boolean" }).notNull(),
    agreeParent: integer("agree_parent", { mode: "boolean" }).notNull(),
    agreeEmail: integer("agree_email", { mode: "boolean" }).notNull(),
    unsubscribedAt: integer("unsubscribed_at", { mode: "timestamp_ms" }),
    /** passive — admin deaktiv edib: tura girə bilmir, sayda, reytinqdə və məktublarda yoxdur. */
    status: text("status", { enum: ACCOUNT_STATUSES }).notNull().default("active"),
    createdAt: createdAt(),
  },
  (t) => [
    uniqueIndex("contest_reg_user_uq").on(t.contestId, t.userId),
    uniqueIndex("contest_reg_code_uq").on(t.inviteCode),
    index("contest_reg_contest_idx").on(t.contestId, t.createdAt),
  ],
);

/**
 * Sual şablonu: mətndə [[a]], [[=a*b]] dəyişənləri; vars — {"a":[min,max,addım]}; şərt və cavab — ifadə
 * (lib/contest/expr.ts); distractors — 4 yanlış variantın ifadəsi; solution — həll (dəyişənlərlə).
 */
export const contestTemplates = sqliteTable(
  "contest_templates",
  {
    id: integer("id").primaryKey({ autoIncrement: true }),
    contestId: text("contest_id")
      .notNull()
      .references(() => contests.id, { onDelete: "cascade" }),
    n: integer("n").notNull(),
    /** bank — sual bankından (mövzunun qapalı sualları, iştirakçıya təsadüfi biri); formula — şablon və düstur. */
    source: text("source", { enum: ["bank", "formula"] }).notNull().default("formula"),
    topicId: integer("topic_id").references(() => topics.id),
    body: text("body").notNull(),
    /** JSON: {"a":[1,9,1]} */
    vars: text("vars").notNull(),
    condition: text("condition"),
    answer: text("answer").notNull(),
    /** JSON: ["a+b", …] */
    distractors: text("distractors").notNull(),
    solution: text("solution").notNull().default(""),
    timeSec: integer("time_sec").notNull().default(75),
  },
  (t) => [uniqueIndex("contest_templates_n_uq").on(t.contestId, t.n)],
);

/** İştirakçının variantı: konkret rəqəmlər, variantlar və düzgün cavab (yalnız serverdə). */
export const contestVariants = sqliteTable(
  "contest_variants",
  {
    registrationId: text("registration_id")
      .notNull()
      .references(() => contestRegistrations.id, { onDelete: "cascade" }),
    n: integer("n").notNull(),
    templateId: integer("template_id").notNull(),
    /** JSON: {"a":12} */
    values: text("values").notNull(),
    text: text("text").notNull(),
    /** JSON: {"A":"12",…} */
    options: text("options").notNull(),
    correct: text("correct").notNull(),
    timeSec: integer("time_sec").notNull(),
    /** Bankdan götürülən sualın kodu, şəkli və həlli (tur bitəndən sonra göstərilir). */
    taskCode: text("task_code"),
    imageUrl: text("image_url"),
    imageAlt: text("image_alt"),
    solution: text("solution"),
  },
  (t) => [primaryKey({ columns: [t.registrationId, t.n] })],
);

/** Onlayn turun gedişi — server vaxtı ilə; sayğac dayanmır. */
export const contestAttempts = sqliteTable("contest_attempts", {
  registrationId: text("registration_id")
    .primaryKey()
    .references(() => contestRegistrations.id, { onDelete: "cascade" }),
  startedAt: integer("started_at", { mode: "timestamp_ms" }).notNull(),
  /** Cari sual (1-dən); finishedAt varsa — bitib. */
  currentN: integer("current_n").notNull().default(1),
  currentStartedAt: integer("current_started_at", { mode: "timestamp_ms" }).notNull(),
  finishedAt: integer("finished_at", { mode: "timestamp_ms" }),
});

export const contestAnswers = sqliteTable(
  "contest_answers",
  {
    registrationId: text("registration_id")
      .notNull()
      .references(() => contestRegistrations.id, { onDelete: "cascade" }),
    n: integer("n").notNull(),
    /** Seçilmiş hərf; vaxtı bitib — null. */
    given: text("given"),
    correct: integer("correct", { mode: "boolean" }).notNull(),
    answeredAt: integer("answered_at", { mode: "timestamp_ms" }).notNull(),
    timeMs: integer("time_ms").notNull(),
  },
  (t) => [primaryKey({ columns: [t.registrationId, t.n] })],
);

export const CONTEST_EVENT_KINDS = ["tab_hidden", "window_blur", "offline", "online", "copy", "context_menu"] as const;
export type ContestEventKind = (typeof CONTEST_EVENT_KINDS)[number];

/** Hadisə jurnalı: tab dəyişmə, pəncərədən çıxma, bağlantı — admin yoxlaması üçün siqnal. */
export const contestEvents = sqliteTable(
  "contest_events",
  {
    id: integer("id").primaryKey({ autoIncrement: true }),
    registrationId: text("registration_id")
      .notNull()
      .references(() => contestRegistrations.id, { onDelete: "cascade" }),
    kind: text("kind", { enum: CONTEST_EVENT_KINDS }).notNull(),
    n: integer("n"),
    at: integer("at", { mode: "timestamp_ms" }).notNull(),
  },
  (t) => [index("contest_events_reg_idx").on(t.registrationId, t.at)],
);

/** Nəticə: onlayn tur (bal, vaxt, yer, finalçı), final (iştirak, bal, yer), diskvalifikasiya, mükafatın ödənişi. */
export const contestResults = sqliteTable(
  "contest_results",
  {
    registrationId: text("registration_id")
      .primaryKey()
      .references(() => contestRegistrations.id, { onDelete: "cascade" }),
    contestId: text("contest_id")
      .notNull()
      .references(() => contests.id, { onDelete: "cascade" }),
    score: integer("score").notNull(),
    totalMs: integer("total_ms").notNull(),
    place: integer("place"),
    finalist: integer("finalist", { mode: "boolean" }).notNull().default(false),
    finalAttended: integer("final_attended", { mode: "boolean" }),
    finalScore: real("final_score"),
    finalPlace: integer("final_place"),
    disqualified: integer("disqualified", { mode: "boolean" }).notNull().default(false),
    dqReason: text("dq_reason"),
    /** parent_account (valideynin hesabı) | cash (nağd) */
    prizeMethod: text("prize_method"),
    /** pending | paid */
    prizeStatus: text("prize_status"),
  },
  (t) => [index("contest_results_contest_idx").on(t.contestId, t.place)],
);

export const CONTEST_EMAIL_KINDS = ["confirm", "reminder", "result", "finalist", "final"] as const;
export type ContestEmailKind = (typeof CONTEST_EMAIL_KINDS)[number];

/* ---------------- Müəllim paneli ---------------- */

export const TEACHER_APP_STATUSES = ["pending", "approved", "rejected"] as const;

/** Müəllim müraciəti: admin təsdiqləyəndə istifadəçinin rolu "teacher" olur. */
export const teacherApplications = sqliteTable("teacher_applications", {
  userId: text("user_id")
    .primaryKey()
    .references(() => users.id, { onDelete: "cascade" }),
  school: text("school").notNull(),
  note: text("note"),
  status: text("status", { enum: TEACHER_APP_STATUSES }).notNull().default("pending"),
  adminNote: text("admin_note"),
  createdAt: createdAt(),
  decidedAt: integer("decided_at", { mode: "timestamp_ms" }),
});

/** Müəllim hesabı: balans (AZN) və gündəlik sınaq limiti (sual bankının kütləvi çıxarılmasının qarşısı). */
export const teacherAccounts = sqliteTable("teacher_accounts", {
  userId: text("user_id")
    .primaryKey()
    .references(() => users.id, { onDelete: "cascade" }),
  balance: real("balance").notNull().default(0),
  dailyLimit: integer("daily_limit").notNull().default(10),
  createdAt: createdAt(),
});

export const BALANCE_TX_KINDS = ["topup", "charge", "refund", "bonus", "adjust"] as const;

/** Balans tarixçəsi: artırma, onlayn sınaq üçün tutulma, geri qaytarma, admin əməliyyatı. */
export const teacherBalanceTx = sqliteTable(
  "teacher_balance_tx",
  {
    id: integer("id").primaryKey({ autoIncrement: true }),
    teacherId: text("teacher_id")
      .notNull()
      .references(() => users.id, { onDelete: "cascade" }),
    amount: real("amount").notNull(),
    kind: text("kind", { enum: BALANCE_TX_KINDS }).notNull(),
    testId: text("test_id"),
    note: text("note"),
    createdAt: createdAt(),
  },
  (t) => [index("teacher_balance_tx_idx").on(t.teacherId, t.createdAt)],
);

/** Qrup: ad və unikal qoşulma kodu (şagird özü qoşulur). İmtahan növü sınaqda seçilir. */
export const teacherGroups = sqliteTable(
  "teacher_groups",
  {
    id: text("id").primaryKey(),
    teacherId: text("teacher_id")
      .notNull()
      .references(() => users.id, { onDelete: "cascade" }),
    name: text("name").notNull(),
    code: text("code").notNull(),
    createdAt: createdAt(),
  },
  (t) => [uniqueIndex("teacher_groups_code_uq").on(t.code), index("teacher_groups_teacher_idx").on(t.teacherId)],
);

/** Qrupun üzvləri; leftAt — qrupdan çıxıb (yeni sınaqlara düşmür, müəllim yeni nəticələrini görmür). */
export const teacherGroupMembers = sqliteTable(
  "teacher_group_members",
  {
    groupId: text("group_id")
      .notNull()
      .references(() => teacherGroups.id, { onDelete: "cascade" }),
    userId: text("user_id")
      .notNull()
      .references(() => users.id, { onDelete: "cascade" }),
    joinedAt: integer("joined_at", { mode: "timestamp_ms" }).notNull(),
    leftAt: integer("left_at", { mode: "timestamp_ms" }),
  },
  (t) => [primaryKey({ columns: [t.groupId, t.userId] }), index("teacher_group_members_user_idx").on(t.userId)],
);

/**
 * Müəllim sınağı: kağız və ya onlayn (sınaq başına qiymət — exam_kinds.teacher_paper_price / teacher_price). Suallar bazadan,
 * imtahan növünün strukturu ilə; mövzu sınağı — seçilmiş mövzudan 15 / 20 / 25 sual. Bir və ya bir neçə qrupa bağlanır.
 * opensAt — onlayn sınağın açılma anı (24 saat açıq qalır); kağızda — sınağın tarixi.
 */
export const teacherTests = sqliteTable(
  "teacher_tests",
  {
    id: text("id").primaryKey(),
    teacherId: text("teacher_id")
      .notNull()
      .references(() => users.id, { onDelete: "cascade" }),
    number: integer("number").notNull(),
    examKind: text("exam_kind").notNull(),
    /** Mövzu sınağı: mövzu. */
    topicId: integer("topic_id").references(() => topics.id),
    mode: text("mode", { enum: ["paper", "online"] }).notNull(),
    opensAt: integer("opens_at", { mode: "timestamp_ms" }).notNull(),
    durationMin: integer("duration_min").notNull(),
    shuffle: integer("shuffle", { mode: "boolean" }).notNull().default(true),
    noRepeat: integer("no_repeat", { mode: "boolean" }).notNull().default(true),
    /** Bazada yeni sual qalmayıb — köhnə istifadə olunmuş suallar götürülüb (müəllimə xəbərdarlıq). */
    reused: integer("reused").notNull().default(0),
    /** Onlayn: tutulan məbləğ; geri qaytarma bir dəfə. */
    charged: real("charged").notNull().default(0),
    refundedAt: integer("refunded_at", { mode: "timestamp_ms" }),
    /** Kağız: nəticələr yadda saxlanıb. */
    resultsAt: integer("results_at", { mode: "timestamp_ms" }),
    createdAt: createdAt(),
  },
  (t) => [index("teacher_tests_teacher_idx").on(t.teacherId, t.createdAt)],
);

/** Sınağın qrupları (bir sınaq bir neçə qrupa bağlana bilər). */
export const teacherTestGroups = sqliteTable(
  "teacher_test_groups",
  {
    testId: text("test_id")
      .notNull()
      .references(() => teacherTests.id, { onDelete: "cascade" }),
    groupId: text("group_id")
      .notNull()
      .references(() => teacherGroups.id, { onDelete: "cascade" }),
  },
  (t) => [primaryKey({ columns: [t.testId, t.groupId] }), index("teacher_test_groups_group_idx").on(t.groupId)],
);

/** Sınağın sualları (əsas sıra) — nəticələr və analitika bura bağlanır. */
export const teacherTestItems = sqliteTable(
  "teacher_test_items",
  {
    testId: text("test_id")
      .notNull()
      .references(() => teacherTests.id, { onDelete: "cascade" }),
    n: integer("n").notNull(),
    taskCode: text("task_code").notNull(),
    format: text("format", { enum: EXAM_ITEM_FORMATS }).notNull(),
  },
  (t) => [primaryKey({ columns: [t.testId, t.n] })],
);

/**
 * Şagirdin variantı: hərf, sualların sırası (göstərilən yer → əsas n) və qapalı sualların variant xəritəsi
 * (göstərilən hərf → orijinal hərf). Kitabça, cavab kartı, açar və yoxlama buna görədir.
 */
export const teacherTestVariants = sqliteTable(
  "teacher_test_variants",
  {
    testId: text("test_id")
      .notNull()
      .references(() => teacherTests.id, { onDelete: "cascade" }),
    userId: text("user_id")
      .notNull()
      .references(() => users.id, { onDelete: "cascade" }),
    letter: text("letter").notNull(),
    /** JSON: [3, 1, 2, …] — göstərilən i-ci sual = əsas n */
    order: text("order").notNull(),
    /** JSON: {"3": {"A":"C",…}} */
    maps: text("maps").notNull(),
  },
  (t) => [primaryKey({ columns: [t.testId, t.userId] })],
);

/** Cavablar (əsas n üzrə): verilən cavab və bal (qapalı/kodlaşdırılan — avtomatik 0/1, yazılı — müəllim 0/0,5/1). */
export const teacherTestAnswers = sqliteTable(
  "teacher_test_answers",
  {
    testId: text("test_id")
      .notNull()
      .references(() => teacherTests.id, { onDelete: "cascade" }),
    userId: text("user_id")
      .notNull()
      .references(() => users.id, { onDelete: "cascade" }),
    n: integer("n").notNull(),
    /** Qapalı: orijinal hərf; kodlaşdırılan: ədəd; yazılı: mətn (onlayn) və ya boş. */
    given: text("given"),
    score: real("score"),
    updatedAt: integer("updated_at", { mode: "timestamp_ms" }).notNull(),
  },
  (t) => [primaryKey({ columns: [t.testId, t.userId, t.n] })],
);

/** Onlayn sınağın gedişi: vaxt serverdə, dayanmır. */
export const teacherTestAttempts = sqliteTable(
  "teacher_test_attempts",
  {
    testId: text("test_id")
      .notNull()
      .references(() => teacherTests.id, { onDelete: "cascade" }),
    userId: text("user_id")
      .notNull()
      .references(() => users.id, { onDelete: "cascade" }),
    startedAt: integer("started_at", { mode: "timestamp_ms" }).notNull(),
    finishedAt: integer("finished_at", { mode: "timestamp_ms" }),
  },
  (t) => [primaryKey({ columns: [t.testId, t.userId] })],
);

export const teacherTestEvents = sqliteTable(
  "teacher_test_events",
  {
    id: integer("id").primaryKey({ autoIncrement: true }),
    testId: text("test_id")
      .notNull()
      .references(() => teacherTests.id, { onDelete: "cascade" }),
    userId: text("user_id")
      .notNull()
      .references(() => users.id, { onDelete: "cascade" }),
    kind: text("kind", { enum: CONTEST_EVENT_KINDS }).notNull(),
    at: integer("at", { mode: "timestamp_ms" }).notNull(),
  },
  (t) => [index("teacher_test_events_idx").on(t.testId, t.userId)],
);

/** Valideyn hesabatı: təxmin edilə bilməyən link (id), 30 gün etibarlı; məlumat yaradılan anda saxlanılır. */
export const teacherReports = sqliteTable(
  "teacher_reports",
  {
    id: text("id").primaryKey(),
    teacherId: text("teacher_id")
      .notNull()
      .references(() => users.id, { onDelete: "cascade" }),
    userId: text("user_id")
      .notNull()
      .references(() => users.id, { onDelete: "cascade" }),
    month: text("month").notNull(),
    note: text("note"),
    /** JSON — hesabatın məlumatı (yaradılan an). */
    data: text("data").notNull(),
    createdAt: createdAt(),
    expiresAt: integer("expires_at", { mode: "timestamp_ms" }).notNull(),
  },
  (t) => [index("teacher_reports_teacher_idx").on(t.teacherId)],
);

/** Göndərilmiş e-poçtlar (təkrar göndərilməsin; admin əl ilə yenidən göndərə bilər). */
export const contestEmails = sqliteTable(
  "contest_emails",
  {
    id: integer("id").primaryKey({ autoIncrement: true }),
    registrationId: text("registration_id")
      .notNull()
      .references(() => contestRegistrations.id, { onDelete: "cascade" }),
    kind: text("kind", { enum: CONTEST_EMAIL_KINDS }).notNull(),
    sentAt: integer("sent_at", { mode: "timestamp_ms" }).notNull(),
  },
  (t) => [index("contest_emails_reg_idx").on(t.registrationId, t.kind)],
);

export const WAITLIST_ROLES = ["sagird", "muellim", "valideyn"] as const;

/** Açılışa qədər gözləmə siyahısı (production-da yalnız ana səhifə açıqdır). E-poçt unikaldır. */
export const waitlist = sqliteTable("waitlist", {
  email: text("email").primaryKey(),
  name: text("name").notNull(),
  role: text("role", { enum: WAITLIST_ROLES }).notNull(),
  grade: text("grade"),
  consent: integer("consent", { mode: "boolean" }).notNull(),
  createdAt: createdAt(),
});

/* ---------------- İmtahan tarixləri (geri sayım) ---------------- */

export const EXAM_DATE_TYPES = ["buraxilis_9", "buraxilis_11", "blok"] as const;
export type ExamDateType = (typeof EXAM_DATE_TYPES)[number];

/**
 * DİM imtahan tarixləri — ana səhifədəki və paneldəki geri sayım üçün. Admin paneldən daxil edilir
 * (DİM rəsmi tarixi elan edəndə yenilənir). Vaxt Asia/Baku (UTC+4) ilə daxil edilir, UTC ms saxlanılır.
 */
export const examDates = sqliteTable(
  "exam_dates",
  {
    id: text("id")
      .primaryKey()
      .$defaultFn(() => crypto.randomUUID()),
    examType: text("exam_type", { enum: EXAM_DATE_TYPES }).notNull(),
    title: text("title").notNull(),
    examDate: integer("exam_date", { mode: "timestamp_ms" }).notNull(),
    /** Rəsmi elan olunmayıb — keçən ilə görə təxmini tarix. */
    isEstimated: integer("is_estimated", { mode: "boolean" }).notNull().default(false),
    isActive: integer("is_active", { mode: "boolean" }).notNull().default(true),
    createdAt: createdAt(),
    updatedAt: integer("updated_at", { mode: "timestamp_ms" })
      .notNull()
      .$defaultFn(() => new Date())
      .$onUpdateFn(() => new Date()),
  },
  (t) => [index("exam_dates_type_idx").on(t.examType, t.isActive)],
);