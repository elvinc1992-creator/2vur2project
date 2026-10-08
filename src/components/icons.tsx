import type React from "react";
import type { SVGProps } from "react";

// Dizayn sisteminin ikonları: 24×24, stroke 1.75, yumru uclar, currentColor.
type IconProps = SVGProps<SVGSVGElement>;

function Base({ children, ...props }: IconProps) {
  return (
    <svg
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth={1.75}
      strokeLinecap="round"
      strokeLinejoin="round"
      aria-hidden="true"
      focusable="false"
      {...props}
    >
      {children}
    </svg>
  );
}

export const EyeIcon = (p: IconProps) => (
  <Base {...p}>
    <path d="M2.5 12S6 5.5 12 5.5 21.5 12 21.5 12 18 18.5 12 18.5 2.5 12 2.5 12Z" />
    <circle cx="12" cy="12" r="3" />
  </Base>
);

export const EyeOffIcon = (p: IconProps) => (
  <Base {...p}>
    <path d="M4 4l16 16" />
    <path d="M10.6 6A9.6 9.6 0 0 1 12 5.5c6 0 9.5 6.5 9.5 6.5a16 16 0 0 1-2.6 3.4M6.6 7.4A15.6 15.6 0 0 0 2.5 12S6 18.5 12 18.5a9 9 0 0 0 4.2-1" />
    <path d="M9.9 10a3 3 0 0 0 4.1 4.1" />
  </Base>
);

export const AlertIcon = (p: IconProps) => (
  <Base {...p}>
    <path d="M12 4 21 19.5H3L12 4Z" />
    <path d="M12 10v4.2" />
    <circle cx="12" cy="17" r=".8" fill="currentColor" />
  </Base>
);

export const InfoIcon = (p: IconProps) => (
  <Base {...p}>
    <circle cx="12" cy="12" r="8.5" />
    <path d="M12 11v5.5" />
    <circle cx="12" cy="8" r=".8" fill="currentColor" />
  </Base>
);

export const CheckCircleIcon = (p: IconProps) => (
  <Base {...p}>
    <circle cx="12" cy="12" r="8.5" />
    <path d="m8 12.3 2.8 2.8L16.2 9.6" />
  </Base>
);

export const CheckIcon = (p: IconProps) => (
  <Base {...p}>
    <path d="m5 12.5 4.5 4.5L19 7.5" />
  </Base>
);

export const MailIcon = (p: IconProps) => (
  <Base {...p}>
    <rect x="3.5" y="5.5" width="17" height="13" rx="3" />
    <path d="m4.5 7.5 7.5 5.5 7.5-5.5" />
  </Base>
);

export const ClockIcon = (p: IconProps) => (
  <Base {...p}>
    <circle cx="12" cy="12" r="8.5" />
    <path d="M12 7.5V12l3 2" />
  </Base>
);

const icon = (paths: React.ReactNode) =>
  function Icon(p: IconProps) {
    return <Base {...p}>{paths}</Base>;
  };

