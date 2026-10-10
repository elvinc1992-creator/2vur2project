"use client";

import { useRouter } from "next/navigation";
import { useEffect, useMemo, useRef, useState, useSyncExternalStore, useTransition, type KeyboardEvent } from "react";
import { ArrowIcon, BackIcon, CheckIcon, ClockIcon, CloseIcon, FlagIcon, GridIcon, ListIcon } from "@/components/icons";
import { Alert } from "@/components/ui/alert";
import { AnswerOptions } from "@/components/ui/answer-options";
import { Button, ButtonLink } from "@/components/ui/button";
import { Card, Tag, h3Class } from "@/components/ui/display";
import { Dialog } from "@/components/ui/dialog";
import { EmptyState } from "@/components/ui/empty-art";
import { answerHeadClass, QuestionCard } from "@/components/ui/question";
import { az } from "@/content/az";
import { finishExamAction } from "@/lib/demo/actions";
import { examApi } from "@/lib/demo/exam-api";
import type { TickResult } from "@/lib/demo/exam-session";
import { HEARTBEAT_MS } from "@/lib/demo/timer";
import { CODE_LEN, LETTERS, type Letter } from "@/lib/demo/content";
import type { ExamMeta, ExamQuestion } from "@/lib/exams/types";
import { cn } from "@/lib/cn";

const t = az.app.exam;
const WARN_MS = 10 * 60_000;
const DANGER_MS = 5 * 60_000;
const WRITTEN_MAX = 2000;

type Stage = "normal" | "warn" | "danger";
const stageOf = (left: number | null): Stage =>
  left === null || left > WARN_MS ? "normal" : left > DANGER_MS ? "warn" : "danger";

type Props = {
  exam: ExamMeta;
  questions: ExamQuestion[];
  initialAnswers: Record<string, string>;
  initialFlags: number[];
  /** Server hesabı: qalan aktiv vaxt (fasilədədir; səhifə açılanda gedir). */
  remaining: number;
  /** Cavab kartının başlığı üçün. */
  studentName: string;
  today: string;
};

const writtenKey = (examId: string, n: number) => `exam:${examId}:w:${n}`;

function fmt(ms: number) {
  const s = Math.max(0, Math.ceil(ms / 1000));
  const h = Math.floor(s / 3600);
  const m = Math.floor((s % 3600) / 60);
  const sec = s % 60;
  const mm = String(m).padStart(2, "0");
  const ss = String(sec).padStart(2, "0");
  return h ? `${h}:${mm}:${ss}` : `${mm}:${ss}`;
}

