import { auth } from "@/auth";
import { AppFrame, PublicFrame } from "@/components/app/app-frame";
import { isAdmin } from "@/lib/admin/guard";
import { getDemoState } from "@/lib/demo/state";

// İctimai bölmələr (Statistika, Onlayn repetitorun ilk dərsi): daxil olan istifadəçi tətbiq çərçivəsində,
// qonaq sadə çərçivədə görür.
export default async function PublicLayout({ children }: { children: React.ReactNode }) {
  const session = await auth();
  if (!session?.user?.id) return <PublicFrame>{children}</PublicFrame>;
  const state = await getDemoState(session.user.id);
  return (
    <AppFrame state={state} admin={await isAdmin(session.user.id)}>
      {children}
    </AppFrame>
  );
}
