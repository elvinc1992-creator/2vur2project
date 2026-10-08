import { AppFrame } from "@/components/app/app-frame";
import { requireDemo } from "@/lib/demo/session";

export default async function AppLayout({ children }: { children: React.ReactNode }) {
  const { state } = await requireDemo("/panel");
  return <AppFrame state={state}>{children}</AppFrame>;
}