export function ExamRunner({ exam, questions, initialAnswers, initialFlags, remaining, studentName, today }: Props) {
  const router = useRouter();
  const total = questions.length;
  /** İmtahan kitabçasındakı son nömrə (9-cu sinif: 85) — "Sual 61 / 85". */
  const lastN = questions[questions.length - 1]?.n ?? total;
  const [current, setCurrent] = useState(() => {
    const firstEmpty = questions.findIndex((q) => !initialAnswers[q.n]);
    return firstEmpty >= 0 ? firstEmpty : 0;
  });
  const [answers, setAnswers] = useState(initialAnswers);
  const [flags, setFlags] = useState(() => new Set(initialFlags));
  const [view, setView] = useState<"question" | "sheet">("question");
  const [navOpen, setNavOpen] = useState(false);
  const [finishOpen, setFinishOpen] = useState(false);
  const [saveError, setSaveError] = useState(false);
  const [timedOut, setTimedOut] = useState<number | null>(null);
  const [finishing, startFinish] = useTransition();
  // Sayğac: işləyəndə deadline-a qədər; fasilədə pausedLeft göstərilir.
  const [running, setRunning] = useState(false);
  const [deadline, setDeadline] = useState<number | null>(null);
  const [pausedLeft, setPausedLeft] = useState(remaining);
  const [now, setNow] = useState(() => Date.now());
  const deadlineRef = useRef<number | null>(null);
  const [initialStage] = useState(() => stageOf(remaining));
  const debounce = useRef<Record<number, ReturnType<typeof setTimeout>>>({});
  // Hər suala sərf olunan vaxt (ms): sual ekranda olduğu müddət yığılır (zəif mövzuların təhlili üçün).
  const spent = useRef<Record<number, number>>({});
  const shown = useRef<{ n: number; at: number } | null>(null);
  const finished = useRef(false);

  const q = questions[current];
  const answeredCount = Object.keys(answers).length;
  const left = running && deadline !== null ? Math.max(0, deadline - now) : pausedLeft;
  const stage = stageOf(left);
  // Yalnız 10 və 5 dəqiqə anlarında elan edirik (səhifə açılanda yox).
  const liveText = stage !== initialStage ? (stage === "warn" ? t.warn10 : stage === "danger" ? t.warn5 : "") : "";

  // Vaxt yalnız səhifə açıq və görünən olanda gedir: açılış/görünmə → tick, gizlənmə/çıxış → pause.
  useEffect(() => {
    let alive = true;
    const expire = (answered: number) => {
      finished.current = true;
      setTimedOut(answered);
    };
    const apply = (r: TickResult | null) => {
      if (!alive || !r) return;
      if (r.expired) return expire(r.answered);
      const d = Date.now() + r.remaining;
      deadlineRef.current = d;
      setDeadline(d);
      setNow(Date.now());
      setRunning(true);
    };
    const tick = () => {
      if (!finished.current) examApi.tick(exam.id).then(apply, () => {});
    };
    const pause = () => {
      if (finished.current) return;
      if (deadlineRef.current !== null) setPausedLeft(Math.max(0, deadlineRef.current - Date.now()));
      setRunning(false);
      examApi.pause(exam.id).then((r) => alive && r?.expired && expire(r.answered), () => {});
    };
    const onVisibility = () => (document.visibilityState === "visible" ? tick() : pause());
    const onPageHide = () => {
      if (!finished.current) examApi.beaconPause(exam.id);
    };

    if (document.visibilityState === "visible") tick();
    const heartbeat = setInterval(() => document.visibilityState === "visible" && tick(), HEARTBEAT_MS);
    document.addEventListener("visibilitychange", onVisibility);
    window.addEventListener("pagehide", onPageHide);
    return () => {
      alive = false;
      clearInterval(heartbeat);
      document.removeEventListener("visibilitychange", onVisibility);
      window.removeEventListener("pagehide", onPageHide);
      // Tətbiq daxilində başqa səhifəyə keçid — sayğac dayanır.
      if (!finished.current) examApi.pause(exam.id).catch(() => {});
    };
  }, [exam.id]);

  useEffect(() => {
    const timer = setInterval(() => setNow(Date.now()), 1000);
    return () => clearInterval(timer);
  }, []);

  // Səhifədə vaxt bitdi — cavablar avtomatik göndərilir, sınaq bağlanır.
  useEffect(() => {
    if (!running || left !== 0 || finished.current) return;
    finished.current = true;
    examApi.timeout(exam.id).then((r) => setTimedOut(r.answered), () => setTimedOut(answeredCount));
  }, [running, left, exam.id, answeredCount]);

  // Sual ekrandan gedəndə onun vaxtı yığılır.
  const shownN = view === "question" ? q.n : null;
  useEffect(() => {
    if (shownN === null) return;
    const totals = spent.current;
    shown.current = { n: shownN, at: Date.now() };
    return () => {
      const s = shown.current;
      if (s) totals[s.n] = (totals[s.n] ?? 0) + (Date.now() - s.at);
      shown.current = null;
    };
  }, [shownN]);
  const spentOn = (n: number) => {
    const s = shown.current;
    return Math.round((spent.current[n] ?? 0) + (s && s.n === n ? Date.now() - s.at : 0));
  };

  /** Optimist yeniləmə + debounce ilə serverə yazma. Server cavab verəndə resolve olur. */
  const save = (n: number, value: string, delay = 0) => {
    setAnswers((prev) => {
      const next = { ...prev };
      if (value) next[n] = value;
      else delete next[n];
      return next;
    });
    clearTimeout(debounce.current[n]);
    return new Promise<boolean>((resolve) => {
      debounce.current[n] = setTimeout(async () => {
        const res: { ok: boolean; expired?: boolean; answered?: number } = await examApi
          .save(exam.id, n, value, spentOn(n))
          .catch(() => ({ ok: false }));
        if (res.expired && !finished.current) {
          finished.current = true;
          setTimedOut(res.answered ?? 0);
        }
        setSaveError(!res.ok && !res.expired);
        resolve(res.ok);
      }, delay);
    });
  };

  const toggleFlag = (n: number) => {
    setFlags((prev) => {
      const next = new Set(prev);
      if (next.has(n)) next.delete(n);
      else next.add(n);
      return next;
    });
    examApi.flag(exam.id, n).catch(() => setSaveError(true));
  };

  const go = (idx: number) => {
    setCurrent(Math.max(0, Math.min(total - 1, idx)));
    setView("question");
    setNavOpen(false);
    window.scrollTo({ top: 0 });
  };

  const finish = () =>
    startFinish(async () => {
      finished.current = true;
      await finishExamAction(exam.id);
      router.push(`/sinaq/${exam.id}/netice`);
    });

  if (timedOut !== null) {
    return (
      <main className="mx-auto grid w-full max-w-[520px] content-start gap-4 px-4 py-10">
        <EmptyState tone="warning" icon={<ClockIcon />} title={t.timeoutTitle}>
          {t.timeoutText(timedOut)}
        </EmptyState>
        <ButtonLink href={`/sinaq/${exam.id}/netice`} block>
          {t.toResult}
        </ButtonLink>
        <ButtonLink href="/panel" variant="ghost" block>
          {t.toPanel}
        </ButtonLink>
      </main>
    );
  }

  const emptyCount = total - answeredCount;

  return (
    <>
      <div className="sticky top-0 z-10 flex min-h-16 flex-wrap items-center justify-between gap-3 border-b border-line bg-white px-4 py-3 lg:px-8">
        <div>
          <h1 className="text-small font-normal text-ink-muted">{exam.title}</h1>
          <b className="text-navy-900 tabular">{t.question(q.n, lastN)}</b>
        </div>
        <div className="flex items-center gap-2">
          <span
            role="timer"
            aria-label={left === null ? undefined : t.timerLabel(Math.floor(left / 60000), Math.floor((left % 60000) / 1000))}
            className={cn(
              "inline-flex min-h-11 items-center gap-2 rounded-[12px] px-3.5 font-display text-lg leading-none font-extrabold tabular",
              stage === "normal" && "bg-navy-900 text-white",
              stage === "warn" && "bg-warning-100 text-warning-700 ring-1 ring-warning-700 ring-inset",
              stage === "danger" && "bg-danger-700 text-white",
            )}
          >
            <ClockIcon className="size-5" />
            {left === null ? "--:--" : fmt(left)}
          </span>
          <span className="sr-only" aria-live="polite">
            {liveText}
          </span>
          <Button type="button" variant="secondary" size="sm" onClick={() => setFinishOpen(true)}>
            {t.finish}
          </Button>
        </div>
      </div>

      <main className="px-4 pt-5 pb-8 lg:p-8">
        <div className="grid items-start gap-6 lg:grid-cols-[minmax(0,760px)_320px] lg:justify-center">
          <div className="grid min-w-0 gap-4">
            {saveError && <Alert tone="danger">{t.saveError}</Alert>}
            {view === "question" ? (
              <ExamQuestionView
                key={q.n}
                examId={exam.id}
                total={lastN}
                q={q}
                value={answers[q.n] ?? ""}
                flagged={flags.has(q.n)}
                onAnswer={save}
                onFlag={() => toggleFlag(q.n)}
              />
            ) : (
              <AnswerSheet
                exam={exam}
                studentName={studentName}
                today={today}
                questions={questions}
                answers={answers}
                flags={flags}
                onFlag={toggleFlag}
                onPick={(n, v, delay) => save(n, v, delay)}
                onGo={(idx) => go(idx)}
                onFinish={() => setFinishOpen(true)}
              />
            )}

            <div className="flex gap-3 lg:hidden">
              <Button type="button" variant="secondary" className="flex-1" onClick={() => setNavOpen(true)}>
                <GridIcon />
                {t.questionsBtn(answeredCount, total)}
              </Button>
              <Button type="button" variant="ghost" onClick={() => setView(view === "sheet" ? "question" : "sheet")}>
                <ListIcon />
                {t.sheetBtn}
              </Button>
            </div>
            {view === "question" && (
              <div className="flex flex-wrap items-center justify-between gap-3">
                <Button type="button" variant="secondary" disabled={current === 0} onClick={() => go(current - 1)}>
                  <BackIcon />
                  {t.prev}
                </Button>
                {current < total - 1 ? (
                  <Button type="button" onClick={() => go(current + 1)}>
                    {t.next}
                    <ArrowIcon />
                  </Button>
                ) : (
                  <Button type="button" onClick={() => setView("sheet")}>
                    {t.toSheet}
                    <ArrowIcon />
                  </Button>
                )}
              </div>
            )}
          </div>

          <Card as="aside" aria-label={t.navTitle} className="hidden gap-4 lg:grid">
            <QuestionNav
              questions={questions}
              answers={answers}
              flags={flags}
              current={view === "question" ? current : -1}
              onGo={go}
              onSheet={() => setView("sheet")}
            />
          </Card>
        </div>
      </main>

      <Dialog open={navOpen} onClose={() => setNavOpen(false)} labelledBy="qnav-title">
        <QuestionNav
          titleId="qnav-title"
          questions={questions}
          answers={answers}
          flags={flags}
          current={view === "question" ? current : -1}
          onGo={go}
          onSheet={() => {
            setView("sheet");
            setNavOpen(false);
          }}
        />
      </Dialog>

      <Dialog open={finishOpen} onClose={() => setFinishOpen(false)} labelledBy="finish-title" describedBy="finish-text">
        <h2 id="finish-title" className={h3Class}>
          {t.finishTitle}
        </h2>
        <p id="finish-text" className="text-ink">
          {t.finishText(emptyCount, flags.size)}
        </p>
        <div className="grid gap-3 sm:grid-cols-2">
          <Button type="button" variant="secondary" block disabled={finishing} onClick={() => setFinishOpen(false)}>
            {t.finishCancel}
          </Button>
          <Button type="button" variant="primary" block loading={finishing} onClick={finish}>
            {t.finishConfirm}
          </Button>
        </div>
      </Dialog>
    </>
  );
}

