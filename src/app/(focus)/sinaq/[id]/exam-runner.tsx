"use client";

import { useRouter } from "next/navigation";
import { useEffect, useMemo, useRef, useState, useSyncExternalStore, useTransition, type KeyboardEvent } from "react";
import { ArrowIcon, BackIcon, CheckIcon, ClockIcon, CloseIcon, FlagIcon, GridIcon, ListIcon } from "@/components/icons";
import { Alert } from "@/components/ui/alert";
import { AnswerOptions } from "@/components/ui/answer-options";
import { Button, ButtonLink } from "@/components/ui/button";
import { Card, Tag, eyebrowClass, h3Class } from "@/components/ui/display";
import { Dialog } from "@/components/ui/dialog";
import { EmptyState } from "@/components/ui/empty-art";
import { answerHeadClass, QuestionCard } from "@/components/ui/question";
import { az } from "@/content/az";
import { finishExamAction } from "@/lib/demo/actions";
import { examApi } from "@/lib/demo/exam-api";
import type { TickResult } from "@/lib/demo/exam-session";
import { HEARTBEAT_MS } from "@/lib/demo/timer";
import { CODE_LEN, LETTERS, type ExamMeta, type ExamQuestion, type Letter } from "@/lib/demo/content";
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

export function ExamRunner({ exam, questions, initialAnswers, initialFlags, remaining }: Props) {
  const router = useRouter();
  const total = questions.length;
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
          .save(exam.id, n, value)
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
          <b className="text-navy-900 tabular">{t.question(q.n, total)}</b>
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
                total={total}
                q={q}
                value={answers[q.n] ?? ""}
                flagged={flags.has(q.n)}
                onAnswer={save}
                onFlag={() => toggleFlag(q.n)}
              />
            ) : (
              <AnswerSheet
                questions={questions}
                answers={answers}
                onPick={(n, v) => save(n, v)}
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
        image={Boolean(q.image)}
        imageLabel={t.imagePlaceholder}
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

/** Cavab vərəqi sətri: DİM blankına bənzər dairələr, roving tabindex + ox düymələri. */
function SheetRow({
  n,
  value,
  onPick,
  onClear,
}: {
  n: number;
  value: string | undefined;
  onPick: (l: Letter) => void;
  onClear: () => void;
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
    <div role="radiogroup" aria-label={t.sheetRow(n)} className="flex flex-wrap gap-1.5">
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
              "grid size-11 cursor-pointer place-items-center rounded-full border-[1.5px] text-small font-bold",
              on ? "border-navy-900 bg-navy-900 text-white" : "border-control-border bg-white text-navy-900",
            )}
          >
            {l}
          </button>
        );
      })}
    </div>
  );
}

function AnswerSheet({
  questions,
  answers,
  onPick,
  onGo,
  onFinish,
}: {
  questions: ExamQuestion[];
  answers: Record<string, string>;
  onPick: (n: number, value: string) => void;
  onGo: (idx: number) => void;
  onFinish: () => void;
}) {
  const groups = useMemo(
    () => (["closed", "coded", "written"] as const).map((f) => ({ f, qs: questions.filter((q) => q.format === f) })),
    [questions],
  );
  const done = Object.keys(answers).length;
  return (
    <>
      <Card as="section" aria-labelledby="sheet-title" className="grid gap-4">
        <div className="flex flex-wrap items-center justify-between gap-3">
          <h2 id="sheet-title" className={h3Class}>
            {t.sheet}
          </h2>
          <span className="text-small text-ink-muted tabular">{t.answered(done, questions.length)}</span>
        </div>
        <p id="sheet-hint" className="text-small text-ink-muted">
          {t.sheetHint}
        </p>
        {groups.map(({ f, qs }) => (
          <div key={f} className="grid gap-2">
            <h3 className={eyebrowClass}>
              {t.sections[f]} · {qs[0].n}–{qs[qs.length - 1].n}
            </h3>
            {qs.map((q) =>
              f === "closed" ? (
                <div key={q.n} className="grid grid-cols-[40px_1fr] items-center gap-2">
                  <button
                    type="button"
                    onClick={() => onGo(questions.indexOf(q))}
                    className="min-h-11 cursor-pointer text-left text-[15px] font-bold text-navy-900 underline-offset-3 hover:underline tabular"
                    aria-label={t.question(q.n, questions.length)}
                  >
                    {q.n}
                  </button>
                  <SheetRow
                    n={q.n}
                    value={answers[q.n]}
                    onPick={(l) => onPick(q.n, l)}
                    onClear={() => onPick(q.n, "")}
                  />
                </div>
              ) : (
                <button
                  key={q.n}
                  type="button"
                  onClick={() => onGo(questions.indexOf(q))}
                  className="grid min-h-11 cursor-pointer grid-cols-[40px_1fr] items-center gap-2 rounded-[10px] text-left hover:bg-navy-050"
                  aria-label={`${t.question(q.n, questions.length)}: ${
                    f === "coded" ? answers[q.n] || t.empty : answers[q.n] ? t.written : t.empty
                  }`}
                >
                  <span className="text-[15px] font-bold text-navy-900 tabular">{q.n}</span>
                  {f === "coded" ? (
                    <span aria-hidden="true" className="flex gap-1.5">
                      {Array.from({ length: CODE_LEN }, (_, i) => (
                        <span
                          key={i}
                          className="grid h-10 w-8 place-items-center rounded-[8px] border-[1.5px] border-control-border bg-white font-display font-extrabold text-navy-900"
                        >
                          {answers[q.n]?.[i] ?? ""}
                        </span>
                      ))}
                    </span>
                  ) : (
                    <span aria-hidden="true" className="justify-self-start">
                      {answers[q.n] ? <Tag tone="success">{t.written}</Tag> : <Tag tone="lock">{t.empty}</Tag>}
                    </span>
                  )}
                </button>
              ),
            )}
          </div>
        ))}
      </Card>
      <Button type="button" variant="primary" block onClick={onFinish}>
        {t.finish}
      </Button>
    </>
  );
}
