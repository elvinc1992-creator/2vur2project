import {
  AngleIcon,
  BulbIcon,
  ChartIcon,
  CircleIcon,
  CubeIcon,
  FunctionIcon,
  GridIcon,
  ListIcon,
  PencilIcon,
  PercentIcon,
  RootIcon,
  SigmaIcon,
  TriangleIcon,
} from "@/components/icons";

// Mövzu adı → dizayn sisteminin ikonu (açar sözlərlə).
const RULES: Array<[RegExp, typeof CubeIcon]> = [
  [/stereometriya|fəza/i, CubeIcon],
  [/limit|törəmə|inteqral|funksiya/i, FunctionIcon],
  [/loqarifm|kök|həqiqi/i, RootIcon],
  [/triqonometriya|həndəsənin/i, AngleIcon],
  [/üçbucaq|çoxbucaqlı/i, TriangleIcon],
  [/çevrə|dairə|kompleks|çoxluq/i, CircleIcon],
  [/faiz|kəsr/i, PercentIcon],
  [/ardıcıllıq|silsilə|natural/i, ListIcon],
  [/koordinat|vektor/i, ChartIcon],
  [/kombinatorika|ehtimal/i, GridIcon],
  [/situasiya/i, BulbIcon],
  [/isbat/i, PencilIcon],
];

export function TopicIcon({ name, className }: { name: string; className?: string }) {
  const Icon = RULES.find(([re]) => re.test(name))?.[1] ?? SigmaIcon;
  return <Icon className={className} />;
}