/* ---------------- Sual kartı ---------------- */

function ExamQuestionView({
  examId,
  total,
  q,
  value,
  flagged,
  onAnswer,
  onFlag,
}: {
  examId: string;
  total: number;
  q: ExamQuestion;
  value: string;
  flagged: boolean;
  onAnswer: (n: number, value: string, delay?: number) => Promise<boolean>;
  onFlag: () => void;
}) {
  return (
    <div className="grid gap-4">
      <QuestionCard
        id={`exam-q-${q.n}`}
        n={q.n}
        total={total}
        text={q.text}
        imageUrl={q.imageUrl}
        imageAlt={q.imageAlt}
        qid={q.code}
        aside={
          <>
            <Tag tone={q.format === "coded" ? "coral" : q.format === "written" ? "type" : "topic"}>
              {t.formats[q.format]}
            </Tag>
            <Button type="button" variant="ghost" size="sm" aria-pressed={flagged} onClick={onFlag} className="min-h-10!">
              <FlagIcon className={cn(flagged && "text-coral-600")} />
              {flagged ? t.unflag : t.flag}
            </Button>
          </>
        }
      />
      {q.format === "closed" && q.options && (
        <AnswerOptions
          name={`q-${q.n}`}
          label={t.optionsLabel(q.n)}
          options={q.options}
          value={(value || null) as Letter | null}
          onChange={(l) => onAnswer(q.n, l)}
          onClear={() => onAnswer(q.n, "")}
          clearLabel={t.clearAnswer}
        />
      )}
      {q.format === "coded" && (
        <CodedInput n={q.n} value={value} onChange={(v) => onAnswer(q.n, v, 500)} onClear={() => onAnswer(q.n, "")} />
      )}
      {q.format === "written" && (
        <WrittenInput examId={examId} n={q.n} onChange={(has) => onAnswer(q.n, has ? "w" : "", 500)} />
      )}
    </div>
  );
}

