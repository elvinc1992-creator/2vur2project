// Fokus rejimi (sınaq prosesi, ödəniş): yan panel və tab paneli yoxdur.
// Giriş yoxlaması səhifələrin özündə (requireDemo) aparılır.
export default function FocusLayout({ children }: { children: React.ReactNode }) {
  return <div className="min-h-dvh">{children}</div>;
}