export const HomeIcon = icon(<path d="M4 10.5 12 4l8 6.5V19a1.5 1.5 0 0 1-1.5 1.5H15V15h-6v5.5H5.5A1.5 1.5 0 0 1 4 19v-8.5Z" />);
export const TargetIcon = icon(
  <>
    <circle cx="12" cy="12" r="8.5" />
    <circle cx="12" cy="12" r="4.5" />
    <circle cx="12" cy="12" r="1" fill="currentColor" />
  </>,
);
export const BagIcon = icon(
  <>
    <path d="M5 8h14l-1 12H6L5 8Z" />
    <path d="M9 8V6.5a3 3 0 0 1 6 0V8" />
  </>,
);
export const UserIcon = icon(
  <>
    <circle cx="12" cy="8.5" r="3.8" />
    <path d="M4.5 20c.8-3.6 3.8-5.5 7.5-5.5s6.7 1.9 7.5 5.5" />
  </>,
);
export const ChartIcon = icon(
  <>
    <path d="M4 20h16" />
    <rect x="5.5" y="11" width="3" height="6" rx="1" />
    <rect x="10.5" y="6" width="3" height="11" rx="1" />
    <rect x="15.5" y="13" width="3" height="4" rx="1" />
  </>,
);
export const BackIcon = icon(<path d="M19 12H5M11 6l-6 6 6 6" />);
export const CloseIcon = icon(<path d="M6.5 6.5l11 11M17.5 6.5l-11 11" />);
export const PercentIcon = icon(
  <>
    <path d="M18.5 5.5l-13 13" />
    <circle cx="7" cy="7" r="2.5" />
    <circle cx="17" cy="17" r="2.5" />
  </>,
);
export const BulbIcon = icon(
  <>
    <path d="M9 17.5h6M10 20.5h4" />
    <path d="M12 3.5a6 6 0 0 0-3.5 10.9c.6.5 1 1.2 1 2V17h5v-.6c0-.8.4-1.5 1-2A6 6 0 0 0 12 3.5Z" />
  </>,
);
export const BookIcon = icon(
  <>
    <path d="M4 5.5A1.5 1.5 0 0 1 5.5 4H11v15H5.5A1.5 1.5 0 0 0 4 20.5v-15Z" />
    <path d="M20 5.5A1.5 1.5 0 0 0 18.5 4H13v15h5.5a1.5 1.5 0 0 1 1.5 1.5v-15Z" />
  </>,
);
export const ChevronIcon = icon(<path d="m9.5 6 6 6-6 6" />);
export const ArrowIcon = icon(<path d="M5 12h14M13 6l6 6-6 6" />);
export const XCircleIcon = icon(
  <>
    <circle cx="12" cy="12" r="8.5" />
    <path d="m9.2 9.2 5.6 5.6m0-5.6-5.6 5.6" />
  </>,
);
export const FlameIcon = icon(
  <>
    <path d="M12 21c-3.6 0-6.5-2.6-6.5-6.2 0-3.4 2.6-5.2 3.7-8.3.3 1.8 1.3 2.9 2.3 3.4.3-2.8 1.8-5.1 3.9-6.4-.4 3 3.1 5.4 3.1 10.3C18.5 18.6 15.6 21 12 21Z" />
    <path d="M12 21c-1.6 0-2.8-1.1-2.8-2.7 0-1.8 1.6-2.5 2.2-4 .9 1 3.4 2 3.4 4 0 1.6-1.2 2.7-2.8 2.7Z" />
  </>,
);
export const ListIcon = icon(
  <>
    <path d="M9 6.5h11M9 12h11M9 17.5h11" />
    <circle cx="4.8" cy="6.5" r=".9" fill="currentColor" />
    <circle cx="4.8" cy="12" r=".9" fill="currentColor" />
    <circle cx="4.8" cy="17.5" r=".9" fill="currentColor" />
  </>,
);
export const FlagIcon = icon(
  <>
    <path d="M6 21V4.5" />
    <path d="M6 4.5h11l-2 4 2 4H6" />
  </>,
);
export const GridIcon = icon(
  <>
    <rect x="4" y="4" width="7" height="7" rx="2" />
    <rect x="13" y="4" width="7" height="7" rx="2" />
    <rect x="4" y="13" width="7" height="7" rx="2" />
    <rect x="13" y="13" width="7" height="7" rx="2" />
  </>,
);
export const LockIcon = icon(
  <>
    <rect x="5" y="10.5" width="14" height="10" rx="3" />
    <path d="M8.5 10.5V8a3.5 3.5 0 0 1 7 0v2.5" />
    <path d="M12 14.5v2" />
  </>,
);
export const ShieldIcon = icon(
  <>
    <path d="M12 3.5 19 6v5.5c0 4.3-2.9 7.6-7 9-4.1-1.4-7-4.7-7-9V6l7-2.5Z" />
    <path d="m9 12 2.2 2.2L15.3 10" />
  </>,
);
export const ReceiptIcon = icon(
  <>
    <path d="M6 3.5h12v17l-2-1.3-2 1.3-2-1.3-2 1.3-2-1.3-2 1.3v-17Z" />
    <path d="M9 8.5h6M9 12h6M9 15.5h3.5" />
  </>,
);
export const DownloadIcon = icon(
  <>
    <path d="M12 4v11M7.5 10.5 12 15l4.5-4.5" />
    <path d="M5 19.5h14" />
  </>,
);
export const RetryIcon = icon(
  <>
    <path d="M19.5 12a7.5 7.5 0 1 1-2.2-5.3" />
    <path d="M19.5 4.5v4h-4" />
  </>,
);
export const SparkleIcon = icon(
  <path d="M12 3.5c.6 4 2.5 6 6.5 6.5-4 .6-5.9 2.5-6.5 6.5-.6-4-2.5-5.9-6.5-6.5 4-.5 5.9-2.5 6.5-6.5Z" />,
);
export const PlusIcon = icon(<path d="M12 5v14M5 12h14" />);
export const LogoutIcon = icon(
  <>
    <path d="M14 4.5H6.5a1.5 1.5 0 0 0-1.5 1.5v12a1.5 1.5 0 0 0 1.5 1.5H14" />
    <path d="M10 12h10M16.5 8.5 20 12l-3.5 3.5" />
  </>,
);
export const PencilIcon = icon(
  <>
    <path d="M15.5 4.5l4 4L9 19H5v-4L15.5 4.5Z" />
    <path d="m13.5 6.5 4 4" />
  </>,
);
export const CardIcon = icon(
  <>
    <rect x="3" y="5.5" width="18" height="13" rx="3" />
    <path d="M3 10h18M7 15h3" />
  </>,
);
/** Bal simulyatoru (kalkulyator). */
export const CalcIcon = icon(
  <>
    <rect x="5" y="3.5" width="14" height="17" rx="2.5" />
    <path d="M8.5 7.5h7" />
    <path d="M8.5 12h.01M12 12h.01M15.5 12h.01M8.5 16h.01M12 16h.01M15.5 16h.01" strokeWidth={2.4} />
  </>,
);
export const MinusIcon = icon(<path d="M5 12h14" />);
/** Onlayn repetitor (məzun papağı). */
export const CapIcon = icon(
  <>
    <path d="M2.5 9 12 4.5 21.5 9 12 13.5 2.5 9Z" />
    <path d="M6.5 11.2v4.3c0 1.6 2.5 3 5.5 3s5.5-1.4 5.5-3v-4.3" />
    <path d="M21.5 9v5" />
  </>,
);
export const SendIcon = icon(
  <>
    <path d="M21.5 3.5 3 10.6l6.6 2.7 2.7 6.7 9.2-16.5Z" />
    <path d="m9.6 13.3 5.2-4.4" />
  </>,
);
export const MenuIcon = icon(<path d="M4 7h16M4 12h16M4 17h16" />);
export const CameraIcon = icon(
  <>
    <rect x="3.5" y="3.5" width="17" height="17" rx="5" />
    <circle cx="12" cy="12" r="4" />
    <circle cx="17" cy="7" r=".6" fill="currentColor" />
  </>,
);
// Mövzu ikonları (Landing2 → TopicCard)
export const FunctionIcon = icon(
  <>
    <path d="M15.5 4.5c-2.5-.5-3.6.8-4 3l-2 9.5c-.5 2.2-1.6 3.4-4 3" />
    <path d="M7.5 10.5h8" />
  </>,
);
export const RootIcon = icon(<path d="M3.5 13h3l3 6.5 4-15h7" />);
export const SigmaIcon = icon(<path d="M17.5 5.5h-11l6 6.5-6 6.5h11" />);
export const AngleIcon = icon(
  <>
    <path d="M4 19.5h16M4 19.5 15 6" />
    <path d="M10 19.5a6.2 6.2 0 0 0-2-4.7" />
  </>,
);
export const TriangleIcon = icon(<path d="M12 4.5 20.5 19h-17L12 4.5Z" />);
export const CircleIcon = icon(
  <>
    <circle cx="12" cy="12" r="8.5" />
    <path d="M12 12h8.5" />
    <circle cx="12" cy="12" r=".9" fill="currentColor" />
  </>,
);
export const CubeIcon = icon(
  <>
    <path d="M12 3.5 19.5 7.7v8.6L12 20.5l-7.5-4.2V7.7L12 3.5Z" />
    <path d="M4.5 7.7 12 12l7.5-4.3M12 12v8.5" />
  </>,
);

/** Auth panelindəki həndəsi dekor (bucaq α). */
export const AngleDeco = (p: IconProps) => (
  <svg
    width="150"
    height="130"
    viewBox="0 0 150 130"
    fill="none"
    stroke="currentColor"
    strokeWidth={1.6}
    strokeLinecap="round"
    aria-hidden="true"
    {...p}
  >
    <path d="M10 120h130M10 120 112 22" />
    <path d="M48 120a38 38 0 0 0-11-27" />
    <text x="54" y="110" fill="currentColor" stroke="none" fontFamily="Georgia,serif" fontStyle="italic" fontSize="18">
      α
    </text>
    <circle cx="112" cy="22" r="3" fill="currentColor" />
  </svg>
);