/** İcazə verilən format: əvvəldə "-", rəqəmlər, ən çox bir vergül. */
const CODED_RE = /^-?\d*(,\d*)?$/;

/**
 * Kodlaşdırılan cavab: BİR input (rəqəmsal klaviatura), xanalar yalnız vizualdır.
 * Yapışdırma və Backspace normal işləyir; icazəsiz simvol daxil edilmir və xəta göstərilir.
 */
function CodedInput({
  n,
  value,
  onChange,
  onClear,
}: {
  n: number;
  value: string;
  onChange: (v: string) => void;
  onClear: () => void;
}) {
  const [focused, setFocused] = useState(false);
  const [error, setError] = useState(false);
  const id = `code-${n}`;

  const accept = (raw: string) => {
    const v = raw.replace(/[.]/g, ",").replace(/[−–]/g, "-");
    if (v.length > CODE_LEN || !CODED_RE.test(v)) {
      setError(true);
      return;
    }
    setError(false);
    onChange(v);
  };

  return (
    <div className="grid gap-1.5">
      <label htmlFor={id} className={answerHeadClass}>
        {t.codedLabel}
      </label>
      <div className="relative w-fit">
        <div aria-hidden="true" className="flex gap-1.5">
          {Array.from({ length: CODE_LEN }, (_, i) => (
            <span
              key={i}
              className={cn(
                "grid h-12 w-10 place-items-center rounded-[10px] border-[1.5px] bg-white font-display text-xl font-extrabold text-navy-900 md:w-11",
                error ? "border-danger-700" : "border-control-border",
                focused && i === Math.min(value.length, CODE_LEN - 1) && "border-navy-500 ring-2 ring-navy-500 ring-offset-2",
              )}
            >
              {value[i] ?? ""}
            </span>
          ))}
        </div>
        <input
          id={id}
          inputMode="decimal"
          autoComplete="off"
          maxLength={CODE_LEN}
          value={value}
          aria-label={t.codedAria}
          aria-invalid={error || undefined}
          aria-describedby={error ? `${id}-err ${id}-hint` : `${id}-hint`}
          onFocus={() => setFocused(true)}
          onBlur={() => setFocused(false)}
          onChange={(e) => accept(e.target.value)}
          className="absolute inset-0 h-full w-full cursor-text opacity-0"
        />
      </div>
      {error && (
        <p id={`${id}-err`} role="alert" className="text-small font-medium text-danger-700">
          {t.codedError(CODE_LEN)}
        </p>
      )}
      <p id={`${id}-hint`} className="text-small text-ink-muted">
        {t.codedHint(CODE_LEN)}
      </p>
      {value && (
        <button
          type="button"
          onClick={() => {
            setError(false);
            onClear();
            requestAnimationFrame(() => document.getElementById(id)?.focus());
          }}
          className="inline-flex min-h-11 cursor-pointer items-center gap-2 justify-self-start rounded-[12px] px-3 text-[15px] font-semibold text-navy-900 hover:bg-navy-100"
        >
          <CloseIcon className="size-5" />
          {t.clearAnswer}
        </button>
      )}
    </div>
  );
}

const subscribeStorage = (cb: () => void) => {
  window.addEventListener("storage", cb);
  return () => window.removeEventListener("storage", cb);
};

function readStorage(key: string) {
  try {
    return localStorage.getItem(key);
  } catch {
    return null;
  }
}

