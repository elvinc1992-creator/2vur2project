import { auth } from "@/auth";
import { AppFrame, PublicFrame } from "@/components/app/app-frame";
import { getDemoState } from "@/lib/demo/state";

// Statistika ictimaidir: daxil olan istifadəçi tətbiq çərçivəsində, qonaq sadə çərçivədə görür.
export default async function StatsLayout({ children }: { children: React.ReactNode }) {
  const session = await auth();
  if (!session?.user?.id) return <PublicFrame>{children}</PublicFrame>;
  const state = await getDemoState(session.user.id);
  return <AppFrame state={state}>{children}</AppFrame>;
}
