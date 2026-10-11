import { auth } from "@/auth";
import { AppFrame, PublicFrame } from "@/components/app/app-frame";
import { roleOf } from "@/lib/admin/guard";
import { ensureActive } from "@/lib/auth/account";
import { getDemoState } from "@/lib/demo/state";

// İctimai bölmələr (Statistika, Onlayn repetitorun ilk dərsi): daxil olan istifadəçi tətbiq çərçivəsində,
// qonaq sadə çərçivədə görür.
export default async function PublicLayout({ children }: { children: React.ReactNode }) {
  const session = await auth();
  if (!session?.user?.id) return <PublicFrame>{children}</PublicFrame>;
  await ensureActive(session.user.id);
  const [state, role] = await Promise.all([getDemoState(session.user.id), roleOf(session.user.id)]);
  return (
    <AppFrame state={state} admin={role === "admin"} teacher={role === "teacher"}>
      {children}
    </AppFrame>
  );
}