/** Yazılı cavab: mətn bu cihazda saxlanılır, serverə "yazılıb" işarəsi gedir. */
function WrittenInput({
  examId,
  n,
  onChange,
}: {
  examId: string;
  n: number;
  onChange: (has: boolean) => Promise<boolean>;
}) {
  const key = writtenKey(examId, n);
  const stored = useSyncExternalStore(subscribeStorage, () => readStorage(key), () => null);
  const [draft, setDraft] = useState<string | null>(null);
  const [status, setStatus] = useState<"idle" | "saving" | "saved">("idle");
  const value = draft ?? stored ?? "";
  const id = `written-${n}`;

  return (
    <div className="grid gap-1.5">
      <label htmlFor={id} className={answerHeadClass}>
        {t.writtenLabel}
      </label>
      <textarea
        id={id}
        rows={6}
        maxLength={WRITTEN_MAX}
        value={value}
        aria-describedby={`${id}-hint ${id}-count`}
        onChange={(e) => {
          const v = e.target.value;
          setDraft(v);
          setStatus("saving");
          try {
            localStorage.setItem(key, v);
          } catch {}
          onChange(v.trim().length > 0).then((ok) => setStatus(ok ? "saved" : "idle"));
        }}
        className="min-h-[140px] w-full rounded-md border-[1.5px] border-control-border bg-white px-4 py-3.5 text-body text-ink focus:border-navy-500 focus-visible:ring-2 focus-visible:ring-navy-500 focus-visible:ring-offset-2 focus-visible:outline-none"
      />
      <div className="flex flex-wrap items-center justify-between gap-2 text-small text-ink-muted">
        <span id={`${id}-count`} className="tabular">
          {t.counter(value.length, WRITTEN_MAX)}
        </span>
        <span role="status" className={cn(status === "saved" && "font-semibold text-success-700")}>
          {status === "saving" ? t.saving : status === "saved" ? t.saved : ""}
        </span>
      </div>
      <p id={`${id}-hint`} className="text-small text-ink-muted">
        {t.writtenHint}
      </p>
    </div>
  );
}

/* ---------------- Naviqasiya və vərəq ---------------- */

/** Sual xanasının vəziyyətləri: rəng + ikon + çərçivə (yalnız rənglə yox). */
function NavCell({
  n,
  answered,
  flagged,
  current,
  onClick,
}: {
  n: number;
  answered: boolean;
  flagged: boolean;
  current: boolean;
  onClick: () => void;
}) {
  return (
    <button
      type="button"
      aria-label={t.navItem(n, answered, flagged)}
      aria-current={current ? "step" : undefined}
      onClick={onClick}
      className={cn(
        "relative min-h-12 cursor-pointer rounded-[12px] text-[15px] font-bold tabular",
        current
          ? "bg-navy-900 text-white ring-2 ring-navy-900 ring-offset-2"
          : answered
            ? "border-[1.5px] border-navy-500 bg-navy-100 text-navy-900"
            : "border-[1.5px] border-control-border bg-white text-navy-900",
      )}
    >
      {n}
      {answered && (
        <CheckIcon
          aria-hidden="true"
          className={cn(
            "absolute size-3.5",
            flagged ? "top-[3px] left-[3px]" : "top-[3px] right-[3px]",
            current ? "text-white" : "text-navy-700",
          )}
        />
      )}
      {flagged && (
        <FlagIcon
          aria-hidden="true"
          className={cn("absolute top-[3px] right-[3px] size-3.5", current ? "text-coral-500" : "text-coral-600")}
        />
      )}
    </button>
  );
}

function Legend() {
  const item = "flex items-center gap-2";
  const box = "relative grid size-5 flex-none place-items-center rounded-[6px]";
  return (
    <ul className="m-0 grid list-none grid-cols-2 gap-2 p-0 text-small text-ink">
      <li className={item}>
        <span aria-hidden="true" className={cn(box, "bg-navy-900 ring-2 ring-navy-900 ring-offset-1")} />
        {t.legend.current}
      </li>
      <li className={item}>
        <span aria-hidden="true" className={cn(box, "border-[1.5px] border-navy-500 bg-navy-100")}>
          <CheckIcon className="size-3.5 text-navy-700" />
        </span>
        {t.legend.answered}
      </li>
      <li className={item}>
        <span aria-hidden="true" className={cn(box, "border-[1.5px] border-control-border bg-white")} />
        {t.legend.empty}
      </li>
      <li className={item}>
        <span aria-hidden="true" className={cn(box, "border-[1.5px] border-control-border bg-white")}>
          <FlagIcon className="size-3.5 text-coral-600" />
        </span>
        {t.legend.flagged}
      </li>
    </ul>
  );
}

function QuestionNav({
  titleId,
  questions,
  answers,
  flags,
  current,
  onGo,
  onSheet,
}: {
  titleId?: string;
  questions: ExamQuestion[];
  answers: Record<string, string>;
  flags: Set<number>;
  current: number;
  onGo: (idx: number) => void;
  onSheet: () => void;
}) {
  return (
    <>
      <h2 id={titleId} className={h3Class}>
        {t.navTitle}
      </h2>
      <div className="grid grid-cols-5 gap-2 p-1">
        {questions.map((q, i) => (
          <NavCell
            key={q.n}
            n={q.n}
            answered={Boolean(answers[q.n])}
            flagged={flags.has(q.n)}
            current={i === current}
            onClick={() => onGo(i)}
          />
        ))}
      </div>
      <Legend />
      <Button type="button" variant="secondary" block onClick={onSheet}>
        {t.sheet}
      </Button>
    </>
  );
}

/* ---------------- Cavab kartı (DİM blankına bənzər) ---------------- */

