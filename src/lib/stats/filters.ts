// Statistika süzgəcləri URL query-də saxlanılır: ?nov=buraxilis&qrup=II&il=2023,2025

export type Kind = "all" | "buraxilis" | "qebul";
export type StatFilters = { kind: Kind; group: string | null; years: number[] };
export type FilterOptions = { years: number[]; groups: string[] };

export const DEFAULT_FILTERS: StatFilters = { kind: "all", group: null, years: [] };

const first = (v: string | string[] | undefined) => (Array.isArray(v) ? v[0] : v);

export function parseFilters(sp: Record<string, string | string[] | undefined>, options: FilterOptions): StatFilters {
  const nov = first(sp.nov);
  const kind: Kind = nov === "buraxilis" || nov === "qebul" ? nov : "all";
  const qrup = first(sp.qrup);
  const group = kind === "qebul" && qrup && options.groups.includes(qrup) ? qrup : null;
  const raw = [sp.il].flat().filter(Boolean).join(",");
  const years = [...new Set(raw.split(",").map(Number))]
    .filter((y) => options.years.includes(y))
    .sort((a, b) => a - b);
  return { kind, group, years };
}

export function toQuery(f: StatFilters): string {
  const p = new URLSearchParams();
  if (f.kind !== "all") p.set("nov", f.kind);
  if (f.kind === "qebul" && f.group) p.set("qrup", f.group);
  if (f.years.length) p.set("il", f.years.join(","));
  const s = p.toString();
  return s ? `?${s}` : "";
}

export const isDefault = (f: StatFilters) => f.kind === "all" && !f.group && f.years.length === 0;
