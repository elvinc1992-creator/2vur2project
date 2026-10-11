// Yarışın təmiz qaydaları: turun vaxt pəncərələri, sualların server vaxtı ilə irəliləməsi, sıralama, reytinqlər.

export type ContestTimes = { startAt: number; entryWindowMin: number; durationMin: number };

const MIN = 60_000;

/** Server vaxtı (ms) — səhifələr hər sorğuda yenidən render olunur. */
export const serverNow = () => Date.now();

/** Yeni giriş üçün son an. */
export const entryDeadline = (c: ContestTimes) => c.startAt + c.entryWindowMin * MIN;
/** Tur hamı üçün bitir: son giriş + turun müddəti. Sonra nəticələr və həllər açılır. */
export const tourEnd = (c: ContestTimes) => entryDeadline(c) + c.durationMin * MIN;

export type TourPhase = "before" | "open" | "late" | "ended";
/** before — hələ başlamayıb; open — giriş açıqdır; late — yeni giriş bağlıdır (başlayanlar davam edir); ended — hamı üçün bitib. */
export function tourPhase(c: ContestTimes, now: number): TourPhase {
  if (now < c.startAt) return "before";
  if (now <= entryDeadline(c)) return "open";
  if (now < tourEnd(c)) return "late";
  return "ended";
}

export type AttemptState = { currentN: number; currentStartedAt: number; finishedAt: number | null };

/**
 * Server vaxtı ilə irəliləmə: cari sualın vaxtı bitibsə, cavabsız sayılır və növbəti sual onun bitdiyi andan başlayır
 * (itən vaxt geri qaytarılmır). Qaytarır: yeni vəziyyət və vaxtı bitmiş (cavabsız) sualların nömrələri.
 */
export function advance(
  a: AttemptState,
  timeSec: (n: number) => number,
  count: number,
  now: number,
): { state: AttemptState; timedOut: Array<{ n: number; at: number; timeMs: number }> } {
  const state = { ...a };
  const timedOut: Array<{ n: number; at: number; timeMs: number }> = [];
  while (!state.finishedAt) {
    const deadline = state.currentStartedAt + timeSec(state.currentN) * 1000;
    if (now < deadline) break;
    timedOut.push({ n: state.currentN, at: deadline, timeMs: deadline - state.currentStartedAt });
    if (state.currentN >= count) {
      state.finishedAt = deadline;
    } else {
      state.currentN += 1;
      state.currentStartedAt = deadline;
    }
  }
  return { state, timedOut };
}

export type ScoreRow = { id: string; score: number; totalMs: number; disqualified?: boolean };

/**
 * Sıralama: əsas meyar — düzgün cavabların sayı; bərabər balda daha az vaxt irəlidə; vaxt da eynidirsə,
 * yer bölüşdürülür (1, 1, 3). Diskvalifikasiya olunanlar sıralanmır (yer — null).
 */
export function rank<T extends ScoreRow>(rows: T[]): Array<T & { place: number | null }> {
  const ok = rows.filter((r) => !r.disqualified).sort((a, b) => b.score - a.score || a.totalMs - b.totalMs);
  const out: Array<T & { place: number | null }> = [];
  ok.forEach((r, i) => {
    const prev = out[i - 1];
    const place = prev && prev.score === r.score && prev.totalMs === r.totalMs ? prev.place : i + 1;
    out.push({ ...r, place });
  });
  return [...out, ...rows.filter((r) => r.disqualified).map((r) => ({ ...r, place: null }))];
}

/** Finala keçənlər: ilk N yer (bölüşdürülən yer N-i keçmirsə, hamısı keçir). */
export const isFinalist = (place: number | null, finalists: number) => place !== null && place <= finalists;

/** Məktəb / rayon reytinqi: iştirakçıların orta balı; ən az `min` iştirakçısı olanlar. */
export function groupRanking(rows: Array<{ key: string; score: number }>, min = 3) {
  const by = new Map<string, number[]>();
  for (const r of rows) if (r.key.trim()) by.set(r.key, [...(by.get(r.key) ?? []), r.score]);
  return [...by]
    .filter(([, s]) => s.length >= min)
    .map(([key, s]) => ({ key, n: s.length, avg: Math.round((s.reduce((x, y) => x + y, 0) / s.length) * 10) / 10 }))
    .sort((a, b) => b.avg - a.avg || b.n - a.n);
}

/** Qısa ad: "Aysel M." */
export const shortName = (first: string, last: string) => `${first.trim()} ${last.trim() ? `${last.trim()[0].toLocaleUpperCase("az")}.` : ""}`.trim();

/** 1-ci yerin mükafatı: qeydiyyat sayı həddə çatanda artırılmış məbləğ. */
export function firstPrize(base: number | null, regs: number, threshold: number | null, boosted: number | null) {
  return threshold && boosted && regs >= threshold ? boosted : base;
}