const card = t.card;
const INK = "border-[#1e2a4a]";
const SHEET_BG =
  "bg-[#fffdf8] bg-[radial-gradient(rgba(200,16,46,.035)_1px,transparent_1px)] bg-[length:14px_14px] shadow-[0_1px_0_#e7dfd2,0_20px_50px_-24px_rgba(30,42,74,.35)]";
const OMR = "pointer-events-none absolute top-6 bottom-6 w-2.5 bg-[repeating-linear-gradient(to_bottom,#111_0_6px,transparent_6px_26px)]";
const CODED_SYMBOLS = ["-", ",", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"] as const;

function SectionTitle({ title, note }: { title: string; note: string }) {
  return (
    <div className="mb-3 flex items-center gap-2.5">
      <h3 className="m-0 rounded-[3px] bg-[#c8102e] px-3 py-1.5 text-[12px] font-extrabold tracking-[0.12em] text-white uppercase">
        {title}
      </h3>
      <span className="text-[12.5px] font-semibold text-ink-muted">{note}</span>
      <span aria-hidden="true" className="h-[1.5px] flex-1 bg-[#d9cfc0]" />
    </div>
  );
}

/** Qapalı sual sətri: dairələr (roving tabindex + ox düymələri) və işarə bayrağı. */
function SheetRow({
  n,
  total,
  value,
  flagged,
  onPick,
  onClear,
  onFlag,
  onGo,
}: {
  n: number;
  total: number;
  value: string | undefined;
  flagged: boolean;
  onPick: (l: Letter) => void;
  onClear: () => void;
  onFlag: () => void;
  onGo: () => void;
}) {
  const refs = useRef<Array<HTMLButtonElement | null>>([]);
  const active = Math.max(0, LETTERS.indexOf((value ?? "A") as Letter));
  const onKey = (e: KeyboardEvent<HTMLButtonElement>, i: number) => {
    const delta =
      e.key === "ArrowRight" || e.key === "ArrowDown" ? 1 : e.key === "ArrowLeft" || e.key === "ArrowUp" ? -1 : 0;
    if ((e.key === "Delete" || e.key === "Backspace") && value) {
      e.preventDefault();
      onClear();
      return;
    }
    if (!delta) return;
    e.preventDefault();
    const next = (i + delta + LETTERS.length) % LETTERS.length;
    onPick(LETTERS[next]);
    refs.current[next]?.focus();
  };
  return (
    <div className="flex items-center gap-2 rounded-[6px] px-2 py-1 odd:bg-[rgba(200,16,46,.035)]">
      <button
        type="button"
        onClick={onGo}
        aria-label={t.question(n, total)}
        className="min-h-8 w-8 cursor-pointer text-left font-mono text-[15px] font-bold text-[#1e2a4a] underline-offset-3 hover:underline"
      >
        {n}
      </button>
      <div role="radiogroup" aria-label={t.sheetRow(n)} className="flex gap-1.5">
        {LETTERS.map((l, i) => {
          const on = value === l;
          return (
            <button
              key={l}
              ref={(el) => {
                refs.current[i] = el;
              }}
              type="button"
              role="radio"
              aria-checked={on}
              aria-label={t.circleLabel(l, on)}
              aria-describedby="sheet-hint"
              tabIndex={i === active ? 0 : -1}
              onClick={() => (on ? onClear() : onPick(l))}
              onKeyDown={(e) => onKey(e, i)}
              className={cn(
                "grid size-8 cursor-pointer place-items-center rounded-full border-[1.6px] text-[12.5px] font-bold transition-[transform,background-color] duration-150",
                on
                  ? "animate-[pop_.22s] border-[#111827] bg-[#111827] text-[#111827]"
                  : cn(INK, "text-[#1e2a4a] hover:scale-110 hover:bg-[#fdecee]"),
              )}
            >
              {l}
            </button>
          );
        })}
      </div>
      <button
        type="button"
        aria-pressed={flagged}
        aria-label={card.flagRow(n, flagged)}
        onClick={onFlag}
        className={cn(
          "ml-auto grid size-8 cursor-pointer place-items-center rounded-full transition-opacity hover:opacity-100",
          flagged ? "text-coral-600 opacity-100" : "text-ink-muted opacity-40",
        )}
      >
        <FlagIcon className="size-4" />
      </button>
    </div>
  );
}

/** Kodlaşdırılan: 6 xana + hər xananın altında simvol dairələri (-, vergül, 0–9). */
function CodedBlock({
  n,
  total,
  value,
  onChange,
  onGo,
}: {
  n: number;
  total: number;
  value: string;
  onChange: (v: string) => void;
  onGo: () => void;
}) {
  const [error, setError] = useState(false);
  const cells = Array.from({ length: CODE_LEN }, (_, i) => value[i] ?? "");
  const set = (col: number, s: string) => {
    const next = [...cells];
    next[col] = next[col] === s ? "" : s;
    const v = next.join("");
    // Boşluqsuz və düzgün format (-12,5) olmalıdır.
    if (next.slice(0, v.length).some((c) => !c) || !CODED_RE.test(v)) {
      setError(true);
      return;
    }
    setError(false);
    onChange(v);
  };
  return (
    <div className="rounded-[6px] border-[1.5px] border-[#d9cfc0] bg-white p-2.5">
      <div className="mb-2 flex items-center justify-between">
        <button
          type="button"
          onClick={onGo}
          aria-label={t.question(n, total)}
          className="min-h-8 cursor-pointer font-mono text-[15px] font-bold text-[#1e2a4a] hover:underline"
        >
          {n}
        </button>
        {value && (
          <button
            type="button"
            onClick={() => {
              setError(false);
              onChange("");
            }}
            className="min-h-8 cursor-pointer px-1 text-[12px] font-bold text-[#c8102e] hover:underline"
          >
            {card.clear}
          </button>
        )}
      </div>
      <div className="mx-auto grid w-fit grid-cols-[repeat(6,30px)] gap-1">
        {cells.map((c, i) => (
          <span
            key={i}
            aria-hidden="true"
            className={cn("grid h-[34px] place-items-center rounded-[3px] border-[1.6px] bg-[#fffef6] font-mono text-[17px] font-bold text-[#1e2a4a]", INK)}
          >
            {c}
          </span>
        ))}
        {CODED_SYMBOLS.map((s) =>
          cells.map((c, col) => {
            const on = c === s;
            return (
              <button
                key={`${s}-${col}`}
                type="button"
                aria-pressed={on}
                aria-label={card.codedCell(n, col + 1, s, on)}
                onClick={() => set(col, s)}
                className={cn(
                  "mx-auto grid size-6 cursor-pointer place-items-center rounded-full border-[1.2px] text-[10.5px] font-bold transition-colors",
                  on ? "border-[#111827] bg-[#111827] text-white" : "border-[#8a8fa3] text-[#5b6178] hover:bg-[#fdecee]",
                )}
              >
                {s}
              </button>
            );
          }),
        )}
      </div>
      {error && (
        <p role="alert" className="m-0 mt-2 text-[12px] font-semibold text-danger-700">
          {card.codedError}
        </p>
      )}
    </div>
  );
}

/** Yazılı: dəftər xətli sahə — sual ekranındakı ilə eyni yerdə (bu cihazda) saxlanılır. */
function WrittenRow({
  examId,
  n,
  total,
  answered,
  onChange,
  onGo,
}: {
  examId: string;
  n: number;
  total: number;
  answered: boolean;
  onChange: (has: boolean) => void;
  onGo: () => void;
}) {
  const key = writtenKey(examId, n);
  const stored = useSyncExternalStore(subscribeStorage, () => readStorage(key), () => null);
  const [draft, setDraft] = useState<string | null>(null);
  const value = draft ?? stored ?? "";
  return (
    <div className="flex items-start gap-3 rounded-[6px] border-[1.5px] border-[#d9cfc0] bg-white px-3 py-2.5 focus-within:border-[#1d4ed8] focus-within:outline-2 focus-within:outline-[#1d4ed8]">
      <button
        type="button"
        onClick={onGo}
        aria-label={t.question(n, total)}
        className="min-h-8 w-8 flex-none cursor-pointer text-left font-mono text-[15px] font-bold text-[#1e2a4a] hover:underline"
      >
        {n}
      </button>
      <textarea
        aria-label={card.writtenAria(n)}
        placeholder={card.writtenPlaceholder}
        maxLength={WRITTEN_MAX}
        value={value}
        onChange={(e) => {
          const v = e.target.value;
          setDraft(v);
          try {
            localStorage.setItem(key, v);
          } catch {}
          onChange(v.trim().length > 0);
        }}
        className="min-h-[52px] flex-1 resize-y border-none bg-[repeating-linear-gradient(transparent_0_25px,#e7dfd2_25px_26px)] text-[14.5px] leading-[26px] text-[#1e2a4a] outline-none placeholder:text-ink-placeholder"
      />
      <span
        className={cn(
          "rounded-pill px-2 py-1 text-[11px] font-bold whitespace-nowrap",
          answered ? "bg-success-100 text-success-700" : "bg-[#f1f3f8] text-ink-muted",
        )}
      >
        {answered ? t.written : t.empty}
      </span>
    </div>
  );
}

function AnswerSheet({
  exam,
  studentName,
  today,
  questions,
  answers,
  flags,
  onFlag,
  onPick,
  onGo,
  onFinish,
}: {
  exam: ExamMeta;
  studentName: string;
  today: string;
  questions: ExamQuestion[];
  answers: Record<string, string>;
  flags: Set<number>;
  onFlag: (n: number) => void;
  onPick: (n: number, value: string, delay?: number) => void;
  onGo: (idx: number) => void;
  onFinish: () => void;
}) {
  const total = questions[questions.length - 1]?.n ?? questions.length;
  const groups = useMemo(
    () => (["closed", "coded", "written"] as const).map((f) => ({ f, qs: questions.filter((q) => q.format === f) })),
    [questions],
  );
  const done = Object.keys(answers).length;
  const notes = { closed: card.closedNote, coded: card.codedNote, written: card.writtenNote };
  const goTo = (q: ExamQuestion) => () => onGo(questions.indexOf(q));

  return (
    <>
      <section aria-labelledby="sheet-title" className={cn("relative rounded-[6px] px-6 pt-6 pb-7 sm:px-10", SHEET_BG)}>
        <span aria-hidden="true" className={cn(OMR, "left-2.5 sm:left-3")} />
        <span aria-hidden="true" className={cn(OMR, "right-2.5 sm:right-3")} />

        <header className="flex flex-wrap items-center justify-between gap-4 border-b-[3px] border-double border-[#c8102e] pb-3.5">
          <div className="flex items-center gap-3">
            <span
              aria-hidden="true"
              className="grid size-[52px] flex-none place-items-center rounded-full border-[3px] border-[#c8102e] text-[13px] font-extrabold tracking-[0.04em] text-[#c8102e]"
            >
              2×2
            </span>
            <div>
              <h2 id="sheet-title" className="m-0 text-[20px] font-extrabold tracking-[0.06em] text-[#1e2a4a] uppercase">
                {card.title}
              </h2>
              <small className="text-[12.5px] font-semibold text-ink-muted">
                {exam.group} · {card.subject}
              </small>
            </div>
          </div>
          <div className="text-right">
            <span className={cn("inline-block border-2 px-3.5 py-1 font-mono text-[18px] font-bold text-[#1e2a4a]", INK)}>{exam.id}</span>
            <small className="mt-1 block text-[11px] tracking-[0.1em] text-ink-muted uppercase">{card.examNo}</small>
          </div>
        </header>

        <dl className="m-0 mt-4 grid grid-cols-2 gap-2.5 sm:grid-cols-[2fr_1fr_1fr]">
          {[
            [card.student, studentName],
            [card.exam, exam.title],
            [card.date, today],
          ].map(([label, value], i) => (
            <div key={label} className={cn("rounded-[4px] border-[1.5px] border-[#d9cfc0] bg-white px-2.5 py-1.5", i === 0 && "col-span-2 sm:col-span-1")}>
              <dt className="text-[10.5px] font-bold tracking-[0.1em] text-ink-muted uppercase">{label}</dt>
              <dd className="m-0 truncate text-[14px] font-bold text-[#1e2a4a]">{value}</dd>
            </div>
          ))}
        </dl>

        <div className="mt-3 flex flex-wrap items-center justify-between gap-x-4 gap-y-2 text-[12.5px] text-ink-muted">
          <p id="sheet-hint" className="m-0 flex flex-wrap items-center gap-2">
            <span aria-hidden="true" className="inline-block size-4 rounded-full bg-[#111827]" /> {card.filled} ·
            <span aria-hidden="true" className={cn("inline-block size-4 rounded-full border-[1.5px]", INK)} /> {card.blank} · {t.sheetHint}
          </p>
          <span className="font-bold text-[#1e2a4a] tabular">{t.answered(done, questions.length)}</span>
        </div>

        {groups.map(({ f, qs }) => (
          <section key={f} aria-label={t.sections[f]} className="mt-6">
            <SectionTitle title={t.sections[f]} note={`${qs[0].n}–${qs[qs.length - 1].n} · ${notes[f]}`} />
            {f === "closed" && (
              <div className="grid gap-x-8 gap-y-1 md:grid-cols-2">
                {qs.map((q) => (
                  <SheetRow
                    key={q.n}
                    n={q.n}
                    total={total}
                    value={answers[q.n]}
                    flagged={flags.has(q.n)}
                    onPick={(l) => onPick(q.n, l)}
                    onClear={() => onPick(q.n, "")}
                    onFlag={() => onFlag(q.n)}
                    onGo={goTo(q)}
                  />
                ))}
              </div>
            )}
            {f === "coded" && (
              <div className="grid grid-cols-[repeat(auto-fill,minmax(232px,1fr))] gap-4">
                {qs.map((q) => (
                  <CodedBlock key={q.n} n={q.n} total={total} value={answers[q.n] ?? ""} onChange={(v) => onPick(q.n, v)} onGo={goTo(q)} />
                ))}
              </div>
            )}
            {f === "written" && (
              <div className="grid gap-2.5">
                {qs.map((q) => (
                  <WrittenRow
                    key={q.n}
                    examId={exam.id}
                    n={q.n}
                    total={total}
                    answered={Boolean(answers[q.n])}
                    onChange={(has) => onPick(q.n, has ? "w" : "", 500)}
                    onGo={goTo(q)}
                  />
                ))}
              </div>
            )}
          </section>
        ))}

        <p className="m-0 mt-6 border-t border-dashed border-[#d9cfc0] pt-3 text-center text-[12px] text-ink-muted">{card.owner}</p>
      </section>

      <div className="sticky bottom-0 z-[5] -mx-4 bg-[rgba(238,241,247,.85)] px-4 py-3 backdrop-blur-md lg:mx-0 lg:rounded-[16px]">
        <button
          type="button"
          onClick={onFinish}
          className="w-full cursor-pointer rounded-[14px] bg-[linear-gradient(135deg,#c8102e,#dc2626)] p-[15px] text-center text-[16px] font-extrabold text-white shadow-[0_12px_26px_-10px_rgba(200,16,46,.6)] transition-transform hover:-translate-y-0.5 focus-visible:outline-3 focus-visible:outline-offset-2 focus-visible:outline-navy-500"
        >
          {t.finish}
        </button>
      </div>
    </>
  );
}
